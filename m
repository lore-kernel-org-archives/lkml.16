Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6C12594
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 02:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751596555; cv=none; b=EgZSm81OQyzejyvyuFwJTvCp3+Me9Kp5JlD6KEMmnyMchZH/KedasnkKJzDH+OYay6x46n073/LodxzFXn3WdlgUHlQGgRQAqqwh1tf8KaVteja/riz28xMrcvn/66TIMKfJm38kb00hEih5S2u1kZcxgjFiYXv5ByZJ67bNwwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751596555; c=relaxed/simple;
	bh=5dT2h4MCtJR75HfTJqfanADYSdZHpIfXc/0Lnv66YDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keVFpccarcpVTO/GMk5OJ06ybtXQHyzF+Ki1uD5HGoFBknURpwm8SClWvT3Grj8hkjhx6yF6+a7nntNDKOR/4Pj311+59hbdiKt2u10l/j3iEf93gmDIbHG8ZUkfvCtz2WcaFoCTKOP6sAP+f5+LdtFbstRK4GRK7LfwykkOfV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZgYI4nov; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZgYI4nov"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751596545; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=qLrT+Pn2nKOOuoMSI85wSadp3jfVdP14YjNT3e39XJA=;
	b=ZgYI4novpbNhPsv2nOFud0fkC7dUsyUJZCVUJd5+jZLAvDoer4lMl2LkPzDP1kqe/iPmJ1rBiOpdW0sy623fX68gm1T0A9Zs6XDT2YfJRjdXglH3lBcqgiYElxrI+een8tmW31hKlDVWCMWpmckJKDAs42o2lvsv6ISFIhXNN48=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wh8LBkk_1751596543 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Jul 2025 10:35:44 +0800
Message-ID: <8b4603f3-19c7-4979-ae4a-ef99690562d1@linux.alibaba.com>
Date: Fri, 4 Jul 2025 10:35:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: support large mapping building for tmpfs
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <d4cb6e578bca8c430174d5972550cbeb530ec3fe.1751359073.git.baolin.wang@linux.alibaba.com>
 <b8258f91-ad92-419e-a0a1-a8db706c814c@redhat.com>
 <fca114c1-9699-4dd7-9bca-83a5f5ac615d@linux.alibaba.com>
 <ec5d4e52-658b-4fdc-b7f9-f844ab29665c@redhat.com>
 <67c79f65-ca6d-43be-a4ec-decd08bbce0a@linux.alibaba.com>
 <7b17af10-b052-4719-bbce-ffad2d74006a@redhat.com>
 <4c5ea64d-c33c-4cf5-8e71-08bc50a5f940@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <4c5ea64d-c33c-4cf5-8e71-08bc50a5f940@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/7/2 19:55, David Hildenbrand wrote:
> On 02.07.25 13:38, David Hildenbrand wrote:
>>
>>>> So by mapping more in a single page fault, you end up increasing "RSS".
>>>> But I wouldn't
>>>> call that "expected". I rather suspect that nobody will really care :)
>>>
>>> But tmpfs is a little special here. It uses the 'huge=' option to
>>> control large folio allocation. So, I think users should know they want
>>> to use large folios and build the whole mapping for the large folios.
>>> That is why I call it 'expected'.
>>
>> Well, if your distribution decides to set huge= on /tmp or something
>> like that, your application might have very little saying in that, 
>> right? :)
>>
>> Again, I assume it's fine, but we might find surprises on the way.
>>
>>>>
>>>> The thing is, when you *allocate* a new folio, it must adhere at 
>>>> least to
>>>> pagecache alignment (e.g., cannot place an order-2 folio at pgoff 1) --
>>>
>>> Yes, agree.
>>>
>>>> that is what
>>>> thp_vma_suitable_order() checks. Otherwise you cannot add it to the
>>>> pagecache.
>>>
>>> But this alignment is not done by thp_vma_suitable_order().
>>>
>>> For tmpfs, it will check the alignment in shmem_suitable_orders() via:
>>> "
>>>     if (!xa_find(&mapping->i_pages, &aligned_index,
>>>             aligned_index + pages - 1, XA_PRESENT))
>>> "
>>
>> That's not really alignment check, that's just checking whether a
>> suitable folio order spans already-present entries, no?
>>
>> Finding suitable orders is still up to other code IIUC.
>>
>>>
>>> For other fs systems, it will check the alignment in
>>> __filemap_get_folio() via:
>>> "
>>>     /* If we're not aligned, allocate a smaller folio */
>>>     if (index & ((1UL << order) - 1))
>>>         order = __ffs(index);
>>> "
>>>
>>>> But once you *obtain* a folio from the pagecache and are supposed to 
>>>> map it
>>>> into the page tables, that must already hold true.
>>>>
>>>> So you should be able to just blindly map whatever is given to you here
>>>> AFAIKS.
>>>>
>>>> If you would get a pagecache folio that violates the linear page offset
>>>> requirement
>>>> at that point, something else would have messed up the pagecache.
>>>
>>> Yes. But the comments from thp_vma_suitable_order() is not about the
>>> pagecache alignment, it says "the order-aligned addresses in the VMA map
>>> to order-aligned offsets within the file",
>>
>> Let's dig, it's confusing.
>>
>> The code in question is:
>>
>> if (!IS_ALIGNED((vma->vm_start >> PAGE_SHIFT) - vma->vm_pgoff,
>>         hpage_size >> PAGE_SHIFT))
>>
>> So yes, I think this tells us: if we would have a PMD THP in the
>> pagecache, would we be able to map it with a PMD. If not, then don't
>> bother with allocating a PMD THP.
>>
>> Of course, this also applies to other orders, but for PMD THPs it's
>> probably most relevant: if we cannot even map it through a PMD, then
>> probably it could be a wasted THP.
>>
>> So yes, I agree: if we are both no missing something, then this
>> primarily relevant for the PMD case.
>>
>> And it's more about "optimization" than "correctness" I guess?
> 
> Correction: only if a caller doesn't assume that this is an implicit 
> pagecache alignment check. Not sure if that might be the case for shmem 
> when it calls thp_vma_suitable_order() with a VMA ...

I am sure shmem will not use thp_vma_suitable_order() for pagecache 
alignment checks, because shmem has explicit code for pagecache 
alignment checks.

Adding thp_vma_suitable_order() in shmem is more about following the 
allocation logic of anonymous pages. I also think the 'IS_ALIGNED()' 
check in thp_vma_suitable_order() for shmem is more about 'optimization' 
rather than 'correction'. Anyway, I will take another look at shmem's 
checking logic.
