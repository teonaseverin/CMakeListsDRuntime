file(REMOVE_RECURSE
  "druntime-test-runner"
  "druntime-test-runner.pdb"
  "objects-unittest/test_runner.o"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/druntime-test-runner.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
