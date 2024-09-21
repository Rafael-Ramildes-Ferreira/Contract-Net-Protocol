package jobs;

import cartago.*;


public class JobNumber1 extends Artifact {
	// Don't know if it's necessary
	public void init() {
		System.out.println("[Job] Starting JobNumber1 Artifact");
		return;
	}

	/**
	 * @brief Dummy function that only takes some time to finish
	 * @param wcet: Worst Case Execution Time in ms (it will always execute the worst case)
	 * 				Sets WCET to 1000 ms as default
	 */
	@OPERATION
	public void do_the_job(int wcet, OpFeedbackParam<Object> retval){
		System.out.println("[Job] Starting the job");

		// This is both for safety and to be used to induce a failed execution if needed
		if(wcet < 0){
			retval.set("Execution Failed");
			return;
		}
  
		try{
	  		Thread.sleep(wcet);
		} catch (InterruptedException e) {
            Thread.currentThread().interrupt();  // Restore interrupted status
		}

		retval.set("Done");
		return;
	}

	@OPERATION
	public void do_the_job(OpFeedbackParam<Object> retval){
		this.do_the_job(1000, retval);
	}
}
