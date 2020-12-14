file(REMOVE_RECURSE
  "objects-unittest/test_runner.o"
  "phobos2-test-runner"
  "phobos2-test-runner.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/phobos2-test-runner.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
