# Design and Verification of I2C Communication Protocol

## 📌 Project Overview

This project focuses on the **design and functional verification of the Inter-Integrated Circuit (I2C) communication protocol** using Verilog HDL.

I2C is a serial communication protocol that enables communication between multiple integrated circuits using two bidirectional lines:

- **SDA (Serial Data Line):** Transfers data between devices.
- **SCL (Serial Clock Line):** Synchronizes data transfer.

The project demonstrates I2C communication through master and slave operations, including addressing, start and stop conditions, acknowledgements, and read/write data transfer.

## 🎯 Objectives

- Design an RTL model of the I2C communication protocol.
- Implement master-side communication logic using Verilog HDL.
- Verify the design using a Verilog testbench.
- Simulate I2C start and stop conditions, clock synchronization, and data transfer.
- Observe the SDA and SCL signals using simulation waveforms.

## ⚙️ Design Specifications

| Parameter | Description |
|---|---|
| Protocol | I2C |
| HDL | Verilog |
| Design module | `i2c_simple` |
| Testbench module | `tb_i2c_simple` |
| Data width | 8 bits |
| Slave address | `7'b1010000` |
| Write mode | `mode = 0` |
| Read mode | `mode = 1` |
| Data used in simulation | `8'h3C` |
| Clock | 100 ns testbench clock period |

## 📂 Repository Structure

```text
I2C-Communication-Protocol/
├── i2c_design.v    # I2C design module
├── i2c_tb.v        # Verilog testbench
└── README.md       # Project documentation
```

## 🔄 Working Principle

The I2C communication sequence follows these steps:

1. **Start Condition:** The master initiates communication by pulling SDA low while SCL is high.
2. **Address Transmission:** The master sends the 7-bit slave address followed by the read/write bit.
3. **Acknowledgement (ACK):** The design generates an acknowledgement phase.
4. **Data Transfer:** An 8-bit data value is transmitted serially over SDA, synchronized with SCL.
5. **Read/Write Operation:** The mode input selects the write or read data path.
6. **Stop Condition:** The master ends the communication by bringing SDA high while SCL is high.

## 🧪 Verification and Simulation

The testbench verifies the design by performing two operations:

- **Write Operation:** The master transmits the data value `8'h3C` (`60` decimal).
- **Read Operation:** The design selects the read-data input, also set to `8'h3C`, to demonstrate the read phase.

The testbench generates the clock and reset signals, applies the input values, and records the simulation waveform in a VCD file.

### Simulation Waveform

The waveform can be used to observe:

- Internal clock (`clk`)
- Write data (`data_wr`)
- Read data (`data_rd`)
- Operation mode (`mode`)
- Serial clock (`scl`)
- Serial data (`sda`)

The expected sequence demonstrates the start condition, address transmission, acknowledgement phases, data transfer, and stop condition.

> Note: The provided RTL is a simplified I2C demonstration model. Its ACK phases are driven internally, and the read phase selects a predefined data input rather than implementing a complete bidirectional I2C slave. Full protocol compliance requires additional verification.

## 🛠️ Tools Used

- **Verilog HDL:** RTL design and testbench development.
- **EDA Playground:** Online HDL simulation and waveform inspection.
- **Icarus Verilog:** An alternative simulator for running the Verilog files.
- **Xilinx FPGA tools:** Relevant for future synthesis and hardware implementation.

## 🚀 How to Run the Project

1. Clone or download this repository.
2. Open `i2c_design.v` and `i2c_tb.v` in your preferred Verilog simulator.
3. Select `tb_i2c_simple` as the simulation top module.
4. Compile both Verilog files.
5. Run the simulation.
6. Open the generated `i2c_simple.vcd` file in a waveform viewer to inspect SDA and SCL transitions.

### Example using Icarus Verilog

```bash
iverilog -o i2c_sim i2c_design.v i2c_tb.v
vvp i2c_sim
```

The testbench generates `i2c_simple.vcd`, which can be opened using GTKWave or another compatible waveform viewer.

## 📚 Applications

- Sensor interfacing in embedded systems.
- Communication with EEPROM and real-time clock devices.
- Internal communication between modules in System-on-Chip (SoC) designs.
- Reusable RTL IP development for VLSI applications.
- FPGA-based digital design and verification.

## 🔮 Future Scope

- Implement a complete bidirectional I2C master and slave.
- Add external ACK/NACK detection and proper bus handling.
- Support multiple slave devices and additional addressing scenarios.
- Verify timing requirements and corner cases.
- Implement and test the design on an FPGA board.

## ✅ Conclusion

This project demonstrates the RTL design and simulation of a simplified I2C communication sequence using Verilog HDL. The design illustrates start and stop conditions, address transmission, acknowledgement phases, and 8-bit read/write data selection. The testbench and waveform provide a foundation for further development toward a fully verified I2C controller.

---

**Project:** Design and Verification of I2C Communication Protocol  
**Domain:** VLSI Design and Verification  
**Language:** Verilog HDL  
**Institution:** Atria Institute of Technology  
**Academic Year:** 2025–2026
