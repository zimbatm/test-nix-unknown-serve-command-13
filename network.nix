{
  client1 = { config, pkgs, lib, ... }: {
    imports = [
      ./profiles/shared.nix
    ];
    networking.hostName = "client1";
    deployment.targetEnv = "virtualbox";
    deployment.virtualbox.headless = true;
  };

  client2 = { config, pkgs, lib, ... }: {
    imports = [
      ./profiles/shared.nix
    ];
    networking.hostName = "client2";
    deployment.targetEnv = "virtualbox";
    deployment.virtualbox.headless = true;
  };

  client3 = { config, pkgs, lib, ... }: {
    imports = [
      ./profiles/shared.nix
    ];
    networking.hostName = "client3";
    deployment.targetEnv = "virtualbox";
    deployment.virtualbox.headless = true;
  };

  # machine that takes the remote builds
  server = { config, pkgs, lib, ... }: {
    imports = [
      ./profiles/shared.nix
    ];
    networking.hostName = "server";
    deployment.targetEnv = "virtualbox";
    deployment.virtualbox.headless = true;
  };
}
