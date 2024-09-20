
+open_proposal_pool(ArtName)[source(INIT)]
    <-  lookupArtifact(ArtName, ArtId); 
        // I could just transmit the ID, however I need to lookup for artefacts anyways
        // to be able to focus, only having the ID is not enough
        pool::focus(ArtId);
        .my_name(ME);
        pool::propose(ME);
        +pending_job(INIT,ArtId);
    .

+!do_the_job(ArtId) 
    : pending_job(INIT,ArtId)
    <-  // Do something with a return value RET
        .send(tell,INIT,RET);
    .

+not_chosen(ArtId)[source(INIT)] 
    <- -pending_job(INIT,ArtId).

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }
