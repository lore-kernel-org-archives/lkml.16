Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13992227EBE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618328; cv=none; b=t5SoyHw/CAti7VQrQiwHJ/nJPdy3FlAXZjWs1SDsbRPGA/BqfkmAWZSL8NH29eKvS2TQqJittVS4KPwiV9X1iJ0GcEXrwefuiwB7t2DGo3JvvdvS5D6YPovANI2wWS+h6lX1aiyyecTWfTpPZuDFH/3KHksZ+JoFd8gv94TihJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618328; c=relaxed/simple;
	bh=A71gdvhjkKEFWHdIDiAC19aXz5gtkAi6+PRVYAbfu0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uy4Fw3AxDYAHuXiB6pAlLyeBcYTBmgPlM5rIHGgjtKPJ50Ej83faZzDKGjV9IpKckszATCsuQl1y2UWt+fukNz0UgoGUC5MujY90Ijtd5QZxysEf2nK5RvpJT6H4lDkgOjWP/oc99T/u74Im21YOFffRrebBZZmPqlwzB/atvUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmoNb0EP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmoNb0EP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544A0C4CEE9;
	Fri, 25 Apr 2025 21:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745618326;
	bh=A71gdvhjkKEFWHdIDiAC19aXz5gtkAi6+PRVYAbfu0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HmoNb0EP82eTZkHg0D0D92X2WCIrxaWGOY49D68iRTlN2LYEydA2QoGVIObsMe4lC
	 W3SplyQvKmwJKnHCRTazkZ/vgYA204GfP/Pk719oKQRjpUj2bzavoP2qGym9vz2kk6
	 6Dd3nfdVl/AxgHvLEkLWNQcmbPj75o4LrQd4mNRJk2nScTrvnR9xQ1QatSTXOTb4gW
	 oO8z14NiHaTS1zlt2Ueo9VfwQgdYOq1PBKoJUk7XFafcg2mfhKMI/8C7FW/nm7CJr7
	 PSIfVt+6ykOT9ipGHR4ywZ+wSwZ/eWl+0+aW0EwY/v/sA8hcrD9EMq1yY085t9Y0Ma
	 rWYJBuLniWERQ==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 02/12] sched_ext: Avoid NULL scx_root deref through SCX_HAS_OP()
Date: Fri, 25 Apr 2025 11:58:17 -1000
Message-ID: <20250425215840.2334972-3-tj@kernel.org>
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

