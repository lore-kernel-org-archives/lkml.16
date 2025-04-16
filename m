Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B56228CB2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769861; cv=none; b=nOIef4u0r7opqo8PX58FdfX/EdhRbgudnKe4dtFIWmQeOz4uJ3zUuMjLF7CwQMX+2Q6nVqBOqet94dymd8ZDqVIA1I45KJBbqHtHyLtTKlP/GnOw/BNCXwMgYch2vhkltS37cPDnEDCz4BgXhVFt+UHzt4F6zK0VOQImIJlE6PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769861; c=relaxed/simple;
	bh=j+/zB2Z82Zl7W7pWGsO0/6uMWNb//6oqzI6nMynYLeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjQJ833cjW4BqFdX+r3CQMb3ekVpEs2Brofe0ueF7K3aWBHTUbfzjz1UdikwxiU+nwiuUZOnzEAp9sWKpE2Q4zuxViKkBpUpNJDcaWumgQXXr1eUMNNZSClo4fl+wmfMjoIDWxAorn/7B5+1OijSf+K+1+FTTp93fSjUKpmlM8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuPQNRWY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuPQNRWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769859; x=1776305859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j+/zB2Z82Zl7W7pWGsO0/6uMWNb//6oqzI6nMynYLeU=;
  b=SuPQNRWYeqm9h1mq6tUO13uHzCgbuK2KZno746bf3DGORhfN+OT3AZzb
   ZX3q8dpjG8xr51IIx735g/0qeSccJYAJua5ki4H94oR9UjmpV7z+Gr8mN
   7C3OAxHBvDHK3WSePJO++a6XWHWrLYi8rll+dZROiVJulCa+rln101e8x
   l6TW3mnX/9GUYt+tPhvRSanOP0Nw2KYt1XAufyCESmRgAKdfRhWr5ZnEY
   aYHTCC5FOA9gegnYXmwcKrW4WzfR6HHGPbzxs5xTtMkM73Pmpac+byfNi
   EMdXDBnGaX5tbTg90PoX29VlG8wvFASlaYoU7yLCAzHZt7WYLNt92RXPk
   Q==;
X-CSE-ConnectionGUID: dCpszxHNTQmTfuO7aVuL3A==
X-CSE-MsgGUID: HDZaoAkkSuiJBpAL6VR0KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998176"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998176"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:39 -0700
X-CSE-ConnectionGUID: nQUw0VpKQlWthNa96zxqLA==
X-CSE-MsgGUID: fJRfMVgvQcOPoT1Oyl3X3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260470"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:39 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH 06/10] x86/fpu: Log XSAVE disablement consistently
Date: Tue, 15 Apr 2025 19:16:56 -0700
Message-ID: <20250416021720.12305-7-chang.seok.bae@intel.com>
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

Not all paths that lead to fpu__init_disable_system_xstate() currently
emit a message indicating that XSAVE has been disabled. Move the print
statement into the function to ensure the message in all cases.

Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Link: https://lore.kernel.org/lkml/d6d19e39-2749-4d45-aeab-a209a0ecba17@intel.com
---
New patch for following up patch 3.
---
 arch/x86/kernel/fpu/xstate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 2ac1fc182273..8b14c9d3a1df 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -751,6 +751,8 @@ static int __init init_xstate_size(void)
  */
 static void __init fpu__init_disable_system_xstate(unsigned int legacy_size)
 {
+	pr_info("x86/fpu: XSAVE disabled\n");
+
 	fpu_kernel_cfg.max_features = 0;
 	cr4_clear_bits(X86_CR4_OSXSAVE);
 	setup_clear_cpu_cap(X86_FEATURE_XSAVE);
@@ -821,7 +823,7 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
 		 * This is a problematic CPU configuration where two
 		 * conflicting state components are both enumerated.
 		 */
-		pr_err("x86/fpu: Both APX/MPX present in the CPU's xstate features: 0x%llx, disabling XSAVE.\n",
+		pr_err("x86/fpu: Both APX/MPX present in the CPU's xstate features: 0x%llx.\n",
 		       fpu_kernel_cfg.max_features);
 		goto out_disable;
 	}
@@ -900,7 +902,7 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
 	init_fpstate.xfeatures		= fpu_kernel_cfg.default_features;
 
 	if (init_fpstate.size > sizeof(init_fpstate.regs)) {
-		pr_warn("x86/fpu: init_fpstate buffer too small (%zu < %d), disabling XSAVE\n",
+		pr_warn("x86/fpu: init_fpstate buffer too small (%zu < %d)\n",
 			sizeof(init_fpstate.regs), init_fpstate.size);
 		goto out_disable;
 	}
@@ -912,7 +914,7 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
 	 * xfeatures mask.
 	 */
 	if (xfeatures != fpu_kernel_cfg.max_features) {
-		pr_err("x86/fpu: xfeatures modified from 0x%016llx to 0x%016llx during init, disabling XSAVE\n",
+		pr_err("x86/fpu: xfeatures modified from 0x%016llx to 0x%016llx during init\n",
 		       xfeatures, fpu_kernel_cfg.max_features);
 		goto out_disable;
 	}
-- 
2.45.2

