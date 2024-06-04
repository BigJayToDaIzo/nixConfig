{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
    	url = "github:nix-community/nixvim";
	# If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
	# url = "github:nix-community/nixvim/nixos-23.11";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations = {
      dn = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jm = import ./home.nix;

	    
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
	    home-manager.extraSpecialArgs = {
	    	inherit nixvim;
	    };
          }
        ];
      };
    };
  };
}
