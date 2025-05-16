Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593043D69
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747365501; cv=none; b=M9WqMMQP4T33XynQVBBEj/uShE5aq4wxmfHRD5nnxkvBZfwvyJZkFycpybkixrPsK7cD3aJv74U+7V0p/ZfwqJRt+FDHGcgcVrb9InsBnmbj2B1eGUJMXhMY26QyB7TQDQ9H7ZTGsnw01rTYfY4CSWPbVHsoGBsGNHGVMg38BZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747365501; c=relaxed/simple;
	bh=9E9Ct3fWx+PLWzPIN0wMI89d2IGhnw//Ui1PwwxeVZU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kNmwXJAw8oQVpQZHyFB/3xmGIXff8AkQmoDPirziJ4qDyNf7KoLl2F4GOclS9rLRfoi1C+hRkqFgdbDgpwp6+8vLJqXAKW31LQ2AmzgEfXohMezNyHaYq4eX9lQTtEFanhQWmsD+TbIMei85d0tUHU7oHo0Nc98S8xWcsguPsTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pal+mwEc; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pal+mwEc"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b115fb801bcso1538726a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747365497; x=1747970297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ocSeD1MFoXPrVGX+yBIrpns2nCdd6scBX69a/ALUEe8=;
        b=pal+mwEc+XqJBUp/S5YOcrOwSrZw9Bj0lLn/qiwPHByOHwZcQRApT1nu92RQmL70mZ
         //fpHQ9BMjbCm2whOtNfGxSaIFx6AW227ZebnDgkn6uedWWy620RraqHCQXuF5tDm8lH
         4C+3w7FgWNETurErbYBaBz7QdDc6nbqd+vSaCJKlQcoM8JpzJls6V9dW0uRSNpRbLLbb
         ASimFXJowy/ahJqC3UMVhhx1LQuyNeGJQMwn+Y0vY3ybLV/Lz3k5xNAS3L6h12MYNeNV
         VRr2GovoIC7RuIwSVEO9Pd8/wD6GdMUkfxesMfNCct9CFummhT8q//sdBNpeITBX2I5n
         F/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747365497; x=1747970297;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocSeD1MFoXPrVGX+yBIrpns2nCdd6scBX69a/ALUEe8=;
        b=Pwiii5axdFI+2NNwYuxUydt495g92sT/ACh8nwNn5arghk9r6WkTWLykR5ME1iOYOx
         blo8GQBcBC/QcFHPha06RZEZB4qPn9kroxvkL4P8fHeILMPI2rrVnb6YIY2X3v3o/dmn
         63/6Fcildx5c/vuD3VC43BWwfOylS5jY4vfkG5Pwpa2bnWrczd8HxnrMPY1R1ITvejsP
         GzJYiPltMf5NErys6S7diY8wCvYRmr14s+Q+FgPAzJfApF4WVvgGfwbsUbBHnQwRT/zu
         +5Xqqq0yi2PU1wKU+e3NfXMOiEv+S7VsHhWMfR9YJijAv6bGoqCzQFDp3tmg1J5SG0O+
         9NBg==
X-Gm-Message-State: AOJu0Yzd9/D6oMJ3zfbxcHX4QX8n66jCY0Bm3UGYD9nenAd4Lkh1HhUa
	XtIydKz/ZsX3fj7MOmLUVccUQsSG3MlvwQiTlatU/r3cEdTDHP2krbiqhFP/0WLn+h8KYxvKHDx
	t9sYXMSu+gR7FydAEgwq1qp0gPPEjGQGYLR9K72YW2LvhaGVr79WZKpQvUu7oIuKlpmdlMbhu9A
	qHY95+EUjLmDcDMh2uQ+b11aZBLSMeFCpNX/K31fWa6gskVaFD
X-Google-Smtp-Source: AGHT+IFqUd560yjsSbMwwzat5ubwApysTgwzZw5QRhSKuiyL0A/wJ1tmPeQoPjeZGKL+7KMb6shT0l9oEEtd
X-Received: from pghd1.prod.google.com ([2002:a63:fd01:0:b0:b26:e8ed:2bdc])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d83:b0:20d:d31c:cd28
 with SMTP id adf61e73a8af0-21621876c6cmr2777871637.7.1747365497419; Thu, 15
 May 2025 20:18:17 -0700 (PDT)
Date: Fri, 16 May 2025 03:17:47 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516031814.1870508-1-jstultz@google.com>
Subject: [PATCH v17 0/8] Single RunQueue Proxy Execution (v17)
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

Many many thanks to Peter, Prateek, Metin and Juri for their
helpful feedback on the last revision. I got a little
side-tracked on some other things, so this took a bit longer to
send out than I had hoped. I have tried to integrate much of the
changes suggested, but as always I may have missed things in all
the great feedback, please let me know if you find anything.

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
an additional patch to reorganize some logic, and included a fix
along with additional comments to try to make it clear. Please
let me know if there are still concerns here.

I=E2=80=99ve also continued working on the rest of the series, which you
can find here:
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
2.49.0.1101.gccaa498523-goog

