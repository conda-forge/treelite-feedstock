mkdir build	
cd build	
cmake .. -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -GNinja	
if errorlevel 1 exit 1	
ninja install	
if errorlevel 1 exit 1	
cd ../python	
python -m pip install . -vvv ^
        --config-settings=wheel.platlib=false ^
        --config-settings=wheel.cmake=false
if errorlevel 1 exit 1	
