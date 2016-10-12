cmake_minimum_required(VERSION 3.5)
project(sedumi VERSION 1.32 LANGUAGES C)

find_package(Matlab REQUIRED COMPONENTS MAIN_PROGRAM)

if(WIN32)
  set(SEDUMI_MATLAB_WAIT -wait)
endif()

add_custom_command(
  OUTPUT install_sedumi_output
  COMMAND "${Matlab_MAIN_PROGRAM}" -nojvm -nosplash -nodesktop -nodisplay ${SEDUMI_MATLAB_WAIT} -r "install_sedumi -rebuild,exit"
  WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/sedumi"
  COMMENT "Installing SeDuMi...")
set_property(SOURCE install_sedumi_output PROPERTY SYMBOLIC ON)

add_custom_target(install_sedumi ALL DEPENDS install_sedumi_output)

configure_file(addpath_sedumi.m.in addpath_sedumi.m @ONLY)
configure_file(rmpath_sedumi.m.in rmpath_sedumi.m @ONLY)

install(FILES
  "${CMAKE_CURRENT_BINARY_DIR}/addpath_sedumi.m"
  "${CMAKE_CURRENT_BINARY_DIR}/rmpath_sedumi.m"
  DESTINATION matlab)
