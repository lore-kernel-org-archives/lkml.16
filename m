Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B53D293454
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796381; cv=none; b=oF6QY9fDeEHOr3H81HFcu3kl5lsWYOFqR3XD3je4g/ZZFnE22RHM0JeSOY6LFLmdaJcel2k3S0biyUHmbTII/mnqERgrdvEED4Eena5qA4rOUAAjTPdMJGvZaeIDo+Dysjymp34D1P1S4Zwjr005aMS0aAgyqGwaE/DgmtEavow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796381; c=relaxed/simple;
	bh=xwQUJHkXERbxk/si81Gpn8n1YOu4O5M9Z89z+7M7IpQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=gWu7pUs9Hxhd0zijDX4dY/korgGxMfAXGq7J+wmGnDwLX7MHkZEOwWdEa8agj6yiM82FE+EbHi5oamaM1WG9eCvjjvNyresW44768iKmgtE6J6o5rijHdzuOxSdvKtcZBBdqyimGQgmde8ymA8Mv1OnJrzgM8Z/alARtvk7B4+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D40C4CEEE;
	Fri,  9 May 2025 13:13:00 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXQ-00000002bwH-1vyP;
	Fri, 09 May 2025 09:13:16 -0400
Message-ID: <20250509131316.315091499@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 17/31] tracing: Use tracer_tracing_disable() instead of "disabled" field for
 ftrace_dump_one()
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

The ftrace_dump_one() function iterates over all the current tracing CPUs and
increments the "disabled" counter before doing the dump, and decrements it
afterward.

As the disabled flag can be ignored, doing this today is not reliable.
Instead use the new tracer_tracing_disable() that calls into the ring
buffer code to do the disabling.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250505212235.381188238@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index b691af1c1b5a..bb514e988f22 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -10484,7 +10484,7 @@ static void ftrace_dump_one(struct trace_array *tr, enum ftrace_dump_mode dump_m
 	static struct trace_iterator iter;
 	unsigned int old_userobj;
 	unsigned long flags;
-	int cnt = 0, cpu;
+	int cnt = 0;
 
 	/*
 	 * Always turn off tracing when we dump.
@@ -10501,9 +10501,8 @@ static void ftrace_dump_one(struct trace_array *tr, enum ftrace_dump_mode dump_m
 	/* Simulate the iterator */
 	trace_init_iter(&iter, tr);
 
-	for_each_tracing_cpu(cpu) {
-		atomic_inc(&per_cpu_ptr(iter.array_buffer->data, cpu)->disabled);
-	}
+	/* While dumping, do not allow the buffer to be enable */
+	tracer_tracing_disable(tr);
 
 	old_userobj = tr->trace_flags & TRACE_ITER_SYM_USEROBJ;
 
@@ -10562,9 +10561,7 @@ static void ftrace_dump_one(struct trace_array *tr, enum ftrace_dump_mode dump_m
 
 	tr->trace_flags |= old_userobj;
 
-	for_each_tracing_cpu(cpu) {
-		atomic_dec(&per_cpu_ptr(iter.array_buffer->data, cpu)->disabled);
-	}
+	tracer_tracing_enable(tr);
 	local_irq_restore(flags);
 }
 
-- 
2.47.2


