Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49681A76AE
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739004155; cv=none; b=FOudnabjBW3Wqh+KesOe5Mpkn03Sab2gsNl31qOJRKPQ5CxmH71JsJMPqaHAzut2DzHd7oyRdeN1nBX+sddQZGNPkBmLfKv9aFza2zzHnbrez79v/UECX8IQCaqnIZfWWE7JAuxG5VgaSQ45X8cibND8cmsegryqTjRBfixNBUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739004155; c=relaxed/simple;
	bh=20BovWoI6b08dCzBk092jYVsgDh7ujSmy61TnLdtpTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1p2KRe8ElabMtU9xQ/+ZZbRCifmi99IOub7GsTgzIGSAKXn1HZFrayPkUB7OD2o3ql/dwVEEdeNPEQK82+QhUaZzVo9kSgQuz5EvNq6E5cCDzCFeuAe1quDJxMOiNXHGZpziWQBOJDXqnuwUUXQEGqI29cDjN8SKZ/BSZOgu/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCh1LoaU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCh1LoaU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C79C4CED6;
	Sat,  8 Feb 2025 08:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739004155;
	bh=20BovWoI6b08dCzBk092jYVsgDh7ujSmy61TnLdtpTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HCh1LoaUGeXtN09fhwce1tiqgtEa0NZShjLC8QvzG5P2M9SbdSuUs30JUPVuqThzj
	 xJRc7Eg0GTFtt0c4yyIsiiBa4VAb2rE0Bm3RtzwKdgI2OKu9fZBQPq4SuTij8w10FZ
	 S+blMAiqPqDMOYDvgaiUn+LLtHKKk8U8YbzO292DvqNo3Le2ww3PGXLgH0dEDl/vRv
	 4nKs/PRcYSNo3wYEzDG3lR9AHnheo9FyC53uq5hP1RDtYOJ21LlMwDZpR4EuPqqYQ6
	 TyqcXYdfmmyiCS9wv4aht+TGCVM5VjtCEP7yPdC5+yMozT6PKP9mYLBR0uR6TOvCaR
	 kLtdQ61m4mwBg==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 2/3] sched_ext: Count SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE in the right spot
Date: Fri,  7 Feb 2025 22:42:16 -1000
Message-ID: <20250208084229.1274399-3-tj@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208084229.1274399-1-tj@kernel.org>
References: <20250208084229.1274399-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE wasn't quite right in two aspects:

- It counted both migration disabled and offline events.

- It didn't count events from scx_bpf_dsq_move() path.

Fix it by moving the counting into task_can_run_on_remote_rq() which is
shared by both paths and can distinguish the different rejection conditions.
The argument @trigger_error is renamed to @enforce as it now does more than
just triggering error.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 5dfcba6adcda..310db8484b77 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -2431,7 +2431,7 @@ static void move_remote_task_to_local_dsq(struct task_struct *p, u64 enq_flags,
  * The caller must ensure that @p and @rq are on different CPUs.
  */
 static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
-				      bool trigger_error)
+				      bool enforce)
 {
 	int cpu = cpu_of(rq);
 
@@ -2444,7 +2444,7 @@ static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
 	 * picked CPU is outside the allowed mask.
 	 */
 	if (!task_allowed_on_cpu(p, cpu)) {
-		if (trigger_error)
+		if (enforce)
 			scx_ops_error("SCX_DSQ_LOCAL[_ON] verdict target cpu %d not allowed for %s[%d]",
 				      cpu_of(rq), p->comm, p->pid);
 		return false;
@@ -2456,8 +2456,11 @@ static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
 	 */
 	SCHED_WARN_ON(is_migration_disabled(p));
 
-	if (!scx_rq_online(rq))
+	if (!scx_rq_online(rq)) {
+		if (enforce)
+			__scx_add_event(SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, 1);
 		return false;
+	}
 
 	return true;
 }
@@ -2527,7 +2530,7 @@ static bool consume_remote_task(struct rq *this_rq, struct task_struct *p,
 }
 #else	/* CONFIG_SMP */
 static inline void move_remote_task_to_local_dsq(struct task_struct *p, u64 enq_flags, struct rq *src_rq, struct rq *dst_rq) { WARN_ON_ONCE(1); }
-static inline bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq, bool trigger_error) { return false; }
+static inline bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq, bool enforce) { return false; }
 static inline bool consume_remote_task(struct rq *this_rq, struct task_struct *p, struct scx_dispatch_q *dsq, struct rq *task_rq) { return false; }
 #endif	/* CONFIG_SMP */
 
@@ -2717,7 +2720,6 @@ static void dispatch_to_local_dsq(struct rq *rq, struct scx_dispatch_q *dst_dsq,
 	    unlikely(!task_can_run_on_remote_rq(p, dst_rq, true))) {
 		dispatch_enqueue(find_global_dsq(p), p,
 				 enq_flags | SCX_ENQ_CLEAR_OPSS);
-		__scx_add_event(SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, 1);
 		return;
 	}
 
-- 
2.48.1

