contract C {
    event E(uint[]);
    uint[] arr;
    function createEvent(uint x) public {
        while (arr.length < 3)
            arr.push();
        arr[0] = x;
        arr[1] = x + 1;
        arr[2] = x + 2;
        emit E(arr);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// createEvent(uint256): 42 ->
// - log[0]
// -   topic[0]: keccak256('E(uint256[])')
// -    data[0]: 0000000000000000000000000000000000000000000000000000000000000020 (uint256[])
// -    data[1]: 0000000000000000000000000000000000000000000000000000000000000003
// -    data[2]: 000000000000000000000000000000000000000000000000000000000000002a
// -    data[3]: 000000000000000000000000000000000000000000000000000000000000002b
// -    data[4]: 000000000000000000000000000000000000000000000000000000000000002c
// gas legacy: 119293
