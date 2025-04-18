Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148FC21421B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744991777; cv=none; b=m8VShQI0ddhgmurQYx2w8liGiPA6U3BBIQuR8d5UhRrKRyXLYQ71umGNRE0gyakwa1v4Whi/LwouQiK7+fcfSeXKI1ZKgiobIgKeFlXMffjo5aYCMFcIiXgaFmhMN827c2MFA+L40Y95texUrggiZLcE0p3hxIDSKOGc+bvyfz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744991777; c=relaxed/simple;
	bh=m9VYpqH1Phf0B/tx5ueFdQbWu07BUOyrKunKIcW6NMA=;
	h=Subject:To:Cc:From:Date:References:In-Reply-To:Message-Id; b=GyBY5FVmipzwh9KGRioOkjCRnwa9Xsgn55aU3WiLdFzQZFWneSZkicEWabDohfkzitBHIMhnMTVEM74pnRIe/2Of92ueTZvk5S+Gbd8qZdo1MFDNQEUXMbu8IOWwq7MssAD1vs9tewMrvDOCE+C7WDkGZ5KTxlLLVujSteMFkbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKUvwCpR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKUvwCpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744991776; x=1776527776;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=m9VYpqH1Phf0B/tx5ueFdQbWu07BUOyrKunKIcW6NMA=;
  b=AKUvwCpRlwWfReuMuU/iPan97xoatUkU/KidZJGkJ87C6fHncLRn7+jy
   ar6pE+jvatS1gExF7gLhcA33vobQhgk/uy3qRH6goNASy9QFpeNJNgsGJ
   BrXlsFvnU5Ke1AYB0mHZlglxq/ijoUet2r9tLKfvhZ/3LtpK8jLlHaYSq
   9TMP0QuiG0MktDdJndEltwc1KRELhZRUVTff4KI+zP6rde7i2Xk54lZFE
   c5v0NS11khxJa3eo4XjAwrQlkJM/C6Es1HsMi1ROp1TYFM8lhmaH+eFSw
   p1LwQi0NGDjGZLfpgqRp/Oo2rug/Yo0c0zZgAV4+ECuYVAtLDVPBIsHKh
   w==;
X-CSE-ConnectionGUID: x1rlV57iRj+r0x5N3Tq4FQ==
X-CSE-MsgGUID: /Mic3tpDT2yIFWF7G1sN3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46742633"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="46742633"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 08:56:16 -0700
X-CSE-ConnectionGUID: 6fT0BW9CRua+bxmQmjVxpg==
X-CSE-MsgGUID: nvZXoFbyQNqHnWIvBHLnhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="168347211"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa001.jf.intel.com with ESMTP; 18 Apr 2025 08:56:16 -0700
Subject: [PATCH 2/2] x86/mm: Move duplicated 32-bit page table sync mask to common code
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Fri, 18 Apr 2025 08:56:15 -0700
References: <20250418155612.8F276BC7@davehans-spike.ostc.intel.com>
In-Reply-To: <20250418155612.8F276BC7@davehans-spike.ostc.intel.com>
Message-Id: <20250418155615.79C12364@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

The vmalloc() code needs to know when to propagate changes to across
mms because the rules differ based on architecture and kernel config.
It does this with a bitmap: ARCH_PAGE_TABLE_SYNC_MASK which tells
vmalloc when to call back in to arch-specific code to propagate
page table changes.

The 32-bit x86 rules are less exciting now and are unified across
PAE (3-level) and 2-level paging so the two for their constants
define the same value.

Move the common value to the common pgtable_32_types.h.

Suggested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---

 b/arch/x86/include/asm/pgtable-2level_types.h |    2 --
 b/arch/x86/include/asm/pgtable-3level_types.h |    2 --
 b/arch/x86/include/asm/pgtable_32_types.h     |    2 ++
 3 files changed, 2 insertions(+), 4 deletions(-)

diff -puN arch/x86/include/asm/pgtable-2level_types.h~move-ARCH_PAGE_TABLE_SYNC_MASK arch/x86/include/asm/pgtable-2level_types.h
--- a/arch/x86/include/asm/pgtable-2level_types.h~move-ARCH_PAGE_TABLE_SYNC_MASK	2025-04-18 08:37:32.631950373 -0700
+++ b/arch/x86/include/asm/pgtable-2level_types.h	2025-04-18 08:37:32.640950703 -0700
@@ -18,8 +18,6 @@ typedef union {
 } pte_t;
 #endif	/* !__ASSEMBLER__ */
 
-#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED
-
 /*
  * Traditional i386 two-level paging structure:
  */
diff -puN arch/x86/include/asm/pgtable_32_types.h~move-ARCH_PAGE_TABLE_SYNC_MASK arch/x86/include/asm/pgtable_32_types.h
--- a/arch/x86/include/asm/pgtable_32_types.h~move-ARCH_PAGE_TABLE_SYNC_MASK	2025-04-18 08:37:32.635950520 -0700
+++ b/arch/x86/include/asm/pgtable_32_types.h	2025-04-18 08:37:32.640950703 -0700
@@ -20,4 +20,6 @@
 #define PGDIR_SIZE	(1UL << PGDIR_SHIFT)
 #define PGDIR_MASK	(~(PGDIR_SIZE - 1))
 
+#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED
+
 #endif /* _ASM_X86_PGTABLE_32_TYPES_H */
diff -puN arch/x86/include/asm/pgtable-3level_types.h~move-ARCH_PAGE_TABLE_SYNC_MASK arch/x86/include/asm/pgtable-3level_types.h
--- a/arch/x86/include/asm/pgtable-3level_types.h~move-ARCH_PAGE_TABLE_SYNC_MASK	2025-04-18 08:37:32.637950593 -0700
+++ b/arch/x86/include/asm/pgtable-3level_types.h	2025-04-18 08:37:32.640950703 -0700
@@ -27,8 +27,6 @@ typedef union {
 } pmd_t;
 #endif	/* !__ASSEMBLER__ */
 
-#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED
-
 /*
  * PGDIR_SHIFT determines what a top-level page table entry can map
  */
_
