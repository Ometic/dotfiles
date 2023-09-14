{ pkgs, ... }:

{
  # Fonts
  fonts = {
    packages = with pkgs; [
      openmoji-color

      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];

    fontconfig = {
      hinting.autohint = true;
      defaultFonts = {
        emoji = [ "OpenMoji Color" ];
      };
    };
  };

  # Networking
  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = true;
      # Todo
    };
  };

  # Services
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  # Users
  users = {
    users = {
      root.hashedPassword = "!";

      ometic = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
      };
    };
  };

  # Environment
  environment.variables = {
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_CONFIG = "$HOME/dotfiles";
    EDITOR = "nvim";
  };

  # Security
  security = {
    rtkit.enable = true;

    protectKernelImage = true;
  };

  # Hardware
  hardware = {
    opengl = {
      enable = true;
    };
  };
}
