{stdenv, fetchurl, qt4, boost, proj, gdal_1_11_2}:

stdenv.mkDerivation rec {
  name = "merkaartor-0.18.1";
  src = fetchurl {
    url = "http://merkaartor.be/attachments/download/301/merkaartor-0.18.1.tar.bz2";
    sha256 = "17qk45pmlxqigla1915dvn9pp91y85d2bkcaap4g3m8mk1crcsix";
  };

  configurePhase = ''
    qmake -makefile PREFIX=$out
  '';

  buildInputs = [ qt4 boost proj gdal_1_11_2 ];

  meta = {
    description = "An openstreetmap editor";
    homepage = http://merkaartor.org/;
    license = stdenv.lib.licenses.gpl2Plus;
    maintainers = with stdenv.lib.maintainers; [viric urkud];
    inherit (qt4.meta) platforms;
  };
}
