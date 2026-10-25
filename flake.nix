{
  description = "NixOS config (sway)";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs"; # penting, biar pakai nixpkgs yang sama
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/thinkpad/configuration.nix
          home-manager.nixosModules.home-manager
          {

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.adiarif = import ./home.nix;

          }
        ];
      };
    };
}
