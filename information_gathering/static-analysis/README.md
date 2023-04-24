# Static code analysis

This directory contains the results of the static code analysis using [Cppcheck](https://cppcheck.sourceforge.io/). The repos analyzed are a subset of the [Smarc Project](https://github.com/smarc-project/) and listed in [repo-list.txt](repo-list.txt). I excluded the repos that were specific to the robot LoLo or archived. In total, 35 repos were analyzed. Of them 21 contained C++/C code and potential bugs were identified in 9 of them.

## Procedure

One by one, the repositories were:

1. Cloned.
1. Analyzed using Cppcheck and the output redirected to a file.
1. Removed.

The processes was automated in the script: [analysis-script.sh](analysis-script.sh).

## Results

The table below shows a summary of the results. Many of the issues were false positives. There are cases were the input is assumed to be of a specific form and not validated properly. This could potentially introduce vulnerabilities. For the full output from the analysis, see [output](./output/)

| **Repository**               | **Result**                   | **Comments**                                                                                                                                                                             |
| ---------------------------- | ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| auvlib                       | Potential bugs identified    | Improperly validated input could lead to use of an unitialized variable and memory leak.                                                                                                 |
| imc_ros_bridge               | Potential bugs identified    | False positive due to too many #ifdefs for cppcheck                                                                                                                                      |
| roswasm_suite                | Potential bugs identified    | Unkown macros. Too many #ifdefs. Failed to find header files. Potential use of va_list before va_start invocation. Improperly validated input could lead to use of unitialized variable. |
| roswasm_suite_native         | Potential bugs identified    | Unkown macros. Too many #ifdefs. Failed to find header files. Potential use of va_list before va_start invocation. Improperly validated input could lead to use of unitialized variable. |
| sbg_ros_driver               | Potential bugs identified    | Falsely identified null pointer derefence                                                                                                                                                |
| smarc_navigation             | Potential bugs identified    | Falsely identified null pointers and issues related to redefinitions in .h files.                                                                                                        |
| smarc_simulations            | Potential bugs identified    | Unknown macros.                                                                                                                                                                          |
| stim300                      | Potential bugs identified    | Improperly validated input could lead to missing return.                                                                                                                                 |
| uuv_simulator                | Potential bugs identified    | Unknown macros.                                                                                                                                                                          |
| sam_common                   | No potential bugs identified |                                                                                                                                                                                          |
| sam_webgui                   | No potential bugs identified |                                                                                                                                                                                          |
| sam_webgui_native            | No potential bugs identified |                                                                                                                                                                                          |
| sbg_ros_driver               | Potential bugs identified    | Falsily identified null pointer derefence                                                                                                                                                |
| SBUS                         | No potential bugs identified |                                                                                                                                                                                          |
| smarc_base                   | No C++ or C files found      |                                                                                                                                                                                          |
| smarc_controllers            | No potential bugs identified |                                                                                                                                                                                          |
| smarc_desktop                | No C++ or C files found      |                                                                                                                                                                                          |
| smarc_docs                   | No C++ or C files found      |                                                                                                                                                                                          |
| smarc_missions               | No potential bugs identified |                                                                                                                                                                                          |
| smarc_msgs                   | No C++ or C files found      |                                                                                                                                                                                          |
| smarc_navigation             | Potential bugs identified    | Falsily identified null pointers and issues related to redefinitiions in .h files.                                                                                                       |
| smarc_nodered                | No C++ or C files found      |                                                                                                                                                                                          |
| smarc_perception             | No C++ or C files found      |                                                                                                                                                                                          |
| smarc_releases               | No C++ or C files found      |                                                                                                                                                                                          |
| smarc_scenarios              | No C++ or C files found      |                                                                                                                                                                                          |
| smarc_simulations            | Potential bugs identified    | Unknown macros.                                                                                                                                                                          |
| smarc_stonefish_sims         | No potential bugs identified |                                                                                                                                                                                          |
| smarc_uavcan_services        | No C++ or C files found      |                                                                                                                                                                                          |
| smarc_utils                  | No potential bugs identified |                                                                                                                                                                                          |
| smarc-project.github.io      | No C++ or C files found      |                                                                                                                                                                                          |
| stim300                      | Potential bugs identified    | "Missing return due to no default in switch statement. All enum cases are, however, covered."                                                                                            |
| stonefish_ros                | No potential bugs identified |                                                                                                                                                                                          |
| test-ros-wasm-release-action | No C++ or C files found      |                                                                                                                                                                                          |
| uavcan_ros_bridge            | No potential bugs identified |                                                                                                                                                                                          |
| uuv_simulator                | Potential bugs identified    | Unknown macros.                                                                                                                                                                          |
