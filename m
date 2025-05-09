Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392E0293B42
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796382; cv=none; b=jD520gbHMaLCe/evHUmk+mDxTx09TZI4rm5nHnf+h4GAUkc+EHwEsvL9wyMn5LM/vEJtj9jo7Xi6yWZTwJ8sYPPpr7eB84qgc9YuVDATNukUpoOo9eT54Zfgp13PPxlv/fgcxzIVgzyJWn5NjxNGPqnBtmIMmPq3TIqsEhEf4rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796382; c=relaxed/simple;
	bh=qPP3CvHK8t4fr7gLX3mL04NCQ8w/oQ01akHffgDkhj8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=L/1U8flERSuUo/pi6RSAY77dCr4FI9GX6YcNI1K3X8fv2vOZFB55uflFuQnW+KZ6tgAVELYV4qqDqAkcjLqQcGf+fw6WmzZQY225Sspa+6WtBBWfgkdeTvyTijZDFVfuGAhVy5Xl6tz0it8qvTUdS8aifCT1lJfRnDIF1tD5xkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20324C4CEF1;
	Fri,  9 May 2025 13:13:02 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXR-00000002bzn-2nIO;
	Fri, 09 May 2025 09:13:17 -0400
Message-ID: <20250509131317.512092358@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 24/31] tracing: Use atomic_inc_return() for updating "disabled" counter in
 irqsoff tracer
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The irqsoff tracer uses the per CPU "disabled" field to prevent corruption
of the accounting when it starts to trace interrupts disabled, but there's
a slight race that could happen if for some reason it was called twice.
Use atomic_inc_return() instead.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250505212236.567884756@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_irqsoff.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/kernel/trace/trace_irqsoff.c b/kernel/trace/trace_irqsoff.c
index 0b6d932a931e..5496758b6c76 100644
--- a/kernel/trace/trace_irqsoff.c
+++ b/kernel/trace/trace_irqsoff.c
@@ -397,6 +397,7 @@ start_critical_timing(unsigned long ip, unsigned long parent_ip)
 	int cpu;
 	struct trace_array *tr = irqsoff_trace;
 	struct trace_array_cpu *data;
+	long disabled;
 
 	if (!tracer_enabled || !tracing_is_enabled())
 		return;
@@ -411,15 +412,17 @@ start_critical_timing(unsigned long ip, unsigned long parent_ip)
 	if (unlikely(!data) || local_read(&data->disabled))
 		return;
 
-	local_inc(&data->disabled);
+	disabled = local_inc_return(&data->disabled);
 
-	data->critical_sequence = max_sequence;
-	data->preempt_timestamp = ftrace_now(cpu);
-	data->critical_start = parent_ip ? : ip;
+	if (disabled == 1) {
+		data->critical_sequence = max_sequence;
+		data->preempt_timestamp = ftrace_now(cpu);
+		data->critical_start = parent_ip ? : ip;
 
-	__trace_function(tr, ip, parent_ip, tracing_gen_ctx());
+		__trace_function(tr, ip, parent_ip, tracing_gen_ctx());
 
-	per_cpu(tracing_cpu, cpu) = 1;
+		per_cpu(tracing_cpu, cpu) = 1;
+	}
 
 	local_dec(&data->disabled);
 }
@@ -431,6 +434,7 @@ stop_critical_timing(unsigned long ip, unsigned long parent_ip)
 	struct trace_array *tr = irqsoff_trace;
 	struct trace_array_cpu *data;
 	unsigned int trace_ctx;
+	long disabled;
 
 	cpu = raw_smp_processor_id();
 	/* Always clear the tracing cpu on stopping the trace */
@@ -448,12 +452,15 @@ stop_critical_timing(unsigned long ip, unsigned long parent_ip)
 	    !data->critical_start || local_read(&data->disabled))
 		return;
 
-	local_inc(&data->disabled);
+	disabled = local_inc_return(&data->disabled);
+
+	if (disabled == 1) {
+		trace_ctx = tracing_gen_ctx();
+		__trace_function(tr, ip, parent_ip, trace_ctx);
+		check_critical_timing(tr, data, parent_ip ? : ip, cpu);
+		data->critical_start = 0;
+	}
 
-	trace_ctx = tracing_gen_ctx();
-	__trace_function(tr, ip, parent_ip, trace_ctx);
-	check_critical_timing(tr, data, parent_ip ? : ip, cpu);
-	data->critical_start = 0;
 	local_dec(&data->disabled);
 }
 
-- 
2.47.2


