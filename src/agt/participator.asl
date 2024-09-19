
+open_proposal(ArtId)[source(INIT)]
    <-  //art::focus(ArtId);
        .my_name(ME);
        //art::propose(ME);
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
