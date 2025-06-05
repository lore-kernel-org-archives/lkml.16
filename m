Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C8A2036FE
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110487; cv=none; b=DhICwKPjSB5oWEOpr6tGYGymobeJOvdFBBEpKxePnyuNpM/Q6Q0sPaQiUG11AykKSo0iyCjK/l1lJii/08H7Ph2vzkBLCqE7kB2FRv9XA/7Cd0dC/GysJkVY7c4sljKkm3s313s0az5afjtB+eNJhZ7+a0avgjuH+lghzLrWwgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110487; c=relaxed/simple;
	bh=Tcz70U8JZfh0iopbLwoN+FiTKUvlh0lEEAacCCr2wUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjF7FiWN/rsygOMOgROvdCtC98t4EqmxgzmpH8fx3OMLZ2Mwz5AOrSJVxhRhpLPv2H9FNs3nIG6GbVKb7v9DiJ+kx7vON0E3tisHXljqXsQMQAMkeDYGTH7o0UNQGOaDtjBz5K02toDqAR9AeFfCmXsD6FBsjq/l46keA1SWaUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=goA/OwPn; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="goA/OwPn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749110477; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=ClldW9K+An+N0FGacslbT4R62a2U/aH83hunRBaO6nc=;
	b=goA/OwPnrFNsVe2LXt3baGqmyy5LigqVaWw+m1/aHYPSAR4sug8REHOU114Lp6nqSHB7LTFUvBMV5oNeJPHOQBQOoRO3M4sJ9gxP3NGUujUAWLeuJDE/UZMNPTCdcDs2RvedruQf2l4u1HrrzD4xMmQCJMmVw9GA7cGKv9SkJRY=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wd7PMBy_1749110474 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Jun 2025 16:01:15 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@redhat.com
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm: shmem: disallow hugepages if the system-wide shmem THP sysfs settings are disabled
Date: Thu,  5 Jun 2025 16:00:59 +0800
Message-ID: <39d7617a6142c6091f233357171c5793e0992d36.1749109709.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MADV_COLLAPSE will ignore the system-wide shmem THP sysfs settings, which
means that even though we have disabled the shmem THP configuration, MADV_COLLAPSE
will still attempt to collapse into a shmem THP. This violates the rule we have
agreed upon: never means never.

Another rule for madvise, referring to David's suggestion: “allowing for collapsing
in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".

Then the current strategy is:

For shmem, if none of always, madvise, within_size, and inherit have enabled
PMD-sized THP, then MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.

For tmpfs, if the mount option is set with the 'huge=never' parameter, then
MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.

Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/huge_memory.c | 2 +-
 mm/shmem.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d3e66136e41a..a8cfa37cae72 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -166,7 +166,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 	 * own flags.
 	 */
 	if (!in_pf && shmem_file(vma->vm_file))
-		return shmem_allowable_huge_orders(file_inode(vma->vm_file),
+		return orders & shmem_allowable_huge_orders(file_inode(vma->vm_file),
 						   vma, vma->vm_pgoff, 0,
 						   !enforce_sysfs);
 
diff --git a/mm/shmem.c b/mm/shmem.c
index 4b42419ce6b2..9af45d4e27e6 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -625,7 +625,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
 		return 0;
 	if (shmem_huge == SHMEM_HUGE_DENY)
 		return 0;
-	if (shmem_huge_force || shmem_huge == SHMEM_HUGE_FORCE)
+	if (shmem_huge == SHMEM_HUGE_FORCE)
 		return maybe_pmd_order;
 
 	/*
@@ -660,7 +660,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
 
 		fallthrough;
 	case SHMEM_HUGE_ADVISE:
-		if (vm_flags & VM_HUGEPAGE)
+		if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
 			return maybe_pmd_order;
 		fallthrough;
 	default:
@@ -1790,7 +1790,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 	/* Allow mTHP that will be fully within i_size. */
 	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
 
-	if (vm_flags & VM_HUGEPAGE)
+	if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
 		mask |= READ_ONCE(huge_shmem_orders_madvise);
 
 	if (global_orders > 0)
-- 
2.43.5

