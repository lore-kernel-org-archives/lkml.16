Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FF01FBCA1
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275787; cv=none; b=YFXoexOw97b33RUPMm0eufKcuNVoRqh/xrx22d9KrbJT5PR/cNKIyK0HcgG3aZXLM+3VqfGM2FChovjZOd1cWReFQjbv+mV0MpvBvouf4LmXRIWFEyjYH2kcCJDHjnnBV2esA6dUmdB+q0QnVIkg1YqfFvSbTStpYrWsYTWrCiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275787; c=relaxed/simple;
	bh=/i88/mVNwKq3npsr2nwuHapkFawzVtUMvvt6w+YxjsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR2JGhdex4vtcZBPMfvnX/Kw97gTEsFdO52Xjfbgsa5RY4t9YDUtNnLM2d9PK/jIbBMpM7WLGW8qA5QRQakMcIveK/4nXYc6QVy5OOk0eAD/91UM/A8+MGClMdI2xVxv9UButDIVTsYm34TBWzYO/5R1jkfco7K8cACJgoOvFVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DcZLh0wv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DcZLh0wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739275784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fO1oxPNk7yrmBODE7BKXBMDy5XzyubAISy1V0U5LvF4=;
	b=DcZLh0wvSQaZBhNVx8tvgidrtubtk97I/kK3wuaFYnewbVhJJKxHTi5XLA8UbXLQTVWkLW
	iTSBQ0orQuIv+Wks6czPW7K7cniHm6DqbhtqknQAJS54Q9ocHArYYZrFQwoJR93ON0o0WR
	ymbYikALYX0eRojyp3kQP3GhRENbN8c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-MWQa8-CVPsKO1ZGjXPXLVg-1; Tue, 11 Feb 2025 07:09:42 -0500
X-MC-Unique: MWQa8-CVPsKO1ZGjXPXLVg-1
X-Mimecast-MFC-AGG-ID: MWQa8-CVPsKO1ZGjXPXLVg
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab78bcb4b09so447037866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275781; x=1739880581;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fO1oxPNk7yrmBODE7BKXBMDy5XzyubAISy1V0U5LvF4=;
        b=IVcrwowsSvCfYNt9IVnLIuU5qOCk0OESdSuzZsslTEW1QrSd9rtoXtAwjGKLkzTSjX
         Ng23wriIz9eBviIG16MS3LehePh5cXnt2jr/umWDVFPQNx10t/s/IahdrtdAyaG6HN31
         UM8+N5QFiEl2AQqlBposbWlnTQkCB1GMGLz566rOR2GZmf4eJRtdW6E07Y+TaWHSf8Bz
         bxxJbCmdI9tFN+kF+qwrplxPTS602wCpK8/1uSfU/4jS74yZc6IJVwEYSmEkrZLjBXAm
         JlrTyHyd5P+oBwdt0TRpYfyIcZw7cB/cG6iDeepFs83lOLvEPIwU+TbX8i3CT/dW5M6x
         /C3A==
X-Forwarded-Encrypted: i=1; AJvYcCVsZGUE1ZRnwrSSQc/KtXasX9POO9nhNW9T12k9c9c7y/nKfM//bK50d9S261bef0PkZfmRsuJ8cJPzB/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY/YiXGdglzel0PW2fAuV9MQwxiuxZOo7CR8058kFzKSIHhphC
	SRBstZ+t8k1Fk+gRseJ/RJfhnOroJU7KWI6N4/AS/Ks5nX59JwxfqnSkBdE59MWYGFVJPZD5v0P
	7BiqJGS3qAD08o5/OVo4ym3m0LAefQB2/DmejqnYdg9xPIx0tq9qEgiGhfc0kWw==
X-Gm-Gg: ASbGncsmaUNX8VRHlitLQsQnQgq0h+Tigqht9yrRbGRskAz1Vf5cBqb13V4z2WxQE6k
	gCzqeyVSG3541/BdB55Yxjjcikm6IqpN5bfO6gziHTxug+rsOZqERLzsnOjFu1Mjaa+QFc/7LPs
	7CFEqhuwmZvlR9waTaevJ84wBiG0e4JAAiQNqrxjnxFl8KUR0UmUliHymJPnUXQkGKe0ZE2i/BF
	Tcz+1D+BGX/dRVzUkcYss1CZXI7ZnvHYh8HwLY7BL8/0u8Adn7wrFRVkhAIk6Yu+gOxP4/IqRUd
	wSVrLvux5MM11+4Qsv2PChH8krzdXtLWh58QThQ=
X-Received: by 2002:a17:907:d507:b0:ab6:d4d0:2be9 with SMTP id a640c23a62f3a-ab7da5023bdmr283992566b.56.1739275781299;
        Tue, 11 Feb 2025 04:09:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEbs1MtVLltwibnkrnNTH+nFWZ/gMfsDyXy+1D6atnoYLXZpQt7n8m1lv8z51hnGexGBacQw==
X-Received: by 2002:a17:907:d507:b0:ab6:d4d0:2be9 with SMTP id a640c23a62f3a-ab7da5023bdmr283987366b.56.1739275780642;
        Tue, 11 Feb 2025 04:09:40 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e1ce7ab7sm106831966b.171.2025.02.11.04.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 04:09:39 -0800 (PST)
Message-ID: <bad8e013-3d01-4fe5-8783-c6d7e0e32a74@redhat.com>
Date: Tue, 11 Feb 2025 13:09:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
To: Qi Zheng <zhengqi.arch@bytedance.com>
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
 <4e298f68-36ff-496a-81d2-7124f792180d@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <4e298f68-36ff-496a-81d2-7124f792180d@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.02.25 10:43, Qi Zheng wrote:
> 
> 
> On 2025/2/11 17:37, David Hildenbrand wrote:
>> On 11.02.25 10:29, Qi Zheng wrote:
>>>
>>>
>>> On 2025/2/11 17:14, David Hildenbrand wrote:
>>>> On 11.02.25 04:45, Qi Zheng wrote:
>>>>> Hi Russell,
>>>>>
>>>>> On 2025/2/11 01:03, Russell King (Oracle) wrote:
>>>>>> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>>>>>>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>>>>>>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
>>>>>>> dereference resulting in a kernel panic. The culprit seems to be
>>>>>>> commit
>>>>>>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>>>>>>> Reverting the commit apparently fixes the issue.
>>>>>>
>>>>>> The blamed commit is buggy:
>>>>>>
>>>>>> arch/arm/include/asm/tlbflush.h:
>>>>>> #define update_mmu_cache(vma, addr, ptep) \
>>>>>>             update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>>>>>>
>>>>>> So vmf can be NULL. This didn't used to matter before this commit,
>>>>>> because vmf was not used by ARM's update_mmu_cache_range(). However,
>>>>>> the commit introduced a dereference of it, which now causes a NULL
>>>>>> point dereference.
>>>>>>
>>>>>> Not sure what the correct solution is, but at a guess, both:
>>>>>>
>>>>>>       if (ptl != vmf->ptl)
>>>>>>
>>>>>> need to become:
>>>>>>
>>>>>>       if (!vmf || ptl != vmf->ptl)
>>>>>
>>>>> No, we can't do that, because without using split PTE locks, we would
>>>>> use shared mm->page_table_lock, which would create a deadlock.
>>>>
>>>> Maybe we can simply special-case on CONFIG_SPLIT_PTE_PTLOCKS ?
>>>>
>>>> if (IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS)) {
>>>
>>> In this case, if two vmas map the same PTE page, then the same PTE lock
>>> will be held repeatedly. Right?
>>
>> Hmm, the comment says:
>>
>>           /*
>>            * This is called while another page table is mapped, so we
>>            * must use the nested version.  This also means we need to
>>            * open-code the spin-locking.
>>            */
>>
>> "another page table" implies that it cannot be the same. But maybe that
>> comment was also wrong?
> 
> I don't see make_coherent() ensuring this when traversing vma.

Right, we could just have the same file range mapped MAP_SHARED into the 
same page table using two VMAs ... I suspect writing a reproducer for 
the deadlock should be easy.

I therefore propose the following changes:
> 
> diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
> index 2bec87c3327d2..dddbca9a2597e 100644
> --- a/arch/arm/mm/fault-armv.c
> +++ b/arch/arm/mm/fault-armv.c
> @@ -61,8 +61,41 @@ static int do_adjust_pte(struct vm_area_struct *vma,
> unsigned long address,
>           return ret;
>    }
> 
> +#if defined(CONFIG_SPLIT_PTE_PTLOCKS)
> +/*
> + * If we are using split PTE locks, then we need to take the pte
> + * lock here.  Otherwise we are using shared mm->page_table_lock
> + * which is already locked, thus cannot take it.
> + */
> +static inline bool do_pte_lock(spinlock_t *ptl, pmd_t pmdval, pmd_t *pmd)
> +{
> +       /*
> +        * Use nested version here to indicate that we are already
> +        * holding one similar spinlock.
> +        */
> +       spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
> +       if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
> +               spin_unlock(ptl);
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
> +static inline void do_pte_unlock(spinlock_t *ptl)
> +{
> +       spin_unlock(ptl);
> +}
> +#else /* !defined(CONFIG_SPLIT_PTE_PTLOCKS) */
> +static inline bool do_pte_lock(spinlock_t *ptl)
> +{
> +       return true;
> +}
> +static inline void do_pte_unlock(spinlock_t *ptl) {}
> +#endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
> +
>    static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
> -                     unsigned long pfn, struct vm_fault *vmf)
> +                     unsigned long pfn)
>    {
>           spinlock_t *ptl;
>           pgd_t *pgd;
> @@ -99,23 +132,14 @@ static int adjust_pte(struct vm_area_struct *vma,
> unsigned long address,
>           if (!pte)
>                   return 0;
> 
> -       /*
> -        * If we are using split PTE locks, then we need to take the page
> -        * lock here.  Otherwise we are using shared mm->page_table_lock
> -        * which is already locked, thus cannot take it.
> -        */
> -       if (ptl != vmf->ptl) {
> -               spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
> -               if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
> -                       pte_unmap_unlock(pte, ptl);
> -                       goto again;
> -               }
> +       if (!do_pte_lock(ptl, pmdval, pmd)) {
> +               pte_unmap(pte);
> +               goto again;
>           }
> 
>           ret = do_adjust_pte(vma, address, pfn, pte);
> 
> -       if (ptl != vmf->ptl)
> -               spin_unlock(ptl);
> +       do_pte_unlock(ptl);
>           pte_unmap(pte);
> 
>           return ret;
> @@ -123,16 +147,17 @@ static int adjust_pte(struct vm_area_struct *vma,
> unsigned long address,
> 
>    static void
>    make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
> -             unsigned long addr, pte_t *ptep, unsigned long pfn,
> -             struct vm_fault *vmf)
> +             unsigned long addr, pte_t *ptep, unsigned long pfn)
>    {
>           struct mm_struct *mm = vma->vm_mm;
>           struct vm_area_struct *mpnt;
>           unsigned long offset;
> +       unsigned long start;
>           pgoff_t pgoff;
>           int aliases = 0;
> 
>           pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +       start = ALIGN_DOWN(addr, PMD_SIZE);
> 
>           /*
>            * If we have any shared mappings that are in the same mm
> @@ -141,6 +166,8 @@ make_coherent(struct address_space *mapping, struct
> vm_area_struct *vma,
>            */
>           flush_dcache_mmap_lock(mapping);
>           vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
> +               unsigned long mpnt_addr;
> +
>                   /*
>                    * If this VMA is not in our MM, we can ignore it.
>                    * Note that we intentionally mask out the VMA
> @@ -151,7 +178,14 @@ make_coherent(struct address_space *mapping, struct
> vm_area_struct *vma,
>                   if (!(mpnt->vm_flags & VM_MAYSHARE))
>                           continue;
>                   offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
> -               aliases += adjust_pte(mpnt, mpnt->vm_start + offset,
> pfn, vmf);
> +               mpnt_addr = mpnt->vm_start + offset;
> +               /*
> +                * If mpnt_addr and addr are mapped to the same PTE page,
> +                * also skip this vma.
> +                */
> +               if (mpnt_addr >= start && mpnt_addr - start < PMD_SIZE)
> +                       continue;

Hmm, but is skipping the right thing to do? Maybe you would want to 
indicate to adjust_pte() whether it must take the PTL or not.

I did not study that code in detail, though ...

-- 
Cheers,

David / dhildenb

