contract ClientReceipt {
    event Deposit(address indexed _from, bytes32 indexed _id, uint indexed _value, uint indexed _value2, bytes32 data) anonymous;
    function deposit(bytes32 _id) public payable {
        emit Deposit(msg.sender, _id, msg.value, 2, "abc");
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// deposit(bytes32), 18 wei: 0x1234 ->
// - log[0]
// -   topic[0]: 0000000000000000000000001212121212121212121212121212120000000012
// -   topic[1]: 0000000000000000000000000000000000000000000000000000000000001234
// -   topic[2]: 0000000000000000000000000000000000000000000000000000000000000012
// -   topic[3]: 0000000000000000000000000000000000000000000000000000000000000002
// -    data[0]: 6162630000000000000000000000000000000000000000000000000000000000
