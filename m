Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164A121C163
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068006; cv=none; b=F96QgxiJ8bPgIVG/BhBV8QJADCqq4MnKMPJqbN29NIsacRsEUeypb4eC8j0wLqYJHYMs2LOb9IRWFWguG1AW3Y6KjBep+Zot/KkQvAojIRYaEmNkFOWPtdJZE08s5KcTFMb6rqpnXFa9+N6m+r/xEd4dpj7uoCu7M7HdvIzn16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068006; c=relaxed/simple;
	bh=Ell+TiAR+gMi4isFjx8EW+xy21+P6XYWO/FJdjmF9mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mba6htXsc4S3AT5Z6vzsusknSYuzmffTKB13dYVGilBbOPukk/+ZCS+vigo1xHe+5AGWe046fYK9f3Jo0adES6KZd+fLuEHUgvdVholyHo5QhVLp4S8pEG9uuxUqeMdoje8yDrSGTQZhZBN7E6Qz0PAhuuxi6q60G+n7B+T/ww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbGDQoWy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbGDQoWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD8EC4CEEC;
	Mon,  7 Apr 2025 23:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068005;
	bh=Ell+TiAR+gMi4isFjx8EW+xy21+P6XYWO/FJdjmF9mg=;
	h=Date:From:To:Cc:Subject:From;
	b=LbGDQoWyLig5aU7qQDOpT7DczpCp8SmP0/jnFWSa1FW8Zerb8CNviKc/fGl0uf2DX
	 KxuBtehoqxYWyH1Gci4G79MEwd8WA8f1E8uj52VGmb2Ng9ZXszdXY1d8lG2DLSOCS/
	 ArTlWHhRUWTsQVfeXwznjhUpE9wMmsPp8KUQ3oEpEME8DCOTSw3KmtA/fgOGx6arIv
	 uf7kX/DjLE3GfIjmCnwTniAXQkP7hrPQQeyKoTkLWJLZti9FQPHgotprj9qZRbIrON
	 bmF7p96ZqdAdzO9Dc3X0ZESoj2sNSvQXp713T+cLjkohyXzt2irMqxrvMap+uXCMUg
	 6j4IjYpZmR7hA==
Date: Mon, 7 Apr 2025 13:20:04 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH sched_ext/for-6.16] sched_ext: Remove cpu.weight / cpu.idle
 unimplemented warnings
Message-ID: <Z_RdpDkLCXm140RT@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

sched_ext generates warnings when cpu.weight / cpu.idle are set to
non-default values if the BPF scheduler doesn't implement weight support.
These warnings don't provide much value while adding constant annoyance. A
BPF scheduler may not implement any particular behavior and there's nothing
particularly special about missing cgroup weight support. Drop the warnings.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c |   40 +---------------------------------------
 1 file changed, 1 insertion(+), 39 deletions(-)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3896,34 +3896,6 @@ bool scx_can_stop_tick(struct rq *rq)
 
 DEFINE_STATIC_PERCPU_RWSEM(scx_cgroup_rwsem);
 static bool scx_cgroup_enabled;
-static bool cgroup_warned_missing_weight;
-static bool cgroup_warned_missing_idle;
-
-static void scx_cgroup_warn_missing_weight(struct task_group *tg)
-{
-	if (scx_enable_state() == SCX_DISABLED || cgroup_warned_missing_weight)
-		return;
-
-	if ((scx_ops.flags & SCX_OPS_HAS_CGROUP_WEIGHT) || !tg->css.parent)
-		return;
-
-	pr_warn("sched_ext: \"%s\" does not implement cgroup cpu.weight\n",
-		scx_ops.name);
-	cgroup_warned_missing_weight = true;
-}
-
-static void scx_cgroup_warn_missing_idle(struct task_group *tg)
-{
-	if (!scx_cgroup_enabled || cgroup_warned_missing_idle)
-		return;
-
-	if (!tg->idle)
-		return;
-
-	pr_warn("sched_ext: \"%s\" does not implement cgroup cpu.idle\n",
-		scx_ops.name);
-	cgroup_warned_missing_idle = true;
-}
 
 int scx_tg_online(struct task_group *tg)
 {
@@ -3933,8 +3905,6 @@ int scx_tg_online(struct task_group *tg)
 
 	percpu_down_read(&scx_cgroup_rwsem);
 
-	scx_cgroup_warn_missing_weight(tg);
-
 	if (scx_cgroup_enabled) {
 		if (SCX_HAS_OP(cgroup_init)) {
 			struct scx_cgroup_init_args args =
@@ -4072,9 +4042,7 @@ void scx_group_set_weight(struct task_gr
 
 void scx_group_set_idle(struct task_group *tg, bool idle)
 {
-	percpu_down_read(&scx_cgroup_rwsem);
-	scx_cgroup_warn_missing_idle(tg);
-	percpu_up_read(&scx_cgroup_rwsem);
+	/* TODO: Implement ops->cgroup_set_idle() */
 }
 
 static void scx_cgroup_lock(void)
@@ -4268,9 +4236,6 @@ static int scx_cgroup_init(void)
 
 	percpu_rwsem_assert_held(&scx_cgroup_rwsem);
 
-	cgroup_warned_missing_weight = false;
-	cgroup_warned_missing_idle = false;
-
 	/*
 	 * scx_tg_on/offline() are excluded through scx_cgroup_rwsem. If we walk
 	 * cgroups and init, all online cgroups are initialized.
@@ -4280,9 +4245,6 @@ static int scx_cgroup_init(void)
 		struct task_group *tg = css_tg(css);
 		struct scx_cgroup_init_args args = { .weight = tg->scx_weight };
 
-		scx_cgroup_warn_missing_weight(tg);
-		scx_cgroup_warn_missing_idle(tg);
-
 		if ((tg->scx_flags &
 		     (SCX_TG_ONLINE | SCX_TG_INITED)) != SCX_TG_ONLINE)
 			continue;
