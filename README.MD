# Overview
This is an official Kong Easter Eggs plugin (adding 'official' always makes it more powerful).
It's production-ready (2 untested functions) and AI based (built on more more than 5 IFs).
Sponsored by Y-Carburetor© and Bugs Bunny. 

```commandline
luarocks install kong-easter-eggs
```


## Local Development

For local development we need to create and setup Kong declarative configuration.
```commandline
cp kong.tpl.yml kong.yml
```

Let's adjust `plugins` setting in `kong.yml`:
```yaml
plugins:
  - name: kong-easter-eggs
    config:
      dance_link: https://youtu.be/dQw4w9WgXcQ
      prize_frequency: 3
      prizes: [
        "COVID-19 vaccine",
        "Ticket to Crew Dragon",
        "Early access to Half-Life 3"
      ]
```

Now we can start Kong:
```commandline
docker-compose up
```
If everything is okay, you will see something like this in console:
```commandline
kong_1  | 
kong_1  | No existing manifest. Attempting to rebuild...
kong_1  | kong-easter-eggs 1.0.0-1 is now installed in /home/kong/.luarocks (license: MIT)
kong_1  | 
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: using the "epoll" event method
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: openresty/1.15.8.3
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: built by gcc 9.2.0 (Alpine 9.2.0) 
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: OS: Linux 4.9.184-linuxkit
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: getrlimit(RLIMIT_NOFILE): 1048576:1048576
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: start worker processes
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: start worker process 71
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: start worker process 72
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: start worker process 73
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: start worker process 74
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: start worker process 75
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: start worker process 76
kong_1  | 2020/05/31 16:49:36 [notice] 67#0: signal 17 (SIGCHLD) received from 68
kong_1  | 2020/05/31 16:49:36 [warn] 74#0: *3 [lua] globalpatches.lua:52: sleep(): executing a blocking 'sleep' (0.001 seconds), context: init_worker_by_lua*
kong_1  | 2020/05/31 16:49:36 [notice] 72#0: *2 [kong] init.lua:284 declarative config loaded from /opt/conf/kong.yml, context: init_worker_by_lua*
kong_1  | 2020/05/31 16:49:36 [warn] 74#0: *3 [lua] globalpatches.lua:52: sleep(): executing a blocking 'sleep' (0.001 seconds), context: init_worker_by_lua*
kong_1  | 2020/05/31 16:49:36 [warn] 74#0: *3 [lua] globalpatches.lua:52: sleep(): executing a blocking 'sleep' (0.002 seconds), context: init_worker_by_lua*
```

> **_NOTE:_**  Plugin is built into Kong automatically by `run.sh` in docker-compose kong `command`

To check Kong is working okay, you can do the following.
```commandline
curl localhost:8000 -I
```
If everything is okay, you will see something like this in console:
```commandline
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
Content-Length: 648
Connection: keep-alive
Content-Encoding: gzip
Accept-Ranges: bytes
...
```

All good APIs must know how to make you dance, so let's make the following query:
```commandline
curl localhost:8000 -I -H "Make-Me: dance"
```
Seems our APIs in a good mood and redirect us to a good link:
```commandline
HTTP/1.1 302 Moved Temporarily
Date: Sun, 31 May 2020 16:54:48 GMT
Content-Type: text/html
Content-Length: 110
Connection: keep-alive
Location: https://youtu.be/dQw4w9WgXcQ
X-Kong-Response-Latency: 0
Server: kong/2.0.3
```

APIs should also be rewarding as they love to be used. Let's make a third request to check:
```commandline
curl localhost:8000 -I
```
And we really get a cool gift! This time it's a ticket to Crew Dragon.
```commandline
...
X-Cache: HIT
You-Have-Won: Ticket to Crew Dragon
X-Kong-Upstream-Latency: 557
...
```


## Notes
If you are using PyCharm (any other JetBrains IDE), there is an awesome plugin for Lua support: [EmmyLua](https://plugins.jetbrains.com/plugin/9768-emmylua)
This plugin also supports VSCode.
