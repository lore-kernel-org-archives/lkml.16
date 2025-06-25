Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36BE3597E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883479; cv=none; b=n/xENrtd6zwAxvPn/sQyRe72gqg8rQrCxwDLLvNj3yv34J0DL6te5bBcMe7mwEWXPKcAQ+mkQgPFkbdJFLKyaz0YcdOOfeaHC91Fu8Tk1fz0fibgoesTunNz7hcY74rnAwQfV3aE3Fubs/o0bEoFMW8m8zswwOWc7qBiBHaRO+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883479; c=relaxed/simple;
	bh=BSEuqqME9HzVFwsXQguj9Zt0wq+Ixt0XTGxAJ/tda2Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=co4sEOGIPqciG4evaHEA76Pxfuq9lahJYXEO0AWtihbzv6k0GPumyY0rdfN3PI/7GdpwmWNJiE7O5GApjJraMyJB20nrjtAzjCX00JsF9Dj30NdC5/RQwVSYCj5GWTCSvOgIaGLOB+ZYEgODPAjOmzraoxdxeDsioqUcz7jvUGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W2BrLA66; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W2BrLA66"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7489ac848f3so510904b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750883477; x=1751488277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+1HtdYa2qEx9xQit32U8jixwEFVgGzb4kUvF1lrUbU=;
        b=W2BrLA66l3M+Em+EnUf4AtLi7dJwHkAOrcX0XJfGj39lDaA+eYYoWWNVmiFIKuZ67X
         IL3hYlxK7WwuT1Ull+gZLzZXeZJNJ3OLkpV+o4TrvOG8CDTg0QYos8l7HIoKEkECeov4
         1uESCfkyIuXJn9DexjklXqcJ/aKI62MK/fdDEay7PS1FU0m7QS2DpkmfCUtOV7WXEjCG
         MxUNXOORRgdscSC1dXbMZd/FH1RvyAhguVLw0wIKzVGyOCti01QYQPKXEeo6ZI0WT9BE
         Ga9pF+gPVwC9TDYGZ40xlcvD2IhmAfxJIoCiCBv0WodkeywSza3BaWMQtL9we8flTAxw
         jb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750883477; x=1751488277;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+1HtdYa2qEx9xQit32U8jixwEFVgGzb4kUvF1lrUbU=;
        b=a+InzfRAO5JDkdDbgkmZ2O062tg1KaTbYbojj0THaIjos6Dz2cuP4ZhzCArY8kmI7J
         x6vKldDgFMoA3Ta90fYUeTQreusmTSPWGmNd8x2YtoLKL7OC+hCr5Tbv6o7AplQSZwdN
         Dbj8BTwWBlbG5/L4uLxIqDjXEgXkwumIosgYghtR/IsgrwI6iesCw0i/k1LEa4RtLzcQ
         w3ZLAVoJE6iBBEEXVBllfKnfMYsgzMNopa42pTcXcyJTqzCdbD94G3g9AVPeH0EPDFfx
         4EEA0M+jnbeebFC5eedX+S+qnBwQwPzBR9VITjwc7h3iOhYQtuM8+Zt6COw+0a6JUPSC
         MQZw==
X-Gm-Message-State: AOJu0YwZtz+OkOzbe9+W+TkzGqNG8ejwJvayaI3PICa/MUMEGq5KaqKp
	P6+rQKFxPflyPdXOLZR/d/txTG3ag/OVc1OHbPWhgKDFbpFDWjsJhQFeX/GZTs0kHNbFItPcoyu
	lRO3LIzomyYbVMy87OUFY5rvl2G8IFeE3F8ptvlCcr9bbbZ3ILkQNrHEeKpmOaA1wbOkCVdYfiZ
	cW0M5vhmgV2o8AgSnoZlCUmwjPzRxCMO8w8Ny4iT/wJNj5VIz3
X-Google-Smtp-Source: AGHT+IEOgffwAz2CiOYP5e9HMXxoQfzLgTbdGT76A8EuZl5EcKZam1MWMB4qa1tzIA6/h0xPpcs3t3S2EYeK
X-Received: from pfbbd34.prod.google.com ([2002:a05:6a00:27a2:b0:73e:665:360])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1141:b0:742:b3a6:db16
 with SMTP id d2e1a72fcca58-74ad45b0013mr7127829b3a.20.1750883477019; Wed, 25
 Jun 2025 13:31:17 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:30:53 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250625203110.2299275-1-jstultz@google.com>
Subject: [PATCH v18 0/8] Single RunQueue Proxy Execution (v18)
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey All,

After not getting much response from the v17 series (and
resending it), I was going to continue to just iterate resending
the v17 single runqueue focused series. However, Suleiman had a
very good suggestion for improving the larger patch series and a
few of the tweaks for those changes trickled back into the set
I=E2=80=99m submitting here.

Unfortunately those later changes also uncovered some stability
problems with the full proxy-exec patch series, which took a
painfully long time (stress testing taking 30-60 hours to trip
the problem) to resolve. However, after finally sorting those
issues out it has been running well, so I can now send out the
next revision (v18) of the set.

So here is v18 of the Proxy Execution series, a generalized form
of priority inheritance.

As I=E2=80=99m trying to submit this work in smallish digestible pieces,
in this series, I=E2=80=99m only submitting for review the logic that
allows us to do the proxying if the lock owner is on the same
runqueue as the blocked waiter: Introducing the
CONFIG_SCHED_PROXY_EXEC option and boot-argument, reworking the
task_struct::blocked_on pointer and wrapper functions, the
initial sketch of the find_proxy_task() logic, some fixes for
using split contexts, and finally same-runqueue proxying.=20

As I mentioned above, for the series I=E2=80=99m submitting here, it has
only barely changed from v17. With the main difference being
slightly different order of checks for cases where we don=E2=80=99t
actually do anything yet (more on why below), and use of
READ_ONCE for the on_rq reads to avoid the compiler fusing
loads, which I was bitten by with the full series.

However for the full proxy-exec series, there are a few
differences:
* Suleiman Souhlal noticed an inefficiency in that we evaluate
  if the lock owner=E2=80=99s task_cpu() is the current cpu, before we
  look to see if the lock owner is on_rq at all. With v17 this
  would result in us proxy-migrating a donor to a remote cpu,
  only to then realize the task wasn=E2=80=99t even on the runqueue,
  and doing the sleeping owner enqueuing. Suleiman suggested
  instead that we evaluate on_rq first, so we can immediately do
  sleeping owner enqueueing. Then only if the owner is on a
  runqueue do we proxy-migrate the donor (which requires the
  more costly lock juggling). While not a huge logical change,
  it did uncover other problems, which needed to be resolved.

* One issue found was there was a race where if
  do_activate_blocked_waiter() from the sleeping owner wakeup
  was delayed and the task had already been woken up elsewhere.
  It=E2=80=99s possible if that task was running and called into
  schedule() to be blocked, it would be dequeued from the
  runqueue, but before we switched to the new task,
  do_activate_blocked_waiter() might try to activate it on a
  different cpu. Clearly the do_activate_blocked_waiter() needed
  to check the task on_cpu value as well.

* I found that we still can hit wakeups that end up skipping the
  BO_WAKING -> BO_RUNNALBE transition (causing find_proxy_task()
  to end up spinning waiting for that transition), so I re-added
  the logic to handle doing return migrations from
  find_proxy_task() if we hit that case.

* Hupu suggested a tweak in ttwu_runnable() to evaluate
  proxy_needs_return() slightly earlier.

* Kuyo Chang reported and isolated a fix for a problem with
  __task_is_pushable() in the !sched_proxy_exec case, which was
  folded into the =E2=80=9Csched: Fix rt/dl load balancing via chain
  level balance=E2=80=9D patch

* Reworked some of the logic around releasing the rq->donor
  reference on migrations, using rq->idle directly.

* Sueliman also pointed out that some added task_struct elements
  were not being initialized in the init_task code path, so that
  was good to fix.

You can find the full series here:
  https://github.com/johnstultz-work/linux-dev/commits/proxy-exec-v18-6.16-=
rc3/
  https://github.com/johnstultz-work/linux-dev.git proxy-exec-v18-6.16-rc3

Issues still to address with the full series (not the patches
submitted here):
* Peter suggested an idea that instead of when tasks become
  unblocked, using (blocked_on_state =3D=3D BO_WAKING) to protect
  against running proxy-migrated tasks on cpu=E2=80=99s they are not
  affined to, we could dequeue tasks first and then wake them.
  This does look to be cleaner in many ways, but the locking
  rework is significant and I=E2=80=99ve not worked out all the kinks
  with it yet. I am also a little worried that we may trip
  other wakeup paths that might not do the dequeue first.
  However, I have adopted this approach for the
  find_proxy_task() forced return migration, and it=E2=80=99s working
  well.

* Need to sort out what is needed for sched_ext to be ok with
  proxy-execution enabled.

* K Prateek Nayak did some testing about a bit over a year ago
  with an earlier version of the series and saw ~3-5%
  regressions in some cases. Need to re-evaluate this with the
  proxy-migration avoidance optimization Suleiman suggested now
  implemented.

* The chain migration functionality needs further iterations and
  better validation to ensure it truly maintains the RT/DL load
  balancing invariants (despite this being broken in vanilla
  upstream with RT_PUSH_IPI currently)

I=E2=80=99d really appreciate any feedback or review thoughts on the
full series as well. I=E2=80=99m trying to keep the chunks small,
reviewable and iteratively testable, but if you have any
suggestions on how to improve the series, I=E2=80=99m all ears.

Credit/Disclaimer:
=E2=80=94--------------------
As always, this Proxy Execution series has a long history with
lots of developers that deserve credit:=20

First described in a paper[1] by Watkins, Straub, Niehaus, then
from patches from Peter Zijlstra, extended with lots of work by
Juri Lelli, Valentin Schneider, and Connor O'Brien. (and thank
you to Steven Rostedt for providing additional details here!)

So again, many thanks to those above, as all the credit for this
series really is due to them - while the mistakes are likely mine.

Thanks so much!
-john

[1] https://static.lwn.net/images/conf/rtlws11/papers/proc/p38.pdf

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io> =20
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: kernel-team@android.com

John Stultz (4):
  sched: Add CONFIG_SCHED_PROXY_EXEC & boot argument to enable/disable
  sched: Move update_curr_task logic into update_curr_se
  sched: Fix runtime accounting w/ split exec & sched contexts
  sched: Add an initial sketch of the find_proxy_task() function

Peter Zijlstra (2):
  locking/mutex: Rework task_struct::blocked_on
  sched: Start blocked_on chain processing in find_proxy_task()

Valentin Schneider (2):
  locking/mutex: Add p->blocked_on wrappers for correctness checks
  sched: Fix proxy/current (push,pull)ability

 .../admin-guide/kernel-parameters.txt         |   5 +
 include/linux/sched.h                         |  72 ++++-
 init/Kconfig                                  |  12 +
 kernel/fork.c                                 |   3 +-
 kernel/locking/mutex-debug.c                  |   9 +-
 kernel/locking/mutex.c                        |  18 ++
 kernel/locking/mutex.h                        |   3 +-
 kernel/locking/ww_mutex.h                     |  16 +-
 kernel/sched/core.c                           | 257 +++++++++++++++++-
 kernel/sched/deadline.c                       |   7 +
 kernel/sched/fair.c                           |  65 +++--
 kernel/sched/rt.c                             |   5 +
 kernel/sched/sched.h                          |  22 +-
 13 files changed, 448 insertions(+), 46 deletions(-)

--=20
2.50.0.727.gbf7dc18ff4-goog

