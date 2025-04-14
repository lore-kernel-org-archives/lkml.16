Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A8328935A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652091; cv=none; b=gvLAmVaY/o00pH4rHXzXj3Ayn+C0gzQkQNopXc1fbnMrSeZ7FHc6//fQL2Ki0ySCao4o2xbSoacUxfs8fSVZoWpIqD7q38omtCzoFQydna54SFrmkwqswUyc+DYwfe0HqegnSWwGJzoqR5EVrJcgXy/pgd3bhegd4f45/CDGGx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652091; c=relaxed/simple;
	bh=Un3+wj5D1S77z0dxCSVifN/wQWe6b7DUudcpizb/ugM=;
	h=Subject:To:Cc:From:Date:References:In-Reply-To:Message-Id; b=E9aCT1hgdHPtev++TKJU3LNRTHODT0vWMfBSLekbgHcUpD/d9FPmGuXxY1ewaqsbEG7hXQ1PujPMTlMcS+XsvlDtuWfQY5DY45injSBG4jFPcUjphEHZu7MBzUZFQA+JTJCq1QOv0e5iVtVHn5GupNBG2QJ20rQY5OAZNUj2Bao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5UZc/y8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5UZc/y8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744652090; x=1776188090;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=Un3+wj5D1S77z0dxCSVifN/wQWe6b7DUudcpizb/ugM=;
  b=F5UZc/y8OPxUNYqBBAIjP6FB1lpc6KhuhXB19Ri5+UF6KTgVINJ7URUd
   pwBOsnwymD4AAjmueVu4YcAkEbqOc4JzXxM0p0Gd+QEuQVXhBNjL8TT8l
   OCUUGajwQNkockZ9Ne6r6OWgyucCzJMiOca9WLliQ0PPaBnhs77ecLGKg
   aydsg05De/XfN+gHK9qcH283L1l1plmxrK7Tep92vffRUrIzd2LG1eLvm
   lkEzokGdUCGFynJbrsO076oETFq6drlKpkkm/j7QcM4qSyewmV8Xm4X52
   7Uo1eZMmYqVr70r6frWu3vi7OwNDW6mT0wCH3xCW6QnYuC10fzKiLM4H8
   A==;
X-CSE-ConnectionGUID: SInC6PL9TrCnEafWLZlR9Q==
X-CSE-MsgGUID: VMpwV8CHQp2I7w5tob/Dig==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49790104"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49790104"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:34:47 -0700
X-CSE-ConnectionGUID: u+brq7jNRqitUShuJJHwKA==
X-CSE-MsgGUID: juDwK0wBSOKEBjl3fNR/4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129645446"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2025 10:32:41 -0700
Subject: [PATCH 5/8] x86/mm: Fix up comments around PMD preallocation
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Mon, 14 Apr 2025 10:32:40 -0700
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
In-Reply-To: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
Message-Id: <20250414173240.5B1AB322@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

The "paravirt environment" is no longer in the tree. Axe that part of the
comment. Also add a blurb to remind readers that "USER_PMDS" refer to
the PTI user *copy* of the page tables, not the user *portion*.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---

 b/arch/x86/mm/pgtable.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff -puN arch/x86/mm/pgtable.c~simplify-PREALLOCATED_PMDS-2 arch/x86/mm/pgtable.c
--- a/arch/x86/mm/pgtable.c~simplify-PREALLOCATED_PMDS-2	2025-04-09 11:49:41.550953527 -0700
+++ b/arch/x86/mm/pgtable.c	2025-04-09 11:49:41.553953638 -0700
@@ -121,16 +121,17 @@ static void pgd_dtor(pgd_t *pgd)
  * processor notices the update.  Since this is expensive, and
  * all 4 top-level entries are used almost immediately in a
  * new process's life, we just pre-populate them here.
- *
- * Also, if we're in a paravirt environment where the kernel pmd is
- * not shared between pagetables (!SHARED_KERNEL_PMDS), we allocate
- * and initialize the kernel pmds here.
  */
 #define PREALLOCATED_PMDS	(static_cpu_has(X86_FEATURE_PTI) ? \
 					PTRS_PER_PGD : KERNEL_PGD_BOUNDARY)
 #define MAX_PREALLOCATED_PMDS	PTRS_PER_PGD
 
 /*
+ * "USER_PMDS" are the PMDs for the user copy of the page tables when
+ * PTI is enabled. They do not exist when PTI is disabled.  Note that
+ * this is distinct from the user _portion_ of the kernel page tables
+ * which always exists.
+ *
  * We allocate separate PMDs for the kernel part of the user page-table
  * when PTI is enabled. We need them to map the per-process LDT into the
  * user-space page-table.
_
