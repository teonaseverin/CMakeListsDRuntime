/*
REQUIRED_ARGS: -HC=verbose
TEST_OUTPUT:
---
// Automatically generated by Digital Mars D Compiler v$n$

#pragma once

#include <stddef.h>
#include <stdint.h>


// ignoring function dtoh_verbose.foo because of linkage
// ignoring extern () block because of linkage
// ignoring function dtoh_verbose.bar because of linkage
// ignoring non-cpp struct S because of linkage
// ignoring non-cpp class C
// ignoring function dtoh_verbose.bar because it's extern
// ignoring variable dtoh_verbose.i1 because of linkage
// ignored function dtoh_verbose.templ!int.templ
---
*/

void foo() {}

extern (D) {
    int i;
}

void bar();

struct S {}

class C {}

extern(C++) void bar();

int i1;

void templ(T)(T t) {}

alias inst = templ!int;
