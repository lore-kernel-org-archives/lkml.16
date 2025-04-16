Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5E1176ADB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769848; cv=none; b=n1+SSKCz2qI6fSZ8Pe4DoMlgTKoJcbejfGY2zRhqFSvFuFBg7EtjtOf49iQQuJjuFfSceOTf19uB9vfwbuy8T65dUWrXwRrD3BVL4AGYqKzGiXq3ffEtWrKBHZiSePQEWE/zpnn4ELOBM3shTWb+wHaS7DLI1ovMwnGjVuaq45M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769848; c=relaxed/simple;
	bh=nV/OqN0un+Vool+cdkjFxTTv90dhqfXW6E22DcGvy5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vAbsSIW/y306k9bivJJYdsuLVhl33mbXs6W5NvQyPR110LY2zkslJ5frqmSEbLEht+UCgCiAuWzRnxUrbwNYF40OtAMrrYw/nUn6THgKtFpjqadliEiyNrmNgGD2cHBKbeZR9lUKyx7XoN8ntUOuvC+ZU0O2WOahX5VhDWXHPs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpV6O0lp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpV6O0lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769847; x=1776305847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nV/OqN0un+Vool+cdkjFxTTv90dhqfXW6E22DcGvy5I=;
  b=bpV6O0lpHIv/aIPXosFc9SHq39egAbt6HWyq7ygPId/ftA2Ek1PpEGV5
   wJgE4SEhDy9NcZnxYtNxCR0h4gmFYuyVZr3iuIYFKd60iw3bBwKJKoPCq
   1IjQ/F5vl2UtH1GF279SE84VXplg71Kmj6l7Bv1nDhbmbiGE3wG+BBVdv
   vQ8OgBUn95NT2zmnwdeujWTjcUZ5kvcAKw2mGxZopDIhUhp+ZX+KY4OiX
   rl5Z4Gwazrh+K5UIS8/6fYCzXUZgsGomLjKVXtu2aOky+EpgsLIeJyqDT
   zM4RQZRHhou8kdQ9TWuItbLrIBDuuzWXLt0qjWJY9FCN8F/IFhcljsAp2
   g==;
X-CSE-ConnectionGUID: vNjYyg0YTm+kYQhlIWt64g==
X-CSE-MsgGUID: Jt+NZry1RXabtBfDPVDGmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998144"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998144"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:27 -0700
X-CSE-ConnectionGUID: hbGvIGAtSxuF7VjWdOOWXA==
X-CSE-MsgGUID: pSVkcqJkQcewwXIqt5PGfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260395"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:27 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com,
	Sohil Mehta <sohil.mehta@intel.com>
Subject: [PATCH 01/10] x86/cpufeatures: Add X86_FEATURE_APX
Date: Tue, 15 Apr 2025 19:16:51 -0700
Message-ID: <20250416021720.12305-2-chang.seok.bae@intel.com>
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
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
---
Changes from the last posting:
https://lore.kernel.org/lkml/20250320234301.8342-6-chang.seok.bae@intel.com/
* Rebase onto v6.15-rc1; resolve conflict with commit:
  968e9bc4cef8 ("x86: move ZMM exclusion list into CPU feature flag")
* Organize APX entries orderly (Sohil). Then, include his review tag
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/cpuid-deps.c   | 1 +
 arch/x86/kernel/cpu/scattered.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 6c2c152d8a67..eb73f3f0ec70 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -481,6 +481,7 @@
 #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
 #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
+#define X86_FEATURE_APX			(21*32 + 9) /* Advanced Performance Extensions */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index a2fbea0be535..72f4fb66ac20 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -28,6 +28,7 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_PKU,			X86_FEATURE_XSAVE     },
 	{ X86_FEATURE_MPX,			X86_FEATURE_XSAVE     },
 	{ X86_FEATURE_XGETBV1,			X86_FEATURE_XSAVE     },
+	{ X86_FEATURE_APX,			X86_FEATURE_XSAVE     },
 	{ X86_FEATURE_CMOV,			X86_FEATURE_FXSR      },
 	{ X86_FEATURE_MMX,			X86_FEATURE_FXSR      },
 	{ X86_FEATURE_MMXEXT,			X86_FEATURE_MMX       },
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 16f3ca30626a..ffb80b5ad97f 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -27,6 +27,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_APERFMPERF,		CPUID_ECX,  0, 0x00000006, 0 },
 	{ X86_FEATURE_EPB,			CPUID_ECX,  3, 0x00000006, 0 },
 	{ X86_FEATURE_INTEL_PPIN,		CPUID_EBX,  0, 0x00000007, 1 },
+	{ X86_FEATURE_APX,			CPUID_EDX, 21, 0x00000007, 1 },
 	{ X86_FEATURE_RRSBA_CTRL,		CPUID_EDX,  2, 0x00000007, 2 },
 	{ X86_FEATURE_BHI_CTRL,			CPUID_EDX,  4, 0x00000007, 2 },
 	{ X86_FEATURE_CQM_LLC,			CPUID_EDX,  1, 0x0000000f, 0 },
-- 
2.45.2

