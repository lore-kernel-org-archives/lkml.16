Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A828222D78E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618330; cv=none; b=goqfb9PmFpHDGW4JnkGrqcYklLV8cvAIH54V1/yYoC2gmegV91nsbDZU54ofvw64N2dFG0GDIxye0jcINy54ybzFUBNK7rRpLR7OmQNZcQaTHM8eQ0B38k8pkSzjpfUbAhi9sflAdlvyGUQygqsDvgJ2HkZTAfWjET6J5QqB0gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618330; c=relaxed/simple;
	bh=t9AdZrfcJn74TsogZtWo7+syNvH6UpmTPAk3/s1NP1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAo72j2kRrC1kqv+2893CwTfiL2O7klchnJNUiGzB/KTvRitGor6YKRi/aFDSy1E1pmkESNwJvrHXkZG2nZ9SwnZg8tqz4i5fSkDuckE7fgTDeCnFZvGJKlLq9I/2nS6YqhKhK84wo08912paD+o62mkFO8/fI3jTlMaUPni+l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7V19e2F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7V19e2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3087C4CEF2;
	Fri, 25 Apr 2025 21:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745618330;
	bh=t9AdZrfcJn74TsogZtWo7+syNvH6UpmTPAk3/s1NP1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y7V19e2FZhCgL5YVLULsRFEcvxs9MGyjJERM4YGKXOyC6cKWVUSrrraLEn4QGum0A
	 EKLxQ3vc4wFUHwzhgd2xvzGUYKnNDUHzEi8fDRdUxMUkGr4yQZN61fobZaeK+hAcVJ
	 7V7GVrpjnxc0E/0YKs6fvy44weV/T1mYb/AgiSzjbNWjbKEAf7iWwtYnFbZuBKvO4H
	 sKUqj19gowFfjsJaWZmi6x0lTPLAA/z/rIrCk4mXUqX6SdBif0Z/kdqLcZ5AKomxys
	 6xd1zbkeJ7hS02J3u390/XcTyGu5Dz0fCwQVdbrlWiGa6RbEgcrnu+EA16uIpDgN2U
	 AhUgnxL3IJgBg==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 05/12] sched_ext: Factor out scx_alloc_and_add_sched()
Date: Fri, 25 Apr 2025 11:58:20 -1000
Message-ID: <20250425215840.2334972-6-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425215840.2334972-1-tj@kernel.org>
References: <20250425215840.2334972-1-tj@kernel.org>
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
 kernel/sched/ext.c | 58 ++++++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index e22717c435ff..bd2d45196bec 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -5236,6 +5236,39 @@ static struct kthread_worker *scx_create_rt_helper(const char *name)
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
+	ops->priv = sch;
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
@@ -5348,27 +5381,12 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
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
-	ops->priv = sch;
-
 	/*
 	 * Transition to ENABLING and clear exit info to arm the disable path.
 	 * Failure triggers full disabling from here on.
@@ -5566,10 +5584,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
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

