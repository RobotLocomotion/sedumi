cmake_minimum_required(VERSION 3.5)
project(sedumi VERSION 1.3 LANGUAGES C)

find_package(Matlab REQUIRED COMPONENTS MAIN_PROGRAM)

set(SEDUMI_MEX_DIR "${CMAKE_CURRENT_SOURCE_DIR}/sedumi")

set(SEDUMI_MEX_SOURCES
  "${SEDUMI_MEX_DIR}/adendotd.c"
  "${SEDUMI_MEX_DIR}/adenscale.c"
  "${SEDUMI_MEX_DIR}/auxfwdpr1.c"
  "${SEDUMI_MEX_DIR}/auxgivens.c"
  "${SEDUMI_MEX_DIR}/blkaux.c"
  "${SEDUMI_MEX_DIR}/blkchol.c"
  "${SEDUMI_MEX_DIR}/blkchol2.c"
  "${SEDUMI_MEX_DIR}/bwblkslv.c"
  "${SEDUMI_MEX_DIR}/bwdpr1.c"
  "${SEDUMI_MEX_DIR}/cholsplit.c"
  "${SEDUMI_MEX_DIR}/choltmpsiz.c"
  "${SEDUMI_MEX_DIR}/ddot.c"
  "${SEDUMI_MEX_DIR}/dpr1fact.c"
  "${SEDUMI_MEX_DIR}/eigK.c"
  "${SEDUMI_MEX_DIR}/extractA.c"
  "${SEDUMI_MEX_DIR}/eyeK.c"
  "${SEDUMI_MEX_DIR}/findblks.c"
  "${SEDUMI_MEX_DIR}/finsymbden.c"
  "${SEDUMI_MEX_DIR}/fwblkslv.c"
  "${SEDUMI_MEX_DIR}/fwdpr1.c"
  "${SEDUMI_MEX_DIR}/getada1.c"
  "${SEDUMI_MEX_DIR}/getada2.c"
  "${SEDUMI_MEX_DIR}/getada3.c"
  "${SEDUMI_MEX_DIR}/givensrot.c"
  "${SEDUMI_MEX_DIR}/incorder.c"
  "${SEDUMI_MEX_DIR}/invcholfac.c"
  "${SEDUMI_MEX_DIR}/iswnbr.c"
  "${SEDUMI_MEX_DIR}/makereal.c"
  "${SEDUMI_MEX_DIR}/ordmmd.c"
  "${SEDUMI_MEX_DIR}/ordmmdmex.c"
  "${SEDUMI_MEX_DIR}/partitA.c"
  "${SEDUMI_MEX_DIR}/psdframeit.c"
  "${SEDUMI_MEX_DIR}/psdinvjmul.c"
  "${SEDUMI_MEX_DIR}/qblkmul.c"
  "${SEDUMI_MEX_DIR}/qreshape.c"
  "${SEDUMI_MEX_DIR}/qrK.c"
  "${SEDUMI_MEX_DIR}/quadadd.c"
  "${SEDUMI_MEX_DIR}/reflect.c"
  "${SEDUMI_MEX_DIR}/sdmauxCmp.c"
  "${SEDUMI_MEX_DIR}/sdmauxCone.c"
  "${SEDUMI_MEX_DIR}/sdmauxFill.c"
  "${SEDUMI_MEX_DIR}/sdmauxRdot.c"
  "${SEDUMI_MEX_DIR}/sdmauxScalarmul.c"
  "${SEDUMI_MEX_DIR}/sdmauxTriu.c"
  "${SEDUMI_MEX_DIR}/sortnnz.c"
  "${SEDUMI_MEX_DIR}/spscale.c"
  "${SEDUMI_MEX_DIR}/sqrtinv.c"
  "${SEDUMI_MEX_DIR}/statsK.c"
  "${SEDUMI_MEX_DIR}/symbfwblk.c"
  "${SEDUMI_MEX_DIR}/symfct.c"
  "${SEDUMI_MEX_DIR}/symfctmex.c"
  "${SEDUMI_MEX_DIR}/triuaux.c"
  "${SEDUMI_MEX_DIR}/urotorder.c"
  "${SEDUMI_MEX_DIR}/vecsym.c"
  "${SEDUMI_MEX_DIR}/vectril.c"
  "${SEDUMI_MEX_DIR}/whichcpx.c")

set(SEDUMI_MEX_OUTPUTS
  "${SEDUMI_MEX_DIR}/adendotd.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/adenscale.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/blkchol.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/bwblkslv.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/bwdpr1.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/cholsplit.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/choltmpsiz.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/ddot.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/dpr1fact.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/eigK.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/extractA.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/eyeK.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/findblks.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/finsymbden.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/fwblkslv.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/fwdpr1.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/getada1.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/getada2.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/getada3.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/givensrot.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/incorder.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/invcholfac.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/iswnbr.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/makereal.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/ordmmdmex.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/partitA.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/psdframeit.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/psdinvjmul.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/qblkmul.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/qreshape.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/qrK.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/quadadd.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/sortnnz.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/sqrtinv.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/statsK.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/symbfwblk.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/symfctmex.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/urotorder.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/vecsym.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/vectril.${Matlab_MEX_EXTENSION}"
  "${SEDUMI_MEX_DIR}/whichcpx.${Matlab_MEX_EXTENSION}")

set(SEDUMI_INSTALL_LOG "${CMAKE_CURRENT_BINARY_DIR}/install_sedumi.log")

if(WIN32)
  set(SEDUMI_MATLAB_WAIT -wait)
endif()

add_custom_command(
  OUTPUT ${SEDUMI_MEX_OUTPUTS}
  COMMAND "${Matlab_MAIN_PROGRAM}" -logfile "${SEDUMI_INSTALL_LOG}" -nojvm -nosplash -nodesktop -nodisplay ${SEDUMI_MATLAB_WAIT} -r "install_sedumi,exit"
  DEPENDS ${SEDUMI_MEX_SOURCES}
  WORKING_DIRECTORY "${SEDUMI_MEX_DIR}"
  COMMENT "Installing sedumi...")

add_custom_target(install_sedumi ALL DEPENDS ${SEDUMI_MEX_OUTPUTS})

configure_file(addpath_sedumi.m.in addpath_sedumi.m @ONLY)
configure_file(rmpath_sedumi.m.in rmpath_sedumi.m @ONLY)

install(FILES
  "${CMAKE_CURRENT_BINARY_DIR}/addpath_sedumi.m"
  "${CMAKE_CURRENT_BINARY_DIR}/rmpath_sedumi.m"
  DESTINATION matlab)
