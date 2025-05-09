Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72BA29116A
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796378; cv=none; b=rr4iW/HZYYQlRPalKriYjSVJ51EGkjqOJ92WSilVUkHnNuLDgYtFUM+CAfpLpkfTuRz1b1crgWiDhAHLOuKLVgB9aORudYX4hpXmDD0Bjn/6xwMBowD26FJJJY0Y7d4qsPtwjkAsfcqtWX+iFcMNhYyF4cd9FRoGjMJ2aVEkanQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796378; c=relaxed/simple;
	bh=z1xCrAabZiQUvTwdwOsMJsc68Yxi5MBS/RYz9fmxYik=;
	h=Message-ID:Date:From:To:Cc:Subject; b=NVi3AcUQ8ZckYNQzoLHm8C0J8gKN6u+kuIkFmNl+9XDQTcVX/MGHcd5Mwl6HggsWke3QA2o/HzGAGdGukSjHHtwZM2aXXqiK7EwTKc+8dUtfQfAcN9i31Ir20b+oXo+1eVKmMWUYKYYrFs5PgWONzhcO7oezLVSaIbeJIIFiFyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A99EC4CEE4;
	Fri,  9 May 2025 13:12:58 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXN-00000002bnm-2OCU;
	Fri, 09 May 2025 09:13:13 -0400
Message-ID: <20250509131249.340302366@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:12:49 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 00/31] tracing: Updates for v6.16
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/for-next

Head SHA1: 98e1783bf20da8f969c30e79adb9a6bc5bbf54e2


Devaansh Kumar (1):
      tracing: Replace deprecated strncpy() with strscpy() for stack_trace_filter_buf

Ilya Leoshkevich (1):
      ftrace: Expose call graph depth as unsigned int

Miaoqian Lin (1):
      tracing: Fix error handling in event_trigger_parse()

Steven Rostedt (27):
      tracing: Update function trace addresses with module addresses
      tracing: Show function names when possible when listing fields
      tracing: Only return an adjusted address if it matches the kernel address
      tracing: Adjust addresses for printing out fields
      tracing: Show preempt and irq events callsites from the offsets in field print
      tracing: Always use memcpy() in histogram add_to_key()
      tracing: Move histogram trigger variables from stack to per CPU structure
      tracing: Add common_comm to histograms
      ftrace: Show subops in enabled_functions
      ftrace: Comment that ftrace_func_mapper is freed with free_ftrace_hash()
      tracing/mmiotrace: Remove reference to unused per CPU data pointer
      ftrace: Do not bother checking per CPU "disabled" flag
      tracing: Just use this_cpu_read() to access ignore_pid
      tracing: Add tracer_tracing_disable/enable() functions
      tracing: Use tracer_tracing_disable() instead of "disabled" field for ftrace_dump_one()
      tracing: kdb: Use tracer_tracing_on/off() instead of setting per CPU disabled
      ftrace: Do not disabled function graph based on "disabled" field
      tracing: Do not use per CPU array_buffer.data->disabled for cpumask
      ring-buffer: Add ring_buffer_record_is_on_cpu()
      tracing: branch: Use trace_tracing_is_on_cpu() instead of "disabled" field
      tracing: Convert the per CPU "disabled" counter to local from atomic
      tracing: Use atomic_inc_return() for updating "disabled" counter in irqsoff tracer
      tracing: Remove unused buffer_page field from trace_array_cpu structure
      tracing: Rename event_trigger_alloc() to trigger_data_alloc()
      tracing: Remove unnecessary "goto out" that simply returns ret is trigger code
      tracing: Add a helper function to handle the dereference arg in verifier
      tracing: Allow the top level trace_marker to write into another instances

Tomas Glozar (1):
      tracing/osnoise: Allow arbitrarily long CPU string

----
 Documentation/trace/ftrace.rst       |  13 +++
 include/linux/ftrace.h               |   2 +
 include/linux/ring_buffer.h          |   1 +
 kernel/trace/fgraph.c                |   2 +
 kernel/trace/ftrace.c                |  45 +++++++-
 kernel/trace/ring_buffer.c           |  18 ++++
 kernel/trace/trace.c                 | 195 +++++++++++++++++++++++++++--------
 kernel/trace/trace.h                 |  30 ++++--
 kernel/trace/trace_branch.c          |   4 +-
 kernel/trace/trace_entries.h         |  12 +--
 kernel/trace/trace_events.c          |  39 ++++---
 kernel/trace/trace_events_hist.c     | 179 ++++++++++++++++++++++++++------
 kernel/trace/trace_events_trigger.c  |  64 +++++-------
 kernel/trace/trace_functions.c       |  24 ++---
 kernel/trace/trace_functions_graph.c |  38 ++-----
 kernel/trace/trace_irqsoff.c         |  47 +++++----
 kernel/trace/trace_kdb.c             |   9 +-
 kernel/trace/trace_mmiotrace.c       |  12 +--
 kernel/trace/trace_osnoise.c         |   9 +-
 kernel/trace/trace_output.c          |  60 +++++++----
 kernel/trace/trace_sched_wakeup.c    |  18 ++--
 kernel/trace/trace_stack.c           |   2 +-
 22 files changed, 570 insertions(+), 253 deletions(-)
