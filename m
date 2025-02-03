Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CCA1E489
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588771; cv=none; b=QxIXmMUq03ZXYmeGexGJGLskYcWnFL3b8hTcc7EI8Ps4BS/uSjSVRPHyA3KUbyggOXWhw/VRertCq93fk3gAf9zSkZre9l3Soc2gIdGyYjRlMukD/5uqw0wkatXHQBSuQaXiSLWe0B/uwLP4obpyCh8gwE+wpOBVVOWmffFwf/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588771; c=relaxed/simple;
	bh=Ub3PZSTmg4GSS/zvbN3d11N7wEvnhlTdXGXtntx6yyc=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=qfP5SfJSjRRytuD/8EjtVWQ8k00dq8SJ5qn6WIyoaf8ABLAiVNZXKs7cjCxInsuxgfY2UpxRtnbF1B5F3CketCkvXo1RK7wGY6Qa1jTHDCIsTVNlK8fepDCLgsXTMsG4MQF6KceVjeDOOmJH4alLtB6R5aZcNAjF9f32gd3jK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=faO96h69; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IoEAISHL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="faO96h69";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IoEAISHL"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738588768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=UNAQICOx2Ied0ob5z47+m042umM+SzArDE5MShCiQ5I=;
	b=faO96h69QvI5os9Us4l2pAVT3Ilqx5ba/eBPu+Zwr3efM+X3iGWLcLOXcvd4KpCF7GdiAx
	FZfPHPu+go54vUJ66I+tMNOU2pkKjMBivPuPKWKo8KxMjGls3w01rLhPWYLvTF/5CoD4Li
	KidBv+tbqWa8BeszW9+1yvmQ6SGzpyG/YmL5kDblkBLVDTCaJVz+u8CYtnD8BD+GKq77H8
	FZzVxesc4wJGCnHVgqCxGvNN/6gcmBC2TVu2UOpWpMlWjb9bGFibdfMZyhimf9aMiOEoXW
	MmLRmfFtPqf9lrYk1oXBTdXi9k625Q2m0LiciaDVT4eYoVKPbKkcB716JxUf+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738588768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=UNAQICOx2Ied0ob5z47+m042umM+SzArDE5MShCiQ5I=;
	b=IoEAISHLSGbnM+dmvZrkJuo+sw5gZPODuL67GWSDzFTep5K4z3VCWKS3nxx8rwkaQ/cjyQ
	83qPpEZfNJnuQaDw==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/urgent for v6.14-rc2
References: 
 <173858836845.600052.7603327021374821758.tglx@xen13.tec.linutronix.de>
Message-ID: 
 <173858836968.600052.5042226943389744452.tglx@xen13.tec.linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon,  3 Feb 2025 14:19:27 +0100 (CET)

Linus,

please pull the latest timers/urgent branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-20=
25-02-03

up to:  bb2784d9ab49: jiffies: Cast to unsigned long in secs_to_jiffies() con=
version


Updates for timers and timekeeping:

 - Properly cast the input to secs_to_jiffies() to unsigned long as
   otherwise the result uses the data type of the input variable, which
   causes result range checks to fail if the input data type is signed and
   smaller than unsigned long.

 - Handle late armed hrtimers gracefully on CPU hotplug

   There are legitimate cases where a hrtimer is (re)armed on an outgoing
   CPU after the timers have been migrated away. This triggers warnings and
   caused people to implement horrible workarounds in RCU. But those work
   arounds are incomplete and do not cover e.g. the scheduler hrtimers.

   Stop this by force moving timer which are enqueued on the current CPU
   after timer migration to be queued on a remote online CPU.

   This allows to undo the workarounds in a seperate step.

 - Demote a warning level printk() to info level in the clocksource
   watchdog code as there is no point to emit a warning level message for a
   purely informational message.

 - Mark a helper function __always_inline and move it into the existing
   #ifdef block to avoid 'unused function' warnings from CLANG

Thanks,

	tglx

------------------>
Andy Shevchenko (1):
      hrtimers: Mark is_migration_base() with __always_inline

Easwar Hariharan (1):
      jiffies: Cast to unsigned long in secs_to_jiffies() conversion

Frederic Weisbecker (1):
      hrtimers: Force migrate away hrtimers queued after CPUHP_AP_HRTIMERS_DY=
ING

Waiman Long (1):
      clocksource: Use pr_info() for "Checking clocksource synchronization" m=
essage


 include/linux/hrtimer_defs.h |   1 +
 include/linux/jiffies.h      |   2 +-
 kernel/time/clocksource.c    |   3 +-
 kernel/time/hrtimer.c        | 125 ++++++++++++++++++++++++++++++++---------=
--
 4 files changed, 98 insertions(+), 33 deletions(-)

diff --git a/include/linux/hrtimer_defs.h b/include/linux/hrtimer_defs.h
index c3b4b7ed7c16..84a5045f80f3 100644
--- a/include/linux/hrtimer_defs.h
+++ b/include/linux/hrtimer_defs.h
@@ -125,6 +125,7 @@ struct hrtimer_cpu_base {
 	ktime_t				softirq_expires_next;
 	struct hrtimer			*softirq_next_timer;
 	struct hrtimer_clock_base	clock_base[HRTIMER_MAX_CLOCK_BASES];
+	call_single_data_t		csd;
 } ____cacheline_aligned;
=20
=20
diff --git a/include/linux/jiffies.h b/include/linux/jiffies.h
index ed945f42e064..0ea8c9887429 100644
--- a/include/linux/jiffies.h
+++ b/include/linux/jiffies.h
@@ -537,7 +537,7 @@ static __always_inline unsigned long msecs_to_jiffies(con=
st unsigned int m)
  *
  * Return: jiffies value
  */
-#define secs_to_jiffies(_secs) ((_secs) * HZ)
+#define secs_to_jiffies(_secs) (unsigned long)((_secs) * HZ)
=20
 extern unsigned long __usecs_to_jiffies(const unsigned int u);
 #if !(USEC_PER_SEC % HZ)
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 7304d7cf47f2..77d9566d3aa6 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -382,7 +382,8 @@ void clocksource_verify_percpu(struct clocksource *cs)
 		return;
 	}
 	testcpu =3D smp_processor_id();
-	pr_warn("Checking clocksource %s synchronization from CPU %d to CPUs %*pbl.=
\n", cs->name, testcpu, cpumask_pr_args(&cpus_chosen));
+	pr_info("Checking clocksource %s synchronization from CPU %d to CPUs %*pbl.=
\n",
+		cs->name, testcpu, cpumask_pr_args(&cpus_chosen));
 	for_each_cpu(cpu, &cpus_chosen) {
 		if (cpu =3D=3D testcpu)
 			continue;
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index f6d8df94045c..deb1aa32814e 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -58,6 +58,8 @@
 #define HRTIMER_ACTIVE_SOFT	(HRTIMER_ACTIVE_HARD << MASK_SHIFT)
 #define HRTIMER_ACTIVE_ALL	(HRTIMER_ACTIVE_SOFT | HRTIMER_ACTIVE_HARD)
=20
+static void retrigger_next_event(void *arg);
+
 /*
  * The timer bases:
  *
@@ -111,7 +113,8 @@ DEFINE_PER_CPU(struct hrtimer_cpu_base, hrtimer_bases) =3D
 			.clockid =3D CLOCK_TAI,
 			.get_time =3D &ktime_get_clocktai,
 		},
-	}
+	},
+	.csd =3D CSD_INIT(retrigger_next_event, NULL)
 };
=20
 static const int hrtimer_clock_to_base_table[MAX_CLOCKS] =3D {
@@ -124,6 +127,14 @@ static const int hrtimer_clock_to_base_table[MAX_CLOCKS]=
 =3D {
 	[CLOCK_TAI]		=3D HRTIMER_BASE_TAI,
 };
=20
+static inline bool hrtimer_base_is_online(struct hrtimer_cpu_base *base)
+{
+	if (!IS_ENABLED(CONFIG_HOTPLUG_CPU))
+		return true;
+	else
+		return likely(base->online);
+}
+
 /*
  * Functions and macros which are different for UP/SMP systems are kept in a
  * single place
@@ -145,11 +156,6 @@ static struct hrtimer_cpu_base migration_cpu_base =3D {
=20
 #define migration_base	migration_cpu_base.clock_base[0]
=20
-static inline bool is_migration_base(struct hrtimer_clock_base *base)
-{
-	return base =3D=3D &migration_base;
-}
-
 /*
  * We are using hashed locking: holding per_cpu(hrtimer_bases)[n].lock
  * means that all timers which are tied to this base via timer->base are
@@ -183,27 +189,54 @@ struct hrtimer_clock_base *lock_hrtimer_base(const stru=
ct hrtimer *timer,
 }
=20
 /*
- * We do not migrate the timer when it is expiring before the next
- * event on the target cpu. When high resolution is enabled, we cannot
- * reprogram the target cpu hardware and we would cause it to fire
- * late. To keep it simple, we handle the high resolution enabled and
- * disabled case similar.
+ * Check if the elected target is suitable considering its next
+ * event and the hotplug state of the current CPU.
+ *
+ * If the elected target is remote and its next event is after the timer
+ * to queue, then a remote reprogram is necessary. However there is no
+ * guarantee the IPI handling the operation would arrive in time to meet
+ * the high resolution deadline. In this case the local CPU becomes a
+ * preferred target, unless it is offline.
+ *
+ * High and low resolution modes are handled the same way for simplicity.
  *
  * Called with cpu_base->lock of target cpu held.
  */
-static int
-hrtimer_check_target(struct hrtimer *timer, struct hrtimer_clock_base *new_b=
ase)
+static bool hrtimer_suitable_target(struct hrtimer *timer, struct hrtimer_cl=
ock_base *new_base,
+				    struct hrtimer_cpu_base *new_cpu_base,
+				    struct hrtimer_cpu_base *this_cpu_base)
 {
 	ktime_t expires;
=20
+	/*
+	 * The local CPU clockevent can be reprogrammed. Also get_target_base()
+	 * guarantees it is online.
+	 */
+	if (new_cpu_base =3D=3D this_cpu_base)
+		return true;
+
+	/*
+	 * The offline local CPU can't be the default target if the
+	 * next remote target event is after this timer. Keep the
+	 * elected new base. An IPI will we issued to reprogram
+	 * it as a last resort.
+	 */
+	if (!hrtimer_base_is_online(this_cpu_base))
+		return true;
+
 	expires =3D ktime_sub(hrtimer_get_expires(timer), new_base->offset);
-	return expires < new_base->cpu_base->expires_next;
+
+	return expires >=3D new_base->cpu_base->expires_next;
 }
=20
-static inline
-struct hrtimer_cpu_base *get_target_base(struct hrtimer_cpu_base *base,
-					 int pinned)
+static inline struct hrtimer_cpu_base *get_target_base(struct hrtimer_cpu_ba=
se *base, int pinned)
 {
+	if (!hrtimer_base_is_online(base)) {
+		int cpu =3D cpumask_any_and(cpu_online_mask, housekeeping_cpumask(HK_TYPE_=
TIMER));
+
+		return &per_cpu(hrtimer_bases, cpu);
+	}
+
 #if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
 	if (static_branch_likely(&timers_migration_enabled) && !pinned)
 		return &per_cpu(hrtimer_bases, get_nohz_timer_target());
@@ -254,8 +287,8 @@ switch_hrtimer_base(struct hrtimer *timer, struct hrtimer=
_clock_base *base,
 		raw_spin_unlock(&base->cpu_base->lock);
 		raw_spin_lock(&new_base->cpu_base->lock);
=20
-		if (new_cpu_base !=3D this_cpu_base &&
-		    hrtimer_check_target(timer, new_base)) {
+		if (!hrtimer_suitable_target(timer, new_base, new_cpu_base,
+					     this_cpu_base)) {
 			raw_spin_unlock(&new_base->cpu_base->lock);
 			raw_spin_lock(&base->cpu_base->lock);
 			new_cpu_base =3D this_cpu_base;
@@ -264,8 +297,7 @@ switch_hrtimer_base(struct hrtimer *timer, struct hrtimer=
_clock_base *base,
 		}
 		WRITE_ONCE(timer->base, new_base);
 	} else {
-		if (new_cpu_base !=3D this_cpu_base &&
-		    hrtimer_check_target(timer, new_base)) {
+		if (!hrtimer_suitable_target(timer, new_base,  new_cpu_base, this_cpu_base=
)) {
 			new_cpu_base =3D this_cpu_base;
 			goto again;
 		}
@@ -275,11 +307,6 @@ switch_hrtimer_base(struct hrtimer *timer, struct hrtime=
r_clock_base *base,
=20
 #else /* CONFIG_SMP */
=20
-static inline bool is_migration_base(struct hrtimer_clock_base *base)
-{
-	return false;
-}
-
 static inline struct hrtimer_clock_base *
 lock_hrtimer_base(const struct hrtimer *timer, unsigned long *flags)
 	__acquires(&timer->base->cpu_base->lock)
@@ -716,8 +743,6 @@ static inline int hrtimer_is_hres_enabled(void)
 	return hrtimer_hres_enabled;
 }
=20
-static void retrigger_next_event(void *arg);
-
 /*
  * Switch to high resolution mode
  */
@@ -1205,6 +1230,7 @@ static int __hrtimer_start_range_ns(struct hrtimer *tim=
er, ktime_t tim,
 				    u64 delta_ns, const enum hrtimer_mode mode,
 				    struct hrtimer_clock_base *base)
 {
+	struct hrtimer_cpu_base *this_cpu_base =3D this_cpu_ptr(&hrtimer_bases);
 	struct hrtimer_clock_base *new_base;
 	bool force_local, first;
=20
@@ -1216,9 +1242,15 @@ static int __hrtimer_start_range_ns(struct hrtimer *ti=
mer, ktime_t tim,
 	 * and enforce reprogramming after it is queued no matter whether
 	 * it is the new first expiring timer again or not.
 	 */
-	force_local =3D base->cpu_base =3D=3D this_cpu_ptr(&hrtimer_bases);
+	force_local =3D base->cpu_base =3D=3D this_cpu_base;
 	force_local &=3D base->cpu_base->next_timer =3D=3D timer;
=20
+	/*
+	 * Don't force local queuing if this enqueue happens on a unplugged
+	 * CPU after hrtimer_cpu_dying() has been invoked.
+	 */
+	force_local &=3D this_cpu_base->online;
+
 	/*
 	 * Remove an active timer from the queue. In case it is not queued
 	 * on the current CPU, make sure that remove_hrtimer() updates the
@@ -1248,8 +1280,27 @@ static int __hrtimer_start_range_ns(struct hrtimer *ti=
mer, ktime_t tim,
 	}
=20
 	first =3D enqueue_hrtimer(timer, new_base, mode);
-	if (!force_local)
-		return first;
+	if (!force_local) {
+		/*
+		 * If the current CPU base is online, then the timer is
+		 * never queued on a remote CPU if it would be the first
+		 * expiring timer there.
+		 */
+		if (hrtimer_base_is_online(this_cpu_base))
+			return first;
+
+		/*
+		 * Timer was enqueued remote because the current base is
+		 * already offline. If the timer is the first to expire,
+		 * kick the remote CPU to reprogram the clock event.
+		 */
+		if (first) {
+			struct hrtimer_cpu_base *new_cpu_base =3D new_base->cpu_base;
+
+			smp_call_function_single_async(new_cpu_base->cpu, &new_cpu_base->csd);
+		}
+		return 0;
+	}
=20
 	/*
 	 * Timer was forced to stay on the current CPU to avoid
@@ -1370,6 +1421,18 @@ static void hrtimer_sync_wait_running(struct hrtimer_c=
pu_base *cpu_base,
 	}
 }
=20
+#ifdef CONFIG_SMP
+static __always_inline bool is_migration_base(struct hrtimer_clock_base *bas=
e)
+{
+	return base =3D=3D &migration_base;
+}
+#else
+static __always_inline bool is_migration_base(struct hrtimer_clock_base *bas=
e)
+{
+	return false;
+}
+#endif
+
 /*
  * This function is called on PREEMPT_RT kernels when the fast path
  * deletion of a timer failed because the timer callback function was

