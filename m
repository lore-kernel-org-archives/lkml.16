Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D311ADFEB
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739004156; cv=none; b=cG7E6Sn7OdubLzwVfOgexx93tNeYeqAtMkcqhiZooLoUknW/1Frgnydo4yp3QpTOy8A0sWtt+IEodI3Dw7NhBVeHBSFpd7p8eorceFG20BYviJPwe43maR1XT/aneqlVVjTDZ7jASfbOgm+H0ht5jDlCzbWceYIm3elfTrcnFA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739004156; c=relaxed/simple;
	bh=kF5bjdvcA+gIMg0oUbvXEgjGHD91ai3ouveRiV4eZGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1HaCu43cY7k8Ss+cFmuZ6mYs9hvlOBDTzRCzz5XaqsU9p14W/UTZyVcka8K9IDZP2MJkkerlVKcPtMV6j7HoY+BGfW3SxEQw9s9UukeAMzGyzEa4gztLLdO3VmsX0P/Q21na49i7NDCXLzD0KfEsv7Rt/fQWi53C7B37mB2fxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKqHwd5V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKqHwd5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEF2C4CEDF;
	Sat,  8 Feb 2025 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739004156;
	bh=kF5bjdvcA+gIMg0oUbvXEgjGHD91ai3ouveRiV4eZGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tKqHwd5VGKMmxE/3D7n2/LUZTUSPagPSyuDDYSnI7dkCRWGZ65XyXLAkf1Yi0+dkc
	 4ZUceJK5RsWpTQsTE4yAHCXEyn07m7rytfPbe9blG/uUJI73jz8r/6FG+JyG9MxOzT
	 D1cvUQpe7U8Kg/HqozrfMT2ob5fABA9aJFN/fQTwSzKsAZ1A9cyPs/Cpify1IrEvUq
	 SjaXEgIooWs+V1v3ti7j5duzdsD4zTvsujzVmhPnpe+5BnouwyfTGPkT6hH+144Jt6
	 IKDxlZBPKyogMdI3UgAFb2gCxHtvUWSMhJ2rTzA/Dglc4CHMF6kRO1C8ZYOv5PNE+m
	 YDh2jY53zs0ug==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 3/3] sched_ext: Add SCX_EV_ENQ_SKIP_MIGRATION_DISABLED
Date: Fri,  7 Feb 2025 22:42:17 -1000
Message-ID: <20250208084229.1274399-4-tj@kernel.org>
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

Count the number of times a migration disabled task is automatically
dispatched to its local DSQ.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 310db8484b77..b2378e29f45a 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1483,6 +1483,13 @@ struct scx_event_stats {
 	 */
 	u64		SCX_EV_ENQ_SKIP_EXITING;
 
+	/*
+	 * If SCX_OPS_ENQ_MIGRATION_DISABLED is not set, the number of times a
+	 * migration disabled task skips ops.enqueue() and is dispatched to its
+	 * local DSQ.
+	 */
+	u64		SCX_EV_ENQ_SKIP_MIGRATION_DISABLED;
+
 	/*
 	 * The total number of tasks enqueued (or pick_task-ed) with a
 	 * default time slice (SCX_SLICE_DFL).
@@ -2119,8 +2126,10 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 
 	/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
 	if (!static_branch_unlikely(&scx_ops_enq_migration_disabled) &&
-	    is_migration_disabled(p))
+	    is_migration_disabled(p)) {
+		__scx_add_event(SCX_EV_ENQ_SKIP_MIGRATION_DISABLED, 1);
 		goto local;
+	}
 
 	if (!SCX_HAS_OP(enqueue))
 		goto global;
@@ -5067,6 +5076,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
 	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
+	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED);
 	scx_dump_event(s, &events, SCX_EV_ENQ_SLICE_DFL);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_DURATION);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_DISPATCH);
@@ -7210,6 +7220,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_EXITING);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SLICE_DFL);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DURATION);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DISPATCH);
-- 
2.48.1

