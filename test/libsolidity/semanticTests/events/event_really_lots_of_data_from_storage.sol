contract ClientReceipt {
    bytes x;
    event Deposit(uint fixeda, bytes dynx, uint fixedb);
    function deposit() public {
        x.push("A");
        x.push("B");
        x.push("C");
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
// -    data[3]: 0000000000000000000000000000000000000000000000000000000000000003
// -    data[4]: 4142430000000000000000000000000000000000000000000000000000000000
