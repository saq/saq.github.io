---
layout: default
---

{% for post in site.posts limit: 10 %}

<div class="row-fluid">
  <div class="span12">
    <h2>{{ post.title }}</h2>
    <h4>{{ post.date | date_to_long_string }}</h4>
    <p>
      <a href="{{ post.url }}">Read Post</a>
    </p>
  </div>
</div>


{% endfor %}
