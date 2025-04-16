# my_aes
AES coprocessor working in CBC or OFB mode using the memory-mapped interface technique


The objective of this project is to overcome design challenges and implement an AES coprocessor on the DE1-SoC FPGA board. Using Verilog HDL and the Platform Designer tool, a multi-stage design process involving the creation of a custom memory-mapped coprocessor module was tailored for AES encryption. This includes integrating an AES-128 coprocessor module and establishing a memory-mapped hardware-software interface between the FPGA's Hard Processor System (HPS) and the AES coprocessor. Additionally, one of two AES operation modes, Cipher Block Chaining (CBC) or Output Feedback Mode (OFB), was implemented to ensure that the coprocessor meets functional requirements and performance expectations. 

Custom Memory-Mapped Coprocessor Module: 
- Utilized Verilog HDL and the Platform Designer tool to design a custom memory-mapped coprocessor module tailored for AES encryption.
- Implemented a memory-mapped interface allowing read and write access to 16x32-bit memory locations.
- Designed the interface to accommodate input data for AES encryption, status registers, and output ciphertext.
- Incorporated control signals for initiating encryption operations, managing data transfer, and signaling completion status. 

AES-128 Coprocessor Module Integration: 
- Integrated an AES-128 coprocessor module, leveraging existing Verilog code or implementing a custom AES encryption module.
- Integrated the AES coprocessor into the memory-mapped interface, ensuring seamless interaction with the FPGA's processing system.
- Incorporated functionality for AES encryption operations, including key expansion, encryption rounds, and data processing according to the selected AES mode (CBC or OFB). 

Hardware/Software Interface: 
- Established a memory-mapped interface between the FPGA's Hard Processor System (HPS) and the AES coprocessor.
- Defined memory-mapped register addresses for accessing coprocessor control registers, input data buffers, and output data buffers.
- Designed a programmer's model specifying coprocessor instructions and command sequences for initiating AES encryption operations.
- Developed a C driver for the coprocessor, implementing functions for initializing the coprocessor, loading encryption keys and initialization vectors (IVs), initiating encryption operations, and retrieving ciphertext results.
- Implemented data transfer mechanisms between the HPS and the coprocessor, utilizing memory-mapped I/O operations and DMA (Direct Memory Access) for efficient data movement. 

CBC/OFB Mode Implementation: 
- Selected and implemented either the Cipher Block Chaining (CBC) or Output Feedback Mode (OFB) for AES encryption.
- Configured the coprocessor hardware interface and software driver to support the chosen mode of operation.
- Implemented additional functionality for managing IVs, chaining ciphertext blocks, and handling feedback mechanisms according to the selected AES mode


Test Output:
![image](https://github.com/user-attachments/assets/cb68093c-8811-49fa-90e2-ad7b6ce610ab)

