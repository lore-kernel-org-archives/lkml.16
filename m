Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3CD1DE887
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921483; cv=none; b=YtGZ9vCGEDQSBqGjwtfbHgwz9h4eHc6hAC2goMIl7U+f0Wgg8ni2uXtZyg9kwNOV/uHdYPEINfv78/qHBCWRPcIZSYONIry8igFXTuCzhalcXFF7GM0JsISHCy0xNMCuCwptUdNZGL1EDCTF1n6BO/lNrgyzuR5z/A/hv9zjeSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921483; c=relaxed/simple;
	bh=gxmmTecUrLY2z0u8yBant1fbdWds+nAECV3+pMx/Ers=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ob3AzPtYTVkr8Lg/tMZaHRQZNBmSDEe+3i0Y5CpjzXpg3VamQ6sDYJaBj1PhnOvjLriSto+ZJgZqQ5DrEzde/KyBtiJpXBvFfWLt0mtYOBZ1Yql2/vNc9Pysh8ILnEMyfrnTYoxetg+TRJeGy6E9TEXyY9qGd9HvJ4v2/U0xvko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=oMbqE4Uv; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="oMbqE4Uv"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738921472; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=3PS22iDEZK02vBCkQcniOhhJpKU1weoXF4MOKLaGix0=;
	b=oMbqE4Uv00/zuNB+vQ/BwfUVYClGY9Hhs6mBblpKB2ysEJKVjoYlXRKyGPlKoyXoJZRNls4ekMwuwRcV+AYapQy//UowJe40KwbSF9ZyK21QFYbOfhv7zYcN4DZHWuOHtQyozcFX/rP0jvf9bsIpKPvYjp/x+PhHtWkMeW7hn8w=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WOz6dmv_1738921471 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:44:31 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com
Cc: david@redhat.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] mm: shmem: factor out the within_size logic into a new helper
Date: Fri,  7 Feb 2025 17:44:21 +0800
Message-Id: <527dea9d7e32fe6b94c7fe00df2c126203017911.1738918357.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
References: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out the within_size logic into a new helper to remove duplicate
code.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 53 +++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index c243d814f2b0..671f63063fd4 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -590,6 +590,28 @@ shmem_mapping_size_orders(struct address_space *mapping, pgoff_t index, loff_t w
 	return order > 0 ? BIT(order + 1) - 1 : 0;
 }
 
+static unsigned int shmem_get_orders_within_size(struct inode *inode,
+		unsigned long within_size_orders, pgoff_t index,
+		loff_t write_end)
+{
+	pgoff_t aligned_index;
+	unsigned long order;
+	loff_t i_size;
+
+	order = highest_order(within_size_orders);
+	while (within_size_orders) {
+		aligned_index = round_up(index + 1, 1 << order);
+		i_size = max(write_end, i_size_read(inode));
+		i_size = round_up(i_size, PAGE_SIZE);
+		if (i_size >> PAGE_SHIFT >= aligned_index)
+			return within_size_orders;
+
+		order = next_order(&within_size_orders, order);
+	}
+
+	return 0;
+}
+
 static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index,
 					      loff_t write_end, bool shmem_huge_force,
 					      struct vm_area_struct *vma,
@@ -598,9 +620,6 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
 	unsigned int maybe_pmd_order = HPAGE_PMD_ORDER > MAX_PAGECACHE_ORDER ?
 		0 : BIT(HPAGE_PMD_ORDER);
 	unsigned long within_size_orders;
-	unsigned int order;
-	pgoff_t aligned_index;
-	loff_t i_size;
 
 	if (!S_ISREG(inode->i_mode))
 		return 0;
@@ -634,16 +653,11 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
 			within_size_orders = shmem_mapping_size_orders(inode->i_mapping,
 								       index, write_end);
 
-		order = highest_order(within_size_orders);
-		while (within_size_orders) {
-			aligned_index = round_up(index + 1, 1 << order);
-			i_size = max(write_end, i_size_read(inode));
-			i_size = round_up(i_size, PAGE_SIZE);
-			if (i_size >> PAGE_SHIFT >= aligned_index)
-				return within_size_orders;
+		within_size_orders = shmem_get_orders_within_size(inode, within_size_orders,
+								  index, write_end);
+		if (within_size_orders > 0)
+			return within_size_orders;
 
-			order = next_order(&within_size_orders, order);
-		}
 		fallthrough;
 	case SHMEM_HUGE_ADVISE:
 		if (vm_flags & VM_HUGEPAGE)
@@ -1756,10 +1770,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 	unsigned long mask = READ_ONCE(huge_shmem_orders_always);
 	unsigned long within_size_orders = READ_ONCE(huge_shmem_orders_within_size);
 	unsigned long vm_flags = vma ? vma->vm_flags : 0;
-	pgoff_t aligned_index;
 	unsigned int global_orders;
-	loff_t i_size;
-	int order;
 
 	if (thp_disabled_by_hw() || (vma && vma_thp_disabled(vma, vm_flags)))
 		return 0;
@@ -1785,17 +1796,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 		return READ_ONCE(huge_shmem_orders_inherit);
 
 	/* Allow mTHP that will be fully within i_size. */
-	order = highest_order(within_size_orders);
-	while (within_size_orders) {
-		aligned_index = round_up(index + 1, 1 << order);
-		i_size = round_up(i_size_read(inode), PAGE_SIZE);
-		if (i_size >> PAGE_SHIFT >= aligned_index) {
-			mask |= within_size_orders;
-			break;
-		}
-
-		order = next_order(&within_size_orders, order);
-	}
+	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
 
 	if (vm_flags & VM_HUGEPAGE)
 		mask |= READ_ONCE(huge_shmem_orders_madvise);
-- 
2.39.3

