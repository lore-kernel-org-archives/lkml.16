Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D7D21ABCF
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526023; cv=none; b=VWvZxI+MdMUYS0SBe8MJi2niF70SPa8ygYfPcomXnVYn+w/L1uhF9z52n9Pe57MvU8avKTRpKsaV/vGwMzUmZBrWSgZCzwZ/tiWoaEOoBN1lfYLUtoiyJHVn3QTZ5MUCjHhGlNSRrwAGQrUNWYO8MOH5S7AbjZn2AfkzNLHYdQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526023; c=relaxed/simple;
	bh=Bnd3FXOtJvXpU+jdhtpTqHCVKv4qdeP/LR8hQUJRSCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F9ehn/kxISKMZQhuCTL053UwyrOXisS3RP3/g7a4PyIS2/zvBAJ8wF/GWFjZwCM7Fq8OcvcaLxpnc7Ml8rkhomeaKIJyLFG+vHYY+ZYBqPUkXVbUxnsCNvSaxYLmPxmuM6IUjvvM4uXGNxdARo6KlbtVpY2AXoXtn1N8EH/AMgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5A8C4CEE7;
	Thu, 29 May 2025 13:40:20 +0000 (UTC)
Date: Thu, 29 May 2025 09:41:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Devaansh Kumar <devaanshk840@gmail.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Miaoqian Lin <linmq006@gmail.com>, Pan
 Taixi <pantaixi@huaweicloud.com>, Tomas Glozar <tglozar@redhat.com>, Yury
 Norov <yury.norov@gmail.com>
Subject: [GIT PULL] tracing: Updates for v6.16
Message-ID: <20250529094122.245fb887@gandalf.local.home>
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

[
  Note, this has a small merge conflict with include/trace/events/tcp.h
  which should have:

 -DECLARE_TRACE(tcp_cwnd_reduction_tp,
 +DECLARE_TRACE(tcp_cwnd_reduction,

 As this series makes DECLARE_TRACE() always add the "_tp" suffix.
]

tracing updates for v6.16:

- Have module addresses get updated in the persistent ring buffer

  The addresses of the modules from the previous boot are saved in the
  persistent ring buffer. If the same modules are loaded and an address is
  in the old buffer points to an address that was both saved in the
  persistent ring buffer and is loaded in memory, shift the address to point
  to the address that is loaded in memory in the trace event.

- Print function names for irqs off and preempt off callsites

  When ignoring the print fmt of a trace event and just printing the fields
  directly, have the fields for preempt off and irqs off events still show
  the function name (via kallsyms) instead of just showing the raw address.

- Clean ups of the histogram code

  The histogram functions saved over 800 bytes on the stack to process
  events as they come in. Instead, create per-cpu buffers that can hold this
  information and have a separate location for each context level (thread,
  softirq, IRQ and NMI).

  Also add some more comments to the code.

- Add "common_comm" field for histograms

  Add "common_comm" that uses the current->comm as a field in an event
  histogram and acts like any of the other fields of the event.

- Show "subops" in the enabled_functions file

  When the function graph infrastructure is used, a subsystem has a "subops"
  that it attaches its callback function to. Instead of the
  enabled_functions just showing a function calling the function that calls
  the subops functions, also show the subops functions that will get called
  for that function too.

- Add "copy_trace_marker" option to instances

  There are cases where an instance is created for tooling to write into,
  but the old tooling has the top level instance hardcoded into the
  application. New tools want to consume the data from an instance and not
  the top level buffer. By adding a copy_trace_marker option, whenever the
  top instance trace_marker is written into, a copy of it is also written
  into the instance with this option set. This allows new tools to read what
  old tools are writing into the top buffer.

  If this option is cleared by the top instance, then what is written into
  the trace_marker is not written into the top instance. This is a way to
  redirect the trace_marker writes into another instance.

- Have tracepoints created by DECLARE_TRACE() use trace_<name>_tp()

  If a tracepoint is created by DECLARE_TRACE() instead of TRACE_EVENT(),
  then it will not be exposed via tracefs. Currently there's no way to
  differentiate in the kernel the tracepoint functions between those that
  are exposed via tracefs or not. A calling convention has been made
  manually to append a "_tp" prefix for events created by DECLARE_TRACE().
  Instead of doing this manually, force it so that all DECLARE_TRACE()
  events have this notation.

- Use __string() for task->comm in some sched events

  Instead of hardcoding the comm to be TASK_COMM_LEN in some of the
  scheduler events use __string() which makes it dynamic. Note, if these
  events are parsed by user space it they may break, and the event may have
  to be converted back to the hardcoded size.

- Have function graph "depth" be unsigned to the user

  Internally to the kernel, the "depth" field of the function graph event is
  signed due to -1 being used for end of boundary. What actually gets
  recorded in the event itself is zero or positive. Reflect this to user
  space by showing "depth" as unsigned int and be consistent across all
  events.

- Allow an arbitrary long CPU string to osnoise_cpus_write()

  The filtering of which CPUs to write to can exceed 256 bytes. If a machine
  has 256 CPUs, and the filter is to filter every other CPU, the write would
  take a string larger than 256 bytes. Instead of using a fixed size buffer
  on the stack that is 256 bytes, allocate it to handle what is passed in.

- Stop having ftrace check the per-cpu data "disabled" flag

  The "disabled" flag in the data structure passed to most ftrace functions
  is checked to know if tracing has been disabled or not. This flag was
  added back in 2008 before the ring buffer had its own way to disable
  tracing. The "disable" flag is now not always set when needed, and the
  ring buffer flag should be used in all locations where the disabled is
  needed. Since the "disable" flag is redundant and incorrect, stop using it.
  Fix up some locations that use the "disable" flag to use the ring buffer
  info.

- Use a new tracer_tracing_disable/enable() instead of data->disable flag

  There's a few cases that set the data->disable flag to stop tracing, but
  this flag is not consistently used. It is also an on/off switch where if a
  function set it and calls another function that sets it, the called
  function may incorrectly enable it.

  Use a new trace_tracing_disable() and tracer_tracing_enable() that uses a
  counter and can be nested. These use the ring buffer flags which are
  always checked making the disabling more consistent.

- Save the trace clock in the persistent ring buffer

  Save what clock was used for tracing in the persistent ring buffer and set
  it back to that clock after a reboot.

- Remove unused reference to a per CPU data pointer in mmiotrace functions

- Remove unused buffer_page field from trace_array_cpu structure

- Remove more strncpy() instances

- Other minor clean ups and fixes


Please pull the latest trace-v6.16 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.16

Tag SHA1: f02d35b1e21423d6f9043f1b846f61ef9a42a30d
Head SHA1: 2fbdb6d8e03b70668c0876e635506540ae92ab05


Devaansh Kumar (1):
      tracing: Replace deprecated strncpy() with strscpy() for stack_trace_filter_buf

Ilya Leoshkevich (1):
      ftrace: Expose call graph depth as unsigned int

Masami Hiramatsu (Google) (1):
      tracing: Record trace_clock and recover when reboot

Miaoqian Lin (1):
      tracing: Fix error handling in event_trigger_parse()

Pan Taixi (1):
      tracing: Fix compilation warning on arm32

Steven Rostedt (29):
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
      tracepoint: Have tracepoints created with DECLARE_TRACE() have _tp suffix
      tracing/sched: Use __string() instead of fixed lengths for task->comm

Tomas Glozar (1):
      tracing/osnoise: Allow arbitrarily long CPU string

Yury Norov (1):
      tracing: Cleanup upper_empty() in pid_list

----
 Documentation/trace/ftrace.rst                     |  13 ++
 Documentation/trace/tracepoints.rst                |  17 +-
 include/linux/ftrace.h                             |   2 +
 include/linux/ring_buffer.h                        |   1 +
 include/linux/tracepoint.h                         |  38 ++--
 include/trace/bpf_probe.h                          |   8 +-
 include/trace/define_trace.h                       |  17 +-
 include/trace/events/sched.h                       | 124 ++++++------
 include/trace/events/tcp.h                         |   2 +-
 kernel/trace/fgraph.c                              |   2 +
 kernel/trace/ftrace.c                              |  45 ++++-
 kernel/trace/pid_list.c                            |   8 +-
 kernel/trace/ring_buffer.c                         |  18 ++
 kernel/trace/trace.c                               | 214 +++++++++++++++++----
 kernel/trace/trace.h                               |  30 ++-
 kernel/trace/trace_branch.c                        |   4 +-
 kernel/trace/trace_entries.h                       |  12 +-
 kernel/trace/trace_events.c                        |  39 ++--
 kernel/trace/trace_events_hist.c                   | 179 ++++++++++++++---
 kernel/trace/trace_events_trigger.c                |  64 +++---
 kernel/trace/trace_functions.c                     |  24 +--
 kernel/trace/trace_functions_graph.c               |  38 +---
 kernel/trace/trace_irqsoff.c                       |  47 +++--
 kernel/trace/trace_kdb.c                           |   9 +-
 kernel/trace/trace_mmiotrace.c                     |  12 +-
 kernel/trace/trace_osnoise.c                       |   9 +-
 kernel/trace/trace_output.c                        |  60 ++++--
 kernel/trace/trace_sched_wakeup.c                  |  18 +-
 kernel/trace/trace_stack.c                         |   2 +-
 tools/testing/selftests/bpf/progs/raw_tp_null.c    |   2 +-
 .../testing/selftests/bpf/progs/raw_tp_null_fail.c |   2 +-
 .../selftests/bpf/progs/test_module_attach.c       |   4 +-
 .../selftests/bpf/progs/test_tp_btf_nullable.c     |   4 +-
 .../testing/selftests/bpf/test_kmods/bpf_testmod.c |   8 +-
 34 files changed, 720 insertions(+), 356 deletions(-)
---------------------------
