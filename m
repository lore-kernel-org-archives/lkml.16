Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3091288CC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 01:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751335041; cv=none; b=q07QjEx7yTfu19jdyi0QTTmT/o0mMKnfECCT2fJa87bLPbxyF3gV756GE7tdWMsX8dFsLcg9h7uw5yYw9fVyrJP8eJtrge8AXEwnrtb1jCCejnNZda1muK6lf/fBe5djCEhr7TiTIfAyyR7HhXIKw0od/eOaSWPrvNjKk+5U80w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751335041; c=relaxed/simple;
	bh=rLkb1YuNeMMv0N2r2qQ1xME1pNaLuii3/yluIt5Vzi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZVMjaOHNUhNinSDC7HYLHzc0T/Z9UoI3nJCNgZFbn83BCqDrVc8JFreloIaVI0eUGmtHoBlQtrnaTStHVEm948x2k0IyZKPvZ4IXbQ4rGmUpcwaVgDiWWStMQfPolu9OezOWpv8B3nJ7Kfsh8DovngJP1koGV9e8V+M0J3s8fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=naM+y+pf; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="naM+y+pf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751335027; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+2wC9AMtVtRi22rg4pym3ZO+D2tGf/83DmYS5GtTzLM=;
	b=naM+y+pfrhkANn+cCDzGlUmih61wk3rTdIXvoNxW2IAmBVRTG5M81htg8j4kRnASzc3L4kXvNNKncENu0F2BE81qPWf7AEozVJhhxdb7GQrAEu38IkmUZvwZvOtV2lO0jhvvIMU6Rd9JJKrRxF4OO+CpxV/T+dj+Gb8aSiBnkV0=
Received: from 30.74.144.130(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WgHa0q4_1751335025 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Jul 2025 09:57:06 +0800
Message-ID: <ddf1f0f0-dfb9-4df0-9bfa-df9c5cf39ec5@linux.alibaba.com>
Date: Tue, 1 Jul 2025 09:57:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] mm/shmem, swap: clean up swap entry splitting
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250627062020.534-1-ryncsn@gmail.com>
 <20250627062020.534-5-ryncsn@gmail.com>
 <3d317ce9-2304-4361-adda-32abcc06e3dd@linux.alibaba.com>
 <CAMgjq7Dc4QJAkxFpAkzXk-8Xe5zyx2HUzNKpoq_sqbyZUFpOkA@mail.gmail.com>
 <ce54b1b1-1d3a-4783-bb76-6d4d4e902dac@linux.alibaba.com>
 <CAMgjq7CmK3g_QpepGJP9Cyu2aA7t+R4XN+NQDqouLCKKF+RJPA@mail.gmail.com>
 <1102fb2b-3e2e-4ae2-8609-cff6a4b0d821@linux.alibaba.com>
 <CAMgjq7D8wPJECCdsRzHkTNXN9Ot5A7Op+9BH83_ojDjtp=GCUg@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAMgjq7D8wPJECCdsRzHkTNXN9Ot5A7Op+9BH83_ojDjtp=GCUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/7/1 02:19, Kairui Song wrote:
> On Mon, Jun 30, 2025 at 7:59 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>>
>>
>> On 2025/6/30 18:06, Kairui Song wrote:
>>> On Mon, Jun 30, 2025 at 5:53 PM Baolin Wang
>>> <baolin.wang@linux.alibaba.com> wrote:
>>>> On 2025/6/30 17:16, Kairui Song wrote:
>>>>> On Mon, Jun 30, 2025 at 2:34 PM Baolin Wang
>>>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>>> On 2025/6/27 14:20, Kairui Song wrote:
>>>>>>> From: Kairui Song <kasong@tencent.com>
>>>>>>>
>>>>>>> Instead of keeping different paths of splitting the entry and
>>>>>>> recalculating the swap entry and index, do it in one place.
>>>>>>>
>>>>>>> Whenever swapin brought in a folio smaller than the entry, split the
>>>>>>> entry. And always recalculate the entry and index, in case it might
>>>>>>> read in a folio that's larger than the entry order. This removes
>>>>>>> duplicated code and function calls, and makes the code more robust.
>>>>>>>
>>>>>>> Signed-off-by: Kairui Song <kasong@tencent.com>
>>>>>>> ---
>>>>>>>      mm/shmem.c | 103 +++++++++++++++++++++--------------------------------
>>>>>>>      1 file changed, 41 insertions(+), 62 deletions(-)
>>>>>>>
>>>>>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>>>>>> index f85a985167c5..5be9c905396e 100644
>>>>>>> --- a/mm/shmem.c
>>>>>>> +++ b/mm/shmem.c
>>>>>>> @@ -2178,8 +2178,12 @@ static void shmem_set_folio_swapin_error(struct inode *inode, pgoff_t index,
>>>>>>>          swap_free_nr(swap, nr_pages);
>>>>>>>      }
>>>>>>>
>>>>>>> -static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
>>>>>>> -                                swp_entry_t swap, gfp_t gfp)
>>>>>>> +/*
>>>>>>> + * Split an existing large swap entry. @index should point to one sub mapping
>>>>>>> + * slot within the entry @swap, this sub slot will be split into order 0.
>>>>>>> + */
>>>>>>> +static int shmem_split_swap_entry(struct inode *inode, pgoff_t index,
>>>>>>> +                               swp_entry_t swap, gfp_t gfp)
>>>>>>>      {
>>>>>>>          struct address_space *mapping = inode->i_mapping;
>>>>>>>          XA_STATE_ORDER(xas, &mapping->i_pages, index, 0);
>>>>>>> @@ -2250,7 +2254,7 @@ static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
>>>>>>>          if (xas_error(&xas))
>>>>>>>                  return xas_error(&xas);
>>>>>>>
>>>>>>> -     return entry_order;
>>>>>>> +     return 0;
>>>>>>>      }
>>>>>>>
>>>>>>>      /*
>>>>>>> @@ -2267,11 +2271,11 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>>>>>>>          struct address_space *mapping = inode->i_mapping;
>>>>>>>          struct mm_struct *fault_mm = vma ? vma->vm_mm : NULL;
>>>>>>>          struct shmem_inode_info *info = SHMEM_I(inode);
>>>>>>> +     int error, nr_pages, order, swap_order;
>>>>>>>          struct swap_info_struct *si;
>>>>>>>          struct folio *folio = NULL;
>>>>>>>          bool skip_swapcache = false;
>>>>>>>          swp_entry_t swap;
>>>>>>> -     int error, nr_pages, order, split_order;
>>>>>>>
>>>>>>>          VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
>>>>>>>          swap = radix_to_swp_entry(*foliop);
>>>>>>> @@ -2321,70 +2325,43 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>>>>>>>                                  goto failed;
>>>>>>>                  }
>>>>>>>
>>>>>>> -             /*
>>>>>>> -              * Now swap device can only swap in order 0 folio, then we
>>>>>>> -              * should split the large swap entry stored in the pagecache
>>>>>>> -              * if necessary.
>>>>>>> -              */
>>>>>>> -             split_order = shmem_split_large_entry(inode, index, swap, gfp);
>>>>>>> -             if (split_order < 0) {
>>>>>>> -                     error = split_order;
>>>>>>> -                     goto failed;
>>>>>>> -             }
>>>>>>> -
>>>>>>> -             /*
>>>>>>> -              * If the large swap entry has already been split, it is
>>>>>>> -              * necessary to recalculate the new swap entry based on
>>>>>>> -              * the old order alignment.
>>>>>>> -              */
>>>>>>> -             if (split_order > 0) {
>>>>>>> -                     pgoff_t offset = index - round_down(index, 1 << split_order);
>>>>>>> -
>>>>>>> -                     swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
>>>>>>> -             }
>>>>>>> -
>>>>>>>                  /* Here we actually start the io */
>>>>>>>                  folio = shmem_swapin_cluster(swap, gfp, info, index);
>>>>>>>                  if (!folio) {
>>>>>>>                          error = -ENOMEM;
>>>>>>>                          goto failed;
>>>>>>>                  }
>>>>>>> -     } else if (order > folio_order(folio)) {
>>>>>>> -             /*
>>>>>>> -              * Swap readahead may swap in order 0 folios into swapcache
>>>>>>> -              * asynchronously, while the shmem mapping can still stores
>>>>>>> -              * large swap entries. In such cases, we should split the
>>>>>>> -              * large swap entry to prevent possible data corruption.
>>>>>>> -              */
>>>>>>> -             split_order = shmem_split_large_entry(inode, index, swap, gfp);
>>>>>>> -             if (split_order < 0) {
>>>>>>> -                     folio_put(folio);
>>>>>>> -                     folio = NULL;
>>>>>>> -                     error = split_order;
>>>>>>> -                     goto failed;
>>>>>>> -             }
>>>>>>> -
>>>>>>> -             /*
>>>>>>> -              * If the large swap entry has already been split, it is
>>>>>>> -              * necessary to recalculate the new swap entry based on
>>>>>>> -              * the old order alignment.
>>>>>>> -              */
>>>>>>> -             if (split_order > 0) {
>>>>>>> -                     pgoff_t offset = index - round_down(index, 1 << split_order);
>>>>>>> -
>>>>>>> -                     swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
>>>>>>> -             }
>>>>>>> -     } else if (order < folio_order(folio)) {
>>>>>>> -             swap.val = round_down(swap.val, 1 << folio_order(folio));
>>>>>>>          }
>>>>>>>
>>>>>>>      alloced:
>>>>>>> +     /*
>>>>>>> +      * We need to split an existing large entry if swapin brought in a
>>>>>>> +      * smaller folio due to various of reasons.
>>>>>>> +      *
>>>>>>> +      * And worth noting there is a special case: if there is a smaller
>>>>>>> +      * cached folio that covers @swap, but not @index (it only covers
>>>>>>> +      * first few sub entries of the large entry, but @index points to
>>>>>>> +      * later parts), the swap cache lookup will still see this folio,
>>>>>>> +      * And we need to split the large entry here. Later checks will fail,
>>>>>>> +      * as it can't satisfy the swap requirement, and we will retry
>>>>>>> +      * the swapin from beginning.
>>>>>>> +      */
>>>>>>> +     swap_order = folio_order(folio);
>>>>>>
>>>>>> Nit: 'swap_order' is confusing, and can you just use folio_order() or a
>>>>>> btter name?
>>>>>
>>>>> Good idea.
>>>>>
>>>>>>
>>>>>>> +     if (order > swap_order) {
>>>>>>> +             error = shmem_split_swap_entry(inode, index, swap, gfp);
>>>>>>> +             if (error)
>>>>>>> +                     goto failed_nolock;
>>>>>>> +     }
>>>>>>> +
>>>>>>> +     index = round_down(index, 1 << swap_order);
>>>>>>> +     swap.val = round_down(swap.val, 1 << swap_order);
>>>>>>
>>>>>> The round_down() of index and swap value here may cause
>>>>>> shmem_add_to_page_cache() to fail to insert a new folio, because the
>>>>>> swap value stored at that index in the shmem mapping does not match,
>>>>>> leading to another swapin page fault for correction.
>>>>>>
>>>>>> For example, shmem stores a large swap entry of order 4 in the range of
>>>>>> index 0-64. When a swapin fault occurs at index = 3, with swap.val =
>>>>>> 0x4000, if a split happens and this round_down() logic is applied, then
>>>>>> index = 3, swap.val = 0x4000. However, the actual swap.val should be
>>>>>> 0x4003 stored in the shmem mapping. This would cause another swapin fault.
>>>>>
>>>>> Oops, I missed a swap value fixup in the !SWP_SYNCHRONOUS_IO path
>>>>> above, it should re-calculate the swap value there. It's fixed in the
>>>>> final patch but left unhandled here. I'll update this part.
>>>>>
>>>>>>
>>>>>> I still prefer my original alignment method, and do you find this will
>>>>>> cause any issues?
>>>>>>
>>>>>> "
>>>>>> if (split_order > 0) {
>>>>>>            pgoff_t offset = index - round_down(index, 1 << split_order);
>>>>>>
>>>>>>            swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
>>>>>> }
>>>>>> "
>>>>>
>>>>> It only fits the cached swapin and uncached swapin, not the cache hit
>>>>> case. Cache hits may see a larger folio so split didn't happen, but
>>>>> the round_down is still needed.
>>>>
>>>> IMO, this only fits for the large swap entry split case.
>>>>
>>>>> And there is another racy case: before this patch, the split may
>>>>> happen first, but shmem_swapin_cluster brought in a large folio due to
>>>>> race in the swap cache layer.
>>>>
>>>> shmem_swapin_cluster() can only allocate order 0 folio, right?
>>>
>>> It can only allocate order 0 folio, but It can hit a large folio: eg.
>>> a parallel swapin/swapout happened, and the folio stays in swap cache,
>>> while we are handling a swapin here.
>>
>> Yes, I know this. This is exactly the issue that patch 1 wants to fix.
> 
> Hmm, patch 1 prevents the hang but doesn't prevent things like a
> duplicated fault:
> 
> Starts with:
> swap entry val = 0x400, order = 4, covering index 0 - 15, faulting index 3:
> 
> Before this patch:
> CPU0                        CPU1
> shmem_swapin_folio (see order = 4)
>                              shmem_swapin_folio (see order = 4)
>    /* fallback to order 0 due to */
>    /* mem pressure / temporary pin / etc */
>    shmem_split_large_entry
>    /* split to order 0 */
>    /* interrupted */
>                              /* swapin done with order = 4 folio */
>                              /* swapout again, leave the large folio
>                                 in cache temporarily  */
>    folio = swap_cluster_readahead(0x403)
>    /* Gets folio order = 4, folio->swap = 0x400
>       since swap_cluster_readahead uses swap cache */
>    folio->swap.val != swap.val
>    /* ! Above test failed ! */
>    /* It shouldn't fail the round down is needed */

OK. Thanks for the explanation. Yes, this might cause a refault.

> This patch moved the split after the swapin so it should be OK now,

Yes, I agree 'moving the split after the swapin'.

> but still the split_order could be unstable, see below:

>>>>> And I'm not sure if split_order is always reliable here, for example
>>>>> concurrent split may return an inaccurate value here.
>>>>
>>>> We've held the xas lock to ensure the split is reliable, even though
>>>> concurrent splits may occur, only one split can get the large
>>>> 'split_order', another will return 0 (since it will see the large swao
>>>> entry has already been split).
>>>
>>> Yes, it may return 0, so we can get a large folio here, but get
>>> `split_order = 0`?
>>
>> If split happens, which means the 'order' > folio_order(), right? how
>> can you get a large folio in this context?
>>
>>> And if concurrently swapout/swapin happened, the `split_order` could
>>> be a different value?
>>
>> What do you mean different value? The large swap entry can only be split
>> once, so the 'split_order' must be 0 or the original large order.
> 
> Since d53c78fffe7ad, shmem_split_large_entry doesn't split every slot
> into order 0 IIUC, so things get complex if two CPUs are faulting on
> different indexes landing into two different splitting zones:
> 
> Before this patch:
> swap entry val = 0x400, order = 9, covering index 0 - 511, faulting index 3:
> 
> CPU0                           CPU1
> shmem_swapin_folio (index = 3)
>                                 shmem_swapin_folio (index = 510)
>    /* Gets swap = 0x400 */      /* Gets swap = 0x400 */
>    /* fallback to order 0 */    /* fallback to order 0 */
>    split_order = shmem_split_large_entry
>    /* get split_order = 512 */
>    /* offset = 3 */
>                                 split_order = shmem_split_large_entry
>                                 /* get split_order = 0, but no split */
>                                 /* map order is 8, offset = 0 */
>                                 /* wrong offset */
>                                 shmem_swapin_cluster(0x400)
>                                 /* It should swapin 0x5fe */

Not ture. IIUC, the CPU1 will failed to split due to 
'swp_to_radix_entry(swap) != old' in shmem_split_large_entry(), and will 
retry again to fix this race.

> After this patch (with the append fix which was left in latest patch
> by mistake) it won't swapin wrong entry now, but
> shmem_split_large_entry may still return a outdated order.

Like I said above, I don't think we can get a outdated order,right?

> That's two previous races I can come up with. These no longer exist
> after this patch, it's not a bug though, just redundant IO as far as I
> can see because other checks will fallback, looks a bit fragile
> though. But shmem_split_large_entry may still return invalid order,
> just much less likely.
> 
> I think the ideology here is, because the `order =
> shmem_confirm_swap(mapping, index, swap)` ensures order is stable and
> corresponds to the entry value at one point, so keep using that value
> is better (and so this patch does the offset and calculation using the
> `order` retrieved there before issues the swapin).

I don't think that the 'order' obtained through the shmem_confirm_swap() 
is stable, because shmem_confirm_swap() is only protected by RCU. 
However, I think the 'split_order' obtained from 
shmem_split_large_entry() under the xas lock is stable.

> And after the swapin have brought a folio in, simply round down using
> the folio's order, which should ensure the folio can be added
> successfully in any case as long as the folio->swap and index fits the
> shmem mapping fine.
> 
>>>> Based on your current patch, would the following modifications be clearer?
>>>>
>>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>>> index 5be9c905396e..91c071fb7b67 100644
>>>> --- a/mm/shmem.c
>>>> +++ b/mm/shmem.c
>>>> @@ -2254,7 +2254,7 @@ static int shmem_split_swap_entry(struct inode
>>>> *inode, pgoff_t index,
>>>>            if (xas_error(&xas))
>>>>                    return xas_error(&xas);
>>>>
>>>> -       return 0;
>>>> +       return split_order;
>>>>     }
>>>>
>>>>     /*
>>>> @@ -2351,10 +2351,23 @@ static int shmem_swapin_folio(struct inode
>>>> *inode, pgoff_t index,
>>>>                    error = shmem_split_swap_entry(inode, index, swap, gfp);
>>>>                    if (error)
>>>>                            goto failed_nolock;
>>>> -       }
>>>>
>>>> -       index = round_down(index, 1 << swap_order);
>>>> -       swap.val = round_down(swap.val, 1 << swap_order);
>>>> +               /*
>>>> +                * If the large swap entry has already been split, it is
>>>> +                * necessary to recalculate the new swap entry based on
>>>> +                * the old order alignment.
>>>> +                */
>>>> +               if (split_order > 0) {
> 
> The split_order could still be an outdated value, eg. we may even get
> split_order = 0 with a large folio loaded here.

Ditto. I didn't see split_order can be an outdated value.

>>>> +                       pgoff_t offset = index - round_down(index, 1 <<
>>>> split_order);
>>>> +
>>>> +                       swap = swp_entry(swp_type(swap),
>>>> swp_offset(swap) + offset);
>>>> +               }
>>>> +       } else if (order < folio_order(folio)) {
>>>> +               /*
>>>> +                * TODO; explain the posible race...
>>>> +                */
>>>> +               swap.val = round_down(swap.val, 1 << folio_order(folio));
>>>> +       }
>>
>> Sorry, you changes did not convince me. I still prefer my changes,
>> listing out the possible races that might require changes to the swap
>> value, as it would be clearer and more readable. Additionally, this is a
>> cleanup patch, so I hope there are no implicit functional changes.
> 
> I was thinking that the less branch we have the better, I won't insist
> on this though.

But this is under the premise of keeping the code logic clear and simple.

>>>>            /* We have to do this with folio locked to prevent races */
>>>>            folio_lock(folio);
>>>> @@ -2382,7 +2395,8 @@ static int shmem_swapin_folio(struct inode *inode,
>>>> pgoff_t index,
>>>>                            goto failed;
>>>>            }
>>>>
>>>> -       error = shmem_add_to_page_cache(folio, mapping, index,
>>>> +       error = shmem_add_to_page_cache(folio, mapping,
>>>> +                                       round_down(index, nr_pages),
>>>>                                            swp_to_radix_entry(swap), gfp);
>>>>            if (error)
>>>>                    goto failed;
>>>>
>>>>> So I wanted to simplify it: by round_down(folio_order(folio)) we
>>>>> simply get the index and swap that will be covered by this specific
>>>>> folio, if the covered range still has the corresponding swap entries
>>>>> (check and ensured by shmem_add_to_page_cache which holds the
>>>>> xa_lock), then the folio will be inserted back safely and
>>>>> successfully.
>>>>
>>>
>>> I think adding the missing swap value fixup in the !SYNC_IO path
>>> should be good enough?
>>>
>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>> index 5be9c905396e..2620e4d1b56a 100644
>>> --- a/mm/shmem.c
>>> +++ b/mm/shmem.c
>>> @@ -2276,6 +2276,7 @@ static int shmem_swapin_folio(struct inode
>>> *inode, pgoff_t index,
>>>           struct folio *folio = NULL;
>>>           bool skip_swapcache = false;
>>>           swp_entry_t swap;
>>> +       pgoff_t offset;
>>>
>>>           VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
>>>           swap = radix_to_swp_entry(*foliop);
>>> @@ -2325,7 +2326,9 @@ static int shmem_swapin_folio(struct inode
>>> *inode, pgoff_t index,
>>>                                   goto failed;
>>>                   }
>>>
>>> -               /* Here we actually start the io */
>>> +               /* Cached swapin currently only supports order 0 swapin */
>>> +               /* It may hit a large folio but that's OK and handled below */
>>> +               offset = index - round_down(index, 1 << order);
>>> +               swap.val = swap.val + offset;
> 
> BTW for this append patch, it should be using a different variable so
> swap won't be changed or it will cause redundant fault again. My bad.
> 
>>>                   folio = shmem_swapin_cluster(swap, gfp, info, index);
>>>                   if (!folio) {
>>>                           error = -ENOMEM;
>>

