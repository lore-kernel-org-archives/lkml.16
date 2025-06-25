Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66F314F104
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750815624; cv=none; b=X6S+pbl0rUbKTgkNGuI6rYqQSw69LZx26zO65195ebD+AipC0Bo5u+ydtRsqiH4iH6SnbMiuDaHt3afEldpf4pYBCz15V0iAx60+iFuX37VNP+w9lDQHLNCbfk+O9UTl8v0txRbjz63vImo32uGF30dhtlQkqU1ZjKZeJ0k2VC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750815624; c=relaxed/simple;
	bh=co0Q1y/rXSzimjkXG3Wp8fvQQPMKHvVoT8Ty+FMqMak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VZysIfVmSBUjIleODE43kz6ndhetLhJLPHkmNafd82gpQLE4Ea29vjSrzp3xuJECIJF0veJe+p1PdyedIe5CwqUSrPJpBC9Kf+r9QNVbOmVIdGU73TCAb4vYImCA/Z3gYj9zpVZVqIR1htUCbzSyjHTLkwUFEubWlWDPTXy4gWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=abiCJSWz; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="abiCJSWz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750815618; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=RR4yBaE/4iR6jBPOOmDgatZtsb6Rosbucf0MZffw3Vc=;
	b=abiCJSWzvNlVMyBaJdUDJVeJNSu2YquKt+7k/3k+TxlufyGRPO3QDGLj7JKoDWhoJcO9ok3xt2VPsH0BEGbTKIDZvwRr49HxRcu8KUfcGfTR9t/6abLwoQzSeeBBY50a6CIDh8vUlU/o1Ht08585CRolArQpGVwYpvQQK4y0mQI=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeqMLhl_1750815617 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Jun 2025 09:40:17 +0800
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
Subject: [PATCH v4 1/2] mm: huge_memory: disallow hugepages if the system-wide THP sysfs settings are disabled
Date: Wed, 25 Jun 2025 09:40:09 +0800
Message-ID: <25252834a20a2e8f611ba572d9fae98fb8d67982.1750815384.git.baolin.wang@linux.alibaba.com>
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

When invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS flag is not
specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
callers who do not specify this flag, it creates a odd and surprising situation
where a sysadmin specifying 'never' for all THP sizes still observing THP pages
being allocated and used on the system.

The motivating case for this is MADV_COLLAPSE. The MADV_COLLAPSE will ignore
the system-wide Anon THP sysfs settings, which means that even though we have
disabled the Anon THP configuration, MADV_COLLAPSE will still attempt to collapse
into a Anon THP. This violates the rule we have agreed upon: never means never.

Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there is only
one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
collapse_pte_mapped_thp() function, but I believe this is reasonable from its
comments.

"
/*
 * If we are here, we've succeeded in replacing all the native pages
 * in the page cache with a single hugepage. If a mm were to fault-in
 * this memory (mapped by a suitably aligned VMA), we'd get the hugepage
 * and map it by a PMD, regardless of sysfs THP settings. As such, let's
 * analogously elide sysfs THP settings here.
 */
if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
"

Another rule for madvise, referring to David's suggestion: “allowing for
collapsing in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".

To address this issue, the current strategy should be:

If no hugepage modes are enabled for the desired orders, nor can we enable them
by inheriting from a 'global' enabled setting - then it must be the case that
all desired orders either specify or inherit 'NEVER' - and we must abort.

Meanwhile, we should fix the khugepaged selftest for MADV_COLLAPSE. Originally,
we could prevent khugepaged by setting THP_MADVISE and removing MADV_HUGEPAGE
setting, while madvise_collapse() can still perform THP collapse. However,
this would cause some test cases to fail because some tests previously set
MADV_NOHUGEPAGE, and now there is no other way to clear the MADV_NOHUGEPAGE
flag except for setting MADV_HUGEPAGE. Therefore, it should be changed to
THP_ALWAYS here to allow madvise_collapse() to perform THP collapse.

Suggested-by: David Hildenbrand <david@redhat.com>
Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/huge_mm.h                 | 51 ++++++++++++++++++-------
 tools/testing/selftests/mm/khugepaged.c |  6 +--
 2 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 4d5bb67dc4ec..ab70ca4e704b 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -267,6 +267,42 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 					 unsigned long tva_flags,
 					 unsigned long orders);
 
+/* Strictly mask requested anonymous orders according to sysfs settings. */
+static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
+		unsigned long tva_flags, unsigned long orders)
+{
+	const unsigned long always = READ_ONCE(huge_anon_orders_always);
+	const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
+	const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
+	const unsigned long never = ~(always | madvise | inherit);
+	const bool inherit_never = !hugepage_global_enabled();
+
+	/* Disallow orders that are set to NEVER directly ... */
+	orders &= ~never;
+
+	/* ... or through inheritance (global == NEVER). */
+	if (inherit_never)
+		orders &= ~inherit;
+
+	/*
+	 * Otherwise, we only enforce sysfs settings if asked. In addition,
+	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
+	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
+	 * set.
+	 */
+	if (!(tva_flags & TVA_ENFORCE_SYSFS))
+		return orders;
+
+	/* We already excluded never inherit above. */
+	if (vm_flags & VM_HUGEPAGE)
+		return orders & (always | madvise | inherit);
+
+	if (hugepage_global_always())
+		return orders & (always | inherit);
+
+	return orders & always;
+}
+
 /**
  * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
  * @vma:  the vm area to check
@@ -289,19 +325,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
 				       unsigned long orders)
 {
 	/* Optimization to check if required orders are enabled early. */
-	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
-		unsigned long mask = READ_ONCE(huge_anon_orders_always);
-
-		if (vm_flags & VM_HUGEPAGE)
-			mask |= READ_ONCE(huge_anon_orders_madvise);
-		if (hugepage_global_always() ||
-		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
-			mask |= READ_ONCE(huge_anon_orders_inherit);
-
-		orders &= mask;
-		if (!orders)
-			return 0;
-	}
+	if (vma_is_anonymous(vma))
+		orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
 
 	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
 }
diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 4341ce6b3b38..85bfff53dba6 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -501,11 +501,7 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
 
 	printf("%s...", msg);
 
-	/*
-	 * Prevent khugepaged interference and tests that MADV_COLLAPSE
-	 * ignores /sys/kernel/mm/transparent_hugepage/enabled
-	 */
-	settings.thp_enabled = THP_NEVER;
+	settings.thp_enabled = THP_ALWAYS;
 	settings.shmem_enabled = SHMEM_NEVER;
 	thp_push_settings(&settings);
 
-- 
2.43.5

