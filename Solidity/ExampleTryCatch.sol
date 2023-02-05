//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;


contract ExternalFunction{

    error customError(string errmessage);
    function checkError() public pure {
    // require(false,"got one error");
    // assert(false);
    revert customError("error1");
}
}


contract ExampleTryCatch{

event ErrorLogMessage(string reason);
event ErrorLogCode(uint code);
event ErrorLogBytes(bytes error);


function tryCatch() public{

    ExternalFunction externalFunction=new ExternalFunction();
    try externalFunction.checkError(){
        
    }
    catch Error (string memory message)
    {
        emit ErrorLogMessage(message);
    }
    catch Panic (uint code)
    {
        emit ErrorLogCode(code);
    }

    catch( bytes memory lowlevelData)
    {
        emit ErrorLogBytes(lowlevelData);
    }

}

}
