Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F11BE65
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147983; cv=none; b=IvP39zp2BvSj+Jkfx+oL39E5qe12O0cTqPmKs8ArHBaQTkKh4yJpr8/hiCqUlN3ippyqZiSUcWyMPEBCea7po7IODY4251MXy0f9SfCYlNaUxOgSugww4iOlsoyi2ueUXRQgaY/mjCFceXTl+ybSEsrjnALPnPQLLSxODKP9ue0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147983; c=relaxed/simple;
	bh=yZ2rudRmr33RYh9OVOX8UzfJ/YJIWEg1jDmses83dhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhVbGAEbQeFihpyRm0y4NCisWl//uJnUny86G3viJTFLTfciXLNGDkHT1+2OJs9RiG5dg97CjSems6MoxmEq3YFmjS9mNNtTIZhMYakfYs/zFbzT0cuyB29UmLRwE62jITGkmUfgiK+Tey1DBM8QwYA/0sbCvzPwa5GtF5MTKOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D8DC15A1;
	Tue, 17 Jun 2025 01:12:38 -0700 (PDT)
Received: from [10.57.84.117] (unknown [10.57.84.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E31613F673;
	Tue, 17 Jun 2025 01:12:57 -0700 (PDT)
Message-ID: <f1876bc1-94f5-46d0-b51d-12537d979830@arm.com>
Date: Tue, 17 Jun 2025 09:12:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <5f7b0a4d-fb3f-43bc-9f2a-3951222cfff2@arm.com>
 <ec8a398c-727c-420a-9110-5362ce35f786@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ec8a398c-727c-420a-9110-5362ce35f786@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/06/2025 04:59, Dev Jain wrote:
> 
> On 17/06/25 8:24 am, Dev Jain wrote:
>>
>> On 16/06/25 11:37 pm, Ryan Roberts wrote:
>>> On 16/06/2025 11:33, Dev Jain wrote:
>>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>>> because an intermediate table may be removed, potentially causing the
>>>> ptdump code to dereference an invalid address. We want to be able to
>>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>>> between two different vm_structs; two vmalloc objects running this same
>>>> code path will point to different page tables, hence there is no race.
>>>>
>>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>>>> 512 times again via pmd_free_pte_page().
>>>>
>>>> We implement the locking mechanism using static keys, since the chance
>>>> of a race is very small. Observe that the synchronization is needed
>>>> to avoid the following race:
>>>>
>>>> CPU1                            CPU2
>>>>                         take reference of PMD table
>>>> pud_clear()
>>>> pte_free_kernel()
>>>>                         walk freed PMD table
>>>>
>>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>>>
>>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>>>> we are safe. If not, then the patched-in read and write locks help us
>>>> avoid the race.
>>>>
>>>> To implement the mechanism, we need the static key access from mmu.c and
>>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>>>> target in the Makefile, therefore we cannot initialize the key there, as
>>>> is being done, for example, in the static key implementation of
>>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>>>> the jump_label mechanism. Declare the key there and define the key to false
>>>> in mmu.c.
>>>>
>>>> No issues were observed with mm-selftests. No issues were observed while
>>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>>>> sysfs in a loop.
>>>>
>>>> v2->v3:
>>>>   - Use static key mechanism
>>>>
>>>> v1->v2:
>>>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>>>     the lock 512 times again via pmd_free_pte_page()
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>   arch/arm64/include/asm/cpufeature.h |  1 +
>>>>   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>>>   arch/arm64/mm/ptdump.c              |  5 +++
>>>>   3 files changed, 53 insertions(+), 4 deletions(-)
>>>>

[...]

>>>> +    pud_clear(pudp);
>>> How can this possibly be correct; you're clearing the pud without any
>>> synchronisation. So you could have this situation:
>>>
>>> CPU1 (vmalloc)            CPU2 (ptdump)
>>>
>>>                 static_branch_enable()
>>>                   mmap_write_lock()
>>>                     pud = pudp_get()
>>
>> When you do pudp_get(), you won't be dereferencing a NULL pointer.
>> pud_clear() will nullify the pud entry. So pudp_get() will boil
>> down to retrieving a NULL entry. Or, pudp_get() will retrieve an
>> entry pointing to the now isolated PMD table. Correct me if I am
>> wrong.
>>
>>> pud_free_pmd_page()
>>>    pud_clear()
>>>                     access the table pointed to by pud
>>>                     BANG!
> 
> I am also confused thoroughly now : ) This should not go bang as the
> 
> table pointed to by pud is still there, and our sequence guarantees that
> 
> if the ptdump walk is using the pmd table, then pud_free_pmd_page won't
> 
> free the PMD table yet.

You're right... I'm not sure what I was smoking last night. For some reason I
read the pXd_clear() as "free". This approach looks good to me - very clever!
And you even managed to ensure the WRITE_ONCE() in pXd_clear() doesn't get
reordered after taking the lock via the existing dsb in the tlb maintenance
operation - I like it!

I'll send a separate review with some nits, but I'm out today, so that might
have to wait until tomorrow.

Thanks, and sorry again for the noise!
Ryan

