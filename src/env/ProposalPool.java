// CArtAgO artifact code for project cnp

package pools;

import cartago.*;


public class ProposalPool extends Artifact {
	public void init() {
		defineObsProperty("status", "not started");
	}

	@OPERATION
	public void open(Object[] id, Object[] m) {
		updateObsProperty("status", "open");
	}

	@OPERATION
	public void propose(Object[] proposer) {
		System.out.println("Receive a propose from " + proposer);
	}

}

