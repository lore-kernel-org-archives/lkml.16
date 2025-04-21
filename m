Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E32FF507
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206277; cv=none; b=Sy2OmM07akeAyE7SQ83Gt7ygEH36ao7hrVLGMiZVZgjlpLIHXnma2RZxYtq4xZDi7okdR2nYuS4fmbhpkIXtgCVovv3PvoUgo5lq2ryUoJ77wHt12NXIEwIrs4ulE5at5pHsYXSXvMCqst9q9jztUaEoYaG976WhLcA91fv2QDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206277; c=relaxed/simple;
	bh=yMJHcecm2zj6M6Q7DbedbLw6+meHZ2UNj7fqi76HCNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kZPFkaOYdXyRmevrT4/sZC4hCp/TupabKRGzs1td8WMqA/GsOlUJZ1s3WAG9ZNbUbkogXzm27SniI/sagl3q3/f0bhPbYVzfeALEGSRURhzQaA2lUlvyFqfiYxvByVPF3yxWjwtFVWPFn9LLNj91hybn8UZ0a1hyFl5KBLolZU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pj53XDj/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pj53XDj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745206277; x=1776742277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yMJHcecm2zj6M6Q7DbedbLw6+meHZ2UNj7fqi76HCNQ=;
  b=Pj53XDj/IO0qJOuvtvqrM16lPjaEVY1ks3oPSXFDzF8ltVGpzsoStm1l
   C+6YrmSyvReUJt3/MCuN4grNA0cGBkyK62hlRsNT6HRWivyhTNzPMbPhl
   xsKgLcs2n1MLdKNH9CBWkwX/zobDVEfzRZ5OdT4zqcv+r1QfW+h6+9aI6
   gBFhy02HonE1rDg0jhYiTr21JdJeiRJBKwA8F9CuIHskYOT7sgPJl+oWi
   MYm24J2Wxe91+FTDDRqyfjDy+KN9n4+ynZZGyz82jTUgf/WKJiW5FZfqA
   MIRrRnbVqu/R/UjAdoRIEvQHcS8csAWzMvIBqozuRUWEPJyvDMO6wpmVG
   A==;
X-CSE-ConnectionGUID: 6TXKzjgjQbegoH94qV5gVg==
X-CSE-MsgGUID: Eaz94i42Q+eIIKykoUY8vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="56913626"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="56913626"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 20:31:14 -0700
X-CSE-ConnectionGUID: HJ/8UCbwQTyqzEykmeLLwQ==
X-CSE-MsgGUID: NPsK7sG8Rv6yXocPBpLLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="132488712"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa009.fm.intel.com with ESMTP; 20 Apr 2025 20:31:09 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Tim Chen <tim.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Libo Chen <libo.chen@oracle.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>
Subject: [RFC PATCH 5/5] sched: Add ftrace to track task migration and load balance within and across LLC
Date: Mon, 21 Apr 2025 11:25:33 +0800
Message-Id: <5d5a6e243b88d47a744f3c84d2a3a74832a6ef35.1745199017.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745199017.git.yu.c.chen@intel.com>
References: <cover.1745199017.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Not for upstream]
Introduce these ftrace events for debugging purposes.
The task migration activity is an important indicator to
infer the performance regression.

Use the following bpftrace script to capture the task migrations:

tracepoint:sched:sched_attach_task
{
  $src_cpu = args->src_cpu;
  $dst_cpu = args->dst_cpu;
  $src_llc = args->src_llc;
  $dst_llc = args->dst_llc;
  $idle = args->idle;

  if ($src_llc == $dst_llc) {
    @lb_mig_1llc[$idle] = count();
  } else {
    @lb_mig_2llc[$idle] = count();
  }
}

tracepoint:sched:sched_select_task_rq
{
  $new_cpu = args->new_cpu;
  $old_cpu = args->old_cpu;
  $new_llc = args->new_llc;
  $old_llc = args->old_llc;

  if ($new_cpu != $old_cpu) {
    if ($new_llc == $old_llc) {
      @wake_mig_1llc[$new_llc] = count();
    } else {
      @wake_mig_2llc = count();
    }
  }
}

interval:s:10
{
        time("\n%H:%M:%S scheduler statistics: \n");
        print(@lb_mig_1llc);
        clear(@lb_mig_1llc);
        print(@lb_mig_2llc);
        clear(@lb_mig_2llc);
        print(@wake_mig_1llc);
        clear(@wake_mig_1llc);
        print(@wake_mig_2llc);
        clear(@wake_mig_2llc);
}

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 include/trace/events/sched.h | 51 ++++++++++++++++++++++++++++++++++++
 kernel/sched/fair.c          | 24 ++++++++++++-----
 2 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
index 3bec9fb73a36..9995e09525ed 100644
--- a/include/trace/events/sched.h
+++ b/include/trace/events/sched.h
@@ -10,6 +10,57 @@
 #include <linux/tracepoint.h>
 #include <linux/binfmts.h>
 
+TRACE_EVENT(sched_attach_task,
+
+	TP_PROTO(int src_cpu, int dst_cpu, int src_llc, int dst_llc, int idle),
+
+	TP_ARGS(src_cpu, dst_cpu, src_llc, dst_llc, idle),
+
+	TP_STRUCT__entry(
+		__field(	int,	src_cpu		)
+		__field(	int,	dst_cpu		)
+		__field(	int,	src_llc		)
+		__field(	int,	dst_llc		)
+		__field(	int,	idle		)
+	),
+
+	TP_fast_assign(
+		__entry->src_cpu	= src_cpu;
+		__entry->dst_cpu	= dst_cpu;
+		__entry->src_llc	= src_llc;
+		__entry->dst_llc	= dst_llc;
+		__entry->idle		= idle;
+	),
+
+	TP_printk("src_cpu=%d dst_cpu=%d src_llc=%d dst_llc=%d idle=%d",
+		  __entry->src_cpu, __entry->dst_cpu, __entry->src_llc,
+		  __entry->dst_llc, __entry->idle)
+);
+
+TRACE_EVENT(sched_select_task_rq,
+
+	TP_PROTO(int new_cpu, int old_cpu, int new_llc, int old_llc),
+
+	TP_ARGS(new_cpu, old_cpu, new_llc, old_llc),
+
+	TP_STRUCT__entry(
+		__field(	int,	new_cpu		)
+		__field(	int,	old_cpu		)
+		__field(	int,	new_llc		)
+		__field(	int,	old_llc		)
+	),
+
+	TP_fast_assign(
+		__entry->new_cpu	= new_cpu;
+		__entry->old_cpu	= old_cpu;
+		__entry->new_llc	= new_llc;
+		__entry->old_llc	= old_llc;
+	),
+
+	TP_printk("new_cpu=%d old_cpu=%d new_llc=%d old_llc=%d",
+		  __entry->new_cpu, __entry->old_cpu, __entry->new_llc, __entry->old_llc)
+);
+
 /*
  * Tracepoint for calling kthread_stop, performed to end a kthread:
  */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f74d8773c811..635fd3a6009c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8902,7 +8902,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	int sync = (wake_flags & WF_SYNC) && !(current->flags & PF_EXITING);
 	struct sched_domain *tmp, *sd = NULL;
 	int cpu = smp_processor_id();
-	int new_cpu = prev_cpu;
+	int new_cpu = prev_cpu, orig_prev_cpu = prev_cpu;
 	int want_affine = 0;
 	/* SD_flags and WF_flags share the first nibble */
 	int sd_flag = wake_flags & 0xF;
@@ -8965,6 +8965,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
 	}
 
+	trace_sched_select_task_rq(new_cpu, orig_prev_cpu,
+				   per_cpu(sd_llc_id, new_cpu),
+				   per_cpu(sd_llc_id, orig_prev_cpu));
+
 	return new_cpu;
 }
 
@@ -10026,11 +10030,17 @@ static int detach_tasks(struct lb_env *env)
 /*
  * attach_task() -- attach the task detached by detach_task() to its new rq.
  */
-static void attach_task(struct rq *rq, struct task_struct *p)
+static void attach_task(struct rq *rq, struct task_struct *p, struct lb_env *env)
 {
 	lockdep_assert_rq_held(rq);
 
 	WARN_ON_ONCE(task_rq(p) != rq);
+
+	if (env)
+		trace_sched_attach_task(env->src_cpu, env->dst_cpu,
+					per_cpu(sd_llc_id, env->src_cpu),
+					per_cpu(sd_llc_id, env->dst_cpu),
+					env->idle);
 	activate_task(rq, p, ENQUEUE_NOCLOCK);
 	wakeup_preempt(rq, p, 0);
 }
@@ -10039,13 +10049,13 @@ static void attach_task(struct rq *rq, struct task_struct *p)
  * attach_one_task() -- attaches the task returned from detach_one_task() to
  * its new rq.
  */
-static void attach_one_task(struct rq *rq, struct task_struct *p)
+static void attach_one_task(struct rq *rq, struct task_struct *p, struct lb_env *env)
 {
 	struct rq_flags rf;
 
 	rq_lock(rq, &rf);
 	update_rq_clock(rq);
-	attach_task(rq, p);
+	attach_task(rq, p, env);
 	rq_unlock(rq, &rf);
 }
 
@@ -10066,7 +10076,7 @@ static void attach_tasks(struct lb_env *env)
 		p = list_first_entry(tasks, struct task_struct, se.group_node);
 		list_del_init(&p->se.group_node);
 
-		attach_task(env->dst_rq, p);
+		attach_task(env->dst_rq, p, env);
 	}
 
 	rq_unlock(env->dst_rq, &rf);
@@ -12457,6 +12467,7 @@ static int active_load_balance_cpu_stop(void *data)
 	struct sched_domain *sd;
 	struct task_struct *p = NULL;
 	struct rq_flags rf;
+	struct lb_env env_tmp;
 
 	rq_lock_irq(busiest_rq, &rf);
 	/*
@@ -12512,6 +12523,7 @@ static int active_load_balance_cpu_stop(void *data)
 		} else {
 			schedstat_inc(sd->alb_failed);
 		}
+		memcpy(&env_tmp, &env, sizeof(env));
 	}
 	rcu_read_unlock();
 out_unlock:
@@ -12519,7 +12531,7 @@ static int active_load_balance_cpu_stop(void *data)
 	rq_unlock(busiest_rq, &rf);
 
 	if (p)
-		attach_one_task(target_rq, p);
+		attach_one_task(target_rq, p, sd ? &env_tmp : NULL);
 
 	local_irq_enable();
 
-- 
2.25.1

