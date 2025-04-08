Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17BB134B0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744137073; cv=none; b=DKLGw1fDmq7eBmEXsAkj2SzrV2euAyuOoYT+DsoBwBPrxdBIDCQoumBIpy1u1WStqHO5ttf7jR82WhVv7H3Ro5XAaCJFE6t/tjx43Ixs1fjWls4GUlLdcasU74W66SQ4V7YRPKmDvJUjMwczAR5wd7c2AsBEHxL44o3b6Nr2R70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744137073; c=relaxed/simple;
	bh=/Yvd/AATECuw7tf1K+68aZf1ZUg27wWNq8i7/NpbeDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBx3lwDZqN4Ew/5rQBd8pRXNrS2+4jjECRvA8NSqo7QB857DJogNfx/Y+qqL/XCwXTQFVW7sNedmjHVe/BeQVUL+RBmmkMs2m43H5ETxvR9LXq5bOIeUqRZQcrZ8WWnTftv0azwzoZeRg6F8jzRW3ukbQ8KkdQz7qhCxsmpPd6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM7r/Iid; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM7r/Iid"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FBAC4CEE5;
	Tue,  8 Apr 2025 18:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744137073;
	bh=/Yvd/AATECuw7tf1K+68aZf1ZUg27wWNq8i7/NpbeDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LM7r/IidoyCX+j+Xf8wptiQ+Z9sqGWEmlfCa2Q2buxF3AaJtnqrKOW571K46pIeV/
	 7fueTumgrFuUnrFXPODLeDx9hoB+lGdOCVLcbr28Uqx7ZNDOjY/VRXH9+Zqz2P98ik
	 jylgpDNMMBSVLxH9ry6aQidc/UJP5fieCheSpJ1cBkLbbaZEnv+ro43QyzGoXj28Si
	 eklD0LpuftYzIrxXwMiXLuvn19B8nZ6bwoswZCpf0zJXmFP0jJjjmo/yXGQThmFs5s
	 pbqReCAH2vFroRdDHqAu71MVPmLTu9Lm9E6oWUO+ztpzep4+AsiEJHdXnNedWTHja0
	 aq5tOdcW5wM+w==
Date: Tue, 8 Apr 2025 08:31:12 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 sched_ext/for-6.15-fixes] sched_ext: Mark
 SCX_OPS_HAS_CGROUP_WEIGHT for deprecation
Message-ID: <Z_VrcMkl2w7EIPC0@slm.duckdns.org>
References: <Z_RdpDkLCXm140RT@slm.duckdns.org>
 <Z_TXIe2fVpAt-CAg@gpd3>
 <Z_VnKbElcEWWg4CH@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_VnKbElcEWWg4CH@slm.duckdns.org>

SCX_OPS_HAS_CGROUP_WEIGHT was only used to suppress the missing cgroup
weight support warnings. Now that the warnings are removed, the flag doesn't
do anything. Mark it for deprecation and remove its usage from scx_flatcg.

v2: Actually include the scx_flatcg update.

Signed-off-by: Tejun Heo <tj@kernel.org>
Suggested-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c               |    5 ++++-
 tools/sched_ext/scx_flatcg.bpf.c |    2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 21eaf081d336..fdbf249d1c68 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -163,7 +163,7 @@ enum scx_ops_flags {
 	/*
 	 * CPU cgroup support flags
 	 */
-	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* cpu.weight */
+	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* DEPRECATED, will be removed on 6.18 */
 
 	SCX_OPS_ALL_FLAGS	= SCX_OPS_KEEP_BUILTIN_IDLE |
 				  SCX_OPS_ENQ_LAST |
@@ -5213,6 +5213,9 @@ static int validate_ops(const struct sched_ext_ops *ops)
 		return -EINVAL;
 	}
 
+	if (ops->flags & SCX_OPS_HAS_CGROUP_WEIGHT)
+		pr_warn("SCX_OPS_HAS_CGROUP_WEIGHT is deprecated and a noop\n");
+
 	return 0;
 }
 
diff --git a/tools/sched_ext/scx_flatcg.bpf.c b/tools/sched_ext/scx_flatcg.bpf.c
index 2c720e3ecad5..fdc7170639e6 100644
--- a/tools/sched_ext/scx_flatcg.bpf.c
+++ b/tools/sched_ext/scx_flatcg.bpf.c
@@ -950,5 +950,5 @@ SCX_OPS_DEFINE(flatcg_ops,
 	       .cgroup_move		= (void *)fcg_cgroup_move,
 	       .init			= (void *)fcg_init,
 	       .exit			= (void *)fcg_exit,
-	       .flags			= SCX_OPS_HAS_CGROUP_WEIGHT | SCX_OPS_ENQ_EXITING,
+	       .flags			= SCX_OPS_ENQ_EXITING,
 	       .name			= "flatcg");
