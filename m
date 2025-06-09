Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD2513AA2D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465194; cv=none; b=ByjG5ICgWW16sVcMbUO/xY2dN0cwzINYZZqMyDa2ZbRLPjog12PlRhyuZh5eRaWf6xFctga9WjO5BETBCFNH1iKqlK+MEiABtx1Sx+QDRNgeFYDuFmTbztHFXRJdADT7s9w0xx+s4KxRpunObtQT0NKN8H29Zti4kyz8jj7FUro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465194; c=relaxed/simple;
	bh=qBujbE2y/POmeUk3vRMrgUh8DnZCZJD0U1uv+d+CF5U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZHzGPXO4gut6i39yr8iiwcjn3Nrg6FTg6Sc1nd/c1a9sQgnZnjgxAN0LNJs8/p392KKInZYK678RrNE/okt6StKPRSAvqmVLoSREMYjdwF16s3nvDcL86YmDkq4g/M9eEGkIRwBa2k7rXdFwntaoQlXVVhdzx1IxfjFGmjadayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=YTzO7o0I; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="YTzO7o0I"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade30256175so485568666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749465190; x=1750069990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lBu8kuZvvCSzpdGghFUoBWtGE52FjZ5YKPo2P5tgTyg=;
        b=YTzO7o0ICQO8E6bLGl4MUnIcjI1TMWcv0wFl6C0WpeDZKfEzNOAkltP4UlFBEBzQL7
         ZcLUTBqNX17Pvks3XH3sbfa3dMIAVlsVI03kRksWSEPZ0mn9r4JUr+jzhDaAM/v0eDeS
         X7hvCiuJ89uxw88iQ36JYXwAYchgBbc+GbGgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749465190; x=1750069990;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lBu8kuZvvCSzpdGghFUoBWtGE52FjZ5YKPo2P5tgTyg=;
        b=Q/EFkwo5r9nuxUsoCKVkx/JP1XXr7r+RM4w4l3fR7YcP/mDnCguBrY5RTiQ2vkdYKQ
         u9uCRxiPdeU4Bz6Pm5dY4MIAe6o18WaZMBv/V5GyoqMTfRogG4xFPqPiaCpAWA0FWfOh
         1pp/aA670MVn/xDyyYiv+BHoXbN6wP3k+jr3N/jG9PHKUa9dIfni6ftcXysOTdKSwy1q
         sRoUeL6Qz/csgMplWImufUETED1bE4/8ljTJx3mC5lBE6OyIzntnXjSKHPCnBWlnSi3p
         qR5W2EVtB9ftLCMwht/SPvjcPmwKg+wDAn3Z7MuQttdGXOgUnK/ZlnqE4GrdcKrrboBm
         xPxg==
X-Gm-Message-State: AOJu0YwPUM6QsQ6i56fhHcCvnzXVMDJa3tyUNfixPSV/HXJTXCbHR8Uz
	efktoZgh4o0A5CVjW+YNIAcN8gjJuiZd+fRh+nCgv7N3w5x38YG0bKf5P1BHgPJtYBXNjsp54P1
	Lu4EhwxyMrw==
X-Gm-Gg: ASbGncszFZU/4rgNBGp3MKqMZFgfEBO6v7uRZTIgKrx9uwRSgCCBwIvux8ut+l9nlYJ
	ak8X2h6BfXuLGQr2vaHbITTQkJ3UBZnwHTLrJsFfa3ojJGAOj+YjDD8AC5DTWoDPDQvqDX9xYTO
	xdc8ua+FDBJAShFVX1xW8RfzbqFp6Rm6poKVeSghHIxCxD2OWGUqLoRverdu1i6rvB4odCYK3ZE
	DmYSCIdffssWx+hi/vj3ZP9wshD9k9Jns54NcGz2uMCBvi4bZ7gOb5Wy7udZYXcTpyBfUEPBGZC
	ms8CcXtxNKo6Krj8L0+keVjNi6o3s1SHdDEUcj/hWurWV7gfeTo+JwEzh+QW5dY6ig==
X-Google-Smtp-Source: AGHT+IET/MjJOpwtKEOcmp2sX2qbmXuXjYHPY1IfD9t0XmO2IC+RQuqVgbzY4NxJxG9gfxQmtKq9eQ==
X-Received: by 2002:a17:907:d1a:b0:ade:44da:d2cc with SMTP id a640c23a62f3a-ade44db0121mr741710966b.31.1749465189726;
        Mon, 09 Jun 2025 03:33:09 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c44dsm535714766b.104.2025.06.09.03.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 03:33:09 -0700 (PDT)
Message-ID: <25c5e747-107f-4450-8eb0-11b2f0dab14d@neon.tech>
Date: Mon, 9 Jun 2025 11:33:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] x86/mm: Handle alloc failure in phys_*_init()
From: Em Sharnoff <sharnoff@neon.tech>
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org
Cc: Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <0ce5e150-19e0-457f-bec3-ee031c0be7e7@neon.tech>
Content-Language: en-US
In-Reply-To: <0ce5e150-19e0-457f-bec3-ee031c0be7e7@neon.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

During memory hotplug, allocation failures in phys_*_init() aren't
handled, which results in a null pointer dereference, if they occur.

To handle that, change phys_pud_init() and similar functions to return
allocation errors via ERR_PTR() and check for that in arch_add_memory().

Signed-off-by: Em Sharnoff <sharnoff@neon.tech>
---
Changelog:
- v2: switch from special-casing zero value to using ERR_PTR()
---
 arch/x86/mm/init.c    |  6 ++++-
 arch/x86/mm/init_64.c | 54 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index bfa444a7dbb0..82dd5ce03dd6 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -533,6 +533,7 @@ bool pfn_range_is_mapped(unsigned long start_pfn, unsigned long end_pfn)
  * Setup the direct mapping of the physical memory at PAGE_OFFSET.
  * This runs before bootmem is initialized and gets pages directly from
  * the physical memory. To access them they are temporarily mapped.
+ * Allocation errors are returned with ERR_PTR.
  */
 unsigned long __ref init_memory_mapping(unsigned long start,
 					unsigned long end, pgprot_t prot)
@@ -547,10 +548,13 @@ unsigned long __ref init_memory_mapping(unsigned long start,
 	memset(mr, 0, sizeof(mr));
 	nr_range = split_mem_range(mr, 0, start, end);
 
-	for (i = 0; i < nr_range; i++)
+	for (i = 0; i < nr_range; i++) {
 		ret = kernel_physical_mapping_init(mr[i].start, mr[i].end,
 						   mr[i].page_size_mask,
 						   prot);
+		if (IS_ERR(ret))
+			return ret;
+	}
 
 	add_pfn_range_mapped(start >> PAGE_SHIFT, ret >> PAGE_SHIFT);
 
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 7c4f6f591f2b..3ab261aa8eff 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -502,7 +502,8 @@ phys_pte_init(pte_t *pte_page, unsigned long paddr, unsigned long paddr_end,
 /*
  * Create PMD level page table mapping for physical addresses. The virtual
  * and physical address have to be aligned at this level.
- * It returns the last physical address mapped.
+ * It returns the last physical address mapped. Allocation errors are
+ * returned with ERR_PTR.
  */
 static unsigned long __meminit
 phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
@@ -572,7 +573,14 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 		}
 
 		pte = alloc_low_page();
+		if (!pte)
+			return (unsigned long)ERR_PTR(-ENOMEM);
 		paddr_last = phys_pte_init(pte, paddr, paddr_end, new_prot, init);
+		/*
+		 * phys_{ppmd,pud,p4d}_init return allocation errors via ERR_PTR.
+		 * phys_pte_init makes no allocations, so should not error.
+		 */
+		BUG_ON(IS_ERR(paddr_last));
 
 		spin_lock(&init_mm.page_table_lock);
 		pmd_populate_kernel_init(&init_mm, pmd, pte, init);
@@ -586,7 +594,8 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
  * Create PUD level page table mapping for physical addresses. The virtual
  * and physical address do not have to be aligned at this level. KASLR can
  * randomize virtual addresses up to this level.
- * It returns the last physical address mapped.
+ * It returns the last physical address mapped. Allocation errors are
+ * returned with ERR_PTR.
  */
 static unsigned long __meminit
 phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
@@ -623,6 +632,8 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 							   paddr_end,
 							   page_size_mask,
 							   prot, init);
+				if (IS_ERR(paddr_last))
+					return paddr_last;
 				continue;
 			}
 			/*
@@ -658,12 +669,22 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 		}
 
 		pmd = alloc_low_page();
+		if (!pmd)
+			return (unsigned long)ERR_PTR(-ENOMEM);
 		paddr_last = phys_pmd_init(pmd, paddr, paddr_end,
 					   page_size_mask, prot, init);
 
+		/*
+		 * We might have IS_ERR(paddr_last) if allocation failed, but we should
+		 * still update pud before bailing, so that subsequent retries can pick
+		 * up on progress (here and in phys_pmd_init) without leaking pmd.
+		 */
 		spin_lock(&init_mm.page_table_lock);
 		pud_populate_init(&init_mm, pud, pmd, init);
 		spin_unlock(&init_mm.page_table_lock);
+
+		if (IS_ERR(paddr_last))
+			return paddr_last;
 	}
 
 	update_page_count(PG_LEVEL_1G, pages);
@@ -707,16 +728,26 @@ phys_p4d_init(p4d_t *p4d_page, unsigned long paddr, unsigned long paddr_end,
 			pud = pud_offset(p4d, 0);
 			paddr_last = phys_pud_init(pud, paddr, __pa(vaddr_end),
 					page_size_mask, prot, init);
+			if (IS_ERR(paddr_last))
+				return paddr_last;
 			continue;
 		}
 
 		pud = alloc_low_page();
+		if (!pud)
+			return (unsigned long)ERR_PTR(-ENOMEM);
 		paddr_last = phys_pud_init(pud, paddr, __pa(vaddr_end),
 					   page_size_mask, prot, init);
 
 		spin_lock(&init_mm.page_table_lock);
 		p4d_populate_init(&init_mm, p4d, pud, init);
 		spin_unlock(&init_mm.page_table_lock);
+
+		/*
+		 * Bail only after updating p4d to keep progress from pud across retries.
+		 */
+		if (IS_ERR(paddr_last))
+			return paddr_last;
 	}
 
 	return paddr_last;
@@ -748,10 +779,14 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 						   __pa(vaddr_end),
 						   page_size_mask,
 						   prot, init);
+			if (IS_ERR(paddr_last))
+				return paddr_last;
 			continue;
 		}
 
 		p4d = alloc_low_page();
+		if (!p4d)
+			return (unsigned long)ERR_PTR(-ENOMEM);
 		paddr_last = phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
 					   page_size_mask, prot, init);
 
@@ -763,6 +798,13 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 					  (pud_t *) p4d, init);
 
 		spin_unlock(&init_mm.page_table_lock);
+
+		/*
+		 * Bail only after updating pgd/p4d to keep progress from p4d across retries.
+		 */
+		if (IS_ERR(paddr_last))
+			return paddr_last;
+
 		pgd_changed = true;
 	}
 
@@ -777,7 +819,8 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
  * Create page table mapping for the physical memory for specific physical
  * addresses. Note that it can only be used to populate non-present entries.
  * The virtual and physical addresses have to be aligned on PMD level
- * down. It returns the last physical address mapped.
+ * down. It returns the last physical address mapped. Allocation errors are
+ * returned with ERR_PTR.
  */
 unsigned long __meminit
 kernel_physical_mapping_init(unsigned long paddr_start,
@@ -980,8 +1023,11 @@ int arch_add_memory(int nid, u64 start, u64 size,
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
+	unsigned long ret = 0;
 
-	init_memory_mapping(start, start + size, params->pgprot);
+	ret = init_memory_mapping(start, start + size, params->pgprot);
+	if (IS_ERR(ret))
+		return (int)PTR_ERR(ret);
 
 	return add_pages(nid, start_pfn, nr_pages, params);
 }
-- 
2.39.5

