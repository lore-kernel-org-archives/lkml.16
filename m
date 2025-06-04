Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E6B665
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 00:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748997549; cv=none; b=SZ4szfD1bdS+uKMr/PHIFUu8bnb+eg2WMRcTnOe6awO6r0aMkRXFG5DeVZvAJy7hlbUbd/wS6UZYAotyODK1m89FZrPabGTCkG8EwmUvKSuHswOiIyFkIQ4qSL3i45udqoyKBRJH0It7Msav4gxA8F/n+thXLxRx6IdcvRqlpTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748997549; c=relaxed/simple;
	bh=sV0fxa4gfgOOrnxqSA6w5QF023wOAeg8/ZM5DkSBckg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGTi0bjpPA882TZCYH/V8LkOa7hTf3roAL5DQ4UmUiVHkvb0TwYm2Jj/RhREZYnkMYoMexbmSi9iZmf3zBwWAAjhmo5IikWrbvzuEvRrJXCgz9EgutgZyIxbyLnrXvW1hJpt0DzieZSQotdGW9dQpZmYllr3lXBqq3FvWD1RIJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjt0HMGd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjt0HMGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748997547; x=1780533547;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sV0fxa4gfgOOrnxqSA6w5QF023wOAeg8/ZM5DkSBckg=;
  b=cjt0HMGdkkliWwodcm03IaF/lGLHSCuN6tiLNVmK6iUAiydUI4n5t9kO
   c94Njz3Z4yBsC56zwzCmOaLrrMQ5vzVEyTzlw8HkGd681oQ5lE4Ylt4sy
   vIX8TXOaiaA8qyroyPINlILpqEHyI/bdkah3DLMh8k5WSy/zU5JTi5HOx
   IRzsgtkNX6k2o1PeXUCSxLk4ZGCxysW7+V9ffIpLu+hRmD+m7pmM2oXRh
   IL87xpB064C46NZ4sww9XKKeXcMgEN7BASUCNhH/owiy/PkM9jtzArJgi
   ciKQ0nVzzt7/dU3jEep0d3yd+O5DxozwSyhLxiBg8R/68qJGJwGR8lhpx
   Q==;
X-CSE-ConnectionGUID: RTv0IzMLSSujr1qh+S+p3A==
X-CSE-MsgGUID: IB+59o7XSGGocNqPei/Uqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54721305"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="54721305"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 17:39:06 -0700
X-CSE-ConnectionGUID: K3naTJ0PS6Ojq/InZphH/g==
X-CSE-MsgGUID: ZRdcfBtEQA6CTeFbEMk+eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="145970070"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO khuang2-desk.gar.corp.intel.com) ([10.124.221.56])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 17:39:03 -0700
From: Kai Huang <kai.huang@intel.com>
To: dave.hansen@intel.com,
	peterz@infradead.org,
	tglx@linutronix.de,
	bp@alien8.de,
	mingo@redhat.com,
	hpa@zytor.com,
	kirill.shutemov@linux.intel.com
Cc: rick.p.edgecombe@intel.com,
	x86@kernel.org,
	samitolvanen@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly functions
Date: Wed,  4 Jun 2025 12:38:48 +1200
Message-ID: <20250604003848.13154-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build warnings about missing ENDBR around making SEAMCALLs[*] were
observed when using some randconfig[1] to build today's Linus's tree.

In the C code, the low level SEAMCALL assembly functions (__seamcall(),
__seamcall_ret() and __seamcall_saved_ret()) are indirectly called via
the common sc_retry() function:

    static inline u64 sc_retry(sc_func_t func, u64 fn,
		    	       struct tdx_module_args *args)
    { ... }

    #define seamcall(_fn, _args) sc_retry(__seamcall, (_fn), (_args))

It turns out compilers may not always be smart enough to figure out how
to call those assembly functions directly.

The disassembly of the vmlinux built from the aforementioned config
confirms that __seamcall*() are indirectly called:

    <sc_retry>:
			       ......

       4c 89 ee                mov    %r13,%rsi
       4c 89 e7                mov    %r12,%rdi
       e8 35 8c 7d 01          call   ffffffff82b3e220 <__pi___x86_indirect_thunk_rbp>
       4c 39 f0                cmp    %r14,%rax

In this case ENDBR is needed at the beginning of __seamcall*().

Change SYM_FUNC_START() to SYM_TYPED_FUNC_START() for __seamcall*() to
add ENDBR to them.

When the compiler can generate direct call for __seamcall*(), the
additional ENDBR is safe since it has no impact to directly called
functions.

When kernel IBT was added to the kernel, initially the SYM_FUNC_START()
had the ENDBR added in commit

  c4691712b546 ("x86/linkage: Add ENDBR to SYM_FUNC_START*()")

However when the commit

  582077c94052 ("x86/cfi: Clean up linkage")

removed the ENDBR from the SYM_FUNC_START() and added it to the
SYM_TYPED_FUNC_START(), it didn't touch the SEAMCALL assembly.

[*] Aforementioned build warning:

vmlinux.o: warning: objtool: try_init_module_global+0x5d: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: read_sys_metadata_field+0x4a: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: do_global_key_config+0x36: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_phymem_page_reclaim+0x71: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: tdh_phymem_cache_wb+0x41: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_phymem_page_wbinvd_tdr+0x95: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdx_cpu_enable+0x7b: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: init_tdmr+0x59: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: config_tdx_module.constprop.0+0x19d: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_vp_addcx+0x91: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_vp_init+0x76: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_vp_wr+0x87: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_vp_rd+0x6d: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: tdh_vp_flush+0x4c: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_vp_create+0x85: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_mng_create+0x73: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_mem_page_aug+0xb4: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: tdh_mem_sept_add+0xb4: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: tdh_mem_page_add+0xce: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: tdh_mng_addcx+0x91: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_mem_page_remove+0x7e: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: tdh_mem_track+0x4c: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_mng_init+0x6d: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: tdh_mng_key_freeid+0x4c: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_mng_vpflushdone+0x4c: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_mr_finalize+0x4c: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_mr_extend+0x77: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: tdh_mng_rd+0x6d: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: tdh_mng_key_config+0x4c: relocation to !ENDBR: __seamcall+0x0
vmlinux.o: warning: objtool: tdh_mem_range_block+0x7e: relocation to !ENDBR: __seamcall_ret+0x0
vmlinux.o: warning: objtool: tdh_phymem_page_wbinvd_hkid+0x7d: relocation to !ENDBR: __seamcall+0x0

Fixes: 582077c94052 ("x86/cfi: Clean up linkage")
Link: https://download.01.org/0day-ci/archive/20250524/202505240530.5KktQ5mX-lkp@intel.com/config [1]
Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/virt/vmx/tdx/seamcall.S | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamcall.S b/arch/x86/virt/vmx/tdx/seamcall.S
index 6854c52c374b..637226ae935d 100644
--- a/arch/x86/virt/vmx/tdx/seamcall.S
+++ b/arch/x86/virt/vmx/tdx/seamcall.S
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/frame.h>
 
 #include "tdxcall.S"
@@ -18,7 +19,7 @@
  * Return (via RAX) TDX_SEAMCALL_VMFAILINVALID if the SEAMCALL itself
  * fails, or the completion status of the SEAMCALL leaf function.
  */
-SYM_FUNC_START(__seamcall)
+SYM_TYPED_FUNC_START(__seamcall)
 	TDX_MODULE_CALL host=1
 SYM_FUNC_END(__seamcall)
 
@@ -37,7 +38,7 @@ SYM_FUNC_END(__seamcall)
  * Return (via RAX) TDX_SEAMCALL_VMFAILINVALID if the SEAMCALL itself
  * fails, or the completion status of the SEAMCALL leaf function.
  */
-SYM_FUNC_START(__seamcall_ret)
+SYM_TYPED_FUNC_START(__seamcall_ret)
 	TDX_MODULE_CALL host=1 ret=1
 SYM_FUNC_END(__seamcall_ret)
 
@@ -59,6 +60,6 @@ SYM_FUNC_END(__seamcall_ret)
  * Return (via RAX) TDX_SEAMCALL_VMFAILINVALID if the SEAMCALL itself
  * fails, or the completion status of the SEAMCALL leaf function.
  */
-SYM_FUNC_START(__seamcall_saved_ret)
+SYM_TYPED_FUNC_START(__seamcall_saved_ret)
 	TDX_MODULE_CALL host=1 ret=1 saved=1
 SYM_FUNC_END(__seamcall_saved_ret)

base-commit: 5abc7438f1e9d62e91ad775cc83c9594c48d2282
-- 
2.49.0

