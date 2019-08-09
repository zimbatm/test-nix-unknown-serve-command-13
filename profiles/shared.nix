{ pkgs, ... }: {
  # copy the shared SSH key. !!! don't do that in production !!!
  environment.etc."id_rsa".text = builtins.readFile ../id_rsa;

  services.openssh.enable = true;
  services.openssh.passwordAuthentication = false;

  nix.trustedUsers = [ "root" "nix-ssh" ];

  users.mutableUsers = false;
  users.users.nix-ssh = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keyFiles = [ ../id_rsa.pub ];
  };
}
