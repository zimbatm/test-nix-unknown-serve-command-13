let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { config = {}; overlays = []; };
in
  pkgs.mkShell {
    buildInputs = [ pkgs.nixops ];
    shellHook = ''
      export NIXOPS_STATE=$PWD/deployments.nixops
      export NIXOPS_DEPLOYMENT=network
      export NIX_PATH=nixpkgs=${pkgs.path}
    '';
  }
