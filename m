Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A393B28466F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215269; cv=none; b=QsUvMKAEhmDmzlvTySpGYWt1q1AFJGGGBaHs1B16xp0mffB659PxcuPYTye5JdfPPlWM3eX4WZItMWt4kunTec9TFtNpphdcmvfuOg8XbTfg3ExuLYtVLZh27FzYL/2sFcKi3bR+ywx0hx/GFOauEHBADTy+4MKj5V8wtfJjhb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215269; c=relaxed/simple;
	bh=kAYfxiYLKb/mg8CdOGTnsW+n1F/MmNtgqssdpnvk/Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZpoZ29FvaDSdv3/znlB3JCaaug3lvn+IgHktXiVEq/2f8HgeFr12YwkeRC/cEzW+6gdSPdcgDd9LwvztaCHHdj49c/xiY9Gm8AzrrlJbvdEkdEU8VQpjrHDHkJlnF+QUWvG+bjF/YIdSTpkL2DUqln0+owmkC6a7c8Z2uNZoRbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlbBfbY+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlbBfbY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749215268; x=1780751268;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kAYfxiYLKb/mg8CdOGTnsW+n1F/MmNtgqssdpnvk/Ak=;
  b=XlbBfbY+/xTyuQO+Uj0vao9eXF3JZM2ATMZ/EL3M99o2QeaQBAIQTEDf
   MyYeP8anCI+PCacOk2Sf4TnG92H0WutlvPjZ/8b9j4D97G9lQ0dp5CEfz
   G/rRLRWx22gMb+IXCqAr79k4TQyV15zUb2h8iPQcOzYf01AhtuBKGNnD+
   PRZPrJekbTWBwbZ2CXug9uJfzxDqfmzj5Y9qxU5y50SHGFFqx2OOb3exQ
   SAiMAFHFjIBWq4TCdfWMlsmiQoU50HpUZpMfbVlvsnwzXMU4T93ZlQYvX
   2KEvOW15WAJ6ubRSmwqjPSpoosPEnC5f0eVOg/bCz2XwL1UtU4zixWcIn
   w==;
X-CSE-ConnectionGUID: EWoeqnXgSjKjxjQ3Ifx4JA==
X-CSE-MsgGUID: HZkc0MudRumqz3lk/L47Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="55155710"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="55155710"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 06:07:47 -0700
X-CSE-ConnectionGUID: t4CIR9zlQniyQT9CeAjFFg==
X-CSE-MsgGUID: 0DUUwuh5RkaeRPPFNfNkng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="145755673"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO khuang2-desk.gar.corp.intel.com) ([10.124.222.150])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 06:07:45 -0700
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
Subject: [PATCH v3] x86/virt/tdx: Enforce no indirect calls of TDX assembly
Date: Sat,  7 Jun 2025 01:07:37 +1200
Message-ID: <20250606130737.30713-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two static inline TDX helper functions (sc_retry() and sc_retry_prerr())
pass around function pointers to assembly functions.  Normally, the
compiler inlines these helper functions, realizes that the function
pointer targets are completely static and can be resolved at compile
time, and generates direct call instructions.

But, other times (like when CONFIG_CC_OPTIMIZE_FOR_SIZE=y), the compiler
will stop inlining and instead generate indirect call instructions.

Indirect calls to assembly functions require special annotation so that
both hardware and software implementations of Control Flow Integrity
mechanisms can work correctly.  But TDX assembly functions are declared
as if they are only called directly.

Annotate both sc_retry() and sc_retry_prerr() as __always_inline so that
the compiler will always inline these helpers and generate direct call
instructions when calling TDX assembly functions (see [1]).

This was found through randconfig testing, presumably setting
CONFIG_CC_OPTIMIZE_FOR_SIZE=1 when objtool spewed a bunch of these:

vmlinux.o: warning: objtool: tdh_mem_range_block+0x7e: relocation to
!ENDBR: __seamcall_ret+0x0

Link: https://lore.kernel.org/lkml/20250605145914.GW39944@noisy.programming.kicks-ass.net/ [1]
Signed-off-by: Kai Huang <kai.huang@intel.com>
---

This is updated version (with patch subject updated) of v1 patch:

https://lore.kernel.org/lkml/20250604003848.13154-1-kai.huang@intel.com/

v1 -> v3:
 - Follow Peter's suggestion to use __always_inline, instead of
   declaring TDX assembly can be called indirectly.
 - Change patch subject accordingly.
 - Update changelog accordingly, based on Dave's version.

v2 is similar to v1 and was sent right before Peter suggested to use
__always_inline, thus feel free to ignore.

---
 arch/x86/include/asm/tdx.h  | 2 +-
 arch/x86/virt/vmx/tdx/tdx.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 8b19294600c4..7ddef3a69866 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -106,7 +106,7 @@ void tdx_init(void);
 
 typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
 
-static inline u64 sc_retry(sc_func_t func, u64 fn,
+static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
 			   struct tdx_module_args *args)
 {
 	int retry = RDRAND_RETRY_LOOPS;
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 2457d13c3f9e..c7a9a087ccaf 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -75,8 +75,9 @@ static inline void seamcall_err_ret(u64 fn, u64 err,
 			args->r9, args->r10, args->r11);
 }
 
-static inline int sc_retry_prerr(sc_func_t func, sc_err_func_t err_func,
-				 u64 fn, struct tdx_module_args *args)
+static __always_inline int sc_retry_prerr(sc_func_t func,
+					  sc_err_func_t err_func,
+					  u64 fn, struct tdx_module_args *args)
 {
 	u64 sret = sc_retry(func, fn, args);
 

base-commit: ec7714e4947909190ffb3041a03311a975350fe0
-- 
2.49.0

