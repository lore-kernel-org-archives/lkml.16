Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61D2920B9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796380; cv=none; b=oArqireb5g03teOfjkvUWMvmlK6WJSPl9SR8N2Bid1gszhibTkhyX++Bg1zjHsH6gK5nOUtGt6swg/yfpUnq/EGp/8Of5ekW7WsmWRThuFX+LVuoxtaKlIpiLUjS1Ns6d+DM1117rRcuIH9dMMSl8kcDlW6oCwMhunTfCD2SQdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796380; c=relaxed/simple;
	bh=wEecE7svTPb11DcdMrTx0WAMQTb7eJNFeUdjgQ8JSws=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=cWxb3PNeVXOB2fBjs6L/KSWEe5ZgHmLTIsjOqShqCb6T4c10k60G6PKSIt4W+RrazUjGUQEwHvo+CPkNgYrO86tFeGttnwZsgLP2G5d7iLadEjL2tlnj3JM8ljSqsrGyHOo8MlLVypzGItSLwqZslnm8s+LifRzK3+IE0GngBAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671B5C4CEEE;
	Fri,  9 May 2025 13:13:00 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXP-00000002bum-3y4B;
	Fri, 09 May 2025 09:13:15 -0400
Message-ID: <20250509131315.794682410@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:03 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 14/31] ftrace: Do not bother checking per CPU "disabled" flag
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The per CPU "disabled" value was the original way to disable tracing when
the tracing subsystem was first created. Today, the ring buffer
infrastructure has its own way to disable tracing. In fact, things have
changed so much since 2008 that many things ignore the disable flag.

There's no reason for the function tracer to check it, if tracing is
disabled, the ring buffer will not record the event anyway.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250505212234.868972758@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_functions.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index 98ccf3f00c51..bd153219a712 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -209,7 +209,6 @@ function_trace_call(unsigned long ip, unsigned long parent_ip,
 		    struct ftrace_ops *op, struct ftrace_regs *fregs)
 {
 	struct trace_array *tr = op->private;
-	struct trace_array_cpu *data;
 	unsigned int trace_ctx;
 	int bit;
 
@@ -224,9 +223,7 @@ function_trace_call(unsigned long ip, unsigned long parent_ip,
 
 	trace_ctx = tracing_gen_ctx_dec();
 
-	data = this_cpu_ptr(tr->array_buffer.data);
-	if (!atomic_read(&data->disabled))
-		trace_function(tr, ip, parent_ip, trace_ctx, NULL);
+	trace_function(tr, ip, parent_ip, trace_ctx, NULL);
 
 	ftrace_test_recursion_unlock(bit);
 }
@@ -236,10 +233,8 @@ function_args_trace_call(unsigned long ip, unsigned long parent_ip,
 			 struct ftrace_ops *op, struct ftrace_regs *fregs)
 {
 	struct trace_array *tr = op->private;
-	struct trace_array_cpu *data;
 	unsigned int trace_ctx;
 	int bit;
-	int cpu;
 
 	if (unlikely(!tr->function_enabled))
 		return;
@@ -250,10 +245,7 @@ function_args_trace_call(unsigned long ip, unsigned long parent_ip,
 
 	trace_ctx = tracing_gen_ctx();
 
-	cpu = smp_processor_id();
-	data = per_cpu_ptr(tr->array_buffer.data, cpu);
-	if (!atomic_read(&data->disabled))
-		trace_function(tr, ip, parent_ip, trace_ctx, fregs);
+	trace_function(tr, ip, parent_ip, trace_ctx, fregs);
 
 	ftrace_test_recursion_unlock(bit);
 }
@@ -352,7 +344,6 @@ function_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
 {
 	struct trace_func_repeats *last_info;
 	struct trace_array *tr = op->private;
-	struct trace_array_cpu *data;
 	unsigned int trace_ctx;
 	int bit;
 
@@ -364,8 +355,7 @@ function_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
 		return;
 
 	parent_ip = function_get_true_parent_ip(parent_ip, fregs);
-	data = this_cpu_ptr(tr->array_buffer.data);
-	if (atomic_read(&data->disabled))
+	if (!tracer_tracing_is_on(tr))
 		goto out;
 
 	/*
-- 
2.47.2


