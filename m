Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C484528A1FB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652093; cv=none; b=LhfpXy/E38G5xGdCeAk9BrZv9bht3PlhOAp/z+3o4ZrZyayNk5Ib+CuAgUA8FS4vlACv4yYzJLfkevTSWUNqxXRzceT8s98Ak20FXo6/sH4Us2tV93s8kHLXAwHtLe/I3AzkJVGdEqmuYvb2CWWmhzxA/V6Vl17n4uqY3u0RXfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652093; c=relaxed/simple;
	bh=IYdhxZakHmigCV0vshdrC04wSMfHYqJO6uk9KviS6fY=;
	h=Subject:To:Cc:From:Date:References:In-Reply-To:Message-Id; b=RnKTxaMGe8bJ7X2pU5NnLAas5xVeAYTKRR5Lb9UNRBsfaUzvw2ZsPI+9PPU34S+GXGArGv4PtfWoaF9qjCsFqzLxkrjxomAxK7Nd3WEgnEqXaeQOV0yevbOCSKR48rFFcEaBm2DmfXrWVni7ncDcMBpUHiHfFJJwWpWZFITJwT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1Ck6Wh5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1Ck6Wh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744652091; x=1776188091;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=IYdhxZakHmigCV0vshdrC04wSMfHYqJO6uk9KviS6fY=;
  b=R1Ck6Wh5JWdc8aQRAFS+VixvLjjnvq0v3sVHey2LSVyHxjlsV8pkOhSQ
   VJ17FNymwmxyzg09lcdlBijO1Wh8A0dIYhZsVy0xTC/o4Yt4UBiE9Y7Vh
   I1MHEW8F8lSVk18eiV/CVo1m7Oxz+VeLPCR350/Fjug1QNbYGYGRWcdui
   L24SB4lvDtHeMNciMr1QpiEMKS5cd1XcjLZMIXpbFtbA9XmzEvbJSBSU5
   9mmqGYd0PrR73uY2rzJh9sfQL9EBtqJse1MqlJL5WGSNhyegXYBNMWDP4
   DHd/bi/25zC9YpWVYxa1xawmQa1azwpgoEE5C1ys3jZekLDQo9tforli0
   w==;
X-CSE-ConnectionGUID: 8ThXy/1GSzmpekShgq6WGw==
X-CSE-MsgGUID: l83eV4f+R3y4RIbcTZGfkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49790119"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49790119"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:34:47 -0700
X-CSE-ConnectionGUID: q14wDk67SF+d3ZnsIBK9dQ==
X-CSE-MsgGUID: tg+m3yuMQdeBaWytmdsgiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129645450"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2025 10:32:44 -0700
Subject: [PATCH 7/8] x86/mm: Remove duplicated PMD preallocation macro
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Mon, 14 Apr 2025 10:32:42 -0700
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
In-Reply-To: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
Message-Id: <20250414173242.5ED13A5B@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

MAX_PREALLOCATED_PMDS and PREALLOCATED_PMDS are now identical. Just
use PREALLOCATED_PMDS and remove "MAX".

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---

 b/arch/x86/mm/pgtable.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff -puN arch/x86/mm/pgtable.c~simplify-PREALLOCATED_PMDS-4 arch/x86/mm/pgtable.c
--- a/arch/x86/mm/pgtable.c~simplify-PREALLOCATED_PMDS-4	2025-04-09 11:49:42.535989732 -0700
+++ b/arch/x86/mm/pgtable.c	2025-04-09 11:49:42.538989843 -0700
@@ -118,7 +118,6 @@ static void pgd_dtor(pgd_t *pgd)
  * new process's life, we just pre-populate them here.
  */
 #define PREALLOCATED_PMDS	PTRS_PER_PGD
-#define MAX_PREALLOCATED_PMDS	PTRS_PER_PGD
 
 /*
  * "USER_PMDS" are the PMDs for the user copy of the page tables when
@@ -154,7 +153,6 @@ void pud_populate(struct mm_struct *mm,
 
 /* No need to prepopulate any pagetable entries in non-PAE modes. */
 #define PREALLOCATED_PMDS	0
-#define MAX_PREALLOCATED_PMDS	0
 #define PREALLOCATED_USER_PMDS	 0
 #define MAX_PREALLOCATED_USER_PMDS 0
 #endif	/* CONFIG_X86_PAE */
@@ -324,7 +322,7 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
 {
 	pgd_t *pgd;
 	pmd_t *u_pmds[MAX_PREALLOCATED_USER_PMDS];
-	pmd_t *pmds[MAX_PREALLOCATED_PMDS];
+	pmd_t *pmds[PREALLOCATED_PMDS];
 
 	pgd = _pgd_alloc(mm);
 
_
