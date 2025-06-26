Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0FF2ED14B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958373; cv=none; b=Q5qr3TNHKVYT37liLHPeGISfP+JolNX4gnbYnUaUZ+VjD+axi35G+MFv0FVL601vbLrUij3KCvJIGJOx2AOl782bmBm/tHB3/sbM1mI7pEtnXNoAZQxmYkuY/L7/9R5h4JVUVvecX9StspugdKTm7kigHvVBO4SyfCvMfzlLI5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958373; c=relaxed/simple;
	bh=qKm4Msl3Cem+MEjo6MbTNbgxxMFgQbL2TfBbT6L4aIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=miJypJGi+mqREtLPJaCwzRPDsYso9+CBmmxJalK92A7ofoCChd4fzkhfq/s5A64gp2zpnJS0IpEL3o+oBG+3AlBFj1hvpol9Z/R8qbDBbZSwb6l5w/+7MBC2fQhgc6NxgFglQvHzigvBeOp5c903WLz3Uxp/9do6K+Dc0C34C7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAD771E8D;
	Thu, 26 Jun 2025 10:19:13 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.88.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9B9B33F762;
	Thu, 26 Jun 2025 10:19:28 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	Liam.Howlett@oracle.com
Cc: richard.weiyang@gmail.com,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 2/2] maple tree: Add and fix some comments
Date: Thu, 26 Jun 2025 22:49:18 +0530
Message-Id: <20250626171918.17261-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250626171918.17261-1-dev.jain@arm.com>
References: <20250626171918.17261-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comments explaining the fields for maple_metadata, since "end" is
ambiguous and "gap" can be confused as the largest gap, whereas it
is actually the offset of the largest gap.

MAPLE_ROOT_NODE is used for mt_mk_root() and mt_safe_root(), indicating
that it is used to mark the node as root. So fix the comment.

Add comment for mas_ascend() to explain, whose min and max we are
trying to find. Explain that, for example, if we are already on offset
zero, then the parent min is mas->min, otherwise we need to walk up
to find the implied pivot min.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/maple_tree.h | 4 ++--
 lib/maple_tree.c           | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index 9ef129038224..bafe143b1f78 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -75,8 +75,8 @@
  * searching for gaps or any other code that needs to find the end of the data.
  */
 struct maple_metadata {
-	unsigned char end;
-	unsigned char gap;
+	unsigned char end;	/* end of data */
+	unsigned char gap;	/* offset of largest gap */
 };
 
 /*
diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 6c89e6790fb5..e4735ccd06f2 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -338,7 +338,7 @@ static inline void mte_set_node_dead(struct maple_enode *mn)
 	smp_wmb(); /* Needed for RCU */
 }
 
-/* Bit 1 indicates the root is a node */
+/* Bit 1 indicates the node is the root */
 #define MAPLE_ROOT_NODE			0x02
 /* maple_type stored bit 3-6 */
 #define MAPLE_ENODE_TYPE_SHIFT		0x03
@@ -1053,7 +1053,7 @@ static inline void mte_set_gap(const struct maple_enode *mn,
  * mas_ascend() - Walk up a level of the tree.
  * @mas: The maple state
  *
- * Sets the @mas->max and @mas->min to the correct values when walking up.  This
+ * Sets the @mas->max and @mas->min for the parent node of mas->node.  This
  * may cause several levels of walking up to find the correct min and max.
  * May find a dead node which will cause a premature return.
  * Return: 1 on dead node, 0 otherwise
@@ -1098,6 +1098,11 @@ static int mas_ascend(struct ma_state *mas)
 
 	min = 0;
 	max = ULONG_MAX;
+
+	/*
+	 * !mas->offset => parent node min == mas->min. mas->offset => need
+	 * to walk up to find the implied pivot min.
+	 */
 	if (!mas->offset) {
 		min = mas->min;
 		set_min = true;
-- 
2.30.2

