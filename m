Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE912367CE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744437788; cv=none; b=RP5CRbEM4XACEqauH0Duknuc3LAxVWYVhG/YpT0j9V2LeNGsC6zV2YFv1xHsRtZVi80aqnGL6546pYL/084gpqkyly1tVrnSRDP7uhqYz1Q7TswdCL71s0lwqGvNJsSb/td/K3k/5S0rS5PZEqv26cqvT/PByr1pvStS7vyhHRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744437788; c=relaxed/simple;
	bh=dW2uXQiGD6fEZfMlAOSeT78eTWyZdYzs2dOUUfvLclc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Lp0siwb93XbJOu7dttIASuM4tNV/CkYnyZ1GhhrTEGYtxZXJKfRq4kDNcw/Dzbct1eRqcZ3qcymLnH5Np52RYrXSb/LL+gqcaFCtlAPmA5WnpnJunChS6Ust3JdSRSbdlF9zPHZwogwwDFCp5AbJ8b8Q8dX1WJ63kzRNhMRLz+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c/PKq9nD; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c/PKq9nD"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af9070a5311so1610871a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744437786; x=1745042586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0bAi/3LMOFWsB/nOiI0SmzOcbL1OxQ8dOSb6frjX5tg=;
        b=c/PKq9nDaytC/TNQl738C8jdtviXyOdQ+i9twm3HETXkO8Eqv/UGkyQkW2JmRQMpj/
         +A6AOBpTrGD5YLVfCqGdOoTDnJOyWsfxX5y4HJmmAeftykzhP/hwa3Bf7zXIGry7RENm
         0MA0xcqdVJ09XBMt/u0x/LzXKQlrAUWoWfrYG87xr2pnzSGuCUC4OKQxjGmunUSdzD4K
         /0+abqlfmGND5lx7Rus574AwwuRO2E5ae/YiH8fob6t01xkBQuc5QPI6rcW5hOv1EFlH
         CUjUQenOyNp7vJQt+hkSUM4Cgf1NHtLaE0anSBL4BO2Z+evDhM/VTqga0p6wNyo4JbAa
         KTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744437786; x=1745042586;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bAi/3LMOFWsB/nOiI0SmzOcbL1OxQ8dOSb6frjX5tg=;
        b=Bd/Lm0kttvd7e+1ng8yxYcEyPbg0e6tJVhCiiVJvKB5CF4KUX/5jNVC7ugBAGXNTDC
         zvjnPxvHaBec8ghhJ8Bi6cAJHPaFDlDNQM+K5U6yoD3l1Wt8moaqbHbs54ONzrcEVzqX
         SDowihCJbWSh4e9qqKexyCJoZMyp8LuR2V4su9Q/s91I7G3GS3ZSWZj114i5Zv3c9YaG
         sjXFBXBSyTpD+nF+qIJAmAE8L/gAb8byQKgn5H8yN7hb756uXxd82LPP5YvlUpoiOreP
         8wNaebOSYNw4EhmTzds+JVoabJ1QT8wd+YkakBHsz7L7d57SIEUxYqPEjWefW78816ta
         62cw==
X-Gm-Message-State: AOJu0Yw6SlWaUTWluf8Obct4Ty/XMRBVSAGlerw1ltlwH+GKGaF6bLQW
	6Sen4ETZoKp/6ErhUVLykfWb3lXEIMAXPoaKSfZ3Z6wodp/7KNjwZnPWdl8zWsfoznj+Oa7Fiaa
	spFebZBhx6tFBzuaqIg0WXADDagCljTKXVtiUHvd20+TtEZ0jvIo4v+MLgEEuqQQpithAPg4Fdv
	+Z4o4d8CPIV3cvXqgJin59QQcby110cxi/2gEg5aWE11L+
X-Google-Smtp-Source: AGHT+IGQt9IMcNgIENXA0yYsmUNEBuY1KvOURjrSuSIzz+R1hDpxVShNFcmZpDB1yXLplR3KdjWJ5Fc5Y9zD
X-Received: from pjbcz15.prod.google.com ([2002:a17:90a:d44f:b0:2fc:1356:bcc3])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f84:b0:2ff:4bac:6fbf
 with SMTP id 98e67ed59e1d1-308236248b4mr8373580a91.7.1744437785552; Fri, 11
 Apr 2025 23:03:05 -0700 (PDT)
Date: Fri, 11 Apr 2025 23:02:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250412060258.3844594-1-jstultz@google.com>
Subject: [PATCH v16 0/7] Single RunQueue Proxy Execution (v16)
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

After sending out v15, I unfortunately realized that in moving
some logic further back in the full patch series, I had
accidentally introduced some difficult to trigger bugs in the
subset of the series I was submitting. Sadly it took me a while
to figure out exactly which bits weren=E2=80=99t safe to migrate out,
but I=E2=80=99ve finally gotten it back into stable shape.

Many many thanks to Peter, Steven and Prateek for their helpful
feedback on the last revision. I have tried to integrate much
of the changes suggested, but I may have missed things in all
the great feedback, please let me know if you find anything.

Also, since v15, I presented at OSPM on the current status of
Proxy Execution, which you can watch here:
    https://youtu.be/xcV1NtWENbs?feature=3Dshared=20

So with that out of the way, here is v16 of the Proxy Execution
series, a generalized form of priority inheritance.

As I=E2=80=99m trying to submit this work in smallish digestible pieces,
in this series, I=E2=80=99m only submitting for review the logic that
allows us to do the proxying if the lock owner is on the same
runqueue as the blocked waiter. Introducing the
CONFIG_SCHED_PROXY_EXEC option and boot-argument, reworking the
task_struct::blocked_on pointer and wrapper functions, the
initial sketch of the find_proxy_task() logic, some fixes for
using split contexts, and finally same-runqueue proxying.=20

So with v16, I=E2=80=99ve obviously tried to stabilize the patch series
each step of the way, as well address the feedback provided.
Particularly complex has been the reworking of the
find_proxy_task() logic to use guard() to avoid some of the
uglier goto return logic.

I=E2=80=99ve also continued working on the rest of the series, which you
can find here:
  https://github.com/johnstultz-work/linux-dev/commits/proxy-exec-v16-6.15-=
rc1/
  https://github.com/johnstultz-work/linux-dev.git proxy-exec-v16-6.15-rc1

New changes in the full series include:
* Allow "sched_proxy_exec" without "=3Dtrue" to enable
  proxy-execution at boot time, in addition to the
  "sched_proxy_exec=3Dtrue" or "sched_proxy_exec=3Dfalse" options as
  suggested by Steven
* Drop the "default n" in Kconfig as suggested by Steven
* Add !SCHED_CLASS_EXT dependency until I can investigate if
  sched_ext can understand split contexts, as suggested by Peter
* Undoing some changes I pushed out later in the series to be
  earlier in order to avoid hitting bugs (mostly around
  optimistic spinning/lock stealing, but also sched_balance
  migrating blocked tasks).
* Renamed update_curr_se to update_se_times, as suggested by
  Steven Rostedt.
* Move the enqueue_task_rt() changes to a more relevant patch,
  as suggested by K Prateek Nayak
* Fixup whitespace error pointed out by K Prateek Nayak
* Use put_prev_set_next_task as suggested by K Prateek Nayak
* Try to rework find_proxy_task() locking to use guard and
  proxy_deactivate_task() in the way Peter suggested.
* Simplified changes to enqueue_task_rt to match deadline's
  logic, as pointed out by Peter
* Get rid of preserve_need_resched flag and rework per Peter's
  suggestion
* Rework find_proxy_task() to use guard to cleanup the exit
  gotos as Peter suggested.
* Properly understood the =E2=80=9Clost-wakeup=E2=80=9D issue I was trippin=
g and
  working around earlier, and reworked the forced
  return-migration from find_proxy_task to use Peter=E2=80=99s
  dequeue+wakeup approach, which helps resolve the cpuhotplug
  issues I had also seen, caused by the manual return migration
  sending tasks to offline cpus.


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

I=E2=80=99d really appreciate any feedback or review thoughts on this
series. I=E2=80=99m trying to keep the chunks small, reviewable and
iteratively testable, but if you have any suggestions on how to
improve the series, I=E2=80=99m all ears.

Credit/Disclaimer:
=E2=80=94--------------------
As mentioned previously, this Proxy Execution series has a long
history:=20

First described in a paper[1] by Watkins, Straub, Niehaus, then
from patches from Peter Zijlstra, extended with lots of work by
Juri Lelli, Valentin Schneider, and Connor O'Brien. (and thank
you to Steven Rostedt for providing additional details here!)

So again, many thanks to those above, as all the credit for this
series really is due to them - while the mistakes are likely
mine.

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


John Stultz (3):
  sched: Add CONFIG_SCHED_PROXY_EXEC & boot argument to enable/disable
  sched: Fix runtime accounting w/ split exec & sched contexts
  sched: Add an initial sketch of the find_proxy_task() function

Peter Zijlstra (2):
  locking/mutex: Rework task_struct::blocked_on
  sched: Start blocked_on chain processing in find_proxy_task()

Valentin Schneider (2):
  locking/mutex: Add p->blocked_on wrappers for correctness checks
  sched: Fix proxy/current (push,pull)ability

 .../admin-guide/kernel-parameters.txt         |   5 +
 include/linux/sched.h                         |  68 ++++-
 init/Kconfig                                  |  12 +
 kernel/fork.c                                 |   3 +-
 kernel/locking/mutex-debug.c                  |   9 +-
 kernel/locking/mutex.c                        |  18 ++
 kernel/locking/mutex.h                        |   3 +-
 kernel/locking/ww_mutex.h                     |  16 +-
 kernel/sched/core.c                           | 258 +++++++++++++++++-
 kernel/sched/deadline.c                       |   3 +
 kernel/sched/fair.c                           |  35 ++-
 kernel/sched/rt.c                             |   5 +
 kernel/sched/sched.h                          |  22 +-
 13 files changed, 428 insertions(+), 29 deletions(-)

--=20
2.49.0.604.gff1f9ca942-goog

