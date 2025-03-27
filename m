Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940CC1EB5F8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119349; cv=none; b=sv412k1amup4DgrOOAcDnns1JnPVB4cRDSgTE3oSvsXZz4+xpupFGtvin+rcD+aUCJ2ZvgACucqbnXRztPIx+aqidwpJOxthe8EFgT22vFy3QcfesbIJxlaX0x1dssGnrXg9nMqglLekLFCY8Da4gmJKO4LnC5TqOJYS1ZNjvsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119349; c=relaxed/simple;
	bh=A3O1dUKmIFuVaH825Y+VuzOrdI2MI1HzpdnxKXVvGdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbr6L7itRxCKQ3kqypBcfKemv/66MMVCwO1b69mKZ/VgnRXBUDTokm2YFGNzy83Fk9HOrxRA4khD7CQt4pZDbfD3RMpB4F1Q8hlEBgJcPQ765u9bezRy5TxofSMCmW5g7q2IvFOAtWgmADQ/XSmJ0cerfy7O3y/Vtg7riVt04Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqW3Nm9s; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqW3Nm9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119348; x=1774655348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A3O1dUKmIFuVaH825Y+VuzOrdI2MI1HzpdnxKXVvGdw=;
  b=QqW3Nm9sp6zjTb9Eh+PfKxf7Trm657oHQXzCpxdMDK4i/lNRE4KN2BQP
   UDSLURSb4EQNrDot/eOMAOoN0ky1VJ+XAAIWdlfLYsFHaZdv7rSq5E9Gq
   /IjXTTGEmxTjvTKRtVtdFUu24BuwW3GN0CW/TiSN/kAoYBjDutfR775zA
   gfKcy918jzBvSMNSeU9UFOfuLmuiKokPRu9NX+9SDBU7nZc/T8lRGFwJt
   NPL4PH4CRWGtGJVD8LC2HcTy+8Rnrng7IxNm9DnPtMtZSrwFRS/Im6iVP
   qrNn/pDXsvREicAqqQ563Gi8cXv77wyYLHtygwJWdM0vazVOyFhPIV0nm
   Q==;
X-CSE-ConnectionGUID: DTHHjLJwT/SrRSEUvbCgkA==
X-CSE-MsgGUID: iRXBtmPWRpqHfopFg5ib5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43627978"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43627978"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:49:06 -0700
X-CSE-ConnectionGUID: ih1UoK6lRQe+aHr+xwxxQg==
X-CSE-MsgGUID: AwOdvOnjSLG9tgZz5Sn2ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130150516"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 16:49:06 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Xin Li <xin@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] x86/nmi: Improve and relocate NMI handler comments
Date: Thu, 27 Mar 2025 23:46:26 +0000
Message-ID: <20250327234629.3953536-7-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327234629.3953536-1-sohil.mehta@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the comments in the default NMI handling code are out of place
or inadequate. Move them to the appropriate locations and update them as
needed.

Move the comment related to CPU-specific NMIs closer to the actual code.
Also, add more details about how back-to-back NMIs are detected since
that isn't immediately obvious.

Opportunistically, replace an #ifdef section in the vicinity with an
IS_ENABLED() check to make the code easier to read.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/kernel/nmi.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 2a07c9adc6a6..59ed74ec010e 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -359,17 +359,18 @@ static noinstr void default_do_nmi(struct pt_regs *regs)
 	bool b2b = false;
 
 	/*
-	 * CPU-specific NMI must be processed before non-CPU-specific
-	 * NMI, otherwise we may lose it, because the CPU-specific
-	 * NMI can not be detected/processed on other CPUs.
-	 */
-
-	/*
-	 * Back-to-back NMIs are interesting because they can either
-	 * be two NMI or more than two NMIs (any thing over two is dropped
-	 * due to NMI being edge-triggered).  If this is the second half
-	 * of the back-to-back NMI, assume we dropped things and process
-	 * more handlers.  Otherwise reset the 'swallow' NMI behaviour
+	 * Back-to-back NMIs are detected by comparing the RIP of the
+	 * current NMI with that of the previous NMI. If it is the same,
+	 * it is assumed that the CPU did not have a chance to jump back
+	 * into a non-NMI context and execute code in between the two
+	 * NMIs.
+	 *
+	 * They are interesting because even if there are more than two,
+	 * only a maximum of two can be detected (anything over two is
+	 * dropped due to NMI being edge-triggered). If this is the
+	 * second half of the back-to-back NMI, assume we dropped things
+	 * and process more handlers. Otherwise, reset the 'swallow' NMI
+	 * behavior.
 	 */
 	if (regs->ip == __this_cpu_read(last_nmi_rip))
 		b2b = true;
@@ -383,6 +384,11 @@ static noinstr void default_do_nmi(struct pt_regs *regs)
 	if (microcode_nmi_handler_enabled() && microcode_nmi_handler())
 		goto out;
 
+	/*
+	 * CPU-specific NMI must be processed before non-CPU-specific
+	 * NMI, otherwise we may lose it, because the CPU-specific
+	 * NMI can not be detected/processed on other CPUs.
+	 */
 	handled = nmi_handle(NMI_LOCAL, regs);
 	__this_cpu_add(nmi_stats.normal, handled);
 	if (handled) {
@@ -419,13 +425,14 @@ static noinstr void default_do_nmi(struct pt_regs *regs)
 			pci_serr_error(reason, regs);
 		else if (reason & NMI_REASON_IOCHK)
 			io_check_error(reason, regs);
-#ifdef CONFIG_X86_32
+
 		/*
 		 * Reassert NMI in case it became active
 		 * meanwhile as it's edge-triggered:
 		 */
-		reassert_nmi();
-#endif
+		if (IS_ENABLED(CONFIG_X86_32))
+			reassert_nmi();
+
 		__this_cpu_add(nmi_stats.external, 1);
 		raw_spin_unlock(&nmi_reason_lock);
 		goto out;
-- 
2.43.0

