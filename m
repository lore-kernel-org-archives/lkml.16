Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60850255E32
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451953; cv=none; b=tyRiTw7a7FPxsq+IIqYZNJQ2V4Lveg5j7VuFLLCPTbkBMRhjzNKYmSLcsnEXA+9n0qZcParCnQkAFdFgYBoGNNHbGPDe+ljhqCoIuOhzbnJyOmgLXl84bOwaHHBz6mIOObrm8gJ11kAKBf5axsCB6gXy/FQtejBCRo4XDoOCZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451953; c=relaxed/simple;
	bh=y2P+TCKKP2i7yCRzbPx6nsGdprG8ljO+SwtcpYfiju4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuIHGrwhcIkHrwLHVn42C099Vs+ZRpRKhcQa2HFicOmtCvJLrUmasCOheux0POn66234oKg/EM2suoMdhsGTLpVaXGW9p5nSZCFr5BrJNZJ9+oR1AoobhnigQfervkNYJLQSaPgHc82VuTuM0e7fL1+eFSDrF1254G7nGjueKA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4GKUrcx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4GKUrcx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA0DC4CEE2;
	Wed, 23 Apr 2025 23:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451953;
	bh=y2P+TCKKP2i7yCRzbPx6nsGdprG8ljO+SwtcpYfiju4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J4GKUrcxzkfSodgMAmfd7gTV5r36eRnoMFSPRH63XUthWrOsMfyp3rUYN2QbfmNAH
	 1/w6YlFlderWF428gRd7xyOYS5Tlr6ni0Q3QgVEjm0ljkIRj1C5DChh3MIOtY+prel
	 m7pyCMFJGmYom9ZrQTHxRiujEO1lbEBDaBk343iFNciWKVmiJAf0FxvHn6IrtT3YAn
	 WDnp+uGaj/X0iI1ChrY6ZpmdBDKineLJap/09c+ImOZjahB2ltWlE8VmUPt3M+2Q+t
	 TmZGCDjas2QC/sySnNinhFNKciMDM4+WA/GxZiYVMkvyVYYqral6lzzcdv+TsuTs9Y
	 sggc+eF4DRJOA==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 05/12] sched_ext: Factor out scx_alloc_and_add_sched()
Date: Wed, 23 Apr 2025 13:44:43 -1000
Message-ID: <20250423234542.1890867-6-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423234542.1890867-1-tj@kernel.org>
References: <20250423234542.1890867-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More will be moved into scx_sched. Factor out the allocation and kobject
addition path into scx_alloc_and_add_sched().

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 56 +++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 21 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 8ec32c458f16..88a0f6d9cb1e 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -5233,6 +5233,38 @@ static struct kthread_worker *scx_create_rt_helper(const char *name)
 	return helper;
 }
 
+static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
+{
+	struct scx_sched *sch;
+	int ret;
+
+	sch = kzalloc(sizeof(*sch), GFP_KERNEL);
+	if (!sch)
+		return ERR_PTR(-ENOMEM);
+
+	sch->exit_info = alloc_exit_info(ops->exit_dump_len);
+	if (!sch->exit_info) {
+		ret = -ENOMEM;
+		goto err_free_sch;
+	}
+
+	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
+	sch->ops = *ops;
+
+	sch->kobj.kset = scx_kset;
+	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
+	if (ret < 0)
+		goto err_free_ei;
+
+	return sch;
+
+err_free_ei:
+	free_exit_info(sch->exit_info);
+err_free_sch:
+	kfree(sch);
+	return ERR_PTR(ret);
+}
+
 static void check_hotplug_seq(const struct sched_ext_ops *ops)
 {
 	unsigned long long global_hotplug_seq;
@@ -5345,26 +5377,12 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		goto err_unlock;
 	}
 
-	sch = kzalloc(sizeof(*sch), GFP_KERNEL);
-	if (!sch) {
-		ret = -ENOMEM;
+	sch = scx_alloc_and_add_sched(ops);
+	if (IS_ERR(sch)) {
+		ret = PTR_ERR(sch);
 		goto err_unlock;
 	}
 
-	sch->exit_info = alloc_exit_info(ops->exit_dump_len);
-	if (!sch->exit_info) {
-		ret = -ENOMEM;
-		goto err_free;
-	}
-
-	sch->kobj.kset = scx_kset;
-	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
-	if (ret < 0)
-		goto err_free;
-
-	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
-	sch->ops = *ops;
-
 	/*
 	 * Transition to ENABLING and clear exit info to arm the disable path.
 	 * Failure triggers full disabling from here on.
@@ -5562,10 +5580,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	return 0;
 
-err_free:
-	if (sch->exit_info)
-		free_exit_info(sch->exit_info);
-	kfree(sch);
 err_unlock:
 	mutex_unlock(&scx_enable_mutex);
 	return ret;
-- 
2.49.0

