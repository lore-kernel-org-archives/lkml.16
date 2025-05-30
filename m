Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19597145348
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748607134; cv=none; b=rhvT0aNvgfd09vvuzZmwDFZHuEUghFVaXEnFgDMyWaozJqAldmCw/z1D6bw8Tcf7Efq7CSmhd+fbq7MGt72oN5skLEN2dB5YpK5CvBi9SSxbm/hwa3NlhFMrEZzpav2a8icpFuf2vAJ9Y9RE0GKG9Q2FBFLDX1KTt3mhB/xnd+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748607134; c=relaxed/simple;
	bh=D19qPlErIH+SCrDxKasrN1547X95980IAEhwTdDxYyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4Lkt3aC37BUO5ce6itZLDsLKS+QIrzIv9Nb76HYIZtJzg6JKARdorwQKistc1V0DT/KaEwvNZYUoM3D0J0Ym50z1spCy0vcCEbU/RgllkQo8/df5tkriv4v2vuWmZTsYblxvhjhLZgfIkn1HnXDAfLgTlAQDHzSAYTe0kpZ7lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C929016F2;
	Fri, 30 May 2025 05:11:54 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B53C43F673;
	Fri, 30 May 2025 05:12:08 -0700 (PDT)
Message-ID: <976b1f4a-3b5e-4978-9ea4-ff4867094f7d@arm.com>
Date: Fri, 30 May 2025 13:12:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm/pagewalk: Add pre/post_pte_table callback for lazy
 MMU on arm64
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-4-dev.jain@arm.com>
 <7b4360a0-42ef-45ab-9e63-eace52943529@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <7b4360a0-42ef-45ab-9e63-eace52943529@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2025 12:14, Lorenzo Stoakes wrote:
> On Fri, May 30, 2025 at 02:34:07PM +0530, Dev Jain wrote:
>> arm64 implements lazy_mmu_mode to allow deferral and batching of barriers
>> when updating kernel PTEs, which provides a nice performance boost. arm64
>> currently uses apply_to_page_range() to modify kernel PTE permissions,
>> which runs inside lazy_mmu_mode. So to prevent a performance regression,
>> let's add hooks to walk_page_range_novma() to allow continued use of
>> lazy_mmu_mode.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> Credits to Ryan for the patch description.
>>
>>  arch/arm64/mm/pageattr.c | 12 ++++++++++++
>>  include/linux/pagewalk.h |  2 ++
>>  mm/pagewalk.c            |  6 ++++++
>>  3 files changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index a5c829c64969..9163324b12a0 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -75,11 +75,23 @@ static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
>>  	return 0;
>>  }
>>
>> +static void pte_lazy_mmu_enter(void)
>> +{
>> +	arch_enter_lazy_mmu_mode();
>> +}
> 
> Hm am I missing something? I don't see this function or the leave version
> defined in arch/arm64?
> 
> No do I see __HAVE_ARCH_ENTER_LAZY_MMU_MODE?

arm64 is starting to use lazy_mmu_mode from v6.16 - the changes are in Linus's tree.

> 
>> +
>> +static void pte_lazy_mmu_leave(void)
>> +{
>> +	arch_leave_lazy_mmu_mode();
>> +}
> 
> Are you absolutely sure you will never need to hook this stuff on higher level
> page tables?
> 
> If this relates to vmalloc, then we do have huge page mappings in vmalloc logic?

The performance advantage (for arm64's usage at least) really only (currently)
beneficial in practice to PTE level since we can reduce barriers by 512x. And
apply_to_page_range() was only using lazy mmu for the pte level anyway.

But actually I think we can do better here...

> 
>> +
>>  static const struct mm_walk_ops pageattr_ops = {
>>  	.pud_entry	= pageattr_pud_entry,
>>  	.pmd_entry	= pageattr_pmd_entry,
>>  	.pte_entry	= pageattr_pte_entry,
>>  	.walk_lock	= PGWALK_NOLOCK,
>> +	.pre_pte_table	= pte_lazy_mmu_enter,
>> +	.post_pte_table	= pte_lazy_mmu_leave,
> 
> This is kind of horrid really, are we sure the lazy mmu mode is valid for
> everything that occurs within the the loop? I suppose it's only simple logic for
> the ops->pte_entry stuff.
> 
> But it feels like hacking something in for this specific case.
> 
> At the same time I don't want to get in the way of an optimisation. We could do
> something in ops->pmd_entry, but then we'd not get to turn it off afterwards...
> 
> Same for any higher level page table hm.
> 
> Is this really the only way to get this? I guess it's not feasible having this
> just switched on for the whole operation...

...I think you're right. The only reason we traditionally confine the lazy mmu
mode to a single page table is because we want to enclose it within the PTL. But
that requirement doesn't stand for kernel mappings. As long as the walker can
guarrantee that it doesn't allocate any memory (because with certain debug
settings that can cause lazy mmu nesting) or try to sleep then I think we can
just bracket the whole walk_page_range_novma() call.

So I think we can avoid these new callbacks and just do:

arch_enter_lazy_mmu_mode()
walk_page_range_novma()
arch_leave_lazy_mmu_mode()

That will even give us the benefit of optimizing at PMD/PUD levels.


> 
> I just fear that we could end up populating these mm_walk_ops with every corner
> case thing we think of.
> 
>>  };
>>
>>  bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
>> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
>> index 9bc8853ed3de..2157d345974c 100644
>> --- a/include/linux/pagewalk.h
>> +++ b/include/linux/pagewalk.h
>> @@ -88,6 +88,8 @@ struct mm_walk_ops {
>>  	int (*pre_vma)(unsigned long start, unsigned long end,
>>  		       struct mm_walk *walk);
>>  	void (*post_vma)(struct mm_walk *walk);
>> +	void (*pre_pte_table)(void);
>> +	void (*post_pte_table)(void);

nit: If we did end up with this approach, I wonder if it's better to generalize
and call it pre_table() and post_table(), passing in a level param? In any case,
you'll at least want to pass the walk structure.

>>  	int (*install_pte)(unsigned long addr, unsigned long next,
>>  			   pte_t *ptep, struct mm_walk *walk);
>>  	enum page_walk_lock walk_lock;
>> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
>> index 9657cf4664b2..a441f5cbbc45 100644
>> --- a/mm/pagewalk.c
>> +++ b/mm/pagewalk.c
>> @@ -33,6 +33,9 @@ static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
>>  	const struct mm_walk_ops *ops = walk->ops;
>>  	int err = 0;
>>
>> +	if (walk->ops->pre_pte_table)
>> +		walk->ops->pre_pte_table();
> 
> NIT: you have 'ops' already, no need for walk-> :)
> 
>> +
>>  	for (;;) {
>>  		if (ops->install_pte && pte_none(ptep_get(pte))) {
>>  			pte_t new_pte;
>> @@ -56,6 +59,9 @@ static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
>>  		addr += PAGE_SIZE;
>>  		pte++;
>>  	}
>> +
>> +	if (walk->ops->post_pte_table)
>> +		walk->ops->post_pte_table();
> 
> NIT: same as above.
> 
>>  	return err;
>>  }
>>
>> --
>> 2.30.2
>>
> 
> 

