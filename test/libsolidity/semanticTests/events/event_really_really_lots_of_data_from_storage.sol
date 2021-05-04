contract ClientReceipt {
    bytes x;
    event Deposit(uint fixeda, bytes dynx, uint fixedb);
    function deposit() public {
        x = new bytes(31);
        x[0] = "A";
        x[1] = "B";
        x[2] = "C";
        x[30] = "Z";
        emit Deposit(10, x, 15);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// deposit() ->
// - log[0]
// -   topic[0]: keccak256('Deposit(uint256,bytes,uint256)')
// -    data[0]: 000000000000000000000000000000000000000000000000000000000000000a (uint256)
// -    data[1]: 0000000000000000000000000000000000000000000000000000000000000060 (bytes)
// -    data[2]: 000000000000000000000000000000000000000000000000000000000000000f (uint256)
// -    data[3]: 000000000000000000000000000000000000000000000000000000000000001f
// -    data[4]: 4142430000000000000000000000000000000000000000000000000000005a00
