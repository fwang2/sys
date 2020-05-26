# SSH 

## Multiple host jump 

OpenSSH 7.3 above project `-J` option:

    ssh -J jumpuser1@jumphost1,jumpuser2@jumphost2,...,jumpuserN@jumphostN user@target_host
    
As an example, I can jump to my `pie.ornl.gov`:

    ssh -J login1.ornl.gov pie


If preferred, the following configuration can be used `.ssh/config`:

```
Host pie
    HostName pie.ornl.gov
    ProxyJump login1.ornl.gov
```

With this configuration, I can just run `ssh pie`.


## HTTP Tunneling

With ssh jump set up in place, the following command will setup the tunneling:

    ssh -C -f -N -D 9090 pie

Here are the explainations:

* `-C`: use data compression
* `-f`: put it to background
* `-N`: don't run any remote command
* `-D 9090`: Run SOCKS5 server on port 9090

Once authenticated, it should just return and ssh is put in the background

For system wide setup, we can:

* manual proxy: SOCKS5, 127.0.0.1, port 9090
* auto DNS proxy

Firefox supports override this so other browswer won't be impacted.

To verify:

* connect to https://mattermost.ccs.ornl.gov

- - - 

### Setup [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)

First we set up a profile, and configure SOCKS5:

<!-- ![](figs/switch2.png) -->

Next, we setup rules for auto switch to work: whenever access to `*.ornl.gov` domain, we ask it to proxy through ORNL profile.

<!-- ![](figs/switch1.png) -->

- - - 
 
### ssh to vm local (created by vmfusion) takes a long time using hostname

It is fine though if using IP address directly. There are various other fixes, particulary change server's 
`/etc/ssh/ssd_config` and set `GSSAPIAuthentication no`. That doesn't work in my case.

My fix is to use ipv4 explicitly. Edit client's ssh configuration file: `$HOME/.ssh/config`:

```
Host x2.local
   HostName x2.local
   User f7b
   IdentityFile ~/.ssh/fwang2.id_rsa
   AddressFamily inet
```

## References

* https://wiki.gentoo.org/wiki/SSH_jump_host
* https://superuser.com/questions/96489/an-ssh-tunnel-via-multiple-hops
