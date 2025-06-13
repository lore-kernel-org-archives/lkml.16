Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B423D28A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845467; cv=none; b=DpA0WBajKkkEtGbhwFoQg/PEXuMs2pprATusXO1TEtz0egJOfzws2V/2VIVAcJqeJ2k8vBfAzDYnqUyNbSxkRQ/lvR4DVPmp4s4vkqyB0Nc/qqU/seT46PWzwSYfEVxnl2QyLDkPuTfR4dza1b2fHUfjtT8Q8WHbXBoWjMgUtBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845467; c=relaxed/simple;
	bh=XqpLK8gW6rr2nWZQyZ09pxl4n3XyQrWST5fV0M7NL+o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XpeDwq0wpKGK3R0s0yzPixk5UrQatAs3xSpqjl+XrEI/tz66YCtmWnMN0LcehAoq0swY9J1JZbNf+ojG+GOWpdwaVBvGU3kjsyC5zinswu1py4LVoGFtWYAKciuTGOJMr5t8NrFgwhtRWr+uOH+cjeSCB0+DRPHOLkmWevukGq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=Qfi3FEJY; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="Qfi3FEJY"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade5ca8bc69so366184766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749845462; x=1750450262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3rzndryGKj8FfYnmFJ89LSS6fcKwQtrFfmMlORfHhY=;
        b=Qfi3FEJY+Bur1KtgMRV8dx/JgKdS/I+7Ii7l1/OlnGCXoOY1CBtzWqOi0Xiq7hZjwt
         TSvDeDawR3iaie5KSK0lSh4RWaljLOI1jK2YMX4bB5TSrT/1FsPz15G7Kj1MbOp240w0
         Zh7W/Q0bRsVD6RfwEyQcZ2IjmNYG7YurRiKA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749845462; x=1750450262;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3rzndryGKj8FfYnmFJ89LSS6fcKwQtrFfmMlORfHhY=;
        b=HMR45rO5mO97IDgx9ZEhE5kFvumc/O+17k2Nws6ym9AJuyob/C7q0wEo5rsIWTN5Lw
         HUvgkG5fMp1/qNLPajJihL486yhvv4i9s0CmDx8xs+a2yvkZM7C6L6l8t+Xc/HSGhTBu
         YqZfGcQYxiWCMDFqCvkZBcK3sCgb4QKraepGh7FafuljZzYC+P2v/2BXMrjhYz2g1j2C
         BQehcJxffUik8IX3dxjjcfmtM1GtvB5kC6pFXljCdD3NjPmz3iGHp1eYVLQKc5nIrMZG
         sZl0l3Rs309b/8zcuSyvUEEH6Hz+MVC7kjD++ZaPc9Y0SfCC7C6qF+uHLaeZxCfJP84L
         RMyw==
X-Gm-Message-State: AOJu0YzkmJpTK3ZGwRtTXbEwrdXT+qFUG8FmiOeTxiTpRA197VaMnoQZ
	cOmXH0lDcZOOQR7M5CZdIo9JkYAZ74xXomTRpyetAugKPbUvU+8ucUegXF2BljbKc4NF8mTL9k8
	hJ9Pkn8E=
X-Gm-Gg: ASbGnctjuJXrPE9QRMGpGCIOKz8vhBegiz8tlzR86OS4pLui+g+W5JKkUCWhU1auCMi
	cqrArGKzeqDxKUIC/VH0I6yE7LgpkzmgJH9iqN0YnOiMmkH9Sorbea47/46vjIeHsosPO+t5hKH
	q1BAYfnRp2n747fvjmiid5Xec2OyCv92DPnpisnD+1oBnDMZ05IB9XtRsEfZTns/bMqlcxvqNcq
	T2MebhX3zyALdfLi19anQkZ+1J/hdb8rgenrGiAYxA4kHK1C1klZoKJ6RJZbl1yfRrYVDHx4i3i
	p2Z0YcIDzX4UyzYoEV6mJdyMXA20ztm7VNctaWL6yElKB/8uBYtIJnQkRMgyIbHVAA==
X-Google-Smtp-Source: AGHT+IHEmyRU5vN+dhA+MrNmjXjScKNcFhj4rTx+ZBf6G3WYchF0YtJ7ycBplglcHfOlSP7d5PWLzQ==
X-Received: by 2002:a17:907:1b18:b0:ad2:2fe3:7074 with SMTP id a640c23a62f3a-adfad39c00amr46953066b.14.1749845461793;
        Fri, 13 Jun 2025 13:11:01 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfad4505a7sm22175266b.51.2025.06.13.13.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 13:11:01 -0700 (PDT)
Message-ID: <11b78ad4-9fdf-462c-90e5-469f06064376@neon.tech>
Date: Fri, 13 Jun 2025 21:11:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/4] x86/mm: Allow error returns from phys_*_init()
From: Em Sharnoff <sharnoff@neon.tech>
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org
Cc: Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <7d0d307d-71eb-4913-8023-bccc7a8a4a3d@neon.tech>
Content-Language: en-US
In-Reply-To: <7d0d307d-71eb-4913-8023-bccc7a8a4a3d@neon.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Preparation for returning errors when alloc_low_page() fails.

phys_pte_init() is excluded because it can't fail, and it's useful for
it to return 'paddr_last' instead.

This patch depends on the previous patch ("x86/mm: Update mapped
addresses in phys_{pmd,pud}_init()").

Signed-off-by: Em Sharnoff <sharnoff@neon.tech>
---
Changleog:
- v2: Switch from special-casing zero value to using ERR_PTR()
- v3: Fix -Wint-conversion errors
- v4: Switch return type to int, split alloc handling into separate patch.
---
 arch/x86/include/asm/pgtable.h |   2 +-
 arch/x86/mm/init.c             |  14 +++--
 arch/x86/mm/init_32.c          |   4 +-
 arch/x86/mm/init_64.c          | 100 ++++++++++++++++++++++-----------
 arch/x86/mm/mem_encrypt_amd.c  |   8 ++-
 arch/x86/mm/mm_internal.h      |   8 +--
 6 files changed, 87 insertions(+), 49 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 138d55f48a4f..b09194c42688 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1244,7 +1244,7 @@ extern int direct_gbpages;
 void init_mem_mapping(void);
 void early_alloc_pgt_buf(void);
 void __init poking_init(void);
-void init_memory_mapping(unsigned long start, unsigned long end, pgprot_t prot);
+int init_memory_mapping(unsigned long start, unsigned long end, pgprot_t prot);
 
 #ifdef CONFIG_X86_64
 extern pgd_t trampoline_pgd_entry;
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 1461873b44f1..1dc8fbd8cb63 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -543,11 +543,12 @@ void add_paddr_range_mapped(unsigned long start_paddr, unsigned long end_paddr)
  * This runs before bootmem is initialized and gets pages directly from
  * the physical memory. To access them they are temporarily mapped.
  */
-void __ref init_memory_mapping(unsigned long start,
+int __ref init_memory_mapping(unsigned long start,
 			       unsigned long end, pgprot_t prot)
 {
 	struct map_range mr[NR_RANGE_MR];
 	int nr_range, i;
+	int ret;
 
 	pr_debug("init_memory_mapping: [mem %#010lx-%#010lx]\n",
 	       start, end - 1);
@@ -555,11 +556,14 @@ void __ref init_memory_mapping(unsigned long start,
 	memset(mr, 0, sizeof(mr));
 	nr_range = split_mem_range(mr, 0, start, end);
 
-	for (i = 0; i < nr_range; i++)
-		kernel_physical_mapping_init(mr[i].start, mr[i].end,
-					     mr[i].page_size_mask, prot);
+	for (i = 0; i < nr_range; i++) {
+		ret = kernel_physical_mapping_init(mr[i].start, mr[i].end,
+						   mr[i].page_size_mask, prot);
+		if (ret)
+			return ret;
+	}
 
-	return;
+	return 0;
 }
 
 /*
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 4427ac433041..57bd154c206d 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -245,7 +245,7 @@ static inline int is_x86_32_kernel_text(unsigned long addr)
  * of max_low_pfn pages, by creating page tables starting from address
  * PAGE_OFFSET:
  */
-void __init
+int __init
 kernel_physical_mapping_init(unsigned long start,
 			     unsigned long end,
 			     unsigned long page_size_mask,
@@ -384,7 +384,7 @@ kernel_physical_mapping_init(unsigned long start,
 	}
 
 	add_paddr_range_mapped(start, last_map_addr);
-	return;
+	return 0;
 }
 
 #ifdef CONFIG_HIGHMEM
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index e729108bee30..b18ab2dcc799 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -503,7 +503,7 @@ phys_pte_init(pte_t *pte_page, unsigned long paddr, unsigned long paddr_end,
  * Create PMD level page table mapping for physical addresses. The virtual
  * and physical address have to be aligned at this level.
  */
-static void __meminit
+static int __meminit
 phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 	      unsigned long page_size_mask, pgprot_t prot, bool init)
 {
@@ -585,7 +585,7 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 	 * It is idempotent, so this is ok.
 	 */
 	add_paddr_range_mapped(paddr_first, paddr_last);
-	return;
+	return 0;
 }
 
 /*
@@ -593,12 +593,14 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
  * and physical address do not have to be aligned at this level. KASLR can
  * randomize virtual addresses up to this level.
  */
-static void __meminit
+static int __meminit
 phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 	      unsigned long page_size_mask, pgprot_t _prot, bool init)
 {
 	unsigned long pages = 0, paddr_next;
 	unsigned long vaddr = (unsigned long)__va(paddr);
+	int ret;
+
 	int i = pud_index(vaddr);
 
 	for (; i < PTRS_PER_PUD; i++, paddr = paddr_next) {
@@ -623,8 +625,10 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 		if (!pud_none(*pud)) {
 			if (!pud_leaf(*pud)) {
 				pmd = pmd_offset(pud, 0);
-				phys_pmd_init(pmd, paddr, paddr_end,
-					      page_size_mask, prot, init);
+				ret = phys_pmd_init(pmd, paddr, paddr_end,
+						    page_size_mask, prot, init);
+				if (ret)
+					return ret;
 				continue;
 			}
 			/*
@@ -660,33 +664,39 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 		}
 
 		pmd = alloc_low_page();
-		phys_pmd_init(pmd, paddr, paddr_end,
-			      page_size_mask, prot, init);
+		ret = phys_pmd_init(pmd, paddr, paddr_end,
+				    page_size_mask, prot, init);
 
 		spin_lock(&init_mm.page_table_lock);
 		pud_populate_init(&init_mm, pud, pmd, init);
 		spin_unlock(&init_mm.page_table_lock);
+
+		/*
+		 * Bail only after updating pud to keep progress from pmd across
+		 * retries.
+		 */
+		if (ret)
+			return ret;
 	}
 
 	update_page_count(PG_LEVEL_1G, pages);
 
-	return;
+	return 0;
 }
 
-static void __meminit
+static int __meminit
 phys_p4d_init(p4d_t *p4d_page, unsigned long paddr, unsigned long paddr_end,
 	      unsigned long page_size_mask, pgprot_t prot, bool init)
 {
 	unsigned long vaddr, vaddr_end, vaddr_next, paddr_next;
+	int ret;
 
 	vaddr = (unsigned long)__va(paddr);
 	vaddr_end = (unsigned long)__va(paddr_end);
 
-	if (!pgtable_l5_enabled()) {
-		phys_pud_init((pud_t *) p4d_page, paddr, paddr_end,
-			      page_size_mask, prot, init);
-		return;
-	}
+	if (!pgtable_l5_enabled())
+		return phys_pud_init((pud_t *) p4d_page, paddr, paddr_end,
+				     page_size_mask, prot, init);
 
 	for (; vaddr < vaddr_end; vaddr = vaddr_next) {
 		p4d_t *p4d = p4d_page + p4d_index(vaddr);
@@ -708,24 +718,33 @@ phys_p4d_init(p4d_t *p4d_page, unsigned long paddr, unsigned long paddr_end,
 
 		if (!p4d_none(*p4d)) {
 			pud = pud_offset(p4d, 0);
-			phys_pud_init(pud, paddr, __pa(vaddr_end),
-				      page_size_mask, prot, init);
+			ret = phys_pud_init(pud, paddr, __pa(vaddr_end),
+					    page_size_mask, prot, init);
+			if (ret)
+				return ret;
 			continue;
 		}
 
 		pud = alloc_low_page();
-		phys_pud_init(pud, paddr, __pa(vaddr_end),
-			      page_size_mask, prot, init);
+		ret = phys_pud_init(pud, paddr, __pa(vaddr_end),
+				    page_size_mask, prot, init);
 
 		spin_lock(&init_mm.page_table_lock);
 		p4d_populate_init(&init_mm, p4d, pud, init);
 		spin_unlock(&init_mm.page_table_lock);
+
+		/*
+		 * Bail only after updating p4d to keep progress from pud across
+		 * retries.
+		 */
+		if (ret)
+			return ret;
 	}
 
-	return;
+	return 0;
 }
 
-static void __meminit
+static int __meminit
 __kernel_physical_mapping_init(unsigned long paddr_start,
 			       unsigned long paddr_end,
 			       unsigned long page_size_mask,
@@ -733,6 +752,7 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 {
 	bool pgd_changed = false;
 	unsigned long vaddr, vaddr_start, vaddr_end, vaddr_next;
+	int ret;
 
 	vaddr = (unsigned long)__va(paddr_start);
 	vaddr_end = (unsigned long)__va(paddr_end);
@@ -746,14 +766,16 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 
 		if (pgd_val(*pgd)) {
 			p4d = (p4d_t *)pgd_page_vaddr(*pgd);
-			phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
-				      page_size_mask, prot, init);
+			ret = phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
+					    page_size_mask, prot, init);
+			if (ret)
+				return ret;
 			continue;
 		}
 
 		p4d = alloc_low_page();
-		phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
-			      page_size_mask, prot, init);
+		ret = phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
+				    page_size_mask, prot, init);
 
 		spin_lock(&init_mm.page_table_lock);
 		if (pgtable_l5_enabled())
@@ -761,15 +783,22 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 		else
 			p4d_populate_init(&init_mm, p4d_offset(pgd, vaddr),
 					  (pud_t *) p4d, init);
-
 		spin_unlock(&init_mm.page_table_lock);
+
+		/*
+		 * Bail only after updating pgd/p4d to keep progress from p4d
+		 * across retries.
+		 */
+		if (ret)
+			return ret;
+
 		pgd_changed = true;
 	}
 
 	if (pgd_changed)
 		sync_global_pgds(vaddr_start, vaddr_end - 1);
 
-	return;
+	return 0;
 }
 
 
@@ -779,13 +808,13 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
  * The virtual and physical addresses have to be aligned on PMD level
  * down.
  */
-void __meminit
+int __meminit
 kernel_physical_mapping_init(unsigned long paddr_start,
 			     unsigned long paddr_end,
 			     unsigned long page_size_mask, pgprot_t prot)
 {
-	__kernel_physical_mapping_init(paddr_start, paddr_end,
-				       page_size_mask, prot, true);
+	return __kernel_physical_mapping_init(paddr_start, paddr_end,
+					      page_size_mask, prot, true);
 }
 
 /*
@@ -794,14 +823,14 @@ kernel_physical_mapping_init(unsigned long paddr_start,
  * when updating the mapping. The caller is responsible to flush the TLBs after
  * the function returns.
  */
-void __meminit
+int __meminit
 kernel_physical_mapping_change(unsigned long paddr_start,
 			       unsigned long paddr_end,
 			       unsigned long page_size_mask)
 {
-	__kernel_physical_mapping_init(paddr_start, paddr_end,
-				       page_size_mask, PAGE_KERNEL,
-				       false);
+	return __kernel_physical_mapping_init(paddr_start, paddr_end,
+					      page_size_mask, PAGE_KERNEL,
+					      false);
 }
 
 #ifndef CONFIG_NUMA
@@ -980,8 +1009,11 @@ int arch_add_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
+	int ret;
 
-	init_memory_mapping(start, start + size, params->pgprot);
+	ret = init_memory_mapping(start, start + size, params->pgprot);
+	if (ret)
+		return ret;
 
 	return add_pages(nid, start_pfn, nr_pages, params);
 }
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 7490ff6d83b1..04e0b92eb9ad 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -444,9 +444,11 @@ static int __init early_set_memory_enc_dec(unsigned long vaddr,
 		 * kernel_physical_mapping_change() does not flush the TLBs, so
 		 * a TLB flush is required after we exit from the for loop.
 		 */
-		kernel_physical_mapping_change(__pa(vaddr & pmask),
-					       __pa((vaddr_end & pmask) + psize),
-					       split_page_size_mask);
+		ret = kernel_physical_mapping_change(__pa(vaddr & pmask),
+						     __pa((vaddr_end & pmask) + psize),
+						     split_page_size_mask);
+		if (ret)
+			return ret;
 	}
 
 	ret = 0;
diff --git a/arch/x86/mm/mm_internal.h b/arch/x86/mm/mm_internal.h
index 6fea5f7edd48..dacf3c924fbd 100644
--- a/arch/x86/mm/mm_internal.h
+++ b/arch/x86/mm/mm_internal.h
@@ -12,10 +12,10 @@ void early_ioremap_page_table_range_init(void);
 
 void add_paddr_range_mapped(unsigned long start_paddr, unsigned long end_paddr);
 
-void kernel_physical_mapping_init(unsigned long start, unsigned long end,
-								  unsigned long page_size_mask, pgprot_t prot);
-void kernel_physical_mapping_change(unsigned long start, unsigned long end,
-								    unsigned long page_size_mask);
+int kernel_physical_mapping_init(unsigned long start, unsigned long end,
+								 unsigned long page_size_mask, pgprot_t prot);
+int kernel_physical_mapping_change(unsigned long start, unsigned long end,
+								   unsigned long page_size_mask);
 void zone_sizes_init(void);
 
 extern int after_bootmem;
-- 
2.39.5

