// SPDX-License-Identifier:MIT 
// 如果没有license 某些编译器会报错，MIT 是限制最少的license之一，大多数的代码中会使用mit协议
pragma solidity ^0.8.8; 
// 视频中班版本是0.8.7，编译器版本可以在左侧切换
// 如果指定某个版本的更更高版本 使用 ^ 符号，例如：^0.8.25(任何币0.8.25更高的版本都使用这段代码)
// 指定版本分为 >=0.8.25 <0.9.0 这表示任何币0.8.25大，比0.9.0小的版本都适用
// evm :ethereum virtual machine(evm 就是往以太坊部署只能合约的一个标准)
//兼容evm的区块链有：avalanche，fantom，polygon..

contract SimpleStorage {
    //boolean unit int address bytes

    bool hasFavoriteNumber = false;
    // uint/int比较特殊，我们可以觉得给他分配的空间，
    //如果写成unit8，就是分配8个bit空间（按照byte分配空间，最低8bit），这个数字最大可以到256,默认是256
    //通常，把分配空间显示的写出来是一个好习惯
    uint8 favoriteNumber = 123; //无符号 
    int8 favoriteNumberInt = -1;
    //string 是一种bytes，但是只能存储文本 
    string favoriteNumberInText = "123";
    //bytes 类型后面跟的数字，代表给他们分配多少byte（空间范围【1-32】）
    //bytes 变量通常是 “0x”开头，将“123”赋值给bytes类型，会自动转换类型
    bytes3 favor = "123";
    //public ：visible external and internal(相当于给变量加上 gatter 方法)
    //private : only visible in the current contract
    //external ： only visible external(only for functions) - i.e can only be message-called(via this.func)
    //internal ：only visible internally
    //the default visibility is internal
    uint256 public favoriteNumber2;

    People public people = People({favoriteNumber:2,name:"name"});

    mapping(string=>uint256) public nameToNum; 
    
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // dynamic array
    People[] public peoples;
    //fixed-sized array
    People[10] public peoples2;


    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber2 = _favoriteNumber;
        // retrieve();
    }

    function storeAdd() public { 
        favoriteNumber2 ++;
    }

    //view and pure functions,when called alone,don't spend gas(pure 和 view 标识的函数调用不消耗gas；如果在消耗gas的函数中调用它则会消耗)
    //**只有更改合约状态才需要支付gas
    //view : 只读
    function retrieve() public view returns(uint256){
        return favoriteNumber2;
    }

    //pure ：不能修改、读取区块数据；做纯运算
    function add(uint128 a, uint128 b) public pure returns(uint256){
        return a + b;
    }

    // evm can access and store information in six places：
    //1.stack
    //2.memor  暂时存在，可修改的临时变量
    //3.storage  可修改的永久变量
    //4.calldata  暂时存在，不可修改的临时变量
    //5.code
    //6.logs
    function addPerson(string memory _name,uint256 _favoriteNumber) public {
        People memory newperson = People({favoriteNumber:_favoriteNumber,name:_name});
        peoples.push(newperson);

        nameToNum[_name] = _favoriteNumber;

    }




}