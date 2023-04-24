#!/bin/bash

# Read the list of GitHub repo names from repo-list.txt
repo_names=($(cat repo-list.txt))

# Iterate over the repo names
for repo_name in "${repo_names[@]}"; do
  # Clone the repo
  git clone "https://github.com/${repo_name}.git"

  # Get the name of the cloned directory
  repo_dir=$(basename "$repo_name")

  # Run cppcheck on the cloned directory
  cppcheck "$repo_dir" --output-file="output/${repo_dir}_cppcheck_output.txt"
  rm -rf "$repo_dir"
done

