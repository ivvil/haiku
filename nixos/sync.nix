{
  services.syncthing = {
    enable = true;
    user = "ivvil";
    settings.gui.password = "55Gg9900";
    settings.gui.user = "ivvil";
    configDir = "/home/ivvil/.config/syncthing";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    settings.devices = {
      "abas" = { id = "CF6I7CC-KWWO35I-UV7WLHA-HNNGCJU-SWXYP5T-JA4PRXI-UWZZXPO-BVQLUAE"; };
      "castor" = { id = "YQ4YBF3-KF4YGGY-WLBGHCT-7XBLT7A-PZML52Z-PCVQFQ4-RX5DB6G-4JZGBA4"; };
    };
    settings.folders = {
      "Música" = {
        id = "4p5d7-3lrzm";
        path = "/home/ivvil/Música";
        devices = [ "abas" "castor" ];
      };

      "KeePass" = {
        id = "ax5hy-303pk";
        path = "/home/ivvil/Documentos/KeePass";
        devices = [ "abas" "castor" ];        
      };
    };
  };
}
