'use strict';

const request = require('superagent');
const util = require('./util/misc.js');
const events = require('./events.js');

let _export = null;
let _stylesheet = null;

function _tagsToMap(tags) {
    let map = new Map();
    for (let tag of tags) {
        for (let name of tag.names) {
            map.set(name, tag);
        }
    }
    return map;
}

function _tagCategoriesToMap(categories) {
    let map = new Map();
    for (let category of categories) {
        map.set(category.name, category);
    }
    return map;
}

function _refreshStylesheet() {
    if (_stylesheet) {
        document.head.removeChild(_stylesheet);
    }
    _stylesheet = document.createElement('style');
    document.head.appendChild(_stylesheet);
    for (let category of _export.categories.values()) {
        _stylesheet.sheet.insertRule(
            '.tag-{0} { color: {1} }'.format(category.name, category.color),
            _stylesheet.sheet.cssRules.length);
    }
}

function refreshExport() {
    return new Promise((resolve, reject) => {
        request.get('/data/tags.json').end((error, response) => {
            if (error) {
                _export = {tags: {}, categories: {}};
                reject(error);
            }
            _export = response.body;
            _export.tags = _tagsToMap(_export.tags);
            _export.categories = _tagCategoriesToMap(_export.categories);
            _refreshStylesheet();
            resolve();
        });
    });
}

function getExport() {
    return _export || {};
}

events.listen(
    events.TagsChange,
    () => { refreshExport(); return true; });

module.exports = {
    getExport: getExport,
    refreshExport: refreshExport,
};
