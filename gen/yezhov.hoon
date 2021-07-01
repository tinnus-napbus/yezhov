::  List group members inactive for last @dr
/-  gs=graph-store, ms=metadata-store, gr=group, *resource
=<
:-  %say
|=  $:  [now=@da eny=@uvJ bec=beak]
        [res=resource =@dr ~]
        ~
    ==
:-  %noun
^-  (set ship)
=/  members=(set ship)  (get-members p.bec now res)
=/  chan-list=(list resource)  (get-chan-list p.bec now res)
|-
?~  members
  members
?~  chan-list
  members
%=  $
  chan-list  t.chan-list
  members    (check-chan p.bec now i.chan-list dr members)
==
::
|%
++  get-chan-list
  |=  [our=@p now=@da res=resource]
  ^-  (list resource)
  =/  group-jug
    .^((jug resource md-resource:ms) %gy /(scot %p our)/metadata-store/(scot %da now)/group-indices)
  %+  turn
    %+  skim
      ~(tap in (~(get ju group-jug) res))
    |=(a=md-resource:ms =(app-name.a %graph))
  |=(a=md-resource:ms resource.a)
++  get-members
  |=  [our=@p now=@da res=resource]
  ^-  (set ship)
  =/  ugroup
    .^((unit group:gr) %gx /(scot %p our)/group-store/(scot %da now)/groups/ship/(scot %p entity.res)/[name.res]/noun)
  ?~  ugroup
    ~
  members.u.ugroup
++  check-nodes
  |=  [nodes=(map index:gs node:gs) members=(set ship)]
  ^-  (set ship)
  %-  ~(rep by nodes)
  |:  [a=*(pair index:gs node:gs) b=members]
  ?.  ?=(%.y -.post.q.a)
    b
  ?~  contents.p.post.q.a
    b
  ?.  (~(has in b) author.p.post.q.a)
    b
  (~(del in b) author.p.post.q.a)
++  check-chan
  |=  [our=@p now=@da res=resource =@dr members=(set ship)]
  ^-  (set ship)
  =/  update-log
    .^(update-log:gs %gx /(scot %p our)/graph-store/(scot %da now)/update-log-subset/(scot %p entity.res)/[name.res]/(scot %da (sub now dr))/(scot %da now)/noun)
  %-  ~(rep by update-log)
  |:  [a=*[=time logged-update:gs] b=members]
  ?.  ?=(%add-nodes -.q.a)
    b
  (check-nodes nodes.q.a b)
--
