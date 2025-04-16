Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C22722A4EB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769865; cv=none; b=Kb3zvQjq/44VX8CZmGI7BHh4zZkiSvkxq6gSFwnUNoPaHwkTkeaNzJNqAVymh50mfveISfGNdQYeHZNnmgoNtWHe+j9oqZ7vh1u1SZ2alAqswl4FdGEaCY3UDpkWjPBK/Pk+mRetiSfVE+h2J4IcuqBhcz8PNu8kEzOp5mMcfus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769865; c=relaxed/simple;
	bh=gkQKhjM3hJq53J8KDwyLOaPL+LB1NuqN1mHQhVIODcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pZu2eGqUGgYVQXHdUSTessCF0HrTC/j4FghTxVHmYdBol0h7N6eIeK2EOr9gxKFE5unS6UnS11HnbRy7nuiSqEJWoVyHh1EWfZD15pfN+FfAPzr6NiT+pBgdSAt1yfaU+Yyc9w+dIS2NsErILtquj82lL6Oxi2V5Lpca8u6v0Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyEj5Cid; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyEj5Cid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769863; x=1776305863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gkQKhjM3hJq53J8KDwyLOaPL+LB1NuqN1mHQhVIODcM=;
  b=VyEj5CidpSOrNQm/VprG5zDvpxBBPrTTPWAjxcKGuFKbq4/eFjO91b95
   0zZeESsPZGcdoLqvQCAxw83bqLrr+N9c4SrWb7e+AZwOBhQ/ak8miNpFk
   s2CnITZ/ImNkItpCGsbUi8ZmpiD2zTi3aBbW1+34/e9eByI4vFA0uSh6Q
   dL/BWwXwdFL6VwghBzX47hzXj0Q1HHR4WvnMQB6h0b7JuNPBgb0EQOQYz
   IhaEBhVSDaGpVtYMAtV0gTjZt3e2TWmJO4xDLMM00H+2lvwJXhHNlKrxl
   yeoxomn0fw1EDavEn/Jr0P6T2YRrJ0F0QDp7VCm2vu6dkGnQAuwUJCaEc
   Q==;
X-CSE-ConnectionGUID: 0v8uKmvfRMizLWYph0xnXA==
X-CSE-MsgGUID: DGNag0XqR6q0olJx12gUJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998189"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998189"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:43 -0700
X-CSE-ConnectionGUID: GlKOvbGTTCiE1ZGX/Tc1Dw==
X-CSE-MsgGUID: YHKIGLrjSuGcfRcwFQsYiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260498"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:43 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com,
	Aruna Ramakrishna <aruna.ramakrishna@oracle.com>,
	Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
Subject: [PATCH 08/10] x86/pkeys: Simplify PKRU update in signal frame
Date: Tue, 15 Apr 2025 19:16:58 -0700
Message-ID: <20250416021720.12305-9-chang.seok.bae@intel.com>
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

The signal delivery logic was modified to always set the PKRU bit in
xregs_state->header->xfeatures by this commit:

    ae6012d72fa6 ("x86/pkeys: Ensure updated PKRU value is XRSTOR'd")

However, the change derives the bitmask value using XGETBV(1), rather
than simply updating the buffer that already holds the value. Thus, this
approach induces an unnecessary dependency on XGETBV1 for PKRU handling.

Eliminate the dependency by using the established helper function.
Subsequently, remove the now-unused 'mask' argument.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Cc: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
---
Changes from the last posting:
https://lore.kernel.org/lkml/20250214010607.7067-3-chang.seok.bae@intel.com/
* Massage the changelog

Additional Context:
  Previously, the concern was raised about environments where XGETBV1 is
  unavailable — such as in some virtual machines:

    https://lore.kernel.org/lkml/20250102075419.2559-1-TonyWWang-oc@zhaoxin.com

  That patch tried to sidestep the problem by skipping PKRU updates
  entirely when XGETBV1 is inaccessible. However, this assumed the
  dependency was necessary, which isn’t the case.
---
 arch/x86/kernel/fpu/xstate.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/fpu/xstate.h b/arch/x86/kernel/fpu/xstate.h
index aadf02aed071..a6d987c16293 100644
--- a/arch/x86/kernel/fpu/xstate.h
+++ b/arch/x86/kernel/fpu/xstate.h
@@ -84,18 +84,15 @@ static inline int set_xfeature_in_sigframe(struct xregs_state __user *xbuf, u64
 /*
  * Update the value of PKRU register that was already pushed onto the signal frame.
  */
-static inline int update_pkru_in_sigframe(struct xregs_state __user *buf, u64 mask, u32 pkru)
+static inline int update_pkru_in_sigframe(struct xregs_state __user *buf, u32 pkru)
 {
-	u64 xstate_bv;
 	int err;
 
 	if (unlikely(!cpu_feature_enabled(X86_FEATURE_OSPKE)))
 		return 0;
 
 	/* Mark PKRU as in-use so that it is restored correctly. */
-	xstate_bv = (mask & xfeatures_in_use()) | XFEATURE_MASK_PKRU;
-
-	err =  __put_user(xstate_bv, &buf->header.xfeatures);
+	err = set_xfeature_in_sigframe(buf, XFEATURE_MASK_PKRU);
 	if (err)
 		return err;
 
@@ -319,7 +316,7 @@ static inline int xsave_to_user_sigframe(struct xregs_state __user *buf, u32 pkr
 	clac();
 
 	if (!err)
-		err = update_pkru_in_sigframe(buf, mask, pkru);
+		err = update_pkru_in_sigframe(buf, pkru);
 
 	return err;
 }
-- 
2.45.2

