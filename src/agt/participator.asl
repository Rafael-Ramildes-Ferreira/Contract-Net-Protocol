
+open_proposal_pool(ArtId)[source(INIT)]
    <-  .my_name(ME);
        .send(INIT,tell,propose(ME));
        +pending_job(ArtId);
    .

+!do_the_job(ArtId)[source(INIT)] 
    : pending_job(ArtId)
    <-  do_the_job(RET);
        .my_name(ME);
        .send(INIT,tell,return_value(ME,RET));
    .

+not_chosen(ArtId)
    <-  .print(":(");
        -pending_job(ArtId);
    .

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }
