Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA1221F12
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769869; cv=none; b=LuMp+gGEvKOETwa4N/QvICKrmE3Y3VjB9m/ZsYcN2w5c6EGhrxUo7zWxjUX0yUo3OACrUdJYYVcKYJvqY/zKes97sruoVRB5OFZ8VCMzqAJRqpbOI+bbblyJ9k2jwn6i7Nr0McX+KrS7GEWwxUFN5oFQccqUqD8bOuoREKi+G6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769869; c=relaxed/simple;
	bh=k1KtmolTS7TvXL3ztJB2/zi3lUwTZt9i1snZyArI/H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZsA4ihLF5+kvIH11r9/h1P0xYG5xwL4Xl3HOCzN01pbfiqxcSBHX84tc+sUhwk9fHmY01NvR7mHz51yOJFkD/7PGkeAGejgINE3a6pWWudrp1wvlYmXeFDYtZ+r16/otrQkW07JZ0grgGI7W+vh7WnG2wQmohqx+9y87MrzY3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqUKqDui; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqUKqDui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769867; x=1776305867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k1KtmolTS7TvXL3ztJB2/zi3lUwTZt9i1snZyArI/H8=;
  b=hqUKqDuiDlSSW1rPkBs1XEc3wR+7TRui2ELYaoay+uB7nmcLVlaqEJIW
   ozcfG+qWZm+/57xBRHnsX1pLW1pqDgDVAolOeyXUOf7C5xPeKUryTcnTw
   nBu9yCZH6N2hNUORna+4ugcu7y+jtVyzPsZZK6JotG9D8QsvHytlfWamK
   BxehqDof6TwU1URTAZPhqN9tLOllamuHpLZUlBzQ8wdLPxyoX5ZW7Ecd9
   m35If0kHJPDZS1rM9VNvmYpTpvJ06lLeq7Rtq3CPUpicP1+IDm6KrYSc8
   UJGAN1b6ILxRB83p6jv4ph1ZbLZfo2kiI6ftPD/nWqXMn5d+vcelRGOiK
   g==;
X-CSE-ConnectionGUID: 1NUD7du3Syqv2XYoshHJlA==
X-CSE-MsgGUID: U3uKHhbpQaqRM5Ke3zMekg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998204"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998204"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:47 -0700
X-CSE-ConnectionGUID: HhUCit1FQx+vBFrKEqbGRQ==
X-CSE-MsgGUID: 9s7fq6YTTQCbaWI5q3v9gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260517"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:47 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH 10/10] x86/fpu: Rename fpu_reset_fpregs() to fpu_reset_fpstate_regs()
Date: Tue, 15 Apr 2025 19:17:00 -0700
Message-ID: <20250416021720.12305-11-chang.seok.bae@intel.com>
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

The original function name came from an overly compressed form of
'fpstate_regs' by commit:

    e61d6310a0f8 ("x86/fpu: Reset permission and fpstate on exec()")

However, the term 'fpregs' typically refers to physical FPU registers. In
contrast, this function copies the init values to fpu->fpstate->regs, not
hardware registers.

Rename the function to better reflect what it actually does.

No functional change.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
Changes from the last posting:
https://lore.kernel.org/lkml/20240530192739.172566-2-chang.seok.bae@intel.com
* Refine the changelog
* Add a note referencing the original naming decision.

This patch was originally submitted as part of the In-Field Scan driver
series. Although that series is now dropped that I believe, this rename
still serves as a useful cleanup to correct a naming choice that I
previously made :(.
---
 arch/x86/kernel/fpu/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index 3a19877a314e..8d674435f173 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -733,7 +733,7 @@ static inline void restore_fpregs_from_init_fpstate(u64 features_mask)
 /*
  * Reset current->fpu memory state to the init values.
  */
-static void fpu_reset_fpregs(void)
+static void fpu_reset_fpstate_regs(void)
 {
 	struct fpu *fpu = x86_task_fpu(current);
 
@@ -768,7 +768,7 @@ void fpu__clear_user_states(struct fpu *fpu)
 
 	fpregs_lock();
 	if (!cpu_feature_enabled(X86_FEATURE_FPU)) {
-		fpu_reset_fpregs();
+		fpu_reset_fpstate_regs();
 		fpregs_unlock();
 		return;
 	}
@@ -798,7 +798,7 @@ void fpu__clear_user_states(struct fpu *fpu)
 void fpu_flush_thread(void)
 {
 	fpstate_reset(x86_task_fpu(current));
-	fpu_reset_fpregs();
+	fpu_reset_fpstate_regs();
 }
 /*
  * Load FPU context before returning to userspace.
-- 
2.45.2

