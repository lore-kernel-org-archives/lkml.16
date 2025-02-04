Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C032163AA;
	Tue,  4 Feb 2025 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690552; cv=none; b=fyKulo3BXULFyX1gfz+vYUFiXej4JB096Dvk7ISRMI82IngcO4ZZJbDp3gbbsL311CKsLUP/i6Md43cT+XKLShrR8MOs3STo6w8OmLTK6E2/JPRllpMmB+2+14ThqsRZtyMy6cmcdqbC582022jydI7T1aP6KLhDkYELxvCjgjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690552; c=relaxed/simple;
	bh=GgxfVN861pKW86Az0//GU2BTNPe6s6rSZNyJJoV8Pn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHmdLjdoo0GBqcVj9T30H0Cky5OniuZiuhCcKoVF7bQCUg7xS1/4dzcrdxHX4515xLHEt6Xm5wEQFQ14oCSSfuY7qxTCNE3v1AW7gM11IQsKuX7odtQ3j+cE5DQt5wrfsDKOsuvjKbHrJ3Ql53s3SzePmImnPgoLZtXmaw6Vhrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVrYBjQh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVrYBjQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690551; x=1770226551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GgxfVN861pKW86Az0//GU2BTNPe6s6rSZNyJJoV8Pn4=;
  b=jVrYBjQhO2QmuAwBzqwkPwrrzPU5Nwr4rnCsPXzPE3azWzRnsV67F5cE
   qNaKF77o2/MmWr94b1YMv4AcIUFwBJ534hDfJR/2DskqfHhFNoDehhdpX
   mWEhUhIbGxgFXSwt75w0F7bhUk+0/ET4eLWXewymsvIYOCG/bmzJAlO0m
   w+IyyhKVsrDy9S9K5UTe4J6Gi3d+Z+kFtbdZCQu2A6BehBIdrxNTLVC1j
   GMcXqKzSy4l5bVvz2kwUoW1XBKV6HG53eqSypQstIEht+w2kTSMfuf8lp
   TfZD7LaUD1OOyrZDye0efbG5oEuStbEk8Paq4DI6elvgaAIcTAG1cn0d8
   g==;
X-CSE-ConnectionGUID: aQ3yqOPmRuSPJyPVNNbHFA==
X-CSE-MsgGUID: uyTPCFycSHKblo6IJDVjlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930640"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930640"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:35:50 -0800
X-CSE-ConnectionGUID: EjCbNRnNQ/eG0RktDBjJIQ==
X-CSE-MsgGUID: zLXQup0VQWiJeXH9lbUyzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866602"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:35:38 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 06/15] x86: Reset tag for virtual to physical address conversions
Date: Tue,  4 Feb 2025 18:33:47 +0100
Message-ID: <80aa9a4c633502b5330c40f8b2d4da705dca92e7.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Any place where pointer arithmetic is used to convert a virtual address
into a physical one can raise errors if the virtual address is tagged.

Reset the pointer's tag by sign extending the tag bits in macros that do
pointer arithmetic in address conversions. There will be no change in
compiled code with KASAN disabled since the compiler will optimize the
__tag_reset() out.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/include/asm/page.h    | 17 +++++++++++++----
 arch/x86/include/asm/page_64.h |  2 +-
 arch/x86/mm/physaddr.c         |  1 +
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
index 1b93ff80b43b..09c3914d8ce4 100644
--- a/arch/x86/include/asm/page.h
+++ b/arch/x86/include/asm/page.h
@@ -7,6 +7,7 @@
 #ifdef __KERNEL__
 
 #include <asm/page_types.h>
+#include <asm/kasan.h>
 
 #ifdef CONFIG_X86_64
 #include <asm/page_64.h>
@@ -41,7 +42,7 @@ static inline void copy_user_page(void *to, void *from, unsigned long vaddr,
 #define __pa(x)		__phys_addr((unsigned long)(x))
 #endif
 
-#define __pa_nodebug(x)	__phys_addr_nodebug((unsigned long)(x))
+#define __pa_nodebug(x)	__phys_addr_nodebug((unsigned long)(__tag_reset(x)))
 /* __pa_symbol should be used for C visible symbols.
    This seems to be the official gcc blessed way to do such arithmetic. */
 /*
@@ -65,9 +66,17 @@ static inline void copy_user_page(void *to, void *from, unsigned long vaddr,
  * virt_to_page(kaddr) returns a valid pointer if and only if
  * virt_addr_valid(kaddr) returns true.
  */
-#define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
+
+#ifdef CONFIG_KASAN_SW_TAGS
+#define page_to_virt(x)	({									\
+	__typeof__(x) __page = x;								\
+	void *__addr = __va(page_to_pfn((__typeof__(x))__tag_reset(__page)) << PAGE_SHIFT);	\
+	(void *)__tag_set((const void *)__addr, page_kasan_tag(__page));			\
+})
+#endif
+#define virt_to_page(kaddr)	pfn_to_page(__pa((void *)__tag_reset(kaddr)) >> PAGE_SHIFT)
 extern bool __virt_addr_valid(unsigned long kaddr);
-#define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long) (kaddr))
+#define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long)(__tag_reset(kaddr)))
 
 static __always_inline void *pfn_to_kaddr(unsigned long pfn)
 {
@@ -81,7 +90,7 @@ static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
 
 static __always_inline u64 __is_canonical_address(u64 vaddr, u8 vaddr_bits)
 {
-	return __canonical_address(vaddr, vaddr_bits) == vaddr;
+	return __canonical_address(vaddr, vaddr_bits) == __tag_reset(vaddr);
 }
 
 #endif	/* __ASSEMBLY__ */
diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index f3d257c45225..6e24aeff36eb 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -33,7 +33,7 @@ static __always_inline unsigned long __phys_addr_nodebug(unsigned long x)
 extern unsigned long __phys_addr(unsigned long);
 extern unsigned long __phys_addr_symbol(unsigned long);
 #else
-#define __phys_addr(x)		__phys_addr_nodebug(x)
+#define __phys_addr(x)		__phys_addr_nodebug(__tag_reset(x))
 #define __phys_addr_symbol(x) \
 	((unsigned long)(x) - __START_KERNEL_map + phys_base)
 #endif
diff --git a/arch/x86/mm/physaddr.c b/arch/x86/mm/physaddr.c
index fc3f3d3e2ef2..7f2b11308245 100644
--- a/arch/x86/mm/physaddr.c
+++ b/arch/x86/mm/physaddr.c
@@ -14,6 +14,7 @@
 #ifdef CONFIG_DEBUG_VIRTUAL
 unsigned long __phys_addr(unsigned long x)
 {
+	x = __tag_reset(x);
 	unsigned long y = x - __START_KERNEL_map;
 
 	/* use the carry flag to determine if x was < __START_KERNEL_map */
-- 
2.47.1

