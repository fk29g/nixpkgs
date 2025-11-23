{
  fetchFromGitHub,
  lib,
  python3Packages,
}:

let
  name = "plann";
in
python3Packages.buildPythonApplication rec {
  pname = name;
  version = "1.0.0";
  pyproject = true;

  build-system = [ python3Packages.setuptools ];

  src = fetchFromGitHub {
    owner = "tobixen";
    repo = name;
    rev = "v${version}";
    hash = "sha256-WJ7uSYk/esMTjNGAXkjSfqBoxbkOv28tL+PjFc3fwVk=";
  };

  dependencies = with python3Packages; [
    icalendar
    caldav
    tzlocal
    clickclick
    pyyaml
    sortedcontainers
  ];

  meta = {
    description = "Command-line CalDAV client";
    homepage = "https://github.com/tobixen/${name}";
    mainProgram = "plann";
    license = lib.licenses.gpl3Only;
    maintainers = [ lib.maintainers.nicknb ];
  };
}
