Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479F72869E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 02:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751594693; cv=none; b=s40k6grUExkBTYlZ8AFx39N38MtqtIN1yZjZBvX9hLlBT0Y3QoZwhdFDMjgJFyhxnhwi52PS5WuOiYnP6hyr3wdSiiHxQAa0KBBLp8n8hrfk9o+RdjN4WTo7PpsehWj1zKYyTWxRt/LqqBmOburEXjkqAjtfGXfnvdTy2Al2+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751594693; c=relaxed/simple;
	bh=MMcA+oUUNPVxy+zcaIYzkCBinCooPJHWYmaJU0BLGf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myXcrtBure5ILXo4M5W5Z+lUgODnNtZ1QSsqtLJth8W8nKr5D8girOOuYbMT2ULum84aUsy86lPaRkjLYC3hEZBkxEKlxRzlPUumqSC24AlBcRUXgkDlHsuJt+lDyh9nqqaItYIYXiRBTb1rgJiP6SqDD0PeEcpBy1yTAOVVQr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=buCCFCG0; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="buCCFCG0"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751594682; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WFJuHlHY3Ldt7R2cbF8nsU275Mhe5OrHAgm5sTSJxVE=;
	b=buCCFCG0Bw6ZGz9xBniKn9UAqNJ53UaWWDYYARkV4k5ZpKruU94NsxIKhT9U4xXnYDQwQgLuVig0uMwI65aoqb3ZNtvF/a2ZGZjmtlHsAz81pUu3aNzGWSnLwjh1j/5SgVnzn87F0zymobEq5lO+LthpcUq7f8x2ftpqmPpfK/o=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wh7to5V_1751594679 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Jul 2025 10:04:40 +0800
Message-ID: <9771e4ac-4f25-4822-9882-d8a94813e7c0@linux.alibaba.com>
Date: Fri, 4 Jul 2025 10:04:39 +0800
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
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <7b17af10-b052-4719-bbce-ffad2d74006a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/7/2 19:38, David Hildenbrand wrote:
> 
>>> So by mapping more in a single page fault, you end up increasing "RSS".
>>> But I wouldn't
>>> call that "expected". I rather suspect that nobody will really care :)
>>
>> But tmpfs is a little special here. It uses the 'huge=' option to
>> control large folio allocation. So, I think users should know they want
>> to use large folios and build the whole mapping for the large folios.
>> That is why I call it 'expected'.
> 
> Well, if your distribution decides to set huge= on /tmp or something 
> like that, your application might have very little saying in that, 
> right? :)
> 
> Again, I assume it's fine, but we might find surprises on the way.
> 
>>>
>>> The thing is, when you *allocate* a new folio, it must adhere at 
>>> least to
>>> pagecache alignment (e.g., cannot place an order-2 folio at pgoff 1) --
>>
>> Yes, agree.
>>
>>> that is what
>>> thp_vma_suitable_order() checks. Otherwise you cannot add it to the
>>> pagecache.
>>
>> But this alignment is not done by thp_vma_suitable_order().
>>
>> For tmpfs, it will check the alignment in shmem_suitable_orders() via:
>> "
>>     if (!xa_find(&mapping->i_pages, &aligned_index,
>>             aligned_index + pages - 1, XA_PRESENT))
>> "
> 
> That's not really alignment check, that's just checking whether a 
> suitable folio order spans already-present entries, no?

Because 'aligned_index' already did round_down() before checking if it's 
suitable. So it's still considered an implicit alignment check.

"
	pages = 1UL << order;
	aligned_index = round_down(index, pages);
"

> Finding suitable orders is still up to other code IIUC.
> 
>>
>> For other fs systems, it will check the alignment in
>> __filemap_get_folio() via:
>> "
>>     /* If we're not aligned, allocate a smaller folio */
>>     if (index & ((1UL << order) - 1))
>>         order = __ffs(index);
>> "
>>
>>> But once you *obtain* a folio from the pagecache and are supposed to 
>>> map it
>>> into the page tables, that must already hold true.
>>>
>>> So you should be able to just blindly map whatever is given to you here
>>> AFAIKS.
>>>
>>> If you would get a pagecache folio that violates the linear page offset
>>> requirement
>>> at that point, something else would have messed up the pagecache.
>>
>> Yes. But the comments from thp_vma_suitable_order() is not about the
>> pagecache alignment, it says "the order-aligned addresses in the VMA map
>> to order-aligned offsets within the file",
> 
> Let's dig, it's confusing.
> 
> The code in question is:
> 
> if (!IS_ALIGNED((vma->vm_start >> PAGE_SHIFT) - vma->vm_pgoff,
>          hpage_size >> PAGE_SHIFT))
> 
> So yes, I think this tells us: if we would have a PMD THP in the 
> pagecache, would we be able to map it with a PMD. If not, then don't 
> bother with allocating a PMD THP.
> 
> Of course, this also applies to other orders, but for PMD THPs it's 
> probably most relevant: if we cannot even map it through a PMD, then 
> probably it could be a wasted THP.
> 
> So yes, I agree: if we are both no missing something, then this 
> primarily relevant for the PMD case.
> 
> And it's more about "optimization" than "correctness" I guess?
> 
> But when mapping a folio that is already in the pagecache, I assume this 
> is not required.
> 
> Assume we have a 2 MiB THP in the pagecache.
> 
> If someone were to map it at virtual addr 1MiB, we could still map 1MiB 
> worth of PTEs into a single page table in one go, and not fallback to 
> individual PTEs.

That's how I understand the code as well, I just wasn't very sure 
before. Thanks for your explanation which clarified my doubts.

I will drop the check in next version.
