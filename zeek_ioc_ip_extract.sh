#!/bin/bash

# Output file for results
result_file="result_file.txt"

# Header line
echo "#fields indicator       indicator_type  meta.source     meta.do_notice  meta.desc" > "$result_file"

# Iterate through each file in the directory
for file in *.intel; do
    echo "Processing file: $file"

    # Extract IP addresses along with their corresponding header values and append to the result file
    awk '/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/ {print $0}' "$file" >> "$result_file"
done

echo "Script completed. Results are stored in $result_file"

# Specify the path to the directory containing your intel files
INTEL_DIR="/opt/zeek/share/zeek/site/Zeek-Intelligence-Feeds/"

# Specify the path to the output files
CSV_FILE="${INTEL_DIR}/result_file.csv"

# Remove the existing CSV file
rm -f "$CSV_FILE"

# Add the header line, including timestamp, to the CSV file
echo "timestamp,indicator,indicator_type,meta.source,meta.do_notice,meta.desc" >> "$CSV_FILE"

# Loop through each intel file and extract relevant information
for FILE in "$INTEL_DIR"/*.intel; do
    # Extract timestamp from the file name (assuming the file name contains a timestamp)
    timestamp=$(echo "$FILE" | awk -F '/' '{split($NF,a,"."); print a[1]}')

    # Get the current timestamp in the specified format
    current_timestamp=$(date -u +"%Y-%m-%dT%H:%M:%S.%3N")

    # Append timestamp and IP addresses along with their corresponding header values to the CSV file
    awk -v ts="$timestamp" -v cts="$current_timestamp" '/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/ {print cts","ts","$0}' "$FILE" | awk -F '\t' '{print $1","$2","$3","$4","$5","$6}' >> "$CSV_FILE"
done

# Display the CSV file
cat "$CSV_FILE"
