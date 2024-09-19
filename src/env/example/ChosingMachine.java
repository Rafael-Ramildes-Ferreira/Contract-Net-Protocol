// CArtAgO artifact code for project cnp

package example;

import cartago.*;

public class ChosingMachine extends Artifact {
	void init(int initialValue) {
		defineObsProperty("status", "not started");
	}

	@OPERATION
	void open(Object[] id, Object[] m) {
		updateObsProperty("status", "open");
	}

	@OPERATION
	void propose(Object[] proposer) {
		System.out.println("Receive a propose from " + proposer);
	}

}

