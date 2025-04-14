Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D1279341
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626227; cv=none; b=P4spodLAsHFGg7sjDwePIDUh3yZqnkSHA+vaPtjP6azC9QM8R7XgeDCRR3YmkpvvJaxX+JegyH1p+XWQBBfAVfpw/nfpQHzWvIcK4e/ADwIe5adNNJPmcQZNLPqLYg2Y5OQF8AokgpSYFLKBpW6vA3O20X57Wh8ZIp6V6dJe0Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626227; c=relaxed/simple;
	bh=nMFIBY0RgIPt6vT9IT5F6e0OUQcx7FacKNfeSYn92cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GN0I6EzsgG493H1EQEwwesfwsgBCV+Y2TENrCtcb/tYe5WTdz0EfNwHrz9GBGuuaKxgsuaPyw9FYK5zzkvEeuXxprxCzJxBi0Z31ok1h6jxP0tXtZuvPAgDUhLOieThbslRiA/aYP73pcsMbtuJs2xPmxg4ejgNcpArUAljJ3iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umXj6i3R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umXj6i3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862D6C4CEEB;
	Mon, 14 Apr 2025 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626227;
	bh=nMFIBY0RgIPt6vT9IT5F6e0OUQcx7FacKNfeSYn92cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=umXj6i3RNeUMIcjkx5BFaHtvKoprQEAVQXEECaY6vvxBr8lnL9Z5+YCdAVAPqt5aM
	 P3/u9n9wpEguETjVYvi7Fd2zI/M0UijMVHJMQ7EYW5ATZoriFNfrTzNjdRkndqlG6X
	 iS4D+e3osiYWgcBsHMqlwGFiPYLf5ARknoj0OoNNqTZYGvNc4K6/5pp8/5qBNjpy8j
	 76JwVdtceeu7kz5KqWVzkbOBDK/q2EkEK/qnXk5imiudRQjCnbpbYf2SUbRL6BQvih
	 Z+1wxlR9hUg+ReCoirMEbX+R5BoBL+mifFm01/qblzMUAY4SA2kWn0ZsxjoOPS5OCk
	 N2cqTWzXbmnwg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 17/17] treewide, timers: Rename init_timers() => timers_init()
Date: Mon, 14 Apr 2025 12:22:51 +0200
Message-ID: <20250414102301.332225-18-mingo@kernel.org>
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

Move this API to the canonical timers_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/sparc/kernel/irq.h         | 2 +-
 arch/sparc/kernel/leon_kernel.c | 2 +-
 arch/sparc/kernel/sun4d_irq.c   | 2 +-
 arch/sparc/kernel/sun4m_irq.c   | 2 +-
 arch/sparc/kernel/time_32.c     | 2 +-
 include/linux/timer.h           | 2 +-
 init/main.c                     | 2 +-
 kernel/time/timer.c             | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/kernel/irq.h b/arch/sparc/kernel/irq.h
index b02026ad6e34..07727cb9d9aa 100644
--- a/arch/sparc/kernel/irq.h
+++ b/arch/sparc/kernel/irq.h
@@ -55,7 +55,7 @@ extern struct sun4m_irq_global __iomem *sun4m_irq_global;
  * specifics in their init functions.
  */
 struct sparc_config {
-	void (*init_timers)(void);
+	void (*timers_init)(void);
 	unsigned int (*build_device_irq)(struct platform_device *op,
 	                                 unsigned int real_irq);
 
diff --git a/arch/sparc/kernel/leon_kernel.c b/arch/sparc/kernel/leon_kernel.c
index a43cf794bb1e..9260227aa3b7 100644
--- a/arch/sparc/kernel/leon_kernel.c
+++ b/arch/sparc/kernel/leon_kernel.c
@@ -500,7 +500,7 @@ void leon_enable_irq_cpu(unsigned int irq_nr, unsigned int cpu)
 
 void __init leon_init_IRQ(void)
 {
-	sparc_config.init_timers      = leon_init_timers;
+	sparc_config.timers_init      = leon_init_timers;
 	sparc_config.build_device_irq = _leon_build_device_irq;
 	sparc_config.clock_rate       = 1000000;
 	sparc_config.clear_clock_irq  = leon_clear_clock_irq;
diff --git a/arch/sparc/kernel/sun4d_irq.c b/arch/sparc/kernel/sun4d_irq.c
index 9a137c70e8d1..0032ffae0229 100644
--- a/arch/sparc/kernel/sun4d_irq.c
+++ b/arch/sparc/kernel/sun4d_irq.c
@@ -509,7 +509,7 @@ void __init sun4d_init_IRQ(void)
 {
 	local_irq_disable();
 
-	sparc_config.init_timers      = sun4d_init_timers;
+	sparc_config.timers_init      = sun4d_init_timers;
 	sparc_config.build_device_irq = sun4d_build_device_irq;
 	sparc_config.clock_rate       = SBUS_CLOCK_RATE;
 	sparc_config.clear_clock_irq  = sun4d_clear_clock_irq;
diff --git a/arch/sparc/kernel/sun4m_irq.c b/arch/sparc/kernel/sun4m_irq.c
index 1079638986b5..fbbdd7ca2511 100644
--- a/arch/sparc/kernel/sun4m_irq.c
+++ b/arch/sparc/kernel/sun4m_irq.c
@@ -467,7 +467,7 @@ void __init sun4m_init_IRQ(void)
 	if (num_cpu_iregs == 4)
 		sbus_writel(0, &sun4m_irq_global->interrupt_target);
 
-	sparc_config.init_timers      = sun4m_init_timers;
+	sparc_config.timers_init      = sun4m_init_timers;
 	sparc_config.build_device_irq = sun4m_build_device_irq;
 	sparc_config.clock_rate       = SBUS_CLOCK_RATE;
 	sparc_config.clear_clock_irq  = sun4m_clear_clock_irq;
diff --git a/arch/sparc/kernel/time_32.c b/arch/sparc/kernel/time_32.c
index 578fd0d49f30..1f83ca84ba2f 100644
--- a/arch/sparc/kernel/time_32.c
+++ b/arch/sparc/kernel/time_32.c
@@ -340,7 +340,7 @@ static void __init sparc32_late_time_init(void)
 static void __init sbus_time_init(void)
 {
 	sparc_config.get_cycles_offset = sbus_cycles_offset;
-	sparc_config.init_timers();
+	sparc_config.timers_init();
 }
 
 void __init time_init(void)
diff --git a/include/linux/timer.h b/include/linux/timer.h
index dcc791bf84a4..ed55e8bf8467 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -168,7 +168,7 @@ extern int timer_delete(struct timer_list *timer);
 extern int timer_shutdown_sync(struct timer_list *timer);
 extern int timer_shutdown(struct timer_list *timer);
 
-extern void init_timers(void);
+extern void timers_init(void);
 struct hrtimer;
 extern enum hrtimer_restart it_real_fn(struct hrtimer *);
 
diff --git a/init/main.c b/init/main.c
index 7f0a2a3dbd29..bf9c5d22953b 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1002,7 +1002,7 @@ void start_kernel(void)
 	init_IRQ();
 	tick_init();
 	rcu_init_nohz();
-	init_timers();
+	timers_init();
 	srcu_init();
 	hrtimers_init();
 	softirq_init();
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index cba4f1118263..7046a9c86bb2 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -2612,7 +2612,7 @@ static void __init init_timer_cpus(void)
 		init_timer_cpu(cpu);
 }
 
-void __init init_timers(void)
+void __init timers_init(void)
 {
 	init_timer_cpus();
 	posix_cputimers_init_work();
-- 
2.45.2

