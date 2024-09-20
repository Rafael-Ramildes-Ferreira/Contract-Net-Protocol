
+open_proposal_pool(ArtName)[source(INIT)]
    <-  lookupArtifact(ArtName, ArtId); 
        // I could just transmit the ID, however I need to lookup for artefacts anyways
        // to be able to focus, only having the ID is not enough
        pool::focus(ArtId);
    .

+pool::status("open")[artifact_id(ArtId)] 
    <-  .my_name(ME);
        pool::propose(ME);
        +pending_job(ArtId);
        -teste(testando);
    .

+!do_the_job(ArtId)[source(INIT)] 
    : pending_job(ArtId)
    <-  // Do something with a return value RET
        .send(tell,INIT,RET);
    .

+not_chosen(ArtId)
    <-  .print(":(");
        -pending_job(ArtId);
    .

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }
