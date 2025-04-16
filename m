Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB3227E8A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769853; cv=none; b=rJ+xgqOdY+NLVb4fnJog4ukLoBzrQRBs8dXi6qYZghEpWVD4b0eAB7UYPIGqKJbjF+C7k5KTSj6wTW30nQN+ak9AD1Q6vvFlskKC8GbEqtCl5gwQSbBAjuu2NNvDj+PPm0NBYvUamjhMcyGQcO2h0ZdNcQ5DbgZu/S11wyoF3LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769853; c=relaxed/simple;
	bh=4sfKSv/ScVjhKVHF3sBB/9qKoXw5lSgxOquzI+RjZ3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BQOQJdXUS2TSTD9Rg46U06PZoS4X2YPC40hKkZH3LUi8PT8exoe1eTIEbfAuC03fceMV04jno1nS5HNR/ZNqpFsFVEm53rQrrA3NOJravUE6XYStv7Y4wgR2XI/QW6XiXXWYqSkXmZcYEFHyPpdZW5C472OzRejos2EKc5a0IbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zl3ODpEN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zl3ODpEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769851; x=1776305851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4sfKSv/ScVjhKVHF3sBB/9qKoXw5lSgxOquzI+RjZ3E=;
  b=Zl3ODpENK/BIrL4iaqVDduM2oxeIv3ztGSodFN78HVgTUvA+cz9ZEntV
   xeLUfeMAUlzg00EEj3kKKR2Y0upQrXiYutaaxxu8S2jaw8kmXARHCiopf
   HuvJ+mlxnQeAfGRPdOO5/90ZpkZtvLXvPHI8jFnVABieFiIOfog+++mm9
   YoyPFhQ3fFeNLPe/szycPJIly55xtCHcW24IVV7ijKJzDjarAaal7t+sx
   K5S5vuB4tS8E9UW0vEjDVr4u64z/INhxP/CkJfv/wmZaQs/2ImQzxw2om
   UmWTGpGBlmN2NV6CS8mYtvFvu8A8aOyrPBiVH/YYMmxzcjTa1ZjsuRAO9
   w==;
X-CSE-ConnectionGUID: upCQm1DqSlqYP4vZVOMQNw==
X-CSE-MsgGUID: sES7hlyNT9K8GvaFf/2zAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998157"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998157"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:31 -0700
X-CSE-ConnectionGUID: kGg7dHbqTFKVUF6u5yV4/Q==
X-CSE-MsgGUID: d4yWIoj/TtmPR6zmxWT20g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260410"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:31 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com,
	Sohil Mehta <sohil.mehta@intel.com>
Subject: [PATCH 03/10] x86/fpu/apx: Disallow conflicting MPX presence
Date: Tue, 15 Apr 2025 19:16:53 -0700
Message-ID: <20250416021720.12305-4-chang.seok.bae@intel.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XSTATE components are architecturally independent. There is no rule
requiring their offsets in the non-compacted format to be strictly
ascending or mutually non-overlapping. However, in practice, such
overlaps have not occurred -- until now.

APX is introduced as xstate component 19, following AMX. In the
non-compacted XSAVE format, its offset overlaps with the space previously
occupied by the now-deprecated MPX feature:

    45fc24e89b7c ("x86/mpx: remove MPX from arch/x86")

To prevent conflicts, the kernel must ensure the CPU never expose both
features at the same time. If so, it indicates unreliable hardware. In
such cases, XSAVE should be disabled entirely as a precautionary measure.

Add a sanity check to detect this condition and disable XSAVE if an
invalid hardware configuration is identified.

Note: MPX state components remain enabled on legacy systems solely for
KVM guest support.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
---
Changes from the last posting:
https://lore.kernel.org/lkml/20250320234301.8342-8-chang.seok.bae@intel.com/
* Add background in the changelog (Sohil/Dave)
* Clarify XSAVE disablement (Sohil).
* Collect review tag

The related warning message will be moved to the XSAVE-disabling function
in patch 6, per Dave’s suggestion.
---
 arch/x86/kernel/fpu/xstate.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index dfd07af10037..14f5c1bb2080 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -814,6 +814,17 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
 		goto out_disable;
 	}
 
+	if (fpu_kernel_cfg.max_features & XFEATURE_MASK_APX &&
+	    fpu_kernel_cfg.max_features & (XFEATURE_MASK_BNDREGS | XFEATURE_MASK_BNDCSR)) {
+		/*
+		 * This is a problematic CPU configuration where two
+		 * conflicting state components are both enumerated.
+		 */
+		pr_err("x86/fpu: Both APX/MPX present in the CPU's xstate features: 0x%llx, disabling XSAVE.\n",
+		       fpu_kernel_cfg.max_features);
+		goto out_disable;
+	}
+
 	fpu_kernel_cfg.independent_features = fpu_kernel_cfg.max_features &
 					      XFEATURE_MASK_INDEPENDENT;
 
-- 
2.45.2

