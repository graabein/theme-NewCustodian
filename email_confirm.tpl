{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ 'mailHello'|translate }}

{{ 'mailAutomaticalMessage'|translate }} {{ $gimme->publication->name }} ({{ $gimme->publication->site }})

{{ 'mailPleaseConfirm'|translate }}

http://{{ $publication }}{{ $view->url(['user' => $user, 'token' => $token], 'confirm-email') }}

{{ 'mailOtherwise'|translate }}

{{ 'mailThanks'|translate }}

{{ $view->placeholder('subject')->set(sprintf("E-mail confirmation at %s", $site)) }}
