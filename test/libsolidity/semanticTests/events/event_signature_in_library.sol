pragma abicoder v2;
library L {
    struct S {
        uint8 a;
        int16 b;
    }
    event E(S indexed, S);
    function f() internal {
        S memory s;
        emit E(s, s);
    }
}
contract C {
    constructor() {
        L.f();
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// constructor()
// - log[0]
// -   topic[0]: de36958a609314d3ec594bea4ec463de5d1a213a4294213bca60d20e4dc69fa4
// -   topic[1]: ad3228b676f7d3cd4284a5443f17f1962b36e491b30a40b2405849e597ba5fb5
// -    data[0]: 0000000000000000000000000000000000000000000000000000000000000000
// -    data[1]: 0000000000000000000000000000000000000000000000000000000000000000
// gas legacy: 150662
