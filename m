Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5851F582F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751326079; cv=none; b=mYfn4ToRzoikH+4+bVQoOtrIUiaLVL+ff3qVTHvY5i0Y6h5K0uYSj9yW4qJ3DEQhFHBafs+hfcxgCGzVGZR1wgzZsJLNlTcK2C8n0MfeJbpmvKW/zQexING1M6mMFjoGLQyJWJSGnadWGuGY2oL1h6kf47cSxmvXrSSOGuDF8po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751326079; c=relaxed/simple;
	bh=6cELg/kZ4X/GuLIlQcBGhctORlbWMbVl4uksXrGVm/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQhZaxjQ/JDm7oSg68Ii+0wiZdcRANEXvSZKSAicPl9RUuaGW0/vlSMyw9mNg2a6jII8IEqVmNWoeMDM3IbhbK749kKtU1PkTRVLDsnkkZZkwA8XXPsyYXbBxLGdw3nadtyeL7jZDIDAz8uYi2YnzYvDtHV17AdUUqyn/OYSzAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQxKN96R; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQxKN96R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751326078; x=1782862078;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6cELg/kZ4X/GuLIlQcBGhctORlbWMbVl4uksXrGVm/0=;
  b=BQxKN96RWwTfAka9jCfCEbusB9qa2xjdKlK9d/Cn07vfyeitjNWzFryM
   hWwsdW+TO9iUAp3IoZEgGpjBHbwnNpg5qg6GejwP1dUFVfAVCSUL4s3sd
   pvj5w7wKJmcGCnP2mPs2UjlaijaMdEhMySSedDHiOxCsGMPMUX/Xl/0Vb
   I0zgnZIF2CD9oKAw4JUP/1WXKwFVzn+BgrCoKxiD70XGC3qx+tYxaF8OC
   hvdn08jhru1S3wJ9N8lsydnuFqKwQ4OkHLNYAPg+CxqMyin/2FXX6+au4
   houLWN4nZH0FSx1UxXIHeTnNzfURUk1FHUo6w+E4ckpK/OzuppV6lJKPY
   Q==;
X-CSE-ConnectionGUID: ssWc0264T+W69olzp+/Jeg==
X-CSE-MsgGUID: w4aJzJTgTrirat4FVeIc3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53659299"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="53659299"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 16:27:57 -0700
X-CSE-ConnectionGUID: E9VajBU4T1Okhny47L7XGQ==
X-CSE-MsgGUID: mc4jrxVtR8mU8jeywx1b/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153772424"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO khuang2-desk.gar.corp.intel.com) ([10.124.222.26])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 16:27:54 -0700
From: Kai Huang <kai.huang@intel.com>
To: dave.hansen@intel.com,
	peterz@infradead.org,
	tglx@linutronix.de,
	bp@alien8.de,
	mingo@redhat.com,
	hpa@zytor.com
Cc: kirill.shutemov@linux.intel.com,
	rick.p.edgecombe@intel.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] x86/virt/tdx: Further fix tdh_vp_enter() calls instrumentable code warning
Date: Tue,  1 Jul 2025 11:27:42 +1200
Message-ID: <20250630232742.8991-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.50.0
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
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---

v1 -> v2:
 - Add Rick's Reviewed-by.
 - Rebase to today's tip/master.

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
 

base-commit: 49ec9aaf45c8f4612330f2fd646e3440dc7d8f25
-- 
2.50.0

