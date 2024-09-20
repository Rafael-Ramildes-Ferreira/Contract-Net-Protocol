// CArtAgO artifact code for project cnp

package pools;

import cartago.*;


public class ProposalPool extends Artifact {
	public void init() {
		defineObsProperty("status", "not started");
		System.out.println("[pool] Proposal pool created");
	}

	@OPERATION
	public void open(int id, int m) {
		updateObsProperty("status", "open");
		System.out.println("[pool] Proposal pool started");

		execInternalOp("countdown");
	}

	@OPERATION
	public void close() {
		updateObsProperty("status", "closed");
		System.out.println("[pool] Proposal pool has ended");
	}

	@OPERATION
	public void propose(Object proposer) {
		if(getObsProperty("status").getValue() == "open"){
			System.out.println("[pool] Receive a propose from " + proposer);
		} else {
			System.out.println("[pool] Refuse a propose from " + proposer + " due to timeout");
		} 
	}

	
	@INTERNAL_OPERATION
	private void countdown() {
		System.out.println("[pool] Proposal pool is counting down");
  
		try{
	  		Thread.sleep(2000);
		} catch (InterruptedException e) {
            Thread.currentThread().interrupt();  // Restore interrupted status
		}

		execInternalOp("close");
		// Apparently operations get buffered and can't execute simultaneously,
		// which means: proposals do not get stored while this countdown is happening.
		// Calling close directly (as below) would close before any one could propose
		// close();
	}

}

