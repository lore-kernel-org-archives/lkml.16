Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE62DFA3B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652088; cv=none; b=IQbczxeFlBaHkVJjKMWpXDgyG9MP6twsjinDS+lcpoYh8fXBE/ouNYRhMDalB3lK6119unkd/iWRnyUxj7AYqfbpkekJG9Y7+bi3BqnorBZsa2uNg/1aGKL9DSFDm5WWWo81WFAt0Qug8kalL0+2ron3caPu2bnrUoHVGJc7oKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652088; c=relaxed/simple;
	bh=MhY2mOMZdhe+hzFv2dy4g9r/qRqSqsAEIGToA20bzaQ=;
	h=Subject:To:Cc:From:Date:References:In-Reply-To:Message-Id; b=LKcfbE3rTE9oaQP/9aCznytOBUnN7ayQ4iics+7kz13xZeEi+GQV65DcM4dACegJg5BE7o2PjRQG0jUar/PV6f8I1IgEHo1xEmJvAwN6u4HVruiVCwNT/RVhdzrNEWmU3ezQHzphuA11Z7F/QRgpKP00PU14Q+HZpXpGfvUtvTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doajr4RJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doajr4RJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744652087; x=1776188087;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=MhY2mOMZdhe+hzFv2dy4g9r/qRqSqsAEIGToA20bzaQ=;
  b=doajr4RJGiD66PsEs2iOkIocg4n5+ekBAoyU3gk8DrjGLHIqK8Lkdb5N
   w9GxxWjyqeeMEdKYQXODhmUlMMTS1BGLe+F+5q+BYxK05Bf+7U9DhDp0f
   UEGvbGD3xnGa/rpoD5cYEfwuDYa+fw1R0rHDDRTORj1XvHzIoiu90JjzE
   L0teRqy1yLW1PEFp/YLYmzbwGmhbj9yUpCSktiuzPV5kZqhQqlzenPlAY
   oVj89RviQR1eZrtU0Uq+tbzeVaLTeNJpCzDf5m5LF2Nwcs2oMs5mNFX+M
   zg2JsXpJDNecswhizUbFHeTzXENZQELDkU/hdCMPHKplczCsjGvvyL+f2
   Q==;
X-CSE-ConnectionGUID: 1s8Ph3r5QoeOlyNSH2Iw1w==
X-CSE-MsgGUID: VYFEvhseRB6G+teWYbEmoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49790075"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49790075"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:34:46 -0700
X-CSE-ConnectionGUID: ZvxxU+riRbaX/HERPlNgyw==
X-CSE-MsgGUID: Sw8ZxByKQBaegkaXuvpFAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129645437"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2025 10:32:35 -0700
Subject: [PATCH 1/8] x86/mm: Always allocate a whole page for PAE PGDs
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Mon, 14 Apr 2025 10:32:34 -0700
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
In-Reply-To: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
Message-Id: <20250414173234.D34F0C3E@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

A hardware PAE PGD is only 32 bytes. A PGD is PAGE_SIZE in the other
paging modes. But for reasons*, the kernel _sometimes_ allocates a
whole page even though it only ever uses 32 bytes.

Make PAE less weird. Just allocate a page like the other paging modes.
This was already being done for PTI (and Xen in the past) and nobody
screamed that loudly about it so it can't be that bad.

 * The original reason for PAGE_SIZE allocations for the PAE PGDs was
   Xen's need to detect page table writes. But 32-bit PTI forced it too
   for reasons I'm unclear about.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---

 b/arch/x86/mm/pgtable.c |   62 +++---------------------------------------------
 1 file changed, 4 insertions(+), 58 deletions(-)

diff -puN arch/x86/mm/pgtable.c~no-pae-kmem_cache arch/x86/mm/pgtable.c
--- a/arch/x86/mm/pgtable.c~no-pae-kmem_cache	2025-04-09 11:49:39.531879317 -0700
+++ b/arch/x86/mm/pgtable.c	2025-04-09 11:49:39.534879427 -0700
@@ -318,68 +318,15 @@ static void pgd_prepopulate_user_pmd(str
 {
 }
 #endif
-/*
- * Xen paravirt assumes pgd table should be in one page. 64 bit kernel also
- * assumes that pgd should be in one page.
- *
- * But kernel with PAE paging that is not running as a Xen domain
- * only needs to allocate 32 bytes for pgd instead of one page.
- */
-#ifdef CONFIG_X86_PAE
-
-#include <linux/slab.h>
-
-#define PGD_SIZE	(PTRS_PER_PGD * sizeof(pgd_t))
-#define PGD_ALIGN	32
-
-static struct kmem_cache *pgd_cache;
-
-void __init pgtable_cache_init(void)
-{
-	/*
-	 * When PAE kernel is running as a Xen domain, it does not use
-	 * shared kernel pmd. And this requires a whole page for pgd.
-	 */
-	if (!SHARED_KERNEL_PMD)
-		return;
-
-	/*
-	 * when PAE kernel is not running as a Xen domain, it uses
-	 * shared kernel pmd. Shared kernel pmd does not require a whole
-	 * page for pgd. We are able to just allocate a 32-byte for pgd.
-	 * During boot time, we create a 32-byte slab for pgd table allocation.
-	 */
-	pgd_cache = kmem_cache_create("pgd_cache", PGD_SIZE, PGD_ALIGN,
-				      SLAB_PANIC, NULL);
-}
 
 static inline pgd_t *_pgd_alloc(struct mm_struct *mm)
 {
 	/*
-	 * If no SHARED_KERNEL_PMD, PAE kernel is running as a Xen domain.
-	 * We allocate one page for pgd.
+	 * PTI and Xen need a whole page for the PAE PGD
+	 * even though the hardware only needs 32 bytes.
+	 *
+	 * For simplicity, allocate a page for all users.
 	 */
-	if (!SHARED_KERNEL_PMD)
-		return __pgd_alloc(mm, PGD_ALLOCATION_ORDER);
-
-	/*
-	 * Now PAE kernel is not running as a Xen domain. We can allocate
-	 * a 32-byte slab for pgd to save memory space.
-	 */
-	return kmem_cache_alloc(pgd_cache, GFP_PGTABLE_USER);
-}
-
-static inline void _pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	if (!SHARED_KERNEL_PMD)
-		__pgd_free(mm, pgd);
-	else
-		kmem_cache_free(pgd_cache, pgd);
-}
-#else
-
-static inline pgd_t *_pgd_alloc(struct mm_struct *mm)
-{
 	return __pgd_alloc(mm, PGD_ALLOCATION_ORDER);
 }
 
@@ -387,7 +334,6 @@ static inline void _pgd_free(struct mm_s
 {
 	__pgd_free(mm, pgd);
 }
-#endif /* CONFIG_X86_PAE */
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
_
