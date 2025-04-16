Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1F17BBF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788804; cv=none; b=NyrJY44lfDEt7gJZl5O2HBEf6nh3kMEO40K7HkKEE6SqwMegqMWyZa88zBIakWSxMq/FOIPd4efUYLdYxx8w8/HIXBf24WzE7r2+Uc2ig83n1misARBYwIqzI2CbSsrwTb/JbM+TCnDD07ZbkiWBSpaAriA82LsXX7yH/FGJ4sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788804; c=relaxed/simple;
	bh=SYxcCaT0DDUgcv8Ac2ToVBGEs/r1T1o3kKXlbfvhcTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Owl2mKKtAk9epE8x36ik172RyikBPE7jow4htP/yAVywu0yeRoVGZEodrUA8SKY+ES2e8MeqgQoiqFRaP4tTbvSxDq4hhH1FZyaGg4UrDVXmCiEUrcY7pC3rWPjvFBY4m24QE1YLQfLoFaMYxJLe4WidrXbZ37DaBPEsoGiwdcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cIWiJfXu; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cIWiJfXu"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744788792; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ppJPBuDksNCAtKuglT45gt364FEpjlLU/EygbbDtpIs=;
	b=cIWiJfXuQMxYpAI+RjdLQiQ6ReW9II4j3pek1Zd+ziJvrnbfeaTvp/osXbeivNFnKuZC3yb5SrgM6oqeCd2L45ggM5bPWCbf4zFY8P5q4suWan7LWjV10nV7wgsWv6/S07MbuSVECNS6Hi8mCWDpr5OI9Ni7jrl1U2Ex46sa8ds=
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WX85919_1744788789 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Apr 2025 15:33:10 +0800
Message-ID: <fa4ee2f1-223d-4af3-8e3e-a1371688a548@linux.alibaba.com>
Date: Wed, 16 Apr 2025 15:33:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
To: Dev Jain <dev.jain@arm.com>, David Hildenbrand <david@redhat.com>,
 akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hughd@google.com, vishal.moola@gmail.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250411081301.8533-1-dev.jain@arm.com>
 <09c77ab5-65fc-4bca-a7e5-2b11bba9330d@redhat.com>
 <9ed4c113-37eb-4e3d-98a1-f46f786aaea9@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <9ed4c113-37eb-4e3d-98a1-f46f786aaea9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/15 19:47, Dev Jain wrote:
> 
> 
> On 15/04/25 3:47 pm, David Hildenbrand wrote:
>> On 11.04.25 10:13, Dev Jain wrote:
>>> After the check for queue_folio_required(), the code only cares about 
>>> the
>>> folio in the for loop, i.e the PTEs are redundant. Therefore, 
>>> optimize this
>>> loop by skipping over a PTE batch mapping the same folio.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>> Unfortunately I have only build tested this since my test environment is
>>> broken.
>>>
>>>   mm/mempolicy.c | 12 +++++++++++-
>>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>> index b28a1e6ae096..b019524da8a2 100644
>>> --- a/mm/mempolicy.c
>>> +++ b/mm/mempolicy.c
>>> @@ -573,6 +573,9 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>> unsigned long addr,
>>>       pte_t *pte, *mapped_pte;
>>>       pte_t ptent;
>>>       spinlock_t *ptl;
>>> +    int max_nr;
>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> +    int nr = 1;
>>
>> Try sticking to reverse xmas tree, please. (not completely the case 
>> here, but fpb_flags can easily be moved all he way to the top)
> 
> I thought that the initializations were to be kept at the bottom.
> Asking for future patches, should I put all declarations in reverse-xmas 
> fashion (even those which I don't intend to touch w.r.t the patch 
> logic), or do I do that for only my additions?
> 
>>
>> Also, why are you initializing nr to 1 here if you reinitialize it below?
> 
> Yup no need, I thought pte += nr will blow up due to nr not being 
> initialized, but it won't because it gets executed just before the start 
> of the second iteration.
> 
>>
>>  >       ptl = pmd_trans_huge_lock(pmd, vma);>       if (ptl) {
>>> @@ -586,7 +589,8 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>> unsigned long addr,
>>>           walk->action = ACTION_AGAIN;
>>>           return 0;
>>>       }
>>  > -    for (; addr != end; pte++, addr += PAGE_SIZE) {> +    for (; 
>> addr != end; pte += nr, addr += nr * PAGE_SIZE) {
>>> +        nr = 1;
>>>           ptent = ptep_get(pte);
>>>           if (pte_none(ptent))
>>>               continue;
>>> @@ -607,6 +611,11 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>> unsigned long addr,
>>>           if (!queue_folio_required(folio, qp))
>>>               continue;
>>>           if (folio_test_large(folio)) {
>>> +            max_nr = (end - addr) >> PAGE_SHIFT;
>>> +            if (max_nr != 1)
>>> +                nr = folio_pte_batch(folio, addr, pte, ptent,
>>> +                             max_nr, fpb_flags,
>>> +                             NULL, NULL, NULL);
>>
>> We should probably do that immediately after we verified that 
>> vm_normal_folio() have us something reasonable.
> 
> But shouldn't we keep the small folio case separate to avoid the 
> overhead of folio_pte_batch()?
> 
>>
>>>               /*
>>>                * A large folio can only be isolated from LRU once,
>>>                * but may be mapped by many PTEs (and Copy-On-Write may
>>> @@ -633,6 +642,7 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>> unsigned long addr,
>>>               qp->nr_failed++;
>>>               if (strictly_unmovable(flags))
>>>                   break;
>>> +            qp->nr_failed += nr - 1;
>>
>> Can't we do qp->nr_failed += nr; above?
> 
> I did not dive deep into the significance of nr_failed, but I did that
> to keep the code, before and after the change, equivalent:
> 
> Claim: if we reach qp->nr_failed++ for a single pte, we will reach here 
> for all ptes belonging to the same batch.

Sorry, I missed the previous discussion (I replied to your new version). 
I think this claim is incorrect, we will skip remaining ptes belonging 
to the same batch with checking 'qp->large'.

		if (folio_test_large(folio)) {
			if (folio == qp->large)
				continue;
			qp->large = folio;
		}
