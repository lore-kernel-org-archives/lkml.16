Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4D514F104
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750815630; cv=none; b=n21GFMsVJGISmTqJHobwfQ6buYl/X8kr1ItrqdIASmMhp5olCqamH+0cTT20eA1UWQoE7/L55+C7URvQAjKMtReXC9Nia8+Y7IjQa6zUfSPKRWrVPgV906BlqeoEbzONlc4lauwvb97BDd6HTBz4m3hW+oN2MoiGaHtTIazHKbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750815630; c=relaxed/simple;
	bh=tu6Uo+sML5JLhviX2iNA/T/NYy2/LgiEEp34S6HBd6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sD7t1bhXpdJD0F6Ea7/nVMFFyK3QMoMSlT6NwWd7Jhw8SO1haTcbYg6PE7hGCzzVRCJaA3TCa3OHtYb0l0h0XfdJwx6NBeQ23cbS38EiEgn2jyBjektJGNAY+tlfRkblj2GFoUOZ2mCJr7cQjbbmvBy5y/N0yzFbb5LnSsm0DLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Dxi26+wi; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Dxi26+wi"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750815619; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=GL9/OiTkXksGZXz7UtfDaxwwQxp+Wh0rcjedimt1h+Y=;
	b=Dxi26+wiEg0rCBlO4WCZmvGJIuVrM1Ipxi/m+k8f523S/UAuWEEYd0nfcRkN19pdX9tMw+O4bYu6fdMSNN5FNMqhN5F1ez5pYlKC9wtD5r6I1prk0YJ8bDv8v2G9PugseSMYY62Nuji39uZiBAgzRQ61IND+tgiCeJkxs7we3Mg=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeqBlk4_1750815618 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Jun 2025 09:40:19 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@redhat.com
Cc: ziy@nvidia.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] mm: shmem: disallow hugepages if the system-wide shmem THP sysfs settings are disabled
Date: Wed, 25 Jun 2025 09:40:10 +0800
Message-ID: <dbcf049b097d6197978720ca89a22a693e1ff235.1750815384.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS flag is not
specified, we will ignore the THP sysfs settings. And the MADV_COLLAPSE is an
example of such a case.

The MADV_COLLAPSE will ignore the system-wide shmem THP sysfs settings, which
means that even though we have disabled the shmem THP configuration, MADV_COLLAPSE
will still attempt to collapse into a shmem THP. This violates the rule we have
agreed upon: never means never.

Another rule for madvise, referring to David's suggestion: “allowing for collapsing
in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".

To fix the MADV_COLLAPSE issue for shmem, then the current strategy should be:

For shmem, if none of ‘always’, ‘madvise’, ‘within_size’, and ‘inherit’ have enabled
PMD-sized THP, then MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.
Similarly, if 'deny' is set, it will also prohibit MADV_COLLAPSE.

For tmpfs, if the mount option is set with the 'huge=never' parameter, then
MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.

Meanwhile, we should fix the khugepaged selftest for shmem MADV_COLLAPSE by enabling
shmem THP like anonymous pages collapse.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c                              | 6 +++---
 tools/testing/selftests/mm/khugepaged.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 2b19965d27df..e3f51fab2b7d 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -637,7 +637,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
 		return 0;
 	if (shmem_huge == SHMEM_HUGE_DENY)
 		return 0;
-	if (shmem_huge_force || shmem_huge == SHMEM_HUGE_FORCE)
+	if (shmem_huge == SHMEM_HUGE_FORCE)
 		return maybe_pmd_order;
 
 	/*
@@ -672,7 +672,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
 
 		fallthrough;
 	case SHMEM_HUGE_ADVISE:
-		if (vm_flags & VM_HUGEPAGE)
+		if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
 			return maybe_pmd_order;
 		fallthrough;
 	default:
@@ -1806,7 +1806,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 	/* Allow mTHP that will be fully within i_size. */
 	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
 
-	if (vm_flags & VM_HUGEPAGE)
+	if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
 		mask |= READ_ONCE(huge_shmem_orders_madvise);
 
 	if (global_orders > 0)
diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 85bfff53dba6..9517ed99c382 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -502,7 +502,7 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
 	printf("%s...", msg);
 
 	settings.thp_enabled = THP_ALWAYS;
-	settings.shmem_enabled = SHMEM_NEVER;
+	settings.shmem_enabled = SHMEM_ALWAYS;
 	thp_push_settings(&settings);
 
 	/* Clear VM_NOHUGEPAGE */
-- 
2.43.5

