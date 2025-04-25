Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161CD229B38
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618329; cv=none; b=W7iEx6X7AV98bF1Jty1duT935+xbXnujWzFvIxigugipEqS4tGsM6SX4bGm7bLIz+qlICHvE1b22ac/UY+wJwOstS0FfEPLnPBy8+408XkitH06lhpVVWAG+rZuaN4g0QFwLG9ZAId+hQAFM1ZQ6+A8ZxOepa7yosWXPBcYcXA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618329; c=relaxed/simple;
	bh=JjJ7u9L4bsn3P3tXJ+xghGsmdrEbLJ8OOlksPw5V+4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ef3Nq37bp32Q7OKMFWa5VWj386LErEQO7KOZtPGMlyGwRQqn/y49W9RQQEAnlJ5VOjAdQz4b4umcAhoesNdYn/An1Bx11C2okf7VHQrvISmU71vh+ZSeee+l3tsjIEDPIdNrE33r9QwkGLaj3HjiGDqHR4NSmkHLzt5ANhvPdms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EK38/3z3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EK38/3z3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3862C4CEFB;
	Fri, 25 Apr 2025 21:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745618328;
	bh=JjJ7u9L4bsn3P3tXJ+xghGsmdrEbLJ8OOlksPw5V+4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EK38/3z3ifBfMQ8YfJEKVUD+2tr7dZXQnNiLW1Mv0Q9zOjhm0idtXl9gOln0lFZrD
	 +cLa+jHW9C0RsZzqSNF0zRCRkCIbUDevqjy+0lH7ClKEMQl3uWj9K1IOgvLtwBK30I
	 82hnAtklE0V28U5udTJeaYCH5LJ+a/sUUFNSpw4ZfLC3m8svHsgWrdBGDdgu/Teo5m
	 ZDAerEBzf09f7U6JU77hNTtU4v1CrBn2J+0bV45zqnwSsgkS+xYxMfC4HXn9r9TCKT
	 PrJ58jB4AqJS9PZEdNYpQw0vUdksVJ6ssl+vEWWsSYshGTsH11Ic5DRqYz0HNrzINX
	 yBnfCygduDoHg==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 04/12] sched_ext: Inline create_dsq() into scx_bpf_create_dsq()
Date: Fri, 25 Apr 2025 11:58:19 -1000
Message-ID: <20250425215840.2334972-5-tj@kernel.org>
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

create_dsq() is only used by scx_bpf_create_dsq() and the separation gets in
the way of making dsq_hash per scx_sched. Inline it into
scx_bpf_create_dsq(). While at it, add unlikely() around
SCX_DSQ_FLAG_BUILTIN test.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 42 ++++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index fe6044f527c4..e22717c435ff 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4196,29 +4196,6 @@ static void init_dsq(struct scx_dispatch_q *dsq, u64 dsq_id)
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
@@ -6712,10 +6689,27 @@ __bpf_kfunc_start_defs();
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

