start.

+start 
    <-  .random(X);
        +wcet(X*3000);   // WCET \in [0, 3000 ms]
        .random(Y);
        +cost(Y);        // Doesn't matter the scale
    .
    
+open_proposal_pool(ArtNameS,JobName)[source(INIT)]
    :   focusing(_,_,JobName,_,_,_) &
        wcet(X) &
        cost(Y)
    <-  .my_name(ME);
        .send(INIT,tell,propose(ME,X,Y));
        +pending_job(ArtNameS);
    .

+!do_the_job(ArtName)[source(INIT)] 
    :   pending_job(ArtName) &
        wcet(X)
    <-  do_the_job(X,RET);
        .my_name(ME);
        .send(INIT,tell,return_value(ME,RET));
    .

+not_chosen(ArtName)
    <-  .print(":(");
        -pending_job(ArtName);
        +art_name(ArtName);
    .

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }
