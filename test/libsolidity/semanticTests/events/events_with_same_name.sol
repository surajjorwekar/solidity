contract ClientReceipt {
    event Deposit();
    event Deposit(address _addr);
    event Deposit(address _addr, uint _amount);
    event Deposit(address _addr, bool _flag);
    function deposit() public returns (uint) {
        emit Deposit();
        return 1;
    }
    function deposit(address _addr) public returns (uint) {
        emit Deposit(_addr);
        return 2;
    }
    function deposit(address _addr, uint _amount) public returns (uint) {
        emit Deposit(_addr, _amount);
        return 3;
    }
    function deposit(address _addr, bool _flag) public returns (uint) {
        emit Deposit(_addr, _flag);
        return 4;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// deposit() -> 1
// - log[0]
// -   topic[0]: keccak256('Deposit()')
// deposit(address): 0x5082a85c489be6aa0f2e6693bf09cc1bbd35e988 -> 2
// - log[0]
// -   topic[0]: keccak256('Deposit(address)')
// -    data[0]: 0000000000000000000000005082a85c489be6aa0f2e6693bf09cc1bbd35e988 (address)
// deposit(address,uint256): 0x5082a85c489be6aa0f2e6693bf09cc1bbd35e988, 100 -> 3
// - log[0]
// -   topic[0]: keccak256('Deposit(address,uint256)')
// -    data[0]: 0000000000000000000000005082a85c489be6aa0f2e6693bf09cc1bbd35e988 (address)
// -    data[1]: 0000000000000000000000000000000000000000000000000000000000000064 (uint256)
// deposit(address,bool): 0x5082a85c489be6aa0f2e6693bf09cc1bbd35e988, false -> 4
// - log[0]
// -   topic[0]: keccak256('Deposit(address,bool)')
// -    data[0]: 0000000000000000000000005082a85c489be6aa0f2e6693bf09cc1bbd35e988 (address)
// -    data[1]: 0000000000000000000000000000000000000000000000000000000000000000 (bool)
