Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0FD35963
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234810; cv=none; b=rDcyP7Ye+MOt/l8eK1hQi0JU34XAvC4ipPRb5dy+ULzg00WVS6lZcCwFxg//9NaIAsro8IGMFvnF8AxQM8Ux+eGMWiBVF2L4hn25jyZpWW57raPRWz0B9oclYGudACKOB8cnCr6P8EtuvjzQicpHaRLfRt1jpLqvPxW1ZVZcPRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234810; c=relaxed/simple;
	bh=sSzijDomvwY+BoJDSSFd73Fm/khDE+ijJB+tl0HgFAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K7fFOAP8yfRczqfKn4yqG9cjbfRKERWBMRXFdFkjTOkwlhPtGGTNkv9BEPwzGF11eJf8IZxcZ8/QtQkTCuSBBbcMVweHkPnYf2tm4/SLScfR3hzGCMP8RyQ9OcKFwynsk33V1WYkrd3YbXAzl7cCtx2NdPPHZX8kwy47af0zLIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hYa2XR+2; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hYa2XR+2"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b2c4476d381so390271a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750234807; x=1750839607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7h1a483XeBDxgXookMteKeLGCVhv2lQx7q42szKUky0=;
        b=hYa2XR+2DQCK74rgw2OgoRj/PJKMS12iy0E1f57YlG+55XM0jMyvqGsVtogeCeyjtO
         8rC96oqxLSKlI7m+FaLZ1pLV9fAkeO3LQoPvIyL2IuKKFpekIcmNLXlPhmjmP2K2ApHa
         Ydpz46Xr0GQHwC84ZigGnU484DMGtTk34KnyHhkWZILvgCSLF5j+qmbGUDo1ary5dxa5
         bbNkb9H8WFt4o2ZSKGWFh3OouNzPGpsdnU9jxkkcbw95lfTrnha2IwqROMC2OLRTq55z
         r+nulv+5v5VnG2NwuYNE5Q9WPxJG/nBTJZ092BpJaKrKb7Nv1h6bocnll1MiaehAvLeO
         v3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234807; x=1750839607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7h1a483XeBDxgXookMteKeLGCVhv2lQx7q42szKUky0=;
        b=Wj5/4tYwdcGEiEQJNJKqJLHMV/nXEXc9igm47bu/Utfiv2CVxg169Op+HElcFP80ZE
         jqUEBdCSAalhihXPlvIOh2MSxEEIpIzCTmg2m+u19UTPlHq0TOL5VVUzUCC8cM65A10T
         ULjwm2t8gEJ1Ze6N6ROaft+sxOzruaa95catIuoL2MmNZqgc43JzB6MFfCyJHIt/kzHO
         FmlRzfzcEZsxMbuLDce73LPkA2yEeNuR+3bo7nLGhUN5pHzB05PztepRLKEnLmgmjJvT
         DxOi8ZWUThuiSBuBwjKXMh/MD2GWZHGJlhEvSnVdtk1G7vk38KX6KLlDoPfL+ATggM/h
         6FnQ==
X-Gm-Message-State: AOJu0YyoEH1jnTU56BGUufWbPBc8zjlJ+LMvnV8hFueEy+H+OgITTcrb
	/4sgAjk7+AY7S4mpM9IYnjHuEwHSOO3ofClX6M7jbGKx2xUroqmJ2R4riRvjhuzWVw==
X-Gm-Gg: ASbGnctoA/0o0nV/8ay2OHQXgYVnYCwfM5FkDOT3KVjyx/WzDIk9glAZGyDyY5y+Tl3
	CUHcoDlLbAME+clWd1liPEwWPWNOA/y94XclgypcHhpZfINEzrz/+xnHG/AV3s3dDC4VbOkUk71
	mg/OCGIJbvYkzun7pxAZ43+nM/eGvFEgDKzhdke08iFqJZqS9GAkBS+ukH6PMFWe61fNcF24/gh
	91bvSvar4UgZwxAl4zWRZxTVWmyOePe6FPuHKBe3B0lX1SU0BanIXhfd4897hny7UnCr/i8gT+f
	rU+t6jSetoOF4ItDlHLGM6Je39OrzwHb/ReU3Ae/Jc68BA+WlBiLdZUP/fiyBmVCfF+B/L1+Rpb
	VvbHxSYoG7xxhvsD5bI6FDam4vnMjUk2r
X-Google-Smtp-Source: AGHT+IGBUkNU5BHBsm54+1PSG/6lclwWff4KIv0p28uAEOpl8zGSN9+9v6feCHyEwuOCStdBSrFiDQ==
X-Received: by 2002:a05:6a20:7d9e:b0:218:2b6e:711f with SMTP id adf61e73a8af0-220037599admr2820601637.14.1750234807233;
        Wed, 18 Jun 2025 01:20:07 -0700 (PDT)
Received: from 5CG4011XCS-JQI.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1691d7fsm10432084a12.69.2025.06.18.01.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:20:06 -0700 (PDT)
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v2 0/5] Defer throttle when task exits to user
Date: Wed, 18 Jun 2025 16:19:35 +0800
Message-Id: <20250618081940.621-1-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
- Re-org the patchset to use a single patch to implement throttle
  related changes, suggested by Chengming;
- Use check_cfs_rq_runtime()'s return value in pick_task_fair() to
  decide if throttle task work is needed instead of checking
  throttled_hierarchy(), suggested by Peter;
- Simplify throttle_count check in tg_throtthe_down() and
  tg_unthrottle_up(), suggested by Peter;
- Add enqueue_throttled_task() to speed up enqueuing a throttled task to
  a throttled cfs_rq, suggested by Peter;
- Address the missing of detach_task_cfs_rq() for throttled tasks that
  get migrated to a new rq, pointed out by Chengming;
- Remove cond_resched_tasks_rcu_qs() in throttle_cfs_rq_work() as
  cond_resched*() is going away, pointed out by Peter.
I hope I didn't miss any comments and suggestions for v1 and if I do,
please kindly let me know, thanks!

Base: tip/sched/core commit dabe1be4e84c("sched/smp: Use the SMP version
of double_rq_clock_clear_update()")

cover letter of v1:

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

Aaron Lu (2):
  sched/fair: Task based throttle time accounting
  sched/fair: Get rid of throttled_lb_pair()

Valentin Schneider (3):
  sched/fair: Add related data structure for task based throttle
  sched/fair: Implement throttle task work and related helpers
  sched/fair: Switch to task based throttle model

 include/linux/sched.h |   5 +
 kernel/sched/core.c   |   3 +
 kernel/sched/fair.c   | 445 +++++++++++++++++++++++-------------------
 kernel/sched/sched.h  |   4 +
 4 files changed, 253 insertions(+), 204 deletions(-)

-- 
2.39.5
