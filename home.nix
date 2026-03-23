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
  };

  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.zoxide.enable = true;

  home.sessionVariables = {
    EDITOR = "emacs";
  };
}
