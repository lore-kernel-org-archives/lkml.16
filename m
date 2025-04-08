Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6DA256C71
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153584; cv=none; b=ulZf83HP7Hh9qrm+0p+28C/74a1saSpXlVxMI4MjlLqXP2kSsYN4nsTbucmmOlZBGK8WsxZ4F/Rl55ip1xjRbM7PDISObcuAaYfpgtma6gnYp/UUpAybuRSJ93AcytqRmpUOICPl+dlto0a8Y+IM4lyfRDqJ0wJ5uQtpmgdE4io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153584; c=relaxed/simple;
	bh=87HXKthJ9DcWAWsCYfLiTR83KvCQwFMhYPTbnDWHapk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0f1rAzi5KRVu7M8hx2y0znYO120pGMcXEFD4QaCA+kcBXadEDjRC6rrx+VpDM0kjuPgmTFdEG+gPQkss2fZXmhsbb7wbvLTbztafTcWmQOG5nC4ybXl5fdqhOG88b+WyLCImFNl7tG0FCwb24i33j348hIyIl2fxVkpE0KXwHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWJFlAkY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWJFlAkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405A8C4CEE5;
	Tue,  8 Apr 2025 23:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744153583;
	bh=87HXKthJ9DcWAWsCYfLiTR83KvCQwFMhYPTbnDWHapk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HWJFlAkYuQaOqlkMZ/N6000Qx9UvTlslD/FhkJ7XkAtHzCRHiXw9e1h92mc+nPcRU
	 lcg+lXUbwurBv7oSZ7KiFD+GiRW2CqewkPbipPTrFmSfmNGqBHKc3yKTFDttG5kkg+
	 lsu0g6MT02HpDsHxN2FEc+d54tSgE69z6lUNo6GwdY2pPiAkeGPkj+wT9e0WWwVekP
	 bBpcpYrs4+cl1Z8ddm/zY6vn+1/bbVSowfOU1kWI0ghVTRTjFHIOHH17Re0WIB4YzU
	 Ayz45tvXxsGMyGBasp3ornFVnckgCuR+S6GCHwXKaoO9q/bSj5tn5ojRRxbOLmEPae
	 lTaus4jW6XW4w==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 2/5] sched_ext: Remove scx_ops_enq_* static_keys
Date: Tue,  8 Apr 2025 13:06:02 -1000
Message-ID: <20250408230616.2369765-3-tj@kernel.org>
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

scx_ops_enq_last/exiting/migration_disabled are used to encode the
corresponding SCX_OPS_ flags into static_keys. These flags aren't hot enough
for static_key usage to make any meaningful difference and are made
static_keys mostly because there was no reason not to. However, global
static_keys can't work with the planned hierarchical multiple scheduler
support. Remove the static_keys and test the ops flags directly.

In repeated hackbench runs before and after static_keys removal on an AMD
Ryzen 3900X, I couldn't tell any measurable performance difference.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 022343518f99..1e685e77b5e4 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -924,9 +924,6 @@ static struct sched_ext_ops scx_ops;
 static bool scx_warned_zero_slice;
 
 DEFINE_STATIC_KEY_FALSE(scx_ops_allow_queued_wakeup);
-static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_last);
-static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_exiting);
-static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_migration_disabled);
 static DEFINE_STATIC_KEY_FALSE(scx_ops_cpu_preempt);
 
 static struct static_key_false scx_has_op[SCX_OPI_END] =
@@ -2144,14 +2141,14 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 		goto direct;
 
 	/* see %SCX_OPS_ENQ_EXITING */
-	if (!static_branch_unlikely(&scx_ops_enq_exiting) &&
+	if (!(scx_ops.flags & SCX_OPS_ENQ_EXITING) &&
 	    unlikely(p->flags & PF_EXITING)) {
 		__scx_add_event(SCX_EV_ENQ_SKIP_EXITING, 1);
 		goto local;
 	}
 
 	/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
-	if (!static_branch_unlikely(&scx_ops_enq_migration_disabled) &&
+	if (!(scx_ops.flags & SCX_OPS_ENQ_MIGRATION_DISABLED) &&
 	    is_migration_disabled(p)) {
 		__scx_add_event(SCX_EV_ENQ_SKIP_MIGRATION_DISABLED, 1);
 		goto local;
@@ -3022,8 +3019,8 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	 * Didn't find another task to run. Keep running @prev unless
 	 * %SCX_OPS_ENQ_LAST is in effect.
 	 */
-	if (prev_on_rq && (!static_branch_unlikely(&scx_ops_enq_last) ||
-	     scx_rq_bypassing(rq))) {
+	if (prev_on_rq &&
+	    (!(scx_ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
 		rq->scx.flags |= SCX_RQ_BAL_KEEP;
 		__scx_add_event(SCX_EV_DISPATCH_KEEP_LAST, 1);
 		goto has_tasks;
@@ -3228,7 +3225,7 @@ static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
 		 * which should trigger an explicit follow-up scheduling event.
 		 */
 		if (sched_class_above(&ext_sched_class, next->sched_class)) {
-			WARN_ON_ONCE(!static_branch_unlikely(&scx_ops_enq_last));
+			WARN_ON_ONCE(!(scx_ops.flags & SCX_OPS_ENQ_LAST));
 			do_enqueue_task(rq, p, SCX_ENQ_LAST, -1);
 		} else {
 			do_enqueue_task(rq, p, 0, -1);
@@ -4728,9 +4725,6 @@ static void scx_disable_workfn(struct kthread_work *work)
 	for (i = SCX_OPI_BEGIN; i < SCX_OPI_END; i++)
 		static_branch_disable(&scx_has_op[i]);
 	static_branch_disable(&scx_ops_allow_queued_wakeup);
-	static_branch_disable(&scx_ops_enq_last);
-	static_branch_disable(&scx_ops_enq_exiting);
-	static_branch_disable(&scx_ops_enq_migration_disabled);
 	static_branch_disable(&scx_ops_cpu_preempt);
 	scx_idle_disable();
 	synchronize_rcu();
@@ -5372,12 +5366,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	if (ops->flags & SCX_OPS_ALLOW_QUEUED_WAKEUP)
 		static_branch_enable(&scx_ops_allow_queued_wakeup);
-	if (ops->flags & SCX_OPS_ENQ_LAST)
-		static_branch_enable(&scx_ops_enq_last);
-	if (ops->flags & SCX_OPS_ENQ_EXITING)
-		static_branch_enable(&scx_ops_enq_exiting);
-	if (ops->flags & SCX_OPS_ENQ_MIGRATION_DISABLED)
-		static_branch_enable(&scx_ops_enq_migration_disabled);
 	if (scx_ops.cpu_acquire || scx_ops.cpu_release)
 		static_branch_enable(&scx_ops_cpu_preempt);
 
-- 
2.49.0

