{ mkDerivation, base, directory, extensible-exceptions, filepath
, process, stdenv, time, unix, src ? ./., fetchurl, FindBin
}:
mkDerivation {
  pname = "haskonf";
  version = "0.0.1";
  src = fetchurl { url    = "https://github.com/manpages/haskonf/archive/86ba73867a3555725371732914e88a530e29ff4a.tar.gz";
                   sha256 = "433a8c15a579721ac24f2f32199015115fb8f48a08a8bbbcb377f6c05277a604"; };
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    base directory extensible-exceptions filepath process time unix FindBin
  ];
  description = "Reflective configuration library";
  license = stdenv.lib.licenses.bsd2;
}
