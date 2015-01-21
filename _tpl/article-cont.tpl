          <article class="art-item clearfix">
                <header>
                  <hgroup>
                        <h1>{{ $gimme->article->name }}</h1>
                        {{ if $gimme->article->type_name == "news" }}
                        <p><span class="right">{{ include file="_tpl/article-icons.tpl" }}</span>{{ 'publishedOn'|translate }} <time datetime="{{$gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ"}}">{{ $gimme->article->publish_date|camp_date_format:"%d %M %Y" }}</time> {{ 'by'|translate }} {{ list_article_authors }}{{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }} ({{ $gimme->author->type|lower }}){{ if !$gimme->current_list->at_end }}, {{ /if }}{{ /list_article_authors }}</p>
                         {{ if $gimme->article->has_map }} 
                         {{ list_article_locations }}{{ if $gimme->current_list->at_beginning }}<p>{{ 'locationS'|translate }} {{ /if }}{{ if $gimme->location->enabled }}{{ $gimme->location->name }}{{ if $gimme->current_list->at_end }}</p>{{ else }}, {{ /if }}{{ /if }}{{ /list_article_locations }}
                        {{ /if }}
                        
                        {{ list_article_topics }}{{ if $gimme->current_list->at_beginning }}<p>{{ 'topicS'|translate }} {{ /if }}<a href="{{ url options="template topic.tpl" }}">{{ $gimme->topic->name }}</a>{{ if $gimme->current_list->at_end }}</p>{{ else }}, {{ /if }}{{ /list_article_topics }}                        
                        
                        {{ /if }}
                    </hgroup>
                </header>
                
{{ if $gimme->article->content_accessible }}                
                
                {{ if $gimme->article->type_name == "news" }}
                <!-- if you want to use responsive images use {{ include file="_tpl/img/img_picturefill.tpl" }} -->
                <!--add subhead-->
                {{ if $gimme->article->subtitles_count(full_text) gt 1 }} 
                    {{ list_subtitles field_name="full_text" }}
                        {{ if $gimme->current_list->at_beginning }}
                        {{ if !($gimme->article->full_text->has_previous_subtitles) }}
                        {{ include file="_tpl/img/img_600x400.tpl" }} 
                        {{ /if }}
                        {{ /if }}
                    {{ /list_subtitles }}
                {{ else }} 
                {{ include file="_tpl/img/img_600x400.tpl" }}
                {{ /if }}
                <!--add subhead-->
                {{ /if }}
                {{ count }}
                <div class="clearfix">{{ include file="_tpl/_edit-article.tpl" }}{{ $gimme->article->full_text }}</div>


            </article>

    {{ if $gimme->article->type_name !== "page" }}
            <div id="social-group">
                <div id="twitter">
                    <script src="http://platform.twitter.com/widgets.js" type="text/javascript"></script>
                    <a href="http://twitter.com/share" class="twitter-share-button" data-text="{{ $gimme->article->name }}" data-via="{{ $gimme->publication->name }}">{{ 'tweet'|translate }}</a> 
                </div><!-- /#twitter -->
                <div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=100924830001723&amp;xfbml=1"></script><fb:like href="http://{{ $gimme->publication->site }}{{ uri }}" send="true" width="385" show_faces="true" font=""></fb:like>       
            </div><!-- /#social-group -->
    {{ /if }}            
{{ else }}        
            <p>{{ 'infoOnLockedArticles'|translate }}</p>    
{{ /if }}

<div>
                   {{ if $gimme->article->subtitles_count(full_text) gt 1 }}

            <ul class="pagination">
            <li><a href="{{ uri options="all_subtitles full_text" }}">Read article on one page</a> </li>
            {{ list_subtitles field_name="full_text" }}
{{ if $gimme->current_list->at_beginning }}
{{ if $gimme->article->full_text->has_previous_subtitles }}
    <li class="prev"><a href="{{ url options="previous_subtitle full_text" }}">Previous</a></li>
{{ /if }}
{{ /if }}

<li{{ if ($gimme->article->current_subtitle_no(full_text)+1) == $gimme->current_list->index }} class="selected"{{ /if }}><a href="{{ url }}" title="{{ $gimme->subtitle->name }}">{{ $gimme->current_list->index }}</a></li>

{{ if $gimme->current_list->at_end }}
{{ if $gimme->article->full_text->has_next_subtitles }}
    <li class="next"><a href="{{ url options="next_subtitle full_text" }}">Next</a></li>
{{ /if }}
{{ /if }}

            {{ /list_subtitles }}
            </ul>

{{ /if }}
                </div>
