Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D12165E8;
	Tue,  4 Feb 2025 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690519; cv=none; b=dFXOvvHKGENHWZ9ZQ7hszbmLg2My8fJCK2DT+sc/Ug9n9/6yZ3vIA92hBmyvrL9L7VNABtm0Vl2rHc9hZlmgqAtbI2iCF3TMZl95Mlb5lfg7KE7hqfooybMKZZZaXy5GPXAvZ6LFh7VchKaG2u++5MM3yojEHWXRHAh/1QKS3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690519; c=relaxed/simple;
	bh=edAJD92hFjQk8fjbvzxioatc9um2IkZNk+/tzcDM8p4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PeOta3Pc6o9wAgKOGopkSqWOiLsKs0IORo6axEEinJJS7FvS/hAHNFQhUI7VLBlnjiLaHPDD6DsuTQt10p4YUZHVpUIGlODwUiKHog7G/rXAEEmrX90qU1bDhdF21syhz3bNaAlwj1Ogr5mPhRf4BA0fwV66nBgp1qQepD4Gr/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsm4X8Hk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsm4X8Hk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690517; x=1770226517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=edAJD92hFjQk8fjbvzxioatc9um2IkZNk+/tzcDM8p4=;
  b=dsm4X8HkmGZRRVndEXeUODKR1LloYDT5lxd9vQYXP+3Kc3U3zXOoP1aM
   7E0poUQovfpoB/WkFF4HBz3rr2QyGRj1Hk7WAMbMBvAuoDXMs41qEu52r
   4HBZWNllNenWQlao8MwX8gMBIwEiuVjnONP5SRmAJaxKdqyaDUxmLuzKQ
   VBzl1cIupxsmB6kzY28oVS8inSoFDfGSXQrFatvp3qeQb2ioS9bTgl3fu
   jB5rA9oLRdcMehRSiBKmajUijPqcFLuoii7LjRayTuYge9jruLubMiU2k
   SpdUjAi4ZZGHTO0tEDAd8Uv3SToG4pDitcfFBsu9npDcAsahyzCN32rzm
   g==;
X-CSE-ConnectionGUID: K0LzWR/FTyqTOJl3jkXdAw==
X-CSE-MsgGUID: euzW0rMrRhCdGdt4lrLVag==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930452"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930452"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:35:14 -0800
X-CSE-ConnectionGUID: GXavZLsESKizsbio/E/Srw==
X-CSE-MsgGUID: e0b52Ax9SOSm68zuxVJ9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866342"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:35:02 -0800
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
Subject: [PATCH 03/15] kasan: Vmalloc dense tag-based mode support
Date: Tue,  4 Feb 2025 18:33:44 +0100
Message-ID: <a8cfb5d8d93ba48fd5f2defcccac5d758ecd7f39.1738686764.git.maciej.wieczor-retman@intel.com>
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

To use KASAN with the vmalloc allocator multiple functions are
implemented that deal with full pages of memory. Many of these functions
are hardcoded to deal with byte aligned shadow memory regions by using
__memset().

With the introduction of the dense mode, tags won't necessarily occupy
whole bytes of shadow memory if the previously allocated memory wasn't
aligned to 32 bytes - which is the coverage of one shadow byte.

Change __memset() calls to kasan_poison(). With dense tag-based mode
enabled that will take care of any unaligned tags in shadow memory.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 mm/kasan/kasan.h  |  2 +-
 mm/kasan/shadow.c | 14 ++++++--------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index d29bd0e65020..a56aadd51485 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -135,7 +135,7 @@ static inline bool kasan_requires_meta(void)
 
 #define KASAN_GRANULE_MASK	(KASAN_GRANULE_SIZE - 1)
 
-#define KASAN_MEMORY_PER_SHADOW_PAGE	(KASAN_GRANULE_SIZE << PAGE_SHIFT)
+#define KASAN_MEMORY_PER_SHADOW_PAGE	(KASAN_SHADOW_SCALE_SIZE << PAGE_SHIFT)
 
 #ifdef CONFIG_KASAN_GENERIC
 #define KASAN_PAGE_FREE		0xFF  /* freed page */
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 368503f54b87..94f51046e6ae 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -332,7 +332,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	if (!page)
 		return -ENOMEM;
 
-	__memset((void *)page, KASAN_VMALLOC_INVALID, PAGE_SIZE);
+	kasan_poison((void *)page, PAGE_SIZE, KASAN_VMALLOC_INVALID, false);
 	pte = pfn_pte(PFN_DOWN(__pa(page)), PAGE_KERNEL);
 
 	spin_lock(&init_mm.page_table_lock);
@@ -357,9 +357,6 @@ int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
 	if (!is_vmalloc_or_module_addr((void *)addr))
 		return 0;
 
-	shadow_start = (unsigned long)kasan_mem_to_shadow((void *)addr);
-	shadow_end = (unsigned long)kasan_mem_to_shadow((void *)addr + size);
-
 	/*
 	 * User Mode Linux maps enough shadow memory for all of virtual memory
 	 * at boot, so doesn't need to allocate more on vmalloc, just clear it.
@@ -368,12 +365,12 @@ int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
 	 * reason.
 	 */
 	if (IS_ENABLED(CONFIG_UML)) {
-		__memset((void *)shadow_start, KASAN_VMALLOC_INVALID, shadow_end - shadow_start);
+		kasan_poison((void *)addr, size, KASAN_VMALLOC_INVALID, false);
 		return 0;
 	}
 
-	shadow_start = PAGE_ALIGN_DOWN(shadow_start);
-	shadow_end = PAGE_ALIGN(shadow_end);
+	shadow_start = PAGE_ALIGN_DOWN((unsigned long)kasan_mem_to_shadow((void *)addr));
+	shadow_end = PAGE_ALIGN((unsigned long)kasan_mem_to_shadow((void *)addr + size));
 
 	ret = apply_to_page_range(&init_mm, shadow_start,
 				  shadow_end - shadow_start,
@@ -546,7 +543,8 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
 	if (shadow_end > shadow_start) {
 		size = shadow_end - shadow_start;
 		if (IS_ENABLED(CONFIG_UML)) {
-			__memset(shadow_start, KASAN_SHADOW_INIT, shadow_end - shadow_start);
+			kasan_poison((void *)region_start, region_start - region_end,
+				     KASAN_VMALLOC_INVALID, false);
 			return;
 		}
 		apply_to_existing_page_range(&init_mm,
-- 
2.47.1

