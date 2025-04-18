Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADD22144CC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744991777; cv=none; b=AGX8v8ouTsNoYrUO11/aF4xUbW4MHrTA+WD3aIafxM0wSt697P3QJYEGCoZiA45OgXIDFX+PaU4RjXPq/ahQYf4pjs+r6+rR64c76cIH2IVuDa3+Lkl6fhqGmIaABfYqFdyNMIddCH4W7EKM1r5AYRNCddfDIjFOC+vPr2/2UcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744991777; c=relaxed/simple;
	bh=dZTimZ+WYd89oH+b9LeD5ePurK4TGtdv1UNMkDENZc0=;
	h=Subject:To:Cc:From:Date:References:In-Reply-To:Message-Id; b=GsNQsPyhzR843j+9Ok0udvH3Ck4TFX02MhLtwsqqKcn8k0Q5tZas0x7AlLPgIU1vD/Dc/3xWUFBCrF/b4KhLnR19JisT/9Id6fFJhtyBTv9+4J4xT4OSIJlBZtKRiFwqY7fBm3Srl6dvsU4KGCe1EcB0SZiMXZi9a5hRopM8LZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXWXoyJh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXWXoyJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744991776; x=1776527776;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=dZTimZ+WYd89oH+b9LeD5ePurK4TGtdv1UNMkDENZc0=;
  b=PXWXoyJhIanZp4IhFDim/HGx+X6kqRy7lXvANCJzo9TCabx3lT+2Kco7
   xOMfdgbsnSs1/UTKXsnK4A/zNBuL+fNysCN3xhU9RdPO+7vJ5lYmF4NIX
   hrpvQFTY67YPBYTA4uOiyH/SE7H3j3fzSywBAK9piwawNtmroshQ4Wy8P
   O1GJAmII39JzQxL/NQBnk4ayWfYz+ZwN4GtgWNTfu0Kpnki6szD/wgPpC
   hmIbOW+1pqDlNZWHAxJMZV6I1HVngX+CgfRo+ZdhM1YHOe97zUS2WOEaR
   XEhRxV1KkFPXsUeTmPGHBvx0SqupQHkYsKt1QDL5RUZD2WUdbZL8+oAUg
   w==;
X-CSE-ConnectionGUID: F/j7853rQ2afJ0/9BcZPoQ==
X-CSE-MsgGUID: S0WKadIfSuWEJurkSycvUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46742621"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="46742621"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 08:56:14 -0700
X-CSE-ConnectionGUID: TKPnemEYTN+795SQJWLNwA==
X-CSE-MsgGUID: uEtFBgDmQTWa9UomWDFjKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="168347199"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa001.jf.intel.com with ESMTP; 18 Apr 2025 08:56:15 -0700
Subject: [PATCH 1/2] x86/mm: Kill a 32-bit #ifdef for shared PMD handling
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Fri, 18 Apr 2025 08:56:14 -0700
References: <20250418155612.8F276BC7@davehans-spike.ostc.intel.com>
In-Reply-To: <20250418155612.8F276BC7@davehans-spike.ostc.intel.com>
Message-Id: <20250418155614.8F925958@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

This block of code used to be:

	if (SHARED_KERNEL_PMD)

But it was zapped when 32-bit kernels transitioned to private
(non-shared) PMDs. It also made it rather unclear what the block
of code is doing in the first place.

Remove the #ifdef and replace it with IS_ENABLED(). Unindent the
code block and add an actually useful comment about what it is
doing.

Suggested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---

 b/arch/x86/mm/pat/set_memory.c |   41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff -puN arch/x86/mm/pat/set_memory.c~kill-CONFIG_X86_32-ifdef arch/x86/mm/pat/set_memory.c
--- a/arch/x86/mm/pat/set_memory.c~kill-CONFIG_X86_32-ifdef	2025-04-18 08:37:32.149932662 -0700
+++ b/arch/x86/mm/pat/set_memory.c	2025-04-18 08:37:32.152932772 -0700
@@ -881,31 +881,32 @@ phys_addr_t slow_virt_to_phys(void *__vi
 }
 EXPORT_SYMBOL_GPL(slow_virt_to_phys);
 
-/*
- * Set the new pmd in all the pgds we know about:
- */
 static void __set_pmd_pte(pte_t *kpte, unsigned long address, pte_t pte)
 {
+	struct page *page;
+
 	/* change init_mm */
 	set_pte_atomic(kpte, pte);
-#ifdef CONFIG_X86_32
-	{
-		struct page *page;
-
-		list_for_each_entry(page, &pgd_list, lru) {
-			pgd_t *pgd;
-			p4d_t *p4d;
-			pud_t *pud;
-			pmd_t *pmd;
-
-			pgd = (pgd_t *)page_address(page) + pgd_index(address);
-			p4d = p4d_offset(pgd, address);
-			pud = pud_offset(p4d, address);
-			pmd = pmd_offset(pud, address);
-			set_pte_atomic((pte_t *)pmd, pte);
-		}
+
+	if (IS_ENABLED(CONFIG_X86_64))
+		return;
+
+	/*
+	 * 32-bit mm_structs don't share kernel PMD pages.
+	 * Propagate the change to each relevant PMD entry:
+	 */
+	list_for_each_entry(page, &pgd_list, lru) {
+		pgd_t *pgd;
+		p4d_t *p4d;
+		pud_t *pud;
+		pmd_t *pmd;
+
+		pgd = (pgd_t *)page_address(page) + pgd_index(address);
+		p4d = p4d_offset(pgd, address);
+		pud = pud_offset(p4d, address);
+		pmd = pmd_offset(pud, address);
+		set_pte_atomic((pte_t *)pmd, pte);
 	}
-#endif
 }
 
 static pgprot_t pgprot_clear_protnone_bits(pgprot_t prot)
_
