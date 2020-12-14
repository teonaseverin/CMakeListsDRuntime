// REQUIRED_ARGS: -w
// https://issues.dlang.org/show_bug.cgi?id=4375: Dangling else
/*
TEST_OUTPUT:
---
fail_compilation/fail4375u.d(13): Warning: else is dangling, add { } after condition at fail_compilation/fail4375u.d(11)
---
*/

static if (true)
    static if (false)
        struct G1 {}
else
    struct G2 {}

