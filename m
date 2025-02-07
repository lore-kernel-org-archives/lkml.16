Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7139F19C57C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738961948; cv=none; b=NEMflMibHWvcKw2zWkOSuKhsSmrHEwdUrrKqGYi2Zdg88kpG+1waqNZ0Fj8XlB0s3K42Fkh7v1+7sKOQ9cA/HSC4I3u7KKdFn7Wh0CM2OdkEe/ilEsqbh5T+Z6ZiiQAS+GZTqoWvFmlsrct5Ffmm8ACSXR2Qx94vyHMmpSY6y5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738961948; c=relaxed/simple;
	bh=/zuJEHtIMNeYTS32pJWzsbhEkjIyfBnbzspknKmHfpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avK7FF1L0f5aU+1gZF4UxE2jeFjJadPkJB532Gq7YdnfKceuu3MT0guEdqIAo0STFzdeeZO3ib+5xs3GT+GEY2608LI8y21dfb28VYueFOmk0X5S+v+G+GXcTVfFCZydAdmxyrVEdWwI9MFVGhTTMj71ZWG2ECW4e7/Mp4rCXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knMUfwGO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knMUfwGO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE32CC4CED1;
	Fri,  7 Feb 2025 20:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738961947;
	bh=/zuJEHtIMNeYTS32pJWzsbhEkjIyfBnbzspknKmHfpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knMUfwGO6ipCq2nTclBw/Mv2xNtqVTyuoA1SyXY0/nKoEvf4Su8kw0wdsdVh7nqnn
	 FFTFwPF4X73BJKqxyq3RMEFyORVRfJHyY43K6NAlf2QtelzNteDTnwwiIXashbJBNs
	 3z8D07u8j0jJ5+FN83u4+X7YJ1zeA6w4AwkjudbLUBQbzK61kcRFfxfPrm3O+9DMJ4
	 41m7YCmrZzuB4/7ZnYGdseqvT5FFvUMV9JXf44jJZGbfTO/g6Uls68OkONtfDaxVax
	 NGWnqfCdYv/g8/WYjKxFXnaaPFISMlYayWSg1fLy/7EbDpD2M/XKNiW6BoPZBI8G4r
	 5NFYanv3+1RiA==
Date: Fri, 7 Feb 2025 10:59:06 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: [PATCH sched_ext/for-6.14-fixes 2/2] sched_ext: Fix migration
 disabled handling in targeted dispatches
Message-ID: <Z6Z0GgXetBRy1-X1@slm.duckdns.org>
References: <Z6Zz79AUub1YuHwD@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Zz79AUub1YuHwD@slm.duckdns.org>

A dispatch operation that can target a specific local DSQ -
scx_bpf_dsq_move_to_local() or scx_bpf_dsq_move() - checks whether the task
can be migrated to the target CPU using task_can_run_on_remote_rq(). If the
task can't be migrated to the targeted CPU, it is bounced through a global
DSQ.

task_can_run_on_remote_rq() assumes that the task is on a CPU that's
different from the targeted CPU but the callers doesn't uphold the
assumption and may call the function when the task is already on the target
CPU. When such task has migration disabled, task_can_run_on_remote_rq() ends
up returning %false incorrectly unnecessarily bouncing the task to a global
DSQ.

Fix it by updating the callers to only call task_can_run_on_remote_rq() when
the task is on a different CPU than the target CPU. As this is a bit subtle,
for clarity and documentation:

- Make task_can_run_on_remote_rq() trigger SCHED_WARN_ON() if the task is on
  the same CPU as the target CPU.

- is_migration_disabled() test in task_can_run_on_remote_rq() cannot trigger
  if the task is on a different CPU than the target CPU as the preceding
  task_allowed_on_cpu() test should fail beforehand. Convert the test into
  SCHED_WARN_ON().

Signed-off-by: Tejun Heo <tj@kernel.org>
Fixes: 4c30f5ce4f7a ("sched_ext: Implement scx_bpf_dispatch[_vtime]_from_dsq()")
Fixes: 0366017e0973 ("sched_ext: Use task_can_run_on_remote_rq() test in dispatch_to_local_dsq()")
Cc: stable@vger.kernel.org # v6.12+
---
 kernel/sched/ext.c |   17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -2333,12 +2333,16 @@ static void move_remote_task_to_local_ds
  *
  * - The BPF scheduler is bypassed while the rq is offline and we can always say
  *   no to the BPF scheduler initiated migrations while offline.
+ *
+ * The caller must ensure that @p and @rq are on different CPUs.
  */
 static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
 				      bool trigger_error)
 {
 	int cpu = cpu_of(rq);
 
+	SCHED_WARN_ON(task_cpu(p) == cpu);
+
 	/*
 	 * We don't require the BPF scheduler to avoid dispatching to offline
 	 * CPUs mostly for convenience but also because CPUs can go offline
@@ -2352,8 +2356,11 @@ static bool task_can_run_on_remote_rq(st
 		return false;
 	}
 
-	if (unlikely(is_migration_disabled(p)))
-		return false;
+	/*
+	 * If @p has migration disabled, @p->cpus_ptr only contains its current
+	 * CPU and the above task_allowed_on_cpu() test should have failed.
+	 */
+	SCHED_WARN_ON(is_migration_disabled(p));
 
 	if (!scx_rq_online(rq))
 		return false;
@@ -2457,7 +2464,8 @@ static struct rq *move_task_between_dsqs
 
 	if (dst_dsq->id == SCX_DSQ_LOCAL) {
 		dst_rq = container_of(dst_dsq, struct rq, scx.local_dsq);
-		if (!task_can_run_on_remote_rq(p, dst_rq, true)) {
+		if (src_rq != dst_rq &&
+		    unlikely(!task_can_run_on_remote_rq(p, dst_rq, true))) {
 			dst_dsq = find_global_dsq(p);
 			dst_rq = src_rq;
 		}
@@ -2611,7 +2619,8 @@ static void dispatch_to_local_dsq(struct
 	}
 
 #ifdef CONFIG_SMP
-	if (unlikely(!task_can_run_on_remote_rq(p, dst_rq, true))) {
+	if (src_rq != dst_rq &&
+	    unlikely(!task_can_run_on_remote_rq(p, dst_rq, true))) {
 		dispatch_enqueue(find_global_dsq(p), p,
 				 enq_flags | SCX_ENQ_CLEAR_OPSS);
 		return;
