{{extends file="layout.tpl"}}

{{block content}}
{{ assign var="userindex" value=1 }}
<header>
	<h3>{{ 'userAccount'|translate }}</h3>
</header>
<div class="alert alert-info">
    <h5 class="checkHeading">{{ 'weSentEmail'|translate }}</h5>
    <p>{{ 'pleaseCheckInbox'|translate }}</p>
</div>

{{/block}}
