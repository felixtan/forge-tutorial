// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
// import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function test_Add(uint256 x) public {
        uint256 prev = counter.number();
        counter.add(x);
        assertEq(counter.number(), prev + x);
    }
}

// works when importing Contract into global namespace
// contract CounterTest is Test, Counter {
//     // Counter public counter;

//     function setUp() public {
//         // counter = new Counter();
//         // counter.setNumber(0);
//     }

//     function test_Increment() public {
//         increment();
//         assertEq(number, 1);
//     }

//     function testFuzz_SetNumber(uint256 x) public {
//         setNumber(x);
//         assertEq(number, x);
//     }
// }
