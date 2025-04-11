Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8CD1401C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744387976; cv=none; b=mpVaLFw328Ax6DIM0XrR/yUbVgPDJycO4XZLI5jRhDpUeWmirLQc7ZQns9tdILfQlkzV1VekTX9nEiwvDnQqmhg6VrIVK4kqJZTHXqDHQ9GTqH441VATdgpYPmq94DgOss3cnkM6lRxvv+EfZlR6PnWNgZJLbMzL+1/AuaHq3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744387976; c=relaxed/simple;
	bh=VhZ2Q2ZeXazl3OtxhgZU+pWfU7X5sPhNu3MgtxyVGO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jq0yzbanRmtnvMrihGwu4WjnptPAV4sTK95NIW+lrThk3xXzG4LCrwnp4KvW0O7RR14DY84TnwntrrDcs+7Y1E6VYLnk2xCjqX8WKJlotSxqFjek74jiEyy0THt303LQbTDb9gyBm2yvfr78YwcB6KKcq/SCacWrcogwFHHuoOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCNyXQ+K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCNyXQ+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744387974; x=1775923974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VhZ2Q2ZeXazl3OtxhgZU+pWfU7X5sPhNu3MgtxyVGO0=;
  b=XCNyXQ+KBzA2x0ly/z1r5aQsOnuHgN4l6hZjI68uPHWAfzznLOp57g0p
   btofiGvmh1Sx85fnAxQpVbaNx1ivYYI3OzehYxRLfAsvvEXkRjcOeoe9Q
   z0I61dunyCEPtz1aD9ubuZZNcEb5XWyocGrP9ihF/QZo0nJoaUaJij+4O
   s8vjBn/cU/on87/XkBmr55jeU35lYvCYKaAiPG48qAcKoqLJYRYM1h3Ue
   5DIkVazPng2pPmdZdILjM/DNCV6WgmvaKH0V2v+08Xw4I4g6T1yW54QhT
   h/lVafl4EShLPUqtAzR7sGE2+j0nAX2WqWK5KaV+dKOUnLHWD1wZt/cuc
   A==;
X-CSE-ConnectionGUID: O/gTfgsFTlKWl/izOd+Kyg==
X-CSE-MsgGUID: jcInpEJOTA2p9crY/febGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49749622"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="49749622"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 09:12:54 -0700
X-CSE-ConnectionGUID: 9ZoAx7EHSseRLF+/XUHvUw==
X-CSE-MsgGUID: EnZWulD0SmSTHCoOhEFv+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="133989110"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.51.254])
  by fmviesa005.fm.intel.com with ESMTP; 11 Apr 2025 09:12:53 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
Date: Fri, 11 Apr 2025 09:12:50 -0700
Message-ID: <20250411161250.14662-1-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250320234301.8342-6-chang.seok.bae@intel.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Advanced Performance Extensions (APX) introduce a new set of
general-purpose registers, managed as an extended state component via the
xstate management facility.

Before enabling this new xstate, define a feature flag to clarify the
dependency in xsave_cpuid_features[]. APX is enumerated under CPUID level
7 with EDX=1. Since this CPUID leaf is not yet allocated, place the flag
in a scattered feature word.

While this feature is intended only for userspace, exposing it via
/proc/cpuinfo is unnecessary. Instead, the existing arch_prctl(2)
mechanism with the ARCH_GET_XCOMP_SUPP option can be used to query the
feature availability.

Finally, clarify that APX depends on XSAVE.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
Rebased onto v6.15-rc1 with commit:

      968e9bc4cef8 ("x86: move ZMM exclusion list into CPU feature flag")
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/cpuid-deps.c   | 1 +
 arch/x86/kernel/cpu/scattered.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 6c2c152d8a67..5445937eff3d 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -481,6 +481,7 @@
 #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
 #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
+#define X86_FEATURE_APX			(21*32 + 9) /* Advanced #Performance Extensions */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index 94c062cddfa4..7c1268138a7a 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -88,6 +88,7 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_SHSTK,			X86_FEATURE_XSAVES    },
 	{ X86_FEATURE_FRED,			X86_FEATURE_LKGS      },
 	{ X86_FEATURE_SPEC_CTRL_SSBD,		X86_FEATURE_SPEC_CTRL },
+	{ X86_FEATURE_APX,			X86_FEATURE_XSAVE     },
 	{}
 };
 
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 16f3ca30626a..6c40d5af8479 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -54,6 +54,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_PMC_FREEZE,	CPUID_EAX,  2, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_HETEROGENEOUS_CORES,	CPUID_EAX, 30, 0x80000026, 0 },
+	{ X86_FEATURE_APX,			CPUID_EDX, 21, 0x00000007, 1 },
 	{ 0, 0, 0, 0, 0 }
 };
 
-- 
2.45.2

