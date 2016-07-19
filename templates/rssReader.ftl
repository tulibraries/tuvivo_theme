<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for the body of the GadgetDetails page -->

<section id="rssreader">
<h2>Research News</h2>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">

google.load("feeds", "1");

    function initialize() {
      var feed = new google.feeds.Feed("http://news.temple.edu/rss/news/topics/research");
      feed.setResultFormat(google.feeds.Feed.MIXED_FORMAT);
      feed.load(function(result) {
        if (!result.error) {
          var container = document.getElementById("feed");
          var feedDiv = document.createElement("div");
          feedDiv.setAttribute('class', "rssFeed");
          for (var i = 0; i < result.feed.entries.length; i++) {
            var itemDiv = document.createElement("div");
            itemDiv.setAttribute('class', "rssItem");
            var entry = result.feed.entries[i];
            var content = document.createTextNode(entry.title);
          
            var img = document.createElement("img");
            var imageUrl = entry.xmlNode.getElementsByTagName("enclosure")[0].getAttribute("url");
            img.setAttribute('src', imageUrl);
            img.setAttribute('class', "rssImage");
            
            var imageDiv = document.createElement("div");
            imageDiv.setAttribute("class", "rssItemThumbnail");
            imageDiv.appendChild(img);
            
            var d = new Date(entry.publishedDate);
            var pubDate = document.createTextNode(d.toDateString());
            
            var divPubDate= document.createElement("div");
            divPubDate.setAttribute('class', 'pubDate');
            divPubDate.appendChild(pubDate);
            
            var a = document.createElement("a");
            a.title = entry.title;
            a.href = entry.link;
            a.appendChild(content);
            
            var itemContentDiv = document.createElement("div");
            itemContentDiv.setAttribute("class", "rssItemContent");
            itemContentDiv.appendChild(a);
            itemContentDiv.appendChild(divPubDate);
            
            itemDiv.appendChild(imageDiv);
            itemDiv.appendChild(itemContentDiv);
            feedDiv.appendChild(itemDiv);
          }
          container.appendChild(feedDiv);
        }
      });
    }
    google.setOnLoadCallback(initialize);

</script>

<div id="feed"></div>
<div id="moreNews"><a href="http://news.temple.edu/topics/research">More at Temple Now...</a></div>
</section>
