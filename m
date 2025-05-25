Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164AF1B4153
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 20:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748206434; cv=none; b=bqZQKS/e+bJPbxumqT21MqAZ8mu9rtEwWD8crmOcq5PkxFgjhI611De4vkdeFkZc6amE0vhw+iI5CDLO1YuucqnKhFVZes9MAzVLnjXQ4JB6bOsTALBS6XTb4gUk4FogA5Rq+LiJwl6Xcnk2gfb6W7ZlOxTSi+RalKJmYm3PNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748206434; c=relaxed/simple;
	bh=i8Dfmy4627QHBApSUO+0SUqo4oGtWxiKTv4fdj5zLOk=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=HX6e1sh+0sxHLDg0kng9vPgatpJV2QTmPdTk+M6kepP4eQ9OuHoostLSE14BkSjf25nt+KPcbtjQETWyyko1dL6ZZi2sgCPXJWYFhS/aEj+qifcbVRbTzWoEncSmcsKkUCQismCyP6Gq96jWM1PYzHsOnGWxCtiCfQIkRvWsJf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uyC3CoYY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YROkEQma; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uyC3CoYY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YROkEQma"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748206430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=Qj/Pm/XCKoacTtkCSF83xUfGL5PFHheKu6bbvBw0E2A=;
	b=uyC3CoYYG9lWcjPfdpwueXU75xIfldetVdicbQme5v0QiTsRhkzr5KMVfTOIDr4Bs0OFDI
	gJrtY+D3eOD1i1mlH+XVfTzDsIt8ZeQQDJ7AubBuRUdi/WGzPfkj/W7K/aJFg+921hBtVT
	SCDO+hrWpyF2a6Y9Ma6MoZnEFaRp6BNYnv82G2dqfmP0J9XgsBO8eoE6M/VdKrIqCc+FUB
	UDYA3K2r8gbbRNlPSTHOuZHUiUmN28OGdI9AMxm+Du8iIP9XlDoPHEtISPoswswZf7EYy/
	k82LAa1W7B4RuOnaccWa6h1lZkWiFIN73SoVaFIG/7Kmg+Vvlf7hk5uohlMdlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748206430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=Qj/Pm/XCKoacTtkCSF83xUfGL5PFHheKu6bbvBw0E2A=;
	b=YROkEQmaeGg7cb7GfakQWMhstoJRFK6HPXWWuN//lQzxIY9NMITrV2c4ZSQkpzJSH8YYjn
	qxe5sGzUPuz2B6BA==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/core for v6.16-rc1
References: <174820637262.238682.1985899398053030312.tglx@xen13>
Message-ID: <174820638487.238682.10229943723869983974.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 May 2025 22:53:49 +0200 (CEST)

Linus,

please pull the latest timers/core branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-core-2025=
-05-25

up to:  6c58d2791d60: tick/nohz: Remove unused tick_nohz_full_add_cpus_to()


Updates for the time/timer core code:

  - Rework the initialization of the posix-timer kmem_cache and move the
    cache pointer into the timer_data structure to prevent false sharing.

  - Switch the alarmtimer code to lock guards.

  - Improve the CPU selection criteria in the per CPU validation of the
    clocksource watchdog to avoid arbitrary selections (or omissions) on
    systems with a small number of CPUs.

  - The usual cleanups and improvements

Thanks,

	tglx

------------------>
Alex Shi (1):
      tick/nohz: Remove unused tick_nohz_full_add_cpus_to()

Dr. David Alan Gilbert (1):
      timers: Remove unused __round_jiffies(_up)

Eric Dumazet (1):
      posix-timers: Initialize cache early and move pointer into __timer_data

Guilherme G. Piccoli (1):
      clocksource: Fix the CPUs' choice in the watchdog per CPU verification

Su Hui (3):
      time/jiffies: Change register_refined_jiffies() to void __init
      alarmtimer: Remove dead return value in clock2alarm()
      alarmtimer: Switch spin_{lock,unlock}_irqsave() to guards


 include/linux/jiffies.h    |  2 +-
 include/linux/tick.h       |  7 ----
 include/linux/timer.h      |  2 --
 kernel/time/alarmtimer.c   | 84 ++++++++++++++++++--------------------------=
--
 kernel/time/clocksource.c  |  2 +-
 kernel/time/jiffies.c      |  5 +--
 kernel/time/posix-timers.c | 23 ++++++-------
 kernel/time/timer.c        | 42 -----------------------
 8 files changed, 46 insertions(+), 121 deletions(-)

diff --git a/include/linux/jiffies.h b/include/linux/jiffies.h
index 0ea8c9887429..91b20788273d 100644
--- a/include/linux/jiffies.h
+++ b/include/linux/jiffies.h
@@ -59,7 +59,7 @@
 /* LATCH is used in the interval timer and ftape setup. */
 #define LATCH ((CLOCK_TICK_RATE + HZ/2) / HZ)	/* For divider */
=20
-extern int register_refined_jiffies(long clock_tick_rate);
+extern void register_refined_jiffies(long clock_tick_rate);
=20
 /* TICK_USEC is the time between ticks in usec assuming SHIFTED_HZ */
 #define TICK_USEC ((USEC_PER_SEC + HZ/2) / HZ)
diff --git a/include/linux/tick.h b/include/linux/tick.h
index b8ddc8e631a3..ac76ae9fa36d 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -195,12 +195,6 @@ static inline bool tick_nohz_full_enabled(void)
 	__ret;								\
 })
=20
-static inline void tick_nohz_full_add_cpus_to(struct cpumask *mask)
-{
-	if (tick_nohz_full_enabled())
-		cpumask_or(mask, mask, tick_nohz_full_mask);
-}
-
 extern void tick_nohz_dep_set(enum tick_dep_bits bit);
 extern void tick_nohz_dep_clear(enum tick_dep_bits bit);
 extern void tick_nohz_dep_set_cpu(int cpu, enum tick_dep_bits bit);
@@ -281,7 +275,6 @@ extern void __init tick_nohz_full_setup(cpumask_var_t cpu=
mask);
 #else
 static inline bool tick_nohz_full_enabled(void) { return false; }
 static inline bool tick_nohz_full_cpu(int cpu) { return false; }
-static inline void tick_nohz_full_add_cpus_to(struct cpumask *mask) { }
=20
 static inline void tick_nohz_dep_set_cpu(int cpu, enum tick_dep_bits bit) { }
 static inline void tick_nohz_dep_clear_cpu(int cpu, enum tick_dep_bits bit) =
{ }
diff --git a/include/linux/timer.h b/include/linux/timer.h
index 10596d7c3a34..e17aac74b5b3 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -172,12 +172,10 @@ extern void init_timers(void);
 struct hrtimer;
 extern enum hrtimer_restart it_real_fn(struct hrtimer *);
=20
-unsigned long __round_jiffies(unsigned long j, int cpu);
 unsigned long __round_jiffies_relative(unsigned long j, int cpu);
 unsigned long round_jiffies(unsigned long j);
 unsigned long round_jiffies_relative(unsigned long j);
=20
-unsigned long __round_jiffies_up(unsigned long j, int cpu);
 unsigned long __round_jiffies_up_relative(unsigned long j, int cpu);
 unsigned long round_jiffies_up(unsigned long j);
 unsigned long round_jiffies_up_relative(unsigned long j);
diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index 0ddccdff119a..577f0e6842d4 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -70,12 +70,10 @@ static DEFINE_SPINLOCK(rtcdev_lock);
  */
 struct rtc_device *alarmtimer_get_rtcdev(void)
 {
-	unsigned long flags;
 	struct rtc_device *ret;
=20
-	spin_lock_irqsave(&rtcdev_lock, flags);
+	guard(spinlock_irqsave)(&rtcdev_lock);
 	ret =3D rtcdev;
-	spin_unlock_irqrestore(&rtcdev_lock, flags);
=20
 	return ret;
 }
@@ -83,7 +81,6 @@ EXPORT_SYMBOL_GPL(alarmtimer_get_rtcdev);
=20
 static int alarmtimer_rtc_add_device(struct device *dev)
 {
-	unsigned long flags;
 	struct rtc_device *rtc =3D to_rtc_device(dev);
 	struct platform_device *pdev;
 	int ret =3D 0;
@@ -101,25 +98,18 @@ static int alarmtimer_rtc_add_device(struct device *dev)
 	if (!IS_ERR(pdev))
 		device_init_wakeup(&pdev->dev, true);
=20
-	spin_lock_irqsave(&rtcdev_lock, flags);
-	if (!IS_ERR(pdev) && !rtcdev) {
-		if (!try_module_get(rtc->owner)) {
+	scoped_guard(spinlock_irqsave, &rtcdev_lock) {
+		if (!IS_ERR(pdev) && !rtcdev && try_module_get(rtc->owner)) {
+			rtcdev =3D rtc;
+			/* hold a reference so it doesn't go away */
+			get_device(dev);
+			pdev =3D NULL;
+		} else {
 			ret =3D -1;
-			goto unlock;
 		}
-
-		rtcdev =3D rtc;
-		/* hold a reference so it doesn't go away */
-		get_device(dev);
-		pdev =3D NULL;
-	} else {
-		ret =3D -1;
 	}
-unlock:
-	spin_unlock_irqrestore(&rtcdev_lock, flags);
=20
 	platform_device_unregister(pdev);
-
 	return ret;
 }
=20
@@ -198,7 +188,7 @@ static enum hrtimer_restart alarmtimer_fired(struct hrtim=
er *timer)
 	struct alarm *alarm =3D container_of(timer, struct alarm, timer);
 	struct alarm_base *base =3D &alarm_bases[alarm->type];
=20
-	scoped_guard (spinlock_irqsave, &base->lock)
+	scoped_guard(spinlock_irqsave, &base->lock)
 		alarmtimer_dequeue(base, alarm);
=20
 	if (alarm->function)
@@ -228,17 +218,16 @@ EXPORT_SYMBOL_GPL(alarm_expires_remaining);
 static int alarmtimer_suspend(struct device *dev)
 {
 	ktime_t min, now, expires;
-	int i, ret, type;
 	struct rtc_device *rtc;
-	unsigned long flags;
 	struct rtc_time tm;
+	int i, ret, type;
=20
-	spin_lock_irqsave(&freezer_delta_lock, flags);
-	min =3D freezer_delta;
-	expires =3D freezer_expires;
-	type =3D freezer_alarmtype;
-	freezer_delta =3D 0;
-	spin_unlock_irqrestore(&freezer_delta_lock, flags);
+	scoped_guard(spinlock_irqsave, &freezer_delta_lock) {
+		min =3D freezer_delta;
+		expires =3D freezer_expires;
+		type =3D freezer_alarmtype;
+		freezer_delta =3D 0;
+	}
=20
 	rtc =3D alarmtimer_get_rtcdev();
 	/* If we have no rtcdev, just return */
@@ -251,9 +240,8 @@ static int alarmtimer_suspend(struct device *dev)
 		struct timerqueue_node *next;
 		ktime_t delta;
=20
-		spin_lock_irqsave(&base->lock, flags);
-		next =3D timerqueue_getnext(&base->timerqueue);
-		spin_unlock_irqrestore(&base->lock, flags);
+		scoped_guard(spinlock_irqsave, &base->lock)
+			next =3D timerqueue_getnext(&base->timerqueue);
 		if (!next)
 			continue;
 		delta =3D ktime_sub(next->expires, base->get_ktime());
@@ -352,13 +340,12 @@ EXPORT_SYMBOL_GPL(alarm_init);
 void alarm_start(struct alarm *alarm, ktime_t start)
 {
 	struct alarm_base *base =3D &alarm_bases[alarm->type];
-	unsigned long flags;
=20
-	spin_lock_irqsave(&base->lock, flags);
-	alarm->node.expires =3D start;
-	alarmtimer_enqueue(base, alarm);
-	hrtimer_start(&alarm->timer, alarm->node.expires, HRTIMER_MODE_ABS);
-	spin_unlock_irqrestore(&base->lock, flags);
+	scoped_guard(spinlock_irqsave, &base->lock) {
+		alarm->node.expires =3D start;
+		alarmtimer_enqueue(base, alarm);
+		hrtimer_start(&alarm->timer, alarm->node.expires, HRTIMER_MODE_ABS);
+	}
=20
 	trace_alarmtimer_start(alarm, base->get_ktime());
 }
@@ -381,13 +368,11 @@ EXPORT_SYMBOL_GPL(alarm_start_relative);
 void alarm_restart(struct alarm *alarm)
 {
 	struct alarm_base *base =3D &alarm_bases[alarm->type];
-	unsigned long flags;
=20
-	spin_lock_irqsave(&base->lock, flags);
+	guard(spinlock_irqsave)(&base->lock);
 	hrtimer_set_expires(&alarm->timer, alarm->node.expires);
 	hrtimer_restart(&alarm->timer);
 	alarmtimer_enqueue(base, alarm);
-	spin_unlock_irqrestore(&base->lock, flags);
 }
 EXPORT_SYMBOL_GPL(alarm_restart);
=20
@@ -401,14 +386,13 @@ EXPORT_SYMBOL_GPL(alarm_restart);
 int alarm_try_to_cancel(struct alarm *alarm)
 {
 	struct alarm_base *base =3D &alarm_bases[alarm->type];
-	unsigned long flags;
 	int ret;
=20
-	spin_lock_irqsave(&base->lock, flags);
-	ret =3D hrtimer_try_to_cancel(&alarm->timer);
-	if (ret >=3D 0)
-		alarmtimer_dequeue(base, alarm);
-	spin_unlock_irqrestore(&base->lock, flags);
+	scoped_guard(spinlock_irqsave, &base->lock) {
+		ret =3D hrtimer_try_to_cancel(&alarm->timer);
+		if (ret >=3D 0)
+			alarmtimer_dequeue(base, alarm);
+	}
=20
 	trace_alarmtimer_cancel(alarm, base->get_ktime());
 	return ret;
@@ -479,7 +463,6 @@ EXPORT_SYMBOL_GPL(alarm_forward_now);
 static void alarmtimer_freezerset(ktime_t absexp, enum alarmtimer_type type)
 {
 	struct alarm_base *base;
-	unsigned long flags;
 	ktime_t delta;
=20
 	switch(type) {
@@ -498,13 +481,12 @@ static void alarmtimer_freezerset(ktime_t absexp, enum =
alarmtimer_type type)
=20
 	delta =3D ktime_sub(absexp, base->get_ktime());
=20
-	spin_lock_irqsave(&freezer_delta_lock, flags);
+	guard(spinlock_irqsave)(&freezer_delta_lock);
 	if (!freezer_delta || (delta < freezer_delta)) {
 		freezer_delta =3D delta;
 		freezer_expires =3D absexp;
 		freezer_alarmtype =3D type;
 	}
-	spin_unlock_irqrestore(&freezer_delta_lock, flags);
 }
=20
 /**
@@ -515,9 +497,9 @@ static enum alarmtimer_type clock2alarm(clockid_t clockid)
 {
 	if (clockid =3D=3D CLOCK_REALTIME_ALARM)
 		return ALARM_REALTIME;
-	if (clockid =3D=3D CLOCK_BOOTTIME_ALARM)
-		return ALARM_BOOTTIME;
-	return -1;
+
+	WARN_ON_ONCE(clockid !=3D CLOCK_BOOTTIME_ALARM);
+	return ALARM_BOOTTIME;
 }
=20
 /**
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index bb48498ebb5a..6a8bc7da9062 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -310,7 +310,7 @@ static void clocksource_verify_choose_cpus(void)
 {
 	int cpu, i, n =3D verify_n_cpus;
=20
-	if (n < 0) {
+	if (n < 0 || n >=3D num_online_cpus()) {
 		/* Check all of the CPUs. */
 		cpumask_copy(&cpus_chosen, cpu_online_mask);
 		cpumask_clear_cpu(smp_processor_id(), &cpus_chosen);
diff --git a/kernel/time/jiffies.c b/kernel/time/jiffies.c
index bc4db9e5ab70..34eeacac2253 100644
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -75,13 +75,11 @@ struct clocksource * __init __weak clocksource_default_cl=
ock(void)
=20
 static struct clocksource refined_jiffies;
=20
-int register_refined_jiffies(long cycles_per_second)
+void __init register_refined_jiffies(long cycles_per_second)
 {
 	u64 nsec_per_tick, shift_hz;
 	long cycles_per_tick;
=20
-
-
 	refined_jiffies =3D clocksource_jiffies;
 	refined_jiffies.name =3D "refined-jiffies";
 	refined_jiffies.rating++;
@@ -100,5 +98,4 @@ int register_refined_jiffies(long cycles_per_second)
 	refined_jiffies.mult =3D ((u32)nsec_per_tick) << JIFFIES_SHIFT;
=20
 	__clocksource_register(&refined_jiffies);
-	return 0;
 }
diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 6222112533a7..2053b1a4c9e4 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -30,8 +30,6 @@
 #include "timekeeping.h"
 #include "posix-timers.h"
=20
-static struct kmem_cache *posix_timers_cache;
-
 /*
  * Timers are managed in a hash table for lockless lookup. The hash key is
  * constructed from current::signal and the timer ID and the timer is
@@ -49,10 +47,12 @@ struct timer_hash_bucket {
 static struct {
 	struct timer_hash_bucket	*buckets;
 	unsigned long			mask;
-} __timer_data __ro_after_init __aligned(2*sizeof(long));
+	struct kmem_cache		*cache;
+} __timer_data __ro_after_init __aligned(4*sizeof(long));
=20
-#define timer_buckets	(__timer_data.buckets)
-#define timer_hashmask	(__timer_data.mask)
+#define timer_buckets		(__timer_data.buckets)
+#define timer_hashmask		(__timer_data.mask)
+#define posix_timers_cache	(__timer_data.cache)
=20
 static const struct k_clock * const posix_clocks[];
 static const struct k_clock *clockid_to_kclock(const clockid_t id);
@@ -283,14 +283,6 @@ static int posix_get_hrtimer_res(clockid_t which_clock, =
struct timespec64 *tp)
 	return 0;
 }
=20
-static __init int init_posix_timers(void)
-{
-	posix_timers_cache =3D kmem_cache_create("posix_timers_cache", sizeof(struc=
t k_itimer),
-					       __alignof__(struct k_itimer), SLAB_ACCOUNT, NULL);
-	return 0;
-}
-__initcall(init_posix_timers);
-
 /*
  * The siginfo si_overrun field and the return value of timer_getoverrun(2)
  * are of type int. Clamp the overrun value to INT_MAX
@@ -1556,6 +1548,11 @@ static int __init posixtimer_init(void)
 	unsigned long i, size;
 	unsigned int shift;
=20
+	posix_timers_cache =3D kmem_cache_create("posix_timers_cache",
+					       sizeof(struct k_itimer),
+					       __alignof__(struct k_itimer),
+					       SLAB_ACCOUNT, NULL);
+
 	if (IS_ENABLED(CONFIG_BASE_SMALL))
 		size =3D 512;
 	else
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 4d915c0a263c..1b2a884f66e8 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -385,32 +385,6 @@ static unsigned long round_jiffies_common(unsigned long =
j, int cpu,
 	return time_is_after_jiffies(j) ? j : original;
 }
=20
-/**
- * __round_jiffies - function to round jiffies to a full second
- * @j: the time in (absolute) jiffies that should be rounded
- * @cpu: the processor number on which the timeout will happen
- *
- * __round_jiffies() rounds an absolute time in the future (in jiffies)
- * up or down to (approximately) full seconds. This is useful for timers
- * for which the exact time they fire does not matter too much, as long as
- * they fire approximately every X seconds.
- *
- * By rounding these timers to whole seconds, all such timers will fire
- * at the same time, rather than at various times spread out. The goal
- * of this is to have the CPU wake up less, which saves power.
- *
- * The exact rounding is skewed for each processor to avoid all
- * processors firing at the exact same time, which could lead
- * to lock contention or spurious cache line bouncing.
- *
- * The return value is the rounded version of the @j parameter.
- */
-unsigned long __round_jiffies(unsigned long j, int cpu)
-{
-	return round_jiffies_common(j, cpu, false);
-}
-EXPORT_SYMBOL_GPL(__round_jiffies);
-
 /**
  * __round_jiffies_relative - function to round jiffies to a full second
  * @j: the time in (relative) jiffies that should be rounded
@@ -482,22 +456,6 @@ unsigned long round_jiffies_relative(unsigned long j)
 }
 EXPORT_SYMBOL_GPL(round_jiffies_relative);
=20
-/**
- * __round_jiffies_up - function to round jiffies up to a full second
- * @j: the time in (absolute) jiffies that should be rounded
- * @cpu: the processor number on which the timeout will happen
- *
- * This is the same as __round_jiffies() except that it will never
- * round down.  This is useful for timeouts for which the exact time
- * of firing does not matter too much, as long as they don't fire too
- * early.
- */
-unsigned long __round_jiffies_up(unsigned long j, int cpu)
-{
-	return round_jiffies_common(j, cpu, true);
-}
-EXPORT_SYMBOL_GPL(__round_jiffies_up);
-
 /**
  * __round_jiffies_up_relative - function to round jiffies up to a full seco=
nd
  * @j: the time in (relative) jiffies that should be rounded

