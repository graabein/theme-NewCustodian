{{extends file="layout.tpl"}}

{{block title}}{{ 'registerYourself'|translate }}{{/block}}

{{block content}}

{{ assign var="userindex" value=1 }}

<h3>{{ 'confirmationSent'|translate }}</h3>

<div class="alert alert-info">
    <p>{{ 'followEmailSteps'|translate }}</p>
    <p>{{ 'thanksForRegistering'|translate }}</p>
</div>

{{/block}}
