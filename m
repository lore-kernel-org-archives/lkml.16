Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E6C13D531
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743793929; cv=none; b=Z5HjwqWsbNaasOGrmhlWNdg4jqi6PfuKyqrMUweLuZ+jELBHPkJN1SdjdEqOqe/0TAIm5D8p3rCYjPxfg/VBvkzk2ic860MX62Km7+HW5gFPoFmjESmUBvlFea7Z51ekHiaCsTuuXY2okAPuVgEYz5/xS0VyrZ7E9RJdbPN9ozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743793929; c=relaxed/simple;
	bh=M8mA04qIj++/2rLS7Wzuz9LkobWBYGEwrJTGJFsBVo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RI1RBDNkXPbLsaE1LVkNZiFqcWIZZ5y0rF/vYo2CWN/BbAIp+YpUiWwmoaDwlDayjXpdTciM6n7AD9r0ev9oryuGNunpLKZm57IFMy5DzxPlIcRVeMPWKNuGEVYujfqezKbpMC1f1atYt1lHIjczJd2H0UW4A93+0Vp0jETOmOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEr8MJ6x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEr8MJ6x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58B4C4CEDD;
	Fri,  4 Apr 2025 19:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743793929;
	bh=M8mA04qIj++/2rLS7Wzuz9LkobWBYGEwrJTGJFsBVo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sEr8MJ6xdjFZOoYNIXFfQAQ5nGX5+4j+ZyUgNqZMTSIgNUwG2AFzdp6CfYWM8LXJE
	 mVKEz2zChNH08sJvYLOb6z9lOwy0bkwsnSw4jLazZKOhQq3SE1tKfxV41JmOnC/TrO
	 iyCSiuZU4YYorIK9FD0Q1ZhS58vrLaTgP7ItvJjyFtPZZHLAQWqDMISmEr+eBs9Gws
	 tkrw0B/QvqrO2gHoMYVMKyEASBCSeSsgovXIrhQM61gWzzRwlxx7ohjkTuu8Tpo+bw
	 FaxmutS0G4NPrl2guwg8ikqmliuFs5fQu1hSq+tdxyI815NNnmuVXc+3gpEBECCCrS
	 IyXFrVOJqRdOA==
Date: Fri, 4 Apr 2025 09:12:08 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: [PATCH 6/5] sched_ext: Drop "ops" from SCX_OPS_TASK_ITER_BATCH
Message-ID: <Z_AvCG5HcMV6b_xT@slm.duckdns.org>
References: <20250403225026.838987-1-tj@kernel.org>
 <Z--NLGOGQe_9xULR@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z--NLGOGQe_9xULR@gpd3>

The tag "ops" is used for two different purposes. First, to indicate that
the entity is directly related to the operations such as flags carried in
sched_ext_ops. Second, to indicate that the entity applies to something
global such as enable or bypass states. The second usage is historical and
causes confusion rather than clarifying anything. For example,
scx_ops_enable_state enums are named SCX_OPS_* and thus conflict with
scx_ops_flags. Let's drop the second usages.

Drop "ops" from SCX_OPS_TASK_ITER_BATCH.

Signed-off-by: Tejun Heo <tj@kernel.org>
Suggested-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -26,7 +26,7 @@ enum scx_consts {
 	 * Iterating all tasks may take a while. Periodically drop
 	 * scx_tasks_lock to avoid causing e.g. CSD and RCU stalls.
 	 */
-	SCX_OPS_TASK_ITER_BATCH		= 32,
+	SCX_TASK_ITER_BATCH		= 32,
 };
 
 enum scx_exit_kind {
@@ -1401,15 +1401,15 @@ static void scx_task_iter_stop(struct sc
  * @iter: iterator to walk
  *
  * Visit the next task. See scx_task_iter_start() for details. Locks are dropped
- * and re-acquired every %SCX_OPS_TASK_ITER_BATCH iterations to avoid causing
- * stalls by holding scx_tasks_lock for too long.
+ * and re-acquired every %SCX_TASK_ITER_BATCH iterations to avoid causing stalls
+ * by holding scx_tasks_lock for too long.
  */
 static struct task_struct *scx_task_iter_next(struct scx_task_iter *iter)
 {
 	struct list_head *cursor = &iter->cursor.tasks_node;
 	struct sched_ext_entity *pos;
 
-	if (!(++iter->cnt % SCX_OPS_TASK_ITER_BATCH)) {
+	if (!(++iter->cnt % SCX_TASK_ITER_BATCH)) {
 		scx_task_iter_unlock(iter);
 		cond_resched();
 		scx_task_iter_relock(iter);
