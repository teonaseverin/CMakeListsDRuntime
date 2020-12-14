file(REMOVE_RECURSE
  "druntime-test-runner-debug"
  "druntime-test-runner-debug.pdb"
  "objects-unittest-debug/test_runner.o"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/druntime-test-runner-debug.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
