contract ClientReceipt {
    event Deposit(address indexed _from, bytes32 indexed _id, uint _value);
    constructor() {
        emit Deposit(msg.sender, bytes32("abc"), 7);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// constructor()
// - log[0]
// -   topic[0]: keccak256('Deposit(address,bytes32,uint256)')
// -   topic[1]: 0000000000000000000000001212121212121212121212121212120000000012 (address)
// -   topic[2]: 6162630000000000000000000000000000000000000000000000000000000000 (bytes32)
// -    data[0]: 0000000000000000000000000000000000000000000000000000000000000007 (uint256)
