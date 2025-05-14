Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7802F21C9EF
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212212; cv=none; b=BnmXmCKr2PhYp1QUnXumckCErdy5jiVfMrqkMyY5LlpZZ9pompCSHmkEfuPtSAcxsVqwWFBoxrOTZaR0ESXwZE55O57qVzpB0ErEHwG3xhLxQa6UEIpNTrq7ltnRnusrBpXFfrwgjynpSWkUDKmde9Whyh2uQ+ykF5D0NXNe7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212212; c=relaxed/simple;
	bh=HrXMytQkwKElwNjeJGuRB3Wpg6+hJf1XPS/VnIbwEMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hRH8eCLkwE42oni9TVQorq5u9AhWTN7sTUjDbRfSP0AA6WN/+1zHPZsucJVCHdSc2Dza82puILpgcxhFq6yP4sRCjY1EuMIFKzf3Q6TaPxteVTRlNzRl1MrB3Y3v+GPHdDYG5e0ar84ozzFbrSZZCnrdL18ml2A3C1XOxvxSiM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IJORFbKW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IJORFbKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747212209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c8EIUP79uwhGvfOvcppVvsfmGZG9b+OqB3lKVrDBLfg=;
	b=IJORFbKWLGTPuqtJL64YXJfOtUPjEu2u+nOdJt+1pBvmLDHH3spYGBzyabgZqRxlv2yLNp
	J19vcMBroh/6BwTpMwBUJq4JW6jFMKnqsh+f15JFYdyD3adcSlhOG1hoQth2UDPLQQUMwL
	2hw9fGNFM1RAEGDBFNdPv/mXMR71wQY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-509-oNUnlokYOXGb-WIPtFc2YA-1; Wed,
 14 May 2025 04:43:26 -0400
X-MC-Unique: oNUnlokYOXGb-WIPtFc2YA-1
X-Mimecast-MFC-AGG-ID: oNUnlokYOXGb-WIPtFc2YA_1747212205
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 086171955DDE;
	Wed, 14 May 2025 08:43:25 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.189])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 244E21953B80;
	Wed, 14 May 2025 08:43:19 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Nam Cao <namcao@linutronix.de>
Cc: Gabriele Monaco <gmonaco@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Juri Lelli <jlelli@redhat.com>
Subject: [RFC PATCH v2 00/12] rv: Add monitors to validate task switch
Date: Wed, 14 May 2025 10:43:02 +0200
Message-ID: <20250514084314.57976-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

I'm keeping this as RFC as I'm planning to make it ready after merging
the LTL series [1]

This series adds three monitors to the sched collection, extends and
replaces previously existing monitors:

tss => sts:
Not only prove that switches occur in scheduling context but also that
each call to the scheduler implies a switch (also a vain one) and
disables interrupts doing so.

sco:
The sched_set_state tracepoint can now be called from scheduling context
in a particular condition, that is when there is a pending signal. Adapt
the monitor to cover this scenario.

snroc:
Include sched_switch_vain as transition only possible in own context,
this model is also required to keep the following two models simple.

nrp (NEW):
* preemption requires need resched which is cleared by any switch
  (includes a non optimal workaround for /nested/ preemptions)

sssw (NEW):
* suspension requires setting the task to sleepable and, after the
  switch occurs, the task requires a wakeup to come back to runnable

opid (NEW):
* waking and need-resched operations occur with interrupts and
  preemption disabled or in IRQ without explicitly disabling preemption

We also include some minor cleanup patches (1-5) tracepoints (6) and
preparatory fixes (10) covering some corner cases:

The series is currently based on linux-next as it requires "sched: Fix
trace_sched_switch(.prev_state)" [2].

Patch 1 fixes the behaviour of the rv tool with -s and idle tasks.

Patch 2 allows the rv tool to gracefully terminate with SIGTERM

Patch 3 adds da_handle_start_run_event_ also to per-task monitors

Patch 4 removes a trailing whitespace from the rv tracepoint string

Patch 5 returns the registration error in all DA monitor instead of 0

Patch 6 adds the need_resched and switch_vain tracepoints and adds a
parameter to the sched_set_state tracepoint

Patch 7 adapts the sco monitor to the new version of sched_set_state

Patch 8 extends the snroc model and adapts it to the new sched_set_state

Patch 9 adds the sts monitor to replace tss

Patch 10 detects race conditions when rv monitors run concurrently and
retries applying the events

Patch 11 adds the nrp and sssw monitors

Patch 12 adds the opid monitor

NOTES

The nrp and sssw monitors include workarounds for racy conditions:

* A sleeping task requires to set the state to sleepable, but in case of
  a task sleeping on an rtlock, the set sleepable and wakeup events race
  and we don't always see the right order:

 5d..2. 107.488369: event: 639: sleepable x set_sleepable -> sleepable
 4d..5. 107.488369: event: 639: sleepable x wakeup -> running (final)
 5d..3. 107.488385: error: 639: switch_suspend not expected in the state running

    wakeup()                    set_state()
        state=RUNNING
                                    trace_set_state()
        trace_wakeup()
                                    state=SLEEPING

  I added a special event (switch_block) but there may be a better way.
  Taking a pi_lock in rtlock_slowlock_locked when setting the state to
  TASK_RTLOCK_WAIT avoids this race, although this is likely not
  something we want to do.

* I consider preemption any scheduling with preempt==true and assume
  this can happen only if need resched is set.
  In practice, however, we may see a preemption where the flag
  is not set. This can happen in one specific condition:

  need_resched
                  preempt_schedule()
                                        preempt_schedule_irq()
                                            __schedule()
  !need_resched
                      __schedule()

  We start a standard preemption (e.g. from preempt_enable when the flag
  is set), an interrupts occurs before we schedule and, on its exit path,
  it schedules, which clears the need_resched flag.
  When the preempted task runs again, we continue the standard
  preemption started earlier, although the flag is no longer set.

  I added a workaround to allow the model not to fail in this condition,
  but it makes the model weaker. In fact, we are not proving that:
   1. we don't miss any event setting need_resched
   2. we don't preempt when not required
  Future versions of the monitor may weaken assumptions only when we
  register an interrupt.

Changes since RFC [3]:
 * Remove wakeup tracepoint in try_to_block_task and use a different
   flavour of sched_set_state
 * Split the large srs monitor in two separate monitors for preemption
   and sleep. These no longer have a concept of running task, they just
   enforce the requirements for the different types of sched out.
 * Restore the snroc monitor to describe the relationship between
   generic sched out and sched in.
 * Add opid monitor.
 * Fix some build errors and cleanup.

[1] - https://lore.kernel.org/lkml/cover.1747046848.git.namcao@linutronix.de
[2] - https://lore.kernel.org/lkml/174413914101.31282.6876925851363406689.tip-bot2@tip-bot2
[3] - https://lore.kernel.org/lkml/20250404084512.98552-11-gmonaco@redhat.com

To: Ingo Molnar <mingo@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Tomas Glozar <tglozar@redhat.com>
Cc: Juri Lelli <jlelli@redhat.com>

Gabriele Monaco (12):
  tools/rv: Do not skip idle in trace
  tools/rv: Stop gracefully also on SIGTERM
  rv: Add da_handle_start_run_event_ to per-task monitors
  rv: Remove trailing whitespace from tracepoint string
  rv: Return init error when registering monitors
  sched: Adapt sched tracepoints for RV task model
  rv: Adapt the sco monitor to the new set_state
  rv: Extend and adapt snroc model
  rv: Replace tss monitor with more complete sts
  rv: Retry when da monitor detects race conditions
  rv: Add nrp and sssw per-task monitors
  rv: Add opid per-cpu monitor

 Documentation/trace/rv/monitor_sched.rst      | 296 +++++++++++++++---
 include/linux/rv.h                            |   5 +-
 include/linux/sched.h                         |   7 +-
 include/rv/da_monitor.h                       |  75 ++++-
 include/trace/events/sched.h                  |  17 +-
 kernel/sched/core.c                           |  10 +-
 kernel/trace/rv/Kconfig                       |   5 +-
 kernel/trace/rv/Makefile                      |   5 +-
 kernel/trace/rv/monitors/{tss => nrp}/Kconfig |   8 +-
 kernel/trace/rv/monitors/nrp/nrp.c            | 135 ++++++++
 kernel/trace/rv/monitors/nrp/nrp.h            |  51 +++
 kernel/trace/rv/monitors/nrp/nrp_trace.h      |  15 +
 kernel/trace/rv/monitors/opid/Kconfig         |  17 +
 kernel/trace/rv/monitors/opid/opid.c          | 151 +++++++++
 kernel/trace/rv/monitors/opid/opid.h          |  64 ++++
 kernel/trace/rv/monitors/opid/opid_trace.h    |  15 +
 kernel/trace/rv/monitors/sched/sched.c        |   3 +-
 kernel/trace/rv/monitors/sco/sco.c            |  11 +-
 kernel/trace/rv/monitors/sco/sco.h            |   6 +-
 kernel/trace/rv/monitors/scpd/scpd.c          |   3 +-
 kernel/trace/rv/monitors/sncid/sncid.c        |   3 +-
 kernel/trace/rv/monitors/snep/snep.c          |   3 +-
 kernel/trace/rv/monitors/snroc/snroc.c        |  15 +-
 kernel/trace/rv/monitors/snroc/snroc.h        |   8 +-
 kernel/trace/rv/monitors/sssw/Kconfig         |  15 +
 kernel/trace/rv/monitors/sssw/sssw.c          | 115 +++++++
 kernel/trace/rv/monitors/sssw/sssw.h          |  64 ++++
 kernel/trace/rv/monitors/sssw/sssw_trace.h    |  15 +
 kernel/trace/rv/monitors/sts/Kconfig          |  18 ++
 kernel/trace/rv/monitors/sts/sts.c            | 117 +++++++
 kernel/trace/rv/monitors/sts/sts.h            |  62 ++++
 .../{tss/tss_trace.h => sts/sts_trace.h}      |   8 +-
 kernel/trace/rv/monitors/tss/tss.c            |  91 ------
 kernel/trace/rv/monitors/tss/tss.h            |  47 ---
 kernel/trace/rv/monitors/wip/wip.c            |   3 +-
 kernel/trace/rv/monitors/wwnr/wwnr.c          |   3 +-
 kernel/trace/rv/rv_trace.h                    |  13 +-
 tools/verification/models/sched/nrp.dot       |  19 ++
 tools/verification/models/sched/opid.dot      |  35 +++
 tools/verification/models/sched/sco.dot       |   1 +
 tools/verification/models/sched/snroc.dot     |   2 +-
 tools/verification/models/sched/sssw.dot      |  24 ++
 tools/verification/models/sched/sts.dot       |  29 ++
 tools/verification/models/sched/tss.dot       |  18 --
 tools/verification/rv/src/in_kernel.c         |   2 +-
 tools/verification/rv/src/rv.c                |   1 +
 46 files changed, 1366 insertions(+), 264 deletions(-)
 rename kernel/trace/rv/monitors/{tss => nrp}/Kconfig (63%)
 create mode 100644 kernel/trace/rv/monitors/nrp/nrp.c
 create mode 100644 kernel/trace/rv/monitors/nrp/nrp.h
 create mode 100644 kernel/trace/rv/monitors/nrp/nrp_trace.h
 create mode 100644 kernel/trace/rv/monitors/opid/Kconfig
 create mode 100644 kernel/trace/rv/monitors/opid/opid.c
 create mode 100644 kernel/trace/rv/monitors/opid/opid.h
 create mode 100644 kernel/trace/rv/monitors/opid/opid_trace.h
 create mode 100644 kernel/trace/rv/monitors/sssw/Kconfig
 create mode 100644 kernel/trace/rv/monitors/sssw/sssw.c
 create mode 100644 kernel/trace/rv/monitors/sssw/sssw.h
 create mode 100644 kernel/trace/rv/monitors/sssw/sssw_trace.h
 create mode 100644 kernel/trace/rv/monitors/sts/Kconfig
 create mode 100644 kernel/trace/rv/monitors/sts/sts.c
 create mode 100644 kernel/trace/rv/monitors/sts/sts.h
 rename kernel/trace/rv/monitors/{tss/tss_trace.h => sts/sts_trace.h} (67%)
 delete mode 100644 kernel/trace/rv/monitors/tss/tss.c
 delete mode 100644 kernel/trace/rv/monitors/tss/tss.h
 create mode 100644 tools/verification/models/sched/nrp.dot
 create mode 100644 tools/verification/models/sched/opid.dot
 create mode 100644 tools/verification/models/sched/sssw.dot
 create mode 100644 tools/verification/models/sched/sts.dot
 delete mode 100644 tools/verification/models/sched/tss.dot


base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
-- 
2.49.0

