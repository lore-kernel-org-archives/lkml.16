Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8BD263F4C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626210; cv=none; b=c5pHpvewoP/jZ4fdQxWf/6vP2zULe5NfhNDQOBPD9heECv7A5P3FNb+CwewZxuDoN1r6bmpjDWxk/IbMXwWrEfYdm72rW1rrbzjl5M7qPuzJMv5G0KGsR8nk7ys3+MO44J1uwhg98fbco7LMjnDPWTGxThggLONy5Ogk4Hmy2Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626210; c=relaxed/simple;
	bh=NVWaZQtoq363diNwUFs///l3ROluML4U56BobcSGZp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XewzYGBsCrsWY10utjXKeyjxOcogVXVg7nB7As66qULVu6DSfQci9KHWI0zLNd8ToXZqDDJcv1CXDYv5kla2pa1WutdMgW0ggMngQXZWu7nAMLaalqGycxsPozl6gRs+RNaKlDuvqDjAUcNEBNOPHtgOPoJhRWKem/nG9zw9ahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCwXgDws; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCwXgDws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05C9C4CEE2;
	Mon, 14 Apr 2025 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626209;
	bh=NVWaZQtoq363diNwUFs///l3ROluML4U56BobcSGZp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cCwXgDwsSgMfGwaItRo5ymqf8vQ7p/rgJeQLkVZWOoIQG0hS+nJ/HFPuxqadEabMe
	 YpDrLHBeUfNC2lI9l4uwObJUEMBUvQlVpnDSuZ2bsVtNZxRbdlFrLRfNoYNyUOK994
	 uI25bfFd+0NxmkUfbRFXd4SqtO8mSS7HTJIxP7Ewj/zrK2FGQBbMapwRf0wEMBsYea
	 ty1CEaKwnPMC2wUxRUZz1IbIdv8+2p1ySs65bI4HAYKwVvFruYWlaLsf2IrcZ/Avgp
	 dAIE/NvsIr5KCm5uwDyXMQdGnNb14MA1alxYaWxQGz71mAM55snQFlK+bzil5G1rKx
	 LN2PnrEX3NmoA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 09/17] treewide, timers: Rename add_timer_on() => timer_add_on()
Date: Mon, 14 Apr 2025 12:22:43 +0200
Message-ID: <20250414102301.332225-10-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414102301.332225-1-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move this API to the canonical timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 Documentation/trace/ftrace.rst          | 4 ++--
 arch/powerpc/mm/book3s64/hash_utils.c   | 2 +-
 arch/x86/kernel/apic/vector.c           | 2 +-
 arch/x86/kernel/tsc_sync.c              | 2 +-
 drivers/char/random.c                   | 4 ++--
 drivers/cpufreq/powernv-cpufreq.c       | 2 +-
 drivers/irqchip/irq-riscv-imsic-state.c | 2 +-
 drivers/tty/mips_ejtag_fdc.c            | 4 ++--
 include/linux/timer.h                   | 4 ++--
 kernel/sched/core.c                     | 2 +-
 kernel/time/clocksource.c               | 4 ++--
 kernel/time/timer.c                     | 8 ++++----
 kernel/workqueue.c                      | 4 ++--
 13 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index c9e88bf65709..2dda0e857883 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -1215,8 +1215,8 @@ Here are the available options:
 	oldest events). When the annotate option is set, it will
 	display when a new CPU buffer started::
 
-			  <idle>-0     [001] dNs4 21169.031481: wake_up_idle_cpu <-add_timer_on
-			  <idle>-0     [001] dNs4 21169.031482: _raw_spin_unlock_irqrestore <-add_timer_on
+			  <idle>-0     [001] dNs4 21169.031481: wake_up_idle_cpu <-timer_add_on
+			  <idle>-0     [001] dNs4 21169.031482: _raw_spin_unlock_irqrestore <-timer_add_on
 			  <idle>-0     [001] .Ns4 21169.031484: sub_preempt_count <-_raw_spin_unlock_irqrestore
 		##### CPU 2 buffer started ####
 			  <idle>-0     [002] .N.1 21169.031484: rcu_idle_exit <-cpu_idle
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 87b080bbd57c..a444d9db1f6f 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1294,7 +1294,7 @@ static void stress_hpt_timer_fn(struct timer_list *timer)
 	if (next_cpu >= nr_cpu_ids)
 		next_cpu = cpumask_first(cpu_online_mask);
 	stress_hpt_timer.expires = jiffies + msecs_to_jiffies(10);
-	add_timer_on(&stress_hpt_timer, next_cpu);
+	timer_add_on(&stress_hpt_timer, next_cpu);
 }
 
 static void __init htab_initialize(void)
diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index 93069b13d3af..ad8b79b0d0d9 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -1110,7 +1110,7 @@ static void __vector_schedule_cleanup(struct apic_chip_data *apicd)
 		 */
 		if (!timer_pending(&cl->timer)) {
 			cl->timer.expires = jiffies + 1;
-			add_timer_on(&cl->timer, cpu);
+			timer_add_on(&cl->timer, cpu);
 		}
 	} else {
 		pr_warn("IRQ %u schedule cleanup for offline CPU %u\n", apicd->irq, cpu);
diff --git a/arch/x86/kernel/tsc_sync.c b/arch/x86/kernel/tsc_sync.c
index 982a407fb1fb..cec2120d52ae 100644
--- a/arch/x86/kernel/tsc_sync.c
+++ b/arch/x86/kernel/tsc_sync.c
@@ -103,7 +103,7 @@ static void tsc_sync_check_timer_fn(struct timer_list *unused)
 		next_cpu = cpumask_first(cpu_online_mask);
 
 	tsc_sync_check_timer.expires += SYNC_CHECK_INTERVAL;
-	add_timer_on(&tsc_sync_check_timer, next_cpu);
+	timer_add_on(&tsc_sync_check_timer, next_cpu);
 }
 
 static int __init start_sync_check_timer(void)
diff --git a/drivers/char/random.c b/drivers/char/random.c
index 4ea4dccc7c46..225810db7d6f 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1130,7 +1130,7 @@ void add_interrupt_randomness(int irq)
 	fast_pool->count |= MIX_INFLIGHT;
 	if (!timer_pending(&fast_pool->mix)) {
 		fast_pool->mix.expires = jiffies;
-		add_timer_on(&fast_pool->mix, raw_smp_processor_id());
+		timer_add_on(&fast_pool->mix, raw_smp_processor_id());
 	}
 }
 EXPORT_SYMBOL_GPL(add_interrupt_randomness);
@@ -1342,7 +1342,7 @@ static void __cold try_to_generate_entropy(void)
 			/* Expiring the timer at `jiffies` means it's the next tick. */
 			stack->timer.expires = jiffies;
 
-			add_timer_on(&stack->timer, cpu);
+			timer_add_on(&stack->timer, cpu);
 
 			preempt_enable();
 		}
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 1de7226db377..cf10804eef73 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -683,7 +683,7 @@ static void gpstate_timer_handler(struct timer_list *t)
 	 */
 	if (!cpumask_test_cpu(raw_smp_processor_id(), policy->cpus)) {
 		gpstates->timer.expires = jiffies + msecs_to_jiffies(1);
-		add_timer_on(&gpstates->timer, cpumask_first(policy->cpus));
+		timer_add_on(&gpstates->timer, cpumask_first(policy->cpus));
 		spin_unlock(&gpstates->gpstate_lock);
 		return;
 	}
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index c39e573825d4..fcb4f90720a9 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -214,7 +214,7 @@ static void __imsic_local_timer_start(struct imsic_local_priv *lpriv)
 
 	if (!timer_pending(&lpriv->timer)) {
 		lpriv->timer.expires = jiffies + 1;
-		add_timer_on(&lpriv->timer, smp_processor_id());
+		timer_add_on(&lpriv->timer, smp_processor_id());
 	}
 }
 #else
diff --git a/drivers/tty/mips_ejtag_fdc.c b/drivers/tty/mips_ejtag_fdc.c
index 9c5d4ff8875c..6f2d3cf4f7cf 100644
--- a/drivers/tty/mips_ejtag_fdc.c
+++ b/drivers/tty/mips_ejtag_fdc.c
@@ -1006,7 +1006,7 @@ static int mips_ejtag_fdc_tty_probe(struct mips_cdmm_device *dev)
 		 * Always attach the timer to the right CPU. The channels are
 		 * per-CPU so all polling should be from a single CPU.
 		 */
-		add_timer_on(&priv->poll_timer, dev->cpu);
+		timer_add_on(&priv->poll_timer, dev->cpu);
 
 		dev_info(priv->dev, "No usable IRQ, polling enabled\n");
 	}
@@ -1090,7 +1090,7 @@ static int mips_ejtag_fdc_tty_cpu_up(struct mips_cdmm_device *dev)
 	} else {
 		/* Restart poll timer */
 		priv->removing = false;
-		add_timer_on(&priv->poll_timer, dev->cpu);
+		timer_add_on(&priv->poll_timer, dev->cpu);
 	}
 
 	/* Restart the kthread */
diff --git a/include/linux/timer.h b/include/linux/timer.h
index 899dac465250..cc6903ba363f 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -37,7 +37,7 @@
  * with interrupts disabled. Abuse is monitored!
  *
  * @TIMER_PINNED: A pinned timer will always expire on the CPU on which the
- * timer was enqueued. When a particular CPU is required, add_timer_on()
+ * timer was enqueued. When a particular CPU is required, timer_add_on()
  * has to be used. Enqueue via mod_timer() and timer_add() is always done
  * on the local CPU.
  */
@@ -147,7 +147,7 @@ static inline int timer_pending(const struct timer_list * timer)
 	return !hlist_unhashed_lockless(&timer->entry);
 }
 
-extern void add_timer_on(struct timer_list *timer, int cpu);
+extern void timer_add_on(struct timer_list *timer, int cpu);
 extern int mod_timer(struct timer_list *timer, unsigned long expires);
 extern int timer_mod_pending(struct timer_list *timer, unsigned long expires);
 extern int timer_reduce(struct timer_list *timer, unsigned long expires);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba0..986b425b18a3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1209,7 +1209,7 @@ int get_nohz_timer_target(void)
 }
 
 /*
- * When add_timer_on() enqueues a timer into the timer wheel of an
+ * When timer_add_on() enqueues a timer into the timer wheel of an
  * idle CPU then this timer might expire before the next timer event
  * which is scheduled to wake up that CPU. In case of a completely
  * idle system the next event might even be infinite time into the
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index bb48498ebb5a..513f29693b5f 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -599,7 +599,7 @@ static void clocksource_watchdog(struct timer_list *unused)
 	 */
 	if (!timer_pending(&watchdog_timer)) {
 		watchdog_timer.expires += WATCHDOG_INTERVAL + extra_wait;
-		add_timer_on(&watchdog_timer, next_cpu);
+		timer_add_on(&watchdog_timer, next_cpu);
 	}
 out:
 	spin_unlock(&watchdog_lock);
@@ -611,7 +611,7 @@ static inline void clocksource_start_watchdog(void)
 		return;
 	timer_setup(&watchdog_timer, clocksource_watchdog, 0);
 	watchdog_timer.expires = jiffies + WATCHDOG_INTERVAL;
-	add_timer_on(&watchdog_timer, cpumask_first(cpu_online_mask));
+	timer_add_on(&watchdog_timer, cpumask_first(cpu_online_mask));
 	watchdog_running = 1;
 }
 
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 67fdc84b2a30..c86cb7ca85f2 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1327,7 +1327,7 @@ void timer_add_global(struct timer_list *timer)
 EXPORT_SYMBOL(timer_add_global);
 
 /**
- * add_timer_on - Start a timer on a particular CPU
+ * timer_add_on - Start a timer on a particular CPU
  * @timer:	The timer to be started
  * @cpu:	The CPU to start it on
  *
@@ -1338,7 +1338,7 @@ EXPORT_SYMBOL(timer_add_global);
  *
  * See timer_add() for further details.
  */
-void add_timer_on(struct timer_list *timer, int cpu)
+void timer_add_on(struct timer_list *timer, int cpu)
 {
 	struct timer_base *new_base, *base;
 	unsigned long flags;
@@ -1382,7 +1382,7 @@ void add_timer_on(struct timer_list *timer, int cpu)
 out_unlock:
 	raw_spin_unlock_irqrestore(&base->lock, flags);
 }
-EXPORT_SYMBOL_GPL(add_timer_on);
+EXPORT_SYMBOL_GPL(timer_add_on);
 
 /**
  * __timer_delete - Internal function: Deactivate a timer
@@ -1678,7 +1678,7 @@ static int __timer_delete_sync(struct timer_list *timer, bool shutdown)
  * otherwise this function is meaningless. It must not be called from
  * interrupt contexts unless the timer is an irqsafe one. The caller must
  * not hold locks which would prevent completion of the timer's callback
- * function. The timer's handler must not call add_timer_on(). Upon exit
+ * function. The timer's handler must not call timer_add_on(). Upon exit
  * the timer is not queued and the handler is not running on any CPU.
  *
  * For !irqsafe timers, the caller must not hold locks that are held in
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 5eb43f2d213b..ae4cbd1b2add 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2520,12 +2520,12 @@ static void __queue_delayed_work(int cpu, struct workqueue_struct *wq,
 		cpu = smp_processor_id();
 		if (!housekeeping_test_cpu(cpu, HK_TYPE_TIMER))
 			cpu = housekeeping_any_cpu(HK_TYPE_TIMER);
-		add_timer_on(timer, cpu);
+		timer_add_on(timer, cpu);
 	} else {
 		if (likely(cpu == WORK_CPU_UNBOUND))
 			timer_add_global(timer);
 		else
-			add_timer_on(timer, cpu);
+			timer_add_on(timer, cpu);
 	}
 }
 
-- 
2.45.2

