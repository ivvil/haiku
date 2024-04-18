{inputs, lib, pkgs, ...}: {
  home = {
    # file."emacs-config" = {
    #         target = ".emacs.d";
    #         source = inputs.emacs-config;
    # };	
		sessionVariables = {
			EDITROR = "emacs";
			VISUAL = "emacs";
		};
	};

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
  };
}
