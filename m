Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936AEEAA
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750296737; cv=none; b=mBkvew5vNG95cp7ldmW4UFeWq4MG71HSCGwsg6rgp4oSHuPwG2dy0kup5ZP1Lnzo6oux2XS2okAokixznOLrFQYDKf49PEf0Tdmf6yJBRZ7umFr4A6J8sPzCNXxqeoIcmNF+n/cxO4kvS58EnS81WIWFsVFBOm6O7cj8WQT0FZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750296737; c=relaxed/simple;
	bh=tiQTPJwU42w15Bb+96EeL5DmVNEMekoqUg1Mf+e8X7A=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=lRhgznocfH/SXPu8AHZxsw6Ydc3ZWseUq8dN4A6HnXA2VdHLurYbrnOaz/Jkv0TchiXvrf726AC+80MqwYW+bXLEBrA437zzJHzKs9aFq8U8HbUCcdWCHs4OloQuUKnJlae1aj30YSnU0QCSRm9GakCm4UQ3YpQbhdKfCJt9u+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bN34Z3lyQzYQtLx
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:32:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 783F51A0AD9
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:32:13 +0800 (CST)
Received: from [10.174.99.169] (unknown [10.174.99.169])
	by APP2 (Coremail) with SMTP id Syh0CgA39GacaFNod99QPw--.20796S2;
	Thu, 19 Jun 2025 09:32:13 +0800 (CST)
Subject: Re: [PATCH 3/4] mm/shmem, swap: improve mthp swapin process
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Matthew Wilcox <willy@infradead.org>,
 Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250617183503.10527-1-ryncsn@gmail.com>
 <20250617183503.10527-4-ryncsn@gmail.com>
 <7e680582-ac35-3d2d-8945-c26410ff4f9b@huaweicloud.com>
 <CAMgjq7DuFfikzzDeQPmBTnqUxprbGFfjL4tt5_ZJeZS_GP4ggg@mail.gmail.com>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <7a168a7b-2b4b-4281-777b-96f952322237@huaweicloud.com>
Date: Thu, 19 Jun 2025 09:32:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMgjq7DuFfikzzDeQPmBTnqUxprbGFfjL4tt5_ZJeZS_GP4ggg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgA39GacaFNod99QPw--.20796S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFyrZw45Xw18Cw4xCF4DArb_yoW5CF1fpF
	WSg3ZakFWkXrW2kr1aq3Wjqrn8K34xtF48Ja9rJw45Zas0kr12kr1Utw18uFyUArZ3A3yI
	vF4UWF9I93Z8t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUrsqXDUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 6/18/2025 4:46 PM, Kairui Song wrote:
> On Wed, Jun 18, 2025 at 4:26 PM Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>> on 6/18/2025 2:35 AM, Kairui Song wrote:
>>> From: Kairui Song <kasong@tencent.com>
>>>
>>> Tidy up the mTHP swapin workflow. There should be no feature change, but
>>> consolidates the mTHP related check to one place so they are now all
>>> wrapped by CONFIG_TRANSPARENT_HUGEPAGE, and will be trimmed off by
>>> compiler if not needed.
>>>
>>> Signed-off-by: Kairui Song <kasong@tencent.com>
>>> ---
>>>  mm/shmem.c | 175 ++++++++++++++++++++++++-----------------------------
>>>  1 file changed, 78 insertions(+), 97 deletions(-)
>>>
>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>
>> ...
>>
>> Hello, here is another potensial issue if shmem swapin can race with folio
>> split.
>>
>>>  alloced:
>>> +     /*
>>> +      * We need to split an existing large entry if swapin brought in a
>>> +      * smaller folio due to various of reasons.
>>> +      *
>>> +      * And worth noting there is a special case: if there is a smaller
>>> +      * cached folio that covers @swap, but not @index (it only covers
>>> +      * first few sub entries of the large entry, but @index points to
>>> +      * later parts), the swap cache lookup will still see this folio,
>>> +      * And we need to split the large entry here. Later checks will fail,
>>> +      * as it can't satisfy the swap requirement, and we will retry
>>> +      * the swapin from beginning.
>>> +      */
>>> +     swap_order = folio_order(folio);
>>> +     if (order > swap_order) {
>>> +             error = shmem_split_swap_entry(inode, index, swap, gfp);
>>> +             if (error)
>>> +                     goto failed_nolock;
>>> +     }
>>> +
>>> +     index = round_down(index, 1 << swap_order);
>>> +     swap.val = round_down(swap.val, 1 << swap_order);
>>> +
>> /* suppose folio is splited */
>>>       /* We have to do this with folio locked to prevent races */
>>>       folio_lock(folio);
>>>       if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
>>>           folio->swap.val != swap.val) {
>>>               error = -EEXIST;
>>> -             goto unlock;
>>> +             goto failed_unlock;
>>>       }
>>>       if (!folio_test_uptodate(folio)) {
>>>               error = -EIO;
>>> @@ -2407,8 +2386,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>>>                       goto failed;
>>>       }
>>>
>>> -     error = shmem_add_to_page_cache(folio, mapping,
>>> -                                     round_down(index, nr_pages),
>>> +     error = shmem_add_to_page_cache(folio, mapping, index,
>>>                                       swp_to_radix_entry(swap), gfp);
>>
>> The actual order swapin is less than swap_order and the swap-in folio
>> may not cover index from caller.
>>
>> So we should move the index and swap.val calculation after folio is
>> locked.
> 
> Hi, Thanks very much for checking the code carefully!
> 
> If I'm not wrong here, holding a reference is enough to stabilize the folio
> order.
> See split_huge_page_to_list_to_order, "Any unexpected folio references
> ...  -EAGAIN" and can_split_folio.
Thanks for feedback, then the change looks good to me.

Reviewed-by: Kemeng Shi <shikemeng@huaweicloud.com>
> 
> We can add a `swap_order == folio_order(folio)` check after folio lock
> though, as a (sanity) check, just in case.
> 

