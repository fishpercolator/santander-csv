# santander-csv

This is a tool for converting a Santander Business Banking "Excel" file into a CSV.

## Overview

Santander Business Banking in the UK generates statements in a format it calls "Microsoft Excel", with a .xls extension, but are actually HTML files.

My accountancy application Clear Books requires files in CSV format. This tiny Ruby script converts the file to that format using Nokogiri.

## Usage

    ./santander-csv.rb Statements11111111111111.xls > output.csv

