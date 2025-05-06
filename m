Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6A2191F8F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523032; cv=none; b=AfRmE04IGLbmcCNMtEA4yrA0KM12rRJEzNj8zTWQ37jAJRJAElNShf4VL2/WT9LxfklNpumoI2tkbF+oQmDOrU/YT2qvhNyeHv9t+JPYtmUAda0Yo6q7nLhocu5ImFiKF4nsB7YHWlboSCrYKSiSRXuOn7xm7DmUuxusLQxObAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523032; c=relaxed/simple;
	bh=Y+nlUMn0voWnZlcEBa3YawHwYHEvsotUvnhK/dUzArA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwMB4jugNZbgpSqBbk+VEpA9MYNsJjkOCVABgTpC1+f1M4WtoF/9GKoktpuaiAkX95OWK6g1EbnCbtNksgUJ8YZDuHmWU/i/ZKPJm+CVA0uYlGZQuwuJ6qLdDUYLyPpfP+MMjXJC+zbXKb7Kvz1WOVegU8HFZd0dOQ0B0IGcC3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5216E113E;
	Tue,  6 May 2025 02:17:00 -0700 (PDT)
Received: from [10.162.43.13] (K4MQJ0H1H2.blr.arm.com [10.162.43.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF7EB3F5A1;
	Tue,  6 May 2025 02:17:02 -0700 (PDT)
Message-ID: <0857761c-bb4c-4ea5-a96a-90d555673527@arm.com>
Date: Tue, 6 May 2025 14:46:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
 <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/04/25 2:57 pm, David Hildenbrand wrote:
> On 29.04.25 11:19, David Hildenbrand wrote:
>>
>>>    #include "internal.h"
>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned 
>>> long addr,
>>> -                 pte_t pte)
>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned 
>>> long addr,
>>> +                  pte_t pte, struct folio *folio, unsigned int nr)
>>>    {
>>>        struct page *page;
>>> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct 
>>> *vma, unsigned long addr,
>>>             * write-fault handler similarly would map them writable 
>>> without
>>>             * any additional checks while holding the PT lock.
>>>             */
>>> -        page = vm_normal_page(vma, addr, pte);
>>> -        return page && PageAnon(page) && PageAnonExclusive(page);
>>> +        if (!folio)
>>> +            folio = vm_normal_folio(vma, addr, pte);
>>> +        return folio_test_anon(folio) && ! 
>>> folio_maybe_mapped_shared(folio);
>>
>> Oh no, now I spot it. That is horribly wrong.
>>
>> Please understand first what you are doing.
> 
> Also, would expect that the cow.c selftest would catch that:
> 
> "vmsplice() + unmap in child with mprotect() optimization"
> 
> After fork() we have a R/O PTE in the parent. Our child then uses 
> vmsplice() and unmaps the R/O PTE, meaning it is only left mapped by the 
> parent.
> 
> ret = mprotect(mem, size, PROT_READ);
> ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
> 
> should turn the PTE writable, although it shouldn't.
> 
> If that test case does not detect the issue you're introducing, we 
> should look into adding a test case that detects it.
> 

Hi David, I am afraid I don't understand my mistake :( PageAnon(page) 
boils down to folio_test_anon(folio). Next we want to determine whether 
the page underlying a PTE is mapped exclusively or not. I approximate 
this by folio_maybe_mapped_shared -> if the folio => all pages are 
mapped exclusively, then I convert the entire batch to writable. If one 
of the pages is mapped shared, then I do not convert the batch to 
writable, thus missing out on the optimization. As far as I understand,
the test failure points out exactly this right?

Do you suggest an alternate way? My initial approach was to add a new 
flag to folio_pte_batch: FPB_IGNORE_ANON_EXCLUSIVE, but from an API 
design PoV Ryan pointed out that that looked bad.

