Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF8626868F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451961; cv=none; b=ggP+1puXSvuFreBMACPhD+LVrR1A9/pkJ05aI45KArLnUmVEzMljFa9OVB4clAHTlH+HjsllLZVfzMqmASkUhYE55LyFzs43H58BZBqHIJBD/QRXaUOADPWXSIR3HQNNFvRWnWKDcCYXDmOUkeB5bD6Ixctj/0BIm84jI8AFVe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451961; c=relaxed/simple;
	bh=uCC9DO68y8+JlmMQrcLGfGpDqTbOtuWORndFoJjnp4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0sa69LQ+xh/wp1P3hoQx2muLQhGnCq4XrRfwmyKTQBlLDEj4W10qjkon9ScqDgzPDoHFWRY/GjSTVOAk/wGUgmAincVmv69UpM18cEN3fd6MTi97E8C8h0DMyVXqDRxGX370mo76hlyxw9yT7AXGWzet+NqU52Rw30smNIPyik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWqPN1a0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWqPN1a0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC20C4CEE2;
	Wed, 23 Apr 2025 23:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451960;
	bh=uCC9DO68y8+JlmMQrcLGfGpDqTbOtuWORndFoJjnp4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pWqPN1a047cwQ6i7KmI8Hxv81Z2JBAAlEUxUAVLPLi2C4S/csw31ObVDhspujMrIO
	 mJHVK0xsONalY7IuCwUb534VXQ7UtvL05kQvuMuvGZPfPjPeuXqod0ZIVTz1jgaCEr
	 Y8iZLFjdIk7RUw9lliQnj6qo/X+EnghnEhYtiejFOSJ1OeKmsUE5/fYzDOaPzaQbNj
	 AIcvlHU7c1KGHUDuRkYbC1zBUpqfXpqaitE9A0NaHzeC8ulHFzhYRaUCA1hMXBrVdE
	 K0tlEk66Wi1WITFxWi9RQODVHYRpFpWW3b10lderWOlR2QRReEUtJa17nALgNHY0Rl
	 iO8FcWJIVVOQg==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 12/12] sched_ext: Clean up SCX_EXIT_NONE handling in scx_disable_workfn()
Date: Wed, 23 Apr 2025 13:44:50 -1000
Message-ID: <20250423234542.1890867-13-tj@kernel.org>
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

With the global states and disable machinery moved into scx_sched,
scx_disable_workfn() can only be scheduled and run for the specific
scheduler instance. This makes it impossible for scx_disable_workfn() to see
SCX_EXIT_NONE. Turn that condition into WARN_ON_ONCE().

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index d27193010b6a..d963aa5c99e1 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4749,13 +4749,9 @@ static void scx_disable_workfn(struct kthread_work *work)
 
 	kind = atomic_read(&sch->exit_kind);
 	while (true) {
-		/*
-		 * NONE indicates that a new scx_ops has been registered since
-		 * disable was scheduled - don't kill the new ops. DONE
-		 * indicates that the ops has already been disabled.
-		 */
-		if (kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE)
+		if (kind == SCX_EXIT_DONE)	/* already disabled? */
 			return;
+		WARN_ON_ONCE(kind == SCX_EXIT_NONE);
 		if (atomic_try_cmpxchg(&sch->exit_kind, &kind, SCX_EXIT_DONE))
 			break;
 	}
-- 
2.49.0

