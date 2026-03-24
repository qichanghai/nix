{ config, pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    ripgrep
    fd
    bat
    jq
    tree
    fzf
    eza
    zoxide
    starship
  ];

  programs.git = {
    enable = true;
    settings.user.name = "Changhai Qi";
    settings.user.email = "changhai.qi@opencampus.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      eval "$(zoxide init zsh)"
    '';
    shellAliases = {
      hm = "home-manager switch --flake ~/nix-config#qichanghai";
      hmu = "nix flake update ~/nix-config && home-manager switch --flake ~/nix-config#qichanghai";
    };
  };

  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.zoxide.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;

      format = "$directory$git_branch$git_status$character";

      directory = {
        truncation_length = 3;
      };
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };
}
