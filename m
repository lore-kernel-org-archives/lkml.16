Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AED219ADBA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093340; cv=none; b=l/jQ+mSKP8tBf1SscaQyNxytfsDv3mAi6lbM9LThvgZfl2a+NLW4IlVrZz2tqhdO9C1OxDGv6YoJJmiu18S2ytKEfQ4yWd/Z3pLrDXQUcjxIetr/97/Is5K5G9tJ2Lt10KpyktJ7fbjiTpRjbQjmM3yCxVUoptgKGEsvUYDyON0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093340; c=relaxed/simple;
	bh=iTp4tbpI8UCm5iTaOGfyS1gbiah4e8hQmVgQc4UYKGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bI1EKnJEY01o5NzoIxj8/eSJeB+ukK8kauw+db5vU+dSjFEEF8xDzId0+1ReNW2cz+hNTI8LqMOEnz0GnKuxYxz8Oa/qyyI6Ty/s5Y/vbHtUx/GhjMNhkJQBzDxzogWGk49HXiXH8NmCMoKl+p8AFdDmTXo0C3J2c9MS1iXkjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D34C4CEDD;
	Thu, 27 Mar 2025 16:35:37 +0000 (UTC)
Date: Thu, 27 Mar 2025 12:36:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Douglas Raillard
 <douglas.raillard@arm.com>, Gabriele Paoloni <gpaoloni@redhat.com>, Hengqi
 Chen <hengqi.chen@gmail.com>, Huang Shijie <shijie@os.amperecomputing.com>,
 Petr Mladek <pmladek@suse.com>, Ran Xiaokai <ran.xiaokai@zte.com.cn>,
 Siddarth G <siddarthsgml@gmail.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [GIT PULL] tracing: Updates for v6.15
Message-ID: <20250327123626.4ecb15ab@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Linus,

tracing updates for v6.15:

- Add option traceoff_after_boot

  In order to debug kernel boot, it sometimes is helpful to enable tracing
  via the kernel command line. Unfortunately, by the time the login prompt
  appears, the trace is overwritten by the init process and other user space
  start up applications. Adding a "traceoff_after_boot" will disable tracing
  when the kernel passes control to init which will allow developers to be
  able to see the traces that occurred during boot.

- Clean up the mmflags macros that display the GFP flags in trace events

  The macros to print the GFP flags for trace events had a bit of
  duplication. The code was restructured to remove duplication and in the
  process it also adds some flags that were missed before.

- Removed some dead code and scripts/draw_functrace.py

  draw_functrace.py hasn't worked in years and as nobody complained
  about it, remove it.

- Constify struct event_trigger_ops

  The event_trigger_ops is just a structure that has function pointers that
  are assigned when the variables are created. These variables should all be
  constants.

- Other minor clean ups and fixes


Please pull the latest trace-v6.15 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.15

Tag SHA1: 4c87918f84af7697d58a1f243ebe96de405791d9
Head SHA1: e0344f9564f5847dc20e245fbea67a4b262ee659


Christophe JAILLET (2):
      tracing/user_events: Slightly simplify user_seq_show()
      tracing: Constify struct event_trigger_ops

Douglas Raillard (3):
      tracing: Align synth event print fmt
      tracing: Ensure module defining synth event cannot be unloaded while =
tracing
      tracing: Fix synth event printk format for str fields

Gabriele Paoloni (1):
      tracing: fix return value in __ftrace_event_enable_disable for TRACE_=
REG_UNREGISTER

Hengqi Chen (1):
      tracing: Remove orphaned event_trace_printk

Huang Shijie (1):
      tracepoint: Print the function symbol when tracepoint_debug is set

Petr Mladek (1):
      tracing: gfp: vsprintf: Do not print "none" when using %pGg printf fo=
rmat

Ran Xiaokai (1):
      tracing/osnoise: Fix possible recursive locking for cpus_read_lock()

Siddarth G (1):
      tracing: Replace strncpy with memcpy for fixed-length substring copy

Steven Rostedt (5):
      tracing: Add traceoff_after_boot option
      tracing: gfp: Remove duplication of recording GFP flags
      tracing: Update MAINTAINERS file to include tracepoint.c
      scripts/tracing: Remove scripts/tracing/draw_functrace.py
      tracing: Do not use PERF enums when perf is not defined

Thomas Wei=C3=9Fschuh (1):
      tracing/user_events: Don't use %pK through printk

Zhouyi Zhou (1):
      ring-buffer: Fix typo in comment about header page pointer

----
 Documentation/admin-guide/kernel-parameters.txt |   9 ++
 MAINTAINERS                                     |   1 +
 include/linux/trace_events.h                    |  18 ----
 include/trace/events/mmflags.h                  |  41 ++------
 kernel/trace/ring_buffer.c                      |   2 +-
 kernel/trace/trace.c                            |  11 ++
 kernel/trace/trace.h                            |   4 +-
 kernel/trace/trace_eprobe.c                     |   6 +-
 kernel/trace/trace_events.c                     |   4 +-
 kernel/trace/trace_events_hist.c                |  20 ++--
 kernel/trace/trace_events_synth.c               |  40 +++++++-
 kernel/trace/trace_events_trigger.c             |  38 +++----
 kernel/trace/trace_events_user.c                |   7 +-
 kernel/trace/trace_osnoise.c                    |   1 -
 kernel/tracepoint.c                             |   2 +-
 scripts/tracing/draw_functrace.py               | 129 --------------------=
----
 16 files changed, 108 insertions(+), 225 deletions(-)
 delete mode 100755 scripts/tracing/draw_functrace.py
---------------------------
