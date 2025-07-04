#!/bin/bash
allDirs() {
    count=$(find . -name "pubspec.yaml" -exec dirname {} \; | wc -l)
    find . -name "pubspec.yaml" -exec dirname {} \; | xargs -n 1 -P "$count" -I {} bash -c '
    (
      cd "{}" || exit
      echo -e "\033[1;32mRunning fvm flutter clean and pub get in {}\033[0m"
      fvm flutter clean
      fvm flutter pub get
    )
  '
}

echo_styled() {
    echo -e "\033[1;$2m$1\033[0m"
}

fvm flutter clean

allDirs

# Generate localization keys
(
    cd "core" || exit
    echo_styled "Generating localization keys in core" 33
fvm dart run easy_localization:generate -f keys -o locale_keys.g.dart -O lib/src/localization/generated -S languages
)

# Generate data layer files
(
    cd "data" || exit
    echo_styled "Generating data layer files in data" 33
    fvm dart run build_runner build --delete-conflicting-outputs
)

# Generate domain layer files
(
    cd "domain" || exit
    echo_styled "Generating domain layer files in domain" 33
    fvm dart run build_runner build --delete-conflicting-outputs
)

# Generate core_ui layer files
(
    cd "core_ui" || exit
    echo_styled "Generating core_ui layer files in core_ui" 33
    fvm dart run build_runner build --delete-conflicting-outputs
)

# Generate feature layer files
(
    cd "features" || exit
    count=$(find . -mindepth 1 -maxdepth 1 -type d | wc -l)
    find . -mindepth 1 -maxdepth 1 -type d | xargs -n 1 -P "$count" -I {} bash -c '
      cd "{}" &&
      echo -e "\033[1;33mRunning build_runner in {}\033[0m" &&
      fvm dart run build_runner build --delete-conflicting-outputs
  '
)

# Generate auto route files
(
    cd "navigation" || exit
    echo_styled "Generating auto route files in navigation" 33
    fvm dart run build_runner build --delete-conflicting-outputs
)
