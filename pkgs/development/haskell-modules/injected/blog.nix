{ mkDerivation, base, containers, filepath, haskonf, mtl, stdenv
, text, time, turtle, fetchurl
}:
mkDerivation {
  pname = "blog";
  version = "0.0.1";
  src = fetchurl { url    = "https://github.com/manpages/blog/archive/ff7cae62f982fcdfaac4996f84a798cdbe1a16c7.tar.gz";
                   sha256 = "0bab19b60803e110f6bc31b702348605059d1de851d62315cc01f373a7b0a8b6"; };
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    base containers filepath haskonf mtl text time turtle
  ];
  description = "CLI to instantiate/publish hakyll posts";
  license = stdenv.lib.licenses.bsd2;
}
