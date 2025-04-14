Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E2754918
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652089; cv=none; b=T2gvV3Aus5sa19i0cMxlV1mdKU9gv12H8SJp0OtW2iv3L39yWXz51D8ehTdQMXxYOCR/Ebqb1ff1fDdQp3tGiHL3W0KMVlznoXNdMYTfSConvvUSM1kF+ndecsdYGIRXT+bCJhcdGc8Ac3zRCRbrnIP4MiPxvKuj6Dd/THISBGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652089; c=relaxed/simple;
	bh=NG+6+MBEFkyIVqB1KbOXKxdm5b+NHjrFNofalTaUw8I=;
	h=Subject:To:Cc:From:Date:References:In-Reply-To:Message-Id; b=lebdVCHmT/CayAgtuLd2/pfQ3UDBjGRJeN+oIxjBjdPnePsXVw1DMgfNS/rfEFZKtmA+0LljQYkS8GqrlWtFG6T7QYZp2LJFr7S+8yAoCwQ+e1mc6OveLKAwaH51kNmqBl0SZidZ4S+NsZlqztIxJvX4s8L2jCqrrigEmbOYo6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=min7s2X8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="min7s2X8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744652088; x=1776188088;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=NG+6+MBEFkyIVqB1KbOXKxdm5b+NHjrFNofalTaUw8I=;
  b=min7s2X8lcUIPd81VeH8d6+StCyId6KRANCKHAeF1aUkzU1kV95V3Tec
   1s36QV/sAXtVatFJ4j2CS8J6Ct4UIlV0tAcH/T7+5jJ880TE8mqCO/4fF
   4I8/R8exrxrQXIiVX03YCOoj1S4AgTchUN/DRekZEJzaBwb9JsIWSlsFo
   KK8mqDix+/a4lcm3HfAhV9QqGg/gILMF0e6P3B5BC6KY03js7o6zjtNuy
   5GFIqFwQhiil8zOfJu76XcZk3MnS1xsTQjEU122x8BwTgpqsxkDYM0s+1
   LjFbqvcW/nHkPKO6oLrFBOEORppPXg1NV9yWpY2bGDipmaFKXVhDa+L4/
   Q==;
X-CSE-ConnectionGUID: 8SbwaV8aSLqY7O4tymlhLw==
X-CSE-MsgGUID: q8uwyUTuSGiaUwZIMxq9eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49790082"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49790082"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:34:47 -0700
X-CSE-ConnectionGUID: 69Zi+r/rTeO+qJ7gE4s5FA==
X-CSE-MsgGUID: SQ0Jz3XgTQGiGt8P8bqS+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129645440"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2025 10:32:37 -0700
Subject: [PATCH 2/8] x86/mm: Always "broadcast" PMD setting operations
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Mon, 14 Apr 2025 10:32:35 -0700
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
In-Reply-To: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
Message-Id: <20250414173235.F63F50D1@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

Kernel PMDs can either be shared across processes or private to a
process.  On 64-bit, they are always shared.  32-bit non-PAE hardware
does not have PMDs, but the kernel logically squishes them into the
PGD and treats them as private. Here are the four cases:

	64-bit:                Shared
	32-bit: non-PAE:       Private
	32-bit:     PAE+  PTI: Private
	32-bit:     PAE+noPTI: Shared

Note that 32-bit is all "Private" except for PAE+noPTI being an
oddball.  The 32-bit+PAE+noPTI case will be made like the rest of
32-bit shortly.

But until that can be done, temporarily treat the 32-bit+PAE+noPTI
case as Private. This will do unnecessary walks across pgd_list and
unnecessary PTE setting but should be otherwise harmless.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---

 b/arch/x86/mm/pat/set_memory.c |    4 ++--
 b/arch/x86/mm/pgtable.c        |   11 +++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff -puN arch/x86/mm/pat/set_memory.c~always-sync-kernel-mapping-updates arch/x86/mm/pat/set_memory.c
--- a/arch/x86/mm/pat/set_memory.c~always-sync-kernel-mapping-updates	2025-04-09 12:00:17.126319212 -0700
+++ b/arch/x86/mm/pat/set_memory.c	2025-04-09 12:53:28.082212490 -0700
@@ -889,7 +889,7 @@ static void __set_pmd_pte(pte_t *kpte, u
 	/* change init_mm */
 	set_pte_atomic(kpte, pte);
 #ifdef CONFIG_X86_32
-	if (!SHARED_KERNEL_PMD) {
+	{
 		struct page *page;
 
 		list_for_each_entry(page, &pgd_list, lru) {
@@ -1293,7 +1293,7 @@ static int collapse_pmd_page(pmd_t *pmd,
 	/* Queue the page table to be freed after TLB flush */
 	list_add(&page_ptdesc(pmd_page(old_pmd))->pt_list, pgtables);
 
-	if (IS_ENABLED(CONFIG_X86_32) && !SHARED_KERNEL_PMD) {
+	if (IS_ENABLED(CONFIG_X86_32)) {
 		struct page *page;
 
 		/* Update all PGD tables to use the same large page */
diff -puN arch/x86/mm/pgtable.c~always-sync-kernel-mapping-updates arch/x86/mm/pgtable.c
--- a/arch/x86/mm/pgtable.c~always-sync-kernel-mapping-updates	2025-04-09 12:00:17.128319285 -0700
+++ b/arch/x86/mm/pgtable.c	2025-04-09 12:53:09.217519767 -0700
@@ -97,18 +97,13 @@ static void pgd_ctor(struct mm_struct *m
 				KERNEL_PGD_PTRS);
 	}
 
-	/* list required to sync kernel mapping updates */
-	if (!SHARED_KERNEL_PMD) {
-		pgd_set_mm(pgd, mm);
-		pgd_list_add(pgd);
-	}
+	/* List used to sync kernel mapping updates */
+	pgd_set_mm(pgd, mm);
+	pgd_list_add(pgd);
 }
 
 static void pgd_dtor(pgd_t *pgd)
 {
-	if (SHARED_KERNEL_PMD)
-		return;
-
 	spin_lock(&pgd_lock);
 	pgd_list_del(pgd);
 	spin_unlock(&pgd_lock);
_
