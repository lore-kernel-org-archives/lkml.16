Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95F52163AF;
	Tue,  4 Feb 2025 17:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690602; cv=none; b=Vv3amQtm5o22aDAOZmbilrQWOFCo/x0GDMb//t50IAbYTeQbQVYKPzVmglfbrKCxwVHMTpPpCMOUFiW/X+A7ivcQ3Ov5xIZz5U4b7ETUoTFdxOiiS66HnbtahEmaOIQpm4J1k9wSY+dOj/kpJ0iQ+M5IVfIqtFDvWUxOntnCdPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690602; c=relaxed/simple;
	bh=J5wZ/mcDbil10hn8JDYxev0M9sT2GI5gsQFk6+vTupM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9Tt9L2cllKyO11Tc5+TL8sF2lt3WwRnW1tyIBNilG2QIhUxu02vb0B/yoaqDxPCt0H9Gz1tiUmffzwcvdYY3IhBVbxwpN3e12nnWG6az4LgA/myeHhA8YxDdBO23L4/NuEIQRYetNyohVpdO4tHnn82oiHyUPY0VsRmT9Kibz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/lBYmY0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/lBYmY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690600; x=1770226600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J5wZ/mcDbil10hn8JDYxev0M9sT2GI5gsQFk6+vTupM=;
  b=T/lBYmY04F0gTR2DdBG1G7rqG9VCDAOmjBx2xooFhvjknmdPbSa0o/Dx
   Jz+O6tMUV1pg7H8QJiHz7H68RY6YLGAbfnis4m2AEoPjEWQa6w8MBIhB6
   dhtJrx4j8O0/orz1p3N9nzH9p5XOdoOni3CtfwrIAifzvOnudQ6Vwiwdp
   7wX8l3EFrPrCbKQBdv/8QOHL+64mQoxIVYbeTA9EguGLN9TWTRS8/w0Zh
   u/cNHAh3JbCgAtJvwSQm8kxUD9yjlsnMm5npYS6eylscnJ/KZllQO0Mnv
   Zj72IALpqACWv9K+xLUTqA5pxF3ENgZqG/4hCFiuAJGt2SZOtZQNpz6J0
   w==;
X-CSE-ConnectionGUID: 1j8/gvxiSB6YasberLKXTA==
X-CSE-MsgGUID: klFLnf7SSSqTnq63tS04eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930924"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930924"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:39 -0800
X-CSE-ConnectionGUID: euT5Fx0UQBaZT6g1J2Ba6Q==
X-CSE-MsgGUID: VDPCZKL7T1GLAmeyS4orWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866863"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:27 -0800
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
Subject: [PATCH 10/15] x86: KASAN raw shadow memory PTE init
Date: Tue,  4 Feb 2025 18:33:51 +0100
Message-ID: <28ddfb1694b19278405b4934f37d398794409749.1738686764.git.maciej.wieczor-retman@intel.com>
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

In KASAN's generic mode the default value in shadow memory is zero.
During initialization of shadow memory pages they are allocated and
zeroed.

In KASAN's tag-based mode the default tag for the arm64 architecture is
0xFE which corresponds to any memory that should not be accessed. On x86
(where tags are 4-bit wide instead of 8-bit wide) that tag is 0xE so
during the initializations all the bytes in shadow memory pages should
be filled with 0xE or 0xEE if two tags should be packed in one shadow
byte.

Use memblock_alloc_try_nid_raw() instead of memblock_alloc_try_nid() to
avoid zeroing out the memory so it can be set with the KASAN invalid
tag.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/mm/kasan_init_64.c | 19 ++++++++++++++++---
 include/linux/kasan.h       | 25 +++++++++++++++++++++++++
 mm/kasan/kasan.h            | 19 -------------------
 3 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 9dddf19a5571..55d468d83682 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -35,6 +35,18 @@ static __init void *early_alloc(size_t size, int nid, bool should_panic)
 	return ptr;
 }
 
+static __init void *early_raw_alloc(size_t size, int nid, bool should_panic)
+{
+	void *ptr = memblock_alloc_try_nid_raw(size, size,
+			__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+
+	if (!ptr && should_panic)
+		panic("%pS: Failed to allocate page, nid=%d from=%lx\n",
+		      (void *)_RET_IP_, nid, __pa(MAX_DMA_ADDRESS));
+
+	return ptr;
+}
+
 static void __init kasan_populate_pmd(pmd_t *pmd, unsigned long addr,
 				      unsigned long end, int nid)
 {
@@ -64,8 +76,9 @@ static void __init kasan_populate_pmd(pmd_t *pmd, unsigned long addr,
 		if (!pte_none(*pte))
 			continue;
 
-		p = early_alloc(PAGE_SIZE, nid, true);
-		entry = pfn_pte(PFN_DOWN(__pa(p)), PAGE_KERNEL);
+		p = early_raw_alloc(PAGE_SIZE, nid, true);
+		memset(p, PAGE_SIZE, kasan_dense_tag(KASAN_SHADOW_INIT));
+		entry = pfn_pte(PFN_DOWN(__pa_nodebug(p)), PAGE_KERNEL);
 		set_pte_at(&init_mm, addr, pte, entry);
 	} while (pte++, addr += PAGE_SIZE, addr != end);
 }
@@ -437,7 +450,7 @@ void __init kasan_init(void)
 	 * it may contain some garbage. Now we can clear and write protect it,
 	 * since after the TLB flush no one should write to it.
 	 */
-	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
+	kasan_poison(kasan_early_shadow_page, PAGE_SIZE, KASAN_SHADOW_INIT, false);
 	for (i = 0; i < PTRS_PER_PTE; i++) {
 		pte_t pte;
 		pgprot_t prot;
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 83146367170a..af8272c74409 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -151,6 +151,31 @@ static __always_inline void kasan_unpoison_range(const void *addr, size_t size)
 		__kasan_unpoison_range(addr, size);
 }
 
+#ifdef CONFIG_KASAN_HW_TAGS
+
+static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
+{
+	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
+		return;
+	if (WARN_ON(size & KASAN_GRANULE_MASK))
+		return;
+
+	hw_set_mem_tag_range(kasan_reset_tag(addr), size, value, init);
+}
+
+#else /* CONFIG_KASAN_HW_TAGS */
+
+/**
+ * kasan_poison - mark the memory range as inaccessible
+ * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
+ * @size - range size, must be aligned to KASAN_GRANULE_SIZE
+ * @value - value that's written to metadata for the range
+ * @init - whether to initialize the memory range (only for hardware tag-based)
+ */
+void kasan_poison(const void *addr, size_t size, u8 value, bool init);
+
+#endif /* CONFIG_KASAN_HW_TAGS */
+
 void __kasan_poison_pages(struct page *page, unsigned int order, bool init);
 static __always_inline void kasan_poison_pages(struct page *page,
 						unsigned int order, bool init)
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index a56aadd51485..2405477c5899 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -466,16 +466,6 @@ static inline u8 kasan_random_tag(void) { return 0; }
 
 #ifdef CONFIG_KASAN_HW_TAGS
 
-static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
-{
-	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
-		return;
-	if (WARN_ON(size & KASAN_GRANULE_MASK))
-		return;
-
-	hw_set_mem_tag_range(kasan_reset_tag(addr), size, value, init);
-}
-
 static inline void kasan_unpoison(const void *addr, size_t size, bool init)
 {
 	u8 tag = get_tag(addr);
@@ -497,15 +487,6 @@ static inline bool kasan_byte_accessible(const void *addr)
 
 #else /* CONFIG_KASAN_HW_TAGS */
 
-/**
- * kasan_poison - mark the memory range as inaccessible
- * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
- * @size - range size, must be aligned to KASAN_GRANULE_SIZE
- * @value - value that's written to metadata for the range
- * @init - whether to initialize the memory range (only for hardware tag-based)
- */
-void kasan_poison(const void *addr, size_t size, u8 value, bool init);
-
 /**
  * kasan_unpoison - mark the memory range as accessible
  * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
-- 
2.47.1

