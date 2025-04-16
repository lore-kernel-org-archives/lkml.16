Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A332139B1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769851; cv=none; b=TRqwdJNISAb4F3FWB+CrvvdTgbtxGjmkan9DqZB3PmhMRB5GwNipTiOfVjrJW+vyE9LrFKRSQY3hTILlLyAN41l6lC174SsOPpfghwUcLakHeHES1fs9+cdgaUwT9kepqv5VCxl2Tr2y8IaVR0Qj0NVZKY6ArAFtpoXmGmT2Ko4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769851; c=relaxed/simple;
	bh=OAUK/Kfh5VR8xxibV2MiW5fbmFH+tSGUJxDIGwn1FOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/61kn94AyVt5d0URnt0wn68ly9qKowln2dw8o57UAZStupPQZrciROhCDIaCabFqxAhJAnTUROOjyUwsBr6bFge7UA9vvHLYFQh2SJXG9FR+FfEe8KPMFq8B69Kk/BXi3654y974FzqPoTjSxQHR9prl48+/6McrpUAGP1Mkco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTS6ZMk+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTS6ZMk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769850; x=1776305850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OAUK/Kfh5VR8xxibV2MiW5fbmFH+tSGUJxDIGwn1FOY=;
  b=XTS6ZMk+mlSNyPsTB/FGJKufVJAEoN6ySHJRjDbEelIujJCr5X8TgRkk
   vEKYISeztKjHI+KnUnAd6WqpZApP4e+11R9JCVJ/sv3Es92QmMRs6+Stq
   sNeSFMGEeaW1U9HRNSr95UnaeF1bOMOradx/r5d0GflRiPztDDqHJ7vUg
   5IslRSfpR5g5OVrZ7pKkK8KCfSWKAsbcOmrV7paOWpcvUIvBd24937mP8
   jZBPKgd4n7kRHBmRdsu66KJ5irtxTN8mT367O12Yx3EB0PgLx6QORxIAf
   4L3jDh7kTky6i5ayJT7umDXUwXc1nAxH9O+YSlNhAjYoi82oqZoxJmXZI
   A==;
X-CSE-ConnectionGUID: UbNi71l6SA635Ig9gp6qiA==
X-CSE-MsgGUID: vXhDXAc8SVyqQyzX+lAgWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998152"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998152"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:29 -0700
X-CSE-ConnectionGUID: kZI5kAEiQTiHSSW3pQkU9Q==
X-CSE-MsgGUID: 0on8AxneT1ufiz5RpXls2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260404"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:29 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com,
	Sohil Mehta <sohil.mehta@intel.com>
Subject: [PATCH 02/10] x86/fpu/apx: Define APX state component
Date: Tue, 15 Apr 2025 19:16:52 -0700
Message-ID: <20250416021720.12305-3-chang.seok.bae@intel.com>
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

Advanced Performance Extensions (APX) is associated with a new state
component number 19. To support saving and restoring of the corresponding
registers via the XSAVE mechanism, introduce the component definition
along with the necessary sanity checks.

Define the new component number, state name, and those register data
type. Then, extend the size checker to validate the register data type
and explicitly list the APX feature flag as a dependency for the new
component in xsave_cpuid_features[].

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
---
Changes from the last posting:
https://lore.kernel.org/lkml/20250320234301.8342-7-chang.seok.bae@intel.com/
* Move the check to be grouped with other XCHECK_SZ() entries (Sohil)
* Massage the changelog (Sohil)
* Add Sohil's tag
---
 arch/x86/include/asm/fpu/types.h | 9 +++++++++
 arch/x86/kernel/fpu/xstate.c     | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
index de16862bf230..97310df3ea13 100644
--- a/arch/x86/include/asm/fpu/types.h
+++ b/arch/x86/include/asm/fpu/types.h
@@ -125,6 +125,7 @@ enum xfeature {
 	XFEATURE_RSRVD_COMP_16,
 	XFEATURE_XTILE_CFG,
 	XFEATURE_XTILE_DATA,
+	XFEATURE_APX,
 
 	XFEATURE_MAX,
 };
@@ -145,6 +146,7 @@ enum xfeature {
 #define XFEATURE_MASK_LBR		(1 << XFEATURE_LBR)
 #define XFEATURE_MASK_XTILE_CFG		(1 << XFEATURE_XTILE_CFG)
 #define XFEATURE_MASK_XTILE_DATA	(1 << XFEATURE_XTILE_DATA)
+#define XFEATURE_MASK_APX		(1 << XFEATURE_APX)
 
 #define XFEATURE_MASK_FPSSE		(XFEATURE_MASK_FP | XFEATURE_MASK_SSE)
 #define XFEATURE_MASK_AVX512		(XFEATURE_MASK_OPMASK \
@@ -303,6 +305,13 @@ struct xtile_data {
 	struct reg_1024_byte		tmm;
 } __packed;
 
+/*
+ * State component 19: 8B extended general purpose register.
+ */
+struct apx_state {
+	u64				egpr[16];
+} __packed;
+
 /*
  * State component 10 is supervisor state used for context-switching the
  * PASID state.
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index a288597065fd..dfd07af10037 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -63,6 +63,7 @@ static const char *xfeature_names[] =
 	"unknown xstate feature",
 	"AMX Tile config",
 	"AMX Tile data",
+	"APX registers",
 	"unknown xstate feature",
 };
 
@@ -81,6 +82,7 @@ static unsigned short xsave_cpuid_features[] __initdata = {
 	[XFEATURE_CET_USER]			= X86_FEATURE_SHSTK,
 	[XFEATURE_XTILE_CFG]			= X86_FEATURE_AMX_TILE,
 	[XFEATURE_XTILE_DATA]			= X86_FEATURE_AMX_TILE,
+	[XFEATURE_APX]				= X86_FEATURE_APX,
 };
 
 static unsigned int xstate_offsets[XFEATURE_MAX] __ro_after_init =
@@ -569,6 +571,7 @@ static bool __init check_xstate_against_struct(int nr)
 	case XFEATURE_PASID:	  return XCHECK_SZ(sz, nr, struct ia32_pasid_state);
 	case XFEATURE_XTILE_CFG:  return XCHECK_SZ(sz, nr, struct xtile_cfg);
 	case XFEATURE_CET_USER:	  return XCHECK_SZ(sz, nr, struct cet_user_state);
+	case XFEATURE_APX:        return XCHECK_SZ(sz, nr, struct apx_state);
 	case XFEATURE_XTILE_DATA: check_xtile_data_against_struct(sz); return true;
 	default:
 		XSTATE_WARN_ON(1, "No structure for xstate: %d\n", nr);
-- 
2.45.2

