Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541292749E2
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353203; cv=none; b=kVpQzrqNXu3oULumZ/I5iA7koxkQsy43Kfl2vNcDot+BIHKEyKfnhuQFuOH2md+bUOnzujeQTh+jOIAfhFkC0MG+009kdma0GH4PkkrocWy+jTLwG8tlSJnsYTADS9Nh+FxSj4q+mhonPUBJq1/Ho+yFZFfaYL2Wh1jAxdiDHjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353203; c=relaxed/simple;
	bh=E7cs+RXQ4xLTlfiJSBnZy00M7xZiQh+K8DvguIHD3yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibkm6nShZDJwhw6Q3VVALMn/RNgrSuR12yM9f9RWcezwWp28vYMgVv/RplQqFRqDyyxS4AabKo75H70w+OZwFdtlnRWCmwK1Pi/rCgMqlKhky/mFHQFsRYk/NAaRlzHdMef6rDfZ+d8LKVW4WNoaMGRhAr/4FCm2s4C+eZJIsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4b6DJL58TQz4f3jYC
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:39:30 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 031611A159B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:39:56 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgBXBlurwDVovl+2Ng--.5058S2;
	Tue, 27 May 2025 21:39:55 +0800 (CST)
Message-ID: <03b171c9-0de2-4d25-9d12-6d49d4daa2b5@huaweicloud.com>
Date: Tue, 27 May 2025 21:39:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: Oleg Nesterov <oleg@redhat.com>, mhiramat@kernel.org,
 peterz@infradead.org, Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 vbabka@suse.cz, jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <b84f00c8-966c-46f2-8afe-d09465153217@lucifer.local>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <b84f00c8-966c-46f2-8afe-d09465153217@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgBXBlurwDVovl+2Ng--.5058S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw47Cr43tryfWrW8Gw1fXrb_yoW8ur1Upa
	y8Ja4jka1UJ348KFnFqF1vqF1Fq3yUtr4UXr15Xry5Awn8tr1xWF4agFW5ua4xZrWktw10
	vrW2qF9xCay3AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUb
	mii3UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/



On 2025/5/27 19:42, Lorenzo Stoakes wrote:
> On Mon, May 26, 2025 at 08:46:07PM +0200, David Hildenbrand wrote:
>> On 26.05.25 17:48, Oleg Nesterov wrote:
>>> Hi Lehui,
>>>
>>> As I said, I don't understand mm/, so can't comment, but...
>>>
>>> On 05/26, Pu Lehui wrote:
>>>>
>>>> To make things simpler, perhaps we could try post-processing, that is:
>>>>
>>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>>> index 83e359754961..46a757fd26dc 100644
>>>> --- a/mm/mremap.c
>>>> +++ b/mm/mremap.c
>>>> @@ -240,6 +240,11 @@ static int move_ptes(struct pagetable_move_control
>>>> *pmc,
>>>>                   if (pte_none(ptep_get(old_pte)))
>>>>                           continue;
>>>>
>>>> +               /* skip move pte when expanded range has uprobe */
>>>> +               if (unlikely(pte_present(*new_pte) &&
>>>> +                            vma_has_uprobes(pmc->new, new_addr, new_addr +
>>>> PAGE_SIZE)))
> 
> This feels like a horrible hack, note that we also move page tables at higher
> page table levels _anyway_ so this would be broken by that (unless uprobes split
> huge mappings).

Got it. Won't do this try...

> 
> If it's uprobe code that's putting the new PTE in place, then this is
> just... yeah. I'm with David's suggestion of just disallowing this scenario, I
> really dislike the idea that we're ok with an invalid condition being ok, only
> to cover off this one specific case.
> 
> 
>>>> +                       continue;
>>>> +
>>>
>>> I was thinking about
>>>
>>> 	WARN_ON(!pte_none(*new_pte))
>>>
>>> at the start of the main loop.
>>>
>>> Obviously not to fix the problem, but rather to make it more explicit.
>>
>> Yeah, WARN_ON_ONCE().
>>
>> We really should fix the code to not install uprobes into the area we are
>> moving.
>>
>> Likely, the correct fix will be to pass the range as well to uprobe_mmap(),
>> and passing that range to build_probe_list().
>>
>> Only when growing using mremap(), we want to call it on the extended range
>> only.
> 
> We might be able to implement a simpler version of the proposed patch though
> which might avoid us needing to do something like this.
> 
> Having a look...
> 
>>
>> --
>> Cheers,
>>
>> David / dhildenb
>>

