/* DISABLED: LDC_not_x86
TEST_OUTPUT:
---
fail_compilation/fail14009.d(12): Error: end of instruction expected, not `:`
---
*/

void main()
{
    asm {
      mov EAX, FS: 1 ? 2 : 3;     // accepted
      mov EAX, FS: 1 ? 2 : : 3;   // rejected
    }
}
