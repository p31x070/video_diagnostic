# GEMINI.md - USB Camera Diagnostics Project

## Project Overview

This project provides a set of Bash scripts designed to diagnose and troubleshoot USB camera issues on Ubuntu/Linux systems. The primary goal is to create a robust information-gathering foundation to detect common failures related to drivers, PipeWire, V4L2, and access permissions.

The main components are:

*   **`diagnostico_camera.sh`**: The core script that performs the diagnostics.
*   **`config/config.env`**: A configuration file to customize the behavior of the scripts.
*   **`scripts/`**: A directory intended to hold the diagnostic and future correction scripts.
*   **`logs/`**: A directory to store the output of the diagnostic scripts.

## Building and Running

The project does not require a build process. The scripts can be executed directly.

**To run the diagnostic script:**

1.  Ensure the script has execution permissions:
    ```bash
    chmod +x diagnostico_camera.sh
    ```
2.  Run the script:
    ```bash
    ./diagnostico_camera.sh
    ```
    The output will be saved to a log file in the `logs/` directory.

## Development Conventions

*   Scripts are written in Bash.
*   Configuration is managed through environment variables in the `config/config.env` file.
*   The project follows a structured directory layout, separating scripts, logs, and configuration.
*   The `README.md` file provides a clear action plan for future development, including the creation of an automatic correction script and integration with `gemini-cli`.
