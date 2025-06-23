Received: from caracal.cherry.relay.mailchannels.net (caracal.cherry.relay.mailchannels.net [23.83.223.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA971DB124
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750709876; cv=pass; b=g/YdgjdlGD4jA9yoNRstGUZp8O3LBLLJWUU2LFeenLa/ikduWWoLIvtTtGnYlggYFrPzmSgh/wg9FR3aSy36VopBMbiZ1FtkA1t1FdSiiSHIo4+PLgKabkYxijE/h9l3Pa1add4k2eXJesroGIbm/m2/D+A/Wt9RmhYVIq1Cv0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750709876; c=relaxed/simple;
	bh=qlw6fgKOEIXeglQ12zCV02oyL2y4C7wFSNWSIplEuEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xx5h8pUK2qsXy4IvOEdn7RBl/voYb5N5XMTqFxBqBDQYfChujCqXBu2MxB3C3Kd5gUszMBypUmaDkjvsxxpnwF5b1KZ7yArA4SK4M+mO1D9/FGktY/RFzItCKNtRBZcEIPY52KDnDamUD8S5OTp1k8qEFzXZWHXCD3X5UV/KFHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=Me/bveJo; arc=pass smtp.client-ip=23.83.223.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="Me/bveJo"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 70E30833B3;
	Mon, 23 Jun 2025 18:59:43 +0000 (UTC)
Received: from pdx1-sub0-mail-a316.dreamhost.com (trex-green-3.trex.outbound.svc.cluster.local [100.100.194.78])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id F0CFC833E3;
	Mon, 23 Jun 2025 18:59:42 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750705183; a=rsa-sha256;
	cv=none;
	b=5kRoyssmMVTN+FX0ImFLGCv17WGLyTsD8/OkC217I19K8NLh9E3md00t9HnXqna1j3vyO5
	4Ev3VV0NPyNRoECg60WN5aWOeLHFs2dXCyk21S0ALKQxWmHXCwvndI/PWUQfWSAi6la/xt
	i0d75Fxa0neUdwEDniaSkOKkcIWCK9W7s/BvOIrGuPO6EZjzeVoyke+huQ1qabidnzEkds
	rP3emoZ2FHgzGpbkYPxEFlbIdWMMAnRbfG6QslScjZs7+WM6KXB6Xp7SXr8s/r2nEArfvn
	gE8zAjvKW90y7lhNF80cnZHpRjPe55SxbQzLeNtF6nl4oAa81dVfq5cY3uGyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750705183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=atn3MyssMEAyeXRQAFQ3w0KwULPaLm0qUrW2VBs1mzI=;
	b=M+KrAkanVdREDcrHVXwE71Dafoq1gWKoPwZDS6ycD2aUL3zcq7afltE5dtvi1CXEIBQyjQ
	lKbVrxYmMrf9ph0x96wZGV+WV0j4Mc42xd767En/y4CysaYEqMU/6h50bAzN1VVuH2kCKz
	Hr7EjQ/fDL2RtxzcVnd0HyeO21ddQu0jhloCgPQcngoLObSmWRNELNCTWh5t36VVjRVp71
	VUaBcBPyRXUgwsiw36/F278Mp7+ye3GXM85+Lh84enZrgMBM4nnvMzk9WRzC2ipd742fMQ
	H6eB0JAPRqP/tRVYgxVy2r9ur9hKNCfvR/oONaySfidenWPRyXVNLwnLpnqu0A==
ARC-Authentication-Results: i=1;
	rspamd-679c59f89-b62kv;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Bad
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Keen-Tank: 55a5cdcd7075d2e1_1750705183310_827885278
X-MC-Loop-Signature: 1750705183310:3004467330
X-MC-Ingress-Time: 1750705183310
Received: from pdx1-sub0-mail-a316.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.194.78 (trex/7.0.3);
	Mon, 23 Jun 2025 18:59:43 +0000
Received: from offworld.lan (syn-076-167-199-067.res.spectrum.com [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a316.dreamhost.com (Postfix) with ESMTPSA id 4bQy7L2GRwz8Q;
	Mon, 23 Jun 2025 11:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1750705182;
	bh=atn3MyssMEAyeXRQAFQ3w0KwULPaLm0qUrW2VBs1mzI=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=Me/bveJoe7+IrySu90leEOMhSt70NIHqvCPOtHmkPOTYl7ogxwMty/DQByDzYH6GH
	 0a0hzYUm9KbWJvdUrAXb8SrA5l/+UaOnM54oA0M4iCTaIZpI2vNl5bKCjPCG6zhzeM
	 0TXZhKeG1+yekfD5X0pOviA8RwFp9iIKyzjhTC/BEgsjqB+fgg+kbt9DaVOxB+M4UN
	 rkqwrC7l5m5eqz5NTAdv7emOrklob0L7dNr46Rzx4ExH5BOnIy4oxnALFAgp0ttUeX
	 q4AVyzdN/4fEJQVHmgy9kX+1dxMQc51WXQFDxVXUIKUO+1xveGdN+SOJOZ2CPB6LlS
	 pI0IdLkm98FJw==
From: Davidlohr Bueso <dave@stgolabs.net>
To: akpm@linux-foundation.org
Cc: mhocko@kernel.org,
	hannes@cmpxchg.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosryahmed@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dave@stgolabs.net
Subject: [PATCH 3/4] mm/vmscan: make __node_reclaim() more generic
Date: Mon, 23 Jun 2025 11:58:50 -0700
Message-Id: <20250623185851.830632-4-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623185851.830632-1-dave@stgolabs.net>
References: <20250623185851.830632-1-dave@stgolabs.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As this will be called from non page allocator paths for
proactive reclaim, allow users to pass the sc and nr of
pages, and adjust the return value as well. No change in
semantics.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 mm/vmscan.c | 48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 63ddec550c3b..cdd9cb97fb79 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7618,36 +7618,26 @@ static unsigned long node_pagecache_reclaimable(struct pglist_data *pgdat)
 /*
  * Try to free up some pages from this node through reclaim.
  */
-static int __node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned int order)
+static unsigned long __node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask,
+				    unsigned long nr_pages,
+				    struct scan_control *sc)
 {
-	/* Minimum pages needed in order to stay on node */
-	const unsigned long nr_pages = 1 << order;
 	struct task_struct *p = current;
 	unsigned int noreclaim_flag;
-	struct scan_control sc = {
-		.nr_to_reclaim = max(nr_pages, SWAP_CLUSTER_MAX),
-		.gfp_mask = current_gfp_context(gfp_mask),
-		.order = order,
-		.priority = NODE_RECLAIM_PRIORITY,
-		.may_writepage = !!(node_reclaim_mode & RECLAIM_WRITE),
-		.may_unmap = !!(node_reclaim_mode & RECLAIM_UNMAP),
-		.may_swap = 1,
-		.reclaim_idx = gfp_zone(gfp_mask),
-	};
 	unsigned long pflags;
 
-	trace_mm_vmscan_node_reclaim_begin(pgdat->node_id, order,
-					   sc.gfp_mask);
+	trace_mm_vmscan_node_reclaim_begin(pgdat->node_id, sc->order,
+					   sc->gfp_mask);
 
 	cond_resched();
 	psi_memstall_enter(&pflags);
 	delayacct_freepages_start();
-	fs_reclaim_acquire(sc.gfp_mask);
+	fs_reclaim_acquire(sc->gfp_mask);
 	/*
 	 * We need to be able to allocate from the reserves for RECLAIM_UNMAP
 	 */
 	noreclaim_flag = memalloc_noreclaim_save();
-	set_task_reclaim_state(p, &sc.reclaim_state);
+	set_task_reclaim_state(p, &sc->reclaim_state);
 
 	if (node_pagecache_reclaimable(pgdat) > pgdat->min_unmapped_pages ||
 	    node_page_state_pages(pgdat, NR_SLAB_RECLAIMABLE_B) > pgdat->min_slab_pages) {
@@ -7656,24 +7646,36 @@ static int __node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned in
 		 * priorities until we have enough memory freed.
 		 */
 		do {
-			shrink_node(pgdat, &sc);
-		} while (sc.nr_reclaimed < nr_pages && --sc.priority >= 0);
+			shrink_node(pgdat, sc);
+		} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
 	}
 
 	set_task_reclaim_state(p, NULL);
 	memalloc_noreclaim_restore(noreclaim_flag);
-	fs_reclaim_release(sc.gfp_mask);
+	fs_reclaim_release(sc->gfp_mask);
 	delayacct_freepages_end();
 	psi_memstall_leave(&pflags);
 
-	trace_mm_vmscan_node_reclaim_end(sc.nr_reclaimed);
+	trace_mm_vmscan_node_reclaim_end(sc->nr_reclaimed);
 
-	return sc.nr_reclaimed >= nr_pages;
+	return sc->nr_reclaimed;
 }
 
 int node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned int order)
 {
 	int ret;
+	/* Minimum pages needed in order to stay on node */
+	const unsigned long nr_pages = 1 << order;
+	struct scan_control sc = {
+		.nr_to_reclaim = max(nr_pages, SWAP_CLUSTER_MAX),
+		.gfp_mask = current_gfp_context(gfp_mask),
+		.order = order,
+		.priority = NODE_RECLAIM_PRIORITY,
+		.may_writepage = !!(node_reclaim_mode & RECLAIM_WRITE),
+		.may_unmap = !!(node_reclaim_mode & RECLAIM_UNMAP),
+		.may_swap = 1,
+		.reclaim_idx = gfp_zone(gfp_mask),
+	};
 
 	/*
 	 * Node reclaim reclaims unmapped file backed pages and
@@ -7708,7 +7710,7 @@ int node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned int order)
 	if (test_and_set_bit_lock(PGDAT_RECLAIM_LOCKED, &pgdat->flags))
 		return NODE_RECLAIM_NOSCAN;
 
-	ret = __node_reclaim(pgdat, gfp_mask, order);
+	ret = __node_reclaim(pgdat, gfp_mask, nr_pages, &sc) >= nr_pages;
 	clear_bit_unlock(PGDAT_RECLAIM_LOCKED, &pgdat->flags);
 
 	if (ret)
-- 
2.39.5

