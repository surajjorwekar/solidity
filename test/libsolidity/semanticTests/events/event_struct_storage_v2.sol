pragma abicoder v2;
contract C {
    struct S { uint a; }
    event E(S);
    S s;
    function createEvent(uint x) public {
        s.a = x;
        emit E(s);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// createEvent(uint256): 42 ->
// - log[0]
// -   topic[0]: db7c15eb416c7028693224ffb718d13661df9f900b8db24786c57612ee461dd4
// -    data[0]: 000000000000000000000000000000000000000000000000000000000000002a
