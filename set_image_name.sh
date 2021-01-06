#!/bin/bash
set -xe
PROJECT_ID="project2";
NEW_VERSION="123";
for CURRENT_IMAGE in $(find ./ -name "*.yml" | xargs grep -hEo "image: (gcr\.io.+)" |  grep -Eo "gcr.io.+");do
	base_image_path=$(echo $CURRENT_IMAGE | cut -d : -f 1);
	version=$(echo $CURRENT_IMAGE | cut -d : -f 2);
	if [ $version == "NONE" ]; then
		version=$NEW_VERSION;
	fi
	app_image_path=$(echo $base_image_path | cut -d / -f 3-);
	NEW_IMAGE="gcr.io/$PROJECT_ID/$app_image_path:$version";
	kustomize edit set image "$CURRENT_IMAGE"=$NEW_IMAGE
done;

kustomize build
