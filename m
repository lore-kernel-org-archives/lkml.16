Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A21EB183
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630227; cv=none; b=aJ9XCep93/2+CQuUTeHz7x4JAZWQX18vVeIGECwFkGdXldAXhEYA/Ds9EJ1R0QHbzxWiPoPUWEZLE0FrpgexnHTe9x2yn2AzY/yEdePPhBfhTxeSnt2wnouxznByprkTDUjiUGQRJ5Wlqyxhe3pUxpFLRxMNMUUIcLOfD9JnF5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630227; c=relaxed/simple;
	bh=EmL5cMh4rUmabqQUX/yuAijaaalAS3/NDu1kKDHndk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aJ9oxiBlLi+dTI+TPjUmxfv+no5WEfKaL9QPcVzYkxweN5l4Wk7k3sbQ6rXp3Zi6JmMJgphVC8vFRS5ct+Sqp0M2A8Li2GlZweYNVekm4KErysQrZuSZ4cu0LXWA18exHaGWl10hl3DlHUME4sAvh0WYyx26TQDO5yr3tfhUaUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D24C4CEDD;
	Wed,  2 Apr 2025 21:43:45 +0000 (UTC)
Date: Wed, 2 Apr 2025 17:44:49 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Gabriele Monaco <gmonaco@redhat.com>, Vasily
 Gorbik <gor@linux.ibm.com>, zhoumin <teczm@foxmail.com>
Subject: [GIT PULL] tracing: Fixes for 6.15
Message-ID: <20250402174449.08caae28@gandalf.local.home>
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

- Add cond_resched() to loop in ftrace_graph_set_hash()

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

- Fix mcount sorttable building for different endian type target

  When modifying the ELF file to sort the mcount_loc table in the
  sorttable.c code, the endianess of the file and the host is used
  to determine if the bytes need to be swapped when calculations are
  done. A change was made to the sorting of the mcount_loc that read
  the values from the ELF file into an array and the swap happened
  on the filling of the array. But one of the calculations of the
  array still did the swap when it did not need to. This caused building
  on a little endian machine for a big endian target to not find
  the mcount function in the 'nm' table and it zeroed it out, causing
  there to be no functions available to trace.

- Add goto out_unlock jump to rv_register_monitor() on error path

  One of the error paths in rv_register_monitor() just returned the
  error when it should have jumped to the out_unlock label to release
  the mutex.

These are all fixes that have been made within the last week.
I based the tag off of the last pull request you did on one of my topic
branches so that it included all the topic branches and all the fixes can
be added together in this pull request.

Please pull the latest trace-v6.15-2 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.15-2

Tag SHA1: ffc2ad5b831176f95fc2406a812cee19c0005815
Head SHA1: fc0585c7faa9fffa0ecdd6e2466e3293cd3239ac


Gabriele Monaco (1):
      rv: Fix missing unlock on double nested monitors return path

Steven Rostedt (3):
      ftrace: Have tracing function args depend on PROBE_EVENTS_BTF_ARGS
      tracing: Free module_delta on freeing of persistent ring buffer
      tracing: Verify event formats that have "%*p.."

Vasily Gorbik (1):
      scripts/sorttable: Fix endianness handling in build-time mcount sort

zhoumin (1):
      ftrace: Add cond_resched() to ftrace_graph_set_hash()

----
 kernel/trace/Kconfig                       | 3 +--
 kernel/trace/ftrace.c                      | 1 +
 kernel/trace/rv/rv.c                       | 3 ++-
 kernel/trace/trace.c                       | 1 +
 kernel/trace/trace_events.c                | 7 +++++++
 samples/trace_events/trace-events-sample.h | 8 ++++++--
 scripts/sorttable.c                        | 2 +-
 7 files changed, 19 insertions(+), 6 deletions(-)
---------------------------
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 033fba0633cf..a3f35c7d83b6 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -265,8 +265,7 @@ config FUNCTION_GRAPH_RETADDR
 
 config FUNCTION_TRACE_ARGS
        bool
-	depends on HAVE_FUNCTION_ARG_ACCESS_API
-	depends on DEBUG_INFO_BTF
+	depends on PROBE_EVENTS_BTF_ARGS
 	default y
 	help
 	  If supported with function argument access API and BTF, then
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 92015de6203d..1a48aedb5255 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6855,6 +6855,7 @@ ftrace_graph_set_hash(struct ftrace_hash *hash, char *buffer)
 				}
 			}
 		}
+		cond_resched();
 	} while_for_each_ftrace_rec();
 
 	return fail ? -EINVAL : 0;
diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
index 50344aa9f7f9..968c5c3b0246 100644
--- a/kernel/trace/rv/rv.c
+++ b/kernel/trace/rv/rv.c
@@ -809,7 +809,8 @@ int rv_register_monitor(struct rv_monitor *monitor, struct rv_monitor *parent)
 	if (p && rv_is_nested_monitor(p)) {
 		pr_info("Parent monitor %s is already nested, cannot nest further\n",
 			parent->name);
-		return -EINVAL;
+		retval = -EINVAL;
+		goto out_unlock;
 	}
 
 	r = kzalloc(sizeof(struct rv_monitor_def), GFP_KERNEL);
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 103b193875b3..de6d7f0e6206 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9609,6 +9609,7 @@ static void free_trace_buffers(struct trace_array *tr)
 		return;
 
 	free_trace_buffer(&tr->array_buffer);
+	kfree(tr->module_delta);
 
 #ifdef CONFIG_TRACER_MAX_TRACE
 	free_trace_buffer(&tr->max_buffer);
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 8638b7f7ff85..069e92856bda 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -470,6 +470,7 @@ static void test_event_printk(struct trace_event_call *call)
 			case '%':
 				continue;
 			case 'p':
+ do_pointer:
 				/* Find dereferencing fields */
 				switch (fmt[i + 1]) {
 				case 'B': case 'R': case 'r':
@@ -498,6 +499,12 @@ static void test_event_printk(struct trace_event_call *call)
 						continue;
 					if (fmt[i + j] == '*') {
 						star = true;
+						/* Handle %*pbl case */
+						if (!j && fmt[i + 1] == 'p') {
+							arg++;
+							i++;
+							goto do_pointer;
+						}
 						continue;
 					}
 					if ((fmt[i + j] == 's')) {
diff --git a/samples/trace_events/trace-events-sample.h b/samples/trace_events/trace-events-sample.h
index 999f78d380ae..1a05fc153353 100644
--- a/samples/trace_events/trace-events-sample.h
+++ b/samples/trace_events/trace-events-sample.h
@@ -319,7 +319,8 @@ TRACE_EVENT(foo_bar,
 		__assign_cpumask(cpum, cpumask_bits(mask));
 	),
 
-	TP_printk("foo %s %d %s %s %s %s %s %s (%s) (%s) %s", __entry->foo, __entry->bar,
+	TP_printk("foo %s %d %s %s %s %s %s %s (%s) (%s) %s [%d] %*pbl",
+		  __entry->foo, __entry->bar,
 
 /*
  * Notice here the use of some helper functions. This includes:
@@ -370,7 +371,10 @@ TRACE_EVENT(foo_bar,
 
 		  __get_str(str), __get_str(lstr),
 		  __get_bitmask(cpus), __get_cpumask(cpum),
-		  __get_str(vstr))
+		  __get_str(vstr),
+		  __get_dynamic_array_len(cpus),
+		  __get_dynamic_array_len(cpus),
+		  __get_dynamic_array(cpus))
 );
 
 /*
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 7b4b3714b1af..deed676bfe38 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -857,7 +857,7 @@ static void *sort_mcount_loc(void *arg)
 		for (void *ptr = vals; ptr < vals + size; ptr += long_size) {
 			uint64_t key;
 
-			key = long_size == 4 ? r((uint32_t *)ptr) : r8((uint64_t *)ptr);
+			key = long_size == 4 ? *(uint32_t *)ptr : *(uint64_t *)ptr;
 			if (!find_func(key)) {
 				if (long_size == 4)
 					*(uint32_t *)ptr = 0;
