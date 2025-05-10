Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16122561A1
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746876053; cv=none; b=X3jv7/SUz3wuz8pz1KRTnnbeQzq9d7YgypHA8REXwlsqAzJgodWOjA2hvNTmTzq56hc08sglp0AuhCby0MnRNKLmM0rjCCxdA2/sOSfH4SnzgfycWU8NHN98w1DrZVVOzOOGZn5Rp5KtLFTJUbVM/DMbrJt7t3gllz/TuYGsr64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746876053; c=relaxed/simple;
	bh=5ekbU6jus97ArbzRCeENNsaoa4tX9hp4KNdHBIDfu9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pt4e+n0R2xTMVr7lAMLU/aKo/NB9AZqxEYr7PG7Y2ZTgr/xd2g20XMWJCqDPXvNDjXZ7shYsDYv/OO4ARum7yhveWR4lF7NlXOZpLLJZiYhbD8zicw9H4Cw/POCKoHbPOjUwjokdb7f9iHyBwPNDNfxqgDFqzfA+PGh4QfxO2gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loTlEKc6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loTlEKc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746876052; x=1778412052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ekbU6jus97ArbzRCeENNsaoa4tX9hp4KNdHBIDfu9o=;
  b=loTlEKc6QcvjOt0MsHqw7cdHEuO9FuLqDgPxP7QrRrM/lSM6ySeWhb/I
   +7lOV5hWcA617LRseXCUvpOP7o+Xz88Vl0oX4MylC/2rEu0WZBX+MF/kK
   Qie0EOLCIceBD5064wBmw5NyeemE6UH6qjnSeapNbfwgdr9+oFs8Eu3RG
   QAFH4cnPqm1hywIaow9NMWKNTyYwy8oqWmW/aM9GmcOHrw9wYWRpev0cZ
   74UepTabBA4tYC9m14WqvKJcJ65vE18328RgKATe/4zazel1fCawzKm0R
   3fLAoYbKNX+Xhm2HCkZ26MALFt+44ey4Tuvw2TnaF9ZRaOGiBlxboDfr8
   Q==;
X-CSE-ConnectionGUID: JHd8FuKZRmKeWXtHIQHMcQ==
X-CSE-MsgGUID: 6APfXlIdQNOGN9bEFATxDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71219302"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="71219302"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:20:51 -0700
X-CSE-ConnectionGUID: GCowhyE9RfiTjgSrvjPEgg==
X-CSE-MsgGUID: KnUseOrRSTCxX0udMQfl4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136566487"
Received: from server.sh.intel.com ([10.239.53.23])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:20:48 -0700
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
	isaku.yamahata@intel.com,
	reinette.chatre@intel.com,
	dan.j.williams@intel.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	nik.borisov@suse.com,
	sagis@google.com
Subject: [PATCH v2 2/5] x86/virt/tdx: Mark memory cache state incoherent when making SEAMCALL
Date: Sat, 10 May 2025 11:20:06 +0000
Message-ID: <ab08a6a1f4d1873eb09d5ad625c42a51d29e5971.1746874095.git.kai.huang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746874095.git.kai.huang@intel.com>
References: <cover.1746874095.git.kai.huang@intel.com>
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
 arch/x86/include/asm/tdx.h | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 4a1922ec80cf..d017e48958cd 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -97,9 +97,38 @@ u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
 void tdx_init(void);
 
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
@@ -107,7 +136,7 @@ static inline u64 sc_retry(sc_func_t func, u64 fn,
 	u64 ret;
 
 	do {
-		ret = func(fn, args);
+		ret = do_seamcall(func, fn, args);
 	} while (ret == TDX_RND_NO_ENTROPY && --retry);
 
 	return ret;
-- 
2.43.0

