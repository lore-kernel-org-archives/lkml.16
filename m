Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3786128A1E8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652091; cv=none; b=Zd5GR+pfMNgEu2GzVaZIVRLfguPiI7evNQqTDqnRDZ9ou08oYBgqfzVl8t2VE0K26nn5sNlaVigtXzMphv3COmLT9x+UkHoXhWMWg5DoCS8gi6vZYRCvXh3OIo2GzNwRMNzX0g7GKDQWWSuqbifwKHsqI4WWMhHzkJ+VbGcdxZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652091; c=relaxed/simple;
	bh=hDx80Z9fQZj/FMDythfysWbbLq8UW8DDMwA0KfNSaVY=;
	h=Subject:To:Cc:From:Date:References:In-Reply-To:Message-Id; b=CDC0mFRC5hSiHCs2EU9P3vat0L1t/Xj35Cq1KDGnhxOqnqSvd9V2AGIaiHagfroBVp42UknLV8hsqVVAK/ef8WIUAamgzB5dC2lPTt9Z0qzT+0D4u5HjASTpvYnyR1mM3CCqFy5lqgGk0D1J03pQsfCIx5mM7NjT/49sr1obs/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbcrZajx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbcrZajx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744652090; x=1776188090;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=hDx80Z9fQZj/FMDythfysWbbLq8UW8DDMwA0KfNSaVY=;
  b=hbcrZajxPnBY6BVHy9k9JovgRXc2BEnIfKM93RcMymumEFmoh9kGXmDS
   XZ5Tfny/evTZ4ygO+lJCSPz89jsSxyfr8fsz49tLDWIBKGapzIgmFjU/I
   LSmjRquN2IPCpnHZy0HvRXSzZh/LNUfbiRtSOLIp9WDs3QfM4NsqTw7kA
   aK5S3djTpXcrYn4ZgMiCcPoVo15r7NvZMR82PopF1IOf28QSniMeR1mdZ
   TrZNcYYsURgd/g5sKPhUKkFDJzMdPaArkrRDRn9ipWSJKkZi04cNdvaPM
   ed0GPxrvXu9pVYdk4pdNKOHnbjcXLp0dbA4hHg3FRRaSis2TzY4/b2XPE
   Q==;
X-CSE-ConnectionGUID: MbywmX/WR/SuRQhcsQXinQ==
X-CSE-MsgGUID: h1EuDP18S4W2m0uCWDxYvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49790112"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49790112"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:34:47 -0700
X-CSE-ConnectionGUID: F+O9tWDQQqWJydC9U1ahtw==
X-CSE-MsgGUID: RLrQdS3+Rgycf6/GCSCxzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129645448"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2025 10:32:42 -0700
Subject: [PATCH 6/8] x86/mm: Preallocate all PAE page tables
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Mon, 14 Apr 2025 10:32:41 -0700
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
In-Reply-To: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
Message-Id: <20250414173241.1288CAB4@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

Finally, move away from having PAE kernels share any PMDs across
processes.

This was already the default on PTI kernels which are  the common
case.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---

 b/arch/x86/mm/pgtable.c |   12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff -puN arch/x86/mm/pgtable.c~simplify-PREALLOCATED_PMDS-3 arch/x86/mm/pgtable.c
--- a/arch/x86/mm/pgtable.c~simplify-PREALLOCATED_PMDS-3	2025-04-09 11:49:42.035971354 -0700
+++ b/arch/x86/mm/pgtable.c	2025-04-09 11:49:42.038971465 -0700
@@ -80,16 +80,11 @@ struct mm_struct *pgd_page_get_mm(struct
 
 static void pgd_ctor(struct mm_struct *mm, pgd_t *pgd)
 {
-	/* If the pgd points to a shared pagetable level (either the
-	   ptes in non-PAE, or shared PMD in PAE), then just copy the
-	   references from swapper_pg_dir. */
-	if (CONFIG_PGTABLE_LEVELS == 2 ||
-	    (CONFIG_PGTABLE_LEVELS == 3 && SHARED_KERNEL_PMD) ||
-	    CONFIG_PGTABLE_LEVELS >= 4) {
+	/* PAE preallocates all its PMDs.  No cloning needed. */
+	if (!IS_ENABLED(CONFIG_X86_PAE))
 		clone_pgd_range(pgd + KERNEL_PGD_BOUNDARY,
 				swapper_pg_dir + KERNEL_PGD_BOUNDARY,
 				KERNEL_PGD_PTRS);
-	}
 
 	/* List used to sync kernel mapping updates */
 	pgd_set_mm(pgd, mm);
@@ -122,8 +117,7 @@ static void pgd_dtor(pgd_t *pgd)
  * all 4 top-level entries are used almost immediately in a
  * new process's life, we just pre-populate them here.
  */
-#define PREALLOCATED_PMDS	(static_cpu_has(X86_FEATURE_PTI) ? \
-					PTRS_PER_PGD : KERNEL_PGD_BOUNDARY)
+#define PREALLOCATED_PMDS	PTRS_PER_PGD
 #define MAX_PREALLOCATED_PMDS	PTRS_PER_PGD
 
 /*
_
