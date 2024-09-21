
+!call_proposals(ID,M)
    :   desired_job(JobName)
    <-  .concat("pool", ID, ArtNameS);
        pool::makeArtifact(ArtNameS, "pools.ProposalPool", [], ArtId);
        pool::focus(ArtId);
        pool::open(ID,M);
        .print("Opening a proposal pool named ",ArtNameS,".");
        .broadcast(tell,open_proposal_pool(ArtId,JobName));
    .

+propose(AGENT)[source(AGENT)]
    <-  pool::propose(AGENT);
    .

+pool::status("closed")[artifact_name(ArtName)]
    <-  .print("Closing ",ArtName,".");
        .broadcast(untell,open_proposal_pool(ArtNameS));
    .

+pool::chosen(AGENT)[artifact_id(ArtId)]  // One for each chosen participator
    <-  .send(AGENT,achieve,do_the_job(ArtId));
    .

+pool::not_chosen(AGENT)[artifact_id(ArtId)]  // One for each not chosen participator
    <-  .my_name(ME);
        .send(AGENT,tell,not_chosen(ArtId));
    .

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }
