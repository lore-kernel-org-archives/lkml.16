Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE24B202981
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275918; cv=none; b=j7EPszWWJhLyq0g7YgbhcVA7nnAW2wVWc1frTtUR17NENUmnOerQ/jcOKLQ78FxUNKJgDQBqIO09kwW0U8KJQzmc63VXU2ZOCSOp16R/JwH4PNkF9ZPb0hFBAB+3uryksilIrB5B9t7KJcDPNuzEc9CeoGzVMROXvepwFRKIsf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275918; c=relaxed/simple;
	bh=HxRBfPeGHnl9Dd78NQtATATjsDxxdDinfbLyKf4QK0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cn39YA9Uq6pG6g5qLQO0mPdZVEtoAYK5NiH6Cdh5fr4nN8jyMb5QbXwriNNmt1XOYPvfeI0Ehhqk2wE/89G4CTFPytXXxI1gmhbYPeL0o+BHvzBzLC9oaNrg814jiIN6niQGYzSN/icgE+IlmubryjBiwUPeKyD4mlaQpDQAClA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ENroYdrr; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ENroYdrr"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744275906; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=PFk+KrYiLK5TPKtYUz6wWoaE4cbubrT8jUHqRNUo/jE=;
	b=ENroYdrrBGGPiWaT6yLkunNpfkDq/hvXO04OvN32jLsO6Y5jc3UdYxKjXbdwlienX7yR0pwaRXpYhlmLgzY01az5BTdjTB9OcNt7YBzlB/9dce7eEpSjLShIotlZSYfxP1/AfM02nwp0VE+jOZzcJSqg1DU0WXWoJhWZwRLf0bc=
Received: from 30.74.144.106(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WWOJ9H4_1744275905 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Apr 2025 17:05:05 +0800
Message-ID: <5c52b67a-8e7e-4dd7-9127-96944715d883@linux.alibaba.com>
Date: Thu, 10 Apr 2025 17:05:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wnvWmOz-FNvYzkqEW1kz0UCfzythbeJSbSyWy_=ib5MA@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4wnvWmOz-FNvYzkqEW1kz0UCfzythbeJSbSyWy_=ib5MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/10 16:14, Barry Song wrote:
> On Wed, Apr 9, 2025 at 1:16 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> When investigating performance issues during file folio unmap, I noticed some
>> behavioral differences in handling non-PMD-sized folios and PMD-sized folios.
>> For non-PMD-sized file folios, it will call folio_mark_accessed() to mark the
>> folio as having seen activity, but this is not done for PMD-sized folios.
>>
>> This might not cause obvious issues, but a potential problem could be that,
>> it might lead to more frequent refaults of PMD-sized file folios under memory
>> pressure. Therefore, I am unsure whether the folio_mark_accessed() should be
>> added for PMD-sized file folios?
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   mm/huge_memory.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 6ac6d468af0d..b3ade7ac5bbf 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>                                  zap_deposited_table(tlb->mm, pmd);
>>                          add_mm_counter(tlb->mm, mm_counter_file(folio),
>>                                         -HPAGE_PMD_NR);
>> +
>> +                       if (flush_needed && pmd_young(orig_pmd) &&
>> +                           likely(vma_has_recency(vma)))
>> +                               folio_mark_accessed(folio);
> 
> Acked-by: Barry Song <baohua@kernel.org>

Thanks.

> I also came across an interesting observation: on a memory-limited system,
> demoting unmapped file folios in the LRU—specifically when their mapcount
> drops from 1 to 0—can actually improve performance.

These file folios are used only once? Can folio_set_dropbehind() be used 
to optimize it, which can avoid the LRU activity movement in 
folio_mark_accessed()?

> If others have observed the same behavior, we might not need to mark them
> as accessed in that scenario.
> 
>>                  }
>>
>>                  spin_unlock(ptl);
>> --
>> 2.43.5
>>
> 
> Thanks
> barry
