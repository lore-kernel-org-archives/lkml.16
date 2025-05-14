Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A326FDAF
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217451; cv=none; b=g1S2PdKpXSfvbB77iW+g8E3EGtER7H6QbdIMCMZvUJatoc30DZ0klr5yetZDnx7L5fMwAhepEd/AzUp11P81qUqKbSQMRXMsW5gQoV//zr1GF03uxeyZn9IpKKcIctGv3bnVLL89b1mwpr2j35185tzmY5oRyfvWEO0LSvNbSNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217451; c=relaxed/simple;
	bh=sNlealfzXOQd7/yG159zEWUwv8AdU+3sOOoQ08iOKQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1+LIIYk+y09RN6kmG8N7rhdc69nSA0PNBopQJKnAzZ7zFOJR+tF8MsHhZ38Qwoq/6Myf64+fzDIuRmykL264dW0Yz3PRr1OsaKXjp3SWNsWWn/WlghMge4jxD/7tkloExOKBHO+eSXddtQNrH/2cKD0zTgQEYbKZSW4eWhyQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=np13n1S5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="np13n1S5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747217450; x=1778753450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sNlealfzXOQd7/yG159zEWUwv8AdU+3sOOoQ08iOKQQ=;
  b=np13n1S5x+opBpovLvxb6VOIqZqsZV7PEFmRM3pgTruf+bvWhAfQRUks
   hxuoWHYx2p2G404TTBnXNFgoormpd8eVbdc8rxdX4vU1CuBStPNnCrfzY
   xsVPgu5x2PhmmxH7oaZfje0fy/nG9FyE90gdIHSkLhb8ylKG0+PuocB/6
   KdD8D0w+Mw2lt7gTSfCH85NyX64pLYa5DUBp5cqNZiAZI76R95qcS15To
   vkOrFOYWZIsMZ/M6j4Xg9RUeN4RdXDE1ccNdIwO19I7DX4nUP+uTFNr1W
   a3FfbPlyU9B7RoyDKkGLltBDdhSRaXnDyeLba8dU+ZL4vKZENS9QWy65u
   A==;
X-CSE-ConnectionGUID: 8kMYdF05TvSMMM6mILSeCw==
X-CSE-MsgGUID: AP7iPAtDRuWZm+j+nTJntg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66516069"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="66516069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 03:10:48 -0700
X-CSE-ConnectionGUID: 8eGs8LEtTPCewk2ZHZZFUA==
X-CSE-MsgGUID: 3l4gUa4VSnmtvoE4oKHoCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="168937761"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO khuang2-desk.gar.corp.intel.com) ([10.124.222.76])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 03:10:44 -0700
From: Kai Huang <kai.huang@intel.com>
To: dave.hansen@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	peterz@infradead.org,
	mingo@redhat.com
Cc: kirill.shutemov@linux.intel.com,
	hpa@zytor.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	reinette.chatre@intel.com,
	isaku.yamahata@intel.com,
	dan.j.williams@intel.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	nik.borisov@suse.com,
	sagis@google.com
Subject: [PATCH v2.1 2/5] x86/virt/tdx: Mark memory cache state incoherent when making SEAMCALL
Date: Wed, 14 May 2025 22:10:22 +1200
Message-ID: <20250514101022.7537-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <ab08a6a1f4d1873eb09d5ad625c42a51d29e5971.1746874095.git.kai.huang@intel.com>
References: <ab08a6a1f4d1873eb09d5ad625c42a51d29e5971.1746874095.git.kai.huang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On TDX platforms, at hardware level dirty cachelines with and without
TDX keyID can coexist, and CPU can flush them back to memory in random
order.  During kexec, the caches must be flushed before jumping to the
new kernel to avoid silent memory corruption when a cacheline with a
different encryption property is written back over whatever encryption
properties the new kernel is using.

A percpu boolean is used to mark whether the cache of a given CPU may be
in an incoherent state, and the kexec performs WBINVD on the CPUs with
that boolean turned on.

For TDX, only the TDX module or the TDX guests can generate dirty
cachelines of TDX private memory, i.e., they are only generated when the
kernel does SEAMCALL.

Turn on that boolean when the kernel does SEAMCALL so that kexec can
correctly flush cache.  Note not all SEAMCALL leaf functions generate
dirty cachelines of TDX private memory, but for simplicity, just treat
all of them do.

SEAMCALL can be made from both task context and IRQ disabled context.
Given SEAMCALL is just a lengthy instruction (e.g., thousands of cycles)
from kernel's point of view and preempt_{disable|enable}() is cheap
compared to it, simply unconditionally disable preemption during setting
the percpu boolean and making SEAMCALL.

Signed-off-by: Kai Huang <kai.huang@intel.com>
---

v2 -> v2.1:
 - Include <linux/preempt.h> to fix a build issue reported by LKP using
   'x86_64-allyesconfig' config.

---
 arch/x86/include/asm/tdx.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 4a1922ec80cf..e69021aee731 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -96,10 +96,40 @@ u64 __seamcall_ret(u64 fn, struct tdx_module_args *args);
 u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
 void tdx_init(void);
 
+#include <linux/preempt.h>
 #include <asm/archrandom.h>
+#include <asm/processor.h>
 
 typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
 
+static inline u64 do_seamcall(sc_func_t func, u64 fn,
+			      struct tdx_module_args *args)
+{
+	u64 ret;
+
+	preempt_disable();
+
+	/*
+	 * SEAMCALLs are made to the TDX module and can generate dirty
+	 * cachelines of TDX private memory.  Mark cache state incoherent
+	 * so that the cache can be flushed during kexec.
+	 *
+	 * Not all SEAMCALL leaf functions generate dirty cachelines
+	 * but for simplicity just treat all of them do.
+	 *
+	 * This needs to be done before actually making the SEAMCALL,
+	 * because kexec-ing CPU could send NMI to stop remote CPUs,
+	 * in which case even disabling IRQ won't help here.
+	 */
+	this_cpu_write(cache_state_incoherent, true);
+
+	ret = func(fn, args);
+
+	preempt_enable();
+
+	return ret;
+}
+
 static inline u64 sc_retry(sc_func_t func, u64 fn,
 			   struct tdx_module_args *args)
 {
@@ -107,7 +137,7 @@ static inline u64 sc_retry(sc_func_t func, u64 fn,
 	u64 ret;
 
 	do {
-		ret = func(fn, args);
+		ret = do_seamcall(func, fn, args);
 	} while (ret == TDX_RND_NO_ENTROPY && --retry);
 
 	return ret;
-- 
2.49.0

