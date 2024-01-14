{
  description = "Minimal NixOS installation media";
  inputs.nixos.url = "nixpkgs/23.11";
  outputs = { self, nixos }: {
    nixosConfigurations = {
      exampleIso = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${nixos}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ({ pkgs, config, ... }: {
            nixpkgs.config.allowUnfree = true;
            environment.systemPackages = [];
            boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
          })
        ];
      };
    };
  };
}
