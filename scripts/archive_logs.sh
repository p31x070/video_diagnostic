#!/bin/bash
# Script to archive old log files.

LOG_DIR="../logs"

cd $LOG_DIR

# Find all log files, sort them by modification time (oldest first),
# and exclude the newest one.
LOG_FILES_TO_ARCHIVE=$(ls -t *.log | tail -n +2)

if [ -n "$LOG_FILES_TO_ARCHIVE" ]; then
  # Create a zip file with the old logs.
  zip -uq logs_archive.zip $LOG_FILES_TO_ARCHIVE

  # Remove the old log files.
  rm $LOG_FILES_TO_ARCHIVE

  echo "Logs arquivados em logs_archive.zip"
else
  echo "Nenhum log antigo para arquivar."
fi
