mkdir build	
cd build	
cmake .. -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -GNinja	
if errorlevel 1 exit 1	
ninja install	
if errorlevel 1 exit 1	
cd ../python	
python -m pip install -v . --config-settings use_system_libtreelite=True
if errorlevel 1 exit 1	
