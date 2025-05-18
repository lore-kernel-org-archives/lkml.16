Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5D71E4AB
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747579877; cv=none; b=lWiDhUylGVcqFPgA4FPYqKdV7BsSYmj4n8HBe6sj58C0ZUgd741sKDa7pZb5v9YCXDn5NDhcElxMG5daskBnLhzT7NMj+xCTERBYtQdgcYceFp/fSySVrz+6pQMWVG4APcu51qLIl/IWT8uGXunwLRFKhUGNSKUd3E8hJ+8+w8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747579877; c=relaxed/simple;
	bh=s8+gjTslIrdD5H418y+pdqqDz74c5FqLxoojeoV9uqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YW4i86bGkzk6B/+B31dEGZqprHFMQFVr9++0UPaPiDnzyjH6UjtCPbqNKVcz/+QhhZeWdi+ah/ReVzdbM4juQMFV1t82DfqH6/JDaQB0kp1+O40Oo3cbcqd+cYSNVfHeXiBo+3iEONRixU44KVLJW0LN8XRPsi1xnMOa1dWmeOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=de/NK6qR; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="de/NK6qR"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso33757281fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 07:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747579873; x=1748184673; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lyeb3DajWaZqLik4035qzuE0zBpILRuvmPVPo1gYqCk=;
        b=de/NK6qRdCW4dbGBTuStObGq7SRoT2OYsM8PN6573OO+hDJCNWYo4DoDjWpg7uLGAT
         3qY7rdNItt+7s/y0q56z2XvQC0x7PFAzaZP3gdds3cVo+aF1Dndk3m4Q5cPMFVKW28ir
         HXA4u143Y2PA1of2y2WteiHSWZX5xD6k5LQMGWAK9ggE0dNys7x72OYArzky7kenRkkB
         2rDl3bcFQNGKymrDnQCQTs3fdZislFRAP2GwZfQQ5ubRFfGVxVqTzB3edaMVgbm6dPVu
         7YmjWmKukViBTE4kTz5POvEKtvqUHBfud/6TF39sPssOkmJzhlVUanGxw0pxXbWZBHD0
         B5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747579873; x=1748184673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lyeb3DajWaZqLik4035qzuE0zBpILRuvmPVPo1gYqCk=;
        b=dmX0Z5gpKc28PUyKlMAT7A1FsooEdZEoOLmhb9RN1MP4JbSGQZsuKKUrRcp/cCruwV
         hh51tPPN5au3SkpJfrn4a/6XSN9bHPw/GoN3X2Tcb3mXbPBUGw8opQGU4NvHZzevRcmf
         mcCw9CMLOs2JUo9iVqJ4pt3q8chdodzuo/Fxt1TJ9S5c6M989HC86ZioPbJcGTA4oFr/
         zyj3iSzZP356QAIRxpAQwSUvojZoQMCPX/XWJ1apBoivlaYf/5qRXjR0TUDJpEB8YJPW
         JSX4M+XgpYuOeJneJXz949VjSUIwoG4AZUBQkUaNgxCDL5ZjrrY7yhCsID7HI4s0ubpv
         9ofg==
X-Gm-Message-State: AOJu0YyV580FJBK00qymkef4NhSMOndrpTPuw8cXQbO4lAN8+vMMjJJo
	7ApHnir0aNHIsTm01FLotjRN1iCqm2G3QT4aT/iIiYr2ljxroQJjxBdfrlK9tXKsFaoV2icjn5d
	o1LMsATKXix+UotBAx16juJuqhlHb6Ks=
X-Gm-Gg: ASbGncuT4HfDLcV9ZV/PjXnJPwzlfgLr0lLZn8NnD569huGf9ndo4g1QYrqIZRzLBCx
	dkzvsEomxvvZT1jGqty+a9CNjEIGD2yVfD5z1zW3b6lZz/6YKaysQEznp2lPWHcRE6/i96ixzKH
	9g2MnaAR2fTHAxTQRZaIeiB7dpAao0qfqLog==
X-Google-Smtp-Source: AGHT+IGdaRrwC/c2EBCjNiS/lb9IuGZ3BRXNuRMjB5IjYSjXE160RiO0FcScIw2oeE2VU79+U1top8lIDTIAhLflx+o=
X-Received: by 2002:a05:651c:304c:b0:30d:b8a5:9b8d with SMTP id
 38308e7fff4ca-3280771d53emr28965961fa.16.1747579872840; Sun, 18 May 2025
 07:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
 <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
 <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com>
 <CANDhNCqv0iFMJanxj4uTyOHGUGxfCqb18Ku+w5y9JFKRm0M=Rg@mail.gmail.com> <CADHxFxQoNOBCOMDsh0iNrdD=ke=YweVZgZrTWbBQRA8SYy9McA@mail.gmail.com>
In-Reply-To: <CADHxFxQoNOBCOMDsh0iNrdD=ke=YweVZgZrTWbBQRA8SYy9McA@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Sun, 18 May 2025 22:51:00 +0800
X-Gm-Features: AX0GCFtFztb5WVjb5sixtpH_hKPX5gs9_mg0Q4_iuPlQszIs5nqacZMn_Yy9jl8
Message-ID: <CADHxFxRd66FB6=wgY2-NLxqiMGZui+um+h2LUe4+hwXabdUpVg@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: John Stultz <jstultz@google.com>, peterz@infradead.org
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com, vschneid@redhat.com, 
	mingo@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"

Hi John,
Sorry for the delayed response.

> Usually I boot qemu with 64 cores, and have found stress testing
> running the following separate programs frequently uncovers issues:
>
> #cyclictest from the rt-test suite to add some rt load
> cyclictest -t -p90
>
> # rerunning the test_ww_mtuex logic (enabled by a patch in my full
> proxy-exec series)
> while true; do echo 1 > /sys/kernel/test_ww_mutex/run_tests ; sleep 5; done
>
> # Along with my prio-inversion-demo (which ensures we do the proxying paths)
> # ? https://github.com/johnstultz-work/priority-inversion-demo
> while true; do ./run.sh; sleep 10 ; done
>
> # Sometimes I also throw in the ltp sched_football test:
> # https://github.com/linux-test-project/ltp/tree/master/testcases/realtime/func/sched_football
> while true; do ./sched_football -m | grep Result ; sleep 1; done
>


I followed your suggested approach and successfully reproduced the
issue you mentioned. The system experienced a hang during bootup and
triggered a crash due to a watchdog timeout. This issue is related to
the logic of sched_delayed. I will provide a detailed description of
the debugging steps below. I apologize in advance if the explanation
becomes somewhat lengthy.

I added debugging information to capture the task execution logic
prior to the crash. The corresponding patch is provided below:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
old mode 100644
new mode 100755
index 06e9924d3f77..c9adc17f53e5
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2098,6 +2098,14 @@ static inline void __activate_task(struct rq
*rq, struct task_struct *p, int fla
  WRITE_ONCE(p->on_rq, TASK_ON_RQ_QUEUED);
  ASSERT_EXCLUSIVE_WRITER(p->on_rq);
+
+ if (p->blocked_on) {
+ trace_printk("DEBUG BYHP[%d]: "
+ "p=%s$%d, on_cpu=%d, on_rq=%d, __state=%d, sched_delayed=%d\n",
+ __LINE__,
+ p->comm, p->pid, p->on_cpu, p->on_rq, p->__state,
+ p->se.sched_delayed);
+ }
 }

 #ifdef CONFIG_SCHED_PROXY_EXEC
@@ -4160,6 +4168,19 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
  rq = __task_rq_lock(p, &rf);
  if (task_on_rq_queued(p)) {
  update_rq_clock(rq);
+ if (proxy_needs_return(rq, p)) {
+ _trace_sched_pe_return_migration(p);
+
+ if (p->blocked_on) {
+ trace_printk("DEBUG BYHP[%d]: "
+ "p=%s$%d, on_cpu=%d, on_rq=%d, __state=%d, sched_delayed=%d\n",
+ __LINE__,
+ p->comm, p->pid, p->on_cpu, p->on_rq, p->__state,
+ p->se.sched_delayed);
+ }
+ goto out;
+ }
+
  if (p->se.sched_delayed) {
  proxy_remove_from_sleeping_owner(p);
  enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
@@ -4171,10 +4192,6 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
  */
  wakeup_preempt(rq, p, wake_flags);
  }
- if (proxy_needs_return(rq, p)) {
- _trace_sched_pe_return_migration(p);
- goto out;
- }
  ttwu_do_wakeup(p);
  ret = 1;
  }
@@ -4377,6 +4394,14 @@ static void ttwu_queue(struct task_struct *p,
int cpu, int wake_flags)
  struct rq *rq = cpu_rq(cpu);
  struct rq_flags rf;

+ if (p->blocked_on) {
+ trace_printk("DEBUG BYHP[%d]: "
+ "p=%s$%d, on_cpu=%d, on_rq=%d, __state=%d, sched_delayed=%d\n",
+ __LINE__,
+ p->comm, p->pid, p->on_cpu, p->on_rq, p->__state,
+ p->se.sched_delayed);
+ }
+
  if (ttwu_queue_wakelist(p, cpu, wake_flags))
  return;

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
old mode 100644
new mode 100755
index 1f707b614142..a3857b058ed6
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5623,6 +5623,8 @@ static int dequeue_entities(struct rq *rq,
struct sched_entity *se, int flags);
 static struct sched_entity *
 pick_next_entity(struct rq *rq, struct cfs_rq *cfs_rq)
 {
+ struct task_struct *p;
+
  /*
  * Enabling NEXT_BUDDY will affect latency but not fairness.
  */
@@ -5635,7 +5637,25 @@ pick_next_entity(struct rq *rq, struct cfs_rq *cfs_rq)

  struct sched_entity *se = pick_eevdf(cfs_rq);
  if (se->sched_delayed) {
+ p = task_of(se);
+ if (p->blocked_on) {
+ trace_printk("DEBUG BYHP[%d]: "
+ "p=%s$%d, on_cpu=%d, on_rq=%d, __state=%d, sched_delayed=%d\n",
+ __LINE__,
+ p->comm, p->pid, p->on_cpu, p->on_rq, p->__state,
+ p->se.sched_delayed);
+ }
+
  dequeue_entities(rq, se, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
+
+ if (p->blocked_on) {
+ trace_printk("DEBUG BYHP[%d]: "
+ "p=%s$%d, on_cpu=%d, on_rq=%d, __state=%d, sched_delayed=%d\n",
+ __LINE__,
+ p->comm, p->pid, p->on_cpu, p->on_rq, p->__state,
+ p->se.sched_delayed);
+ }
+
  /*
  * Must not reference @se again, see __block_task().
  */


At the time of the crash, the dmesg logs included multiple warnings
similar to the following. For analysis, I will use the task with PID
151 as an example.

[  124.912061][   T61] INFO: task kworker/u32:8:151 blocked for more
than 62 seconds.
[  124.912708][   T61]      on_rq: 0 rq: 4 state: 0x2  bo_state: 1
[  124.913133][   T61]       Not tainted 6.12.0-00050-gf6c6e0ea8a1d-dirty #93
[  124.913535][   T61] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  124.991597][   T61] task:kworker/u32:8   state:D stack:0
pid:151   tgid:151   ppid:2      flags:0x00000008
[  124.992829][   T61] Workqueue: test-ww_mutex stress_reorder_work
[  124.993361][   T61] Call trace:
[  124.993677][   T61]  __switch_to+0xe4/0x1a4
[  125.027050][   T61]  __schedule+0x4e0/0x1960
[  125.031483][   T61]  schedule+0x4c/0x130
[  125.031811][   T61]  schedule_preempt_disabled+0x28/0x40
[  125.032150][   T61]  __ww_mutex_lock.constprop.28+0xbdc/0x1960
[  125.032539][   T61]  ww_mutex_lock+0x48/0x98
[  125.032870][   T61]  stress_reorder_work+0x268/0x3c4
[  125.033287][   T61]  process_scheduled_works+0x254/0x694
[  125.033728][   T61]  worker_thread+0x16c/0x310
[  125.034078][   T61]  kthread+0x128/0x134
[  125.034419][   T61]  ret_from_fork+0x10/0x20


Switching the crash environment to the context of task 151, the `info
stack` command reveals that task 151 is blocked in __ww_mutex_lock
while waiting for the lock `lock=lock@entry=0xffff000006ab5060`.

crash_arm64> set 151
    PID: 151
COMMAND: "kworker/u32:8"
   TASK: ffff0000060ec180  [THREAD_INFO: ffff0000060ec180]
    CPU: 4
  STATE: TASK_UNINTERRUPTIBLE
crash_arm64> info stack
#0  __switch_to (prev=prev@entry=0xffff0000060ec180,
next=next@entry=0xffff000005444180) at arch/arm64/kernel/process.c:609
#1  0xffff8000813bf6ac in context_switch (rf=0xffff800086123b40,
next=0xffff000005444180, prev=0xffff0000060ec180,
rq=0xffff00002cbf48c0) at kernel/sched/core.c:5831
#2  __schedule (sched_mode=sched_mode@entry=0) at kernel/sched/core.c:7637
#3  0xffff8000813c0b78 in __schedule_loop (sched_mode=<optimised out>)
at kernel/sched/core.c:7718
#4  schedule () at kernel/sched/core.c:7733
#5  0xffff8000813c0c84 in schedule_preempt_disabled () at
kernel/sched/core.c:7790
#6  0xffff8000813c6054 in __mutex_lock_common (use_ww_ctx=true,
ww_ctx=0xffff800086123cd0, ip=18446603338369690404,
nest_lock=<optimised out>, subclass=0, state=2203262976,
lock=0xffff000006ab5060) at kernel/locking/mutex.c:665
#7  __ww_mutex_lock (lock=lock@entry=0xffff000006ab5060,
state=2203262976, state@entry=2, ip=ip@entry=18446603338369690404,
ww_ctx=ww_ctx@entry=0xffff800086123cd0, subclass=0) at
kernel/locking/mutex.c:762
#8  0xffff8000813c6ea0 in ww_mutex_lock
(lock=lock@entry=0xffff000006ab5060, ctx=0xffff800086123cd0,
ctx@entry=0xffff800086123d40) at kernel/locking/mutex.c:879
#9  0xffff8000800f6b24 in ww_mutex_lock_slow (ctx=0xffff800086123d40,
lock=0xffff000006ab5060) at ./include/linux/ww_mutex.h:299
#10 stress_reorder_work (work=0xffff0000065938f0) at
kernel/locking/test-ww_mutex.c:532
#11 0xffff80008007ef84 in process_one_work (work=0xffff0000065938f0,
worker=0xffff000005db1300) at kernel/workqueue.c:3229
#12 process_scheduled_works (worker=worker@entry=0xffff000005db1300)
at kernel/workqueue.c:3310
#13 0xffff80008007fa3c in worker_thread (__worker=0xffff000005db1300)
at kernel/workqueue.c:3391
#14 0xffff80008008b2e8 in kthread (_create=0xffff000006848400) at
kernel/kthread.c:389
#15 0xffff8000800162dc in ret_from_fork () at arch/arm64/kernel/entry.S:860
crash_arm64>


Using the following commands, it was determined that the mutex lock is
held by the task with PID 165. The field `__state = 0` indicates that
the task is in the TASK_RUNNING state, while `on_rq = 0` indicates
that the task has been removed from the runqueue. These two fields are
contradictory, preventing the task with PID 165 from ever getting a
chance to run, which is the direct cause of the system hang.

crash_arm64> struct -x mutex.owner 0xffff000006ab5060
  owner = {
    counter = 0xffff0000063ba0c1
  },
crash_arm64> struct
task_struct.comm,pid,__state,thread_info.cpu,se.on_rq,on_rq,on_cpu,blocked_on,blocked_on_state
0xffff0000063ba0c0
  comm = "kworker/u32:22\000",
  pid = 165,
  __state = 0,
  thread_info.cpu = 4
  se.on_rq = 0 '\000',
  on_rq = 0,
  on_cpu = 0,
  blocked_on = 0xffff000006aa3520,
  blocked_on_state = BO_RUNNABLE,
crash_arm64>

The following trace information provides the execution logic of the
task with PID 165 before the system hang occurred.

Line 993:   kworker/u32:20-163   [004]    60.082229: bprint:
    try_to_wake_up: DEBUG BYHP[4179]: p=kworker/u32:22$165, on_cpu=0,
on_rq=2, __state=2, sched_delayed=1
Line 994:   kworker/u32:20-163   [004]    60.082250: bprint:
    try_to_wake_up: DEBUG BYHP[4402]: p=kworker/u32:22$165, on_cpu=0,
on_rq=2, __state=512, sched_delayed=1
Line 995:   kworker/u32:20-163   [004]    60.082268: bprint:
    activate_task: DEBUG BYHP[2107]: p=kworker/u32:22$165, on_cpu=0,
on_rq=1, __state=512, sched_delayed=1
Line 1002:           <idle>-0     [004]    60.087364: bprint:
     pick_task_fair: DEBUG BYHP[5646]: p=kworker/u32:22$165, on_cpu=0,
on_rq=1, __state=0, sched_delayed=1
Line 1003:           <idle>-0     [004]    60.087375: bprint:
     pick_task_fair: DEBUG BYHP[5656]: p=kworker/u32:22$165, on_cpu=0,
on_rq=0, __state=0, sched_delayed=0


The trace information indicates that the task with PID 165 has
`p->se.sched_delayed = 1`. From the trace logs at lines 4179, 4402,
and 2107, it is evident that the task with PID 165 was successfully
removed from the runqueue during the try_to_wake_up process,
reassigned to a new CPU, and successfully completed the enqueue
operation. This behavior seems to align with our expectations.

try_to_wake_up
  |-- ttwu_runnable
      |-- proxy_needs_return    // line: 4179
  |-- cpu = select_task_rq()
  |-- ttwu_queue(p, cpu)        // line: 4402
      |-- __activate_task(p)    // line: 2107


However, the logs at lines 5646 and 5656 reveal that tasks with
`sched_delayed = 1` are removed from the runqueue again during the
pick_next_entity operation. The corresponding code logic in
pick_next_entity is as follows.

struct sched_entity *se = pick_eevdf(cfs_rq);
if (se->sched_delayed) {
dequeue_entities(rq, se, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
/*
* Must not reference @se again, see __block_task().
*/
return NULL;
}

This means that in `pick_task_fair -> pick_next_entity`, a task that
has already been successfully woken up and enqueued will be removed
from the runqueue again if its `sched_delayed = 1`. As a result, the
task will never get a chance to run, ultimately causing the system to
experience hangs.

In the original code logic, the sched_delayed operation is placed
before proxy_needs_return, allowing the `se->sched_delayed` variable
to be set to 0 through enqueue_task(ENQUEUE_DELAYED) ->
enqueue_task_fair -> requeue_delayed_entity. This prevents the already
woken-up task from being removed from the runqueue again in the
pick_next_entity function.

To verify the correctness of the above analysis, we forcibly cleared
`p->se.sched_delayed` after the execution of the proxy_needs_return
function. The corresponding patch is as follows, and with this change,
the system can bootup successfully.

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
old mode 100644
new mode 100755
index 06e9924d3f77..0da8d308ec4b
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c

 #ifdef CONFIG_SCHED_PROXY_EXEC
@@ -4160,6 +4168,15 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
  rq = __task_rq_lock(p, &rf);
  if (task_on_rq_queued(p)) {
  update_rq_clock(rq);
+ if (proxy_needs_return(rq, p)) {
+ _trace_sched_pe_return_migration(p);
+ /*
+ * Force clearing to verify the correctness of the analysis logic
+ */
+ p->se.sched_delayed = 0;
+ goto out;
+ }
+
  if (p->se.sched_delayed) {
  proxy_remove_from_sleeping_owner(p);
  enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
@@ -4171,10 +4188,6 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
  */
  wakeup_preempt(rq, p, wake_flags);
  }
- if (proxy_needs_return(rq, p)) {
- _trace_sched_pe_return_migration(p);
- goto out;
- }
  ttwu_do_wakeup(p);
  ret = 1;
  }


The above patch was solely intended to verify the correctness of the
analysis, as directly clearing `p->se.sched_delayed` is unreasonable.
Doing so would cause tasks with non-zero lag to be dequeued, thereby
undermining the fairness enforced by EEVDF. Moving the
proxy_needs_return operation after the handling of sched_delayed
appears to be more reasonable, as for a donor that is about to be
dequeued, executing the subsequent wakeup_preempt operation is
redundant. Therefore, the following patch seems reasonable, and I
propose adopting it as version 2.0.

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
old mode 100644
new mode 100755
index 06e9924d3f77..f804c681b861
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
 #ifdef CONFIG_SCHED_PROXY_EXEC
@@ -4164,6 +4172,10 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
  proxy_remove_from_sleeping_owner(p);
  enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
  }
+ if (proxy_needs_return(rq, p)) {
+ _trace_sched_pe_return_migration(p);
+ goto out;
+ }
  if (!task_on_cpu(rq, p)) {
  /*
  * When on_rq && !on_cpu the task is preempted, see if
@@ -4171,10 +4183,6 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
  */
  wakeup_preempt(rq, p, wake_flags);
  }
- if (proxy_needs_return(rq, p)) {
- _trace_sched_pe_return_migration(p);
- goto out;
- }
  ttwu_do_wakeup(p);
  ret = 1;
  }

However, there is a potential issue. Whether it is the original code
logic or the v2.0 patch mentioned above, directly removing a task from
the runqueue in proxy_needs_return undermines the fairness enforced by
EEVDF. In fact, clearing the task's `p->se.sched_delayed` variable
first (via enqueue_task(ENQUEUE_DELAYED) -> enqueue_task_fair ->
requeue_delayed_entity) and then removing task from the runqueue in
proxy_needs_return is essentially no different from directly removing
the task while retaining its lag. This is because the non-zero lag
will eventually be discarded. Therefore, regardless of the method
used, the fairness maintained by EEVDF will be compromised.

I have not yet determined the best approach to address the issue of
EEVDF fairness being compromised. Perhaps we could preserve the lag
during the dequeue process and handle it during the next enqueue. I
look forward to further discussing this issue with you.

Finally, I have decided to adopt the following patch as version 2.0.
This patch is specifically designed to avoid unnecessary
wakeup_preempt checks. Regarding the fairness issue discussed earlier,
I plan to submit a new patch to address it.

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
old mode 100644
new mode 100755
index 06e9924d3f77..f804c681b861
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
 #ifdef CONFIG_SCHED_PROXY_EXEC
@@ -4164,6 +4172,10 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
  proxy_remove_from_sleeping_owner(p);
  enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
  }
+ if (proxy_needs_return(rq, p)) {
+ _trace_sched_pe_return_migration(p);
+ goto out;
+ }
  if (!task_on_cpu(rq, p)) {
  /*
  * When on_rq && !on_cpu the task is preempted, see if
@@ -4171,10 +4183,6 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
  */
  wakeup_preempt(rq, p, wake_flags);
  }
- if (proxy_needs_return(rq, p)) {
- _trace_sched_pe_return_migration(p);
- goto out;
- }
  ttwu_do_wakeup(p);
  ret = 1;
  }

Thanks. Looking forward to your response.
hupu
