
+!call_proposal(ID,M)
    :   ArtId = 1
    <-  .concat("proposal", ID, ArtNameS);
        .term2string(ArtNameT, ArtNameS);
        //art::makeArtifact(ArtNameS, "ChosingMachine", [], ArtId);
        //art::open(ID,m);
        .print("Opening a proposal named ",ArtNameT,".");
        .broadcast(tell,open_proposal(ArtId));
    .

/*+!art::close_proposal(ID)[artifact_name(ArtName)]
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
