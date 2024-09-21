start.

+open_proposal_pool(ArtId)[source(INIT)]
    <-  .send(INIT,tell,propose);
        +pending_job(ArtId);
    .

+!do_the_job(ArtId)[source(INIT)] 
    : pending_job(ArtId)
    <-  RET = "Done";
        // Do something with a return value RET
        +retval(RET);
        .term2string(RET_T, RET);
        //.string2term(RET,RET_T);
        +retval_t(RET_T);
        .send(INIT,tell,RET_T);
    .

+not_chosen(ArtId)
    <-  .print(":(");
        -pending_job(ArtId);
    .

+start
    <-  do_the_job(RET);
        .print(RET);
    .

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }
