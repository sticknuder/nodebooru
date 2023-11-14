<ul>
    <li><%- ctx.postCount %> posts</li><span class='sep'>
    </span><li><%= ctx.makeFileSize(ctx.diskUsage) %></li><span class='sep'>
    </span><li>Last built<%- ctx.isDevelopmentMode ? " (DEV MODE)" : "" %> <%= ctx.makeRelativeTime(ctx.buildDate) %></li><span class='sep'>
    </span><% if (ctx.canListSnapshots) { %><li><a href='<%- ctx.formatClientLink('history') %>'>History</a></li><span class='sep'>
    </span><li><a href='https://discord.com/invite/f9ZwGgBHz9'>Official Discord Server</a></li><span class='sep'>
    </span><% } %>
</ul>
