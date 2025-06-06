{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos_eecm";
    networkmanager.enable = true;
    # nameservers = [ "127.0.0.1" ];
  };

  /*
    services.blocky = {
      enable = true;
      settings = {
        ports.dns = 53;
        upstreams.groups.default = [
          "84.238.0.130"
          "84.238.6.254"
          "192.168.1.1"
        ];
        bootstrapDns = {
          upstream = "https://one.one.one.one/dns-query";
          ips = [
            "1.1.1.1"
            "1.0.0.1"
          ];
        };
      };
      #Enable Blocking of certian domains.
      blocking = {
        blackLists = {
          #Adblocking
          ads = [ "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" ];
          #Another filter for blocking adult sites
          adult = [ "https://blocklistproject.github.io/Lists/porn.txt" ];
          #You can add additional categories
          # Lista de sites bloquados
          slack = [
            ''
              |
                        www.facebook.com
            ''
          ];
        };
        clientGroupsBlock = {
          seemg = [
            "ads"
            "adult"
          ];
          aluno_2001 = [
            "ads"
            "adult"
            "slack"
          ];
          aluno_eecm = [
            "ads"
            "adult"
            "slack"
          ];
        };
      };
    };
  */

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.wacom.enable = true;

  # # Enable the KDE Plasma Desktop Environment.
  services.displayManager.defaultSession = "cinnamon";
  services.xserver.desktopManager.cinnamon.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "br";
    # xkb.variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Audio fix
  hardware.enableAllFirmware = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users = {

    seemg = {
      isNormalUser = true;
      description = "seemg";
      extraGroups = [
        "wheel"
        "adm"
        "networkmanager"
      ];
      packages = with pkgs; [
        gparted
      ];
    };

    aluno_2001 = {
      isNormalUser = true;
      description = "aluno_2001";
      extraGroups = [
        "adm"
        "networkmanager"
      ];
    };

/*
    gamer = {
      isNormalUser = true;
      description = "aluno_2001";
      extraGroups = [
        "adm"
        "networkmanager"
      ];
      packages = [
        pkgs.minecraft
      ];
    };
*/
    aluno_eecm = {
      isNormalUser = true;
      description = "aluno_eecm";
    };

  };

  programs = {
    # Firefox
    firefox.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Global system packages
  environment.systemPackages = with pkgs; [

    #CLI -> Essential
    vim
    git
    fzf
    zip
    # inputs.nixvim.packages.${pkgs.system}.default # NixVim

    #CLI -> Other tools
    bat
    tree
    eza

    #Development
    wezterm
    gcc
    zulu
    arduino-ide
    vscode

    #Image stuff
    krita

    #Hardware/Libs
    ventoy-full
    fan2go

    #Other
    kdePackages.kcalc
    # blocky
  ];

  environment.localBinInPath = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # DO NOT CHANGE
  system.stateVersion = "24.11"; # Did you read the comment?

}
