Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E510A27C879
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760045; cv=none; b=iu0eQ5WDMcS4irkynkNntltiJQhnTLczPjZtQgXh55GNcnm+llYTnJxKe0mAEvlSgvmCDPgPDhcrKfIfSroPjXPs0uKJVgFkvaxJWkyyXaeBS6IFnpW6aVnPOnhj9rvi9zpIW7P9Zx3pyujxZ1sb2CNVf3bJ8LTW0FxSMe0/zkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760045; c=relaxed/simple;
	bh=GiI2VSijnFCghaiO7yOcCW+FmIFFoXPWegYvrrRwpbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ltz6cSC0m7V8WSjgDf6tXzSt4Bg7PpbSjTsD9LvBu9Lakp2szr4QWjcMxbLwmWwCMclkoQbF4k1K19r2FUcF187bkZW7XufoddAs4YrZ4Aq9oNf+KMO3SgG35AJXvy1JPVsexN/IXVQ7ipwtRb9Ci6PvgMZgcEIX4chq85E8mfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEInEzts; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEInEzts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750760044; x=1782296044;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GiI2VSijnFCghaiO7yOcCW+FmIFFoXPWegYvrrRwpbo=;
  b=SEInEztsAiSIM9yKI2O3CrVqvt4bkHtML2zF4bG5XulUzVGe3URaeDsW
   yHf3Ht630iChFWaOMCcoMVm9GVoBW9icUVp8AA0RWrOZ2wifmGpeCCTAP
   vW2H0lkMpIVPDRLdLto52jb+cyQ6DvoCUy0cT//pbdnL4yEMq6B27XHx8
   kJLbIFbF+bpWo84uV0UYvEPTJhvhMNGo9C7ek1PNvtemwp+ArWIuFkdkZ
   ktrb+iu9lxbkVwK1T4+hdhftgVuVvYhAse7TiLO7EGzsAkK6ttu2dB2ZP
   7/s7sub0wKGEodHi0YQhRpJzqrHLxWq1ZM3GqSdqTBiO/HWXAr3XHq+SQ
   A==;
X-CSE-ConnectionGUID: F1d9UrQYSy6f4XaQ2D/uGg==
X-CSE-MsgGUID: iebv/h5mSwiZyPPRqWms0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64053404"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="64053404"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:14:03 -0700
X-CSE-ConnectionGUID: G3efHSgdTFKrXncrQ+b54Q==
X-CSE-MsgGUID: PKGul18fS1mB82vJghcxHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="157375216"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO khuang2-desk.gar.corp.intel.com) ([10.124.223.45])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:14:00 -0700
From: Kai Huang <kai.huang@intel.com>
To: dave.hansen@intel.com,
	peterz@infradead.org,
	tglx@linutronix.de,
	bp@alien8.de,
	mingo@redhat.com,
	hpa@zytor.com,
	kirill.shutemov@linux.intel.com
Cc: rick.p.edgecombe@intel.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/virt/tdx: Further fix tdh_vp_enter() calls instrumentable code warning
Date: Tue, 24 Jun 2025 22:13:51 +1200
Message-ID: <20250624101351.8019-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tdh_vp_enter() needs to be marked noinstr, which means it can't call any
non-inlined noinstr functions.  Commit e9f17038d814 ("x86/tdx: mark
tdh_vp_enter() as __flatten") tried to address a build warning caused by
tdx_tdvpr_pa() not getting inlined.  Unfortunately that commit didn't
fix the warning completely due to the inconsistent behavior of the
__flatten annotation.

There are two problems that can come up depending on the compiler and
config.  One is that tdx_tdvpr_pa() doesn't get inlined, the other is
that page_to_phys() doesn't get inlined.

The __flatten annotation makes the compiler inline all function calls
that the annotated function makes, and the aforementioned commit assumed
this is always honored, recursively.  But it turns out it's not always
true:

 - Gcc may ignore __flatten when CONFIG_CC_OPTIMIZE_FOR_SIZE=y.
 - Clang doesn't support recursive inlining for __flatten, which can
   trigger another similar warning when page_to_phys() calls pfn_valid()
   when CONFIG_DEBUG_VIRTUAL=y.

Therefore using __flatten is not the right fix.

To fix the first problem, remove the __flatten for tdh_vp_enter() and
instead annotate tdx_tdvpr_pa() with __always_inline to make sure it is
always inlined.

To fix the second problem, change tdx_tdvpr_pa() to use
PFN_PHYS(page_to_pfn()) instead of page_to_phys() so that there will be
no more function call inside tdx_tdvpr_pa()[*].

The TDVPR page is always an actual page out of page allocator, so the
additional warning around pfn_valid() check in page_to_phys() doesn't
help a lot anyway.  It's not worth complicating the code for such
warning when CONFIG_DEBUG_VIRTUAL=y.

[*] Since commit cba5d9b3e99d ("x86/mm/64: Make SPARSEMEM_VMEMMAP the
    only memory model") page_to_pfn() has been a simple macro without
    any function call.

Fixes: e9f17038d814 ("x86/tdx: mark tdh_vp_enter() as __flatten")
Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/virt/vmx/tdx/tdx.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index c7a9a087ccaf..f92ceaea2726 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1502,9 +1502,14 @@ static inline u64 tdx_tdr_pa(struct tdx_td *td)
 	return page_to_phys(td->tdr_page);
 }
 
-static inline u64 tdx_tdvpr_pa(struct tdx_vp *td)
+static __always_inline u64 tdx_tdvpr_pa(struct tdx_vp *td)
 {
-	return page_to_phys(td->tdvpr_page);
+	/*
+	 * Don't use page_to_phys() because tdh_vp_enter() calls this
+	 * function from 'noinstr' code, and page_to_phys() can call
+	 * uninlined functions on some compiler/configs.
+	 */
+	return PFN_PHYS(page_to_pfn(td->tdvpr_page));
 }
 
 /*
@@ -1518,7 +1523,7 @@ static void tdx_clflush_page(struct page *page)
 	clflush_cache_range(page_to_virt(page), PAGE_SIZE);
 }
 
-noinstr __flatten u64 tdh_vp_enter(struct tdx_vp *td, struct tdx_module_args *args)
+noinstr u64 tdh_vp_enter(struct tdx_vp *td, struct tdx_module_args *args)
 {
 	args->rcx = tdx_tdvpr_pa(td);
 

base-commit: b7e21417e1f2c9b2d5c15b0a7d866e810de772aa
-- 
2.49.0

