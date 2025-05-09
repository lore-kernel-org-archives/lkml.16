Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F5F29375A
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796382; cv=none; b=mv8C6C3jUotJd2cDjHoGX8cTFrVV3X43pdkGcXZNZDYkkk6jfrmpafttPEypTyiElhT1EB3JwEiG0ruZKJNXNr2sqvWOD5vGBz2psphYfJyRMdgxPbrbmvRE0PbvRwNX9TXaATKeDm3gaD+348N1LsAn8s54VDGjTRESuO+FR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796382; c=relaxed/simple;
	bh=fE0eJpd6kBWM05p3RQocRcUqNTeOZ31V1UkwHVx9TOM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=vAy9D1x5+Wh7pG8ys5O7yMhhwaevRaa2bJR7fY5hmgv9iNv7DASEj8ldQl3hB2Hiws6PFnLXdxCkyskVn7uCpG218kgIR1LV5jrzRu90twQ0DEU+jQr1v2vnylDQd5GjgUum3rbIdTHwdmQfUbiC5K1z8e1195dp3R0NFIqPdbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3885C4AF09;
	Fri,  9 May 2025 13:13:01 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXR-00000002byn-1JnC;
	Fri, 09 May 2025 09:13:17 -0400
Message-ID: <20250509131317.164151927@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 22/31] tracing: branch: Use trace_tracing_is_on_cpu() instead of "disabled"
 field
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The branch tracer currently checks the per CPU "disabled" field to know if
tracing is enabled or not for the CPU. As the "disabled" value is not used
anymore to turn of tracing generically, use tracing_tracer_is_on_cpu()
instead.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250505212236.224658526@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_branch.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/trace/trace_branch.c b/kernel/trace/trace_branch.c
index 6d08a5523ce0..6809b370e991 100644
--- a/kernel/trace/trace_branch.c
+++ b/kernel/trace/trace_branch.c
@@ -32,7 +32,6 @@ probe_likely_condition(struct ftrace_likely_data *f, int val, int expect)
 {
 	struct trace_array *tr = branch_tracer;
 	struct trace_buffer *buffer;
-	struct trace_array_cpu *data;
 	struct ring_buffer_event *event;
 	struct trace_branch *entry;
 	unsigned long flags;
@@ -54,8 +53,7 @@ probe_likely_condition(struct ftrace_likely_data *f, int val, int expect)
 
 	raw_local_irq_save(flags);
 	current->trace_recursion |= TRACE_BRANCH_BIT;
-	data = this_cpu_ptr(tr->array_buffer.data);
-	if (atomic_read(&data->disabled))
+	if (!tracer_tracing_is_on_cpu(tr, raw_smp_processor_id()))
 		goto out;
 
 	trace_ctx = tracing_gen_ctx_flags(flags);
-- 
2.47.2


