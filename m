Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE26B3B7A8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547637; cv=none; b=VSnkxEdnhIzLJ3Mgm2Gvvjl+B+3y8Os81iFooDCncjUXSXsJ/jp99LHDRhU2U7W4h6rBDG84ENVG6pRplVmbv2f/+ZTAf9ZQFVmnxyvmTBy3oVdTEO41GfY4f/cGaKqhec4HjHUDW9yDMitEabnm+F+VaJe8sES2ZWaAM6e2RYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547637; c=relaxed/simple;
	bh=MmsyTGmFy1FbBiY0WLPWnQ5N9N1jeIO9tDYgCHg5bis=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eDjoEXNzRZs1ZJei7XKuGY+GH3HW/43Dq63uZNQVr+xCT/IeAiIOXvZf1UY/46mx+2hAcXp/EiJiWl4pcc9BHE8aYwSfK9pHmpACQQBcZr6KZEBomm4dFiZK8j0a2fVY0YZkTN6O3xGSDBMD9wfPfkE5Auvrv1B/bYxCkpnMpSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgtEZbdO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgtEZbdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DE6C4CEED;
	Tue, 10 Jun 2025 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547637;
	bh=MmsyTGmFy1FbBiY0WLPWnQ5N9N1jeIO9tDYgCHg5bis=;
	h=From:To:Cc:Subject:Date:From;
	b=EgtEZbdOhg//wdfN4Suto3LlNdf1cBuskQMb6ynyJ8Ou0MWjrk0XXWgyCLbJq6HN1
	 El/7V4e4Gybwx0lHla15LcRhWljZB4apFPt5ehSpW9UmakPNDvbcvP7HD5mWQo2rwa
	 Wnod07DVEMFxVCRHUmRgqay8eyaiRZlwKuIb0HV5z0uIEsw4uLX6Pf4XlEpsb9gqiN
	 f3CKFwJBs4HMmYfP0qk6MOT9GbBmpxeKsIRWXMxfyJdPbU+aW1eWl05Ap6bFyGX/BZ
	 QjAP6m5lW7ydIF9xR/mo4oQlmNXQz1bDKJJJV0c9DtrDmeXd6szXJGRkMfKYELPqT0
	 b2ufBrO3ARIuA==
From: Arnd Bergmann <arnd@kernel.org>
To: "Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Joel Granados <joel.granados@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] random: use offstack cpumask when necessary
Date: Tue, 10 Jun 2025 11:27:08 +0200
Message-Id: <20250610092712.2641547-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The entropy generation function keeps a local cpu mask on the stack, which
can trigger warnings in configurations with a large number of CPUs:

drivers/char/random.c:1292:20: error: stack frame size (1288) exceeds limit (1280) in 'try_to_generate_entropy' [-Werror,-Wframe-larger-than]

Use the cpumask interface to dynamically allocate it in those configurations.

Fixes: 1c21fe00eda7 ("random: spread out jitter callback to different CPUs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/char/random.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index b8b24b6ed3fe..04800b75cf73 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1296,6 +1296,7 @@ static void __cold try_to_generate_entropy(void)
 	struct entropy_timer_state *stack = PTR_ALIGN((void *)stack_bytes, SMP_CACHE_BYTES);
 	unsigned int i, num_different = 0;
 	unsigned long last = random_get_entropy();
+	cpumask_var_t timer_cpus;
 	int cpu = -1;
 
 	for (i = 0; i < NUM_TRIAL_SAMPLES - 1; ++i) {
@@ -1310,13 +1311,15 @@ static void __cold try_to_generate_entropy(void)
 
 	atomic_set(&stack->samples, 0);
 	timer_setup_on_stack(&stack->timer, entropy_timer, 0);
+	if (!alloc_cpumask_var(&timer_cpus, GFP_KERNEL))
+		goto out;;
+
 	while (!crng_ready() && !signal_pending(current)) {
 		/*
 		 * Check !timer_pending() and then ensure that any previous callback has finished
 		 * executing by checking timer_delete_sync_try(), before queueing the next one.
 		 */
 		if (!timer_pending(&stack->timer) && timer_delete_sync_try(&stack->timer) >= 0) {
-			struct cpumask timer_cpus;
 			unsigned int num_cpus;
 
 			/*
@@ -1326,19 +1329,19 @@ static void __cold try_to_generate_entropy(void)
 			preempt_disable();
 
 			/* Only schedule callbacks on timer CPUs that are online. */
-			cpumask_and(&timer_cpus, housekeeping_cpumask(HK_TYPE_TIMER), cpu_online_mask);
-			num_cpus = cpumask_weight(&timer_cpus);
+			cpumask_and(timer_cpus, housekeeping_cpumask(HK_TYPE_TIMER), cpu_online_mask);
+			num_cpus = cpumask_weight(timer_cpus);
 			/* In very bizarre case of misconfiguration, fallback to all online. */
 			if (unlikely(num_cpus == 0)) {
-				timer_cpus = *cpu_online_mask;
-				num_cpus = cpumask_weight(&timer_cpus);
+				*timer_cpus = *cpu_online_mask;
+				num_cpus = cpumask_weight(timer_cpus);
 			}
 
 			/* Basic CPU round-robin, which avoids the current CPU. */
 			do {
-				cpu = cpumask_next(cpu, &timer_cpus);
+				cpu = cpumask_next(cpu, timer_cpus);
 				if (cpu >= nr_cpu_ids)
-					cpu = cpumask_first(&timer_cpus);
+					cpu = cpumask_first(timer_cpus);
 			} while (cpu == smp_processor_id() && num_cpus > 1);
 
 			/* Expiring the timer at `jiffies` means it's the next tick. */
@@ -1354,6 +1357,8 @@ static void __cold try_to_generate_entropy(void)
 	}
 	mix_pool_bytes(&stack->entropy, sizeof(stack->entropy));
 
+	free_cpumask_var(timer_cpus);
+out:
 	timer_delete_sync(&stack->timer);
 	timer_destroy_on_stack(&stack->timer);
 }
-- 
2.39.5

