{ pkgs, ... }: {
  config.services = {
    unleash-server = {
      service = {
        image = "unleash/unleash-server:main-edge-16-alpine";
        container_name = "unleash-server";
        ports = [ "4242:4242" ];
        stop_signal = "SIGINT";
      };
    };
  };
}
