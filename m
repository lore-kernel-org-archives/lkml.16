Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66A288C99
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652090; cv=none; b=cKT8atJdSkam1s7twwUmlPsEBF7lafqPewMnUCyHrjYWRKV0/smxVi0X/Nupl6kyDqkNz/03VUtaZa80MLoFBRs1BVr57X14hAAzTVekg6e+QzYTxjbWNTxodIUitcGodIzFesKMS6m6ELGK1PlUVH1lL5vD1WG2se6uJJLfzBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652090; c=relaxed/simple;
	bh=c/R0B5dJhQ+dzMw3hACYb8rmDT+jc7mkH4hbqcKSbYw=;
	h=Subject:To:Cc:From:Date:References:In-Reply-To:Message-Id; b=QIeqx2lgiphpD5/wXtxEoo5GI3OjvwesNqs/NaXSDmLeYIN5g7QYbPmatsMnNPKuP87Hkhrth5j/0AME4O82+ld/cDl6xmdHjIn8LqY3EiFIpgX0CqhUog6csO1eSIBUV3UqSrh66bifqF+KPv4NJ0r57dfzjMmoZk3yVvQhOCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCqUzf/8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCqUzf/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744652089; x=1776188089;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=c/R0B5dJhQ+dzMw3hACYb8rmDT+jc7mkH4hbqcKSbYw=;
  b=aCqUzf/8d68CjFNcsVbhfR90itNn2GnMp2HrxhJktfIcmRMFQEKmD+a6
   GfErO1s7UrHmBzpZwvmSG30eOXc73Ulyq/NsFIXDlII+sdiwWiocsqFFB
   eJ1Na6KXyRI3Nwh6AEZcpiRt5gmj2U2fBRjjlS+DRoB736JyUYcQAYOjl
   yo5C+1nePhFpUNlXsN7XcM3FkmJ8RXH9aDD3zM1wGdTzIO/YC2liFV9Zy
   SqVPEEMHykSADjZoXc1iZKYqKYo7UPdNgLxba4nwLG74tUWxTVSnDWvQ1
   Kbioep0Ss3Ii0nSRu0L6yf7aq4JjjTZIesMERQpSQwZTbJP/gO5v4442H
   Q==;
X-CSE-ConnectionGUID: im48bCWvSnqmgqi06MiDFw==
X-CSE-MsgGUID: Br6whq8FTW22JtK6V40+AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49790096"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49790096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:34:47 -0700
X-CSE-ConnectionGUID: GDZwcDA/ROKN2kP2RVHt0w==
X-CSE-MsgGUID: FQIyVw/jQ9mXvxmqPdPffA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129645444"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2025 10:32:39 -0700
Subject: [PATCH 4/8] x86/mm: Simplify PAE PGD sharing macros
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Mon, 14 Apr 2025 10:32:38 -0700
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
In-Reply-To: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
Message-Id: <20250414173238.6E3CDA56@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

There are a few too many levels of abstraction here.

First, just expand the PREALLOCATED_PMDS macro in place to make it
clear that it is only conditional on PTI.

Second, MAX_PREALLOCATED_PMDS is only used in one spot for an
on-stack allocation. It has a *maximum* value of 4. Do not bother
with the macro MAX() magic.  Just set it to 4.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---

 b/arch/x86/mm/pgtable.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff -puN arch/x86/mm/pgtable.c~simplify-PREALLOCATED_PMDS arch/x86/mm/pgtable.c
--- a/arch/x86/mm/pgtable.c~simplify-PREALLOCATED_PMDS	2025-04-09 11:49:41.053935260 -0700
+++ b/arch/x86/mm/pgtable.c	2025-04-09 11:49:41.056935370 -0700
@@ -68,12 +68,6 @@ static inline void pgd_list_del(pgd_t *p
 	list_del(&ptdesc->pt_list);
 }
 
-#define UNSHARED_PTRS_PER_PGD				\
-	(SHARED_KERNEL_PMD ? KERNEL_PGD_BOUNDARY : PTRS_PER_PGD)
-#define MAX_UNSHARED_PTRS_PER_PGD			\
-	MAX_T(size_t, KERNEL_PGD_BOUNDARY, PTRS_PER_PGD)
-
-
 static void pgd_set_mm(pgd_t *pgd, struct mm_struct *mm)
 {
 	virt_to_ptdesc(pgd)->pt_mm = mm;
@@ -132,8 +126,9 @@ static void pgd_dtor(pgd_t *pgd)
  * not shared between pagetables (!SHARED_KERNEL_PMDS), we allocate
  * and initialize the kernel pmds here.
  */
-#define PREALLOCATED_PMDS	UNSHARED_PTRS_PER_PGD
-#define MAX_PREALLOCATED_PMDS	MAX_UNSHARED_PTRS_PER_PGD
+#define PREALLOCATED_PMDS	(static_cpu_has(X86_FEATURE_PTI) ? \
+					PTRS_PER_PGD : KERNEL_PGD_BOUNDARY)
+#define MAX_PREALLOCATED_PMDS	PTRS_PER_PGD
 
 /*
  * We allocate separate PMDs for the kernel part of the user page-table
_
