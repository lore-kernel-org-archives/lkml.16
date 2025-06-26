Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950FD206F23
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925708; cv=none; b=ec8Cxs7OZQ3zsk8TGsNznm07MzgCNvE+VbTzGz4sWOlBAF5rpSsSyqCicY215EFvJjK7+VRpI5DVjgksgDGFUzvxXpQ4mZiYoG+B00hx8uuqiu8BFPt3IhRKIQ50hHk73bkHQb2V2LJ96iW+6a6Lsm7pe4SA/BEBvvGAKrmkXJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925708; c=relaxed/simple;
	bh=Hak0h+hHjUBn9iZdQes8cwunourgR6ToM8t8s3LGr7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWJYVjOXF9V+8ZzQfCZn6085oUUBnmdozSr7lxpnJUtMxmzrkmwOgO2uXKt+oWweUZprxUjj4ysmDoMXzUJ7SxwbNyrXeVmghuqKYlp5f2YnIW/MzydzDHn70Et6VsWpG9UcLHfBsbXp3kUS5ef0MFHTjqMmDP+11MogC/UEaP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 143371063;
	Thu, 26 Jun 2025 01:14:48 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97D7B3F58B;
	Thu, 26 Jun 2025 01:15:02 -0700 (PDT)
Message-ID: <48400a85-3f0f-4b4c-81aa-0e7d1dc14c9d@arm.com>
Date: Thu, 26 Jun 2025 09:15:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <1bb09534-56bd-4aba-b7e8-dad8bf6e9200@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <1bb09534-56bd-4aba-b7e8-dad8bf6e9200@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2025 06:47, Dev Jain wrote:
> 
> On 13/06/25 7:13 pm, Dev Jain wrote:
>> arm64 currently changes permissions on vmalloc objects locklessly, via
>> apply_to_page_range, whose limitation is to deny changing permissions for
>> block mappings. Therefore, we move away to use the generic pagewalk API,
>> thus paving the path for enabling huge mappings by default on kernel space
>> mappings, thus leading to more efficient TLB usage. However, the API
>> currently enforces the init_mm.mmap_lock to be held. To avoid the
>> unnecessary bottleneck of the mmap_lock for our usecase, this patch
>> extends this generic API to be used locklessly, so as to retain the
>> existing behaviour for changing permissions. Apart from this reason, it is
>> noted at [1] that KFENCE can manipulate kernel pgtable entries during
>> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
>> This being a non-sleepable context, we cannot take the init_mm mmap lock.
>>
>> Add comments to highlight the conditions under which we can use the
>> lockless variant - no underlying VMA, and the user having exclusive control
>> over the range, thus guaranteeing no concurrent access.
>>
>> Since arm64 cannot handle kernel live mapping splitting without BBML2,
>> we require that the start and end of a given range lie on block mapping
>> boundaries. Return -EINVAL in case a partial block mapping is detected;
>> add a corresponding comment in ___change_memory_common() to warn that
>> eliminating such a condition is the responsibility of the caller.
>>
>> apply_to_page_range() currently performs all pte level callbacks while in
>> lazy mmu mode. Since arm64 can optimize performance by batching barriers
>> when modifying kernel pgtables in lazy mmu mode, we would like to continue
>> to benefit from this optimisation. Unfortunately walk_kernel_page_table_range()
>> does not use lazy mmu mode. However, since the pagewalk framework is not
>> allocating any memory, we can safely bracket the whole operation inside
>> lazy mmu mode ourselves. Therefore, wrap the call to
>> walk_kernel_page_table_range() with the lazy MMU helpers.
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-
>> ae8a-7c48d26a927e@arm.com/
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/mm/pageattr.c | 157 +++++++++++++++++++++++++++++++--------
>>   include/linux/pagewalk.h |   3 +
>>   mm/pagewalk.c            |  26 +++++++
>>   3 files changed, 154 insertions(+), 32 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 04d4a8f676db..cfc5279f27a2 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/mem_encrypt.h>
>>   #include <linux/sched.h>
>>   #include <linux/vmalloc.h>
>> +#include <linux/pagewalk.h>
>>     #include <asm/cacheflush.h>
>>   #include <asm/pgtable-prot.h>
>> @@ -20,6 +21,99 @@ struct page_change_data {
>>       pgprot_t clear_mask;
>>   };
>>   +static ptdesc_t set_pageattr_masks(ptdesc_t val, struct mm_walk *walk)
>> +{
>> +    struct page_change_data *masks = walk->private;
>> +
>> +    val &= ~(pgprot_val(masks->clear_mask));
>> +    val |= (pgprot_val(masks->set_mask));
>> +
>> +    return val;
>> +}
>> +
>> +static int pageattr_pgd_entry(pgd_t *pgd, unsigned long addr,
>> +                  unsigned long next, struct mm_walk *walk)
>> +{
>> +    pgd_t val = pgdp_get(pgd);
>> +
>> +    if (pgd_leaf(val)) {
>> +        if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
>> +            return -EINVAL;
>> +        val = __pgd(set_pageattr_masks(pgd_val(val), walk));
>> +        set_pgd(pgd, val);
>> +        walk->action = ACTION_CONTINUE;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
>> +                  unsigned long next, struct mm_walk *walk)
>> +{
>> +    p4d_t val = p4dp_get(p4d);
>> +
>> +    if (p4d_leaf(val)) {
>> +        if (WARN_ON_ONCE((next - addr) != P4D_SIZE))
>> +            return -EINVAL;
>> +        val = __p4d(set_pageattr_masks(p4d_val(val), walk));
>> +        set_p4d(p4d, val);
>> +        walk->action = ACTION_CONTINUE;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
>> +                  unsigned long next, struct mm_walk *walk)
>> +{
>> +    pud_t val = pudp_get(pud);
>> +
>> +    if (pud_leaf(val)) {
>> +        if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
>> +            return -EINVAL;
>> +        val = __pud(set_pageattr_masks(pud_val(val), walk));
>> +        set_pud(pud, val);
>> +        walk->action = ACTION_CONTINUE;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
>> +                  unsigned long next, struct mm_walk *walk)
>> +{
>> +    pmd_t val = pmdp_get(pmd);
>> +
>> +    if (pmd_leaf(val)) {
>> +        if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
>> +            return -EINVAL;
>> +        val = __pmd(set_pageattr_masks(pmd_val(val), walk));
>> +        set_pmd(pmd, val);
>> +        walk->action = ACTION_CONTINUE;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
>> +                  unsigned long next, struct mm_walk *walk)
>> +{
>> +    pte_t val = __ptep_get(pte);
>> +
>> +    val = __pte(set_pageattr_masks(pte_val(val), walk));
>> +    __set_pte(pte, val);
>> +
>> +    return 0;
>> +}
> 
> I was wondering, now that we have vmalloc contpte support,
> do we need to ensure in this pte level callback that
> we don't partially cover a contpte block?

Yes good point!

