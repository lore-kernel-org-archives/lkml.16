Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3283425E476
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200487; cv=none; b=Q7/OqSKfCLTkSISNJP9JmUMpR8Avz+Z33TBYcFlyOFZJxXWgXWwyUjgctYlJ161sSJ/DqbD+mCTqAT8QbAmdt84Sh8+nXmmP6jtug8YEg/DWtShxVn92KognPXxdbp0ry0mojrFHw8hQWDSMsTVnncWJv2qk9JLuW7zNguTO4YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200487; c=relaxed/simple;
	bh=dzw32U5Zfh0E0XuZmJTDSPi9UolEJJ3QEAe61/yHJ9E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IxaZ2JlhDNNVv5yuL2R7eG5QPjMzdFY8ZSeMaVS+QiO9k/WJKhxnxeVVjf+ROOtFKQTJNLYWha2Ue4a3+ekWgtQCtoraSEOoC52Rv4p1gu1BCtKqT83TwQLfc+lP346Jg1dOzPlTTRae74lbfAQiVS4UVBBqZ1XTlueovyq/0XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QxWJJXEY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QxWJJXEY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227cf12df27so5127905ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744200484; x=1744805284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OOpcAyL7ROG1hFPOjwQq+aHU/5G0bNnWbHQ+0O2R4E=;
        b=QxWJJXEYXQVBi0PXmfSKt+X0vmX8XZbX2s7hgAy/wiQ0m6rnYdiZjrIL0/0wZjs4/G
         XeyMZTkseGsXBsRGjc0WPvZVoyrYv33La5jIiyLTEZLKMQmcKQcvG+lT+NmNuW2TaitG
         VPaNVjqrlrBYCofP5iCUHmFcV2EXFvAfXXJMDdBwl8pZUr3QKuoDWgOqN36HUIr04B3p
         lqT7mVCgykWEQE/K6qhOgHI54GTHH59HoN+ZDkfqGLTjOuVGjxJQMfOUx9eNLFJP4kK+
         tgUFU90QLNCAMvVcKSGZnH0msul7CHwfwnB4pjhbUcAmdGDVMRLUEZpMoKyxnZ9mJw7g
         ukzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744200484; x=1744805284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OOpcAyL7ROG1hFPOjwQq+aHU/5G0bNnWbHQ+0O2R4E=;
        b=TXVj/sfbxjZh+/LZtWpmWlxlx/dRRx7M4COPaXylEf8I1bvOZuCsdZwTz1jdp8MyDS
         Tcyc4SBmDVS0EY/BYQhFhZ/qRPPkNedvI35QLfN9GpYeXceOKMvxt5gfaLB0cBXX2Edl
         8CN7xTiiuhlrvoiVEYMBhbCXfcUHMkUEgTC5fgFz305FTNnN/iwxWJbtnPeLQIQ4kS3/
         Y1A4QAr7eVORLJp5ZhU4xqDqTolBXdM7UdVpXxucbkOu6Hc3RHfZTFZLCh8aNrdaZHgX
         dz4SeRUdoeuevr2RYLy5SiRrYfwKJiZrYE2w954YV2OOPqDSY+1lVxT6gEI7f4lo9I0v
         Sdpw==
X-Gm-Message-State: AOJu0YzuzxPfdDAFWmcTCoddJDcpTI50l6l2VhSyvakPv2BNxKcJ09hb
	9xi6K6Z8mbwRqNzfy3N9Cg07wA09DEyu6oUEAB4Q65y/FwCk0VWuNzWNa4K3sA==
X-Gm-Gg: ASbGnct8BqCkfVNQy25/9FCJVdz0MJBH2upmLKy+bH+ObFSthnbRDFulJRbqb4Usod/
	pTkKUjReKMRUaMVQKgKfA1qgv9boj1HTtIJqklk5HNcJ6irGEUFkxFjYw/80XjgbvJzp26ulg/B
	OahcPgsEogoGIXaFC8Hxich1VHBZ8tJWhgKy0kAd1i6kdCYo9bRw2OiNtPgmRlOa6eygeAly92D
	PglPdZAxxNS50tqrP9tUtWw7dFtSCQPU02xcKE0woDwbmFY3+OCwmtdh4PkvtuJ8ISDchH+yMpD
	Ybx6V5bIOom/A4EiU52vrTc8lxSfjeQNAVXFY7MpJkW7zJmAotBc4UsylLbcCtghbqk=
X-Google-Smtp-Source: AGHT+IGPpmQEb/0iEnjSlBvi3KHI+GPm33s3LcpAcMLvzaa4drHvz+f8jcbOid+GLjlk9x1H3RyjfA==
X-Received: by 2002:a17:902:ce83:b0:223:5187:a886 with SMTP id d9443c01a7336-22ac32daa00mr37962105ad.22.1744200484315;
        Wed, 09 Apr 2025 05:08:04 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c62dsm10017875ad.95.2025.04.09.05.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:08:03 -0700 (PDT)
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
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [RFC PATCH v2 0/7] Defer throttle when task exits to user
Date: Wed,  9 Apr 2025 20:07:39 +0800
Message-Id: <20250409120746.635476-1-ziqianlu@bytedance.com>
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

Valentin has described the problem very well in the above link. We also
have task hung problem from time to time in our environment due to cfs quota.
It is mostly visible with rwsem: when a reader is throttled, writer comes in
and has to wait, the writer also makes all subsequent readers wait,
causing problems of priority inversion or even whole system hung.

To improve this situation, change the throttle model to task based, i.e.
when a cfs_rq is throttled, mark its throttled status but do not
remove it from cpu's rq. Instead, for tasks that belong to this cfs_rq,
when they get picked, add a task work to them so that when they return
to user, they can be dequeued. In this way, tasks throttled will not
hold any kernel resources. When cfs_rq gets unthrottled, enqueue back
those throttled tasks.

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

For throttle time accounting, I can see several possibilities:
- Similar to current behavior: starts accounting when cfs_rq gets
  throttled(if cfs_rq->nr_queued > 0) and stops accounting when cfs_rq
  gets unthrottled. This has one drawback, e.g. if this cfs_rq has one
  task when it gets throttled and eventually, that task doesn't return
  to user but blocks, then this cfs_rq has no tasks on throttled list
  but time is accounted as throttled; Patch2 and patch3 implements this
  accounting(simple, fewer code change).
- Starts accounting when the throttled cfs_rq has at least one task on
  its throttled list; stops accounting when it's unthrottled. This kind
  of over accounts throttled time because partial throttle state is
  accounted.
- Starts accounting when the throttled cfs_rq has no tasks left and its
  throttled list is not empty; stops accounting when this cfs_rq is
  unthrottled; This kind of under accounts throttled time because partial
  throttle state is not accounted. Patch7 implements this accounting.
I do not have a strong feeling which accounting is the best, it's open
for discussion.

There is also the concern of increased duration of (un)throttle operations
in v1. I've done some tests and with a 2000 cgroups/20K runnable tasks
setup on a 2sockets/384cpus AMD server, the longest duration of
distribute_cfs_runtime() is in the 2ms-4ms range. For details, please see:
https://lore.kernel.org/lkml/20250324085822.GA732629@bytedance/
For throttle path, with Chengming's suggestion to move "task work setup"
from throttle time to pick time, it's not an issue anymore.

Patches:
Patch1 is preparation work;

Patch2-3 provide the main functionality.
Patch2 deals with throttle path: when a cfs_rq is to be throttled, mark
throttled status for this cfs_rq and when tasks in throttled hierarchy
gets picked, add a task work to them so that when those tasks return to
user space, the task work can throttle it by dequeuing the task and
remember this by adding the task to its cfs_rq's limbo list;
Patch3 deals with unthrottle path: when a cfs_rq is to be unthrottled,
enqueue back those tasks in limbo list;

Patch4 deals with the dequeue path when task changes group, sched class
etc. Task that is throttled is dequeued in fair, but task->on_rq is
still set so when it changes task group or sched class or has affinity
setting change, core will firstly dequeue it. But since this task is
already dequeued in fair class, this patch handle this situation.

Patch5-6 are clean ups. Some code are obsolete after switching to task
based throttle mechanism.

Patch7 implements an alternative accounting mechanism for task based
throttle.

Changes since v1:
- Move "add task work" from throttle time to pick time, suggested by
  Chengming Zhou;
- Use scope_gard() and cond_resched_tasks_rcu_qs() in
  throttle_cfs_rq_work(), suggested by K Prateek Nayak;
- Remove now obsolete throttled_lb_pair(), suggested by K Prateek Nayak;
- Fix cfs_rq->runtime_remaining condition check in unthrottle_cfs_rq(),
  suggested by K Prateek Nayak;
- Fix h_nr_runnable accounting for delayed dequeue case when task based
  throttle is in use;
- Implemented an alternative way of throttle time accounting for
  discussion purpose;
- Make !CONFIG_CFS_BANDWIDTH build.
I hope I didn't omit any feedbacks I've received, but feel free to let me
know if I did.

As in v1, all change logs are written by me and if they read bad, it's
my fault.

Comments are welcome.

Base commit: tip/sched/core, commit 6432e163ba1b("sched/isolation: Make
use of more than one housekeeping cpu").

Aaron Lu (4):
  sched/fair: Take care of group/affinity/sched_class change for
    throttled task
  sched/fair: get rid of throttled_lb_pair()
  sched/fair: fix h_nr_runnable accounting with per-task throttle
  sched/fair: alternative way of accounting throttle time

Valentin Schneider (3):
  sched/fair: Add related data structure for task based throttle
  sched/fair: Handle throttle path for task based throttle
  sched/fair: Handle unthrottle path for task based throttle

 include/linux/sched.h |   4 +
 kernel/sched/core.c   |   3 +
 kernel/sched/fair.c   | 449 ++++++++++++++++++++++--------------------
 kernel/sched/sched.h  |   7 +
 4 files changed, 248 insertions(+), 215 deletions(-)

-- 
2.39.5

