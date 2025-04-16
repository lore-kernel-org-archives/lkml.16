Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B053227E8A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769858; cv=none; b=CUOkUGtWOaf81PT0aZK8Y0tTcZ7rEVyrjP8PwY/G12jUW/syuhlA/HzozpfogIELFO5yivJpH84N1Rjj3Y9gSNKWzEe5C/27QHoWPdY5bezK64CA1PikRrN4ZVGwE51RyfJM5RWzA19Kog4mteZxTZG0Hp27Uu8ayFkhgo2pA0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769858; c=relaxed/simple;
	bh=ScAZXyKuUgPSJ0stUQtkTYeOuDfusDGAaF+sfu5F3Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=loDHXTZ+Dc5zhtVjfhM15PtJlDFb+8tICrf3Fitb0HbQghHLgk+RBvVvUwWfflk7FWUjH18MtOIIheJLrv4AdfUSHCqQqeJwayL5KDt723s8ch/UidkwO5HAEIzODHjeZWXgmj+cRmoYquqSeac0AfzjZXm1GN/Z3Syb/fHs3b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e59OOKxS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e59OOKxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769856; x=1776305856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ScAZXyKuUgPSJ0stUQtkTYeOuDfusDGAaF+sfu5F3Hg=;
  b=e59OOKxSK21fLOwurBJzCCyZ00i9d200KazvO4YP0d3dAgkg0zYP1SDp
   xeZRg6A2/ha2oZjktHZKyuVb3sIVhmM53vOEtRXThRCclIIbmbc7S6R8h
   +KQ7t4682xsPvEN3Lc58H9aDHcTCddrBv+mCw4b9Sud0SZ0vkKn9NkWls
   bYUVL0EdLh7Ogq64anJbKRZfJbVRAAZdzGov3Z9QYsc29QGyvpU6bwBGy
   6UsgrYRAt+vXwlI+Npslvv+6m4hHMKnYfTS850pJSaJ/vIR7P3qjx9Jut
   5M1oFGbks7C2EXhSoMdOk54ho/r8aUqpp1PaLcI+1uV2qdlslKg7YXo6o
   w==;
X-CSE-ConnectionGUID: 2Fbj7BcHRiGygdLKoHT8aQ==
X-CSE-MsgGUID: M5VUoWzmT6G0Xz2WJsYqoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998170"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:36 -0700
X-CSE-ConnectionGUID: HC7QmSjAQzmXF+suzlxdtw==
X-CSE-MsgGUID: WzjaX65xQvmUtHYsz+wdyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260459"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:36 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com,
	Sohil Mehta <sohil.mehta@intel.com>
Subject: [PATCH 05/10] selftests/x86/apx: Add APX test
Date: Tue, 15 Apr 2025 19:16:55 -0700
Message-ID: <20250416021720.12305-6-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416021720.12305-1-chang.seok.bae@intel.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
 <20250416021720.12305-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extended general-purpose registers for APX may contain random data,
which is currently assumed by the xstate testing framework. This allows
the testing of the new userspace feature using the common test code.

Invoke the test entry function from apx.c after enumerating the
state component and adding it to the support list

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
---
Changes from the last posting:
https://lore.kernel.org/lkml/20250320234301.8342-10-chang.seok.bae@intel.com/
* Add review tag

Some might view this standalone test as potentially converging with other
tests. I encountered similar situation when posting the selftest rework:

  https://lore.kernel.org/lkml/20250226010731.2456-10-chang.seok.bae@intel.com/

Maybe it's worthwhile to clarify the consideration again here:

  Alternatively, this invocation could be placed directly in
  xstate.c::main(). However, the current test file naming convention,
  which clearly specifies the tested area, seems reasonable. Adding apx.c
  considerably aligns with that convention.
---
 tools/testing/selftests/x86/Makefile |  3 ++-
 tools/testing/selftests/x86/apx.c    | 10 ++++++++++
 tools/testing/selftests/x86/xstate.c |  3 ++-
 tools/testing/selftests/x86/xstate.h |  2 ++
 4 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/x86/apx.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 28422c32cc8f..f703fcfe9f7c 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -19,7 +19,7 @@ TARGETS_C_32BIT_ONLY := entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
 			vdso_restorer
 TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip syscall_numbering \
-			corrupt_xstate_header amx lam test_shadow_stack avx
+			corrupt_xstate_header amx lam test_shadow_stack avx apx
 # Some selftests require 32bit support enabled also on 64bit systems
 TARGETS_C_32BIT_NEEDED := ldt_gdt ptrace_syscall
 
@@ -136,3 +136,4 @@ $(OUTPUT)/nx_stack_64: CFLAGS += -Wl,-z,noexecstack
 $(OUTPUT)/avx_64: CFLAGS += -mno-avx -mno-avx512f
 $(OUTPUT)/amx_64: EXTRA_FILES += xstate.c
 $(OUTPUT)/avx_64: EXTRA_FILES += xstate.c
+$(OUTPUT)/apx_64: EXTRA_FILES += xstate.c
diff --git a/tools/testing/selftests/x86/apx.c b/tools/testing/selftests/x86/apx.c
new file mode 100644
index 000000000000..d9c8d41b8c5a
--- /dev/null
+++ b/tools/testing/selftests/x86/apx.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+
+#include "xstate.h"
+
+int main(void)
+{
+	test_xstate(XFEATURE_APX);
+}
diff --git a/tools/testing/selftests/x86/xstate.c b/tools/testing/selftests/x86/xstate.c
index 23c1d6c964ea..97fe4bd8bc77 100644
--- a/tools/testing/selftests/x86/xstate.c
+++ b/tools/testing/selftests/x86/xstate.c
@@ -31,7 +31,8 @@
 	 (1 << XFEATURE_OPMASK)	|	\
 	 (1 << XFEATURE_ZMM_Hi256) |	\
 	 (1 << XFEATURE_Hi16_ZMM) |	\
-	 (1 << XFEATURE_XTILEDATA))
+	 (1 << XFEATURE_XTILEDATA) |	\
+	 (1 << XFEATURE_APX))
 
 static inline uint64_t xgetbv(uint32_t index)
 {
diff --git a/tools/testing/selftests/x86/xstate.h b/tools/testing/selftests/x86/xstate.h
index 42af36ec852f..e91e3092b5d2 100644
--- a/tools/testing/selftests/x86/xstate.h
+++ b/tools/testing/selftests/x86/xstate.h
@@ -33,6 +33,7 @@ enum xfeature {
 	XFEATURE_RSRVD_COMP_16,
 	XFEATURE_XTILECFG,
 	XFEATURE_XTILEDATA,
+	XFEATURE_APX,
 
 	XFEATURE_MAX,
 };
@@ -59,6 +60,7 @@ static const char *xfeature_names[] =
 	"unknown xstate feature",
 	"AMX Tile config",
 	"AMX Tile data",
+	"APX registers",
 	"unknown xstate feature",
 };
 
-- 
2.45.2

