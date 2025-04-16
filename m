Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4296C1E5B7D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744779522; cv=none; b=ApFXykhtzNQFUyTrDhPNPPMC+nnQJUWSh73n4vTydiv9tFyXPv/DnR59CCvHjokiiQ2d1vf8B0FBB7KhYQ0ErsVTSSwM1HrGDaxYNQdhGDZT3LjlNAJ0LoPcKNgtWNxeOoNn+STzEvibedczB1eXnmyObE49NHB99ZU0gy39P3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744779522; c=relaxed/simple;
	bh=dEynR5itwbYP6G3nftRm9w5p5C/+FYmpdD+/2m+J2Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8XLlOdq13Gz4Qpwvo1+cVDaRfZLOzeIlgEN7SpuDZLK5A1QPyRE+6OnT0UP5b3oABsxQBn4OapmCficQdrVEQ8bx+tafz6NO1OYFesdAhohPJloptI/z9VCfLy1ZVmMulWXsattbbMNi7A7GLPlz9pJF0suvdo8MS8gkDJIyMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BD7D152B;
	Tue, 15 Apr 2025 21:58:36 -0700 (PDT)
Received: from [10.163.75.121] (unknown [10.163.75.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D15093F66E;
	Tue, 15 Apr 2025 21:58:33 -0700 (PDT)
Message-ID: <37d70e38-5da7-401a-a7d3-62b5d1aa4407@arm.com>
Date: Wed, 16 Apr 2025 10:28:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hughd@google.com, vishal.moola@gmail.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250415145731.86281-1-dev.jain@arm.com>
 <56d25bb1-c6ff-4e92-bbab-72c9eee8015a@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <56d25bb1-c6ff-4e92-bbab-72c9eee8015a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15/04/25 10:49 pm, David Hildenbrand wrote:
> On 15.04.25 16:57, Dev Jain wrote:
>> After the check for queue_folio_required(), the code only cares about the
>> folio in the for loop, i.e the PTEs are redundant. Therefore, optimize
>> this loop by skipping over a PTE batch mapping the same folio.
>>
>> With a test program migrating pages of the calling process, which 
>> includes
>> a mapped VMA of size 4GB with pte-mapped large folios of order-9, and
>> migrating once back and forth node-0 and node-1, the average execution
>> time reduces from 7.5 to 4 seconds, giving an approx 47% speedup.
>>
>> v1->v2:
>>   - Follow reverse xmas tree declarations
>>   - Don't initialize nr
>>   - Move folio_pte_batch() immediately after retrieving a normal folio
>>   - increment nr_failed in one shot
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mempolicy.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>> index b28a1e6ae096..ca90cdcd3207 100644
>> --- a/mm/mempolicy.c
>> +++ b/mm/mempolicy.c
>> @@ -566,6 +566,7 @@ static void queue_folios_pmd(pmd_t *pmd, struct 
>> mm_walk *walk)
>>   static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>>               unsigned long end, struct mm_walk *walk)
>>   {
>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>       struct vm_area_struct *vma = walk->vma;
>>       struct folio *folio;
>>       struct queue_pages *qp = walk->private;
>> @@ -573,6 +574,7 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>> unsigned long addr,
>>       pte_t *pte, *mapped_pte;
>>       pte_t ptent;
>>       spinlock_t *ptl;
>> +    int max_nr, nr;
>>       ptl = pmd_trans_huge_lock(pmd, vma);
>>       if (ptl) {
>> @@ -586,7 +588,8 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>> unsigned long addr,
>>           walk->action = ACTION_AGAIN;
>>           return 0;
>>       }
>> -    for (; addr != end; pte++, addr += PAGE_SIZE) {
>> +    for (; addr != end; pte += nr, addr += nr * PAGE_SIZE) {
>> +        nr = 1;
>>           ptent = ptep_get(pte);
>>           if (pte_none(ptent))
>>               continue;
>> @@ -598,6 +601,11 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>> unsigned long addr,
>>           folio = vm_normal_folio(vma, addr, ptent);
>>           if (!folio || folio_is_zone_device(folio))
>>               continue;
>> +        if (folio_test_large(folio) &&
>> +           (max_nr = ((end - addr) >> PAGE_SHIFT)) != 1)
> 
> That's real nasty :)
> 
> Let's simply do at the beginning of the loop:
> 
>      max_nr = (end - addr) >> PAGE_SHIFT;
>      nr = 1;
> 
> Then here
> 
> if (folio_test_large(folio) && max_nr != 1)
>      nr = ...
> 
> The compiler is smart enough to optimize the computation of values where 
> really required.

If that's the case, I'll change it, thanks.

> 
> With that
> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

> 
> Thanks!
> 

