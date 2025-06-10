Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E15E433A8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550602; cv=none; b=o7ZRIRQgITVzmuBL8juxIDZ+FNjUVjTiPOK7rBLxPSN7FCqhuCxDcZJO7Km1+L3/27HlWZghxdiVEubgaUrJ+OiYa/cZ1NXgOmMicw5hzR4/WoIUnAcbP1NAIIws7anfGdFqYYCfpFwzfZRzTBx1XsMbZuz/XKGAFA5G0wt7rTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550602; c=relaxed/simple;
	bh=BaIBR0cHoYf/WnAzfEDbBA+VcLZI5bdLmPzqEV1cGZw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=haacIE3/02p8fV1nEmYESmm+F7jhLx6wQm1RRb3PQ+AP+J8NKFpq7ZKTL9TBL9/SuG9WVFzKn9be2vPNfMMZD1vOZAmckiIt3Wvkfi2uCwFliUtTEcZuVbvVM9YUCqdr4EUcYNWKyOKc1EzBshXvU0QZQocz/Bno7jDWvftFjkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=ld+BZd2T; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="ld+BZd2T"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so4152190a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749550598; x=1750155398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5TLMZnOwp1EufsUc3IBlAEgAbVTmb9HuOUhD3AV1YmY=;
        b=ld+BZd2T51FqeV+gpsev4xK93ZlmoRYkIzbIciMxfQPZ1TAlxvwCtsq10wSdHjT91O
         TLbRC22V524AOHz27m0kiscQcTxfkYHctVuFv+IGeNiiMFiMZTFFO2VKh1Qgwab28Ik2
         SCR1XijEL4FP/Jf7H7yUyle6D4jJhNSvVoNNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550598; x=1750155398;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TLMZnOwp1EufsUc3IBlAEgAbVTmb9HuOUhD3AV1YmY=;
        b=FX7EBZlfaDa9TnLW6cNJo5PkrCuh/uDelPIouIq0HqdmHlFwsdKMrW8lcZ4as/A9Bp
         NBnlmEIA4FP8W+Wm3LW3Fq9HpMAzN2xgB+txcjvEyxodN1DVLVeCbBoapS7V+66DRSGe
         c8hsfSS7mLXa1cnETaczNge16ICqybHuGHXl0i2CD5BhiQcRzAJmuIkf10pbSX4yKZ7A
         M+8ueYP/um15eBPaY9SU+t4pGRgD4LdAhzdON1XMV8nuwQU7G60v2ScWyigFzv/KyY38
         W9Ip4OBtIfWtvN3Jz5RjlTkTB20xRQ3faPe6KRfO6vSXj+sZsDMDqeQdmt5ozqdhxjkL
         RE5w==
X-Gm-Message-State: AOJu0YyXseg03voM+BMikHr1vomTSiRjjXSaPS6OT7qpLDma0806Np1N
	RbWrgG0DXWVRNyPU72W4FXylJgtaReGYwPrpJgHFZT6Hb2ZUbCqPpn9mNYvJplIcqCCVjeGYjGK
	3rwzyqz+fxA==
X-Gm-Gg: ASbGncuBO/piL+eWFqqidPw61IBF29neaCITmeuIxsS86GVwHAnoKOyh6G+c5ykbUiN
	D7o7nw+43yC2gxStC2c/wj/4Y7mYAMyEHRlUA8f3kj6tPnEA52YsJBaDK4bkmC9KNXtGaU9t2dG
	ON8XHfXQfIME76I4lyFp003X+MVfmXKP7p9iXBJNO2b8iN3Z4DSCG+QWN8WjkxuaEQ3Delhvai/
	uwGJra6LU4PuhWAw6bsqxjglPQDuHvrqtZbdDOdOHSnWJNI+jcWXwLU23i950SV6F9jmZWgqKpQ
	DvOoF9cheYQeKMSoSgXj9szSxRaqJi490WPUnR4N7Av0MVi+68TGS422ZQA47UjKaQ==
X-Google-Smtp-Source: AGHT+IF3bXRwUOcNB/7Vgzzi7Oqw7d/+z7EkLbZ6h+MIcJik3RGx8NeiSc67WUrU/PAz4OZ9sYhWNw==
X-Received: by 2002:a17:907:3e1e:b0:ade:4300:6c8f with SMTP id a640c23a62f3a-ade4300eb40mr1194776866b.57.1749550598026;
        Tue, 10 Jun 2025 03:16:38 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc386f7sm686134066b.114.2025.06.10.03.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:16:37 -0700 (PDT)
Message-ID: <a404d023-e0bb-4dc8-8952-accba299ab50@neon.tech>
Date: Tue, 10 Jun 2025 11:16:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/2] x86/mm: Handle alloc failure in phys_*_init()
From: Em Sharnoff <sharnoff@neon.tech>
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org
Cc: Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech>
Content-Language: en-US
In-Reply-To: <a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech>
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
- v3: Fix -Wint-conversion errors
---
 arch/x86/mm/init.c    |  6 ++++-
 arch/x86/mm/init_64.c | 54 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index bfa444a7dbb0..a2665b6fe376 100644
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
+		if (IS_ERR((void *)ret))
+			return ret;
+	}
 
 	add_pfn_range_mapped(start >> PAGE_SHIFT, ret >> PAGE_SHIFT);
 
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 7c4f6f591f2b..712006afcd6c 100644
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
+		BUG_ON(IS_ERR((void *)paddr_last));
 
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
+				if (IS_ERR((void *)paddr_last))
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
+		if (IS_ERR((void *)paddr_last))
+			return paddr_last;
 	}
 
 	update_page_count(PG_LEVEL_1G, pages);
@@ -707,16 +728,26 @@ phys_p4d_init(p4d_t *p4d_page, unsigned long paddr, unsigned long paddr_end,
 			pud = pud_offset(p4d, 0);
 			paddr_last = phys_pud_init(pud, paddr, __pa(vaddr_end),
 					page_size_mask, prot, init);
+			if (IS_ERR((void *)paddr_last))
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
+		if (IS_ERR((void *)paddr_last))
+			return paddr_last;
 	}
 
 	return paddr_last;
@@ -748,10 +779,14 @@ __kernel_physical_mapping_init(unsigned long paddr_start,
 						   __pa(vaddr_end),
 						   page_size_mask,
 						   prot, init);
+			if (IS_ERR((void *)paddr_last))
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
+		if (IS_ERR((void *)paddr_last))
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
+	if (IS_ERR((void *)ret))
+		return (int)PTR_ERR((void *)ret);
 
 	return add_pages(nid, start_pfn, nr_pages, params);
 }
-- 
2.39.5

