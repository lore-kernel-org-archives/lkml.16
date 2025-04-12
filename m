Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F415A21D5B0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744491823; cv=none; b=GbxF/suJQ37TFRglzU9ZpqPUFa8kYPvVL0JXm6u8cx95Lw8utQUcy5fcOEwNsOaDQe/AMHTMkhI0WSb/XHWwM+uSwz6kx/mJTayZXO9o7Hb0d4+QWtjsuoh8DB1/sV4eRFJh3+3i1JqJgEo/un3lkEDdOpdNHu0l9f9U90Qt5PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744491823; c=relaxed/simple;
	bh=Flp9lkBsvXesJLjakIkBqsDUrcE1bfOpwpFxdZjOpvg=;
	h=Message-ID:Date:From:To:Cc:Subject; b=byZ9u4e3dmfXKWIkiYAfqnF02nmDknNcaR/q2FXRC+hXubS7haHaONqcXvEJ+dZ6O5Qe576AlwWLhFu3xuw1QyleX26N4djvpenVBU5iHJ4Q5OOIWVtY6rSSIjfS3BZtX5STQ8PrNCKuZndX6/mnUcFEQwaCmHrm4O5fzRySZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CE3C4CEE3;
	Sat, 12 Apr 2025 21:03:42 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u3i2I-0000000AECs-15Wq;
	Sat, 12 Apr 2025 17:05:10 -0400
Message-ID: <20250412210446.338481957@goodmis.org>
User-Agent: quilt/0.68
Date: Sat, 12 Apr 2025 17:04:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 0/7] tracing: Fixes for 6.15
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


tracing fixes for v6.15

- Hide get_vm_area() from MMUless builds

  The function get_vm_area() is not defined when CONFIG_MMU is not defined.
  Hide that function within #ifdef CONFIG_MMU.

- Fix output of synthetic events when they have dynamic strings

  The print fmt of the synthetic event's format file use to have "%.*s" for
  dynamic size strings even though the user space exported arguments had
  only __get_str() macro that provided just a nul terminated string. This
  was fixed so that user space could parse this properly. But the reason
  that it had "%.*s" was because internally it provided the maximum size of
  the string as one of the arguments. The fix that replaced "%.*s" with "%s"
  caused the trace output (when the kernel reads the event) to write
  "(efault)" as it would now read the length of the string as "%s".

  As the string provided is always nul terminated, there's no reason for the
  internal code to use "%.*s" anyway. Just remove the length argument to
  match the "%s" that is now in the format.

- Fix the ftrace subops hash logic of the manager ops hash

  The function_graph uses the ftrace subops code. The subops code is a way
  to have a single ftrace_ops registered with ftrace to determine what
  functions will call the ftrace_ops callback. More than one user of
  function graph can register a ftrace_ops with it. The function graph
  infrastructure will then add this ftrace_ops as a subops with the main
  ftrace_ops it registers with ftrace. This is because the functions will
  always call the function graph callback which in turn calls the subops
  ftrace_ops callbacks.

  The main ftrace_ops must add a callback to all the functions that the
  subops want a callback from. When a subops is registered, it will update
  the main ftrace_ops hash to include the functions it wants. This is the
  logic that was broken.

  The ftrace_ops hash has a "filter_hash" and a "notrace_hash" were all the
  functions in the filter_hash but not in the notrace_hash are attached by
  ftrace. The original logic would have the main ftrace_ops filter_hash be a
  union of all the subops filter_hashes and the main notrace_hash would be a
  intersect of all the subops filter hashes. But this was incorrect because
  the notrace hash depends on the filter_hash it is associated to and not
  the union of all filter_hashes.

  Instead, when a subops is added, just include all the functions of the
  subops hash that are in its filter_hash but not in its notrace_hash. The
  main subops hash should not use its notrace hash, unless all of its subops
  hashes have an empty filter_hash (which means to attach to all functions),
  and then, and only then, the main ftrace_ops notrace hash can be the
  intersect of all the subops hashes.

  This not only fixes the bug, but also simplifies the code.

- Add a selftest to better test the subops filtering

  Add a selftest that would catch the bug fixed by the above change.

- Fix extra newline printed in function tracing with retval

  The function parameter code changed the output logic slightly and called
  print_graph_retval() and also printed a newline. The print_graph_retval()
  also prints a newline which caused blank lines to be printed in the
  function graph tracer when retval was added. This caused one of the
  selftests to fail if retvals were enabled. Instead remove the new line
  output from print_graph_retval() and have the callers always print the
  new line so that it doesn't have to do special logic if it calls
  print_graph_retval() or not.

- Fix out-of-bound memory access in the runtime verifier

  When rv_is_container_monitor() is called on the last entry on the link
  list it references the next entry, which is the list head and causes an
  out-of-bound memory access.



  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 8d7861ac507d23024c7d74b6cb59a9cca248bcb7


Andy Chiu (1):
      ftrace: Properly merge notrace hashes

Nam Cao (1):
      rv: Fix out-of-bound memory access in rv_is_container_monitor()

Steven Rostedt (5):
      tracing: Hide get_vm_area() from MMUless builds
      tracing: Do not add length to print format in synthetic events
      ftrace: Fix accounting of subop hashes
      tracing/selftest: Add test to better test subops filtering of function graph
      ftrace: Do not have print_graph_retval() add a newline

----
 kernel/trace/ftrace.c                              | 314 ++++++++++++---------
 kernel/trace/rv/rv.c                               |   7 +-
 kernel/trace/trace.c                               |   7 +
 kernel/trace/trace_events_synth.c                  |   1 -
 kernel/trace/trace_functions_graph.c               |  11 +-
 .../ftrace/test.d/ftrace/fgraph-multi-filter.tc    | 177 ++++++++++++
 6 files changed, 372 insertions(+), 145 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi-filter.tc
