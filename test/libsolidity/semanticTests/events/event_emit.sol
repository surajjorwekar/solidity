contract ClientReceipt {
    event Deposit(address indexed _from, bytes32 indexed _id, uint _value);
    function deposit(bytes32 _id) public payable {
        emit Deposit(msg.sender, _id, msg.value);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// deposit(bytes32), 18 wei: 0x1234 ->
// - log[0]
// -   topic[0]: keccak256('Deposit(address,bytes32,uint256)')
// -   topic[1]: 0000000000000000000000001212121212121212121212121212120000000012 (address)
// -   topic[2]: 0000000000000000000000000000000000000000000000000000000000001234 (bytes32)
// -    data[0]: 0000000000000000000000000000000000000000000000000000000000000012 (uint256)
