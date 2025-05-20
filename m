Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8792676F8
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737698; cv=none; b=YresYvu3j+D7U++yBD065KDTMORMH8SqiI2PMTITykS7QUadiovjdhGu2fLkrOXSlA8wpf1UHCyBxmaDz+SLDt8IJxU+x0Wg0SpHjjgD+Jc2f9RbzvqvzZO/R+t9Dl2Uiu0soB5OMAytML1y50oqsT3f+HK9A2FeLkxH9MSnEhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737698; c=relaxed/simple;
	bh=wmegZmCS2zJdY9h3Q8MKIjr5AB4aPghqEWSkRAuct68=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hf7L6naP3UlcyCX3/pyF59O2NYz6DF8brrp1kYS/Rx9nmJLqFViVKrzTurTc88L0Gf/ufssXOfV2EHRTFzHqi4vjtTi+4KhO7McVNo8qnKiL7Z4InsmhN/8teJy+Vv8xed6y3sR22Ppehm4KAsYxxTRxDWHU3xE7UXhILmEQ5Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fhdkhJ/1; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fhdkhJ/1"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30e8feb1830so3270629a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747737694; x=1748342494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6CKT/Dm8kcmMWsbmIzaRY7XtHghcI5SKEa5YSlLziw=;
        b=fhdkhJ/14/tAWqi0NyVNw1xWH+iHMCMr1snTlNsm29FF3olNeF3cvKR9RWHBRfqaeQ
         5stQYf+dI9JbZNmhsuPQI5kLEMGq2W+zdYw7x6ac5tgj5yc/VFK11fIsegwYHZF3/Lo2
         Uy1m8LlpB+FVu+J5C29VQctoey3hROVsYgfTt6vzn5hQfzyUBsjTnwN74CT3TqzKuys9
         +YJqjhhDwQFaZraumQcOdkOnpUc1GlmOu3p+82i4fUsUwmvUdBNpX3q29aY0q8ujeZcV
         1HmVHi6qg9Um/hGhPjOQURD83yJtBb3sbl9Ue2SGMFOjqG8neoHTMQ09UhYHYqneHnt8
         foJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737694; x=1748342494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6CKT/Dm8kcmMWsbmIzaRY7XtHghcI5SKEa5YSlLziw=;
        b=A+UuJq2sOfVdnVQh8Hx+BXF2acE0dW1OrLHCEkbFdBkbhZVM1AN0sUJ5qnsetPQmok
         F/irBMPW9CqnD/qwGqtWGZ7frrRabliu9d9QWW0byhAmgkT098J+mtae63yV6Ejy7vBe
         k7L6iPEkDzkeP85npFPvnpzDOWA4Wu8j0yf/r/Pvo0725pIFlR/D6bgwe+FMQBWr6PLH
         M3oryrgTicjUcvKPOifot+ihAlZXirvQ9+GWqfP50tl7LBDgHGaHidNnv/pft2ERp1mq
         yry0+/VKhOEpFtezTuGH+EVH9Ml1DdlGNDBFbN3AfPbSLJQZEAzSu6QVQl72K6CpuPm1
         SPyQ==
X-Gm-Message-State: AOJu0YyA4hiZeDW7EdTzu+H7knoqXaDzUw9PGjcLBc6xm7enddWGMuI4
	RLl1h3wj2dc1NT1zPSZ3R6xMq8EEiawiy1tjNzkBxJQV9g2u4ewPw47FAiiONsfVZg==
X-Gm-Gg: ASbGncucI9iv3nFFHOFKU3JXaEKFD+SCwuWZzqcP5nDN+xJD6BA8XAJA+mRCoaxjgJ6
	5kBmWIKch8pSZPSHmJWQEWTwGLulWqGFdT1JdSHJF7izvn//L8TbLcTwTEvNDXNxe3abjGy3gvr
	N0sXgBTC9sW/dGcrD6ayJ6YT9UYHC0mHicr80Y/9WnoHu4dhJJd5zi5NoWO76ghXfMggNVcshRX
	euTbrRWaYWk90fs4fOYarJtNs41TdGYy5FCrBzMikJpTCPnuJjtaK6eSuprFOVCXghHmxO3iaPR
	H1CAZ/Q7voYPq7h4vJe5QknfWpp57NwSB0JBmeHkPCvkMn1niadXUGy/aB3uffuBQAA=
X-Google-Smtp-Source: AGHT+IGaCRq4f3tUEDeD7iS6PlcLemMWcIU/uF6PwtobYHZoHCFBDfXo9Dgt6pi0jIadcOobBavpjA==
X-Received: by 2002:a17:90a:d604:b0:303:75a7:26a4 with SMTP id 98e67ed59e1d1-30e7d4fea75mr26468632a91.7.1747737694314;
        Tue, 20 May 2025 03:41:34 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5d31sm1359431a91.38.2025.05.20.03.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:41:33 -0700 (PDT)
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 0/7] Defer throttle when task exits to user
Date: Tue, 20 May 2025 18:41:03 +0800
Message-Id: <20250520104110.3673059-1-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a continuous work based on Valentin Schneider's posting here:
Subject: [RFC PATCH v3 00/10] sched/fair: Defer CFS throttle to user entry
https://lore.kernel.org/lkml/20240711130004.2157737-1-vschneid@redhat.com/

Valentin has described the problem very well in the above link and I
quote:
"
CFS tasks can end up throttled while holding locks that other,
non-throttled tasks are blocking on.

For !PREEMPT_RT, this can be a source of latency due to the throttling
causing a resource acquisition denial.

For PREEMPT_RT, this is worse and can lead to a deadlock:
o A CFS task p0 gets throttled while holding read_lock(&lock)
o A task p1 blocks on write_lock(&lock), making further readers enter
the slowpath
o A ktimers or ksoftirqd task blocks on read_lock(&lock)

If the cfs_bandwidth.period_timer to replenish p0's runtime is enqueued
on the same CPU as one where ktimers/ksoftirqd is blocked on
read_lock(&lock), this creates a circular dependency.

This has been observed to happen with:
o fs/eventpoll.c::ep->lock
o net/netlink/af_netlink.c::nl_table_lock (after hand-fixing the above)
but can trigger with any rwlock that can be acquired in both process and
softirq contexts.

The linux-rt tree has had
  1ea50f9636f0 ("softirq: Use a dedicated thread for timer wakeups.")
which helped this scenario for non-rwlock locks by ensuring the throttled
task would get PI'd to FIFO1 (ktimers' default priority). Unfortunately,
rwlocks cannot sanely do PI as they allow multiple readers.
"

Jan Kiszka has posted an reproducer regarding this PREEMPT_RT problem :
https://lore.kernel.org/r/7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com/
and K Prateek Nayak has an detailed analysis of how deadlock happened:
https://lore.kernel.org/r/e65a32af-271b-4de6-937a-1a1049bbf511@amd.com/

To fix this issue for PREEMPT_RT and improve latency situation for
!PREEMPT_RT, change the throttle model to task based, i.e. when a cfs_rq
is throttled, mark its throttled status but do not remove it from cpu's
rq. Instead, for tasks that belong to this cfs_rq, when they get picked,
add a task work to them so that when they return to user, they can be
dequeued. In this way, tasks throttled will not hold any kernel resources.
When cfs_rq gets unthrottled, enqueue back those throttled tasks.

There are consequences because of this new throttle model, e.g. for a
cfs_rq that has 3 tasks attached, when 2 tasks are throttled on their
return2user path, one task still running in kernel mode, this cfs_rq is
in a partial throttled state:
- Should its pelt clock be frozen?
- Should this state be accounted into throttled_time?

For pelt clock, I chose to keep the current behavior to freeze it on
cfs_rq's throttle time. The assumption is that tasks running in kernel
mode should not last too long, freezing the cfs_rq's pelt clock can keep
its load and its corresponding sched_entity's weight. Hopefully, this can
result in a stable situation for the remaining running tasks to quickly
finish their jobs in kernel mode.

For throttle time accounting, according to RFC v2's feedback, rework
throttle time accounting for a cfs_rq as follows:
- start accounting when the first task gets throttled in its
  hierarchy;
- stop accounting on unthrottle.

There is also the concern of increased duration of (un)throttle operations
in RFC v1. I've done some tests and with a 2000 cgroups/20K runnable tasks
setup on a 2sockets/384cpus AMD server, the longest duration of
distribute_cfs_runtime() is in the 2ms-4ms range. For details, please see:
https://lore.kernel.org/lkml/20250324085822.GA732629@bytedance/
For throttle path, with Chengming's suggestion to move "task work setup"
from throttle time to pick time, it's not an issue anymore.

Changes since RFC v2:
- drop RFC tag;
- Change throttle time accounting as suggested by Chenming. Prateek
  helped simplify the implementation;
- Re-organize patchset to avoid breaking bisect as suggested by Prateek.

Patches:
To avoid breaking bisect for CFS bandwidth functionality related issue,
the patchset is reorganized. The previous patch2-3 is divided into
patch2-3 and patch5. Patch2 and 3 mostly did previous thing, except it
retained existing throttle functionality till patch5 which switched the
throttle model to task based. The end result should be: before patch5,
existing throttle model should still work correctly and since patch5,
task based throttle model takes over.

Details about each patch:

Patch1 is preparation work;

Patch2 prepares throttle path for task based throttle: when a cfs_rq is
to be throttled, mark throttled status for this cfs_rq and when tasks in
throttled hierarchy gets picked, add a task work to them so that when
those tasks return to user, the task work can throttle it by dequeuing
the task and remember this by adding the task to its cfs_rq's limbo list.
To avoid breaking bisect, patch2 retained existing throttle behaviour in
that throttled hierarchy is still removed from runqueue, the actual
behaviour change is done in patch5;

Patch3 prepares unthrottle path for task based throttle: when a cfs_rq is
unthrottled, enqueue back those tasks in limbo list. It didn't take effect
though since no tasks are placed on that limbo list yet in patch2;

Patch4 deals with the dequeue path when task changes group, sched class
etc. Task that is throttled is dequeued in fair, but task->on_rq is
still set so when it changes task group or sched class or has affinity
setting change, core will firstly dequeue it. But since this task is
already dequeued in fair class, this patch handle this situation.

Patch5 implements the actual throttle model change.

Patch6 implements throttle time accounting for this new task based
throttle model.

Patch7 is a cleanup after throttle model changed to task based.

All change logs are written by me and if they read bad, it's my fault.

Comments are welcome.

Base: tip/sched/core commit 676e8cf70cb0("sched,livepatch: Untangle
cond_resched() and live-patching")

Aaron Lu (3):
  sched/fair: Take care of group/affinity/sched_class change for
    throttled task
  sched/fair: task based throttle time accounting
  sched/fair: get rid of throttled_lb_pair()

Valentin Schneider (4):
  sched/fair: Add related data structure for task based throttle
  sched/fair: prepare throttle path for task based throttle
  sched/fair: prepare unthrottle path for task based throttle
  sched/fair: switch to task based throttle model

 include/linux/sched.h |   4 +
 kernel/sched/core.c   |   3 +
 kernel/sched/fair.c   | 403 ++++++++++++++++++++----------------------
 kernel/sched/sched.h  |   4 +
 4 files changed, 199 insertions(+), 215 deletions(-)

-- 
2.39.5

