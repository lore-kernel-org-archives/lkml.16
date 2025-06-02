Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92E5258
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902210; cv=none; b=pi7emQdUNUi5OQuc2GaZ2RgBxAFdE5oEOOLFaqxCtTXLi7gH8omX9TsmMKhcP8exCbgZA+/8d9lODVImO7LPnNXZtKhY5SsLVz8X7RCL54Qg3YzeHeH1lk3joWsfjgVW/eZKfOAkWd4NtW2TohLXSeal8//rHfFCg1PxhxS32dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902210; c=relaxed/simple;
	bh=AljSUlS8f8Lj1MC812AZ6FEBnSpJdtnFPYK/dAA7rL4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=upYo5vBrSiuXDZ+Tn1VSdQObsWCf5uESTbbcU3FrR62xulogqRNBLwHdYkE8l5yQXVEOpdRGvjJjzSAPaAmkswmPM0ISDOxMvQb+1RkiSh3U8BsoKwTh7gdHTjt9FFMvbYKg131mkvaAwnCwv1PD7PPh85697W5E/bJqoOS57QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=icQVPUmG; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="icQVPUmG"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b115383fcecso3022080a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748902207; x=1749507007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JUlbdIaIr1hwWTRCMrIXkwFkCclKF9G7bnIFh7/NpzI=;
        b=icQVPUmGuPd0TnFa0a+IIscaVaJ06eKC1CJc6Jl7vNpN6G1yQVOsjdmUCB4OwNnZTj
         M/k8iZkPKjpatSXhdg998cKJ5pHyCJvx2Ha53oaMEz5JZD9X6vPoG6FN8CTKoUu2y9Vs
         +IA72y+dwmbsFzOKL29ZlK8BdiB4SM8jCohkhvdFMP+LMuDhndD+FXyNXOZ51yAG+CVK
         HdkRrtBwjLNi03v5bNPNUfBolnD1A7aRKIx7LFei3oUJr2M2BFbusZv9HjIJFshnaPYK
         QeJ/VvQvJ9qCzJmV33Yz7HZ/z0I7maUzJn7i5LJ/STW/YYRic5u3FkRS68Tk8K+TUY9Q
         8Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902207; x=1749507007;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUlbdIaIr1hwWTRCMrIXkwFkCclKF9G7bnIFh7/NpzI=;
        b=ZbC7z1/A8BJPto5gVa5kMA3qpW3ZbFmhuD5DslAzay83W9trNCPhGUN0h9fruzllJO
         3/zZn4Y2ikgU2MMyZ8f603FYgVn4PqWHTOqeK4kWx3wEhtYQL+w64SLdAT4FSdhvWlSp
         ynjstGZvb1w5Okn/29ThX6tkjoSv9JvvxsuNymXvJtgRrUCZToKhBboDUcZu8ODVyVPQ
         1L+UvhBtGzvsBHQaPrVXGiva+d0Szm+Zr5Y4nuTqFfe2Btf7o9nsi0/TdQdStTsiW1+M
         oCnEd9tcXSUlZTU2bF6CwdiUWIpNOcIsos4VfBQCIsNIJpl8oO9bVy53Stup4SfO7sJL
         48Aw==
X-Gm-Message-State: AOJu0YzYDlHX+rksKjCROkVQ/heULZqyMm2YEoYjXQ8aY/kR82P1+6SQ
	rxK4elVhocC9zZsnwYA+eBKR/margwV7Oz5u2QzVrt0XnrFiw4w3zsXX/fEryHpfBQbWnBen/1j
	eaSPA3CvlkKUk5RmpQ1n7lua1qvOVRD28HzVcd3Ma9nEnBJdY+RUg+Gy9yya0LZQrgzqKGJWgdV
	due+28+89Ib3MHQYFOUlmXcOlQh62vN6/ydG7N3zaFgmQXjL9S
X-Google-Smtp-Source: AGHT+IGUa41aEmF9jqFSVhT7GD05j4bZdkd8Q9j/xDAMZX2843jQZEAgkGkBZ+Sssy1SAzr8hvMCa9qUlXhV
X-Received: from plbjy12.prod.google.com ([2002:a17:903:42cc:b0:234:a13b:dc92])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea08:b0:234:a063:e2ac
 with SMTP id d9443c01a7336-23528fedd7bmr224754885ad.2.1748902207455; Mon, 02
 Jun 2025 15:10:07 -0700 (PDT)
Date: Mon,  2 Jun 2025 22:09:47 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602221004.3837674-1-jstultz@google.com>
Subject: [RESEND][PATCH v17 0/8] Single RunQueue Proxy Execution (v17)
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
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey All,

Just wanted to resend v17, as I hadn't gotten any feedback this
time around. Many many thanks to Peter, Prateek, Metin and Juri
for their helpful feedback on the prior revision.=20

So with that out of the way, here is v17 of the Proxy Execution
series, a generalized form of priority inheritance.

As I=E2=80=99m trying to submit this work in smallish digestible pieces,
in this series, I=E2=80=99m only submitting for review the logic that
allows us to do the proxying if the lock owner is on the same
runqueue as the blocked waiter.  Introducing the
CONFIG_SCHED_PROXY_EXEC option and boot-argument, reworking the
task_struct::blocked_on pointer and wrapper functions, the
initial sketch of the find_proxy_task() logic, some fixes for
using split contexts, and finally same-runqueue proxying.=20

The biggest change with v17 is work to fix an issue Peter
pointed out about thread-group cpu time accounting. I=E2=80=99ve added
an additional patch to reorganize some logic, and included a
fix along with additional comments to try to make it clear.
Please let me know if there are still concerns here.

I=E2=80=99ve also continued working on the rest of the series, which
you can find here:
  https://github.com/johnstultz-work/linux-dev/commits/proxy-exec-v17-6.15-=
rc6
  https://github.com/johnstultz-work/linux-dev.git proxy-exec-v17-6.15-rc6

New changes:
* A number of improvements to the commit messages and comments
  suggested by Juri Lelli and Peter Zijlstra=20
* Added missing logic to put_prev_task_dl as pointed out by
  K Prateek Nayak
* Add lockdep_assert_held_once and drop the READ_ONCE in
  __get_task_blocked_on(), as suggested by Juri Lelli
* Introduced a new patch to move update_curr_task logic into
  update_curr_se to simplify things
* Renamed update_se_times to update_se, as suggested by Peter
* Reworked logic to fix an issue Peter pointed out with thread
  group accounting being done on the donor, rather than the
  running execution context.
* Fixed typos caught by Metin Kaya
* Reworked commit messages so Cc: list is below the fold, as
  Peter seems to prefer that when applying commits

Issues still to address with the full series:
* Peter suggested an idea that instead of when tasks become
  unblocked, using (blocked_on_state =3D=3D BO_WAKING) to protect
  against running proxy-migrated tasks on cpu=E2=80=99s they are not
  affined to, we could dequeue tasks first and then wake them.
  This does look to be cleaner in many ways, but the locking
  rework is significant and I=E2=80=99ve not worked out all the kinks
  with it yet. I am also a little worried that we may trip other
  wakeup paths that might not do the dequeue first. However, I
  have adopted this approach for the find_proxy_task() forced
  return migration, and it=E2=80=99s working well.
* The new rework using guard() cleans up a lot of things, but
  there are some edge cases where we change blocked_on locks, or
  need to drop locks to do migration, so there still are some
  odd goto exit cases needed to get out of the guard scope.
  Ideas for further cleanups would be welcome here.
* Need to sort out what is needed for sched_ext to be ok with
  proxy-execution enabled.
* K Prateek Nayak did some testing about a bit over a year ago
  with an earlier version of the series and saw ~3-5%
  regressions in some cases. I=E2=80=99m hoping to look into this soon
  to see if we can reduce those further.
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
As mentioned previously, this Proxy Execution series has a long
history:=20

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
Cc: Qais Yousef <qyousef@layalina.io>
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
 kernel/sched/core.c                           | 258 +++++++++++++++++-
 kernel/sched/deadline.c                       |   7 +
 kernel/sched/fair.c                           |  65 +++--
 kernel/sched/rt.c                             |   5 +
 kernel/sched/sched.h                          |  22 +-
 13 files changed, 449 insertions(+), 46 deletions(-)

--=20
2.49.0.1204.g71687c7c1d-goog

