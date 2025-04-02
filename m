Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1541F2E3385
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 02:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743560553; cv=none; b=KDeYRTuFjMqKnAY2STOt4GcfqdNbyL91eOOd34P6oGCkWq40ZAoPdtCU/FnvdTSlho/dJhAmlSl1QLBligLuuG5DvepDLSlYtgVFbGRKy+BTKu5hiw5RDfOpTx4qTj/6peXdqnXbKQ2LJ64maCAIDCVl4NsHy2WQ8Onom0qQIaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743560553; c=relaxed/simple;
	bh=Xp9TtxQmYXW4JYsRoq3qW7k3jmLkOuXV9LSGlq6Qwlk=;
	h=Message-ID:Date:From:To:Cc:Subject; b=JWnw+ia74uvOfF6pVQCpwGgnc7zWXv9d9wMuGh0ZHlzi+G00X268xHIpOjCe9IwpCYFpUzcOOodR8YzMmOAwVW4TP5Ik9KRX4U0PtBM3Qi1KfJldYyV9Mp38j6wZWjK47Q0wEFANW/xKbew/2RxLQscWi5IEoa0L0b/8ICrSWlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B219C4CEEB;
	Wed,  2 Apr 2025 02:22:32 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tznlO-00000006MMq-2kBc;
	Tue, 01 Apr 2025 22:23:34 -0400
Message-ID: <20250402022308.372786127@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 01 Apr 2025 22:23:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 0/4] tracing: Fixes for 6.15
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


tracing fixes for 6.15

- Fix build error when CONFIG_PROBE_EVENTS_BTF_ARGS is not enabled

  The tracing of arguments in the function tracer depends on some
  functions that are only defined when PROBE_EVENTS_BTF_ARGS is enabled.
  In fact, PROBE_EVENTS_BTF_ARGS also depends on all the same configs
  as the function argument tracing requires. Just have the function
  argument tracing depend on PROBE_EVENTS_BTF_ARGS.

- Free module_delta for persistent ring buffer instance

  When an instance holds the persistent ring buffer, it allocates
  a helper array to hold the deltas between where modules are loaded
  on the last boot and the current boot. This array needs to be freed
  when the instance is freed.

- Add cond_reschd() to loop in ftrace_graph_set_hash()

  The hash functions in ftrace loop over every function that can be
  enabled by ftrace. This can be 50,000 functions or more. This
  loop is known to trigger soft lockup warnings and requires a
  cond_resched(). The loop in ftrace_graph_set_hash() was missing it.

- Fix the event format verifier to include "%*p.." arguments

  To prevent events from dereferencing stale pointers that can
  happen if a trace event uses a dereferece pointer to something
  that was not copied into the ring buffer and can be freed by the
  time the trace is read, a verifier is called. At boot or module
  load, the verifier scans the print format string for pointers
  that can be dereferenced and it checks the arguments to make sure
  they do not contain something that can be freed. The "%*p" was
  not handled, which would add another argument and cause the verifier
  to not only not verify this pointer, but it will look at the wrong
  argument for every pointer after that.

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 1bf4f0161e70a33c602732c5e0f0fdb268f130e1


Steven Rostedt (3):
      ftrace: Have tracing function args depend on PROBE_EVENTS_BTF_ARGS
      tracing: Free module_delta on freeing of persistent ring buffer
      tracing: Verify event formats that have "%*p.."

zhoumin (1):
      ftrace: Add cond_resched() to ftrace_graph_set_hash()

----
 kernel/trace/Kconfig                       | 3 +--
 kernel/trace/ftrace.c                      | 1 +
 kernel/trace/trace.c                       | 1 +
 kernel/trace/trace_events.c                | 7 +++++++
 samples/trace_events/trace-events-sample.h | 8 ++++++--
 5 files changed, 16 insertions(+), 4 deletions(-)
