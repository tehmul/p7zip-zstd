#!/bin/sh

version_string="$1"
seven_zip='artifacts/7za-linux-x64'
source_artifact='stevedore-source/7za-source-p7zip.7z'

if [ ! "$version_string" ]; then
    echo "missing arg: version_string"
    exit 1
fi
if [ ! -f "$seven_zip" ]; then
    echo "7za not found at path: $seven_zip";
    exit 1
fi

mkdir -p stevedore-source stevedore-binary

rm -f "$source_artifact" && $seven_zip -m0=lzma -mx=9 a "$source_artifact" $(git ls-files)

artifact_hash="$(sha256sum "$source_artifact" | cut -f1 -d ' ')"
source_artifact_id="$(basename "$source_artifact" .7z)/${version_string}_${artifact_hash}.7z"
echo "Source artifact: $source_artifact_id"

generate_binary_license_file() {
    # Print first section (up until '##'), without trailing blank lines.
    echo "$(sed -n '/^##/q;p' LICENSE.md)"

    # Print extra section about source availability.
    cat <<EOD

The complete corresponding source code should be available from the same
server from which you downloaded this binary, with this artifact ID:

    ${source_artifact_id}

If the server was the public Unity-Technologies Stevedore repository:
https://public-stevedore.unity3d.com/r/public/${source_artifact_id}

You may find cloning the Git repository more convenient:
https://github.com/Unity-Technologies/7-Zip-zstd
https://github.com/Unity-Technologies/p7zip-zstd


EOD
    # Print remaining LICENSE.md sections.
    sed -n '/^##/,$p' LICENSE.md
}

tmp='build-artifact-tmp'
for bin in artifacts/*; do
    # Must use .zip format for the binary artifact, of course.
    artifact_filename="stevedore-binary/$(basename "$bin").zip"
    rm -f "$artifact_filename"

    rm -rf "$tmp"
    mkdir "$tmp"

    ln 'GPL-2.0.txt' "$tmp"
    generate_binary_license_file > "$tmp/LICENSE.md"
    ln "$bin" "$tmp/7za"
    chmod a+x "$tmp/7za"

    ( cd "$tmp" && "../$seven_zip" a "../$artifact_filename" . )
done
