{ pkgs, stdenv, callPackage }:
self: {
  "haskonf"         = callPackage (import ./injected/haskonf.nix)           {};
  "blog"            = callPackage (import ./injected/blog.nix)              {};
  "impurescript"    = callPackage (import ./injected/impurescript.nix)      {};
}
