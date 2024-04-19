#!/bin/bash

# Vérifier que le paramètre de saveur est spécifié
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <flavor>"
    exit 1
fi

flavor="$1"

# Fonction pour configurer Firebase
configure_firebase() {
    local project_name=""
    local ios_bundle_id=""
    local android_package_name=""
    local out_file=""

    case "$1" in
        "dev")
            project_name="rankai-dev"
            ios_bundle_id="com.labhouse.rankai.dev"
            android_package_name="com.labhouse.rankai.dev"
            out_file="lib/firebase_options_dev.dart"
            ;;
        "preprod")
            project_name="rankai-preprod"
            ios_bundle_id="com.labhouse.rankai.preprod"
            android_package_name="com.labhouse.rankai.preprod"
            out_file="lib/firebase_options_preprod.dart"
            ;;
        "prod")
            project_name="rankai-eu"
            ios_bundle_id="com.labhouse.rankai"
            android_package_name="com.labhouse.rankai"
            out_file="lib/firebase_options_prod.dart"
            ;;
        *)
            echo "Flavor '$1' non reconnu."
            exit 1
            ;;
    esac

    flutterfire configure \
        --project="$project_name" \
        --out="$out_file" \
        --platforms=android,ios \
        --ios-bundle-id="$ios_bundle_id" \
        --android-package-name="$android_package_name"
}

# Exécuter la configuration Firebase
configure_firebase "$flavor"

# Supprimer les fichiers inutiles
rm ios/Runner/GoogleService-Info.plist
rm android/app/google-services.json
rm ios/firebase_app_id_file.json
git checkout HEAD -- ios/Runner.xcodeproj/project.pbxproj

echo "Configuration Firebase terminée pour la saveur '$flavor'."
