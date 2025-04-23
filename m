Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F163242D88
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451950; cv=none; b=Ban4d6RfQylywpgTaaflrk6fHBziEKQlGqi6FljhMnNv1MTr1YIUQa7ivW9Y4ZiU38Vza3TpZsA6KP/1SKU27aReG1tY800Xd7Nywg41wP0dhpCWCjbuTsACPdbPLkca+5cwqUBbsu3jlXqgKt0g3K9C0k8DVTDY9ALtkrFTDmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451950; c=relaxed/simple;
	bh=A71gdvhjkKEFWHdIDiAC19aXz5gtkAi6+PRVYAbfu0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPlsVuSm4V8JiWQVTTY7f4QUfSFJKcaBbRlP0LdTlJyfV0d9lTOSxbFn0iQHyj4GTdQ0uEYzDrr3U5jJQx28HJGwzMf7IRVe7l5FYdZJnnv/ywn4GeNmvmVfIQjw3gYgVlDF/d6KCxhCjZ2mCykFLzgAxA38/wP/2/u6VhTUQeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrtGirQA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrtGirQA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE16CC4CEE2;
	Wed, 23 Apr 2025 23:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451950;
	bh=A71gdvhjkKEFWHdIDiAC19aXz5gtkAi6+PRVYAbfu0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XrtGirQAbcwOZKmD9NrSvGk2FWBjpcvJs4a4ifRCv1xN14qfNbpq/6kiWRf0SDd2t
	 YukMOLFd2+bFh+HvmlG+wJm2U6QRsV++7vkhoUO9/h4TeiXdn5/qBMZvCy4e5SExND
	 1T8PwH0v89c43SJhSdPgihwFXCfBqMaosgZ9VjzAgu8MKRTl+m5gQZaFl5GQ3jYKTC
	 bIBlV2F8rtKWxoEw1rgsAlsvz+noIa+/37SPQATkjKjtyGVL93S0qNVjYHAzpt9luw
	 RTWrm0kC5VGt/QMRn5ebg5oE29vrxL6okhzgPv8hirIWamI4+sMmeBPOw+DMxyC5RS
	 jSLXFVKBxvlTQ==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 02/12] sched_ext: Avoid NULL scx_root deref through SCX_HAS_OP()
Date: Wed, 23 Apr 2025 13:44:40 -1000
Message-ID: <20250423234542.1890867-3-tj@kernel.org>
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

SCX_HAS_OP() tests scx_root->has_op bitmap. The bitmap is currently in a
statically allocated struct scx_sched and initialized while loading the BPF
scheduler and cleared while unloading, and thus can be tested anytime.
However, scx_root will be switched to dynamic allocation and thus won't
always be deferenceable.

Most usages of SCX_HAS_OP() are already protected by scx_enabled() either
directly or indirectly (e.g. through a task which is on SCX). However, there
are a couple places that could try to dereference NULL scx_root. Update them
so that scx_root is guaranteed to be valid before SCX_HAS_OP() is called.

- In handle_hotplug(), test whether scx_root is NULL before doing anything
  else. This is safe because scx_root updates will be protected by
  cpus_read_lock().

- In scx_tg_offline(), test scx_cgroup_enabled before invoking SCX_HAS_OP(),
  which should guarnatee that scx_root won't turn NULL. This is also in line
  with other cgroup operations. As the code path is synchronized against
  scx_cgroup_init/exit() through scx_cgroup_rwsem, this shouldn't cause any
  behavior differences.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 975f6963a01b..ad392890d2dd 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3498,6 +3498,14 @@ static void handle_hotplug(struct rq *rq, bool online)
 
 	atomic_long_inc(&scx_hotplug_seq);
 
+	/*
+	 * scx_root updates are protected by cpus_read_lock() and will stay
+	 * stable here. Note that we can't depend on scx_enabled() test as the
+	 * hotplug ops need to be enabled before __scx_enabled is set.
+	 */
+	if (!scx_root)
+		return;
+
 	if (scx_enabled())
 		scx_idle_update_selcpu_topology(&scx_root->ops);
 
@@ -3994,7 +4002,8 @@ void scx_tg_offline(struct task_group *tg)
 
 	percpu_down_read(&scx_cgroup_rwsem);
 
-	if (SCX_HAS_OP(scx_root, cgroup_exit) && (tg->scx_flags & SCX_TG_INITED))
+	if (scx_cgroup_enabled && SCX_HAS_OP(scx_root, cgroup_exit) &&
+	    (tg->scx_flags & SCX_TG_INITED))
 		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, NULL, tg->css.cgroup);
 	tg->scx_flags &= ~(SCX_TG_ONLINE | SCX_TG_INITED);
 
-- 
2.49.0

