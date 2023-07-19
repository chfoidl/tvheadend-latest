{
  description = "Provides a overlay for latest tvheadend";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs }: 
    let
      tvheadendLatestOverlay = import ./overlay.nix;
    in {
      overlay = tvheadendLatestOverlay;
    };
}
