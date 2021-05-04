contract A {
    event x();
}
contract B is A {
    function f() public returns (uint) {
        emit A.x();
        return 1;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1
// - log[0]
// -   topic[0]: keccak256('x()')
