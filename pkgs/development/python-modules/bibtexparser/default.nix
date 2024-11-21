{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  pylatexenc,
  pytest-xdist,
  pytest-cov,
  jupyter,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "bibtexparser";
  version = "2.0.0b7";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "sciunto-org";
    repo = "python-${pname}";
    rev = "refs/tags/v${version}";
    hash = "sha256-C4FHMrR9hZmjyaUdmJuIlSW66VZeVLF4MLc1b6qD5ng=";
  };

  dependencies = [ pylatexenc ];

  nativeCheckInputs = [ pytestCheckHook pytest-xdist pytest-cov ];

  pythonImportsCheck = [ "bibtexparser" ];

  meta = with lib; {
    description = "Bibtex parser for Python";
    homepage = "https://github.com/sciunto-org/python-bibtexparser";
    license = with licenses; [
      mit
    ];
  };
}
