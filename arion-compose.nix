{ pkgs, ... }: {
  config.services = {
    postgress = {
      service = {
        image = "postgres:12.12-bullseye";
        container_name = "unleash-db";
        ports = [ "5432:5432" ];
        volumes = [ "${toString ./.}/postgres-data:/var/lib/postgresql/data" ];
        environment = {
          POSTGRES_USER = "unleash_user";
          POSTGRES_PASSWORD = "some_password";
          POSTGRES_DB = "unleash";
          POSTGRES_HOST = "unleash-db";
          POSTGRES_PORT = "5432";
          POSTGRES_SSL = "off";
        };
        stop_signal = "SIGINT";
      };
    };
    unleash-server = {
      service = {
        image = "unleashorg/unleash-server:main-edge-16-alpine";
        container_name = "unleash-server";
        ports = [ "4242:4242" ];
        environment = {
          DATABASE_HOST = "unleash-db";
          DATABASE_NAME = "unleash";
          DATABASE_USERNAME = "unleash_user";
          DATABASE_PASSWORD = "some_password";
          DATABASE_SSL = "false";
        };
        stop_signal = "SIGINT";
      };
    };
  };
}
