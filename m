Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C61F7060
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285848; cv=none; b=rf0j7DqgaX6t7YYZLyLRjecHr+SG1CafLKqj1gPWGSi1inufLKivAD9zoJzKMADe+UL0zXmRq86KjUJV3pa+fi2jNWdMfDNeAYBGvooqivXcM67UifSN1nzNKFicvCaPcKUTkMcDQLILnPN057EqagLPP8bF9w2mDFD9fzEGITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285848; c=relaxed/simple;
	bh=1Za0Dc2wPfHEPu0+2ss5VpvWqBA/O+UGmGxOvF1hwwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uIE3flgoPgZAWC5w7OPtbLR7fzj0fmFfrYen90d9Fu9kKnKlnjKOSWGNIDWGnwPOf+XdV7ETy3swqqUU3NEatxP9u9I0ZaGb3NuKsOhqgJVZv4kf7Q7sXQ5I8Qps4x6KE35w0YtitHd0C9Ijx8+j5DEBZamQVpPq4EDunhnoV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvqXzJJr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvqXzJJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739285847; x=1770821847;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1Za0Dc2wPfHEPu0+2ss5VpvWqBA/O+UGmGxOvF1hwwk=;
  b=IvqXzJJr4BtDXQsJ2Hblj3rT7Anj0mZDKNKXsZfoii414IeDB2rifyca
   JhiKEdVwojbBoaQapWIxJBRod9fAezKbyqq+0Eywq9vxyQMeMl4AMrPOO
   VuFcdIY7nXhnYugmhxweEhGZbqnlLZsbMzs7rGr1rpyCvJwRZRx/wrG5s
   D+gEf+4297OJ4sPLiU29b+dzatYtZD7VErHi+8aPbztZvwV4KG5TRJNK2
   9a6d5UL/Gn/3VNkVMTxKSxiR4nu7lw3duLi6PG7j6ixKHOZ/BTCCN4p66
   Wcm9opjPj5+tSAS+jV1j5D6DmljyXsWO30uzQoWMyA+hIp2IB6yHSaVqH
   A==;
X-CSE-ConnectionGUID: HuAG0VfRTlK1guIxQ8UfyQ==
X-CSE-MsgGUID: wKoyqYajTNWbzYPoIf/OHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62376406"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="62376406"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:57:27 -0800
X-CSE-ConnectionGUID: XFXVXSAHSReKXuy5+41t7g==
X-CSE-MsgGUID: 9RHXEF7DRLOURLhHV++MnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112504925"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 11 Feb 2025 06:57:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0374911E; Tue, 11 Feb 2025 16:57:21 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] x86/pat: Guard within_inclusive() with ifdeffery
Date: Tue, 11 Feb 2025 16:57:21 +0200
Message-ID: <20250211145721.1620552-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The within_inclusive() in some cases, when CONFIG_X86_64=n, may be not used.
This, in particular, prevents kernel builds with clang, `make W=1`
and CONFIG_WERROR=y:

arch/x86/mm/pat/set_memory.c:215:1: error: unused function 'within_inclusive' [-Werror,-Wunused-function]

Fix this by guarding the definitions with the respective ifdeffery.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/mm/pat/set_memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index ef4514d64c05..89c297b68c84 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -211,14 +211,14 @@ within(unsigned long addr, unsigned long start, unsigned long end)
 	return addr >= start && addr < end;
 }
 
+#ifdef CONFIG_X86_64
+
 static inline int
 within_inclusive(unsigned long addr, unsigned long start, unsigned long end)
 {
 	return addr >= start && addr <= end;
 }
 
-#ifdef CONFIG_X86_64
-
 /*
  * The kernel image is mapped into two places in the virtual address space
  * (addresses without KASLR, of course):
-- 
2.45.1.3035.g276e886db78b

