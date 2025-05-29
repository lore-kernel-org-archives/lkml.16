Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA081ACED5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748534852; cv=none; b=QcatUjoleAliVY2PX+AFlyTYfW+o2sqqGg4/waai1VkA5WtxRpTePhJ5kIEl/aXe4hYanWObFg4X6j1pIdxzg1G9sgmcJtYUIP1Ql2bMatFkWGRhEAe0ukUby/HXnSNadQu83D/pihPMgzL6vmfArH634tdHSZiSm1qWln+X4VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748534852; c=relaxed/simple;
	bh=7LE+ssZdAkqIWmT8lrUABCe6kJb6KEV4+9ucdivRr7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttHscqaQj2iwXpzmN6DNTE3/NEdzEFwLkmpS3+RRILMewmacXVl3g/jq82drLxa7TYk8iKqJZQxI/6C9nkBETVLMfT+GfnYAC1yQCOHkljkyI0WopbllvsdYe2/zeJF1qF9hf7FyD85gpRZO2Pqd0p9WucZ5iI/QjujK8/f92PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4b7WV75s39zYQv8C
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:07:27 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id E4FAE1A0A2A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:07:26 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgBXuno9hjho1UqsNg--.34312S2;
	Fri, 30 May 2025 00:07:26 +0800 (CST)
Message-ID: <956124be-c73c-4023-9edd-25372f3f865a@huaweicloud.com>
Date: Fri, 30 May 2025 00:07:25 +0800
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
To: David Hildenbrand <david@redhat.com>, Oleg Nesterov <oleg@redhat.com>
Cc: lorenzo.stoakes@oracle.com, mhiramat@kernel.org, peterz@infradead.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
 <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgBXuno9hjho1UqsNg--.34312S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1DZFWUJrWfKFy7XF4fXwb_yoW8Kw4fpa
	48ta4UJFy5Jr18Jr1DtF1jqry8tr1UJw1UXr1rXFy3Jwn8tr1jqr4UXFWYgr15XrWktr1U
	Xr4Utr9xuFW7ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x
	0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
	GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUF1v3UUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/


On 2025/5/28 17:03, David Hildenbrand wrote:
> On 27.05.25 15:38, Pu Lehui wrote:
>> Hi David,
>>
>> On 2025/5/27 2:46, David Hildenbrand wrote:
>>> On 26.05.25 17:48, Oleg Nesterov wrote:
>>>> Hi Lehui,
>>>>
>>>> As I said, I don't understand mm/, so can't comment, but...
>>>>
>>>> On 05/26, Pu Lehui wrote:
>>>>>
>>>>> To make things simpler, perhaps we could try post-processing, that is:
>>>>>
>>>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>>>> index 83e359754961..46a757fd26dc 100644
>>>>> --- a/mm/mremap.c
>>>>> +++ b/mm/mremap.c
>>>>> @@ -240,6 +240,11 @@ static int move_ptes(struct 
>>>>> pagetable_move_control
>>>>> *pmc,
>>>>>                   if (pte_none(ptep_get(old_pte)))
>>>>>                           continue;
>>>>>
>>>>> +               /* skip move pte when expanded range has uprobe */
>>>>> +               if (unlikely(pte_present(*new_pte) &&
>>>>> +                            vma_has_uprobes(pmc->new, new_addr,
>>>>> new_addr +
>>>>> PAGE_SIZE)))
>>>>> +                       continue;
>>>>> +
>>>>
>>>> I was thinking about
>>>>
>>>>      WARN_ON(!pte_none(*new_pte))
>>>>
>>>> at the start of the main loop.
>>>>
>>>> Obviously not to fix the problem, but rather to make it more explicit.
>>>
>>> Yeah, WARN_ON_ONCE().
>>>
>>> We really should fix the code to not install uprobes into the area we
>>> are moving.
>> Alright, so let's try this direction.
>>
>>>
>>> Likely, the correct fix will be to pass the range as well to
>>> uprobe_mmap(), and passing that range to build_probe_list().
>>
>> It will be great. But IIUC, the range we expand to is already included
>> when entering uprobe_mmap and also build_probe_list.
> 
> Right, you'd have to communicate that information through all layers 
> (expanded range).
> 
> As an alternative, maybe we can really call handle_vma_uprobe() after 
> moving the pages.

Hi David,

Not sure if this is possible, but I think it would be appropriate to not 
handle this uprobe_mmap at the source, and maybe we should make it clear 
that new_pte must be NULL when move_ptes, otherwise it should be an 
exception?

> 
> uprobe_write_opcode() should detect that the uprobe is already installed 
> (verify_opcode() will return 0) and just return.
> 

