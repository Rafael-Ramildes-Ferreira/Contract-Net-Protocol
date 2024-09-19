
+!call_proposals(ID,M)
    <-  .concat("pool", ID, ArtNameS);
        .term2string(ArtNameT, ArtNameS);
        /*vm::makeArtifact(ArtNameS, "ChosingMachine", [], ArtId);
        vm::focus(ArtId);
        open(ID,M);*/
        .print("Opening a proposal pool named ",ArtNameT,".");
        .broadcast(tell,open_proposal(ArtId));
    .

/*+!art::close_pool(ID)[artifact_name(ArtName)]
    <-  .print("Closing ",ArtName,".");
    .

+art::chosen(AGENT)[artifact_id(ArtId)]  // One for each chosen participator
    <-  .send(AGENT,achieve,do_the_job(ArtId));
    .

+art::not_chosen(AGENT)[artifact_id(ArtId)]  // One for each not chosen participator
    <-  .my_name(ME);
        .send(AGENT,tell,not_chosen(ArtId));
    .
*/
{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }
