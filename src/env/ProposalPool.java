// CArtAgO artifact code for project cnp

package pools;

import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;

import cartago.*;


public class ProposalPool extends Artifact {
	private class TaskProposal {
		private String Name;
		private double wcet;
		private double cost;
	
		// Constructor
		public TaskProposal(String Name, double wcet, double cost) {
			this.Name = Name;
			this.wcet = wcet;
			this.cost = cost;
		}
	
		// Getters
		public String getName() {
			return this.Name;
		}
	
		public double getWcet() {
			return this.wcet;
		}
	
		public double getCost() {
			return this.cost;
		}
	}

	private List<TaskProposal> prposers;
	private int number_to_choose;

	public void init() {
		this.prposers = new ArrayList<>();
		defineObsProperty("status", "not started");
		System.out.println("[pool] Proposal pool created");
	}

	@OPERATION
	public void open(int id, int m) {
		this.number_to_choose = m;

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
	public void choose_by_arrival() {
		if(this.prposers != null){
			int i = 0;
			for(TaskProposal p : this.prposers){
				if(i++ < this.number_to_choose){
					defineObsProperty("chosen", p.getName());
				} else {
					defineObsProperty("not_chosen", p.getName());
				}
			}
		}
	}

	@OPERATION
	public void choose_by_cost() {
		this.prposers.sort(Comparator.comparing(TaskProposal::getCost));

		this.choose_by_arrival();
	}

	@OPERATION
	public void choose_by_wcet() {
		this.prposers.sort(Comparator.comparing(TaskProposal::getWcet));

		this.choose_by_arrival();
	}

	@OPERATION
	public void propose(Object proposer, double wcet, double cost) {
		if(getObsProperty("status").getValue() == "open"){
			System.out.println("[pool] Receive a propose from " + proposer);
			this.prposers.add(new TaskProposal(proposer.toString(), wcet, cost));
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

