// REQUIRED_ARGS: -extern-std=c++98
// EXTRA_FILES: imports/plainpackage/plainmodule.d imports/pkgmodule/package.d imports/pkgmodule/plainmodule.d

// This file is intended to contain all compilable traits-related tests in an
// effort to keep the number of files in the `compilable` folder to a minimum.

// https://issues.dlang.org/show_bug.cgi?id=19152
module traits;

class C19152
{
    int OnExecute()
    {
        auto name = __traits(getOverloads, this, "OnExecute").stringof;
        return 0;
    }
}

static assert(is(typeof(__traits(getTargetInfo, "cppRuntimeLibrary")) == string));
version (CppRuntime_Microsoft)
{
    static assert(__traits(getTargetInfo, "cppRuntimeLibrary") == "libcmt" ||
                  __traits(getTargetInfo, "cppRuntimeLibrary")[0..6] == "msvcrt"); // includes mingw import libs
}

version (D_HardFloat)
    static assert(__traits(getTargetInfo, "floatAbi") == "hard");

version (Win64)
    static assert(__traits(getTargetInfo, "objectFormat") == "coff");
version (OSX)
    static assert(__traits(getTargetInfo, "objectFormat") == "macho");
version (linux)
    static assert(__traits(getTargetInfo, "objectFormat") == "elf");

static assert(__traits(getTargetInfo, "cppStd") == 199711);

import imports.plainpackage.plainmodule;
import imports.pkgmodule.plainmodule;

#line 40
struct MyStruct;

alias a = imports.plainpackage;
alias b = imports.pkgmodule.plainmodule;

static assert(__traits(isPackage, imports.plainpackage));
static assert(__traits(isPackage, a));
static assert(!__traits(isPackage, imports.plainpackage.plainmodule));
static assert(!__traits(isPackage, b));
static assert(__traits(isPackage, imports.pkgmodule));
static assert(!__traits(isPackage, MyStruct));

static assert(!__traits(isModule, imports.plainpackage));
static assert(!__traits(isModule, a));
static assert(__traits(isModule, imports.plainpackage.plainmodule));
static assert(__traits(isModule, b));
// This is supposed to work even though we haven't directly imported imports.pkgmodule.
static assert(__traits(isModule, imports.pkgmodule));
static assert(!__traits(isModule, MyStruct));

/******************************************/
// https://issues.dlang.org/show_bug.cgi?id=19942

static assert(!__traits(compiles, { a.init; }));
static assert(!__traits(compiles, { import m : a; a.init; }));

version(Windows)
    static assert(__traits(getLocation, MyStruct)[0] == `compilable\traits.d`);
else
    static assert(__traits(getLocation, MyStruct)[0] == "compilable/traits.d");
static assert(__traits(getLocation, MyStruct)[1] == 40);
static assert(__traits(getLocation, MyStruct)[2] == 1);

int foo();
int foo(int);

static assert(__traits(getLocation, __traits(getOverloads, traits, "foo")[1])[1] == 74);

mixin("int bar;");
static assert(__traits(getLocation, bar)[1] == 78);

struct Outer
{
    struct Nested{}

    void method() {}
}
static assert(__traits(getLocation, Outer.Nested)[1] == 83);
static assert(__traits(getLocation, Outer.method)[1] == 85);

/******************************************/
// https://issues.dlang.org/show_bug.cgi?id=19902
// Define hasElaborateCopyConstructor trait
// but done as two independent traits per conversation
// in https://github.com/dlang/dmd/pull/10265

struct S
{
    this (ref S rhs) {}
}

struct OuterS
{
    struct S
    {
        this (ref S rhs) {}
    }

    S s;
}

void foo(T)()
{
    struct S(U)
    {
        this (ref S rhs) {}
    }
    static assert (__traits(hasCopyConstructor, S!int));
}

struct U(T)
{
    this (ref U rhs) {}
}

struct SPostblit
{
    this(this) {}
}

struct DisabledPostblit
{
    @disable this(this);
}

struct NoCpCtor { }
class C19902 { }

static assert(__traits(hasCopyConstructor, S));
static assert(__traits(hasCopyConstructor, OuterS.S));
static assert(__traits(hasCopyConstructor, OuterS));
static assert(__traits(compiles, foo!int));
static assert(__traits(compiles, foo!S));
static assert(__traits(hasCopyConstructor, U!int));
static assert(__traits(hasCopyConstructor, U!S));
static assert(!__traits(hasPostblit, U!S));
static assert(__traits(hasPostblit, SPostblit));
static assert(!__traits(hasCopyConstructor, SPostblit));

static assert(!__traits(hasCopyConstructor, NoCpCtor));
static assert(!__traits(hasCopyConstructor, C19902));
static assert(!__traits(hasCopyConstructor, int));
static assert(!__traits(hasPostblit, NoCpCtor));
static assert(!__traits(hasPostblit, C19902));
static assert(!__traits(hasPostblit, int));

// Check that invalid use cases don't compile
static assert(!__traits(compiles, __traits(hasCopyConstructor)));
static assert(!__traits(compiles, __traits(hasCopyConstructor, S())));
static assert(!__traits(compiles, __traits(hasPostblit)));
static assert(!__traits(compiles, __traits(hasPostblit, S())));

static assert(__traits(isCopyable, int));
static assert(!__traits(isCopyable, DisabledPostblit));
struct S1 {}                        // Fine. Can be copied
struct S2 { this(this) {} }         // Fine. Can be copied
struct S3 { @disable this(this);  } // Not fine. Copying is disabled.
struct S4 { S3 s; }                 // Not fine. A field has copying disabled.
class C1 {}
static assert( __traits(isCopyable, S1));
static assert( __traits(isCopyable, S2));
static assert(!__traits(isCopyable, S3));
static assert(!__traits(isCopyable, S4));
static assert(__traits(isCopyable, C1));
static assert(__traits(isCopyable, int));
static assert(__traits(isCopyable, int[]));

enum E1 : S1 { a = S1(), }
enum E2 : S2 { a = S2(), }
enum E3 : S3 { a = S3(), }
enum E4 : S4 { a = S4(), }

static assert(__traits(isCopyable, E1));
static assert(__traits(isCopyable, E2));
static assert(!__traits(isCopyable, E3));
static assert(!__traits(isCopyable, E4));

struct S5
{
    @disable this(ref S5);
}
static assert(!__traits(isCopyable, S5));

/******************************************/
// https://issues.dlang.org/show_bug.cgi?id=20884

struct S20884
{
  int x;
}

alias T20884 = immutable(S20884);
enum m20884 = "x";

static assert(is(typeof(__traits(getMember, T20884, m20884)) == immutable(int))); // OK now
static assert(is(          typeof(mixin("T20884." ~ m20884)) == immutable(int)));
static assert(is(                           typeof(T20884.x) == immutable(int)));

/******************************************/
// https://issues.dlang.org/show_bug.cgi?id=20761

alias Seq(T...) = T;

static assert(__traits(isSame, Seq!(1, 2), Seq!(1, 2)));
static assert(!__traits(isSame, Seq!(1, 1), Seq!(2, 2)));
static assert(!__traits(isSame, Seq!(1, 1, 2), Seq!(1, 1)));
static assert(!__traits(isSame, Seq!(1, 1), Seq!(1, 1, 2)));

static assert(__traits(isSame,
    Seq!(string, wstring),
    Seq!(immutable(char)[], immutable(wchar)[]))
);

static assert(__traits(isSame,
    Seq!(i => i.value, (a, b) => a + b),
    Seq!(a => a.value, (x, y) => x + y)
));

static assert(__traits(isSame,
    Seq!(float, Seq!(double, Seq!real)),
    Seq!(Seq!(Seq!float, double), real)
));

static assert(!__traits(isSame,
    Seq!(int, Seq!(a => a + a)),
    Seq!(int, Seq!(a => a * a))
));
