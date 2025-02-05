Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0271A22C35C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751995; cv=none; b=FjHAD6RJB35HrOxO5eZ+huFua458y/2P2gZ6b5lfAjzSBFZPBGzoaBVJyN+f+u+ju+YP1SilvLGH/1dC/nBoWnGy4dAC1zDtvenyIbjDuR6jvvH9eSZ13MKH69JnmdsW5BXMEXt+dYB6RUGs+QR3J/qtSXwLaOxaKi0GP9f3tvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751995; c=relaxed/simple;
	bh=wYnISaD+ByGRsPCbpgLjJpzcm3qVaQ/m23YCxCu49Y8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WZWpY0TSS4ZXjm54AcFEHgNGD5ddSlkAkb9EXpGF3hzGALNJy5qjuI7SVFg1yiMPY5xH/kvW+Hrrmb/Ng4KsP5+Nwlg0tYWTkPcpqc4Ri6L+2gYt2QpqsosPUpX/aJW78UlNUXz997vR45dex81u8tMLGITTVBLaGHt9pjdbD2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RKyRJOOy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BMEUTsU6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RKyRJOOy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BMEUTsU6"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1/kdljBMI1iJavjlWo8oHT1AdcLAhNVPwMF1Tuuk40=;
	b=RKyRJOOyiirNgBhR4cVqlBQuHHrWSeAnOnnFzii7IpX29M74fr3/2CbQJyFWtHO7l/syBA
	aWYedPD1YkpcWIEv9yUiIwFyiXG3fLIIcs8cpyiof+LzFXmzJZZA1PzHs8fGLpcAcyjgov
	6hRSa2AQpGUc8EuFJZbuY/2nd20YSJesqkpHNJkCncfHuT5CbCN/Cr2utCcWwd6LizAAPY
	a0+IDjCvkk1iVsQ64gNcFR0VG0tAEU/rdp0ApHVodN5sYGB1JiDwABYriqwuAYGPThY8PZ
	wbXjv+WSoBh3kkL+jc6oQ0kYgRHhm6jlHwaZJOc3GKRPPjVuctt82yGpDsLxOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1/kdljBMI1iJavjlWo8oHT1AdcLAhNVPwMF1Tuuk40=;
	b=BMEUTsU6sykoD77DGLiW8+ZGXAddFC5TuJZVGjbCJhPO7vFBX8uv3FCSuM7ls9l7LvaC4f
	/6UPoty1Dhn455CA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v2 13/31] sched: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:57 +0100
Message-Id: <a55e849cba3c41b4c5708be6ea6be6f337d1a8fb.1738746821.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746821.git.namcao@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 kernel/sched/core.c     | 3 +--
 kernel/sched/deadline.c | 6 ++----
 kernel/sched/fair.c     | 8 ++++----
 kernel/sched/rt.c       | 5 ++---
 4 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 165c90ba64ea..357ff79cc760 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -916,8 +916,7 @@ static void hrtick_rq_init(struct rq *rq)
 #ifdef CONFIG_SMP
 	INIT_CSD(&rq->hrtick_csd, __hrtick_start, rq);
 #endif
-	hrtimer_init(&rq->hrtick_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
-	rq->hrtick_timer.function =3D hrtick;
+	hrtimer_setup(&rq->hrtick_timer, hrtick, CLOCK_MONOTONIC, HRTIMER_MODE_RE=
L_HARD);
 }
 #else	/* CONFIG_SCHED_HRTICK */
 static inline void hrtick_clear(struct rq *rq)
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 38e4537790af..2d0f571f95e9 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1382,8 +1382,7 @@ static void init_dl_task_timer(struct sched_dl_entity=
 *dl_se)
 {
 	struct hrtimer *timer =3D &dl_se->dl_timer;
=20
-	hrtimer_init(timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
-	timer->function =3D dl_task_timer;
+	hrtimer_setup(timer, dl_task_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HAR=
D);
 }
=20
 /*
@@ -1839,8 +1838,7 @@ static void init_dl_inactive_task_timer(struct sched_=
dl_entity *dl_se)
 {
 	struct hrtimer *timer =3D &dl_se->inactive_timer;
=20
-	hrtimer_init(timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
-	timer->function =3D inactive_task_timer;
+	hrtimer_setup(timer, inactive_task_timer, CLOCK_MONOTONIC, HRTIMER_MODE_R=
EL_HARD);
 }
=20
 #define __node_2_dle(node) \
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1c0ef435a7aa..88923f1873f6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6539,14 +6539,14 @@ void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b=
, struct cfs_bandwidth *paren
 	cfs_b->hierarchical_quota =3D parent ? parent->hierarchical_quota : RUNTI=
ME_INF;
=20
 	INIT_LIST_HEAD(&cfs_b->throttled_cfs_rq);
-	hrtimer_init(&cfs_b->period_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_PINN=
ED);
-	cfs_b->period_timer.function =3D sched_cfs_period_timer;
+	hrtimer_setup(&cfs_b->period_timer, sched_cfs_period_timer, CLOCK_MONOTON=
IC,
+		      HRTIMER_MODE_ABS_PINNED);
=20
 	/* Add a random offset so that timers interleave */
 	hrtimer_set_expires(&cfs_b->period_timer,
 			    get_random_u32_below(cfs_b->period));
-	hrtimer_init(&cfs_b->slack_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	cfs_b->slack_timer.function =3D sched_cfs_slack_timer;
+	hrtimer_setup(&cfs_b->slack_timer, sched_cfs_slack_timer, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 	cfs_b->slack_started =3D false;
 }
=20
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 4b8e33c615b1..7a9ed4d93397 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -127,9 +127,8 @@ void init_rt_bandwidth(struct rt_bandwidth *rt_b, u64 p=
eriod, u64 runtime)
=20
 	raw_spin_lock_init(&rt_b->rt_runtime_lock);
=20
-	hrtimer_init(&rt_b->rt_period_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL_HARD);
-	rt_b->rt_period_timer.function =3D sched_rt_period_timer;
+	hrtimer_setup(&rt_b->rt_period_timer, sched_rt_period_timer, CLOCK_MONOTO=
NIC,
+		      HRTIMER_MODE_REL_HARD);
 }
=20
 static inline void do_start_rt_bandwidth(struct rt_bandwidth *rt_b)
--=20
2.39.5

