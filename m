Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A7C24467F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451952; cv=none; b=m2kDmxbwI2zAW/x9GTkzC9CqM7+RED0+poQIhpAluGGv7VVQmFN4M8809hGM/wFpreq1D9B2TsskCfsnt+5n3if4Nb9tdE2xRV4HzEkxeWh2v5W4alJ45pgBRL9PEtl31pZqcQZng0av3Ms2Uamri/Z/NWKfLrDA5VTXCqtzhxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451952; c=relaxed/simple;
	bh=+9fDBM37uweTZVvqqudp2/uG2e/+o0qOO0wgOBFmfO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edDCFvWS0En7xVxkW7htLyRFDsjw0tNbN8c5t+6iSMYpcOjmPUR3XsBSt29TP0yYkr/FKkE0yN9J+xt7YsJ9IQC60Gc1Fqeyfhz0Z38aVLIvbXGnTHLV66RAShKE5DOFaa3uLAW8cFh1i7WUYWBiD2SMXf672aQp5gMNP3+GU+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeyR+DMA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeyR+DMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2D5C4CEE2;
	Wed, 23 Apr 2025 23:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451952;
	bh=+9fDBM37uweTZVvqqudp2/uG2e/+o0qOO0wgOBFmfO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WeyR+DMAE2inIkF3L900sN6VE77Maoyv8KgHUmcAZTv40YgS2vUFrSJfFHBWNKrh+
	 hve4g25n9ZAYArmKZ5cjKUBTzTjzwebisjyX0cC/jag2LBWbEmoO/nwJSp58OGgQxL
	 kI51tmYqvEzRRLJNA8MUBtT1w61Ef19Jlop4bb0aeeGGZguiDYNVFcL4sOLSyq83vA
	 C3yKSEKYggOvbg/Mvy7lv+XUXSKIe+DZnr38GN0pQM6yUANQPfI4hAbjmemae6NGtV
	 fKzRuFBcACs3mjpMyGSZVBWPS1VoJ79aDBVLR5TqGKGw0A9HMS0r/jLT60obaxo8V6
	 duR76L5LrrY+A==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 04/12] sched_ext: Inline create_dsq() into scx_bpf_create_dsq()
Date: Wed, 23 Apr 2025 13:44:42 -1000
Message-ID: <20250423234542.1890867-5-tj@kernel.org>
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

create_dsq() is only used by scx_bpf_create_dsq() and the separation gets in
the way of making dsq_hash per scx_sched. Inline it into
scx_bpf_create_dsq(). While at it, add unlikely() around
SCX_DSQ_FLAG_BUILTIN test.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 42 ++++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 612232c66d13..8ec32c458f16 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4193,29 +4193,6 @@ static void init_dsq(struct scx_dispatch_q *dsq, u64 dsq_id)
 	dsq->id = dsq_id;
 }
 
-static struct scx_dispatch_q *create_dsq(u64 dsq_id, int node)
-{
-	struct scx_dispatch_q *dsq;
-	int ret;
-
-	if (dsq_id & SCX_DSQ_FLAG_BUILTIN)
-		return ERR_PTR(-EINVAL);
-
-	dsq = kmalloc_node(sizeof(*dsq), GFP_KERNEL, node);
-	if (!dsq)
-		return ERR_PTR(-ENOMEM);
-
-	init_dsq(dsq, dsq_id);
-
-	ret = rhashtable_lookup_insert_fast(&dsq_hash, &dsq->hash_node,
-					    dsq_hash_params);
-	if (ret) {
-		kfree(dsq);
-		return ERR_PTR(ret);
-	}
-	return dsq;
-}
-
 static void free_dsq_irq_workfn(struct irq_work *irq_work)
 {
 	struct llist_node *to_free = llist_del_all(&dsqs_to_free);
@@ -6708,10 +6685,27 @@ __bpf_kfunc_start_defs();
  */
 __bpf_kfunc s32 scx_bpf_create_dsq(u64 dsq_id, s32 node)
 {
+	struct scx_dispatch_q *dsq;
+	s32 ret;
+
 	if (unlikely(node >= (int)nr_node_ids ||
 		     (node < 0 && node != NUMA_NO_NODE)))
 		return -EINVAL;
-	return PTR_ERR_OR_ZERO(create_dsq(dsq_id, node));
+
+	if (unlikely(dsq_id & SCX_DSQ_FLAG_BUILTIN))
+		return -EINVAL;
+
+	dsq = kmalloc_node(sizeof(*dsq), GFP_KERNEL, node);
+	if (!dsq)
+		return -ENOMEM;
+
+	init_dsq(dsq, dsq_id);
+
+	ret = rhashtable_lookup_insert_fast(&dsq_hash, &dsq->hash_node,
+					    dsq_hash_params);
+	if (ret)
+		kfree(dsq);
+	return ret;
 }
 
 __bpf_kfunc_end_defs();
-- 
2.49.0

