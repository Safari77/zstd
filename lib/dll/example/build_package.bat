@ECHO OFF
MKDIR bin\dll bin\static bin\example bin\include
SET CpyError=
COPY tests\fullbench.c bin\example\ || (SET CpyError=%CpyError% tests\fullbench.c)
COPY programs\datagen.c bin\example\ || (SET CpyError=%CpyError% programs\datagen.c)
COPY programs\datagen.h bin\example\ || (SET CpyError=%CpyError% programs\datagen.h)
COPY programs\util.h bin\example\ || (SET CpyError=%CpyError% programs\util.h)
COPY programs\platform.h bin\example\ || (SET CpyError=%CpyError% programs\platform.h)
COPY lib\common\mem.h bin\example\ || (SET CpyError=%CpyError% lib\common\mem.h)
COPY lib\common\zstd_internal.h bin\example\ || (SET CpyError=%CpyError% lib\common\zstd_internal.h)
COPY lib\common\error_private.h bin\example\ || (SET CpyError=%CpyError% lib\common\error_private.h)
COPY lib\common\xxhash.h bin\example\ || (SET CpyError=%CpyError% lib\common\xxhash.h)
COPY lib\libzstd.a bin\static\libzstd_static.lib || (SET CpyError=%CpyError% lib\libzstd.a)
COPY lib\dll\libzstd.* bin\dll\ || (SET CpyError=%CpyError% lib\dll\libzstd.*)
COPY lib\dll\example\Makefile bin\example\ || (SET CpyError=%CpyError% lib\dll\example\Makefile)
COPY lib\dll\example\fullbench-dll.* bin\example\ || (SET CpyError=%CpyError% lib\dll\example\fullbench)
COPY lib\dll\example\README.md bin\ || (SET CpyError=%CpyError% lib\dll\example\README.md)
COPY lib\zstd.h bin\include\ || (SET CpyError=%CpyError% lib\zstd.h)
COPY lib\zstd_errors.h bin\include\ || (SET CpyError=%CpyError% lib\zstd_errors.h)
COPY lib\dictBuilder\zdict.h bin\include\ || (SET CpyError=%CpyError% lib\dictBuilder\zdict.h)
COPY programs\zstd.exe bin\zstd.exe || (SET CpyError=%CpyError% programs\zstd.exe)

IF "[%CpyError%]" == "[]" goto :EOF

:error
echo Failed with error #%errorlevel%: unable to copy following files:
echo   %CpyError%
exit /b %errorlevel%

:EOF
