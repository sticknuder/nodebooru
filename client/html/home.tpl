<div class='content-wrapper transparent' id='home'>
    <div class='messages'></div>
    <header>
        <h1>
            <%- ctx.name %>
        </h1>
    </header>
    <% if (ctx.canListPosts) { %>
        <form class='horizontal'>
            <%= ctx.makeTextInput({name: 'search-text', placeholder: 'enter some tags'}) %>
                <input type='submit' value='Search' />
                <span class=sep>or</span>
                <a href='<%- ctx.formatClientLink(' posts') %>'>browse all posts</a>
        </form>
        <% } %>
            <div class='post-info-container'></div>
            <iframe src="https://counter.nodebooru.com/get/home?theme=nodebooru" height="100" width="315"
                frameborder="0"></iframe>
            <footer class='footer-container'></footer>
</div>