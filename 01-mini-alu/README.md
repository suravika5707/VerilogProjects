8-Bit Mini ALU

An 8-bit Arithmetic Logic Unit (ALU) designed using Verilog HDL. This project implements basic arithmetic and logical operations using combinational logic and verifies the functionality through a Verilog testbench and simulation waveforms.

1. Project Overview

The Mini ALU performs arithmetic and bitwise logical operations on two 8-bit inputs based on a 3-bit opcode.

The design is implemented using combinational logic, with no clock or reset input.

2. Features

- 8-bit input operands
- 3-bit operation selector (opcode)
- Eight arithmetic and logical operations
- Zero flag
- Carry flag
- Signed overflow flag
- Verilog testbench for functional verification
- Simulation waveform for output analysis

3. Supported Operations

| Opcode | Operation | Description              |
| :---   | :---      | :---                     |
|  `000` | ADD       | Addition of A and B      |
|  `001` | SUB       | Subtraction of B from A  |
|  `010` | AND       | Bitwise AND              |
|  `011` | OR        | Bitwise OR               |
|  `100` | XOR       | Bitwise XOR              |
|  `101` | NOT       | Bitwise NOT of A         |
|  `110` | SLL       | Shift A left by one bit  |
|  `111` | SRL       | Shift A right by one bit |

4. Input and Output Signals

| Signal   |  Width | Description                                      |
| :---     | :---   | :---                                             |
| A        | 8 bits | First operand                                    |
| B        | 8 bits | Second operand                                   |
| opcode   | 3 bits | Selects the ALU operation                        |
| result   | 8 bits | Operation result                                 |
| zero     |  1 bit | Indicates whether the result is zero             |
| carry    |  1 bit | Carry/no-borrow status for arithmetic operations |
| overflow |  1 bit | Indicates signed arithmetic overflow             |

5. Project Structure

01-mini-alu/
│
├──alu.v
│
├──alu_tb.v
│
├──01-mini-alu-waveform.png
│
└── README.md

6. Design Methodology

The ALU uses combinational logic to select and perform the requested operation.

The opcode is decoded using a `case` statement. Based on the selected operation, the corresponding arithmetic or logical result is generated.

The status flags are evaluated according to the operation being performed.

7. Verification

The design was verified using a separate Verilog testbench.

The testbench applies input combinations for the supported operations and checks the corresponding outputs.

Simulation waveforms were inspected to verify the behaviour of the ALU.

Verification coverage

- Arithmetic operations: ADD and SUB
- Logical operations: AND, OR, XOR and NOT
- Shift operations: SLL and SRL
- Zero-result conditions
- Carry and overflow conditions

8. Tools Used

- Verilog HDL
- Visual Studio Code
- Icarus Verilog
- GTKWave
- Git and GitHub

9. Learning Outcomes

Through this project, I explored:

- Combinational circuit design using Verilog
- Opcode-based operation selection
- Arithmetic and bitwise operators
- ALU status flags
- Testbench development
- Simulation waveform analysis
- RTL debugging and verification

10. Future Improvements

- Extend the ALU with additional operations.
- Add configurable shift amounts.
- Integrate the ALU into a simple processor datapath.

