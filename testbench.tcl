source "vendor/c.tcl"
set cc [c create]
$cc cflags -I. workqueue.c
$cc include <stdlib.h>
$cc include "workqueue.h"
$cc code { WorkQueue* q; }
$cc proc init {} void {
    q = workQueueNew();
}
$cc proc take {} Tcl_Obj* {
    WorkQueueItem* x = workQueueTake(q);
    Tcl_Obj* ret = Tcl_NewStringObj(x->s, -1);
    free(x);
    return ret;
}
$cc proc push {char* s} void {
    WorkQueueItem* x = malloc(sizeof(WorkQueueItem));
    snprintf(x->s, sizeof(x->s), "%s", s);
    workQueuePush(q, x);
}
$cc proc steal {} Tcl_Obj* {
    WorkQueueItem* x = workQueueSteal(q);
    Tcl_Obj* ret = Tcl_NewStringObj(x->s, -1);
    free(x);
    return ret;
}
$cc compile
init
