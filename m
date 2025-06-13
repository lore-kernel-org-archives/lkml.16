Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2772608
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845419; cv=none; b=A6nAzgQRzi11w33lXyKTbLM5OMgprXFUHunj2IIiDlkuOBoYrMBmh0iYZQaLGSN4/6F9pYPCz2q1QmNMoUJ47wcm/pGyQQicdB8W91xBmFat7u8MM1FRg7IQTInIfkc8gfI0Omz1QJwWmbdfVs2QGFR2akmqmyDzQ/zMV7jNk6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845419; c=relaxed/simple;
	bh=fWgEQj+r02C6XrfVY1RzYmPj4qIMY/NY9bAmjoct/Mg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hZJNg5EEc66rko/RX9XLN5zKKvvM5RqWMDUy4dgRNflhkC8pQQHQS87pfvPXxdwaAjnPbKb/IVlcUUxaB322utbcssPZw/8gI2b41/s5x1Ch3qs/MXm51XBRHiR4Tb9Zl5OOw14ZyeN8Hb9cR3ZWKdKsdRrhJFAUGtTkjpHf0Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=XT/pYkqm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="XT/pYkqm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso4870584a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749845415; x=1750450215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HdeF68xR6GC/wjGYdz/zqG29CgX3dAqhdfESrVGyzJ8=;
        b=XT/pYkqml9wmPiQzJTVSkfRwDjHyCNhGCvffMUZSpBnbcy+CT8779zWzXU5SnYCG26
         WMeip6KFyglhdZrLloaxF09/qNOW4cTya2xxmb7Nx0JXU62jhpjK+G1sCaL7HQ7EUnPr
         Zv3EkpxAc3sMQoZtFJaLxVVItWW37jDOdKs/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749845415; x=1750450215;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdeF68xR6GC/wjGYdz/zqG29CgX3dAqhdfESrVGyzJ8=;
        b=JKAFrQaikJuIuGxV17qL1GxNz+LfOYNGtQUFue4kMzQ1Me4c+SnTeZFzF7oLr6Qnr/
         IY0VqNLra7//a7K+FCswAv7XqSKojsKG/Lv1vn6XFKwPcqNNcULoioi2hmz3HfocBTiK
         ftbsVs0acJWnxYV45uuuOA6oS2xnr1tYF3uFdxstMS6lMNoRW7+a4ZydTIzlnRvVhyMY
         qCNRdltLsBDa60B9/KMdPUgBpkeillJl0ynMMnhkL9GoPfcf6rD21oERTQKk3jZ/n2dy
         dc18/8HwC5opEW9r8JKFB1dee3CxuDvZa1yKlro6dU9J+HeFTrfcT8sKWAaCXnSl8EA9
         Z6bQ==
X-Gm-Message-State: AOJu0YxY8oRDRdyF7Z67R+p5Xw07o8Jwv7ofxFapzM8220ImeDS+o9n0
	QI88Gn+nGI7pCj8+MnGK63bL1h6TUakadiefVBkAT4LdP6DjfKdIQL9e02SS4QFuKwiuGq/5JoC
	Rp0rEQ+A=
X-Gm-Gg: ASbGncvkYweQqH4Q0xGCYo8mwXz0NvNxzGRJW6x/xNQpqM85cTYHGymfOwuyOzQypls
	y+7SzrMLLK2xNucImIKSn9HJNzsm/vvkmf6EuGtP2sw0g+DByviBbYYSHg51SMn74/pMngq1dLX
	Uz7bDJcIsAmm3vPLR+xy1L0jBvtRDTwKtG7WJMjV/zIcy2C++Srkyr2IJIMapZhaKTlDCj9pq62
	zUYe0sTcOyFp8fNthqZ5a6J+ljRXseyya4wQY8fmGQiyqRZWs4y+LAd30a1tbSsXG42tjH4nbRr
	MKgw3Y9yldWtSSa8uSdfsgPRdAUf9+W8O4mYAvaE+NLEhTVKjveTOzkeKt3zz95RcZTtuV5b7g6
	p
X-Google-Smtp-Source: AGHT+IFEvm0Xpn9ySXG9NpB9ymgE7br5qW9afaQGRT4NGMiC5EQVxt7wMazyNoKPE1tRNxJz70C3bQ==
X-Received: by 2002:a05:6402:27c8:b0:608:66a3:fec with SMTP id 4fb4d7f45d1cf-608d088d800mr452063a12.2.1749845415004;
        Fri, 13 Jun 2025 13:10:15 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48cd687sm1663842a12.18.2025.06.13.13.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 13:10:14 -0700 (PDT)
Message-ID: <3e767aa4-c783-4857-b34e-fdf3f20bd94f@neon.tech>
Date: Fri, 13 Jun 2025 21:10:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/4] x86/mm: Update mapped addresses in
 phys_{pmd,pud}_init()
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

Currently kernel_physical_mapping_init() and its dependents return the
last physical address mapped ('paddr_last'). This makes it harder to
cleanly handle allocation errors in those functions.

'paddr_last' is used to update 'pfn_mapped'/'max_pfn_mapped', so:

1. Introduce add_paddr_range_mapped() to do the update, translating from
   physical addresses to pfns
2. Call add_paddr_range_mapped() in phys_pud_init() where 'paddr_last'
   would otherwise be updated due to 1Gi pages.
   - Note: this includes places where we set 'paddr_last = paddr_next',
     as was added in 20167d3421a0 ("x86-64: Fix accounting in
     kernel_physical_mapping_init()")

add_paddr_range_mapped() is probably too expensive to be called every
time a page is updated, so instead, phys_pte_init() continues to return
'paddr_last', and phys_pmd_init() calls add_paddr_range_mapped() only at
the end of the loop (should mean it's called every 1Gi).

Signed-off-by: Em Sharnoff <sharnoff@neon.tech>
---
Changelog:
- v4: Add this patch
---
 arch/x86/include/asm/pgtable.h |  3 +-
 arch/x86/mm/init.c             | 23 +++++----
 arch/x86/mm/init_32.c          |  6 ++-
 arch/x86/mm/init_64.c          | 88 +++++++++++++++++-----------------
 arch/x86/mm/mm_internal.h      | 13 +++--
 5 files changed, 69 insertions(+), 64 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 7bd6bd6df4a1..138d55f48a4f 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1244,8 +1244,7 @@ extern int direct_gbpages;
 void init_mem_mapping(void);
 void early_alloc_pgt_buf(void);
 void __init poking_init(void);
-unsigned long init_memory_mapping(unsigned long start,
-				  unsigned long end, pgprot_t prot);
+void init_memory_mapping(unsigned long start, unsigned long end, pgprot_t prot);
 
 #ifdef CONFIG_X86_64
 extern pgd_t trampoline_pgd_entry;
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index bfa444a7dbb0..1461873b44f1 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -529,16 +529,24 @@ bool pfn_range_is_mapped(unsigned long start_pfn, unsigned long end_pfn)
 	return false;
 }
 
+/*
+ * Update max_pfn_mapped and range_pfn_mapped with the range of physical
+ * addresses mapped. The range may overlap with previous calls to this function.
+ */
+void add_paddr_range_mapped(unsigned long start_paddr, unsigned long end_paddr)
+{
+	add_pfn_range_mapped(start_paddr >> PAGE_SHIFT, end_paddr >> PAGE_SHIFT);
+}
+
 /*
  * Setup the direct mapping of the physical memory at PAGE_OFFSET.
  * This runs before bootmem is initialized and gets pages directly from
  * the physical memory. To access them they are temporarily mapped.
  */
-unsigned long __ref init_memory_mapping(unsigned long start,
-					unsigned long end, pgprot_t prot)
+void __ref init_memory_mapping(unsigned long start,
+			       unsigned long end, pgprot_t prot)
 {
 	struct map_range mr[NR_RANGE_MR];
-	unsigned long ret = 0;
 	int nr_range, i;
 
 	pr_debug("init_memory_mapping: [mem %#010lx-%#010lx]\n",
@@ -548,13 +556,10 @@ unsigned long __ref init_memory_mapping(unsigned long start,
 	nr_range = split_mem_range(mr, 0, start, end);
 
 	for (i = 0; i < nr_range; i++)
-		ret = kernel_physical_mapping_init(mr[i].start, mr[i].end,
-						   mr[i].page_size_mask,
-						   prot);
+		kernel_physical_mapping_init(mr[i].start, mr[i].end,
+					     mr[i].page_size_mask, prot);
 
-	add_pfn_range_mapped(start >> PAGE_SHIFT, ret >> PAGE_SHIFT);
-
-	return ret >> PAGE_SHIFT;
+	return;
 }
 
 /*
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index ad662cc4605c..4427ac433041 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -245,7 +245,7 @@ static inline int is_x86_32_kernel_text(unsigned long addr)
  * of max_low_pfn pages, by creating page tables starting from address
  * PAGE_OFFSET:
  */
-unsigned long __init
+void __init
 kernel_physical_mapping_init(unsigned long start,
 			     unsigned long end,
 			     unsigned long page_size_mask,
@@ -382,7 +382,9 @@ kernel_physical_mapping_init(unsigned long start,
 		mapping_iter = 2;
 		goto repeat;
 	}
-	return last_map_addr;
+
+	add_paddr_range_mapped(start, last_map_addr);
+	return;
 }
 
 #ifdef CONFIG_HIGHMEM
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 7c4f6f591f2b..e729108bee30 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -502,13 +502,13 @@ phys_pte_init(pte_t *pte_page, unsigned long paddr, unsigned long paddr_end,
 /*
  * Create PMD level page table mapping for physical addresses. The virtual
  * and physical address have to be aligned at this level.
- * It returns the last physical address mapped.
  */
-static unsigned long __meminit
+static void __meminit
 phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 	      unsigned long page_size_mask, pgprot_t prot, bool init)
 {
 	unsigned long pages = 0, paddr_next;
+	unsigned long paddr_first = paddr;
 	unsigned long paddr_last = paddr_end;
 
 	int i = pmd_index(paddr);
@@ -579,21 +579,25 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 		spin_unlock(&init_mm.page_table_lock);
 	}
 	update_page_count(PG_LEVEL_2M, pages);
-	return paddr_last;
+	/*
+	 * In case of recovery from previous state, add_paddr_range_mapped() may
+	 * be called with an overlapping range from previous operations.
+	 * It is idempotent, so this is ok.
+	 */
+	add_paddr_range_mapped(paddr_first, paddr_last);
+	return;
 }
 
 /*
  * Create PUD level page table mapping for physical addresses. The virtual
  * and physical address do not have to be aligned at this level. KASLR can
  * randomize virtual addresses up to this level.
- * It returns the last physical address mapped.
  */
-static unsigned long __meminit
+static void __meminit
 phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 	      unsigned long page_size_mask, pgprot_t _prot, bool init)
 {
 	unsigned long pages = 0, paddr_next;
-	unsigned long paddr_last = paddr_end;
 	unsigned long vaddr = (unsigned long)__va(paddr);
 	int i = pud_index(vaddr);
 
@@ -619,10 +623,8 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 		if (!pud_none(*pud)) {
 			if (!pud_leaf(*pud)) {
 				pmd = pmd_offset(pud, 0);
-				paddr_last = phys_pmd_init(pmd, paddr,
-							   paddr_end,
-							   page_size_mask,
-							   prot, init);
+				phys_pmd_init(pmd, paddr, paddr_end,
+					      page_size_mask, prot, init);
 				continue;
 			}
 			/*
@@ -640,7 +642,7 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 			if (page_size_mask & (1 << PG_LEVEL_1G)) {
 				if (!after_bootmem)
 					pages++;
-				paddr_last = paddr_next;
+				add_paddr_range_mapped(paddr, paddr_next);
 				continue;
 			}
 			prot = pte_pgprot(pte_clrhuge(*(pte_t *)pud));
@@ -653,13 +655,13 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 				     pfn_pud(paddr >> PAGE_SHIFT, prot_sethuge(prot)),
 				     init);
 			spin_unlock(&init_mm.page_table_lock);
-			paddr_last = paddr_next;
+			add_paddr_range_mapped(paddr, paddr_next);
 			continue;
 		}
 
 		pmd = alloc_low_page();
-		paddr_last = phys_pmd_init(pmd, paddr, paddr_end,
-					   page_size_mask, prot, init);
+		phys_pmd_init(pmd, paddr, paddr_end,
+			      page_size_mask, prot, init);
 
 		spin_lock(&init_mm.page_table_lock);
 		pud_populate_init(&init_mm, pud, pmd, init);
@@ -668,22 +670,23 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 
 	update_page_count(PG_LEVEL_1G, pages);
 
-	return paddr_last;
+	return;
 }
 
-static unsigned long __meminit
+static void __meminit
 phys_p4d_init(p4d_t *p4d_page, unsigned long paddr, unsigned long paddr_end,
 	      unsigned long page_size_mask, pgprot_t prot, bool init)
 {
-	unsigned long vaddr, vaddr_end, vaddr_next, paddr_next, paddr_last;
+	unsigned long vaddr, vaddr_end, vaddr_next, paddr_next;
 
-	paddr_last = paddr_end;
 	vaddr = (unsigned long)__va(paddr);
 	vaddr_end = (unsigned long)__va(paddr_end);
 
-	if (!pgtable_l5_enabled())
-		return phys_pud_init((pud_t *) p4d_page, paddr, paddr_end,
-				     page_size_mask, prot, init);
+	if (!pgtable_l5_enabled()) {
+		phys_pud_init((pud_t *) p4d_page, paddr, paddr_end,
+			      page_size_mask, prot, init);
+		return;
+	}
 
 	for (; vaddr < vaddr_end; vaddr = vaddr_next) {
 		p4d_t *p4d = p4d_page + p4d_index(vaddr);
@@ -705,33 +708,32 @@ phys_p4d_init(p4d_t *p4d_page, unsigned long paddr, unsigned long paddr_end,
 
 		if (!p4d_none(*p4d)) {
 			pud = pud_offset(p4d, 0);
-			paddr_last = phys_pud_init(pud, paddr, __pa(vaddr_end),
-					page_size_mask, prot, init);
+			phys_pud_init(pud, paddr, __pa(vaddr_end),
+				      page_size_mask, prot, init);
 			continue;
 		}
 
 		pud = alloc_low_page();
-		paddr_last = phys_pud_init(pud, paddr, __pa(vaddr_end),
-					   page_size_mask, prot, init);
+		phys_pud_init(pud, paddr, __pa(vaddr_end),
+			      page_size_mask, prot, init);
 
 		spin_lock(&init_mm.page_table_lock);
 		p4d_populate_init(&init_mm, p4d, pud, init);
 		spin_unlock(&init_mm.page_table_lock);
 	}
 
-	return paddr_last;
+	return;
 }
 
-static unsigned long __meminit
+static void __meminit
 __kernel_physical_mapping_init(unsigned long paddr_start,
 			       unsigned long paddr_end,
 			       unsigned long page_size_mask,
 			       pgprot_t prot, bool init)
 {
 	bool pgd_changed = false;
-	unsigned long vaddr, vaddr_start, vaddr_end, vaddr_next, paddr_last;
+	unsigned long vaddr, vaddr_start, vaddr_end, vaddr_next;
 
-	paddr_last = paddr_end;
 	vaddr = (unsigned long)__va(paddr_start);
 	vaddr_end = (unsigned long)__va(paddr_end);
 	vaddr_start = vaddr;
@@ -744,16 +746,14 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 
 		if (pgd_val(*pgd)) {
 			p4d = (p4d_t *)pgd_page_vaddr(*pgd);
-			paddr_last = phys_p4d_init(p4d, __pa(vaddr),
-						   __pa(vaddr_end),
-						   page_size_mask,
-						   prot, init);
+			phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
+				      page_size_mask, prot, init);
 			continue;
 		}
 
 		p4d = alloc_low_page();
-		paddr_last = phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
-					   page_size_mask, prot, init);
+		phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
+			      page_size_mask, prot, init);
 
 		spin_lock(&init_mm.page_table_lock);
 		if (pgtable_l5_enabled())
@@ -769,7 +769,7 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 	if (pgd_changed)
 		sync_global_pgds(vaddr_start, vaddr_end - 1);
 
-	return paddr_last;
+	return;
 }
 
 
@@ -777,15 +777,15 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
  * Create page table mapping for the physical memory for specific physical
  * addresses. Note that it can only be used to populate non-present entries.
  * The virtual and physical addresses have to be aligned on PMD level
- * down. It returns the last physical address mapped.
+ * down.
  */
-unsigned long __meminit
+void __meminit
 kernel_physical_mapping_init(unsigned long paddr_start,
 			     unsigned long paddr_end,
 			     unsigned long page_size_mask, pgprot_t prot)
 {
-	return __kernel_physical_mapping_init(paddr_start, paddr_end,
-					      page_size_mask, prot, true);
+	__kernel_physical_mapping_init(paddr_start, paddr_end,
+				       page_size_mask, prot, true);
 }
 
 /*
@@ -794,14 +794,14 @@ kernel_physical_mapping_init(unsigned long paddr_start,
  * when updating the mapping. The caller is responsible to flush the TLBs after
  * the function returns.
  */
-unsigned long __meminit
+void __meminit
 kernel_physical_mapping_change(unsigned long paddr_start,
 			       unsigned long paddr_end,
 			       unsigned long page_size_mask)
 {
-	return __kernel_physical_mapping_init(paddr_start, paddr_end,
-					      page_size_mask, PAGE_KERNEL,
-					      false);
+	__kernel_physical_mapping_init(paddr_start, paddr_end,
+				       page_size_mask, PAGE_KERNEL,
+				       false);
 }
 
 #ifndef CONFIG_NUMA
diff --git a/arch/x86/mm/mm_internal.h b/arch/x86/mm/mm_internal.h
index 3f37b5c80bb3..6fea5f7edd48 100644
--- a/arch/x86/mm/mm_internal.h
+++ b/arch/x86/mm/mm_internal.h
@@ -10,13 +10,12 @@ static inline void *alloc_low_page(void)
 
 void early_ioremap_page_table_range_init(void);
 
-unsigned long kernel_physical_mapping_init(unsigned long start,
-					     unsigned long end,
-					     unsigned long page_size_mask,
-					     pgprot_t prot);
-unsigned long kernel_physical_mapping_change(unsigned long start,
-					     unsigned long end,
-					     unsigned long page_size_mask);
+void add_paddr_range_mapped(unsigned long start_paddr, unsigned long end_paddr);
+
+void kernel_physical_mapping_init(unsigned long start, unsigned long end,
+								  unsigned long page_size_mask, pgprot_t prot);
+void kernel_physical_mapping_change(unsigned long start, unsigned long end,
+								    unsigned long page_size_mask);
 void zone_sizes_init(void);
 
 extern int after_bootmem;
-- 
2.39.5

