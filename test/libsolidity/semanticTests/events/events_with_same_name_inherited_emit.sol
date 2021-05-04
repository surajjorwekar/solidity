contract A {
    event Deposit();
}

contract B {
    event Deposit(address _addr);
}

contract ClientReceipt is A, B {
    event Deposit(address _addr, uint _amount);
    function deposit() public returns (uint) {
        emit Deposit();
        return 1;
    }
    function deposit(address _addr) public returns (uint) {
        emit Deposit(_addr);
        return 1;
    }
    function deposit(address _addr, uint _amount) public returns (uint) {
        emit Deposit(_addr, _amount);
        return 1;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// deposit() -> 1
// - log[0]
// -   topic[0]: keccak256('Deposit()')
// deposit(address): 0x5082a85c489be6aa0f2e6693bf09cc1bbd35e988 -> 1
// - log[0]
// -   topic[0]: keccak256('Deposit(address)')
// -    data[0]: 0000000000000000000000005082a85c489be6aa0f2e6693bf09cc1bbd35e988 (address)
// deposit(address,uint256): 0x5082a85c489be6aa0f2e6693bf09cc1bbd35e988, 100 -> 1
// - log[0]
// -   topic[0]: keccak256('Deposit(address,uint256)')
// -    data[0]: 0000000000000000000000005082a85c489be6aa0f2e6693bf09cc1bbd35e988 (address)
// -    data[1]: 0000000000000000000000000000000000000000000000000000000000000064 (uint256)
