# Zeek Intelligence Feeds Extractor

This script extracts information from Zeek Intelligence Feed files and creates a CSV file with a timestamp.

## Overview

The script processes Zeek Intelligence Feed files (`.intel` format) to extract IP addresses along with their corresponding header values. It then generates a CSV file with a timestamp for each entry. Please note that you may use whatever file extension you feel like for the Zeek Intelligence Feed files and change the script according to your convenience.

## Usage

1. **Clone the repository to your local machine:**

   ```bash
   git clone https://github.com/samiul008ghub/zeek_ioc_extract.git


2. **Navigate to the script directory:**
   ```bash
   cd zeek-intel-extractor

3. **Run the script:**

   ```bash
   chmod +x zeek_ioc_ip_extract.sh

The script will process the .intel files in the specified directory and create a result_file.csv with a timestamp for each entry.

## Requirements
Bash (Unix shell)
awk

## File Structure
zeek_ioc_extract.sh: The main script file.
result_file.txt: Temporary file storing extracted data.
result_file.csv: Output CSV file with timestamps.
