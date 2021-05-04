contract ClientReceipt {
    event Deposit() anonymous;
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
