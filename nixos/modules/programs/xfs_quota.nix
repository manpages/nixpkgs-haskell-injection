# Configuration for the xfs_quota command

{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.programs.xfs_quota;

  limitOptions = opts: concatStringsSep " " [
    (optionalString (opts.sizeSoftLimit != null) "bsoft=${opts.sizeSoftLimit}")
    (optionalString (opts.sizeHardLimit != null) "bhard=${opts.sizeHardLimit}")
  ];

in

{

  ###### interface

  options = {

    programs.xfs_quota = {
      projects = mkOption {
<<<<<<< HEAD
=======
        default = {};
>>>>>>> e69a162ceda87e57ff73b58d67992d094e9739c4
        type = types.attrsOf (types.submodule {
          options = {
            id = mkOption {
              type = types.int;
              description = "Project ID.";
            };

            fileSystem = mkOption {
              type = types.string;
              description = "XFS filesystem hosting the xfs_quota project.";
              default = "/";
            };

            path = mkOption {
              type = types.string;
              description = "Project directory.";
            };

            sizeSoftLimit = mkOption {
              type = types.nullOr types.string;
              default = null;
              example = "30g";
              description = "Soft limit of the project size";
            };

            sizeHardLimit = mkOption {
              type = types.nullOr types.string;
              default = null;
              example = "50g";
              description = "Hard limit of the project size.";
            };
          };
        });

        description = "Setup of xfs_quota projects. Make sure the filesystem is mounted with the pquota option.";

        example = {
          "projname" = {
            id = 50;
            path = "/xfsprojects/projname";
            sizeHardLimit = "50g";
          };
        };
      };
    };

  };


  ###### implementation

  config = mkIf (cfg.projects != {}) {

    environment.etc.projects.source = pkgs.writeText "etc-project"
      (concatStringsSep "\n" (mapAttrsToList
        (name: opts: "${toString opts.id}:${opts.path}") cfg.projects));

    environment.etc.projid.source = pkgs.writeText "etc-projid"
      (concatStringsSep "\n" (mapAttrsToList
        (name: opts: "${name}:${toString opts.id}") cfg.projects));

    systemd.services = mapAttrs' (name: opts:
      nameValuePair "xfs_quota-${name}" {
        description = "Setup xfs_quota for project ${name}";
        script = ''
          ${pkgs.xfsprogs}/bin/xfs_quota -x -c 'project -s ${name}' ${opts.fileSystem}
          ${pkgs.xfsprogs}/bin/xfs_quota -x -c 'limit -p ${limitOptions opts} ${name}' ${opts.fileSystem}
        '';

        wantedBy = [ "multi-user.target" ];
        after = [ ((replaceChars [ "/" ] [ "-" ] opts.fileSystem) + ".mount") ];

<<<<<<< HEAD
        restartTriggers = [ (pkgs.writeText "xfs_quota-project-trigger-${name}" (builtins.toJSON opts)) ];
=======
        restartTriggers = [ config.environment.etc.projects.source ];
>>>>>>> e69a162ceda87e57ff73b58d67992d094e9739c4

        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
      }
    ) cfg.projects;

  };

}
