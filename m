Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AC4293464
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796381; cv=none; b=nrUgj9d55kPOe+lpKYeVOxdpuXBemdoYPQ+DbuGMW/buutBJCZKil8VuqwiA8X/JCT8HO5ONSqmH+nezHMRDJhBTAhieGbghdM0/XJUKCp916BIiMWtoI4tezpsLYesw7MvDpRQ/eJ9HT2p6bkCEpWgW/l4rYjiog06poYLXq/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796381; c=relaxed/simple;
	bh=gX/BulkDUJDwwS4uSbgk0YaF4aNaSOdd1ywJ8eDw4Kg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=UTZIr3e8DmU40RJ7THAyD5/xP+ShRA55UYlPWVrXczglsNSMudiNlNQJZAjKPFwZDSApjp/dXuQVEiZOsToRlLQaIG3sq7+BOFtEeNwEKiq+g57dNDFTJz0M9ogRdIg2mlPMRybnPpPDlAeBo/umfIQRwykt8fPZNtAa/jCPb/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BF3C4CEEB;
	Fri,  9 May 2025 13:13:01 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXQ-00000002bxm-44H5;
	Fri, 09 May 2025 09:13:16 -0400
Message-ID: <20250509131316.822900740@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 20/31] tracing: Do not use per CPU array_buffer.data->disabled for cpumask
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

Do not bother setting the per CPU disabled flag of the array_buffer data
to use to determine what CPUs can write to the buffer and only rely on the
ring buffer code itself to disabled it.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250505212235.885452497@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index bb514e988f22..0cd681516438 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5081,7 +5081,6 @@ int tracing_set_cpumask(struct trace_array *tr,
 		 */
 		if (cpumask_test_cpu(cpu, tr->tracing_cpumask) &&
 				!cpumask_test_cpu(cpu, tracing_cpumask_new)) {
-			atomic_inc(&per_cpu_ptr(tr->array_buffer.data, cpu)->disabled);
 			ring_buffer_record_disable_cpu(tr->array_buffer.buffer, cpu);
 #ifdef CONFIG_TRACER_MAX_TRACE
 			ring_buffer_record_disable_cpu(tr->max_buffer.buffer, cpu);
@@ -5089,7 +5088,6 @@ int tracing_set_cpumask(struct trace_array *tr,
 		}
 		if (!cpumask_test_cpu(cpu, tr->tracing_cpumask) &&
 				cpumask_test_cpu(cpu, tracing_cpumask_new)) {
-			atomic_dec(&per_cpu_ptr(tr->array_buffer.data, cpu)->disabled);
 			ring_buffer_record_enable_cpu(tr->array_buffer.buffer, cpu);
 #ifdef CONFIG_TRACER_MAX_TRACE
 			ring_buffer_record_enable_cpu(tr->max_buffer.buffer, cpu);
-- 
2.47.2


