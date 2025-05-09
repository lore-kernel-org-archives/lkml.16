Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF47292921
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796380; cv=none; b=qTPUuXQqRJgwT+s5fSWU5dWPQgDuF9rl8PvhDWatICZINg7/zwAiPvg2zQmk/RyihdvBWssjUonj8JKnSYz/yyUsA70x8R6SF2rB1b79UVDgntdi6XpvYo+8UtPnyjjESMUq2sM9XsbOMSsqbpIQT8dyK0kMCXq7smxExCK5xdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796380; c=relaxed/simple;
	bh=u5+NyPKVhcSjs1F3L149FjDH9sUxOKaY4ilHqBMPNe0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=YkgILL3PZs2mJcEsrCpV7m1yWi3UVqORpwMJzJ+fMhsJiX/r3fHBNEm0NnqZxdyraxPvDk5hOJ3CTOCBqcZpvlmOZJhO85cW2FGLS05PaCjwPNQfGMT85jIeiWrv0mRfUQcjNMvxoQV882t74fsgR/MbW++te1dQcj+qfe7iaNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1145C4CEF6;
	Fri,  9 May 2025 13:13:00 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXQ-00000002bvm-1EIO;
	Fri, 09 May 2025 09:13:16 -0400
Message-ID: <20250509131316.139772566@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:13:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [for-next][PATCH 16/31] tracing: Add tracer_tracing_disable/enable() functions
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Allow a tracer to disable writing to its buffer for a temporary amount of
time and re-enable it.

The tracer_tracing_disable() will disable writing to the trace array
buffer, and requires a tracer_tracing_enable() to re-enable it.

The difference between tracer_tracing_disable() and tracer_tracing_off()
is that the disable version can nest, and requires as many enable() calls
as disable() calls to re-enable the buffer. Where as the off() function
can be called multiple times and only requires a singe tracer_tracing_on()
to re-enable the buffer.

Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Daniel Thompson <danielt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/20250505212235.210330010@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 33 +++++++++++++++++++++++++++++++++
 kernel/trace/trace.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 01572ef79802..b691af1c1b5a 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1582,6 +1582,39 @@ void tracer_tracing_off(struct trace_array *tr)
 	smp_wmb();
 }
 
+/**
+ * tracer_tracing_disable() - temporary disable the buffer from write
+ * @tr: The trace array to disable its buffer for
+ *
+ * Expects trace_tracing_enable() to re-enable tracing.
+ * The difference between this and tracer_tracing_off() is that this
+ * is a counter and can nest, whereas, tracer_tracing_off() can
+ * be called multiple times and a single trace_tracing_on() will
+ * enable it.
+ */
+void tracer_tracing_disable(struct trace_array *tr)
+{
+	if (WARN_ON_ONCE(!tr->array_buffer.buffer))
+		return;
+
+	ring_buffer_record_disable(tr->array_buffer.buffer);
+}
+
+/**
+ * tracer_tracing_enable() - counter part of tracer_tracing_disable()
+ * @tr: The trace array that had tracer_tracincg_disable() called on it
+ *
+ * This is called after tracer_tracing_disable() has been called on @tr,
+ * when it's safe to re-enable tracing.
+ */
+void tracer_tracing_enable(struct trace_array *tr)
+{
+	if (WARN_ON_ONCE(!tr->array_buffer.buffer))
+		return;
+
+	ring_buffer_record_enable(tr->array_buffer.buffer);
+}
+
 /**
  * tracing_off - turn off tracing buffers
  *
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 79be1995db44..74f1fe5788d4 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -665,6 +665,8 @@ bool tracing_is_disabled(void);
 bool tracer_tracing_is_on(struct trace_array *tr);
 void tracer_tracing_on(struct trace_array *tr);
 void tracer_tracing_off(struct trace_array *tr);
+void tracer_tracing_disable(struct trace_array *tr);
+void tracer_tracing_enable(struct trace_array *tr);
 struct dentry *trace_create_file(const char *name,
 				 umode_t mode,
 				 struct dentry *parent,
-- 
2.47.2


