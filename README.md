# Contract Net Protocol Implementation Using JaCaMo

This repository contains the implementation of a multi-agent system based on the **Contract Net Protocol (CNP)**. The system is developed using the **JaCaMo** platform, which integrates **Jason** for agent programming, **CArtAgO** for environment programming, and **Moise** for organizational modeling.

## Table of Contents
- [Project Overview](#project-overview)
- [System Architecture](#system-architecture)
- [Key Files](#key-files)
- [Testing and Results](#testing-and-results)
- [How to Run](#how-to-run)
- [Contributors](#contributors)
- [License](#license)

## Project Overview

The goal of this project is to model a multi-agent system where an **Initiator agent** requests one or more **Participant agents** to perform a task. The system optimizes the selection of participants based on specific criteria such as:
- Execution time
- Cost
- First-come-first-served basis

This implementation uses the **Contract Net Protocol**, where the Initiator sends requests for proposals (RFPs) to the Participant agents, which respond with bids. The Initiator then selects the best participants according to the criteria mentioned above.

## System Architecture

- **Initiator agents**: Responsible for initiating the contract by sending RFPs.
- **Participant agents**: Responsible for submitting proposals to complete tasks. The participants use a random cost generator and task execution time estimator.
- **Proposal Pool**: An artifact that handles the collection and selection of proposals, with mechanisms to sort proposals by different criteria such as execution time, cost, or arrival time.

The system was tested using different configurations for the number of Initiators and Participants, with performance metrics collected for each test.

## Key Files

### 1. `cnp.jcm`
This is the main configuration file for the project, defining which agents are instantiated and how the environment is structured. Key agents like `initiator.asl` and `participator.asl` are defined here.

### 2. `ProposalPool.java`
This Java class manages the pool of proposals. It stores the proposals and handles timeouts. The class provides different methods for selecting participants based on:
- **Arrival time**
- **Execution time (Worst-Case Execution Time - WCET)**
- **Cost**

### 3. `initiator.asl`
Defines the behavior of Initiator agents. Each Initiator sends a request for proposals and processes the received bids based on the chosen selection method.

### 4. `participator.asl`
Defines the behavior of Participant agents. Each participant generates bids using random values for cost and execution time.

### 5. `JobNumber1.java` and `JobNumber2.java`
These classes simulate the execution of tasks. They accept execution time as an input and return either a successful or failed execution status based on the provided time.

## Testing and Results

The system was tested using different configurations of Initiators and Participants:
- **Initial Setup**: 6 Initiators and 20 Participants (10 instances each) with two different jobs. The system performed well under this setup, processing all tasks in 38 seconds.
- **Scalability Tests**: Increasing the number of Initiators and Participants showed how the system's performance evolved. For example:
  - 20 Initiators resulted in an increase in execution time to 63 seconds.
  - Increasing the number of Participants to 20 reduced execution time to 24 seconds.
  - Increasing the number of Initiators to 50 increased execution time to 167 seconds.

These tests demonstrated that the system's performance is highly influenced by the number of agents and the nature of the tasks.

## How to Run

### Prerequisites
- **JaCaMo**: Ensure you have JaCaMo installed. You can find the installation guide [here](http://jacamo.sourceforge.net/).
- **Docker**: For testing purposes, the system was run inside a Docker container.

### Running the System
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/cnp-jacamo.git
