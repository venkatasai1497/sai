#!/bin/bash

# AWS S3 bucket details
S3_BUCKET="your-s3-bucket"
S3_PREFIX="path/to/parent/folder"

# Output CSV file
CSV_FILE="s3_version_properties.csv"

# Fetch all version.properties files from the S3 bucket
aws s3api list-objects --bucket "$S3_BUCKET" --prefix "$S3_PREFIX" --output json | jq -r '.Contents[].Key' | grep 'version.properties' > /tmp/s3_files.txt

# Process each version.properties file
echo "s3_object,revision_id" > "$CSV_FILE"
while IFS= read -r s3_key; do
    revision_id=$(aws s3api get-object --bucket "$S3_BUCKET" --key "$s3_key" --output json | jq -r '.Metadata.revision_id')
    echo "$s3_key,$revision_id" >> "$CSV_FILE"
done < /tmp/s3_files.txt

# Clean up temporary file
rm -f /tmp/s3_files.txt

echo "CSV file '$CSV_FILE' created with S3 objects and revision_id information."
