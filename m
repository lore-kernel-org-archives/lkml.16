Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794B72AF10
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 03:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749182167; cv=none; b=bHAeMCZfO0Fl3JKVuXcmBSl7WR8qWewKV6SBPyFQtSHnjl6xn8sfmkl1U6fCxggYjQqGmwL4lZ2A08yqZVaaqnrvBZ+VsYwMnOiWYLF2XGw9IuBeBydekbHSxYXIzIBwwfjOafOT5CtuVd9H3nhPoyR0aHeTpDJPiEenUuMxeGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749182167; c=relaxed/simple;
	bh=EOuSg6ONhV75ODmPMuX1BVjjBdMrzGc/kBJkGKPZaS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thPvfRx09V7jBkpumrWgzX84m06ZSeR7A/GXulWg/MpFRD9VGFUUvirh2emA9u7m+AqdDCFGu80YvydyQH52WjEsjLDts6NQiu5Ig8dvefT0rkiN0yRlybE6viV8GvB1aZ+IMP3qVumhSJXNbdJofD71akMfw74ojNVRIYhYlZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CupijBlO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CupijBlO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23508d30142so23000335ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 20:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749182165; x=1749786965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7d5kaFS84TSa8GmIV7A0n5UI1SbOTb/2OdVl96QMQnY=;
        b=CupijBlO1wFVUxNgdFU87pOy5tN3B46wbOHNbt3PWUZAnBEWRKT1lRH5sOkus7h2yQ
         EWBwTKG5oTc49JNB4rAhsRdoClE51/sfJMRM6bDwn240S+kBd44SJahBJWEcUTi1+j6V
         GlQ+ax55l3UYPSozpdv5bBO3N8gT3gcHpcfdbBiV1M8Nt13NKuqT22/yhTyPjnle6hjc
         3ZWLRwCRGj3WiP9HLUKNHlASOr1V9zkvkNHskt8PnXadeGSansrtrvV4dZma52TJW77l
         cxDaaAe+Y3vT+KBxkrQ/oSMc+QCNHGT5s0uRdY3+G+aJmP+bMYzwqlzpEJanyHK4D6Jt
         nqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749182165; x=1749786965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7d5kaFS84TSa8GmIV7A0n5UI1SbOTb/2OdVl96QMQnY=;
        b=OILNODPvEJFN9ZgMBN/rnM6onV3TKKyzwgO6T31lurwvBHsv2o5TY/dWCh6Q2GxM5a
         9uns3aH+h/wmgy8IizcO7Q3IsIztDZkIZRGUqUCCElW7JtZfjlEb3jCWmdKBfw5errSa
         U9UiJKxmnIidL1byWQ7ICfDskYdcIh/PSYbm58aSKKcT/oa6rHsOtHAKu997dw0c3Fx/
         DI8lQx3blbr0sgu519oATXedn7SqYj1SFCO446LMT7StNgc27rusJ7fVCJeXgNK2Cz84
         LGve+Qne1ryFEWpvtyutkcLN+ty8n/mtHniWOGKg9OzrQ/yJyLqTeBXpPI5yr7mDnjpq
         p4mw==
X-Forwarded-Encrypted: i=1; AJvYcCWXwi0/PDb6wrl+pM4Ik2Bo/LUDMcXkh6JkwxdIhwDevnT5PwwjFKsuUv2WgNqErvMXAzB1zAdPfREKb/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YySf41rvgohDZKsDOVVhGk+7GEWic6IuWBJT03/bkP9qj4uWe3S
	ScNhJOzUR1NIVJ5fyBJiX3+aXpI20rvIu2ovjUrnnSu9uHFCu3jJkVYtMezErn99OA0=
X-Gm-Gg: ASbGncuYBfWFVdyTupTvFxosSP364uypotgRwKT1QRd/s9RF8MLJhXcvXMMNsov2qmB
	l5ByRGPLBXBwDBrYhzmGwWgJTcb9GErCem3hKJppkW+EPcnyXbSiwNCScb9VCb0Yt3sZLinlC8P
	YTe8l+V0/B8eHA5ztNV7JLVQ2EZLl/kGuh5+U/5N3gzuCykBLO61nID79AzTbISaDoW45RuJQh1
	/eZVDmj5e82K+Ix44cwepL4DbtiVhRPy8RGGPnVCbK0lKcJr3uajK9kZ8VwliMb72Avo0ZBuv3B
	nM8BjnIAKF20L6EnMl1AnOd5h2cPuRCA8f0i1Qr/YL7YI6oYvY+ZHBulU+jrEbetNkNNnXy/eWy
	xcGw=
X-Google-Smtp-Source: AGHT+IE17FlGz4IID9w8ry1Vbh1JI1U1R3q7eJ/v7EPEcFLDdQNvaCYq3y01ZkvFUKKAvSrD/8kwhQ==
X-Received: by 2002:a17:902:e74b:b0:234:df51:d16c with SMTP id d9443c01a7336-23601d9e57fmr24333145ad.45.1749182164611;
        Thu, 05 Jun 2025 20:56:04 -0700 (PDT)
Received: from [10.254.237.177] ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fdfe58sm469444a91.38.2025.06.05.20.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 20:56:04 -0700 (PDT)
Message-ID: <f0069b65-9ca8-44e5-8c98-1d377798c31e@bytedance.com>
Date: Fri, 6 Jun 2025 11:55:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jann Horn <jannh@google.com>, Barry Song <21cnbao@gmail.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Lokesh Gidra <lokeshgidra@google.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
 <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
 <3cb53060-9769-43f4-996d-355189df107d@bytedance.com>
 <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
 <7cb990bf-57d4-4fc9-b44c-f30175c0fb7a@bytedance.com>
 <bfb56be6-d55e-4dcc-93a3-4c7e6faf790f@lucifer.local>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <bfb56be6-d55e-4dcc-93a3-4c7e6faf790f@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

On 6/5/25 10:04 PM, Lorenzo Stoakes wrote:
> On Thu, Jun 05, 2025 at 11:23:18AM +0800, Qi Zheng wrote:
>>
>>
>> On 6/5/25 1:50 AM, Lorenzo Stoakes wrote:
>>> On Wed, Jun 04, 2025 at 02:02:12PM +0800, Qi Zheng wrote:
>>>> Hi Lorenzo,
>>>>
>>>> On 6/3/25 5:54 PM, Lorenzo Stoakes wrote:
>>>>> On Tue, Jun 03, 2025 at 03:24:28PM +0800, Qi Zheng wrote:
>>>>>> Hi Jann,
>>>>>>
>>>>>> On 5/30/25 10:06 PM, Jann Horn wrote:
>>>>>>> On Fri, May 30, 2025 at 12:44 PM Barry Song <21cnbao@gmail.com> wrote:
>>>>>>>> Certain madvise operations, especially MADV_DONTNEED, occur far more
>>>>>>>> frequently than other madvise options, particularly in native and Java
>>>>>>>> heaps for dynamic memory management.
>>>>>>>>
>>>>>>>> Currently, the mmap_lock is always held during these operations, even when
>>>>>>>> unnecessary. This causes lock contention and can lead to severe priority
>>>>>>>> inversion, where low-priority threads—such as Android's HeapTaskDaemon—
>>>>>>>> hold the lock and block higher-priority threads.
>>>>>>>>
>>>>>>>> This patch enables the use of per-VMA locks when the advised range lies
>>>>>>>> entirely within a single VMA, avoiding the need for full VMA traversal. In
>>>>>>>> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
>>>>>>>>
>>>>>>>> Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
>>>>>>>> benefits from this per-VMA lock optimization. After extended runtime,
>>>>>>>> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
>>>>>>>> only 1,231 fell back to mmap_lock.
>>>>>>>>
>>>>>>>> To simplify handling, the implementation falls back to the standard
>>>>>>>> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
>>>>>>>> userfaultfd_remove().
>>>>>>>
>>>>>>> One important quirk of this is that it can, from what I can see, cause
>>>>>>> freeing of page tables (through pt_reclaim) without holding the mmap
>>>>>>> lock at all:
>>>>>>>
>>>>>>> do_madvise [behavior=MADV_DONTNEED]
>>>>>>>       madvise_lock
>>>>>>>         lock_vma_under_rcu
>>>>>>>       madvise_do_behavior
>>>>>>>         madvise_single_locked_vma
>>>>>>>           madvise_vma_behavior
>>>>>>>             madvise_dontneed_free
>>>>>>>               madvise_dontneed_single_vma
>>>>>>>                 zap_page_range_single_batched [.reclaim_pt = true]
>>>>>>>                   unmap_single_vma
>>>>>>>                     unmap_page_range
>>>>>>>                       zap_p4d_range
>>>>>>>                         zap_pud_range
>>>>>>>                           zap_pmd_range
>>>>>>>                             zap_pte_range
>>>>>>>                               try_get_and_clear_pmd
>>>>>>>                               free_pte
>>>>>>>
>>>>>>> This clashes with the assumption in walk_page_range_novma() that
>>>>>>> holding the mmap lock in write mode is sufficient to prevent
>>>>>>> concurrent page table freeing, so it can probably lead to page table
>>>>>>> UAF through the ptdump interface (see ptdump_walk_pgd()).
>>>>>>
>>>>>> Maybe not? The PTE page is freed via RCU in zap_pte_range(), so in the
>>>>>> following case:
>>>>>>
>>>>>> cpu 0				cpu 1
>>>>>>
>>>>>> ptdump_walk_pgd
>>>>>> --> walk_pte_range
>>>>>>        --> pte_offset_map (hold RCU read lock)
>>>>>> 				zap_pte_range
>>>>>> 				--> free_pte (via RCU)
>>>>>>            walk_pte_range_inner
>>>>>>            --> ptdump_pte_entry (the PTE page is not freed at this time)
>>>>>>
>>>>>> IIUC, there is no UAF issue here?
>>>>>>
>>>>>> If I missed anything please let me know.
>>>
>>> Seems to me that we don't need the VMA locks then unless I'm missing
>>> something? :) Jann?
>>>
>>> Would this RCU-lock-acquired-by-pte_offset_map also save us from the
>>> munmap() downgraded read lock scenario also? Or is the problem there
>>> intermediate page table teardown I guess?
>>>
>>
>> Right. Currently, page table pages other than PTE pages are not
>> protected by RCU, so mmap write lock still needed in the munmap path
>> to wait for all readers of the page table pages to exit the critical
>> section.
>>
>> In other words, once we have achieved that all page table pages are
>> protected by RCU, we can completely remove the page table pages from
>> the protection of mmap locks.
> 
> Interesting - so on reclaim/migrate we are just clearing PTE entries with
> the rmap lock right? Would this lead to a future where we could also tear
> down page tables there?
> 
> Another point to remember is that when we are clearing down higher level
> page tables in the general case, the logic assumes nothing else can touch
> anything... we hold both rmap lock AND mmap/vma locks at this point.
> 
> But I guess if we're RCU-safe, we're same even from rmap right?

Yeah, and we have already done something similar. For more details,
please refer to retract_page_tables(). It only holds i_mmap_rwsem read
lock and then calls pte_free_defer() to free the PTE page through RCU.

For migrate case, the pte entry will store a migrate entry, right? And a
new physical page will be installed soon through a page fault, so I
don't think it is necessary to free the corresponding PTE page.

For reclaim case, there is a problem that only PTE entries that mapped
to a physical page are operated each time. If we want to free the entire
PTE page, we need to check the adjacent PTE entries. Maybe MGLRU can
help with this. I remember that MGLRU has an optimization that will 
check the adjacent PTE entries.

> 
>>
>> Here are some of my previous thoughts:
>>
>> ```
>> Another plan
>> ============
>>
>> Currently, page table modification are protected by page table locks
>> (page_table_lock or split pmd/pte lock), but the life cycle of page
>> table pages are protected by mmap_lock (and vma lock). For more details,
>> please refer to the latest added Documentation/mm/process_addrs.rst file.
>>
>> Currently we try to free the PTE pages through RCU when
>> CONFIG_PT_RECLAIM is turned on. In this case, we will no longer
>> need to hold mmap_lock for the read/write op on the PTE pages.
>>
>> So maybe we can remove the page table from the protection of the mmap
>> lock (which is too big), like this:
>>
>> 1. free all levels of page table pages by RCU, not just PTE pages, but
>>     also pmd, pud, etc.
>> 2. similar to pte_offset_map/pte_unmap, add
>>     [pmd|pud]_offset_map/[pmd|pud]_unmap, and make them all contain
>>     rcu_read_lock/rcu_read_unlcok, and make them accept failure.
>>
>> In this way, we no longer need the mmap lock. For readers, such as page
>> table wallers, we are already in the critical section of RCU. For
>> writers, we only need to hold the page table lock.
>>
>> But there is a difficulty here, that is, the RCU critical section is not
>> allowed to sleep, but it is possible to sleep in the callback function
>> of .pmd_entry, such as mmu_notifier_invalidate_range_start().
>>
>> Use SRCU instead? Or use RCU + refcount method? Not sure. But I think
>> it's an interesting thing to try.
> 
> Thanks for the information, RCU freeing of page tables is something of a

RCU-freeing is relatively simple, tlb_remove_table() can be easily
changed to free all levels of page table pages through RCU. The more
difficult is to protect the page table pages above PTE level through RCU
lock.

> long-term TODO discussed back and forth :) might take a look myself if
> somebody else hasn't grabbed when I have a second...

This is awesome, I'm stuck with some other stuff at the moment, I'll
also take a look at it later when I have time.

> 
> Is it _only_ the mmu notifier sleeping in this scenario? Or are there other
> examples?

I'm not sure, need some investigation.

> 
> We could in theory always add another callback .pmd_entry_sleep or
> something for this one case and document the requirement...

Maybe, but the SRCU critical section cannot prevent the PTE page from
being freed via RCU. :(

Thanks!

> 
>> ```
>>
>> Thanks!
>>
>>
> 
> Cheers, Lorenzo

