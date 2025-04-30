Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9667316EB42
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991873; cv=none; b=b9B3H2nQTqXFBzLGLOz19aZIb9G0onWSBbH7HoI09giCIbgRjoO2vT93ASFj1hGj7BEeZqcjUwl59+ii7hh5jPHXhGL4iPsxXs8JEnVWHtWJwfC4cgXz6T4vPAxA/DWeZeqvAONC+zPCJGhJ4cD6xj1RO2qqD8RqSmJLcVQJIhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991873; c=relaxed/simple;
	bh=X2wAr44kyEa1wXomBZkP0S30pU+20A2JzbIbMT1DTAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5CKq0HHwrrqleQsPjjoIYk8vDRbx2747ld4lJhr4jYcheOrOGpX5AeiWGfvwGrIa8jyRr2w53voYs+Ueyv0pLDVdQfvLlcctRUo0SklinrHYqR6xePi0SqWOwAP7RLMg0LUGD2TKhqa7QfORmLJCJmQywLfXt0jX7I3lqMVPi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4F4D106F;
	Tue, 29 Apr 2025 22:44:23 -0700 (PDT)
Received: from [10.163.79.251] (unknown [10.163.79.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FC553F5A1;
	Tue, 29 Apr 2025 22:44:22 -0700 (PDT)
Message-ID: <c7629a41-4069-4206-ae70-ec145a70fc67@arm.com>
Date: Wed, 30 Apr 2025 11:14:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
 <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
 <7cf8235e-21f7-4643-82c4-82ad57d99b98@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <7cf8235e-21f7-4643-82c4-82ad57d99b98@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/04/25 7:27 pm, Lorenzo Stoakes wrote:
> On Tue, Apr 29, 2025 at 11:27:43AM +0200, David Hildenbrand wrote:
>> On 29.04.25 11:19, David Hildenbrand wrote:
>>>
>>>>     #include "internal.h"
>>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> -			     pte_t pte)
>>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> +			      pte_t pte, struct folio *folio, unsigned int nr)
>>>>     {
>>>>     	struct page *page;
>>>> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>>     		 * write-fault handler similarly would map them writable without
>>>>     		 * any additional checks while holding the PT lock.
>>>>     		 */
>>>> -		page = vm_normal_page(vma, addr, pte);
>>>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>>>> +		if (!folio)
>>>> +			folio = vm_normal_folio(vma, addr, pte);
>>>> +		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);
>>>
>>> Oh no, now I spot it. That is horribly wrong.
>>>
>>> Please understand first what you are doing.
>>
>> Also, would expect that the cow.c selftest would catch that:
>>
>> "vmsplice() + unmap in child with mprotect() optimization"
>>
>> After fork() we have a R/O PTE in the parent. Our child then uses vmsplice()
>> and unmaps the R/O PTE, meaning it is only left mapped by the parent.
>>
>> ret = mprotect(mem, size, PROT_READ);
>> ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
>>
>> should turn the PTE writable, although it shouldn't.
> 
> This makes me concerned about the stability of this series as a whole...
> 
>>
>> If that test case does not detect the issue you're introducing, we should
>> look into adding a test case that detects it.
> 
> There are 25 tests that fail for the cow self-test with this series
> applied:
> 
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with base page
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (2048 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (2048 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (2048 kB)
> 
> 
> Dev, please take a little more time to test your series :) the current
> patch set doesn't compile and needs fixes applied to do so, and we're at
> v2, and you've clearly not run self-tests as these also fail.
> 
> Please ensure you do a smoke test and check compilation before sending out,
> as well as running self tests also.

Apologies, I over-confidently skipped over selftests, and didn't build 
for x86 :( Shall take care.

> 
> Thanks, Lorenzo
> 
>>
>> --
>> Cheers,
>>
>> David / dhildenb
>>

