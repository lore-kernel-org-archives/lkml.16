Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A609263C86
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744051288; cv=none; b=dywX5txyA+S1ru57qlYM/qM6R05FwbO0SPRcsLFZORq5aNwclqG+ZAywSVc0JAO147Y0GSQ/9NJ6365MZ0EBiUT9gBA9DAi8gp2sIYa63ywsvDB6XLJEUC/7KZCzYHTSNBgff3aSgBVi3VoGfgASKVbP5a5bixP5NHTgsleqXbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744051288; c=relaxed/simple;
	bh=s6LZXHZJboaWMV3lcjofyhiOEflWxXPIesiOzN9GzrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1lHHnZK253hoSoYtSsQC5uQgrZXSs8wVYhWzNI/oC+ROoYk3kb0RLjuW/6OgHbuYmzHlzKPomNY9SlcFXIYhVwBeIdE7ImDdB7CyJtJVOWxlqB8fZKp3R0pKJBoJsri8kREsI5dCkFDH0BkcPveJ0UQ/ZM3XWTK9c3vXMpF/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lt6twRPJ; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lt6twRPJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537H0kSQ029772;
	Mon, 7 Apr 2025 18:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=WksMB
	E9ucCYEKSc5GJh7iDK/gye2kn0iObdcPGfaozU=; b=lt6twRPJSEgibpWBmz52y
	p1cXvkwoQBWxlK+bWAFFY2FCC+rHadn2RE+xQLc4QUGAzyglqCc94zGNTh64wT43
	VZfaw11NpPFJzZnHJnaNMasvPf15gkQ2R4dCWhlEUs5hm84kJ5KI4wUQ7CIAHPp/
	UWIvZXOwPVcVoVXk5iEWATbPpjja2JY4epKPc3UCZIYX0ioEKQdiMPG/XrEnY6HR
	sPI9ogvi3Je5ppLddIwUweIRxJirHQKBXv0wyGIS8lSr1newpR5fbZxf0ZRWmm8L
	Vf1Q6rkz5sd0lOaXSo1PI3dkIcjKfPTEY1kEm7wyOzV41SDLec4IQ+qkpSYs4NKl
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tua2ua1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 18:41:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 537IHXZc023814;
	Mon, 7 Apr 2025 18:41:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyefws0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 18:41:07 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 537IY5DT038909;
	Mon, 7 Apr 2025 18:41:06 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.250.108])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45ttyefwqr-3;
	Mon, 07 Apr 2025 18:41:06 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com,
        willy@infradead.org, Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: [PATCH v4 2/6] maple_tree: use height and depth consistently
Date: Mon,  7 Apr 2025 18:40:58 +0000
Message-ID: <20250407184102.2155415-3-sidhartha.kumar@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407184102.2155415-1-sidhartha.kumar@oracle.com>
References: <20250407184102.2155415-1-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504070130
X-Proofpoint-GUID: dyWCUE4UW_KVnhsPho7eTtlt1s7CfN86
X-Proofpoint-ORIG-GUID: dyWCUE4UW_KVnhsPho7eTtlt1s7CfN86

For the maple tree, the root node is defined to have a depth of 0 with a
height of 1. Each level down from the node, these values are incremented
by 1. Various code paths define a root with depth 1 which is inconsisent
with the definition. Modify the code to be consistent with this
definition.

Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 lib/maple_tree.c                 | 82 +++++++++++++++++---------------
 tools/testing/radix-tree/maple.c | 19 ++++++++
 2 files changed, 63 insertions(+), 38 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index f25ee210d495..236f0579ca53 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -211,14 +211,14 @@ static void ma_free_rcu(struct maple_node *node)
 	call_rcu(&node->rcu, mt_free_rcu);
 }
 
-static void mas_set_height(struct ma_state *mas)
+static void mt_set_height(struct maple_tree *mt, unsigned char height)
 {
-	unsigned int new_flags = mas->tree->ma_flags;
+	unsigned int new_flags = mt->ma_flags;
 
 	new_flags &= ~MT_FLAGS_HEIGHT_MASK;
-	MAS_BUG_ON(mas, mas->depth > MAPLE_HEIGHT_MAX);
-	new_flags |= mas->depth << MT_FLAGS_HEIGHT_OFFSET;
-	mas->tree->ma_flags = new_flags;
+	MT_BUG_ON(mt, height > MAPLE_HEIGHT_MAX);
+	new_flags |= height << MT_FLAGS_HEIGHT_OFFSET;
+	mt->ma_flags = new_flags;
 }
 
 static unsigned int mas_mt_height(struct ma_state *mas)
@@ -1371,7 +1371,7 @@ static inline struct maple_enode *mas_start(struct ma_state *mas)
 		root = mas_root(mas);
 		/* Tree with nodes */
 		if (likely(xa_is_node(root))) {
-			mas->depth = 1;
+			mas->depth = 0;
 			mas->status = ma_active;
 			mas->node = mte_safe_root(root);
 			mas->offset = 0;
@@ -1712,9 +1712,10 @@ static inline void mas_adopt_children(struct ma_state *mas,
  * node as dead.
  * @mas: the maple state with the new node
  * @old_enode: The old maple encoded node to replace.
+ * @new_height: if we are inserting a root node, update the height of the tree
  */
 static inline void mas_put_in_tree(struct ma_state *mas,
-		struct maple_enode *old_enode)
+		struct maple_enode *old_enode, char new_height)
 	__must_hold(mas->tree->ma_lock)
 {
 	unsigned char offset;
@@ -1723,7 +1724,7 @@ static inline void mas_put_in_tree(struct ma_state *mas,
 	if (mte_is_root(mas->node)) {
 		mas_mn(mas)->parent = ma_parent_ptr(mas_tree_parent(mas));
 		rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
-		mas_set_height(mas);
+		mt_set_height(mas->tree, new_height);
 	} else {
 
 		offset = mte_parent_slot(mas->node);
@@ -1741,12 +1742,13 @@ static inline void mas_put_in_tree(struct ma_state *mas,
  * the parent encoding to locate the maple node in the tree.
  * @mas: the ma_state with @mas->node pointing to the new node.
  * @old_enode: The old maple encoded node.
+ * @new_height: The new height of the tree as a result of the operation
  */
 static inline void mas_replace_node(struct ma_state *mas,
-		struct maple_enode *old_enode)
+		struct maple_enode *old_enode, unsigned char new_height)
 	__must_hold(mas->tree->ma_lock)
 {
-	mas_put_in_tree(mas, old_enode);
+	mas_put_in_tree(mas, old_enode, new_height);
 	mas_free(mas, old_enode);
 }
 
@@ -2536,10 +2538,11 @@ static inline void mas_topiary_node(struct ma_state *mas,
  *
  * @mas: The maple state pointing at the new data
  * @old_enode: The maple encoded node being replaced
+ * @new_height: The new height of the tree as a result of the operation
  *
  */
 static inline void mas_topiary_replace(struct ma_state *mas,
-		struct maple_enode *old_enode)
+		struct maple_enode *old_enode, unsigned char new_height)
 {
 	struct ma_state tmp[3], tmp_next[3];
 	MA_TOPIARY(subtrees, mas->tree);
@@ -2547,7 +2550,7 @@ static inline void mas_topiary_replace(struct ma_state *mas,
 	int i, n;
 
 	/* Place data in tree & then mark node as old */
-	mas_put_in_tree(mas, old_enode);
+	mas_put_in_tree(mas, old_enode, new_height);
 
 	/* Update the parent pointers in the tree */
 	tmp[0] = *mas;
@@ -2631,14 +2634,15 @@ static inline void mas_topiary_replace(struct ma_state *mas,
  * mas_wmb_replace() - Write memory barrier and replace
  * @mas: The maple state
  * @old_enode: The old maple encoded node that is being replaced.
+ * @new_height: The new height of the tree as a result of the operation
  *
  * Updates gap as necessary.
  */
 static inline void mas_wmb_replace(struct ma_state *mas,
-		struct maple_enode *old_enode)
+		struct maple_enode *old_enode, unsigned char new_height)
 {
 	/* Insert the new data in the tree */
-	mas_topiary_replace(mas, old_enode);
+	mas_topiary_replace(mas, old_enode, new_height);
 
 	if (mte_is_leaf(mas->node))
 		return;
@@ -2824,6 +2828,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
 {
 	unsigned char split, mid_split;
 	unsigned char slot = 0;
+	unsigned char new_height = 0; /* used if node is a new root */
 	struct maple_enode *left = NULL, *middle = NULL, *right = NULL;
 	struct maple_enode *old_enode;
 
@@ -2866,6 +2871,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
 		mast_set_split_parents(mast, left, middle, right, split,
 				       mid_split);
 		mast_cp_to_nodes(mast, left, middle, right, split, mid_split);
+		new_height++;
 
 		/*
 		 * Copy data from next level in the tree to mast->bn from next
@@ -2873,7 +2879,6 @@ static void mas_spanning_rebalance(struct ma_state *mas,
 		 */
 		memset(mast->bn, 0, sizeof(struct maple_big_node));
 		mast->bn->type = mte_node_type(left);
-		l_mas.depth++;
 
 		/* Root already stored in l->node. */
 		if (mas_is_root_limits(mast->l))
@@ -2909,8 +2914,9 @@ static void mas_spanning_rebalance(struct ma_state *mas,
 
 	l_mas.node = mt_mk_node(ma_mnode_ptr(mas_pop_node(mas)),
 				mte_node_type(mast->orig_l->node));
-	l_mas.depth++;
+
 	mab_mas_cp(mast->bn, 0, mt_slots[mast->bn->type] - 1, &l_mas, true);
+	new_height++;
 	mas_set_parent(mas, left, l_mas.node, slot);
 	if (middle)
 		mas_set_parent(mas, middle, l_mas.node, ++slot);
@@ -2933,7 +2939,7 @@ static void mas_spanning_rebalance(struct ma_state *mas,
 	mas->min = l_mas.min;
 	mas->max = l_mas.max;
 	mas->offset = l_mas.offset;
-	mas_wmb_replace(mas, old_enode);
+	mas_wmb_replace(mas, old_enode, new_height);
 	mtree_range_walk(mas);
 	return;
 }
@@ -3009,6 +3015,7 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
 	void __rcu **l_slots, **slots;
 	unsigned long *l_pivs, *pivs, gap;
 	bool in_rcu = mt_in_rcu(mas->tree);
+	unsigned char new_height = mas_mt_height(mas);
 
 	MA_STATE(l_mas, mas->tree, mas->index, mas->last);
 
@@ -3103,7 +3110,7 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
 	mas_ascend(mas);
 
 	if (in_rcu) {
-		mas_replace_node(mas, old_eparent);
+		mas_replace_node(mas, old_eparent, new_height);
 		mas_adopt_children(mas, mas->node);
 	}
 
@@ -3114,10 +3121,9 @@ static inline void mas_destroy_rebalance(struct ma_state *mas, unsigned char end
  * mas_split_final_node() - Split the final node in a subtree operation.
  * @mast: the maple subtree state
  * @mas: The maple state
- * @height: The height of the tree in case it's a new root.
  */
 static inline void mas_split_final_node(struct maple_subtree_state *mast,
-					struct ma_state *mas, int height)
+					struct ma_state *mas)
 {
 	struct maple_enode *ancestor;
 
@@ -3126,7 +3132,6 @@ static inline void mas_split_final_node(struct maple_subtree_state *mast,
 			mast->bn->type = maple_arange_64;
 		else
 			mast->bn->type = maple_range_64;
-		mas->depth = height;
 	}
 	/*
 	 * Only a single node is used here, could be root.
@@ -3214,7 +3219,6 @@ static inline void mast_split_data(struct maple_subtree_state *mast,
  * mas_push_data() - Instead of splitting a node, it is beneficial to push the
  * data to the right or left node if there is room.
  * @mas: The maple state
- * @height: The current height of the maple state
  * @mast: The maple subtree state
  * @left: Push left or not.
  *
@@ -3222,8 +3226,8 @@ static inline void mast_split_data(struct maple_subtree_state *mast,
  *
  * Return: True if pushed, false otherwise.
  */
-static inline bool mas_push_data(struct ma_state *mas, int height,
-				 struct maple_subtree_state *mast, bool left)
+static inline bool mas_push_data(struct ma_state *mas,
+				struct maple_subtree_state *mast, bool left)
 {
 	unsigned char slot_total = mast->bn->b_end;
 	unsigned char end, space, split;
@@ -3280,7 +3284,7 @@ static inline bool mas_push_data(struct ma_state *mas, int height,
 
 	mast_split_data(mast, mas, split);
 	mast_fill_bnode(mast, mas, 2);
-	mas_split_final_node(mast, mas, height + 1);
+	mas_split_final_node(mast, mas);
 	return true;
 }
 
@@ -3293,6 +3297,7 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
 {
 	struct maple_subtree_state mast;
 	int height = 0;
+	unsigned int orig_height = mas_mt_height(mas);
 	unsigned char mid_split, split = 0;
 	struct maple_enode *old;
 
@@ -3319,7 +3324,6 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
 	MA_STATE(prev_r_mas, mas->tree, mas->index, mas->last);
 
 	trace_ma_op(__func__, mas);
-	mas->depth = mas_mt_height(mas);
 
 	mast.l = &l_mas;
 	mast.r = &r_mas;
@@ -3327,9 +3331,9 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
 	mast.orig_r = &prev_r_mas;
 	mast.bn = b_node;
 
-	while (height++ <= mas->depth) {
+	while (height++ <= orig_height) {
 		if (mt_slots[b_node->type] > b_node->b_end) {
-			mas_split_final_node(&mast, mas, height);
+			mas_split_final_node(&mast, mas);
 			break;
 		}
 
@@ -3344,11 +3348,15 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
 		 * is a significant savings.
 		 */
 		/* Try to push left. */
-		if (mas_push_data(mas, height, &mast, true))
+		if (mas_push_data(mas, &mast, true)) {
+			height++;
 			break;
+		}
 		/* Try to push right. */
-		if (mas_push_data(mas, height, &mast, false))
+		if (mas_push_data(mas, &mast, false)) {
+			height++;
 			break;
+		}
 
 		split = mab_calc_split(mas, b_node, &mid_split);
 		mast_split_data(&mast, mas, split);
@@ -3365,7 +3373,7 @@ static void mas_split(struct ma_state *mas, struct maple_big_node *b_node)
 	/* Set the original node as dead */
 	old = mas->node;
 	mas->node = l_mas.node;
-	mas_wmb_replace(mas, old);
+	mas_wmb_replace(mas, old, height);
 	mtree_range_walk(mas);
 	return;
 }
@@ -3424,8 +3432,7 @@ static inline void mas_root_expand(struct ma_state *mas, void *entry)
 	if (mas->last != ULONG_MAX)
 		pivots[++slot] = ULONG_MAX;
 
-	mas->depth = 1;
-	mas_set_height(mas);
+	mt_set_height(mas->tree, 1);
 	ma_set_meta(node, maple_leaf_64, 0, slot);
 	/* swap the new root into the tree */
 	rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
@@ -3669,8 +3676,7 @@ static inline void mas_new_root(struct ma_state *mas, void *entry)
 	WARN_ON_ONCE(mas->index || mas->last != ULONG_MAX);
 
 	if (!entry) {
-		mas->depth = 0;
-		mas_set_height(mas);
+		mt_set_height(mas->tree, 0);
 		rcu_assign_pointer(mas->tree->ma_root, entry);
 		mas->status = ma_start;
 		goto done;
@@ -3684,8 +3690,7 @@ static inline void mas_new_root(struct ma_state *mas, void *entry)
 	mas->status = ma_active;
 	rcu_assign_pointer(slots[0], entry);
 	pivots[0] = mas->last;
-	mas->depth = 1;
-	mas_set_height(mas);
+	mt_set_height(mas->tree, 1);
 	rcu_assign_pointer(mas->tree->ma_root, mte_mk_root(mas->node));
 
 done:
@@ -3804,6 +3809,7 @@ static inline void mas_wr_node_store(struct ma_wr_state *wr_mas,
 	struct maple_node reuse, *newnode;
 	unsigned char copy_size, node_pivots = mt_pivots[wr_mas->type];
 	bool in_rcu = mt_in_rcu(mas->tree);
+	unsigned char height = mas_mt_height(mas);
 
 	if (mas->last == wr_mas->end_piv)
 		offset_end++; /* don't copy this offset */
@@ -3860,7 +3866,7 @@ static inline void mas_wr_node_store(struct ma_wr_state *wr_mas,
 		struct maple_enode *old_enode = mas->node;
 
 		mas->node = mt_mk_node(newnode, wr_mas->type);
-		mas_replace_node(mas, old_enode);
+		mas_replace_node(mas, old_enode, height);
 	} else {
 		memcpy(wr_mas->node, newnode, sizeof(struct maple_node));
 	}
diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index bc30050227fd..e0f8fabe8821 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -36248,6 +36248,21 @@ static noinline void __init check_mtree_dup(struct maple_tree *mt)
 
 extern void test_kmem_cache_bulk(void);
 
+static inline void check_spanning_store_height(struct maple_tree *mt)
+{
+	int index = 0;
+	MA_STATE(mas, mt, 0, 0);
+	mas_lock(&mas);
+	while (mt_height(mt) != 3) {
+		mas_store_gfp(&mas, xa_mk_value(index), GFP_KERNEL);
+		mas_set(&mas, ++index);
+	}
+	mas_set_range(&mas, 90, 140);
+	mas_store_gfp(&mas, xa_mk_value(index), GFP_KERNEL);
+	MT_BUG_ON(mt, mas_mt_height(&mas) != 2);
+	mas_unlock(&mas);
+}
+
 /* callback function used for check_nomem_writer_race() */
 static void writer2(void *maple_tree)
 {
@@ -36414,6 +36429,10 @@ void farmer_tests(void)
 	check_spanning_write(&tree);
 	mtree_destroy(&tree);
 
+	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
+	check_spanning_store_height(&tree);
+	mtree_destroy(&tree);
+
 	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
 	check_null_expand(&tree);
 	mtree_destroy(&tree);
-- 
2.43.0

