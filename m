Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07A5224B01
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751485334; cv=none; b=aIlVD6RhcoLBTmhmW/Ypgan9NV2k+T/CVPmxHI3tpzjK042qNfmEhKmrtE80uTye7S9l4ND8g5QPqXgXIJ5oMpaY9O3xYYkq5Ptv3bJSXefxFrr5xes+d1PG19IpMo47OgBnFG5fDGUydPIsqzouiLwwrQEY7pJnxFoWPJwRFg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751485334; c=relaxed/simple;
	bh=SwTHyU6Mn0I3EB41JlGEsXh4W1GwMv24rlbzisMlucY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lT0E1IB88QbjK8XE6dozJPt6xS7n/wGIFS665WQxo/Oqw37FAPIhlqCFWOasXUUka7xV7hfy39OTCGacH2egm2IZNnsxanJwb+hve/zzeJ41GpD8Obq/lR1Q8d2cAcLuq/cVtZBcdVIukLjf9iWdRuwkGvy04E9ajWEirtweoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6RCxxZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6RCxxZz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACE43C4CEE7;
	Wed,  2 Jul 2025 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751485333;
	bh=SwTHyU6Mn0I3EB41JlGEsXh4W1GwMv24rlbzisMlucY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=c6RCxxZzvjGhnxE+mcDBcQnqMlJdm3RdhiVrCuvbV62Rwl0GWfea/Xziixz1LCkxn
	 NJLxrkNR94SQeWWwzHx7i+KmHVW1XuHY6GoL5WOuaOREsXBEQyRWvaYdlZcB7Gjo9q
	 JLseumv8BOj53kZeUD/KLBng5YfQL1Ro/CFaSvPr9u8aICZA0PWVW8qJ8llGNuVCXH
	 YXyoUd/kHIoScEh3KfozJby43R01qvSvVlnZ1LdatYKmKHXroujNt62iZD8yNIwE6Q
	 MqNeh6gSEQcag+aKNaYAh5+prXPNXQTkFIB8OzdKrZUSOO6hgKHdRqI0RlZgJuzw7j
	 Up5q0k6vvESpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DF9C83F03;
	Wed,  2 Jul 2025 19:42:13 +0000 (UTC)
From: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>
Date: Wed, 02 Jul 2025 12:42:00 -0700
Subject: [PATCH] Skew tick for systems with a large number of processors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-tick_skew-v1-1-ff8d73035b02@gentwo.org>
X-B4-Tracking: v=1; b=H4sIAIeLZWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMj3ZLM5Oz44uzUcl2DVHMLU4tkQwMjEzMloPqCotS0zAqwWdGxtbU
 AxXCWRVsAAAA=
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, sh@gentwo.org, 
 Darren Hart <dvhart@infradead.org>, 
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751485333; l=2920;
 i=cl@gentwo.org; s=20240811; h=from:subject:message-id;
 bh=mEaXrgWVXMVIAxP7Q84RMJ+OwIeyomVfgVzW4N0MT4E=;
 b=2AYl5EUugdW/v8u1pbUcoYBfQ9I+PSRag4ISQvJfh69fvIZcVJ+jx1B2XIzXC+CZTqg3g9cqh
 bLRSsyBQrWnDD6bfaFXPywKA2+6y50ataeDkou12LfHQoNYMxpJwP1o
X-Developer-Key: i=cl@gentwo.org; a=ed25519;
 pk=I7gqGwDi9drzCReFIuf2k9de1FI1BGibsshXI0DIvq8=
X-Endpoint-Received: by B4 Relay for cl@gentwo.org/20240811 with
 auth_id=194
X-Original-From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Reply-To: cl@gentwo.org

From: "Christoph Lameter (Ampere)" <cl@gentwo.org>

Synchronized ticks mean that all processors will simultaneously process
ticks and enter the scheduler. So the contention increases as the number
of cpu increases. The contention causes latency jitter that scales with
the number of processors.

Staggering the timer interrupt also helps mitigate voltage droop related
issues that may be observed in SOCs with large core counts.
See https://semiengineering.com/mitigating-voltage-droop/ for a more
detailed explanation.

Switch to skewed tick for systems with more than 64 processors.

Signed-off-by: Christoph Lameter (Ampere) <cl@gentwo.org>
---
 kernel/Kconfig.hz        | 10 ++++++++++
 kernel/time/tick-sched.c | 16 ++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/kernel/Kconfig.hz b/kernel/Kconfig.hz
index ce1435cb08b1..245d938d446b 100644
--- a/kernel/Kconfig.hz
+++ b/kernel/Kconfig.hz
@@ -57,3 +57,13 @@ config HZ
 
 config SCHED_HRTICK
 	def_bool HIGH_RES_TIMERS
+
+config TICK_SKEW_LIMIT
+	int
+	default 64
+	help
+	  If the kernel is booted on systems with a large number of cpus then the
+	  concurrent execution of timer ticks causes long holdoffs due to
+	  serialization. Synchrononous executions of interrupts can also cause
+	  voltage droop in SOCs. So switch to skewed mode. This mechanism
+	  can be overridden by specifying "tick_skew=x" on the kernel command line.
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c527b421c865..aab7a1cc25c7 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1554,7 +1554,7 @@ void tick_irq_enter(void)
 	tick_nohz_irq_enter();
 }
 
-static int sched_skew_tick;
+static int sched_skew_tick = -1;
 
 static int __init skew_tick(char *str)
 {
@@ -1572,6 +1572,16 @@ void tick_setup_sched_timer(bool hrtimer)
 {
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
 
+	/* Figure out if we should skew the tick */
+	if (sched_skew_tick < 0) {
+		if (num_possible_cpus() >= CONFIG_TICK_SKEW_LIMIT) {
+			sched_skew_tick = 1;
+			pr_info("Tick skewed mode enabled. Possible cpus %u > %u\n",
+				num_possible_cpus(), CONFIG_TICK_SKEW_LIMIT);
+		} else
+			sched_skew_tick = 0;
+	}
+
 	/* Emulate tick processing via per-CPU hrtimers: */
 	hrtimer_setup(&ts->sched_timer, tick_nohz_handler, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
 
@@ -1587,7 +1597,9 @@ void tick_setup_sched_timer(bool hrtimer)
 		do_div(offset, num_possible_cpus());
 		offset *= smp_processor_id();
 		hrtimer_add_expires_ns(&ts->sched_timer, offset);
-	}
+	} else
+		pr_info("Tick operating in synchronized mode.\n");
+
 
 	hrtimer_forward_now(&ts->sched_timer, TICK_NSEC);
 	if (IS_ENABLED(CONFIG_HIGH_RES_TIMERS) && hrtimer)

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250702-tick_skew-0e7858c10246

Best regards,
-- 
Christoph Lameter <cl@gentwo.org>


