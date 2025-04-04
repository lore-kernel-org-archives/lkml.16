Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AA717A2FD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756362; cv=none; b=ZVVqXRJc0SLDdPveFCU2h+MPnwdDceNbIvMmfKLiHSEPoUKXx8VYxvbOzZnvvU0A3JVFliICjnUtjG+k03iTIQnXbJUf9HC8hIQRt0ceQu74t1lAphj026PyZD+bRs3KHK/9iF6UFygAZmDco9rT8Oyi4YX0H9eKwZytC5TV0/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756362; c=relaxed/simple;
	bh=Zb38lUIGnOqjdzLnUBddPxrwxwpbnv7mI2v7ycX2vKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mjrU0wt1jL91qUSZOlGLN/vbN01XcXVVfQfxp7y+fAFrCl+ejpL8qgI3Isqwuq0NYBLT7Pn9WjN2Q3S4ujqWhFibK7uaVbYLoYuZR2A+7Lwxm9k1yEsWO8r2eatCFYfyons+StgDRHnP1IkB+JburSFVENJ4OICzjQKeyWsSdQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pq58sWVN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pq58sWVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743756359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ls68xxakQRSEXtlSRwySRkod4E1AW3ATqK1TgT3ql6M=;
	b=Pq58sWVNEBp9POj/ShDy81IEVMwH0rO9XAvncUkq1w8wS6zZt82LPdmqI7ksiin4QC2Yb2
	I/q910ZBOsS197q5mhTZez5WVR22uyXxUl9df+p2XiZiiAVwkyfteq6/frfDdcqUpC5AIU
	yMZkPWJArQqQ+/RgxlD7rwGX66sc2lg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-3blMcO-xPJuaPdpZvRHltQ-1; Fri,
 04 Apr 2025 04:45:56 -0400
X-MC-Unique: 3blMcO-xPJuaPdpZvRHltQ-1
X-Mimecast-MFC-AGG-ID: 3blMcO-xPJuaPdpZvRHltQ_1743756355
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF3F51955DDD;
	Fri,  4 Apr 2025 08:45:54 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.143])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 21120180A803;
	Fri,  4 Apr 2025 08:45:50 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Juri Lelli <jlelli@redhat.com>
Subject: [RFC PATCH 0/9] rv: Add monitors to validate task switch
Date: Fri,  4 Apr 2025 10:45:13 +0200
Message-ID: <20250404084512.98552-11-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This series adds two monitors to the sched collection that imply two
previously existing monitors:

tss => sts:
Not only prove that switches occur in scheduling context but also that
each call to the scheduler implies a switch (also a vain one) and
disables interrupts doing so.

srs => snroc:
Describe different types of switches and their requirements, e.g.:
* preemption requires need resched which is cleared by any switch
* suspension requires setting the task to sleepable and, after the
  switch occurs, the task requires a wakeup to come back to runnable
The monitor implies setting the task state occurs only when the task is
running, which is what snroc was guaranteeing.

We also include some minor cleanup patches (1-4) tracepoints (5) and
preparatory fixes (6-7) covering some corner cases:

Patch 1 fixes the behaviour of the rv tool with -s and idle tasks.

Patch 2 allows the rv tool to gracefully terminate with SIGTERM

Patch 3 adds da_handle_start_run_event_ also to per-task monitors

Patch 4 removes a trailing whitespace from the rv tracepoint string

Patch 5 adds the need_resched and switch_vain tracepoints

Patch 6 treats scheduling out sleepable tasks with pending signals as
wakeup (with appropriate tracepoint calls and changing the state)

Patch 7 detects race conditions when rv monitors run concurrently and
retries applying the events

Patch 8 adds the sts monitor

Patch 9 adds the srs monitor

NOTES

The srs monitor is quite complex and there are a few things that I
cannot fully explain:

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
  Changing the order between tracepoints and setting the state doesn't
  change, we can still be out of sync.

* I consider preemption any scheduling with preempt==true and assume
  this can happen only if need resched is set (either via tif or
  preemption count). The tracepoint tracks only when the tif is set and
  I added a special event with a schedule entry with (preempt &&
  !tif_need_resched() && test_preempt_need_resched()) to account for
  preemptions where the tif was not set (perhaps there's a better way).
  Nevertheless, I still rarely see some preemptions without either set.
  Not sure if it's a glitch in the model or a case I didn't consider.

To: Ingo Molnar <mingo@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Tomas Glozar <tglozar@redhat.com>
Cc: Juri Lelli <jlelli@redhat.com>

Gabriele Monaco (9):
  tools/rv: Do not skip idle in trace
  tools/rv: Stop gracefully also on SIGTERM
  rv: Add da_handle_start_run_event_ to per-task monitors
  rv: Remove trailing whitespace from tracepoint string
  sched: Add sched tracepoints for RV task model
  sched: Treat try_to_block_task with pending signal as wakeup
  rv: Retry when da monitor detects race conditions
  rv: Replace tss monitor with more complete sts
  rv: Add srs per-task monitor

 Documentation/trace/rv/monitor_sched.rst      | 237 +++++++++++++++---
 include/linux/rv.h                            |   3 +-
 include/linux/sched.h                         |   7 +-
 include/rv/da_monitor.h                       |  75 +++++-
 include/trace/events/sched.h                  |   8 +
 kernel/sched/core.c                           |  20 +-
 kernel/trace/rv/Kconfig                       |   4 +-
 kernel/trace/rv/Makefile                      |   4 +-
 kernel/trace/rv/monitors/snroc/snroc.c        |  85 -------
 kernel/trace/rv/monitors/snroc/snroc.h        |  47 ----
 .../trace/rv/monitors/{snroc => srs}/Kconfig  |   8 +-
 kernel/trace/rv/monitors/srs/srs.c            | 135 ++++++++++
 kernel/trace/rv/monitors/srs/srs.h            |  87 +++++++
 .../{snroc/snroc_trace.h => srs/srs_trace.h}  |   8 +-
 kernel/trace/rv/monitors/sts/Kconfig          |  18 ++
 kernel/trace/rv/monitors/sts/sts.c            | 118 +++++++++
 kernel/trace/rv/monitors/sts/sts.h            |  62 +++++
 .../{tss/tss_trace.h => sts/sts_trace.h}      |   8 +-
 kernel/trace/rv/monitors/tss/Kconfig          |  14 --
 kernel/trace/rv/monitors/tss/tss.c            |  91 -------
 kernel/trace/rv/monitors/tss/tss.h            |  47 ----
 kernel/trace/rv/rv_trace.h                    |  12 +-
 tools/verification/models/sched/snroc.dot     |  18 --
 tools/verification/models/sched/srs.dot       |  61 +++++
 tools/verification/models/sched/sts.dot       |  29 +++
 tools/verification/models/sched/tss.dot       |  18 --
 tools/verification/rv/src/in_kernel.c         |   2 +-
 tools/verification/rv/src/rv.c                |   1 +
 28 files changed, 828 insertions(+), 399 deletions(-)
 delete mode 100644 kernel/trace/rv/monitors/snroc/snroc.c
 delete mode 100644 kernel/trace/rv/monitors/snroc/snroc.h
 rename kernel/trace/rv/monitors/{snroc => srs}/Kconfig (52%)
 create mode 100644 kernel/trace/rv/monitors/srs/srs.c
 create mode 100644 kernel/trace/rv/monitors/srs/srs.h
 rename kernel/trace/rv/monitors/{snroc/snroc_trace.h => srs/srs_trace.h} (67%)
 create mode 100644 kernel/trace/rv/monitors/sts/Kconfig
 create mode 100644 kernel/trace/rv/monitors/sts/sts.c
 create mode 100644 kernel/trace/rv/monitors/sts/sts.h
 rename kernel/trace/rv/monitors/{tss/tss_trace.h => sts/sts_trace.h} (67%)
 delete mode 100644 kernel/trace/rv/monitors/tss/Kconfig
 delete mode 100644 kernel/trace/rv/monitors/tss/tss.c
 delete mode 100644 kernel/trace/rv/monitors/tss/tss.h
 delete mode 100644 tools/verification/models/sched/snroc.dot
 create mode 100644 tools/verification/models/sched/srs.dot
 create mode 100644 tools/verification/models/sched/sts.dot
 delete mode 100644 tools/verification/models/sched/tss.dot


base-commit: e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
-- 
2.49.0

