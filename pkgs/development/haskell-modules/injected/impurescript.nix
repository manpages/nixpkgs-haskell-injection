    ({ mkDerivation, aeson, aeson-better-errors, ansi-wl-pprint, base
     , bower-json, boxes, bytestring, containers, directory, dlist
     , filepath, Glob, haskeline, HUnit, language-javascript, mtl
     , optparse-applicative, parsec, pattern-arrows, process, safe
     , semigroups, split, syb, text, time, transformers
     , transformers-compat, unordered-containers, utf8-string, vector
     , fetchurl, pkgs, stdenv
     }:

      let binNode = with pkgs.nodePackages; [
        bower
        grunt-cli
        pulp
      ] ++ [ pkgs.nodejs pkgs.git ];
      in

     mkDerivation {
       pname = "purescript";
       preBuild = "export HOME=/tmp";
       version = "0.7.3.0";
       sha256 = "27d9e4bd3061a2b64e10d4d7c140b2debd786772309aa36e0b7fdaa49b42b5c0";
       isLibrary = true;
       isExecutable = true;
       buildDepends = binNode;
       testDepends = binNode;
       libraryHaskellDepends = [
         aeson aeson-better-errors base bower-json boxes bytestring
         containers directory dlist filepath Glob language-javascript mtl
         parsec pattern-arrows process safe semigroups split syb text time
         transformers transformers-compat unordered-containers utf8-string
         vector
       ];
       executableHaskellDepends = [
         aeson ansi-wl-pprint base bytestring containers directory filepath
         Glob haskeline mtl optparse-applicative parsec process split time
         transformers transformers-compat
       ];
       testHaskellDepends = [
         base containers directory filepath Glob haskeline HUnit mtl
         optparse-applicative parsec process time transformers
         transformers-compat
       ];
       homepage = "http://www.purescript.org/";
       description = "PureScript Programming Language Compiler bundled with nodejs stuff";
       license = stdenv.lib.licenses.mit;
       hydraPlatforms = stdenv.lib.platforms.none;
     })
