Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B42C18FC67
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091768; cv=none; b=M9PeJvBLOgujfZB6UQ+lQBZTMuKmxA8aDmmnqruSbPxTDWeqPN+MMgAInlR9JNqDaGRXaTq1eV6x84z1ND4F2j3MXnOsjdlOwq+ni+kvvvK9Ns2UV4HC1AOJCsOItPMeiSbVqPyRZlRIKSlG9sMo2J5D4ZcXS1BNxwtJTBYGfXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091768; c=relaxed/simple;
	bh=z3Rhqg6LSTkbAFMpvd+8a0+zUM1cNOyijg5cPUAPzgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nFNBtsnCs3ruQk8N0jIOi/8jTG/W6CVuWw0apQG7220IAxq8mXzFgvMuw4bZRT4NKigJltAH2ygg6ybVmB1TAhoJ4HvRJEE9W34qlW4kfXs4R4tSUaNgkRnayBzm4fCWpN85c1Y3hAi9ohS8816mHApdSIG8CPJJ3ScStTmjmz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46967C4CEDD;
	Thu, 27 Mar 2025 16:09:27 +0000 (UTC)
Date: Thu, 27 Mar 2025 12:10:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu 
 <mhiramat@kernel.org>, Gabriele Monaco <gmonaco@redhat.com>, Tomas Glozar 
 <tglozar@redhat.com>
Subject: [GIT PULL v2] latency tracing: Updates for 6.15
Message-ID: <20250327121016.183e2f05@gandalf.local.home>
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

Latency tracing changes for v6.15:

- Add some trace events to osnoise and timerlat sample generation

  This adds more information to the osnoise and timerlat tracers as well as
  allows BPF programs to be attached to these locations to extract even more
  data.

- Fix to DECLARE_TRACE_CONDITION() macro

  It wasn't used but now will be and it happened to be broken causing the
  build to fail.

- Add scheduler specification monitors to runtime verifier (RV)

  This is a continuation of Daniel Bristot's work.

  RV allows monitors to run and react concurrently. Running the cumulative
  model is equivalent to running single components using the same
  reactors, with the advantage that it's easier to point out which
  specification failed in case of error.

  This update introduces nested monitors to RV, in short, the sysfs
  monitor folder will contain a monitor named sched, which is nothing but
  an empty container for other monitors. Controlling the sched monitor
  (enable, disable, set reactors) controls all nested monitors.

  The following scheduling monitors are added:

  * sco: scheduling context operations
      Monitor to ensure sched_set_state happens only in thread context
  * tss: task switch while scheduling
      Monitor to ensure sched_switch happens only in scheduling context
  * snroc: set non runnable on its own context
      Monitor to ensure set_state happens only in the respective task's context
  * scpd: schedule called with preemption disabled
      Monitor to ensure schedule is called with preemption disabled
  * snep: schedule does not enable preempt
      Monitor to ensure schedule does not enable preempt
  * sncid: schedule not called with interrupt disabled
      Monitor to ensure schedule is not called with interrupt disabled


Please pull the latest trace-latency-v6.15-2 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-latency-v6.15-2

Tag SHA1: 13f322eed7a7d11a944574e8ba4744be1ad560af
Head SHA1: 4bb5d82b66002b770f8917d68ab4fbefcb7f5f9b


Gabriele Monaco (12):
      tracing: Fix DECLARE_TRACE_CONDITION
      rv: Add license identifiers to monitor files
      sched: Add sched tracepoints for RV task model
      rv: Add option for nested monitors and include sched
      rv: Add sco and tss per-cpu monitors
      rv: Add snroc per-task monitor
      rv: Add scpd, snep and sncid per-cpu monitors
      tools/rv: Add support for nested monitors
      verification/dot2k: Add support for nested monitors
      Documentation/rv: Add docs for the sched monitors
      tools/rv: Allow rv list to filter for container
      Documentation/rv: Add sched pages to the indices

Tomas Glozar (1):
      trace/osnoise: Add trace events for samples

----
 Documentation/tools/rv/index.rst                   |   1 +
 Documentation/tools/rv/rv-mon-sched.rst            |  69 ++++++
 Documentation/trace/rv/index.rst                   |   1 +
 Documentation/trace/rv/monitor_sched.rst           | 171 ++++++++++++++
 include/linux/rv.h                                 |   4 +-
 include/linux/sched.h                              |  16 ++
 include/trace/define_trace.h                       |   7 +
 include/trace/events/osnoise.h                     |  96 ++++++++
 include/trace/events/sched.h                       |  13 ++
 kernel/sched/core.c                                |  23 +-
 kernel/trace/rv/Kconfig                            |   7 +
 kernel/trace/rv/Makefile                           |   7 +
 kernel/trace/rv/monitors/sched/Kconfig             |  11 +
 kernel/trace/rv/monitors/sched/sched.c             |  38 +++
 kernel/trace/rv/monitors/sched/sched.h             |   3 +
 kernel/trace/rv/monitors/sco/Kconfig               |  14 ++
 kernel/trace/rv/monitors/sco/sco.c                 |  88 +++++++
 kernel/trace/rv/monitors/sco/sco.h                 |  47 ++++
 kernel/trace/rv/monitors/sco/sco_trace.h           |  15 ++
 kernel/trace/rv/monitors/scpd/Kconfig              |  15 ++
 kernel/trace/rv/monitors/scpd/scpd.c               |  96 ++++++++
 kernel/trace/rv/monitors/scpd/scpd.h               |  49 ++++
 kernel/trace/rv/monitors/scpd/scpd_trace.h         |  15 ++
 kernel/trace/rv/monitors/sncid/Kconfig             |  15 ++
 kernel/trace/rv/monitors/sncid/sncid.c             |  96 ++++++++
 kernel/trace/rv/monitors/sncid/sncid.h             |  49 ++++
 kernel/trace/rv/monitors/sncid/sncid_trace.h       |  15 ++
 kernel/trace/rv/monitors/snep/Kconfig              |  15 ++
 kernel/trace/rv/monitors/snep/snep.c               |  96 ++++++++
 kernel/trace/rv/monitors/snep/snep.h               |  49 ++++
 kernel/trace/rv/monitors/snep/snep_trace.h         |  15 ++
 kernel/trace/rv/monitors/snroc/Kconfig             |  14 ++
 kernel/trace/rv/monitors/snroc/snroc.c             |  85 +++++++
 kernel/trace/rv/monitors/snroc/snroc.h             |  47 ++++
 kernel/trace/rv/monitors/snroc/snroc_trace.h       |  15 ++
 kernel/trace/rv/monitors/tss/Kconfig               |  14 ++
 kernel/trace/rv/monitors/tss/tss.c                 |  91 ++++++++
 kernel/trace/rv/monitors/tss/tss.h                 |  47 ++++
 kernel/trace/rv/monitors/tss/tss_trace.h           |  15 ++
 kernel/trace/rv/monitors/wip/Kconfig               |   2 +
 kernel/trace/rv/monitors/wip/wip.c                 |   2 +-
 kernel/trace/rv/monitors/wip/wip.h                 |   1 +
 kernel/trace/rv/monitors/wwnr/Kconfig              |   2 +
 kernel/trace/rv/monitors/wwnr/wwnr.c               |   2 +-
 kernel/trace/rv/monitors/wwnr/wwnr.h               |   1 +
 kernel/trace/rv/rv.c                               | 154 +++++++++++--
 kernel/trace/rv/rv.h                               |   4 +
 kernel/trace/rv/rv_reactors.c                      |  28 ++-
 kernel/trace/rv/rv_trace.h                         |   6 +
 kernel/trace/trace_osnoise.c                       |  55 ++---
 tools/verification/dot2/dot2k                      |  27 ++-
 tools/verification/dot2/dot2k.py                   |  80 +++++--
 tools/verification/dot2/dot2k_templates/Kconfig    |   3 +
 tools/verification/dot2/dot2k_templates/main.c     |   4 +-
 .../dot2/dot2k_templates/main_container.c          |  38 +++
 .../dot2/dot2k_templates/main_container.h          |   3 +
 tools/verification/models/sched/sco.dot            |  18 ++
 tools/verification/models/sched/scpd.dot           |  18 ++
 tools/verification/models/sched/sncid.dot          |  18 ++
 tools/verification/models/sched/snep.dot           |  18 ++
 tools/verification/models/sched/snroc.dot          |  18 ++
 tools/verification/models/sched/tss.dot            |  18 ++
 tools/verification/rv/include/in_kernel.h          |   2 +-
 tools/verification/rv/include/rv.h                 |   3 +-
 tools/verification/rv/src/in_kernel.c              | 256 ++++++++++++++++-----
 tools/verification/rv/src/rv.c                     |  38 +--
 66 files changed, 2137 insertions(+), 166 deletions(-)
 create mode 100644 Documentation/tools/rv/rv-mon-sched.rst
 create mode 100644 Documentation/trace/rv/monitor_sched.rst
 create mode 100644 kernel/trace/rv/monitors/sched/Kconfig
 create mode 100644 kernel/trace/rv/monitors/sched/sched.c
 create mode 100644 kernel/trace/rv/monitors/sched/sched.h
 create mode 100644 kernel/trace/rv/monitors/sco/Kconfig
 create mode 100644 kernel/trace/rv/monitors/sco/sco.c
 create mode 100644 kernel/trace/rv/monitors/sco/sco.h
 create mode 100644 kernel/trace/rv/monitors/sco/sco_trace.h
 create mode 100644 kernel/trace/rv/monitors/scpd/Kconfig
 create mode 100644 kernel/trace/rv/monitors/scpd/scpd.c
 create mode 100644 kernel/trace/rv/monitors/scpd/scpd.h
 create mode 100644 kernel/trace/rv/monitors/scpd/scpd_trace.h
 create mode 100644 kernel/trace/rv/monitors/sncid/Kconfig
 create mode 100644 kernel/trace/rv/monitors/sncid/sncid.c
 create mode 100644 kernel/trace/rv/monitors/sncid/sncid.h
 create mode 100644 kernel/trace/rv/monitors/sncid/sncid_trace.h
 create mode 100644 kernel/trace/rv/monitors/snep/Kconfig
 create mode 100644 kernel/trace/rv/monitors/snep/snep.c
 create mode 100644 kernel/trace/rv/monitors/snep/snep.h
 create mode 100644 kernel/trace/rv/monitors/snep/snep_trace.h
 create mode 100644 kernel/trace/rv/monitors/snroc/Kconfig
 create mode 100644 kernel/trace/rv/monitors/snroc/snroc.c
 create mode 100644 kernel/trace/rv/monitors/snroc/snroc.h
 create mode 100644 kernel/trace/rv/monitors/snroc/snroc_trace.h
 create mode 100644 kernel/trace/rv/monitors/tss/Kconfig
 create mode 100644 kernel/trace/rv/monitors/tss/tss.c
 create mode 100644 kernel/trace/rv/monitors/tss/tss.h
 create mode 100644 kernel/trace/rv/monitors/tss/tss_trace.h
 create mode 100644 tools/verification/dot2/dot2k_templates/main_container.c
 create mode 100644 tools/verification/dot2/dot2k_templates/main_container.h
 create mode 100644 tools/verification/models/sched/sco.dot
 create mode 100644 tools/verification/models/sched/scpd.dot
 create mode 100644 tools/verification/models/sched/sncid.dot
 create mode 100644 tools/verification/models/sched/snep.dot
 create mode 100644 tools/verification/models/sched/snroc.dot
 create mode 100644 tools/verification/models/sched/tss.dot
---------------------------
