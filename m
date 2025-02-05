Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763522CBDA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752241; cv=none; b=hVjdoPXlB+vKrLBGmafuj5gE/zW2JLteQkk/IUg79CiV3h6FcaWFIpKwU7zj5AqnBVW9y+71GT5ygjgwkwi1MvL1RzVyKxr/NtUNo3sREYXSKlvhBYQhu0q25EaJ1lE+urqnqoDpDjZ/SFxjVQSGkpM6vccHUzP47ET2t/81Fvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752241; c=relaxed/simple;
	bh=xnXux1kGgJiIjn/ZHvkI/XAXEwhBlPi8SJkfUUC2Qk0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pNO044pkTxJwPDr+12KO2qpYotYHFpPusXHHp+sLeGLk7U1pJbxyZk72qXKUsBGEACqsWEyDXV9EZjh0wo6pmKV8YM+oejEtiI00RcY4xG+ymMIrf/aN+fznncToXxQFLJZRMInUWnJo3vNJAAVmpxbMPPITMvEpmnd6BmiHXZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e3NO/Sox; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0+mjZtOO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e3NO/Sox";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0+mjZtOO"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IvhKgvnTwEZUmN3ViXulBQzztoXq4tG/17TtF1y8bhk=;
	b=e3NO/SoxFW1J3U/7b3MV9JYEwF/48WUkuKkEIwceo1/gmEvy6mpqeuv7kfigTKJjD2QNz5
	ifr6Qssazg08htFq0wy//MMuP1nGt+HuYp/cNVaf05gBtaxOAARcvs1+9TmXEyuUuoKGT8
	GSU7pNqGqEdx+08gFudBYHsXVGH2fBeh5OzhO0sin6XHlUJiS1Uhy8lWFEciDUpa5xsf2A
	Ksdv/V2B0yVZTTOLl8JwxzdfMkHPgaTujuSLXZu7VnPYn4QgLjka6fEIjI+rdp5L6GMq8j
	WiwFAFgdheWJ1lSoNnWCDTQml7F1aycAD9i6k1aSrFUGBm6KTSHUM1ei7BLWzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IvhKgvnTwEZUmN3ViXulBQzztoXq4tG/17TtF1y8bhk=;
	b=0+mjZtOO5QcarorAc/CYNwUCSugY4LnKvktsxZH2UH5QmodwCAMdKxUCjjrmbw6DYOtRy5
	38clHDRPll/gY5BA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 02/24] net/sched: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:22 +0100
Message-Id: <f1d4843589dd924743b35de1f0920c4a4c43be01.1738746872.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746872.git.namcao@linutronix.de>
References: <cover.1738746872.git.namcao@linutronix.de>
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

Patch was created by using Coccinelle.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/sched/act_gate.c   | 3 +--
 net/sched/sch_api.c    | 3 +--
 net/sched/sch_taprio.c | 6 ++----
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
index 91c0ec729823..c1f75f272757 100644
--- a/net/sched/act_gate.c
+++ b/net/sched/act_gate.c
@@ -287,8 +287,7 @@ static void gate_setup_timer(struct tcf_gate *gact, u64=
 basetime,
 	gact->param.tcfg_basetime =3D basetime;
 	gact->param.tcfg_clockid =3D clockid;
 	gact->tk_offset =3D tko;
-	hrtimer_init(&gact->hitimer, clockid, HRTIMER_MODE_ABS_SOFT);
-	gact->hitimer.function =3D gate_timer_func;
+	hrtimer_setup(&gact->hitimer, gate_timer_func, clockid, HRTIMER_MODE_ABS_=
SOFT);
 }
=20
 static int tcf_gate_init(struct net *net, struct nlattr *nla,
diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
index e3e91cf867eb..6d85b342a857 100644
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@ -619,8 +619,7 @@ static enum hrtimer_restart qdisc_watchdog(struct hrtim=
er *timer)
 void qdisc_watchdog_init_clockid(struct qdisc_watchdog *wd, struct Qdisc *=
qdisc,
 				 clockid_t clockid)
 {
-	hrtimer_init(&wd->timer, clockid, HRTIMER_MODE_ABS_PINNED);
-	wd->timer.function =3D qdisc_watchdog;
+	hrtimer_setup(&wd->timer, qdisc_watchdog, clockid, HRTIMER_MODE_ABS_PINNE=
D);
 	wd->qdisc =3D qdisc;
 }
 EXPORT_SYMBOL(qdisc_watchdog_init_clockid);
diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index a68e17891b0b..14021b812329 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -1932,8 +1932,7 @@ static int taprio_change(struct Qdisc *sch, struct nl=
attr *opt,
 	if (!TXTIME_ASSIST_IS_ENABLED(q->flags) &&
 	    !FULL_OFFLOAD_IS_ENABLED(q->flags) &&
 	    !hrtimer_active(&q->advance_timer)) {
-		hrtimer_init(&q->advance_timer, q->clockid, HRTIMER_MODE_ABS);
-		q->advance_timer.function =3D advance_sched;
+		hrtimer_setup(&q->advance_timer, advance_sched, q->clockid, HRTIMER_MODE=
_ABS);
 	}
=20
 	err =3D taprio_get_start_time(sch, new_admin, &start);
@@ -2056,8 +2055,7 @@ static int taprio_init(struct Qdisc *sch, struct nlat=
tr *opt,
=20
 	spin_lock_init(&q->current_entry_lock);
=20
-	hrtimer_init(&q->advance_timer, CLOCK_TAI, HRTIMER_MODE_ABS);
-	q->advance_timer.function =3D advance_sched;
+	hrtimer_setup(&q->advance_timer, advance_sched, CLOCK_TAI, HRTIMER_MODE_A=
BS);
=20
 	q->root =3D sch;
=20
--=20
2.39.5

