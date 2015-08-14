{ mkDerivation, base, directory, extensible-exceptions, filepath
, process, stdenv, time, unix, src ? ./., fetchurl
}:
mkDerivation {
  pname = "haskonf";
  version = "0.0.1";
  src = fetchurl { url    = "https://github.com/manpages/haskonf/archive/e6662e158578006943ebd95381d6d7b89c657ed8.tar.gz";
                   sha256 = "5f3660b65d44584d3245d8387fbbb9b1f8d3a5ffdef2d0d6e037dd69e51ea414"; };
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    base directory extensible-exceptions filepath process time unix
  ];
  description = "Reflective configuration library";
  license = stdenv.lib.licenses.bsd2;
}
