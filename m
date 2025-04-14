Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0A28B4EC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652092; cv=none; b=Qt6ufH0KH8zyj5RJIQ2KMljf3rsEaXZ5/vYJ/9s0M4qrnYFljozrhGYPdVvkv9NZDgWIXiCy4E1JTLdNL6XlqQDBzkKE1IqV/iGegGEcoHulh11lGRhv6NfmFu0adL6e2nS1SnMM8LBtzTG+Jb8/Pi9MyZY/xV4dG6Zqyb5bYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652092; c=relaxed/simple;
	bh=mk1Mq0ofVM7HE6S6MWX6+7XVF/6EEmeqJgKCfJ87db4=;
	h=Subject:To:Cc:From:Date:References:In-Reply-To:Message-Id; b=pO24IAOgAXfZPj5JLpbeObfRiDDGnobtKHTIbF5ULG20jhUdIs/U31iyb9NJl014sXW+D9xymBvqwEiKur67BK9478pt/mIvUdnLZFmvb3ILAyV19JOtYW9ZZRP4+41PwLf9j3VdoVREGoNaMWewjkdBTzYAAg1AUYH/vR+MduQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Te9tmFv9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Te9tmFv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744652091; x=1776188091;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=mk1Mq0ofVM7HE6S6MWX6+7XVF/6EEmeqJgKCfJ87db4=;
  b=Te9tmFv9J9acp5+fw6rGV35maBd1pZeNQFKBk4+x+bukwbHEes/aqnJB
   AuNUiM2BtUT7/ZHVGm8DKDjsQhwm+oWOA08PeTu5OxIppjHgofOVfGbGg
   HnMYCnProZjx6XC1uBFnxgGxnCrGB7Z1v9uiGh38rlBA6SkzbDlYOtvId
   Ie6mj7iIX3uQZnpR28aAzyj+2BP9/fyKZkGyChw6duOpbkaAmRfHYeEwG
   e4pYwhUhhRXKnrWyDRdyPcdR55LCXXSUyuS7A8YpaLYufW7y9C+04uoOW
   +9CfTyJ05APPVUw5CwVmTpbj6ib39th91eNg512rux+S18jKMUGJYpLL0
   w==;
X-CSE-ConnectionGUID: 4FAdvhKGSRilwzWb93hBmA==
X-CSE-MsgGUID: yi5OAUoCQ36dsKJG8bvsdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49790128"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49790128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:34:47 -0700
X-CSE-ConnectionGUID: iG5++4IuSuuziz6rHLTI6w==
X-CSE-MsgGUID: sYHMZJSzQWCAqk2qXGLUlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129645457"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2025 10:32:45 -0700
Subject: [PATCH 8/8] x86/mm: Remove now unused SHARED_KERNEL_PMD
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Mon, 14 Apr 2025 10:32:44 -0700
References: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
In-Reply-To: <20250414173232.32444FF6@davehans-spike.ostc.intel.com>
Message-Id: <20250414173244.1125BEC3@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

All the users of SHARED_KERNEL_PMD are gone. Zap it.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---

 b/arch/x86/include/asm/pgtable-2level_types.h |    2 --
 b/arch/x86/include/asm/pgtable-3level_types.h |    2 --
 b/arch/x86/include/asm/pgtable_64_types.h     |    2 --
 3 files changed, 6 deletions(-)

diff -puN arch/x86/include/asm/pgtable-2level_types.h~zap-SHARED_KERNEL_PMD arch/x86/include/asm/pgtable-2level_types.h
--- a/arch/x86/include/asm/pgtable-2level_types.h~zap-SHARED_KERNEL_PMD	2025-04-14 09:00:36.905759325 -0700
+++ b/arch/x86/include/asm/pgtable-2level_types.h	2025-04-14 09:00:36.912759582 -0700
@@ -18,8 +18,6 @@ typedef union {
 } pte_t;
 #endif	/* !__ASSEMBLER__ */
 
-#define SHARED_KERNEL_PMD	0
-
 #define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED
 
 /*
diff -puN arch/x86/include/asm/pgtable-3level_types.h~zap-SHARED_KERNEL_PMD arch/x86/include/asm/pgtable-3level_types.h
--- a/arch/x86/include/asm/pgtable-3level_types.h~zap-SHARED_KERNEL_PMD	2025-04-14 09:00:36.908759435 -0700
+++ b/arch/x86/include/asm/pgtable-3level_types.h	2025-04-14 09:00:36.913759618 -0700
@@ -27,8 +27,6 @@ typedef union {
 } pmd_t;
 #endif	/* !__ASSEMBLER__ */
 
-#define SHARED_KERNEL_PMD	(!static_cpu_has(X86_FEATURE_PTI))
-
 #define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED
 
 /*
diff -puN arch/x86/include/asm/pgtable_64_types.h~zap-SHARED_KERNEL_PMD arch/x86/include/asm/pgtable_64_types.h
--- a/arch/x86/include/asm/pgtable_64_types.h~zap-SHARED_KERNEL_PMD	2025-04-14 09:00:36.910759508 -0700
+++ b/arch/x86/include/asm/pgtable_64_types.h	2025-04-14 09:00:36.913759618 -0700
@@ -46,8 +46,6 @@ extern unsigned int ptrs_per_p4d;
 
 #endif	/* !__ASSEMBLER__ */
 
-#define SHARED_KERNEL_PMD	0
-
 #ifdef CONFIG_X86_5LEVEL
 
 /*
_
