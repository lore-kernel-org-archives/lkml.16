Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF56282EE
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747365501; cv=none; b=dADdWmbPNBtcaKwtChwQPsO6BThlRehAnZTM2yLyl1eObmiysYc3iALDLIwK4usNWCQnde902SxfQ8NBwbDSgGeJlc2x4TKEoxo1tJSbKb8T8xmX/Ndz5VxWUVlbR1nk/qYGP86I7G4GiOLUbsF6liB19xyKBTMvJF2EZJT0rNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747365501; c=relaxed/simple;
	bh=qLD82P25PuwvddJa6PweOzkdhUZdx/Fte6g/pTX7HT0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dchb7yaRaS6k+fBYLscCNNr/zmuHJrDRuEfI3NmBdY1SIZIfNsKF2rf1KHsSXo34b9pYDVEU/szu/zJ12Xuc992Ri56twKhOCO9ntiUDtBbJGq/VF4sXessHrmv6/Ev8RhIxzhJIeZEXKoI3fwjTqFM8Q0ZmYpLXRbWefSXALTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p9Y1XxKT; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p9Y1XxKT"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742a091d290so860589b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747365499; x=1747970299; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgUgBb5RRnnSwrTE1RscixS970ekR4Rt920s1LTuWGg=;
        b=p9Y1XxKTZ46PWObH22KjF/99MyZKYRwXu2vRO5CUSZJcL0kc7cOaUYZqemaznyEbFl
         kaQbfgz6UpZmIEwoNs6cfEc22kEjl2pUZSC0laEn3fJ5jdAbdSNiJsRXMYcAL0RVdF+O
         kyEvyRCQB2m/O9d0YEZE2Fh5QPNhAKqAv/80W7phKfN6CE6CXE6vzNXHXuF49gagDObN
         5BFLQNUE3Sz5UBwLYJkaEbLQv8b/k1CUZMJW78dYkXL3Ho2PDP5lV+IXgKbgQUKXpHgl
         wPzwjOQbt1u/U1QZqLso2Vo+LeoCb7UcZ0axjrPPwUgZTfFR1ZPZxXIak/ALsay9kmik
         vVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747365499; x=1747970299;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgUgBb5RRnnSwrTE1RscixS970ekR4Rt920s1LTuWGg=;
        b=oLh3jY4mBy0xPdLuWvu+kghg7IVWsXDKONVf0akdcx2fa0j9tKJdV/C5uo1hsum8Li
         GelouFell6DEQLinuc4jkPCFqMjCsxBffbTJy0kkwhrCXZG1lZBd0ImEvIEQbrRCh7ZP
         bD0grtV6ES24vtgNNGHXORDOLZfHWuqQDA0tAxbAKEZ6gyBcl9o55H184pVgum36782H
         AYSHZkYOQukL4D9uTLiYiCrxmPsAqDL0il0xS9tVy1vj60wjDKCZqHex0yAHa4Z5QT+p
         NLFs/1fDQwxwPPVowRdRKxotBAWumQ4UjZNJ/ijP5WaK3bSB9tp/7RYWvkqIrulYOchV
         jBmg==
X-Gm-Message-State: AOJu0YzdISV/voBe7sm6L344g+CyoDXspAQuhFHl4758BrExARd7GQw/
	Dj94pvi5TkLbj9j6obWLW3F59BNw/JGs1DCEq5Wix6Hmil9RRRWoAO7aEBpVxpM8zi04Oi9UDgf
	cQL7MGBNxhamiQmBg4rqEDijLWu3lT6Nuqdxw6NDL82hsvngu/yAs+r0eyUcNZrEqG8MbWjnyEp
	2SX0vLp6fdW8kaWMbU0yfnWoCsIrCLHJ7aycpCMTzLIq+I+cz3
X-Google-Smtp-Source: AGHT+IH0TxbDLJ1u7OBnAPjYIdUnKlwajydGdjGQgvufPn4VL6rBSbLY41NOrTX6qFeWQgrTolEvnowVcC+o
X-Received: from pfbeb1.prod.google.com ([2002:a05:6a00:4c81:b0:741:a87a:afd9])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e16:b0:742:a23e:2a67
 with SMTP id d2e1a72fcca58-742a98a2151mr2035233b3a.16.1747365498960; Thu, 15
 May 2025 20:18:18 -0700 (PDT)
Date: Fri, 16 May 2025 03:17:48 +0000
In-Reply-To: <20250516031814.1870508-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516031814.1870508-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516031814.1870508-2-jstultz@google.com>
Subject: [PATCH v17 1/8] sched: Add CONFIG_SCHED_PROXY_EXEC & boot argument to enable/disable
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Add a CONFIG_SCHED_PROXY_EXEC option, along with a boot argument
sched_proxy_exec= that can be used to disable the feature at boot
time if CONFIG_SCHED_PROXY_EXEC was enabled.

Also uses this option to allow the rq->donor to be different from
rq->curr.

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: John Stultz <jstultz@google.com>
---
v7:
* Switch to CONFIG_SCHED_PROXY_EXEC/sched_proxy_exec= as
  suggested by Metin Kaya.
* Switch boot arg from =disable/enable to use kstrtobool(),
  which supports =yes|no|1|0|true|false|on|off, as also
  suggested by Metin Kaya, and print a message when a boot
  argument is used.
v8:
* Move CONFIG_SCHED_PROXY_EXEC under Scheduler Features as
  Suggested by Metin
* Minor rework reordering with split sched contexts patch
v12:
* Rework for selected -> donor renaming
v14:
* Depend on !PREEMPT_RT to avoid build issues for now
v15:
* Depend on EXPERT while patch series upstreaming is
  in progress.
v16:
* Allow "sched_proxy_exec" without "=true" to enable
  proxy-execution at boot time, in addition to the
  "sched_proxy_exec=true" or "sched_proxy_exec=false" options
  as suggested by Steven
* Drop the "default n" in Kconfig as suggested by Steven
* Add !SCHED_CLASS_EXT dependency until I can investigate if
  sched_ext can understand split contexts, as suggested by
  Peter
v17:
* Expanded the commit message a bit to clarify that the option
  allows the split contexts (rq->donor and rq->curr) to be
  different tasks, from feedback from Juri Lelli

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: kernel-team@android.com
---
 .../admin-guide/kernel-parameters.txt         |  5 ++++
 include/linux/sched.h                         | 13 +++++++++
 init/Kconfig                                  | 12 ++++++++
 kernel/sched/core.c                           | 29 +++++++++++++++++++
 kernel/sched/sched.h                          | 12 ++++++++
 5 files changed, 71 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d9fd26b95b340..1ee1e0f628bef 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6304,6 +6304,11 @@
 	sa1100ir	[NET]
 			See drivers/net/irda/sa1100_ir.c.
 
+	sched_proxy_exec= [KNL]
+			Enables or disables "proxy execution" style
+			solution to mutex-based priority inversion.
+			Format: <bool>
+
 	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
 
 	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac19828934..3cdd598aaa9aa 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1663,6 +1663,19 @@ struct task_struct {
 	 */
 };
 
+#ifdef CONFIG_SCHED_PROXY_EXEC
+DECLARE_STATIC_KEY_TRUE(__sched_proxy_exec);
+static inline bool sched_proxy_exec(void)
+{
+	return static_branch_likely(&__sched_proxy_exec);
+}
+#else
+static inline bool sched_proxy_exec(void)
+{
+	return false;
+}
+#endif
+
 #define TASK_REPORT_IDLE	(TASK_REPORT + 1)
 #define TASK_REPORT_MAX		(TASK_REPORT_IDLE << 1)
 
diff --git a/init/Kconfig b/init/Kconfig
index 4cdd1049283c1..168108ea5c82b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -886,6 +886,18 @@ config UCLAMP_BUCKETS_COUNT
 
 	  If in doubt, use the default value.
 
+config SCHED_PROXY_EXEC
+	bool "Proxy Execution"
+	# Avoid some build failures w/ PREEMPT_RT until it can be fixed
+	depends on !PREEMPT_RT
+	# Need to investigate how to inform sched_ext of split contexts
+	depends on !SCHED_CLASS_EXT
+	# Not particularly useful until we get to multi-rq proxying
+	depends on EXPERT
+	help
+	  This option enables proxy execution, a mechanism for mutex-owning
+	  tasks to inherit the scheduling context of higher priority waiters.
+
 endmenu
 
 #
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba05..82817650a635b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -118,6 +118,35 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(sched_compute_energy_tp);
 
 DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 
+#ifdef CONFIG_SCHED_PROXY_EXEC
+DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
+static int __init setup_proxy_exec(char *str)
+{
+	bool proxy_enable = true;
+
+	if (*str && kstrtobool(str + 1, &proxy_enable)) {
+		pr_warn("Unable to parse sched_proxy_exec=\n");
+		return 0;
+	}
+
+	if (proxy_enable) {
+		pr_info("sched_proxy_exec enabled via boot arg\n");
+		static_branch_enable(&__sched_proxy_exec);
+	} else {
+		pr_info("sched_proxy_exec disabled via boot arg\n");
+		static_branch_disable(&__sched_proxy_exec);
+	}
+	return 1;
+}
+#else
+static int __init setup_proxy_exec(char *str)
+{
+	pr_warn("CONFIG_SCHED_PROXY_EXEC=n, so it cannot be enabled or disabled at boot time\n");
+	return 0;
+}
+#endif
+__setup("sched_proxy_exec", setup_proxy_exec);
+
 /*
  * Debugging: various feature bits
  *
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 47972f34ea701..154f0aa0c6322 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1149,10 +1149,15 @@ struct rq {
 	 */
 	unsigned int		nr_uninterruptible;
 
+#ifdef CONFIG_SCHED_PROXY_EXEC
+	struct task_struct __rcu	*donor;  /* Scheduling context */
+	struct task_struct __rcu	*curr;   /* Execution context */
+#else
 	union {
 		struct task_struct __rcu *donor; /* Scheduler context */
 		struct task_struct __rcu *curr;  /* Execution context */
 	};
+#endif
 	struct sched_dl_entity	*dl_server;
 	struct task_struct	*idle;
 	struct task_struct	*stop;
@@ -1347,10 +1352,17 @@ DECLARE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 #define cpu_curr(cpu)		(cpu_rq(cpu)->curr)
 #define raw_rq()		raw_cpu_ptr(&runqueues)
 
+#ifdef CONFIG_SCHED_PROXY_EXEC
+static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
+{
+	rcu_assign_pointer(rq->donor, t);
+}
+#else
 static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
 {
 	/* Do nothing */
 }
+#endif
 
 #ifdef CONFIG_SCHED_CORE
 static inline struct cpumask *sched_group_span(struct sched_group *sg);
-- 
2.49.0.1101.gccaa498523-goog

