Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FE6293754
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796382; cv=none; b=cYFFmv2KV3I5tczGcpZnres4+TY86Qe51gbMMujZK8bRjs5IcVubiJXS/uqUkYO1QLOcqApF+IbSS1X03zSt7K8qitjiaBKIt7MrD8G4fSwhZIp8ihejnciSKGm5dim2NNO8/8mVsEl04Mi708T0AbcyF7xuU26GrhSdFgLqZFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796382; c=relaxed/simple;
	bh=PEMsRAkVfHqbpumS0gpvPHxCdF+Z5gl5B8yoDg7XsTU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=UmbPXTw1mwzxSo+4/dPBGVCpgzxNNu7dhrVEV1dmRVQF+QpIkGHbqDkJLWrUBKUj0RYl6tb6Dms0d/HFGBq9ZNCbQFeaOBKNSQdxy+HYyM2+SfNI2wR5cOoe/Cei7rxJCfDpqO3ZGv3IS3NdXTugxkyBKLqpzOHCLuuuxIT3N0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED586C4CEF0;
	Fri,  9 May 2025 13:13:01 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXR-00000002bzI-23O7;
	Fri, 09 May 2025 09:13:17 -0400
Message-ID: <20250509131317.337063144@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 23/31] tracing: Convert the per CPU "disabled" counter to local from atomic
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The per CPU "disabled" counter is used for the latency tracers and stack
tracers to make sure that their accounting isn't messed up by an NMI or
interrupt coming in and affecting the same CPU data. But the counter is an
atomic_t type. As it only needs to synchronize against the current CPU,
switch it over to local_t type.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250505212236.394925376@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.h              |  2 +-
 kernel/trace/trace_functions.c    |  8 ++++----
 kernel/trace/trace_irqsoff.c      | 22 +++++++++++-----------
 kernel/trace/trace_sched_wakeup.c | 18 +++++++++---------
 4 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 69c1ecfb2290..188032d4ab69 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -183,7 +183,7 @@ struct trace_array;
  * the trace, etc.)
  */
 struct trace_array_cpu {
-	atomic_t		disabled;
+	local_t			disabled;
 	void			*buffer_page;	/* ring buffer spare */
 
 	unsigned long		entries;
diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index bd153219a712..99a90f182485 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -291,7 +291,7 @@ function_stack_trace_call(unsigned long ip, unsigned long parent_ip,
 	parent_ip = function_get_true_parent_ip(parent_ip, fregs);
 	cpu = raw_smp_processor_id();
 	data = per_cpu_ptr(tr->array_buffer.data, cpu);
-	disabled = atomic_inc_return(&data->disabled);
+	disabled = local_inc_return(&data->disabled);
 
 	if (likely(disabled == 1)) {
 		trace_ctx = tracing_gen_ctx_flags(flags);
@@ -303,7 +303,7 @@ function_stack_trace_call(unsigned long ip, unsigned long parent_ip,
 		__trace_stack(tr, trace_ctx, skip);
 	}
 
-	atomic_dec(&data->disabled);
+	local_dec(&data->disabled);
 	local_irq_restore(flags);
 }
 
@@ -402,7 +402,7 @@ function_stack_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
 	parent_ip = function_get_true_parent_ip(parent_ip, fregs);
 	cpu = raw_smp_processor_id();
 	data = per_cpu_ptr(tr->array_buffer.data, cpu);
-	disabled = atomic_inc_return(&data->disabled);
+	disabled = local_inc_return(&data->disabled);
 
 	if (likely(disabled == 1)) {
 		last_info = per_cpu_ptr(tr->last_func_repeats, cpu);
@@ -417,7 +417,7 @@ function_stack_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
 	}
 
  out:
-	atomic_dec(&data->disabled);
+	local_dec(&data->disabled);
 	local_irq_restore(flags);
 }
 
diff --git a/kernel/trace/trace_irqsoff.c b/kernel/trace/trace_irqsoff.c
index 40c39e946940..0b6d932a931e 100644
--- a/kernel/trace/trace_irqsoff.c
+++ b/kernel/trace/trace_irqsoff.c
@@ -123,12 +123,12 @@ static int func_prolog_dec(struct trace_array *tr,
 		return 0;
 
 	*data = per_cpu_ptr(tr->array_buffer.data, cpu);
-	disabled = atomic_inc_return(&(*data)->disabled);
+	disabled = local_inc_return(&(*data)->disabled);
 
 	if (likely(disabled == 1))
 		return 1;
 
-	atomic_dec(&(*data)->disabled);
+	local_dec(&(*data)->disabled);
 
 	return 0;
 }
@@ -152,7 +152,7 @@ irqsoff_tracer_call(unsigned long ip, unsigned long parent_ip,
 
 	trace_function(tr, ip, parent_ip, trace_ctx, fregs);
 
-	atomic_dec(&data->disabled);
+	local_dec(&data->disabled);
 }
 #endif /* CONFIG_FUNCTION_TRACER */
 
@@ -209,7 +209,7 @@ static int irqsoff_graph_entry(struct ftrace_graph_ent *trace,
 
 	trace_ctx = tracing_gen_ctx_flags(flags);
 	ret = __trace_graph_entry(tr, trace, trace_ctx);
-	atomic_dec(&data->disabled);
+	local_dec(&data->disabled);
 
 	return ret;
 }
@@ -238,7 +238,7 @@ static void irqsoff_graph_return(struct ftrace_graph_ret *trace,
 
 	trace_ctx = tracing_gen_ctx_flags(flags);
 	__trace_graph_return(tr, trace, trace_ctx, *calltime, rettime);
-	atomic_dec(&data->disabled);
+	local_dec(&data->disabled);
 }
 
 static struct fgraph_ops fgraph_ops = {
@@ -408,10 +408,10 @@ start_critical_timing(unsigned long ip, unsigned long parent_ip)
 
 	data = per_cpu_ptr(tr->array_buffer.data, cpu);
 
-	if (unlikely(!data) || atomic_read(&data->disabled))
+	if (unlikely(!data) || local_read(&data->disabled))
 		return;
 
-	atomic_inc(&data->disabled);
+	local_inc(&data->disabled);
 
 	data->critical_sequence = max_sequence;
 	data->preempt_timestamp = ftrace_now(cpu);
@@ -421,7 +421,7 @@ start_critical_timing(unsigned long ip, unsigned long parent_ip)
 
 	per_cpu(tracing_cpu, cpu) = 1;
 
-	atomic_dec(&data->disabled);
+	local_dec(&data->disabled);
 }
 
 static nokprobe_inline void
@@ -445,16 +445,16 @@ stop_critical_timing(unsigned long ip, unsigned long parent_ip)
 	data = per_cpu_ptr(tr->array_buffer.data, cpu);
 
 	if (unlikely(!data) ||
-	    !data->critical_start || atomic_read(&data->disabled))
+	    !data->critical_start || local_read(&data->disabled))
 		return;
 
-	atomic_inc(&data->disabled);
+	local_inc(&data->disabled);
 
 	trace_ctx = tracing_gen_ctx();
 	__trace_function(tr, ip, parent_ip, trace_ctx);
 	check_critical_timing(tr, data, parent_ip ? : ip, cpu);
 	data->critical_start = 0;
-	atomic_dec(&data->disabled);
+	local_dec(&data->disabled);
 }
 
 /* start and stop critical timings used to for stoppage (in idle) */
diff --git a/kernel/trace/trace_sched_wakeup.c b/kernel/trace/trace_sched_wakeup.c
index a0db3404f7f7..bf1cb80742ae 100644
--- a/kernel/trace/trace_sched_wakeup.c
+++ b/kernel/trace/trace_sched_wakeup.c
@@ -83,14 +83,14 @@ func_prolog_preempt_disable(struct trace_array *tr,
 		goto out_enable;
 
 	*data = per_cpu_ptr(tr->array_buffer.data, cpu);
-	disabled = atomic_inc_return(&(*data)->disabled);
+	disabled = local_inc_return(&(*data)->disabled);
 	if (unlikely(disabled != 1))
 		goto out;
 
 	return 1;
 
 out:
-	atomic_dec(&(*data)->disabled);
+	local_dec(&(*data)->disabled);
 
 out_enable:
 	preempt_enable_notrace();
@@ -144,7 +144,7 @@ static int wakeup_graph_entry(struct ftrace_graph_ent *trace,
 	*calltime = trace_clock_local();
 
 	ret = __trace_graph_entry(tr, trace, trace_ctx);
-	atomic_dec(&data->disabled);
+	local_dec(&data->disabled);
 	preempt_enable_notrace();
 
 	return ret;
@@ -173,7 +173,7 @@ static void wakeup_graph_return(struct ftrace_graph_ret *trace,
 		return;
 
 	__trace_graph_return(tr, trace, trace_ctx, *calltime, rettime);
-	atomic_dec(&data->disabled);
+	local_dec(&data->disabled);
 
 	preempt_enable_notrace();
 	return;
@@ -243,7 +243,7 @@ wakeup_tracer_call(unsigned long ip, unsigned long parent_ip,
 	trace_function(tr, ip, parent_ip, trace_ctx, fregs);
 	local_irq_restore(flags);
 
-	atomic_dec(&data->disabled);
+	local_dec(&data->disabled);
 	preempt_enable_notrace();
 }
 
@@ -471,7 +471,7 @@ probe_wakeup_sched_switch(void *ignore, bool preempt,
 
 	/* disable local data, not wakeup_cpu data */
 	cpu = raw_smp_processor_id();
-	disabled = atomic_inc_return(&per_cpu_ptr(wakeup_trace->array_buffer.data, cpu)->disabled);
+	disabled = local_inc_return(&per_cpu_ptr(wakeup_trace->array_buffer.data, cpu)->disabled);
 	if (likely(disabled != 1))
 		goto out;
 
@@ -508,7 +508,7 @@ probe_wakeup_sched_switch(void *ignore, bool preempt,
 	arch_spin_unlock(&wakeup_lock);
 	local_irq_restore(flags);
 out:
-	atomic_dec(&per_cpu_ptr(wakeup_trace->array_buffer.data, cpu)->disabled);
+	local_dec(&per_cpu_ptr(wakeup_trace->array_buffer.data, cpu)->disabled);
 }
 
 static void __wakeup_reset(struct trace_array *tr)
@@ -563,7 +563,7 @@ probe_wakeup(void *ignore, struct task_struct *p)
 	    (!dl_task(p) && (p->prio >= wakeup_prio || p->prio >= current->prio)))
 		return;
 
-	disabled = atomic_inc_return(&per_cpu_ptr(wakeup_trace->array_buffer.data, cpu)->disabled);
+	disabled = local_inc_return(&per_cpu_ptr(wakeup_trace->array_buffer.data, cpu)->disabled);
 	if (unlikely(disabled != 1))
 		goto out;
 
@@ -610,7 +610,7 @@ probe_wakeup(void *ignore, struct task_struct *p)
 out_locked:
 	arch_spin_unlock(&wakeup_lock);
 out:
-	atomic_dec(&per_cpu_ptr(wakeup_trace->array_buffer.data, cpu)->disabled);
+	local_dec(&per_cpu_ptr(wakeup_trace->array_buffer.data, cpu)->disabled);
 }
 
 static void start_wakeup_tracer(struct trace_array *tr)
-- 
2.47.2


