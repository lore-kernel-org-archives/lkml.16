Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15C8256C68
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153585; cv=none; b=mbe3yNMB2QhF06KV2Zg6TbTmap4cIV42TV67/SS1cldvXSAjikVzHPReV7rBuo7TFjqMBc0watIz37EfOq5/lnesUrShMuvpoaUdNVP1xGs2FbkfSSXUDxdnFii5ogyGLulc/jdso8pjj6f0AtG6vsi8TnOEfvjiYQo3HS/Pm8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153585; c=relaxed/simple;
	bh=HPr2CVBlHY4DLQ3Ph0tfq/YiJp1GmxEg+7OgfX3yOoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7EuVPi+/MfCor9u/4fAwxRgjsW0OJtnGTDMuyLCowabHefshCkdaIRMs98kKwPR3kFi84ee3coF98mljJzTsVsY9C2csqQwxleEJ4C0Dzj3pmM/1FHrTiAa1KwpPMgVxRKUvTcw7vPLuGiRjeE0KiwWtLd2PBbsSG5HU2AVI9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7Xkc7Vi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7Xkc7Vi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6190EC4CEE5;
	Tue,  8 Apr 2025 23:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744153585;
	bh=HPr2CVBlHY4DLQ3Ph0tfq/YiJp1GmxEg+7OgfX3yOoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i7Xkc7Vi1RUaAtr4x44hYyOSf+KHekIrNtNLLTtXfaCyb5E3zsc9nJsYaHg4LouoQ
	 KpayDgeuKB4UPcqs1BqKN2tM14iJGDd2H0dbk0ep24Yr+X+RYWFHgMJZ4IEa0I6bi7
	 /5mx0tqCzsNc4TrvcSKYjW3J2LpS8OSGht+H7pS6vTaxUPAKma+kMPFpBlWOdm3ucX
	 bYxJabhNXdkFLV4XG9xNsPyJczbEcNgj1YYgbMNyAQC8gOlGO1PRsmjHumozaoUCrU
	 yhhekVJXWI22l6a48gSnyWvN5/mhjvYL6IOgpGSQEqopqrrtBGdAOp+AUZ/cqZ3T8H
	 wRwFyooypKbrw==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 4/5] sched_ext: Remove scx_ops_allow_queued_wakeup static_key
Date: Tue,  8 Apr 2025 13:06:04 -1000
Message-ID: <20250408230616.2369765-5-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408230616.2369765-1-tj@kernel.org>
References: <20250408230616.2369765-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scx_ops_allow_queued_wakeup is used to encode SCX_OPS_ALLOW_QUEUED_WAKEUP
into a static_key. The test is gated behind scx_enabled(), and, even when
sched_ext is enabled, is unlikely for the static_key usage to make any
meaningful difference. It is made to use a static_key mostly because there
was no reason not to. However, global static_keys can't work with the
planned hierarchical multiple scheduler support. Remove the static_key and
instead test SCX_OPS_ALLOW_QUEUED_WAKEUP directly.

In repeated hackbench runs before and after static_keys removal on an AMD
Ryzen 3900X, I couldn't tell any measurable performance difference.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 12 +++++++-----
 kernel/sched/ext.h |  8 +-------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 1adf5c299cce..f0ed0cec4c98 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -928,8 +928,6 @@ DEFINE_STATIC_KEY_FALSE(__scx_switched_all);
 static struct sched_ext_ops scx_ops;
 static bool scx_warned_zero_slice;
 
-DEFINE_STATIC_KEY_FALSE(scx_ops_allow_queued_wakeup);
-
 static struct static_key_false scx_has_op[SCX_OPI_END] =
 	{ [0 ... SCX_OPI_END-1] = STATIC_KEY_FALSE_INIT };
 
@@ -4414,6 +4412,13 @@ bool task_should_scx(int policy)
 	return policy == SCHED_EXT;
 }
 
+bool scx_allow_ttwu_queue(const struct task_struct *p)
+{
+	return !scx_enabled() ||
+		(scx_ops.flags & SCX_OPS_ALLOW_QUEUED_WAKEUP) ||
+		p->sched_class != &ext_sched_class;
+}
+
 /**
  * scx_softlockup - sched_ext softlockup handler
  * @dur_s: number of seconds of CPU stuck due to soft lockup
@@ -4728,7 +4733,6 @@ static void scx_disable_workfn(struct kthread_work *work)
 	static_branch_disable(&__scx_enabled);
 	for (i = SCX_OPI_BEGIN; i < SCX_OPI_END; i++)
 		static_branch_disable(&scx_has_op[i]);
-	static_branch_disable(&scx_ops_allow_queued_wakeup);
 	scx_idle_disable();
 	synchronize_rcu();
 
@@ -5367,8 +5371,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		if (((void (**)(void))ops)[i])
 			static_branch_enable(&scx_has_op[i]);
 
-	if (ops->flags & SCX_OPS_ALLOW_QUEUED_WAKEUP)
-		static_branch_enable(&scx_ops_allow_queued_wakeup);
 	if (scx_ops.cpu_acquire || scx_ops.cpu_release)
 		scx_ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
 
diff --git a/kernel/sched/ext.h b/kernel/sched/ext.h
index 1bda96b19a1b..3053cdd61eb9 100644
--- a/kernel/sched/ext.h
+++ b/kernel/sched/ext.h
@@ -21,6 +21,7 @@ void scx_rq_activate(struct rq *rq);
 void scx_rq_deactivate(struct rq *rq);
 int scx_check_setscheduler(struct task_struct *p, int policy);
 bool task_should_scx(int policy);
+bool scx_allow_ttwu_queue(const struct task_struct *p);
 void init_sched_ext_class(void);
 
 static inline u32 scx_cpuperf_target(s32 cpu)
@@ -36,13 +37,6 @@ static inline bool task_on_scx(const struct task_struct *p)
 	return scx_enabled() && p->sched_class == &ext_sched_class;
 }
 
-static inline bool scx_allow_ttwu_queue(const struct task_struct *p)
-{
-	return !scx_enabled() ||
-		static_branch_likely(&scx_ops_allow_queued_wakeup) ||
-		p->sched_class != &ext_sched_class;
-}
-
 #ifdef CONFIG_SCHED_CORE
 bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 		   bool in_fi);
-- 
2.49.0

