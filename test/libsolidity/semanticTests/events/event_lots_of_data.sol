contract ClientReceipt {
    event Deposit(address _from, bytes32 _id, uint _value, bool _flag);
    function deposit(bytes32 _id) public payable {
        emit Deposit(msg.sender, _id, msg.value, true);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// deposit(bytes32), 18 wei: 0x1234 ->
// - log[0]
// -   topic[0]: keccak256('Deposit(address,bytes32,uint256,bool)')
// -    data[0]: 0000000000000000000000001212121212121212121212121212120000000012 (address)
// -    data[1]: 0000000000000000000000000000000000000000000000000000000000001234 (bytes32)
// -    data[2]: 0000000000000000000000000000000000000000000000000000000000000012 (uint256)
// -    data[3]: 0000000000000000000000000000000000000000000000000000000000000001 (bool)
