# BPSK Modulator in Verilog (LUT & Square Carrier)

## Overview
This project implements a **Binary Phase Shift Keying (BPSK) modulator** using Verilog HDL, where the carrier signal is modulated based on the input data bit through phase inversion.

Two carrier generation approaches are explored:
- **LUT-based cosine waveform** using discrete sample storage  
- **Square wave carrier** for simplified modulation comparison  

The design is verified through ModelSim simulations, focusing on **synchronous behavior, timing correctness, and phase inversion validation** under different input conditions.
---

## ⚙️ Architecture
Carrier Generator (LUT / Square) → BPSK Modulator → Output


- **Carrier Generator**: Produces waveform samples (cosine or square)
- **BPSK Modulator**: Performs phase inversion based on input data bit

---

## 🔑 Key Logic

BPSK modulation rule:


data_bit = 1 → out = carrier
data_bit = 0 → out = -carrier


---

## 📂 Repository Structure


/src
bpsk.v
cos_carrier.v
square_carrier.v
/tb
bpsk_tb.v
/docs
waveform_cos.png
waveform_square.png
README.md


---

## 🧠 Design Details

- Carrier generated using **LUT (Look-Up Table)** for cosine approximation  
- Square wave carrier implemented for comparison  
- Synchronous design using **posedge clock**  
- Uses **signed arithmetic** for phase inversion  
- Observed **1-cycle latency** due to non-blocking assignments  

---

## 🐞 Debugging & Validation

- Fixed mismatch caused by improper stimulus timing (race condition in TB)  
- Ensured input signals are stable before clock edge  
- Verified correct phase inversion for both positive and negative carrier values  
- Cross-checked waveform behavior with expected BPSK output  

---

## 📊 Results

### 🔹 Cosine Carrier BPSK Output
![Cosine Waveform](docs/waveform_cos.png)

### 🔹 Square Carrier BPSK Output
![Square Waveform](docs/waveform_square.png)

---

## ▶️ Simulation

Run in ModelSim:

```tcl
vlib work
vmap work work

vlog src/*.v
vlog tb/*.v

vsim work.bpsk_tb
add wave *
run -all
