Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C51178F44
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994328; cv=none; b=nPDNMoRKCi81cM8vxHw4ufozK4epUu03hKCM2gdqU5G3KW4CyXr21pnloHerfN6Lw4u76l5xX9mahclVwJ4rqiQMrZp1WixeSSOxyzrsZvmI/lD1cshkNH7+nOCSwzWuyepYfr5CQtbsjtJ8x+pjGL2ixbUE4oDE3OOuGNebaEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994328; c=relaxed/simple;
	bh=HDVBHBHdikDSxIEj/so+amEtljmfbP2qUbkYpvPgcVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4yjyFQJzrrJYwijvUZiuYhxnarrWD/9CdsT7FEFmhOSqy4cd5WC5doaxsFW7qR3Ei9zuMqBesOORgvEoIFPugJePaBeDCxdyz3anXQcCbA49jTvO0jywh5g8Q9p4ETNvbdKCOR4ou5UDVanz3srflgD5z+A1r9z0JsQLW9sy+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B8C7106F;
	Tue, 29 Apr 2025 23:25:18 -0700 (PDT)
Received: from [10.163.79.251] (unknown [10.163.79.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FA0F3F66E;
	Tue, 29 Apr 2025 23:25:15 -0700 (PDT)
Message-ID: <f52746e9-f57a-4e65-af48-f5de3c5887c6@arm.com>
Date: Wed, 30 Apr 2025 11:55:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/04/25 7:22 pm, Lorenzo Stoakes wrote:
> On Tue, Apr 29, 2025 at 10:53:32AM +0530, Dev Jain wrote:
>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>> Architecture can override these helpers.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..ed287289335f 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>   }
>>   #endif
>>
>> +/* See the comment for ptep_modify_prot_start */
> 
> I feel like you really should add a little more here, perhaps point out
> that it's batched etc.

Sure. I couldn't easily figure out a way to write the documentation 
nicely, I'll do it this time.

> 
>> +#ifndef modify_prot_start_ptes
>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
> 
> This name is a bit confusing, it's not any ptes, it's those pte entries
> belonging to a large folio capped to the PTE table right that you are
> batching right?

yes, but I am just following the convention. See wrprotect_ptes(), etc. 
I don't have a strong preference anyways.

> 
> Perhaps modify_prot_start_large_folio() ? Or something with 'batched' in
> the name?

How about modify_prot_start_batched_ptes()?

> 
> We definitely need to mention in comment or name or _somewhere_ the intent
> and motivation for this.
> 
>> +{
>> +	pte_t pte, tmp_pte;
>> +
> 
> are we not validating what 'nr' is? Even with debug asserts? I'm not sure I
> love this interface, where you require the user to know the number of
> remaining PTE entries in a PTE table.

Shall I write in the comments that the range is supposed to be within a 
PTE table?

> 
>> +	pte = ptep_modify_prot_start(vma, addr, ptep);
>> +	while (--nr) {
> 
> This loop is a bit horrible. It seems needlessly confusing and you're in
> _dire_ need of comments to explain what's going on.

Again, following the pattern of get_and_clear_full_ptes :)
> 
> So my understanding is, you have the user figure out:
> 
> nr = min(nr_pte_entries_in_pte, nr_pgs_in_folio)
> 
> Then, you want to return the pte entry belonging to the start of the large
> folio batch, but you want to adjust that pte value to propagate dirty and
> young page table flags if any page table entries within the range contain
> those page table flags, having called ptep_modify_prot_start() on all of
> them?
> 
> This is quite a bit to a. put in a header like this and b. not
> comment/explain.
> 
> So maybe something like:
> 
> pte = ptep_modify_prot_start(vma, addr, ptep);
> 
> /* Iterate through large folio tail PTEs. */
> for (pg = 1; pg < nr; pg++) {
> 	pte_t inner_pte;
> 
> 	ptep++;
> 	addr += PAGE_SIZE;
> 
> 	inner_pte = ptep_modify_prot_start(vma, addr, ptep);
> 
> 	/* We must propagate A/D state from tail PTEs. */
> 	if (pte_dirty(inner_pte))
> 		pte = pte_mkdirty(pte);
> 	if (pte_young(inner_pte))
> 		pte = pte_mkyoung(pte);
> }
> 
> Would work better?

No preference, I'll do this then.

> 
> 
> 
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> 
> 
> 
>> +		if (pte_dirty(tmp_pte))
>> +			pte = pte_mkdirty(pte);
>> +		if (pte_young(tmp_pte))
>> +			pte = pte_mkyoung(pte);
> 
> Why are you propagating these?

Because the a/d bits are per-folio; and, this will help us batch around 
can_change_pte_writable (return pte_dirty(pte)) and, batch around 
pte_needs_flush() for parisc.

> 
>> +	}
>> +	return pte;
>> +}
>> +#endif
>> +
>> +/* See the comment for ptep_modify_prot_commit */
> 
> Same comments as above, needs more meat on the bones!
> 
>> +#ifndef modify_prot_commit_ptes
>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> 
> Again need to reference large folio, batched or something relevant here,
> 'ptes' is super vague.
> 
>> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> 
> Nit, but you put 'p' suffix on ptep but not on 'old_pte'?

Because ptep is a pointer, and old_pte isn't.

> 
> I'm even more concerned about the 'nr' API here now.
> 
> So this is now a user-calculated:
> 
> min3(large_folio_pages, number of pte entries left in ptep,
> 	number of pte entries left in old_pte)
> 
> It really feels like something that should be calculated here, or at least
> be broken out more clearly.
> 
> You definitely _at the very least_ need to document it in a comment.
> 
>> +{
>> +	for (;;) {
>> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>> +		if (--nr == 0)
>> +			break;
> 
> Why are you doing an infinite loop here with a break like this? Again feels
> needlessly confusing.

Following wrprotect_ptes().
I agree that this is confusing, which is why I thought why it was done 
in the first place :) but I just followed what already is.
I'll change this to a simple for loop if that is your inclination.

> 
> I think it's ok to duplicate this single line for the sake of clarity,
> also.
> 
> Which gives us:
> 
> unsigned long pg;
> 
> ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> for (pg = 1; pg < nr; pg++) {
> 	ptep++;
> 	addr += PAGE_SIZE;
> 	old_pte = pte_next_pfn(old_pte);
> 	pte = pte_next_pfn(pte);
> 
> 	ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> }
> 
> There are alternative approaches, but I think doing an infinite loop that
> breaks and especially the confusing 'if (--foo) break;' stuff is much
> harder to parse than a super simple ranged loop.
> 
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		old_pte = pte_next_pfn(old_pte);
>> +		pte = pte_next_pfn(pte);
>> +	}
>> +}
>> +#endif
>> +
>>   /*
>>    * On some architectures hardware does not set page access bit when accessing
>>    * memory page, it is responsibility of software setting this bit. It brings
>> --
>> 2.30.2
>>

