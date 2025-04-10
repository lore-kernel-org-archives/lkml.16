Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C6A28F940
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312509; cv=none; b=ANcInDB6mGmV9BGSe9kIcUB1i91YCJTaWS7vtHjYtqXrBa7GjOv89I6p1Zhaw2BtKDkwn2M5Ni8vs9K49LrZDIDvl3fJcJrLf6bCQHsHmGTikJwDtqhQSd0AQ/JFwNlAen5qsPNPLIYiclXZQfkccNTJMYIxX79I33ZAFRmaN3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312509; c=relaxed/simple;
	bh=FpbIUhCv7atBmm0vYG5NQifCGtOyvmCz06IGpnrJlfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FY8xtB7bNjZz/y49W8sXNGZiwLzpMUlW7P1L7aEWjpntcFKvKPjhTTFkyn1D0tdH756B8BBNvXuYS4yFdddAA9UWYMtOovbOf+krTcD7C3+EcsCeyC1P0NDe4fcPSa/ANLVOnKz6CkSTgCz24dq4n4MvkqS1Dpa0ahn3R+pl2aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MThG02bR; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MThG02bR"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AIHKGF013307;
	Thu, 10 Apr 2025 19:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=KLkUy
	BHaMZVC9+qD8yDzzxR1ZYrBXGTE6UAP8midVt8=; b=MThG02bRWYxKUM7S/DBmJ
	NbGp43ECs1/SMJs4crLRbNRCaCGpfro5ESYwoMlnCgZsA/PW6JfU+qnuWyKw2eSc
	7MSWBd5KRCqnwhCxctrvWd1x3HLp54ATgMRb7925/XRsiENEFbruzki7IOYTlH+2
	QIvCu7O/DfpDO4uwrZXYNKhi32RROqMGwF+yy5fbt0tqpp2Kf1RzT6xU/2H7V1UF
	9ZQYc0Xb4lvaTk+olda6Rp3tWtbPLBWXVshrwLVnbpkSKrYUCfL/wEr6OV83VrWw
	yO17GiPBk+Za7GuUgdVMSRsPGDYaCwJgeg8xfyStJNABB1iH+LtsIX5iMUR+vDei
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45xk4hr4qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:14:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53AHeMNv023937;
	Thu, 10 Apr 2025 19:14:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyk1gk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:14:56 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53AJEn96040606;
	Thu, 10 Apr 2025 19:14:55 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.250.108])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45ttyk1gg6-6;
	Thu, 10 Apr 2025 19:14:55 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com,
        willy@infradead.org, Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: [PATCH v5 5/6] maple_tree: add sufficient height
Date: Thu, 10 Apr 2025 19:14:45 +0000
Message-ID: <20250410191446.2474640-6-sidhartha.kumar@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410191446.2474640-1-sidhartha.kumar@oracle.com>
References: <20250410191446.2474640-1-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504100139
X-Proofpoint-GUID: v74hJGjVc4d4q4On2K_pMwAFYoOSPv19
X-Proofpoint-ORIG-GUID: v74hJGjVc4d4q4On2K_pMwAFYoOSPv19

In order to support rebalancing and spanning stores using less than the
worst case number of nodes, we need to track more than just the vacant
height. Using only vacant height to reduce the worst case maple node
allocation count can lead to a shortcoming of nodes in the following
scenarios.

For rebalancing writes, when a leaf node becomes insufficient, it may be
combined with a sibling into a single node. This means that the parent node
which has entries for this children will lose one entry. If this parent node
was just meeting the minimum entries, losing one entry will now cause this
parent node to be insufficient. This leads to a cascading operation of
rebalancing at different levels and can lead to more node allocations than
simply using vacant height can return.

For spanning writes, a similar situation occurs. At the location at
which a spanning write is detected, the number of ancestor nodes may
similarly need to rebalanced into a smaller number of nodes and the same
cascading situation could occur.

To use less than the full height of the tree for the number of
allocations, we also need to track the height at which a non-leaf node
cannot become insufficient. This means even if a rebalance occurs to a
child of this node, it currently has enough entries that it can lose one
without any further action. This field is stored in the maple write state
as sufficient height. In mas_prealloc_calc() when figuring out how many
nodes to allocate, we check if the vacant node is lower in the tree
than a sufficient node (has a larger value). If it is, we cannot use the
vacant height and must use the difference in the height and sufficient
height as the basis for the number of nodes needed.

An off by one bug was also discovered in mast_overflow() where it is
using >= rather than >. This caused extra iterations of the
mas_spanning_rebalance() loop and lead to unneeded allocations. A test
is also added to check the number of allocations is correct.

Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 include/linux/maple_tree.h       |  4 +++-
 lib/maple_tree.c                 | 19 ++++++++++++++++---
 tools/testing/radix-tree/maple.c | 28 ++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index 657adb33e61e..9ef129038224 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -464,6 +464,7 @@ struct ma_wr_state {
 	void *entry;			/* The entry to write */
 	void *content;			/* The existing entry that is being overwritten */
 	unsigned char vacant_height;	/* Height of lowest node with free space */
+	unsigned char sufficient_height;/* Height of lowest node with min sufficiency + 1 nodes */
 };
 
 #define mas_lock(mas)           spin_lock(&((mas)->tree->ma_lock))
@@ -499,7 +500,8 @@ struct ma_wr_state {
 		.mas = ma_state,					\
 		.content = NULL,					\
 		.entry = wr_entry,					\
-		.vacant_height = 0					\
+		.vacant_height = 0,					\
+		.sufficient_height = 0					\
 	}
 
 #define MA_TOPIARY(name, tree)						\
diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 5610b3742a79..aa139668bcae 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -2741,7 +2741,7 @@ static inline bool mast_sufficient(struct maple_subtree_state *mast)
  */
 static inline bool mast_overflow(struct maple_subtree_state *mast)
 {
-	if (mast->bn->b_end >= mt_slot_count(mast->orig_l->node))
+	if (mast->bn->b_end > mt_slot_count(mast->orig_l->node))
 		return true;
 
 	return false;
@@ -3550,6 +3550,13 @@ static bool mas_wr_walk(struct ma_wr_state *wr_mas)
 		if (mas->end < mt_slots[wr_mas->type] - 1)
 			wr_mas->vacant_height = mas->depth + 1;
 
+		if (ma_is_root(mas_mn(mas))) {
+			/* root needs more than 2 entries to be sufficient + 1 */
+			if (mas->end > 2)
+				wr_mas->sufficient_height = 1;
+		} else if (mas->end > mt_min_slots[wr_mas->type] + 1)
+			wr_mas->sufficient_height = mas->depth + 1;
+
 		mas_wr_walk_traverse(wr_mas);
 	}
 
@@ -4185,13 +4192,19 @@ static inline int mas_prealloc_calc(struct ma_wr_state *wr_mas, void *entry)
 			ret = 0;
 		break;
 	case wr_spanning_store:
-		WARN_ON_ONCE(ret != height * 3 + 1);
+		if (wr_mas->sufficient_height < wr_mas->vacant_height)
+			ret = (height - wr_mas->sufficient_height) * 3 + 1;
+		else
+			ret = delta * 3 + 1;
 		break;
 	case wr_split_store:
 		ret = delta * 2 + 1;
 		break;
 	case wr_rebalance:
-		ret = height * 2 + 1;
+		if (wr_mas->sufficient_height < wr_mas->vacant_height)
+			ret = (height - wr_mas->sufficient_height) * 2 + 1;
+		else
+			ret = delta * 2 + 1;
 		break;
 	case wr_node_store:
 		ret = mt_in_rcu(mas->tree) ? 1 : 0;
diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index e37a3ab2e921..2c0b38301253 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -36326,6 +36326,30 @@ static inline void check_spanning_store_height(struct maple_tree *mt)
 	mas_unlock(&mas);
 }
 
+/*
+ * Test to check the path of a spanning rebalance which results in
+ * a collapse where the rebalancing of the child node leads to
+ * insufficieny in the parent node.
+ */
+static void check_collapsing_rebalance(struct maple_tree *mt)
+{
+	int i = 0;
+	MA_STATE(mas, mt, ULONG_MAX, ULONG_MAX);
+
+	/* create a height 6 tree */
+	while (mt_height(mt) < 6) {
+		mtree_store_range(mt, i, i + 10, xa_mk_value(i), GFP_KERNEL);
+		i += 9;
+	}
+
+	/* delete all entries one at a time, starting from the right */
+	do {
+		mas_erase(&mas);
+	} while (mas_prev(&mas, 0) != NULL);
+
+	mtree_unlock(mt);
+}
+
 /* callback function used for check_nomem_writer_race() */
 static void writer2(void *maple_tree)
 {
@@ -36496,6 +36520,10 @@ void farmer_tests(void)
 	check_spanning_store_height(&tree);
 	mtree_destroy(&tree);
 
+	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
+	check_collapsing_rebalance(&tree);
+	mtree_destroy(&tree);
+
 	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
 	check_null_expand(&tree);
 	mtree_destroy(&tree);
-- 
2.43.0

