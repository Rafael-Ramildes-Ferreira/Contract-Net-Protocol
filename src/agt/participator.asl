start.

+start 
    <-  .random(X);
        +wcet(X*3000);   // WCET \in [0, 3000 ms]
        .random(Y);
        +cost(Y);        // Doesn't matter the scale
    .
    
+open_proposal_pool(ArtId,JobName)[source(INIT)]
    :   focusing(_,_,JobName,_,_,_) &
        wcet(X) &
        cost(Y)
    <-  .my_name(ME);
        .send(INIT,tell,propose(ME,X,Y));
        +pending_job(ArtId);
    .

+!do_the_job(ArtId)[source(INIT)] 
    :   pending_job(ArtId) &
        wcet(X)
    <-  do_the_job(X,RET);
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
