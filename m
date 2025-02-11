Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CDB1F191B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266998; cv=none; b=FppR6OI/Pqi35xbqr3Es8zjZ/+xYOTHYqeBFg7baDRVOKQConJdrX6FPHeon/nUDzexrVT5idcORjFJaOWa1nqLSfEkWYBiXho0kfnqA9+L4P8lToceSarLWnPN0L8fqiZsvKyXCAmzntA3zUrHLQUiXw+pI1RXERB6oVlp81W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266998; c=relaxed/simple;
	bh=+xcKKENAQPRW/KrRt7+N0bNlvJs+HGH5eeB5JwLpBI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcztFrI3k8Rcj8I5Wmly7fCc8ue7Y1/x59YgOCSLNamFeLjUEQGo6nL249KvIOMBu1Ul8QsB+Q5u3yi1j3B8ctBM+bRfuX9g4++3jOj/I+TRLdops6HPzRgDUfl94gG4jI1sXyIi/Gke66IeiXYINUbHfpDt0N7VJYckQ48IY4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FyUMf+Kq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FyUMf+Kq"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f40deb941so112289895ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739266995; x=1739871795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vr9sqfyFIOUURX1EuDQ0UB7aKZBVOm3DmIxM7ELCYpI=;
        b=FyUMf+KquRocFvLWPcVxJ87UqE2N7d9kGo6n5JIZCPNDgnWpAtWYRzkvlN8R5j0sOT
         v1K+HPr1RIB8JGDdhO1pnjcSvhnQq0BO3Q4NvrXRppKJqGPuBmIjevm2GeUVmB8QEtgg
         U01OnaNuYc/GSBRRpCFvmyiwv231XtsqsRTQpJSIXrJ93aqECyxhUrbdLAcwVq7FJueI
         T0ePhCL3WOzMkmCW8d6fldwrWkbMoYt9XpQpswzjvTJe+RLDhF9xOsErMdOoQsJ2fhoy
         J3znILHUm+x/4Ro9u0wqWA7sn+KhItRp3/dwi/ErEW1dGnVhxWYsK8dxwRthOovV/Eyf
         kOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266995; x=1739871795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vr9sqfyFIOUURX1EuDQ0UB7aKZBVOm3DmIxM7ELCYpI=;
        b=LcfTdRLvwR3iU5csTI8ENW2wo3m/Bas6txMYLLiqXWVJygUqth1haYEwSXgheE+jsv
         UcCdCZlYqMVcyl5czC49C1+qD3IQUaNFglU/HmF4iIcfEWjcc3wCUv2vGK3Aaz6/uO3f
         6ed/+tmXgXuCM93Y5YysKIN4ZE8tSr3JPEsLJzep6Xg6ssJ5bacwk/VytYUeqv6CyGJA
         obC2cIjrL/mjJFz+IB6JI0ESoT9TaLRLk7h5sPtitddkAT8u+fdTVhMmhmz+qyAry8/T
         yVebRgYTKphnm9xWUvXW5xiGZySFBwXNgs2/q+6oUqSmDF+NF0iP3mOSU/yPY9qjw/q8
         0MZA==
X-Forwarded-Encrypted: i=1; AJvYcCU9UlG0J6ahWWOm6NBGnquF1DfMVO4RKAG+h0q3/asUtMKLVqVE782KMcjw6tgH/s7chRoaiORlQZjM7jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSGJlx4wq4yaH3DJUNKvWygxawGt87/5OTouSBWybGe/nr+tl
	wDjVbqYDxnbcwPM83QLw7kR5aPK8xoPOXSTH5NltGx7OX9Awh0TEMY0E1FlHOCI=
X-Gm-Gg: ASbGncvJ9JaEntln3s4jyTmtiXdsxMohsRLz6O4t3FJ8UHe6jCzFKYiiNPXVeWD4hOs
	docIym38OZC4CiWRorKXCXz3VphG/LP/vvUSbBc4xRBMQ/GXbOk9VWuDMxiS0PWWJn4SkHb3ca8
	OqYPhc0X0f6YxCVzeVeW9tPR9zan73gXPPl9ZT8yIUl+In/ynT2paiRp28w51t6Dh7jTdwBcnEu
	SVRkh5JiUyt5nx2obcJImy58cztuB3YQ64znmKkMrlGXyHYHONOqcPOVGTqeVGUuYuHRkYOiPL7
	rxX8CdxFVqXSmEQBzWt7aFF625syNyKll9Q7/w+dvg==
X-Google-Smtp-Source: AGHT+IFfrAytYWDrtqmvvt0vj9r6BCWYzM3f2Zy62k1Yw1acXBgtzij9wDi4ObcP0N5l9sE5XD+k0A==
X-Received: by 2002:a17:903:22ce:b0:21f:805c:fd98 with SMTP id d9443c01a7336-21f805cfe1fmr153489455ad.21.1739266995450;
        Tue, 11 Feb 2025 01:43:15 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36561397sm92761155ad.89.2025.02.11.01.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:43:15 -0800 (PST)
Message-ID: <4e298f68-36ff-496a-81d2-7124f792180d@bytedance.com>
Date: Tue, 11 Feb 2025 17:43:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Ezra Buehler <ezra@easyb.ch>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Vlastimil Babka <vbabka@suse.cz>,
 Ryan Roberts <ryan.roberts@arm.com>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 open list <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
 <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
 <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
 <34bcf011-b4ac-479c-92ce-852623e73039@redhat.com>
 <3f7babee-b232-4e6b-a896-947150dcd1ef@bytedance.com>
 <2b0bb476-5bd6-489a-9b9e-7aa20964abfa@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <2b0bb476-5bd6-489a-9b9e-7aa20964abfa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/2/11 17:37, David Hildenbrand wrote:
> On 11.02.25 10:29, Qi Zheng wrote:
>>
>>
>> On 2025/2/11 17:14, David Hildenbrand wrote:
>>> On 11.02.25 04:45, Qi Zheng wrote:
>>>> Hi Russell,
>>>>
>>>> On 2025/2/11 01:03, Russell King (Oracle) wrote:
>>>>> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>>>>>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>>>>>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
>>>>>> dereference resulting in a kernel panic. The culprit seems to be 
>>>>>> commit
>>>>>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>>>>>> Reverting the commit apparently fixes the issue.
>>>>>
>>>>> The blamed commit is buggy:
>>>>>
>>>>> arch/arm/include/asm/tlbflush.h:
>>>>> #define update_mmu_cache(vma, addr, ptep) \
>>>>>            update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>>>>>
>>>>> So vmf can be NULL. This didn't used to matter before this commit,
>>>>> because vmf was not used by ARM's update_mmu_cache_range(). However,
>>>>> the commit introduced a dereference of it, which now causes a NULL
>>>>> point dereference.
>>>>>
>>>>> Not sure what the correct solution is, but at a guess, both:
>>>>>
>>>>>      if (ptl != vmf->ptl)
>>>>>
>>>>> need to become:
>>>>>
>>>>>      if (!vmf || ptl != vmf->ptl)
>>>>
>>>> No, we can't do that, because without using split PTE locks, we would
>>>> use shared mm->page_table_lock, which would create a deadlock.
>>>
>>> Maybe we can simply special-case on CONFIG_SPLIT_PTE_PTLOCKS ?
>>>
>>> if (IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS)) {
>>
>> In this case, if two vmas map the same PTE page, then the same PTE lock
>> will be held repeatedly. Right?
> 
> Hmm, the comment says:
> 
>          /*
>           * This is called while another page table is mapped, so we
>           * must use the nested version.  This also means we need to
>           * open-code the spin-locking.
>           */
> 
> "another page table" implies that it cannot be the same. But maybe that 
> comment was also wrong?

I don't see make_coherent() ensuring this when traversing vma. I
therefore propose the following changes:

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 2bec87c3327d2..dddbca9a2597e 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -61,8 +61,41 @@ static int do_adjust_pte(struct vm_area_struct *vma, 
unsigned long address,
         return ret;
  }

+#if defined(CONFIG_SPLIT_PTE_PTLOCKS)
+/*
+ * If we are using split PTE locks, then we need to take the pte
+ * lock here.  Otherwise we are using shared mm->page_table_lock
+ * which is already locked, thus cannot take it.
+ */
+static inline bool do_pte_lock(spinlock_t *ptl, pmd_t pmdval, pmd_t *pmd)
+{
+       /*
+        * Use nested version here to indicate that we are already
+        * holding one similar spinlock.
+        */
+       spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
+       if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
+               spin_unlock(ptl);
+               return false;
+       }
+
+       return true;
+}
+
+static inline void do_pte_unlock(spinlock_t *ptl)
+{
+       spin_unlock(ptl);
+}
+#else /* !defined(CONFIG_SPLIT_PTE_PTLOCKS) */
+static inline bool do_pte_lock(spinlock_t *ptl)
+{
+       return true;
+}
+static inline void do_pte_unlock(spinlock_t *ptl) {}
+#endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
+
  static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
-                     unsigned long pfn, struct vm_fault *vmf)
+                     unsigned long pfn)
  {
         spinlock_t *ptl;
         pgd_t *pgd;
@@ -99,23 +132,14 @@ static int adjust_pte(struct vm_area_struct *vma, 
unsigned long address,
         if (!pte)
                 return 0;

-       /*
-        * If we are using split PTE locks, then we need to take the page
-        * lock here.  Otherwise we are using shared mm->page_table_lock
-        * which is already locked, thus cannot take it.
-        */
-       if (ptl != vmf->ptl) {
-               spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
-               if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
-                       pte_unmap_unlock(pte, ptl);
-                       goto again;
-               }
+       if (!do_pte_lock(ptl, pmdval, pmd)) {
+               pte_unmap(pte);
+               goto again;
         }

         ret = do_adjust_pte(vma, address, pfn, pte);

-       if (ptl != vmf->ptl)
-               spin_unlock(ptl);
+       do_pte_unlock(ptl);
         pte_unmap(pte);

         return ret;
@@ -123,16 +147,17 @@ static int adjust_pte(struct vm_area_struct *vma, 
unsigned long address,

  static void
  make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
-             unsigned long addr, pte_t *ptep, unsigned long pfn,
-             struct vm_fault *vmf)
+             unsigned long addr, pte_t *ptep, unsigned long pfn)
  {
         struct mm_struct *mm = vma->vm_mm;
         struct vm_area_struct *mpnt;
         unsigned long offset;
+       unsigned long start;
         pgoff_t pgoff;
         int aliases = 0;

         pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+       start = ALIGN_DOWN(addr, PMD_SIZE);

         /*
          * If we have any shared mappings that are in the same mm
@@ -141,6 +166,8 @@ make_coherent(struct address_space *mapping, struct 
vm_area_struct *vma,
          */
         flush_dcache_mmap_lock(mapping);
         vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
+               unsigned long mpnt_addr;
+
                 /*
                  * If this VMA is not in our MM, we can ignore it.
                  * Note that we intentionally mask out the VMA
@@ -151,7 +178,14 @@ make_coherent(struct address_space *mapping, struct 
vm_area_struct *vma,
                 if (!(mpnt->vm_flags & VM_MAYSHARE))
                         continue;
                 offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
-               aliases += adjust_pte(mpnt, mpnt->vm_start + offset, 
pfn, vmf);
+               mpnt_addr = mpnt->vm_start + offset;
+               /*
+                * If mpnt_addr and addr are mapped to the same PTE page,
+                * also skip this vma.
+                */
+               if (mpnt_addr >= start && mpnt_addr - start < PMD_SIZE)
+                       continue;
+               aliases += adjust_pte(mpnt, mpnt_addr, pfn);
         }
         flush_dcache_mmap_unlock(mapping);
         if (aliases)
@@ -194,7 +228,7 @@ void update_mmu_cache_range(struct vm_fault *vmf, 
struct vm_area_struct *vma,
                 __flush_dcache_folio(mapping, folio);
         if (mapping) {
                 if (cache_is_vivt())
-                       make_coherent(mapping, vma, addr, ptep, pfn, vmf);
+                       make_coherent(mapping, vma, addr, ptep, pfn);
                 else if (vma->vm_flags & VM_EXEC)
                         __flush_icache_all();
         }

Make sense?

> 
> 
