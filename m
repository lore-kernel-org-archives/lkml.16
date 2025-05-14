Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECED7281370
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245495; cv=none; b=kJI67n09Abkxy6Rym0UAE7rVa79yS1IY6/IooVGDJb/z2QYUBq08poLDMJx3IK6O/afejUjwkEq5DmozH4ptzZpoCeS65AvUw1e8o/Dvcfz4Far5KQTOyuAtZDgR50Nd8iHid1zugSsBDMoeH9nZwql7L2bngUjDz4DMyf3keSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245495; c=relaxed/simple;
	bh=OIKFuLatd2sjE/5iVdw4MspfZNSVab1gyoq7EYdulEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VEZy0B/aByMJZGHnGotkQ0GJQSCSYa8DEFmmW6Q3IVH8yKOiFKUvk7024Ge/XagnaYhOtHFivfK7C+ghuNOXQkTD8kvhvLfij/rwYSiAuGAzzUrFOUD1dWrZD41K/wYj0NeiYYZP1/AS3v3bDuTjtGToPka4HaQf5ykYH5q28LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD820C4CEEB;
	Wed, 14 May 2025 17:58:12 +0000 (UTC)
Date: Wed, 14 May 2025 13:58:39 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, pengdonglin
 <pengdonglin@xiaomi.com>
Subject: [GIT PULL] tracing: Fixes for v6.15
Message-ID: <20250514135839.5f947295@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Linus,

tracing fixes for 6.15:

- Fix sample code that uses trace_array_printk()

  The sample code for in kernel use of trace_array (that creates an instance
  for use within the kernel) and shows how to use trace_array_printk() that
  writes into the created instance, used trace_printk_init_buffers(). But
  that function is used to initialize normal trace_printk() and produces the
  NOTICE banner which is not needed for use of trace_array_printk(). The
  function to initialize that is trace_array_init_printk() that takes the
  created trace array instance as a parameter.

  Update the sample code to reflect the proper usage.

- Fix preemption count output for stacktrace event

  The tracing buffer shows the preempt count level when an event executes.
  Because writing the event itself disables preemption, this needs to be
  accounted for when recording. The stacktrace event did not account for
  this so the output of the stacktrace event showed preemption was disabled
  while the event that triggered the stacktrace shows preemption is enabled
  and this leads to confusion. Account for preemption being disabled for the
  stacktrace event.

  The same happened for stack traces triggered by function tracer.

- Fix persistent ring buffer when trace_pipe is used

  The ring buffer swaps the reader page with the next page to read from the
  write buffer when trace_pipe is used. If there's only a page of data in
  the ring buffer, this swap will cause the "commit" pointer (last data
  written) to be on the reader page. If more data is written to the buffer,
  it is added to the reader page until it falls off back into the write
  buffer.

  If the system reboots and the commit pointer is still on the reader page,
  even if new data was written, the persistent buffer validator will miss
  finding the commit pointer because it only checks the write buffer and
  does not check the reader page. This causes the validator to fail the
  validation and clear the buffer, where the new data is lost.

  There was a check for this, but it checked the "head pointer", which was
  incorrect, because the "head pointer" always stays on the write buffer and
  is the next page to swap out for the reader page. Fix the logic to catch
  this case and allow the user to still read the data after reboot.


Please pull the latest trace-v6.15-rc6 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.15-rc6

Tag SHA1: b5e2f786d078bcc3bf257edafb92ed180c8bfb26
Head SHA1: 1d6c39c89f617c9fec6bbae166e25b16a014f7c8


Steven Rostedt (2):
      tracing: samples: Initialize trace_array_printk() with the correct function
      ring-buffer: Fix persistent buffer when commit page is the reader page

pengdonglin (2):
      ftrace: Fix preemption accounting for stacktrace trigger command
      ftrace: Fix preemption accounting for stacktrace filter command

----
 kernel/trace/ring_buffer.c          | 8 +++++---
 kernel/trace/trace_events_trigger.c | 2 +-
 kernel/trace/trace_functions.c      | 6 +-----
 samples/ftrace/sample-trace-array.c | 2 +-
 4 files changed, 8 insertions(+), 10 deletions(-)
---------------------------
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index c0f877d39a24..3f9bf562beea 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -1887,10 +1887,12 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 
 	head_page = cpu_buffer->head_page;
 
-	/* If both the head and commit are on the reader_page then we are done. */
-	if (head_page == cpu_buffer->reader_page &&
-	    head_page == cpu_buffer->commit_page)
+	/* If the commit_buffer is the reader page, update the commit page */
+	if (meta->commit_buffer == (unsigned long)cpu_buffer->reader_page->page) {
+		cpu_buffer->commit_page = cpu_buffer->reader_page;
+		/* Nothing more to do, the only page is the reader page */
 		goto done;
+	}
 
 	/* Iterate until finding the commit page */
 	for (i = 0; i < meta->nr_subbufs + 1; i++, rb_inc_page(&head_page)) {
diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_events_trigger.c
index b66b6d235d91..6e87ae2a1a66 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -1560,7 +1560,7 @@ stacktrace_trigger(struct event_trigger_data *data,
 	struct trace_event_file *file = data->private_data;
 
 	if (file)
-		__trace_stack(file->tr, tracing_gen_ctx(), STACK_SKIP);
+		__trace_stack(file->tr, tracing_gen_ctx_dec(), STACK_SKIP);
 	else
 		trace_dump_stack(STACK_SKIP);
 }
diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index 98ccf3f00c51..4e37a0f6aaa3 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -633,11 +633,7 @@ ftrace_traceoff(unsigned long ip, unsigned long parent_ip,
 
 static __always_inline void trace_stack(struct trace_array *tr)
 {
-	unsigned int trace_ctx;
-
-	trace_ctx = tracing_gen_ctx();
-
-	__trace_stack(tr, trace_ctx, FTRACE_STACK_SKIP);
+	__trace_stack(tr, tracing_gen_ctx_dec(), FTRACE_STACK_SKIP);
 }
 
 static void
diff --git a/samples/ftrace/sample-trace-array.c b/samples/ftrace/sample-trace-array.c
index dac67c367457..4147616102f9 100644
--- a/samples/ftrace/sample-trace-array.c
+++ b/samples/ftrace/sample-trace-array.c
@@ -112,7 +112,7 @@ static int __init sample_trace_array_init(void)
 	/*
 	 * If context specific per-cpu buffers havent already been allocated.
 	 */
-	trace_printk_init_buffers();
+	trace_array_init_printk(tr);
 
 	simple_tsk = kthread_run(simple_thread, NULL, "sample-instance");
 	if (IS_ERR(simple_tsk)) {
