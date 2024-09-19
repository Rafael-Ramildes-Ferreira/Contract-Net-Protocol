// CArtAgO artifact code for project cnp

package pools;

import cartago.*;


public class ProposalPool extends Artifact {
	void init() {
		defineObsProperty("status", "not started");
		System.out.println("[pool] Proposal pool created");
	}

	@OPERATION
	void open(int id, int m) {
		updateObsProperty("status", "open");
		System.out.println("[pool] Proposal pool started");
	}

	@OPERATION
	void propose(Object[] proposer) {
		System.out.println("[pool] Receive a propose from " + proposer);
	}

}

