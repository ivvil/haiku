{inputs, pkgs, ...}: {
        home = {
                file."emacs-config" = {
                        target = ".emacs.d";
                        source = inputs.emacs-config;
                };
        };

        services.emacs = {
                enable = true;
                package = pkgs.emacs-gtk;
                defaultEditor = true;
        }
}
