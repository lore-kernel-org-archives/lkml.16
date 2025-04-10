Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E652580C8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277093; cv=none; b=i3Nyvatx5tx2f2LKPi5tePGyVWyos//fXyLwqUBdyyvJw/MVYDM4+UpuEe4GhdkUr0pC/6FtsvUIdxKh5Z5koig1SfikUqVWfHaoqKA2CbwOFhRqrAgDkxQ7VercYGbR4P5SGLTOTorjrkGMct9d+u3QGJhfSCaazLvriUUxGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277093; c=relaxed/simple;
	bh=s0ByrIZGehzFenjo/aRbEBhVdxZiQ2oWe2UfFc3+t0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6mZ+wS2s9+TNjsN5FptPLuakDC/vUlOMZ8Sh7G0hv0wMmNC/LTf3En4O4RpaX+ZgR/eLUofJOS8s1VXq7r4KnFWfXgk4QIBMBLlft8cqVqMBVwq6RzMJGn3CjIwOX/MxuzeIJ1SP301emaxbQkz2wzWcOsUdAMuPU0sTsR7tcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLePQnGg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLePQnGg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D99BC4CEE3;
	Thu, 10 Apr 2025 09:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277093;
	bh=s0ByrIZGehzFenjo/aRbEBhVdxZiQ2oWe2UfFc3+t0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DLePQnGgiLJYrpj1HRDUZ6LmANlDNEUvDXw+stzAa+SqQUbkGm+0aD0R8FP2c1g1K
	 MPx7HlTw5dHwhWFYuAa1hnN612K8KBeZBeRqEFSFci+YlTVAC/+y7rVYVzLyY/2hRJ
	 fIuUhF0klYPiLsLrY8AAVKvapJrKJphCIGoTJUpZuUltoek1P65283sVazaNjq0UCn
	 JCLP9HBIW25GtClpZwp/wjfQ4kWqPcPI3vlP1hMFbE9a1RsmuQOO162l/TMOwVSv0d
	 pk/XWm93I6X2ls1VaKx3LuyyjiETLAI2/FmXAlFHhUCDKvzDmuGLX6ymgrBrQnx1yC
	 irjVxyh+HX6sA==
From: alexs@kernel.org
To: 
Cc: linux-kernel@vger.kernel.org,
	Alex Shi <alexs@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 3/4] sched/isolation: merge housekeeping_cpu() and housekeeping_test_cpu()
Date: Thu, 10 Apr 2025 17:24:18 +0800
Message-ID: <20250410092423.9831-3-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410092423.9831-1-alexs@kernel.org>
References: <20250410092423.9831-1-alexs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>

Since the function just call housekeeping_test_cpu() without doing any other
things, we could just merge them together with name housekeeping_cpu();

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Ben Segall <bsegall@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
---
 include/linux/sched/isolation.h | 19 +++++++------------
 kernel/sched/isolation.c        |  4 ++--
 kernel/workqueue.c              |  2 +-
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index 231bc5766f76..90e46440fc85 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -30,7 +30,7 @@ extern int housekeeping_any_cpu(enum hk_type type);
 extern const struct cpumask *housekeeping_cpumask(enum hk_type type);
 extern bool housekeeping_enabled(enum hk_type type);
 extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
-extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
+extern bool housekeeping_cpu(int cpu, enum hk_type type);
 extern void __init housekeeping_init(void);
 
 #else
@@ -50,26 +50,21 @@ static inline bool housekeeping_enabled(enum hk_type type)
 	return false;
 }
 
-static inline void housekeeping_affine(struct task_struct *t,
-				       enum hk_type type) { }
-
-static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
+static inline bool housekeeping_cpu(int cpu, enum hk_type type)
 {
 	return true;
 }
 
+static inline void housekeeping_affine(struct task_struct *t,
+				       enum hk_type type) { }
+
 static inline void housekeeping_init(void) { }
 #endif /* CONFIG_CPU_ISOLATION */
 
-static inline bool housekeeping_cpu(int cpu, enum hk_type type)
-{
-	return housekeeping_test_cpu(cpu, type);
-}
-
 static inline bool cpu_is_isolated(int cpu)
 {
-	return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
-	       !housekeeping_test_cpu(cpu, HK_TYPE_TICK) ||
+	return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
+	       !housekeeping_cpu(cpu, HK_TYPE_TICK) ||
 	       cpuset_cpu_is_isolated(cpu);
 }
 
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 81bc8b329ef1..e93776740725 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -73,14 +73,14 @@ void housekeeping_affine(struct task_struct *t, enum hk_type type)
 }
 EXPORT_SYMBOL_GPL(housekeeping_affine);
 
-bool housekeeping_test_cpu(int cpu, enum hk_type type)
+bool housekeeping_cpu(int cpu, enum hk_type type)
 {
 	if (static_branch_unlikely(&housekeeping_overridden))
 		if (housekeeping.flags & BIT(type))
 			return cpumask_test_cpu(cpu, housekeeping.cpumasks[type]);
 	return true;
 }
-EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
+EXPORT_SYMBOL_GPL(housekeeping_cpu);
 
 void __init housekeeping_init(void)
 {
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index bfe030b443e2..69a02c9e53fb 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2518,7 +2518,7 @@ static void __queue_delayed_work(int cpu, struct workqueue_struct *wq,
 	if (housekeeping_enabled(HK_TYPE_TIMER)) {
 		/* If the current cpu is a housekeeping cpu, use it. */
 		cpu = smp_processor_id();
-		if (!housekeeping_test_cpu(cpu, HK_TYPE_TIMER))
+		if (!housekeeping_cpu(cpu, HK_TYPE_TIMER))
 			cpu = housekeeping_any_cpu(HK_TYPE_TIMER);
 		add_timer_on(timer, cpu);
 	} else {
-- 
2.47.1

