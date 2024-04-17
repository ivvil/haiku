{
  pkgs,
  ...
}:
{
  home.sessionVariables = {
    EDITOR = "emacs";
    VISUAL = "emacs";
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
  };
}
