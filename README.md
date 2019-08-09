# [TEST] Trying to reproduce `unknown serve command 13`

This error is hard to track because it depends on multiple clients using a
remote store at the same time. This repo is just an elaborate way to reproduce
the error.

## Reproducing the issue

Install NixOS with VirtualBox enabled:

```nix
{ ... }: {
  virtualisation.virtualbox.host.enable = true;
}
```

Next, enter this project's devenv: `nix-shell`

Then create the cluster with `./start-cluster`

And finally run `./run-test` to reproduce the issue.

When finished, run `nixops destroy` to shutdown the experiment.

## Example output

```
**********************************************************
* Running nix-copy-closure on all the clients
**********************************************************
<snip>
client2: copying path '/nix/store/064jmylcq7h6fa5asg0rna9awcqz3765-0001-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch' to 'ssh://nix-ssh@server'...
client2: adding path '/nix/store/064jmylcq7h6fa5asg0rna9awcqz3765-0001-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch' to remote host 'nix-ssh@server'
client1: querying remote host 'nix-ssh@server' for info on '/nix/store/064jmylcq7h6fa5asg0rna9awcqz3765-0001-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/05519al3nfm3xh52br6byx1n4h6p48pg-readline63-006.drv'
client2: warning: SQLite database '/nix/var/nix/db/db.sqlite' is busy
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/072184hqi2mk5535faivca0vz8ig8pvz-setup-hook.sh'
client2: copying path '/nix/store/072184hqi2mk5535faivca0vz8ig8pvz-setup-hook.sh' to 'ssh://nix-ssh@server'...
client2: adding path '/nix/store/072184hqi2mk5535faivca0vz8ig8pvz-setup-hook.sh' to remote host 'nix-ssh@server'
client1: querying remote host 'nix-ssh@server' for info on '/nix/store/072184hqi2mk5535faivca0vz8ig8pvz-setup-hook.sh'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/05n09s9jf836y2bv1fkv6nlsv8ss596y-clucene-core-2.3.3.4.tar.gz.drv'
client1: copying path '/nix/store/072184hqi2mk5535faivca0vz8ig8pvz-setup-hook.sh' to 'ssh://nix-ssh@server'...
client1: adding path '/nix/store/072184hqi2mk5535faivca0vz8ig8pvz-setup-hook.sh' to remote host 'nix-ssh@server'
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/09rh601rydk5xgl1msgwpzdjmr5fa1f7-fix-rpath.patch.drv'
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/0a4dyd5rfbgl5bifm21r18mchd9n4rn3-xsltml_2.1.2.zip.drv'
client1: error: unknown serve command 13
client1: querying remote host 'nix-ssh@server' for info on '/nix/store/09rh601rydk5xgl1msgwpzdjmr5fa1f7-fix-rpath.patch.drv'
client1: debug1: client_input_channel_req: channel 0 rtype exit-status reply 0
client1: debug1: client_input_channel_req: channel 0 rtype eow@openssh.com reply 0
client1: debug1: channel 0: free: client-session, nchannels 1
client1: debug1: fd 0 clearing O_NONBLOCK
client1: debug1: fd 2 clearing O_NONBLOCK
client1: Transferred: sent 129092, received 4912 bytes, in 4.0 seconds
client1: Bytes per second: sent 32008.7, received 1217.9
client1: debug1: Exit status 1
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/064jmylcq7h6fa5asg0rna9awcqz3765-0001-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch'
client1: killing process 1979
client1: error: unexpected end-of-file
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/0ah0phqh2cdqxyrrkd8g9wq86c3hwmqi-perl5.28.1-XML-Simple-2.25.drv'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/072184hqi2mk5535faivca0vz8ig8pvz-setup-hook.sh'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/09rh601rydk5xgl1msgwpzdjmr5fa1f7-fix-rpath.patch.drv'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/0a4dyd5rfbgl5bifm21r18mchd9n4rn3-xsltml_2.1.2.zip.drv'
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/0dm3l9pdi9mikclhllgq1wvxa2l9lw7a-CoinMP-1.8.3.tgz.drv'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/0ah0phqh2cdqxyrrkd8g9wq86c3hwmqi-perl5.28.1-XML-Simple-2.25.drv'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/0dm3l9pdi9mikclhllgq1wvxa2l9lw7a-CoinMP-1.8.3.tgz.drv'
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/0dvl576zxhfnfkvryy1jqp4x4d420dnf-harfbuzz-1.8.4.tar.bz2.drv'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/0dvl576zxhfnfkvryy1jqp4x4d420dnf-harfbuzz-1.8.4.tar.bz2.drv'
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/0dw6v7x9s0rhd1v4h19sh2hsvahyhqw3-ed-1.15.drv'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/0dw6v7x9s0rhd1v4h19sh2hsvahyhqw3-ed-1.15.drv'
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/0gzlabxdx5xhf75wrsgcq1awikvcrn6y-c-ares-1.15.0.tar.gz.drv'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/0gzlabxdx5xhf75wrsgcq1awikvcrn6y-c-ares-1.15.0.tar.gz.drv'
client2: copying path '/nix/store/0gzlabxdx5xhf75wrsgcq1awikvcrn6y-c-ares-1.15.0.tar.gz.drv' to 'ssh://nix-ssh@server'...
client2: adding path '/nix/store/0gzlabxdx5xhf75wrsgcq1awikvcrn6y-c-ares-1.15.0.tar.gz.drv' to remote host 'nix-ssh@server'
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/0i3ap5600ipbdcqy2fsaxkjjsrprywn5-cdparanoia-III-10.2.drv'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/0i3ap5600ipbdcqy2fsaxkjjsrprywn5-cdparanoia-III-10.2.drv'
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/0i5i9mj0n4nry46qvzlmi6h1k9d3pbcn-gtk2-theme-paths.patch'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/0i5i9mj0n4nry46qvzlmi6h1k9d3pbcn-gtk2-theme-paths.patch'
client3: copying path '/nix/store/0i5i9mj0n4nry46qvzlmi6h1k9d3pbcn-gtk2-theme-paths.patch' to 'ssh://nix-ssh@server'...
client3: adding path '/nix/store/0i5i9mj0n4nry46qvzlmi6h1k9d3pbcn-gtk2-theme-paths.patch' to remote host 'nix-ssh@server'
client2: copying path '/nix/store/0i5i9mj0n4nry46qvzlmi6h1k9d3pbcn-gtk2-theme-paths.patch' to 'ssh://nix-ssh@server'...
client2: adding path '/nix/store/0i5i9mj0n4nry46qvzlmi6h1k9d3pbcn-gtk2-theme-paths.patch' to remote host 'nix-ssh@server'
[4]  32278 Exit 1                  run_test client1
[5]- 32296 Running                 run_test client2 &
[6]+ 32321 Running                 run_test client3 &
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/0jgbzap1nq63r0s1wicp5lim2cis4b5y-atk-2.30.0.tar.xz.drv'
client2: error: unknown serve command 13
client2: querying remote host 'nix-ssh@server' for info on '/nix/store/0jgbzap1nq63r0s1wicp5lim2cis4b5y-atk-2.30.0.tar.xz.drv'
client3: querying remote host 'nix-ssh@server' for info on '/nix/store/0k2gzk4jfkm7i3prx35k4yifj50fk52b-libcmis-0.5.0.drv'
client2: debug1: client_input_channel_req: channel 0 rtype exit-status reply 0
client2: debug1: client_input_channel_req: channel 0 rtype eow@openssh.com reply 0
client2: debug1: channel 0: free: client-session, nchannels 1
client2: debug1: fd 0 clearing O_NONBLOCK
client2: debug1: fd 2 clearing O_NONBLOCK
client2: Transferred: sent 157188, received 4792 bytes, in 4.8 seconds
client2: Bytes per second: sent 32489.1, received 990.5
client2: debug1: Exit status 1
client2: killing process 1968
client2: error: unexpected end-of-file
./run-test: line 30: 32321 Terminated              run_test client3
```

## Analysis

* Happens when two nix-copy-close copy the same drv at the same time.
* Happens with nix 2.2.2 and master
* Also works with 1 vcpu on the server

## TODO

Does it also break with ssh-ng:// ?
