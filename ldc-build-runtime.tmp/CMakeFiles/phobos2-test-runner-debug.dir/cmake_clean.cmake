file(REMOVE_RECURSE
  "objects-unittest-debug/test_runner.o"
  "phobos2-test-runner-debug"
  "phobos2-test-runner-debug.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/phobos2-test-runner-debug.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
