contract ClientReceipt {
    event Deposit();
    function deposit() public {
        emit Deposit();
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// deposit() ->
// - log[0]
// -   topic[0]: keccak256('Deposit()')
