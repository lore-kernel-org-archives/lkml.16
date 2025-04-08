Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EAE255E31
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153581; cv=none; b=hF358/W8UtHtXRGh/qxfhnQHkeo8bNNoFew00fiqg4B1r0pPGRld8lPNilJz5GzdZhHVVvrGVGWwjNuqyoEy6PLvbmYNeQMV21tEXBH68FoFcubayUW5XlWPdjvtLOpvP2uEfl7A23mEOHXTRa1gR9bixEExE9PjcxwdiuiLHNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153581; c=relaxed/simple;
	bh=5CyHvGgUcGvlnMG9eAcd0d6rQs0FylvJNKMxaT5iMiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUxvG4EqfGHiWZcquWH17x5+dXmI9MEg4mHFq7awa2UvPme1csWdxvtTX6oIMRwhDhEWv6Dy1rJkgj4GU975HUlpNvbXwYBM27SKgfK01XgtOYNW7FIHdif5fTPgqVLOpbQ+Ri9VlJ9VPZPNk/jfNbU4g2AhJ795a94h5TlP8SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUJcRHJX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUJcRHJX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24898C4CEE5;
	Tue,  8 Apr 2025 23:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744153581;
	bh=5CyHvGgUcGvlnMG9eAcd0d6rQs0FylvJNKMxaT5iMiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QUJcRHJXhrku3VmZ9/6mbuixrOAXF1iZlJeMlR4kdR6I9cXrXzcz+t5xFWQgs8Ff6
	 hcxV88iJQqPuDUjcHhCOX8y11Zs/BxHttOOm9JLad5ybZY95jae0U7BgAkIh+D1LEz
	 5ojL7v9TS5ubYjjLZZ0uAgY4vy9VCgfJ/RHYuVIy23g6d5pTx+I7shQeCcXw6KLgZ9
	 9ywAbQV+tuRxxVvrhNl2vnllpr4uaMXKK2FXYz/v5ORkHY5Hy65Ztzauc7i1d6+9kr
	 T1x817BvRdhLEagqcO6Cu5WEt93TUUpkO4+c2Nl8+yjhpoHwPbsGZDcrSmdCQ6WFSL
	 pmkqVtFpObxAg==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 1/5] sched_ext: Indentation updates
Date: Tue,  8 Apr 2025 13:06:01 -1000
Message-ID: <20250408230616.2369765-2-tj@kernel.org>
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

Purely cosmetic.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 3cc5d7b5e3a9..022343518f99 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -163,16 +163,16 @@ enum scx_ops_flags {
 	/*
 	 * CPU cgroup support flags
 	 */
-	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* DEPRECATED, will be removed on 6.18 */
-
-	SCX_OPS_ALL_FLAGS	= SCX_OPS_KEEP_BUILTIN_IDLE |
-				  SCX_OPS_ENQ_LAST |
-				  SCX_OPS_ENQ_EXITING |
-				  SCX_OPS_ENQ_MIGRATION_DISABLED |
-				  SCX_OPS_ALLOW_QUEUED_WAKEUP |
-				  SCX_OPS_SWITCH_PARTIAL |
-				  SCX_OPS_BUILTIN_IDLE_PER_NODE |
-				  SCX_OPS_HAS_CGROUP_WEIGHT,
+	SCX_OPS_HAS_CGROUP_WEIGHT	= 1LLU << 16,	/* DEPRECATED, will be removed on 6.18 */
+
+	SCX_OPS_ALL_FLAGS		= SCX_OPS_KEEP_BUILTIN_IDLE |
+					  SCX_OPS_ENQ_LAST |
+					  SCX_OPS_ENQ_EXITING |
+					  SCX_OPS_ENQ_MIGRATION_DISABLED |
+					  SCX_OPS_ALLOW_QUEUED_WAKEUP |
+					  SCX_OPS_SWITCH_PARTIAL |
+					  SCX_OPS_BUILTIN_IDLE_PER_NODE |
+					  SCX_OPS_HAS_CGROUP_WEIGHT,
 };
 
 /* argument container for ops.init_task() */
-- 
2.49.0

