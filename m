Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF162749CA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353092; cv=none; b=paCgzr3ZK604TjJBOw6m72O/BDPlRYll4Nln6n0Qr+ajm0MoB4NENN0Bzk0V4dTgxxRDRIIKQVHDhCkHH/dB3moZSt1kfWPzdPHtDi+EJAt5XvYAFRk6LgzYUjwZ252jmodObal8oAQ+L374mT2GU/6CIZiekIYvtAfYlH5dXX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353092; c=relaxed/simple;
	bh=yA9jjn66m7hHeKAY6NL326WUBnit5kXQLwaCQSgdp38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPVFx+LtF9NBOh8xrGLjrBQRHzQcRZTQLIpvY/kVQytlj3fZ2GKMT6K7hXuxj9ge0Z/pmKqNsjhIaP+S9g6S2M5+ekj1XZwoXuTAFWyUHBrznt/5eUWkn2RbFEvwppX79/Ag/nW3NKLdiifMiqN7ZHw5Bm9O7+yH/KUNkcpZoj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4b6DGB0t1Rz4f3lDF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:37:38 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id DE9EF1A1BEF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:38:04 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgCX_Hw7wDVo7Z3VNQ--.8983S2;
	Tue, 27 May 2025 21:38:04 +0800 (CST)
Message-ID: <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
Date: Tue, 27 May 2025 21:38:03 +0800
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
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgCX_Hw7wDVo7Z3VNQ--.8983S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyrKFWDAFW8tw13uF1UAwb_yoW8ZFy8pa
	48ta45JFyUJry8Jr1DJF1Utry0qr1Utw4UJr1rXFy5Awn8tr1jqFWYqFZ0gry5JrWktw15
	Jr1UXwnruay7JFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUF1
	v3UUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/

Hi David,

On 2025/5/27 2:46, David Hildenbrand wrote:
> On 26.05.25 17:48, Oleg Nesterov wrote:
>> Hi Lehui,
>>
>> As I said, I don't understand mm/, so can't comment, but...
>>
>> On 05/26, Pu Lehui wrote:
>>>
>>> To make things simpler, perhaps we could try post-processing, that is:
>>>
>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>> index 83e359754961..46a757fd26dc 100644
>>> --- a/mm/mremap.c
>>> +++ b/mm/mremap.c
>>> @@ -240,6 +240,11 @@ static int move_ptes(struct pagetable_move_control
>>> *pmc,
>>>                  if (pte_none(ptep_get(old_pte)))
>>>                          continue;
>>>
>>> +               /* skip move pte when expanded range has uprobe */
>>> +               if (unlikely(pte_present(*new_pte) &&
>>> +                            vma_has_uprobes(pmc->new, new_addr, 
>>> new_addr +
>>> PAGE_SIZE)))
>>> +                       continue;
>>> +
>>
>> I was thinking about
>>
>>     WARN_ON(!pte_none(*new_pte))
>>
>> at the start of the main loop.
>>
>> Obviously not to fix the problem, but rather to make it more explicit.
> 
> Yeah, WARN_ON_ONCE().
> 
> We really should fix the code to not install uprobes into the area we 
> are moving.
Alright, so let's try this direction.

> 
> Likely, the correct fix will be to pass the range as well to 
> uprobe_mmap(), and passing that range to build_probe_list().

It will be great. But IIUC, the range we expand to is already included 
when entering uprobe_mmap and also build_probe_list.

copy_vma
     vma_merge_new_range
         vma_expand
             commit_merge
                 vma_set_range(vma, vmg->start, vmg->end, vmg->pgoff);
                 vmg_adjust_set_range(vmg); <-- adjust with new range
                 vma_complete
                     uprobe_mmap
move_page_tables
     move_ptes
         set_pte_at(mm, new_addr, new_pte, pte);

> 
> Only when growing using mremap(), we want to call it on the extended 
> range only.
> 

