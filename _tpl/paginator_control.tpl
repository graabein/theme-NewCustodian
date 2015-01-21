<ul class="pagination">
    {{if isset($paginator->previous)}}
    <li class="prev"><a href="{{ $view->url(['page' => $paginator->previous]) }}">{{ 'previous'|translate }}</a></li>
    {{else}}
    <li class="prev"><span>{{ 'previous'|translate }}</span></li>
    {{/if}}

    {{foreach $paginator->pagesInRange as $page}}
    {{if $paginator->current eq $page}}
    <li class="selected"><a href="{{ $view->url(['page' => $page]) }}">{{ $page }}</a></li>
    {{else}}
    <li><a href="{{ $view->url(['page' => $page]) }}">{{ $page }}</a></li>
    {{/if}}   
    {{/foreach}}

    {{if isset($paginator->next)}}
    <li class="next"><a href="{{ $view->url(['page' => $paginator->next]) }}">{{ 'next'|translate }}</a></li>
    {{else}}
    <li class="next"><span>{{ 'next'|translate }}</span></li>
    {{/if}}
</ul>
