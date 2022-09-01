@('mingw','go') | %{iex -Command $('choco '+'install'+' '+$_+' -y --no-progress')}

go install github.com/prometheus/promu@v0.13.0

git clone https://github.com/coreweave/windows_exporter

git checkout pr/817

promu build

.\installer\build.ps1 -PathToExecutable .\windows_exporter.exe -Version 0.19.3 -Arch amd64
