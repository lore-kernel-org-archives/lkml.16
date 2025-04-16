Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C322A4C2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769863; cv=none; b=KWa8mcHBHWUbwT4kg0Ef7TV3teo9iTpGdDSLCtYaZn98T+auxyPiLxVB30V18UrKgqiCBg8ENF7/paeP4QpNn275z6IT2Xuuankdrktm5LEa3XiyiPphMEDxfK2f6pXRjxYv65yjuubG2OS4+87xS4Cqw+kO666JahNaEhMZrVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769863; c=relaxed/simple;
	bh=5MOeIHBM+usD4ZUhtxyVCKaIctcPE34AfdGdztUVcCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/t3543V0v4ccjxqp7qruI4Zc4y1CUII22WiwcY/gZIvaXoSfudqC8D7bHxrXxnqwdrQGebPATJn4X9ZZ8bimsAmMKPJVqOdeNH8Hksy4PZQnwL2mYl5l3KWwbl49OLC8j4M0G6eUTlPjFoQcRGaAHiDG7RDV9J93yvT4ZVfKzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvZ3Q4Km; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvZ3Q4Km"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769861; x=1776305861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5MOeIHBM+usD4ZUhtxyVCKaIctcPE34AfdGdztUVcCk=;
  b=lvZ3Q4KmeowSgs0HDQfbYRQ3ZVK3xXShw387BLKclgJpRfizfOylOvm/
   qTTVo8ZirDzHA+FG7HijbCOKkLdu+4+DBexvzOoOZSb77Qq1qLkfBmLOS
   TpRghdHtoxvPqHEkNFkOJsCg/m+ZlLNrGFXIOqtr9qQIRhMl1TjFi/Dd8
   QGDXEqcIHZ+U76QSiOWCeEMF0CxiKIT5gKGTMkZ9L5ncPQQFx+sOKR6JO
   s9U/Xp1gIxkPFaR3QP7qpa4v2tgFFX0H2kPQCW+DhFqcfESqIx2sHldnb
   4mpfwoecK8nxYrRDJLNWw8/FM4kksQD77Pmzlil84EBP75ptCaPn9rD9T
   A==;
X-CSE-ConnectionGUID: 8GYPD73MQl2JLOgPrjrI/A==
X-CSE-MsgGUID: e+43c6I7SmiDDiS2r/MxfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998183"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998183"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:41 -0700
X-CSE-ConnectionGUID: arO8y6H5Q0CkF9D8YChelw==
X-CSE-MsgGUID: mABOB4zKTnSupPb5DR/AsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260488"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:41 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH 07/10] x86/fpu: Refactor xfeature bitmask update code for sigframe XSAVE
Date: Tue, 15 Apr 2025 19:16:57 -0700
Message-ID: <20250416021720.12305-8-chang.seok.bae@intel.com>
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

Currently, saving register states in the signal frame, the legacy feature
bits are always set in xregs_state->header->xfeatures. This code sequence
can be generalized for reuse in similar cases.

Refactor the logic to ensure a consistent approach across similar usages.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
Changes from the last posting:
https://lore.kernel.org/lkml/20250214010607.7067-2-chang.seok.bae@intel.com/
* No change

This patch and the next were previously posted together. I thought this
refactoring is a meaningful step toward decoupling PKRU from an
unnecessary dependency on XGETBV(1).
---
 arch/x86/kernel/fpu/signal.c | 11 +----------
 arch/x86/kernel/fpu/xstate.h | 12 ++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index b8b4fa9c2d04..c3ec2512f2bb 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -114,7 +114,6 @@ static inline bool save_xstate_epilog(void __user *buf, int ia32_frame,
 {
 	struct xregs_state __user *x = buf;
 	struct _fpx_sw_bytes sw_bytes = {};
-	u32 xfeatures;
 	int err;
 
 	/* Setup the bytes not touched by the [f]xsave and reserved for SW. */
@@ -127,12 +126,6 @@ static inline bool save_xstate_epilog(void __user *buf, int ia32_frame,
 	err |= __put_user(FP_XSTATE_MAGIC2,
 			  (__u32 __user *)(buf + fpstate->user_size));
 
-	/*
-	 * Read the xfeatures which we copied (directly from the cpu or
-	 * from the state in task struct) to the user buffers.
-	 */
-	err |= __get_user(xfeatures, (__u32 __user *)&x->header.xfeatures);
-
 	/*
 	 * For legacy compatible, we always set FP/SSE bits in the bit
 	 * vector while saving the state to the user context. This will
@@ -144,9 +137,7 @@ static inline bool save_xstate_epilog(void __user *buf, int ia32_frame,
 	 * header as well as change any contents in the memory layout.
 	 * xrestore as part of sigreturn will capture all the changes.
 	 */
-	xfeatures |= XFEATURE_MASK_FPSSE;
-
-	err |= __put_user(xfeatures, (__u32 __user *)&x->header.xfeatures);
+	err |= set_xfeature_in_sigframe(x, XFEATURE_MASK_FPSSE);
 
 	return !err;
 }
diff --git a/arch/x86/kernel/fpu/xstate.h b/arch/x86/kernel/fpu/xstate.h
index 9a3a8ccf13bf..aadf02aed071 100644
--- a/arch/x86/kernel/fpu/xstate.h
+++ b/arch/x86/kernel/fpu/xstate.h
@@ -69,6 +69,18 @@ static inline u64 xfeatures_mask_independent(void)
 	return fpu_kernel_cfg.independent_features;
 }
 
+static inline int set_xfeature_in_sigframe(struct xregs_state __user *xbuf, u64 mask)
+{
+	u64 xfeatures;
+	int err;
+
+	/* Read the xfeatures value already saved in the user buffer */
+	err  = __get_user(xfeatures, &xbuf->header.xfeatures);
+	xfeatures |= mask;
+	err |= __put_user(xfeatures, &xbuf->header.xfeatures);
+	return err;
+}
+
 /*
  * Update the value of PKRU register that was already pushed onto the signal frame.
  */
-- 
2.45.2

