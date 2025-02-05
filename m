Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B23722DF91
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751999; cv=none; b=RmkfjIohVP6zM84wmqGXWoBRxwoZx1YOuSqf/XWGAk2qvL05363SdhUzI6aiiPMq8y6x13zbmbpIghPC4/YgfVwD5H31NMFY7LyXKquAYqg6LKGoQ3RUAyj0z2NuUAW3ekVSC2hwVrpv5vXQD1TNHSx1XjmykXecOco8XUqFKO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751999; c=relaxed/simple;
	bh=40Z28cQpBtR6oIW/eao5gQOUrtoDvxU5hvpTOaulsBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u/sN7alJ1xxpH6pLsg/Dd/I60SHRwdMsmMZ/wOTHKd/uV9tPKbiTpVsDfmBks2P64BFVJPGjLS8Dmk5IScPOIu3mER3scdufsyvX9xmBwPKTCBWCisNMXWEj0zNX7C+5rW773JkakbroWj5iZHzp3nG9jPqGXiwmc1XEfVFi5Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XPx/twKT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zHm/Q/D8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XPx/twKT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zHm/Q/D8"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGfDS6ZDEk08bix2mTnocbNLz1H/h2zWQ2e/ZUBvbi4=;
	b=XPx/twKT7A4xKTpPKCX5bwhy/qBQYxW6GStA1L0xQp856EcmaKGVNJuNPkst9/dCUIzE6+
	QwU8B8mlrbgNlgxvkWyB9SRw3/8nvBnklhMSUj5SYEseaFHNKXgJRayL16bTFvV/FWQ8Vd
	spwH/hrOzX7kzNvzWUuztYduj3EEwymv3BpYq1Ybfi7Rx1pWohvjP+1nKEZDux4WRgce4o
	YbnjiHXUzLRVF2PLiw2DqyxbuGpZft2ONtqDbmUSkUHBwLHpKNnPTwr3pyWsrSi4tVBaaq
	4fm3q0wcfX4mBwvobgXIG3OBQqeNhhzcosHWemkUQj8fuI6bJJBlhLEofiO/Ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGfDS6ZDEk08bix2mTnocbNLz1H/h2zWQ2e/ZUBvbi4=;
	b=zHm/Q/D8/uj9VYQdo0nsujVQ7OHtLR2Kt2+RJGuAhjcPKFywwpLuFsmlZVo0VhTrgu8teX
	tBWVuic3EhIp8EAg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	John Stultz <jstultz@google.com>
Subject: [PATCH v2 20/31] time: Switch to hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:04 +0100
Message-Id: <170bb691a0d59917c8268a98c80b607128fc9f7f.1738746821.git.namcao@linutronix.de>
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
Cc: John Stultz <jstultz@google.com>
---
 kernel/time/ntp.c                    | 3 +--
 kernel/time/posix-timers.c           | 7 +++----
 kernel/time/sched_clock.c            | 3 +--
 kernel/time/tick-broadcast-hrtimer.c | 3 +--
 kernel/time/tick-sched.c             | 6 ++----
 5 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
index 163e7a2033b6..b837d3d9d325 100644
--- a/kernel/time/ntp.c
+++ b/kernel/time/ntp.c
@@ -678,8 +678,7 @@ void ntp_notify_cmos_timer(bool offset_set)
=20
 static void __init ntp_init_cmos_sync(void)
 {
-	hrtimer_init(&sync_hrtimer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
-	sync_hrtimer.function =3D sync_timer_callback;
+	hrtimer_setup(&sync_hrtimer, sync_timer_callback, CLOCK_REALTIME, HRTIMER=
_MODE_ABS);
 }
 #else /* CONFIG_GENERIC_CMOS_UPDATE) || defined(CONFIG_RTC_SYSTOHC) */
 static inline void __init ntp_init_cmos_sync(void) { }
diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 1b675aee99a9..58351f537a04 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -381,7 +381,7 @@ static void posix_timer_unhash_and_free(struct k_itimer=
 *tmr)
=20
 static int common_timer_create(struct k_itimer *new_timer)
 {
-	hrtimer_init(&new_timer->it.real.timer, new_timer->it_clock, 0);
+	hrtimer_setup(&new_timer->it.real.timer, posix_timer_fn, new_timer->it_cl=
ock, 0);
 	return 0;
 }
=20
@@ -747,7 +747,7 @@ static void common_hrtimer_arm(struct k_itimer *timr, k=
time_t expires,
 	/*
 	 * Posix magic: Relative CLOCK_REALTIME timers are not affected by
 	 * clock modifications, so they become CLOCK_MONOTONIC based under the
-	 * hood. See hrtimer_init(). Update timr->kclock, so the generic
+	 * hood. See hrtimer_setup(). Update timr->kclock, so the generic
 	 * functions which use timr->kclock->clock_get_*() work.
 	 *
 	 * Note: it_clock stays unmodified, because the next timer_set() might
@@ -756,8 +756,7 @@ static void common_hrtimer_arm(struct k_itimer *timr, k=
time_t expires,
 	if (timr->it_clock =3D=3D CLOCK_REALTIME)
 		timr->kclock =3D absolute ? &clock_realtime : &clock_monotonic;
=20
-	hrtimer_init(&timr->it.real.timer, timr->it_clock, mode);
-	timr->it.real.timer.function =3D posix_timer_fn;
+	hrtimer_setup(&timr->it.real.timer, posix_timer_fn, timr->it_clock, mode);
=20
 	if (!absolute)
 		expires =3D ktime_add_safe(expires, timer->base->get_time());
diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index fcca4e72f1ef..cc15fe293719 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -263,8 +263,7 @@ void __init generic_sched_clock_init(void)
 	 * Start the timer to keep sched_clock() properly updated and
 	 * sets the initial epoch.
 	 */
-	hrtimer_init(&sched_clock_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
-	sched_clock_timer.function =3D sched_clock_poll;
+	hrtimer_setup(&sched_clock_timer, sched_clock_poll, CLOCK_MONOTONIC, HRTI=
MER_MODE_REL_HARD);
 	hrtimer_start(&sched_clock_timer, cd.wrap_kt, HRTIMER_MODE_REL_HARD);
 }
=20
diff --git a/kernel/time/tick-broadcast-hrtimer.c b/kernel/time/tick-broadc=
ast-hrtimer.c
index e28f9210f8a1..a88b72b0f35e 100644
--- a/kernel/time/tick-broadcast-hrtimer.c
+++ b/kernel/time/tick-broadcast-hrtimer.c
@@ -100,7 +100,6 @@ static enum hrtimer_restart bc_handler(struct hrtimer *=
t)
=20
 void tick_setup_hrtimer_broadcast(void)
 {
-	hrtimer_init(&bctimer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
-	bctimer.function =3D bc_handler;
+	hrtimer_setup(&bctimer, bc_handler, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HAR=
D);
 	clockevents_register_device(&ce_broadcast_hrtimer);
 }
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index fa058510af9c..c527b421c865 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1573,12 +1573,10 @@ void tick_setup_sched_timer(bool hrtimer)
 	struct tick_sched *ts =3D this_cpu_ptr(&tick_cpu_sched);
=20
 	/* Emulate tick processing via per-CPU hrtimers: */
-	hrtimer_init(&ts->sched_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
+	hrtimer_setup(&ts->sched_timer, tick_nohz_handler, CLOCK_MONOTONIC, HRTIM=
ER_MODE_ABS_HARD);
=20
-	if (IS_ENABLED(CONFIG_HIGH_RES_TIMERS) && hrtimer) {
+	if (IS_ENABLED(CONFIG_HIGH_RES_TIMERS) && hrtimer)
 		tick_sched_flag_set(ts, TS_FLAG_HIGHRES);
-		ts->sched_timer.function =3D tick_nohz_handler;
-	}
=20
 	/* Get the next period (per-CPU) */
 	hrtimer_set_expires(&ts->sched_timer, tick_init_jiffy_update());
--=20
2.39.5

