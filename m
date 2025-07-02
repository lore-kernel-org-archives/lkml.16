Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7843C26
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 02:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751423634; cv=none; b=ucSJytk1W+s+OFBjTLxlau7Ato5eHvttjHZJAOqQ6reWxzbnjuj0V1sp0A+uuH0SJx5jBLdAIHP/EI//csZarJZmz5RXYK06+vPvH8QgFhPgg9hSrNJ+V1Nf8iifv586p/eVxbUHmjHgqy5T7auf+V5STOC/4nPkgFAmEee7b8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751423634; c=relaxed/simple;
	bh=N7fIZFsljCPE3ONS0+ewUem52n5glb1LCvuwWrYwYmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+VyMAgcP7xa/AQqYqWFF9JrR20Au3x+EUG+5yWRwveKjr0kHd2Sl8BWTE3+pT/Hhym/jYPuAncFKxj0wecfIQTKZT6zz4t5px/v7A4Mx/zmWViihG4s9/jSY7gmW1SVBVPMK0y/JekEivO+YYkaECZSgbuef4VNW7Fg7DYR0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=I9bEpVho; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="I9bEpVho"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751423623; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=tfXfYzrPhyRZNBmuVZj2SMpOyt+UaVUHTUXqCzcF0RU=;
	b=I9bEpVho7FP/o/qmS3hIumGBJxk5oHzI5q19cbhMKfffvMB0/NOrtmmb2o4/8ADXfojIfPRjME+F6pgG3qle4NeKWXfpMypzfPksv5rV/EY8AouyO06DlLSAqQaEItlw5N/JrFBxEjwMyzA0bVgMFTZxu/YObUSTH0QyYT42hi4=
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WgX-6Tg_1751423621 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Jul 2025 10:33:42 +0800
Message-ID: <c8806f96-02fb-473d-8bfa-d90a75dc8a37@linux.alibaba.com>
Date: Wed, 2 Jul 2025 10:33:41 +0800
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
 <ddf1f0f0-dfb9-4df0-9bfa-df9c5cf39ec5@linux.alibaba.com>
 <CAMgjq7Cvtx-2eVqcJY9K6DQ_G7zg8t6wCnS_H2TpW-_08jyoug@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAMgjq7Cvtx-2eVqcJY9K6DQ_G7zg8t6wCnS_H2TpW-_08jyoug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/7/2 02:49, Kairui Song wrote:
> On Tue, Jul 1, 2025 at 9:57 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>> On 2025/7/1 02:19, Kairui Song wrote:
>>> On Mon, Jun 30, 2025 at 7:59 PM Baolin Wang
>>> <baolin.wang@linux.alibaba.com> wrote:
>>>> On 2025/6/30 18:06, Kairui Song wrote:
> ... snip ...
>>>>> It can only allocate order 0 folio, but It can hit a large folio: eg.
>>>>> a parallel swapin/swapout happened, and the folio stays in swap cache,
>>>>> while we are handling a swapin here.
>>>>
>>>> Yes, I know this. This is exactly the issue that patch 1 wants to fix.
>>>
>>> Hmm, patch 1 prevents the hang but doesn't prevent things like a
>>> duplicated fault:
>>>
>>> Starts with:
>>> swap entry val = 0x400, order = 4, covering index 0 - 15, faulting index 3:
>>>
>>> Before this patch:
>>> CPU0                        CPU1
>>> shmem_swapin_folio (see order = 4)
>>>                               shmem_swapin_folio (see order = 4)
>>>     /* fallback to order 0 due to */
>>>     /* mem pressure / temporary pin / etc */
>>>     shmem_split_large_entry
>>>     /* split to order 0 */
>>>     /* interrupted */
>>>                               /* swapin done with order = 4 folio */
>>>                               /* swapout again, leave the large folio
>>>                                  in cache temporarily  */
>>>     folio = swap_cluster_readahead(0x403)
>>>     /* Gets folio order = 4, folio->swap = 0x400
>>>        since swap_cluster_readahead uses swap cache */
>>>     folio->swap.val != swap.val
>>>     /* ! Above test failed ! */
>>>     /* It shouldn't fail the round down is needed */
>>
>> OK. Thanks for the explanation. Yes, this might cause a refault.
>>
>>> This patch moved the split after the swapin so it should be OK now,
>>
>> Yes, I agree 'moving the split after the swapin'.
>>
>>> but still the split_order could be unstable, see below:
>>
>>>>>>> And I'm not sure if split_order is always reliable here, for example
>>>>>>> concurrent split may return an inaccurate value here.
>>>>>>
>>>>>> We've held the xas lock to ensure the split is reliable, even though
>>>>>> concurrent splits may occur, only one split can get the large
>>>>>> 'split_order', another will return 0 (since it will see the large swao
>>>>>> entry has already been split).
>>>>>
>>>>> Yes, it may return 0, so we can get a large folio here, but get
>>>>> `split_order = 0`?
>>>>
>>>> If split happens, which means the 'order' > folio_order(), right? how
>>>> can you get a large folio in this context?
>>>>
>>>>> And if concurrently swapout/swapin happened, the `split_order` could
>>>>> be a different value?
>>>>
>>>> What do you mean different value? The large swap entry can only be split
>>>> once, so the 'split_order' must be 0 or the original large order.
>>>
>>> Since d53c78fffe7ad, shmem_split_large_entry doesn't split every slot
>>> into order 0 IIUC, so things get complex if two CPUs are faulting on
>>> different indexes landing into two different splitting zones:
>>>
>>> Before this patch:
>>> swap entry val = 0x400, order = 9, covering index 0 - 511, faulting index 3:
>>>
>>> CPU0                           CPU1
>>> shmem_swapin_folio (index = 3)
>>>                                  shmem_swapin_folio (index = 510)
>>>     /* Gets swap = 0x400 */      /* Gets swap = 0x400 */
>>>     /* fallback to order 0 */    /* fallback to order 0 */
>>>     split_order = shmem_split_large_entry
>>>     /* get split_order = 512 */
>>>     /* offset = 3 */
>>>                                  split_order = shmem_split_large_entry
>>>                                  /* get split_order = 0, but no split */
>>>                                  /* map order is 8, offset = 0 */
>>>                                  /* wrong offset */
>>>                                  shmem_swapin_cluster(0x400)
>>>                                  /* It should swapin 0x5fe */
>>
>> Not ture. IIUC, the CPU1 will failed to split due to
>> 'swp_to_radix_entry(swap) != old' in shmem_split_large_entry(), and will
>> retry again to fix this race.
>>
>>> After this patch (with the append fix which was left in latest patch
>>> by mistake) it won't swapin wrong entry now, but
>>> shmem_split_large_entry may still return a outdated order.
>>
>> Like I said above, I don't think we can get a outdated order,right?
>>
>>> That's two previous races I can come up with. These no longer exist
>>> after this patch, it's not a bug though, just redundant IO as far as I
>>> can see because other checks will fallback, looks a bit fragile
>>> though. But shmem_split_large_entry may still return invalid order,
>>> just much less likely.
>>>
>>> I think the ideology here is, because the `order =
>>> shmem_confirm_swap(mapping, index, swap)` ensures order is stable and
>>> corresponds to the entry value at one point, so keep using that value
>>> is better (and so this patch does the offset and calculation using the
>>> `order` retrieved there before issues the swapin).
>>
>> I don't think that the 'order' obtained through the shmem_confirm_swap()
>> is stable, because shmem_confirm_swap() is only protected by RCU.
>> However, I think the 'split_order' obtained from
>> shmem_split_large_entry() under the xas lock is stable.
>>
>>> And after the swapin have brought a folio in, simply round down using
>>> the folio's order, which should ensure the folio can be added
>>> successfully in any case as long as the folio->swap and index fits the
>>> shmem mapping fine.
>>>
>>>>>> Based on your current patch, would the following modifications be clearer?
>>>>>>
>>>>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>>>>> index 5be9c905396e..91c071fb7b67 100644
>>>>>> --- a/mm/shmem.c
>>>>>> +++ b/mm/shmem.c
>>>>>> @@ -2254,7 +2254,7 @@ static int shmem_split_swap_entry(struct inode
>>>>>> *inode, pgoff_t index,
>>>>>>             if (xas_error(&xas))
>>>>>>                     return xas_error(&xas);
>>>>>>
>>>>>> -       return 0;
>>>>>> +       return split_order;
>>>>>>      }
> 
> Sorry about the bad example, I got confused looking at the wrong code
> base and deduced a wrong stack. Before this series it was returning
> entry_order here so yeah it's OK.
> 
>>>>>>
>>>>>>      /*
>>>>>> @@ -2351,10 +2351,23 @@ static int shmem_swapin_folio(struct inode
>>>>>> *inode, pgoff_t index,
>>>>>>                     error = shmem_split_swap_entry(inode, index, swap, gfp);
>>>>>>                     if (error)
>>>>>>                             goto failed_nolock;
>>>>>> -       }
>>>>>>
>>>>>> -       index = round_down(index, 1 << swap_order);
>>>>>> -       swap.val = round_down(swap.val, 1 << swap_order);
>>>>>> +               /*
>>>>>> +                * If the large swap entry has already been split, it is
>>>>>> +                * necessary to recalculate the new swap entry based on
>>>>>> +                * the old order alignment.
>>>>>> +                */
>>>>>> +               if (split_order > 0) {
>>>
>>> The split_order could still be an outdated value, eg. we may even get
>>> split_order = 0 with a large folio loaded here.
>>
>> Ditto. I didn't see split_order can be an outdated value.
> 
> The problem is, could split_order be 0 while getting a large folio,
> which is like the problem in patch 1.
> This patch changed the race window by a lot, even if that happens,
> shmem_split_swap_entry will just fail and retry though.
> 
> Or, can it get a split_order != 0 while folio order == 0:
> 
> So assume we do (check split_order instead, trimming all comments):
> if (order > folio_order(folio)) {
>      split_order = shmem_split_swap_entry(inode, index, swap, gfp);
>      if (split_order < 0)
>          goto failed_nolock;
>      if (split_order > 0) {
>          offset = index - round_down(index, 1 << split_order);
>          swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
>          /* Could we get unnecessary `folio->swap != swap`? */
>      } else {
>          /* Do we need any rounding here? */
>          /* eg. swap.val = round_down(swap.val, 1 << folio_order(folio)) */
>          /* Could be helpful */
>      }
> } else if (order < folio_order(folio)) {
>      swap.val = round_down(swap.val, 1 << folio_order(folio));
> }
> 
> I was scratching my head in the midnight to figure out if we
> need a round down in the /* Do we need any rounding here */ part.
> 
> And it seems, we don't? There could be a lot of races, but because
> shmem_split_swap_entry is now actually
> guarded by swap cache (or swap_map's HAS_CACHE) now: to split an
> index, we must load the folio in the swap cache (or the HAS_CACHE bit)
> first now. So if a large folio is loaded here, the underlying entries
> must remain un-splitted, as it prevents any parallel swapin for
> entries is covered.

At least in this patch, I think we do not need a round down in the /* Do 
we need any rounding here */ part.

Because concurrent swapin races always exist, we need to ensure that the 
folio can be correctly inserted into the shmem mapping. Moreover, the 
checks on ‘swap.val’, shmem_split_swap_entry(), and 
shmem_add_to_page_cache() all have some race condition checks to prevent 
errors, and will refault to fix the race issue.

Therefore, for this uncommon race issue, if there's no need to add 
additional complex logic, I prefer to leverage the current race checking 
mechanism to refault to address the race issues. Unless an issue arises 
that cannot be resolved by refault, as described in your patch 1.

> But this also requires us to call shmem_split_swap_entry with the
> right swap and index value covered by the folio (if not, it's still
> OK, just redundant split or redundant fault in the worst case it
> seems, this clean up can be done later instead).
> 
> But there is still a missing issue that I posted previously, it really
> should do a ealy fixup of the swap entry for the cached swapin in this
> patch (it's delayed to the final patch in this series):
> 
> So the shmem_swapin_cluster call should be:
> 
> /* Cached swapin currently only supports order 0 swapin */
> offset = index - round_down(index, 1 << order);
> folio = shmem_swapin_cluster(swp_entry(swp_type(swap),
> swp_offset(swap) + offset), gfp, info, index);

Actually, this race will be checked, and a refault will fix it. Yeah, 
this needs an extra refault, but can this really cause a real issue in 
the real products?

> So far I think it's enough for this patch now. I can send a V4 to
> keep this part's change as minimized as possible, but in later commits
> things may still have to change a bit... especially for avoiding
> redundant calculation of offset and swap, or minimizing the overhead,
> ensuring shmem_split_swap_entry is called with the right value to
> avoid re-faults.

Yes. This patch is for cleanup, so we should not add more changes to 
avoid refaults. :)

And We can discuss in your following patches whether it is worth 
avoiding some uncommon refaults, especially when complex logic needs to 
be added.

> I'll try my best to keep this part as unchanged as possible, but I do find it
> somehow harder to track as the swapin path gets more refactors.
> 
> My bad for making it confusing in the first place, the patches are
> still not very well-splitted enough for easier reviewing I think,
> please have my apologies if this is causing any inconvenience for you.

No worries:) I think your patches are on the right direction (I 
originally wanted to do some cleanup of the swapin logic as well). I am 
happy to help review and test your patches.
