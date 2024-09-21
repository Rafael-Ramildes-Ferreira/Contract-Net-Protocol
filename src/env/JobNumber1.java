package jobs;

import cartago.*;


public class JobNumber1 extends Artifact {
	// Don't know if it's necessary
	public void init() {
		System.out.println("[Job1] Starting JobNumber1 Artifact");
		return;
	}

	/**
	 * @brief Dummy function that only takes some time to finish
	 * @param wcet: Worst Case Execution Time in ms (it will always execute the worst case)
	 * 				Sets WCET to 1000 ms as default
	 */
	@OPERATION
	public void do_the_job(double wcet, OpFeedbackParam<Object> retval){
		System.out.println("[Job1] Starting the job");

		// This is both for safety and to be used to induce a failed execution if needed
		if(wcet < 0){
			System.out.println("[Job1] Job failed");
			retval.set("Execution Failed");
			return;
		}
  
		try{
	  		Thread.sleep((int)wcet);
		} catch (InterruptedException e) {
            Thread.currentThread().interrupt();  // Restore interrupted status
		}

		System.out.println("[Job1] Job done");
		retval.set("Done");
		return;
	}

	@OPERATION
	public void do_the_job(OpFeedbackParam<Object> retval){
		this.do_the_job(1000, retval);
	}
}
