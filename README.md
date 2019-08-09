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
[4]  29148 Running                 run_test client1 &
[5]- 29166 Running                 run_test client2 &
[6]+ 29195 Running                 run_test client3 &
client1: copying 1505 paths...
client1: copying path '/nix/store/01n3wxxw29wj2pkjqimmmjzv7pihzmd7-which-2.21.tar.gz.drv' to 'ssh://nix-ssh@server'...
client2: copying 1503 paths...
client1: copying path '/nix/store/064jmylcq7h6fa5asg0rna9awcqz3765-0001-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch' to 'ssh://nix-ssh@server'...
client1: copying path '/nix/store/072184hqi2mk5535faivca0vz8ig8pvz-setup-hook.sh' to 'ssh://nix-ssh@server'...
client3: copying 1500 paths...
client1: copying path '/nix/store/0gzlabxdx5xhf75wrsgcq1awikvcrn6y-c-ares-1.15.0.tar.gz.drv' to 'ssh://nix-ssh@server'...
client1: copying path '/nix/store/0i5i9mj0n4nry46qvzlmi6h1k9d3pbcn-gtk2-theme-paths.patch' to 'ssh://nix-ssh@server'...
client2: copying path '/nix/store/0i5i9mj0n4nry46qvzlmi6h1k9d3pbcn-gtk2-theme-paths.patch' to 'ssh://nix-ssh@server'...
client2: error: unknown serve command 13
client2: error: unexpected end-of-file
client1: copying path '/nix/store/0pc18b91az604bmggly2891hgrjd9qbf-libtool-2.4.6.tar.gz.drv' to 'ssh://nix-ssh@server'...
client3: copying path '/nix/store/0pc18b91az604bmggly2891hgrjd9qbf-libtool-2.4.6.tar.gz.drv' to 'ssh://nix-ssh@server'...
client1: error: unknown serve command 13
client1: error: unexpected end-of-file
[4]  29148 Running                 run_test client1 &
[5]- 29166 Exit 1                  run_test client2
[6]+ 29195 Running                 run_test client3 &
exit 1
```
