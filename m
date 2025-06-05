Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4DD20ADE6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129031; cv=none; b=HDBsI2C96lPvn+e40pkP5sXiOHMvqJIjNAdUUZxXA/KGOcUfGnZ3xhfonCsO/cQpsclHiSTCJw/7fbimdVRdI9BA3AKL94GZNhJAOk2AITDokypcPJbvSVV/Sp4FdYSXmLvq9POACZEc6+zEU1u1OOGqnS8LHT3bLORmB51nAdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129031; c=relaxed/simple;
	bh=XHNSz5oJ6qaHxdwI1RpGZX2bJuCP8yhyJlvt8i+VWyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7zU+7JxWXcEVhfbBfBbcD0M7e3VYxzw0CWBxszE4AYru71KhoEN+0MP/FafGigKKNt/JLSgyi3oExtN9Dpr5eiepf3cPv5bIOqA1owrmgJfG+2MSwsXr6ofzk/3GPeoUk+k67Noq6RpXeRwkGrsB0b6s3SWe0GPVu09Lgc8T7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjVPbyBT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjVPbyBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749129029; x=1780665029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XHNSz5oJ6qaHxdwI1RpGZX2bJuCP8yhyJlvt8i+VWyU=;
  b=DjVPbyBTzrSVf++pCsFuU4vpRgbrtmMYEQ7SkpAYQbsiNdtyt4gcHc2R
   TPOrsgynUD8CMh4WtdPqnEAJr3I4UdjyWN1CirUxYBo6sTT5xsM1hXIQ4
   UnnkVQxdgFqlDWlyyA2LGO3ls+pcd9wjgt7k2dX/rc9EENz13X+PJkbUz
   npRMfdDHK0kG5xf2sL31L6zn4Lkutm1gVgDwt+sQuc32c5JmhvXdgMPro
   GcqUQsfc3kikVzTv9u3+o2WRsKSHa+V2bkYMqEYmc6FObf5nheZRYIG/+
   pUqX6zddWusMJzfjwHAgxjeRFnj14EyNbx+8+2Zki65ZMm8Xe2LvN7Z+q
   Q==;
X-CSE-ConnectionGUID: SSNca3NoQCu31U0MZeOGJg==
X-CSE-MsgGUID: lmUayRdGSYmv/yQ6bYJSWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51243207"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="51243207"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 06:10:28 -0700
X-CSE-ConnectionGUID: 4gqPKDf3QSuv1AkWp+DtLQ==
X-CSE-MsgGUID: aA6lDDTKS1u5EFilUTRUuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="176465791"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO khuang2-desk.gar.corp.intel.com) ([10.124.222.41])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 06:10:26 -0700
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
Subject: [PATCH v2] x86/virt/tdx: Annotate TDX assembly to allow indirect calls
Date: Fri,  6 Jun 2025 01:10:17 +1200
Message-ID: <20250605131017.21270-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604003848.13154-1-kai.huang@intel.com>
References: <20250604003848.13154-1-kai.huang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A TDX helper function (sc_retry()) passes around function pointers to
assembly functions. Normally, the compiler realizes that the function
pointer targets are completely static, can be resolved at compile time,
and generates direct call instructions.

But, other times (like when CONFIG_CC_OPTIMIZE_FOR_SIZE=y), the compiler
will instead generate indirect call instructions.

Indirect calls to assembly functions require special annotation so that
both hardware and software implementations of Control Flow Integrity
mechanisms can work correctly.

The TDX functions are declared as if they are only called directly (via
SYM_FUNC_START). Move them over to another macro (SYM_TYPED_FUNC_START)
which will annotate them as being called indirectly (see
include/linux/cfi_types.h).

This was found through randconfig testing, presumably setting
CONFIG_CC_OPTIMIZE_FOR_SIZE=1 when objtool spewed a bunch of these:

vmlinux.o: warning: objtool: tdh_mem_range_block+0x7e: relocation to
!ENDBR: __seamcall_ret+0x0

Note that currently only __seamcall() and __seamcall_ret() are called
via sc_retry().  __seamcall_saved_ret() is only called and is directly
called by tdh_vp_enter() since this SEAMCALL doesn't return "running out
of entropy" error which sc_retry() handles.

Using SYM_TYPED_FUNC_START for __seamcall_saved_ret() results in build
error when building the kernel with clang and CONFIG_CFI_CLANG=y:

  ld.lld: error: undefined symbol: __kcfi_typeid___seamcall_saved_ret
  >>> referenced by usercopy_64.c
  >>>               vmlinux.o:(__cfi___seamcall_saved_ret)

Making tdh_vp_enter() call __seamcall_saved_ret() via sc_retry() fixes
the error, but don't do this way since tdh_vp_enter() is in performance
critical path.  Instead, keep using SYM_FUNC_START for it but only move
to SYM_TYPED_FUNC_START for the other two.

While on it, remove seamcall_saved_ret() since it is not used.

Fixes: 1e66a7e27539 ("x86/virt/tdx: Handle SEAMCALL no entropy error in common code")
Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/include/asm/tdx.h       |  1 -
 arch/x86/virt/vmx/tdx/seamcall.S | 10 ++++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 8b19294600c4..c6ec8601bbb8 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -121,7 +121,6 @@ static inline u64 sc_retry(sc_func_t func, u64 fn,
 
 #define seamcall(_fn, _args)		sc_retry(__seamcall, (_fn), (_args))
 #define seamcall_ret(_fn, _args)	sc_retry(__seamcall_ret, (_fn), (_args))
-#define seamcall_saved_ret(_fn, _args)	sc_retry(__seamcall_saved_ret, (_fn), (_args))
 int tdx_cpu_enable(void);
 int tdx_enable(void);
 const char *tdx_dump_mce_info(struct mce *m);
diff --git a/arch/x86/virt/vmx/tdx/seamcall.S b/arch/x86/virt/vmx/tdx/seamcall.S
index 6854c52c374b..552495761b36 100644
--- a/arch/x86/virt/vmx/tdx/seamcall.S
+++ b/arch/x86/virt/vmx/tdx/seamcall.S
@@ -1,9 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/frame.h>
 
 #include "tdxcall.S"
 
+/*
+ * Use SYM_TYPED_FUNC_START() for __seamcall() and __seamcall_ret()
+ * since they can be called via an indirect call.
+ */
+
 /*
  * __seamcall() - Host-side interface functions to SEAM software
  * (the P-SEAMLDR or the TDX module).
@@ -18,7 +24,7 @@
  * Return (via RAX) TDX_SEAMCALL_VMFAILINVALID if the SEAMCALL itself
  * fails, or the completion status of the SEAMCALL leaf function.
  */
-SYM_FUNC_START(__seamcall)
+SYM_TYPED_FUNC_START(__seamcall)
 	TDX_MODULE_CALL host=1
 SYM_FUNC_END(__seamcall)
 
@@ -37,7 +43,7 @@ SYM_FUNC_END(__seamcall)
  * Return (via RAX) TDX_SEAMCALL_VMFAILINVALID if the SEAMCALL itself
  * fails, or the completion status of the SEAMCALL leaf function.
  */
-SYM_FUNC_START(__seamcall_ret)
+SYM_TYPED_FUNC_START(__seamcall_ret)
 	TDX_MODULE_CALL host=1 ret=1
 SYM_FUNC_END(__seamcall_ret)
 

base-commit: ec7714e4947909190ffb3041a03311a975350fe0
-- 
2.49.0

