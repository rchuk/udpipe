@echo off

if [%1]==[] (
    echo Server port must be provided as a first argument
    exit /b 1
)
if [%2]==[] (
    echo Models folder must be provided as a second argument
    exit /b 1
)

python ./udpipe2_server.py "%1" uk uk-iu-ud-2.12-230717:uk_iu-ud-2.12-230717:uk:ukr "%2/uk_iu-ud-2.12-230717.model" uk_iu https://ufal.mff.cuni.cz/udpipe/2/models#universal_dependencies_212_models --preload_models uk
