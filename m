Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84A71F1538
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449461; cv=none; b=ORG/T0unNnWUxxNjxovc0K/VP5a4ypOIzK668xWT2tfum7xKMaepJYdsKIIrPKNZuFzHFxT4SDTT37iVeAQDWwED4dfnvajV5UZvEN3hENZAmDXTvqhSIwY14LTcWVwUFJFsXilJeCau9r7e2fG1t3VhveCbWELHN+Ixe/fCpwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449461; c=relaxed/simple;
	bh=65cubFtwvnPteBLDZbSgBve346pdNXCNA/5DnUiy53s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXXHdx/yrXBwX0JCt9IeTifuvpOTz+p5bh1HlXdywI5zKeKkjpq3OEom3daPCybaEOL8wiFyee5izOM7eqbFBlbuUbXfgPqGkg34azNkVZRkO2XK4LhBgzI5eKCt/7buPjDgCoy1MAvUqcm8Eh6TPfRgJhDuW4t7hKxIEWKtnx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=UK9amq0L; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="UK9amq0L"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751449454; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=TPDFnR6xyIyxfr0iYGezk0MNTrjhrc4TVyMwpLGO3Lo=;
	b=UK9amq0LMSFfQKU25YDaG3xaH6Z8gUNFtnot41znY1nTdH6KmMmXsP2juDyjj1UeOI89drgxacKy2WHrmwMIM3dLNh21PvkRoA0LB3aG0JMP+wxEUzMfVqP9eaeOJWeaBHG758p5YEPrzKS9/HXNJmVT3VgheQUW6FCVzfItrcs=
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WgdgHUS_1751449452 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Jul 2025 17:44:12 +0800
Message-ID: <67c79f65-ca6d-43be-a4ec-decd08bbce0a@linux.alibaba.com>
Date: Wed, 2 Jul 2025 17:44:11 +0800
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
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ec5d4e52-658b-4fdc-b7f9-f844ab29665c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/7/2 16:45, David Hildenbrand wrote:
>>> Hm, are we sure about that?
>>
>> IMO, referring to the definition of RSS:
>> "resident set size (RSS) is the portion of memory (measured in
>> kilobytes) occupied by a process that is held in main memory (RAM). "
>>
>> Seems we should report the whole large folio already in file to users.
>> Moreover, the tmpfs mount already adds the 'huge=always (or within)'
>> option to allocate large folios, so the increase in RSS seems also 
>> expected?
> 
> Well, traditionally we only account what is actually mapped. If you
> MADV_DONTNEED part of the large folio, or only mmap() parts of it,
> the RSS would never cover the whole folio -- only what is mapped.
> 
> I discuss part of that in:
> 
> commit 749492229e3bd6222dda7267b8244135229d1fd8
> Author: David Hildenbrand <david@redhat.com>
> Date:   Mon Mar 3 17:30:13 2025 +0100
> 
>      mm: stop maintaining the per-page mapcount of large folios 
> (CONFIG_NO_PAGE_MAPCOUNT)
> 
> And how my changes there affect some system stats (e.g., "AnonPages", 
> "Mapped").
> But the RSS stays unchanged and corresponds to what is actually mapped into
> the process.
> Doing something similar for the RSS would be extremely hard (single page 
> mapped into process
> -> account whole folio to RSS), because it's per-folio-per-process 
> information, not
> per-folio information.

Thanks. Good to know this.

> So by mapping more in a single page fault, you end up increasing "RSS". 
> But I wouldn't
> call that "expected". I rather suspect that nobody will really care :)

But tmpfs is a little special here. It uses the 'huge=' option to 
control large folio allocation. So, I think users should know they want 
to use large folios and build the whole mapping for the large folios. 
That is why I call it 'expected'.

>> Also, how does fault_around_bytes interact
>>> here?
>>
>> The ‘fault_around’ is a bit tricky. Currently, 'fault_around' only
>> applies to read faults (via do_read_fault()) and does not control write
>> shared faults (via do_shared_fault()). Additionally, in the
>> do_shared_fault() function, PMD-sized large folios are also not
>> controlled by 'fault_around', so I just follow the handling of PMD-sized
>> large folios.
>>
>>>> In order to support large mappings for tmpfs, besides checking VMA
>>>> limits and
>>>> PMD pagetable limits, it is also necessary to check if the linear page
>>>> offset
>>>> of the VMA is order-aligned within the file.
>>>
>>> Why?
>>>
>>> This only applies to PMD mappings. See below.
>>
>> I previously had the same question, but I saw the comments for
>> ‘thp_vma_suitable_order’ function, so I added the check here. If it's
>> not necessary to check non-PMD-sized large folios, should we update the
>> comments for 'thp_vma_suitable_order'?
> 
> I was not quite clear about PMD vs. !PMD.
> 
> The thing is, when you *allocate* a new folio, it must adhere at least to
> pagecache alignment (e.g., cannot place an order-2 folio at pgoff 1) -- 

Yes, agree.

> that is what
> thp_vma_suitable_order() checks. Otherwise you cannot add it to the 
> pagecache.

But this alignment is not done by thp_vma_suitable_order().

For tmpfs, it will check the alignment in shmem_suitable_orders() via:
"
	if (!xa_find(&mapping->i_pages, &aligned_index,
			aligned_index + pages - 1, XA_PRESENT))
"

For other fs systems, it will check the alignment in 
__filemap_get_folio() via:
"
	/* If we're not aligned, allocate a smaller folio */
	if (index & ((1UL << order) - 1))
		order = __ffs(index);
"

> But once you *obtain* a folio from the pagecache and are supposed to map it
> into the page tables, that must already hold true.
> 
> So you should be able to just blindly map whatever is given to you here
> AFAIKS.
> 
> If you would get a pagecache folio that violates the linear page offset 
> requirement
> at that point, something else would have messed up the pagecache.

Yes. But the comments from thp_vma_suitable_order() is not about the 
pagecache alignment, it says "the order-aligned addresses in the VMA map 
to order-aligned offsets within the file", which is used to do alignment 
for PMD mapping originally. So I wonder if we need this restriction for 
non-PMD-sized large folios?

"
  *   - For file vma, check if the linear page offset of vma is
  *     order-aligned within the file.  The hugepage is
  *     guaranteed to be order-aligned within the file, but we must
  *     check that the order-aligned addresses in the VMA map to
  *     order-aligned offsets within the file, else the hugepage will
  *     not be mappable.
"
