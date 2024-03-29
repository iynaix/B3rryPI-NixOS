{ config, pkgs, ... }:

{
  import = [ 
    ./../../homeManagerModules/default.nix
  ];

  # Enable cliPrograms
  git.enable = true;
}
