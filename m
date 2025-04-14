Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BA8274641
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652090; cv=none; b=tnAHGY26apnOVR24JMLhsAyYi4x71oSFdNOw67oCLr+LSpYP4daPLDfEX/yBwLdGk1UBP3SBxKSYu7Wsc1Oi8/v7L/KLTwD6Fa/kitslmhQ14Gqh3Te2hmJsdNovr5wJwXShZgL59Bu3UD7ACMibXvDyoGJjYF4+N3wd/KQNy/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652090; c=relaxed/simple;
	bh=hirK6fLzNT5VkdPIfa5P8l32gqwR7flvZhFSTaT0WpY=;
	h=Subject:To:Cc:From:Date:References:In-Reply-To:Message-Id; b=MW64MGRQXMbZ6iOcgaETseCMjC1E9ZuXp7R+HGYU34IHxlZTCOThUGr6eMvJICpFhjrGH74d1q0oWsb9l0EvlXlET8lR8KPwQXbSI0TqQAu/L8ykGeykqFzPh7UURAzOtIxfMjAlYv7Je/9EjqVWsskuQHGPZ+5RjgvOHck5Yn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xec8Q4D/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xec8Q4D/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744652089; x=1776188089;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=hirK6fLzNT5VkdPIfa5P8l32gqwR7flvZhFSTaT0WpY=;
  b=Xec8Q4D/aoy2yQrV5v3zODpFJPLw1g4okzKEppiZBiZg6Y9uhHC5MuGI
   cZJ0haHXCTvaa9EUJa/I5X4eVQBeJjvgWAaJMw23d614kQOVEOp5AQICV
   5AyukTAUJp7YBYnzyiNluibt40V5zAhv62flFernHHP3X4vADpO7ydc2R
   ssdqnZn2+HbK2ncitSasXcTo8NFYjBgO8NdJbeHLFsSDkwaw3RI22hHUD
   k/xiZV30yGyvwlbYSVdwU++MkRz0jthmwMHREn8BzC6IS5TNC0w986TCq
   buRWy7+mZUnA0e6BGobIwNR6sklvNXfojXOzjW5/H8JFjqP0u+IzBEIM1
   Q==;
X-CSE-ConnectionGUID: 2V7BLZKOQVeBTPQIzpukZA==
X-CSE-MsgGUID: g896fTZzTaKEAs1jaYfi3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49790089"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49790089"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:34:47 -0700
X-CSE-ConnectionGUID: f4+He2P8SbeLGcu2PD8VTg==
X-CSE-MsgGUID: ojCNnlIERNa6L3L70YKzSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129645442"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2025 10:32:38 -0700
Subject: [PATCH 3/8] x86/mm: Always tell core mm to sync kernel mappings
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Mon, 14 Apr 2025 10:32:37 -0700
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
In-Reply-To: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
Message-Id: <20250414173237.EC790E95@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

Each mm_struct has its own copy of the page tables. When core mm code
makes changes to a copy of the page tables those changes sometimes
need to be synchronized with other mms' copies of the page tables. But
when this synchronization actually needs to happen is highly
architecture and configuration specific.

In cases where kernel PMDs are shared across processes
(SHARED_KERNEL_PMD) the core mm does not itself need to do that
synchronization for kernel PMD changes. The x86 code communicates
this by clearing the PGTBL_PMD_MODIFIED bit cleared in those
configs to avoid expensive synchronization.

The kernel is moving toward never sharing kernel PMDs on 32-bit.
Prepare for that and make 32-bit PAE always set PGTBL_PMD_MODIFIED,
even if there is no modification to synchronize. This obviously adds
some synchronization overhead in cases where the kernel page tables
are being changed.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---

 b/arch/x86/include/asm/pgtable-3level_types.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN arch/x86/include/asm/pgtable-3level_types.h~always-set-ARCH_PAGE_TABLE_SYNC_MASK arch/x86/include/asm/pgtable-3level_types.h
--- a/arch/x86/include/asm/pgtable-3level_types.h~always-set-ARCH_PAGE_TABLE_SYNC_MASK	2025-04-09 11:49:40.552916845 -0700
+++ b/arch/x86/include/asm/pgtable-3level_types.h	2025-04-09 11:49:40.555916955 -0700
@@ -29,7 +29,7 @@ typedef union {
 
 #define SHARED_KERNEL_PMD	(!static_cpu_has(X86_FEATURE_PTI))
 
-#define ARCH_PAGE_TABLE_SYNC_MASK	(SHARED_KERNEL_PMD ? 0 : PGTBL_PMD_MODIFIED)
+#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED
 
 /*
  * PGDIR_SHIFT determines what a top-level page table entry can map
_
