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
The system was tested using various configurations of initiators and participants, following the methods described in the previous sections:

- Initial Setup: The system was configured with 6 initiators and 20 participants (10 instances each) to handle two different tasks. After modifying the .java files (ProposalPool.java, JobNumber1.java, and JobNumber2.java) to log execution times, the system successfully processed all tasks in 38 seconds, from artifact creation to the completion of the last service.

- Scalability Tests: Additional tests were conducted by varying the numbers of initiators, participants, and simultaneous jobs, as outlined below:

1. Increased Initiators: Increasing the number of initiators to 30, with 15 assigned to Job1 and 15 to Job2, resulted in a total execution time of 2 minutes and 54 seconds. The number of jobs processed increased from 20 (initial setup) to 100 for Job1 and 45 for Job2.

2. Increased Participants: Doubling the number of participants from 20 to 40 (with 20 instances each) reduced the total execution time to 2 minutes and 11 seconds. The initial proposal receipt time remained almost the same (around 2023 ms).

3. Maximum Configuration: In a final test, 180 initiators were used (90 for each job), and participants were increased to 49 (24 for Job1 and 25 for Job2). The total execution time increased to 4 minutes and 13 seconds, with 89 jobs completed for Job2 and 212 for Job1.

These tests demonstrated that the system's performance is significantly influenced by the number of agents and their interactions. A higher number of initiators tends to increase the total execution time, while having more participants than initiators can speed up the process. Additionally, since all participants share the same artifacts, parallelism is limited, which could create a bottleneck for CPU usage.

Future improvements could explore the impact of parallelizing service execution or implementing mutual exclusion between services, especially to handle shared resources more efficiently.

## How to Run

### Prerequisites
- **JaCaMo**: Ensure you have JaCaMo installed. You can find the installation guide [here](http://jacamo.sourceforge.net/).
- **Docker**: For testing purposes, the system was run inside a Docker container.

### Running the System
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/cnp-jacamo.git
