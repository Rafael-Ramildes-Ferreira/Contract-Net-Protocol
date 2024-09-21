chossing_method("wcet").

+!call_proposals(ID,M)
    :   desired_job(JobName)
    <-  .wait(50);
        .my_name(ME);
        .concat(ME, "pool", MyPool);
        .concat(MyPool, ID, ArtNameS);
        pool::makeArtifact(ArtNameS, "pools.ProposalPool", [], ArtId);
        pool::focus(ArtId);
        pool::open(ID,M);
        .print("Opening a proposal pool named ",ArtNameS,".");
        .broadcast(tell,open_proposal_pool(ArtId,JobName));
    .

+propose(AGENT,X,Y)[source(AGENT)]
    <-  pool::propose(AGENT,X,Y);
    .

+pool::status("closed")[artifact_name(ArtName)]
    :   chossing_method("arrival")
    <-  .print("Closing ",ArtName,".");
        .broadcast(untell,open_proposal_pool(ArtNameS));
        pool::choose_by_arrival;
    .

+pool::status("closed")[artifact_name(ArtName)]
    :   chossing_method("cost")
    <-  .print("Closing ",ArtName,".");
        .broadcast(untell,open_proposal_pool(ArtNameS));
        pool::choose_by_cost;
    .

+pool::status("closed")[artifact_name(ArtName)]
    :   chossing_method("wcet")
    <-  .print("Closing ",ArtName,".");
        .broadcast(untell,open_proposal_pool(ArtNameS));
        pool::choose_by_wcet;
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
