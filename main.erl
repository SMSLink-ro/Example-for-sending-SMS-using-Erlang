-module(main).
  -export([start/0]).

%
%  Get your SMSLink / SMS Gateway Connection ID and Password from 
%     https://www.smslink.ro/get-api-key/
%

%  HTTPS API Endpoint:  https://secure.smslink.ro/sms/gateway/communicate/index.php
%  HTTP API Endpoint:   http://www.smslink.ro/sms/gateway/communicate/index.php

start() ->
  ssl:start(),
  application:start(inets),
  {ok, {{Version, 200, ReasonPhrase}, Headers, Body}} = httpc:request(post,
    {"https://secure.smslink.ro/sms/gateway/communicate/index.php", [],
    "application/x-www-form-urlencoded",
    "connection_id=MyConnectionID&password=MyConnectionPassword&to=07xyzzzzzz&message=testMessage"
    }, [], []),
  io:format("~s", [Body]).
