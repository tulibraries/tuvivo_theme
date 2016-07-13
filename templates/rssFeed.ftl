<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for the body of the GadgetDetails page -->

<section id="rssreader">
<h2>Research News</h2>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">

google.load("feeds", "1");

function initialize() {
  var feed = new google.feeds.Feed("http://news.temple.edu/rss/news/topics/research");
  feed.load(function(result) {
    if (!result.error) {
      var container = document.getElementById("feed");
      var ul = document.createElement("ul");
      for (var i = 0; i < result.feed.entries.length; i++) {
        var entry = result.feed.entries[i];
        var li = document.createElement("li");
        var d = new Date(entry.publishedDate);
        var div = document.createElement("div");
        var a = document.createElement("a");
        var content = document.createTextNode(entry.title);
        var pubDate = document.createTextNode(d.toDateString());
        div.appendChild(pubDate);
        a.title = entry.title;
        a.href = entry.link;
        a.appendChild(content);
        li.appendChild(a);
        li.appendChild(div);
        ul.appendChild(li);
      }
      container.appendChild(ul);
    }
  });
}
google.setOnLoadCallback(initialize);

</script>

<div id="feed"></div>
<div><a href="http://news.temple.edu/topics/research">More at Temple News</a></div>
</section>
