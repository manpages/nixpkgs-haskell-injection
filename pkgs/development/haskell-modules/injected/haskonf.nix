{ mkDerivation, base, directory, extensible-exceptions, filepath
, process, stdenv, time, unix, src ? ./., fetchurl, FindBin
}:
mkDerivation {
  pname = "haskonf";
  version = "0.0.1";
  src = fetchurl { url    = "https://github.com/manpages/haskonf/archive/5c15e6661c4fa53e7d172b3a6a451e36b96081b6.tar.gz";
                   sha256 = "5237206fbdcb898cb9e17e418c71a19eb1174f41c0574d56b02aef8cf49263c9"; };
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    base directory extensible-exceptions filepath process time unix FindBin
  ];
  description = "Reflective configuration library";
  license = stdenv.lib.licenses.bsd2;
}
