{ pkgs, stdenv, callPackage }:
self: {
  "haskonf" = callPackage (import ./injected/haskonf.nix) {};
}
