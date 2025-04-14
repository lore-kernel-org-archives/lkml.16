Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F7278E58
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626225; cv=none; b=nrrUM+pZOnQ8XKAJoRYaHO9RLG3D5/Huor8j8GgrrhlJMJGjv0ypTb3cYnAmbFwHSm3TXceqkTAMA89HwhD+A+40+U6U/Q2M1xzQ4pmg+YQYGjotPL/2gy5n/09uQ8mObNsoO4QmUA1mTerOzxkUwqmj7vfDv5WCjEn5/rTI3rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626225; c=relaxed/simple;
	bh=NDvXj1UW9zsP781p7BfGoTuXdAKt4kdvF4VwpYW19oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLx3S+y32LRXccAZdSR7v3fI3a5O8GqNG2o9WaRQEJ6nxMiw+d2xum8Tba/X8B511m7VH8jzb3UDENX4gA7IAzszD2RN/q6Ltyy130NhVkhw852U/+YrJrrCXkassrB5vqXulLKOyFX+vSmZYEEr8x2XwWGgwbuxYqgA2YIlLfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUz89FC0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUz89FC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59845C4CEE2;
	Mon, 14 Apr 2025 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626225;
	bh=NDvXj1UW9zsP781p7BfGoTuXdAKt4kdvF4VwpYW19oE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DUz89FC07oJPKaBe5Cup21KjDgtOWZLh8TT6+hIFG+XT4k/g0u/YjT3DSpek8Oywd
	 PrlhujXPwIs7XSlqQ7f+Av4SNCl4DVlrmRzBL56h0E+5u43hK1YZynVBpUr0lzRf7L
	 BkODa730pdW+v7j05OBqi6gXfo4kvohkP+Zpz26V3d7qa+jNy2rsJMqwsFgx7nQNv1
	 EbIXZaGjA2cd+va0OUvBr11B5y99FeSFNF8xEKBfSKFio8ZgkAKJQkYuK4PyKcAALn
	 WV3Y/o2Pdoy3aAE0ItViNLzgpr7L5HSJ5PkwFSJJliIvja1oJkPA4noISg+V3leioY
	 Ke9DKF31oSADg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 16/17] treewide, timers: Rename NEXT_TIMER_MAX_DELTA => TIMER_NEXT_MAX_DELTA
Date: Mon, 14 Apr 2025 12:22:50 +0200
Message-ID: <20250414102301.332225-17-mingo@kernel.org>
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

Move this macro to the canonical TIMER_* namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/powerpc/kvm/booke.c |  8 ++++----
 include/linux/timer.h    |  2 +-
 kernel/time/timer.c      | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 5322a9dea19d..71ffbf917dae 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -572,7 +572,7 @@ static int kvmppc_booke_irqprio_deliver(struct kvm_vcpu *vcpu,
 
 /*
  * Return the number of jiffies until the next timeout.  If the timeout is
- * longer than the NEXT_TIMER_MAX_DELTA, then return NEXT_TIMER_MAX_DELTA
+ * longer than the TIMER_NEXT_MAX_DELTA, then return TIMER_NEXT_MAX_DELTA
  * because the larger value can break the timer APIs.
  */
 static unsigned long watchdog_next_timeout(struct kvm_vcpu *vcpu)
@@ -598,7 +598,7 @@ static unsigned long watchdog_next_timeout(struct kvm_vcpu *vcpu)
 	if (do_div(nr_jiffies, tb_ticks_per_jiffy))
 		nr_jiffies++;
 
-	return min_t(unsigned long long, nr_jiffies, NEXT_TIMER_MAX_DELTA);
+	return min_t(unsigned long long, nr_jiffies, TIMER_NEXT_MAX_DELTA);
 }
 
 static void arm_next_watchdog(struct kvm_vcpu *vcpu)
@@ -616,10 +616,10 @@ static void arm_next_watchdog(struct kvm_vcpu *vcpu)
 	spin_lock_irqsave(&vcpu->arch.wdt_lock, flags);
 	nr_jiffies = watchdog_next_timeout(vcpu);
 	/*
-	 * If the number of jiffies of watchdog timer >= NEXT_TIMER_MAX_DELTA
+	 * If the number of jiffies of watchdog timer >= TIMER_NEXT_MAX_DELTA
 	 * then do not run the watchdog timer as this can break timer APIs.
 	 */
-	if (nr_jiffies < NEXT_TIMER_MAX_DELTA)
+	if (nr_jiffies < TIMER_NEXT_MAX_DELTA)
 		timer_mod(&vcpu->arch.wdt_timer, jiffies + nr_jiffies);
 	else
 		timer_delete(&vcpu->arch.wdt_timer);
diff --git a/include/linux/timer.h b/include/linux/timer.h
index 0f0531e827c4..dcc791bf84a4 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -156,7 +156,7 @@ extern int timer_reduce(struct timer_list *timer, unsigned long expires);
  * The jiffies value which is added to now, when there is no timer
  * in the timer wheel:
  */
-#define NEXT_TIMER_MAX_DELTA	((1UL << 30) - 1)
+#define TIMER_NEXT_MAX_DELTA	((1UL << 30) - 1)
 
 extern void timer_add(struct timer_list *timer);
 extern void timer_add_local(struct timer_list *timer);
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 2ea735fa47fb..cba4f1118263 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1900,7 +1900,7 @@ static void timer_recalc_next_expiry(struct timer_base *base)
 	unsigned long clk, next, adj;
 	unsigned lvl, offset = 0;
 
-	next = base->clk + NEXT_TIMER_MAX_DELTA;
+	next = base->clk + TIMER_NEXT_MAX_DELTA;
 	clk = base->clk;
 	for (lvl = 0; lvl < LVL_DEPTH; lvl++, offset += LVL_SIZE) {
 		int pos = next_pending_bucket(base, offset, clk & LVL_MASK);
@@ -1963,7 +1963,7 @@ static void timer_recalc_next_expiry(struct timer_base *base)
 
 	WRITE_ONCE(base->next_expiry, next);
 	base->next_expiry_recalc = false;
-	base->timers_pending = !(next == base->clk + NEXT_TIMER_MAX_DELTA);
+	base->timers_pending = !(next == base->clk + TIMER_NEXT_MAX_DELTA);
 }
 
 #ifdef CONFIG_NO_HZ_COMMON
@@ -2015,7 +2015,7 @@ static unsigned long next_timer_interrupt(struct timer_base *base,
 	 * easy comparable to find out which base holds the first pending timer.
 	 */
 	if (!base->timers_pending)
-		WRITE_ONCE(base->next_expiry, basej + NEXT_TIMER_MAX_DELTA);
+		WRITE_ONCE(base->next_expiry, basej + TIMER_NEXT_MAX_DELTA);
 
 	return base->next_expiry;
 }
@@ -2399,7 +2399,7 @@ static inline void __run_timers(struct timer_base *base)
 		 * timer at this clk are that all matching timers have been
 		 * dequeued or no timer has been queued since
 		 * base::next_expiry was set to base::clk +
-		 * NEXT_TIMER_MAX_DELTA.
+		 * TIMER_NEXT_MAX_DELTA.
 		 */
 		WARN_ON_ONCE(!levels && !base->next_expiry_recalc
 			     && base->timers_pending);
@@ -2544,7 +2544,7 @@ int timers_prepare_cpu(unsigned int cpu)
 	for (b = 0; b < NR_BASES; b++) {
 		base = per_cpu_ptr(&timer_bases[b], cpu);
 		base->clk = jiffies;
-		base->next_expiry = base->clk + NEXT_TIMER_MAX_DELTA;
+		base->next_expiry = base->clk + TIMER_NEXT_MAX_DELTA;
 		base->next_expiry_recalc = false;
 		base->timers_pending = false;
 		base->is_idle = false;
@@ -2599,7 +2599,7 @@ static void __init init_timer_cpu(int cpu)
 		base->cpu = cpu;
 		raw_spin_lock_init(&base->lock);
 		base->clk = jiffies;
-		base->next_expiry = base->clk + NEXT_TIMER_MAX_DELTA;
+		base->next_expiry = base->clk + TIMER_NEXT_MAX_DELTA;
 		timer_base_init_expiry_lock(base);
 	}
 }
-- 
2.45.2

