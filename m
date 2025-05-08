Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A489A7E792
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718631; cv=none; b=ijuOhIG6dAPWgt/qa7rrFX6YiRCzVc3E+jkBrIqgyCSNGdcB16twGFisQFyV/75xY8Y2rXyo1ZYMBHNNOV3CPYM3d5nN80e8EAUgYbjMlav1uTmSTFqDrFtJNoBzgjc1uvoRpj5gFUjpy3GC0fmdzf3h2cEGAn721igQOdetLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718631; c=relaxed/simple;
	bh=fHcEnxFvE8betaIrmNhqEpzMpXukhInU56a88lzWZAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTnbvNAp0pXDNDo/nNzng3JD3p+y5us4+Zi8gD1zsAksspohU0hZGlb4qIjgbkrh5d8OqQYzWV9Ob/aFVolCVSi7uHmylVbJvD+gdFkmRmlMb4JcFaBhokY8Y1OnFGQ9HODXCcun2jmB0ipyZ3cgcvWRZTdFxPsrtWolx82qKJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FZ3sbPvI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FZ3sbPvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746718628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WqIleyRWbBE6fAeA2+kL12j5GghozmhjBuwTBWLQVFQ=;
	b=FZ3sbPvIlcGvtFKB7gxpd95E1d/X2B3AgA4Kw+320o5vnO9h0hpnhmrRnsF2xsIAL2x8J/
	1gpUnq78eedxdK43PkzI5yjgBN08hdxpy6HAAafQAbOqEqg2N3IwAbXFdOUh4jYgzADEci
	veZwcwZnOHavTfy2ivrRBzRfw1rzef8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-hnFblSKeNpG4r1p0l5SkTQ-1; Thu, 08 May 2025 11:37:07 -0400
X-MC-Unique: hnFblSKeNpG4r1p0l5SkTQ-1
X-Mimecast-MFC-AGG-ID: hnFblSKeNpG4r1p0l5SkTQ_1746718626
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442ccf0eb4eso8687565e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718626; x=1747323426;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WqIleyRWbBE6fAeA2+kL12j5GghozmhjBuwTBWLQVFQ=;
        b=pnm06BfXpv8ZxhedgA+77n9p4ECWCoHwu1bFVLmq54VCsYT0qF/UwK25kq30Hdcbf2
         jPGLW5IeCvCY2RebkSoHXJtrsfhG3+Do9AKUUD6AzP7bPVZ4hvlQOAyMK6pPsuEyxrJh
         3hwOBIfgUjaPTBP6NtrRbIZfthhWLWkOn2bGEKdTEc1Dd8XFN1DKKpvUuUq63EoGUAI3
         K2egJmOJE6vTFS1h+zFEVVoWnlXzC5vuywFl/JXM4qaJE8xNOdM8LIvqfxu9DIfv+Dld
         o10qP0gGT846xuwAE5787gVT5eL1SBSxuhjjMQrCdTrEqMIwUhQaCVhPml5qhOkBcAAT
         AVrg==
X-Forwarded-Encrypted: i=1; AJvYcCXDOI6SUR46kEn7/VdThZQCtCy47MxV/ETuBKDj+0wzn/HP6U8kAJ8IDTf6dGKZJ84QgbuKNYQmVaTL2hA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ9Tbba7bSpzh7Yq2eVyiPK9yo22fKTRYkjmetGP5Lk6/yl8uy
	RagtZe166J0x4bVgO40+pGjjxHJcWNE4rP0kMCF0SD3vzWquO9+cviv+i3XKASkNXOFyImNEN9/
	fMkaplx9+NJw9leNi+9d/EHfQ2v8Z6fddxCs4jeYTCgM22NmoKcvh4S8sBXq7oXwq0q5FGw==
X-Gm-Gg: ASbGncsdC3RH2XHoGxRodldsyMNcEeamdxFyOEskBo8z25qJG4mydXehuL8/1bZbW0+
	DF4v5POyyTojSZ7w4ZMNbogA7hh0I8xj9pCBWYHuWN0n0lRpdNoSknd0C02dzgSXWaqjT7qggkW
	hJeS1nSLm3dIM9a9/8j2japYjmE3dlDBfyG3nLEQ1Vp4mcT4CxR77MtfZbpZI8qPC8Dbs5Ymzn2
	QoGL9q9kSl6olO5HBUIPL2min8pjQ1J8XZY+qVrtR9biTdlw7oVTpHbuEZMxf23bnR6WVDR/rpn
	q7rbhGc0An9DMgIQ3Gx1yQ+yiVMoC2Uv1dI5QY6m4sAMhfw0OR6aVVrJ1pJ7FyT4NesOORiRS9A
	4x3g3CqKr3B7Uo1AOPaiQz3uawBraO9DwAOae5/w=
X-Received: by 2002:a05:600c:1e1c:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-441d44c4f9cmr77168695e9.12.1746718626064;
        Thu, 08 May 2025 08:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8+Z0hrydt/sNvRj0RjbhS2hsfzsEiHQI1YRNtaN1N6XVBPHA0SaOTi3RMMG6pXTHWtjJ1RA==
X-Received: by 2002:a05:600c:1e1c:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-441d44c4f9cmr77168355e9.12.1746718625656;
        Thu, 08 May 2025 08:37:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32b0c8sm41504345e9.3.2025.05.08.08.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:37:05 -0700 (PDT)
Message-ID: <c29bd0cb-0907-4c5b-8244-83bbb256d964@redhat.com>
Date: Thu, 8 May 2025 17:37:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Fix zero copy I/O on __get_user_pages allocated pages
To: Pantelis Antoniou <p.antoniou@partner.samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Artem Krupotkin <artem.k@samsung.com>,
 Charles Briere <c.briere@samsung.com>,
 Wade Farnsworth <wade.farnsworth@siemens.com>, Peter Xu <peterx@redhat.com>
References: <20250507154105.763088-1-p.antoniou@partner.samsung.com>
 <CGME20250507154119uscas1p17799fe7589e4f1bd53d2d3dc7f44cb8c@uscas1p1.samsung.com>
 <20250507154105.763088-2-p.antoniou@partner.samsung.com>
 <99ed92b7-c1b2-4e12-a7ee-776a7f890b47@redhat.com>
 <20250508182356.45dbfd40@sarc.samsung.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250508182356.45dbfd40@sarc.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08.05.25 17:23, Pantelis Antoniou wrote:
> On Thu, 8 May 2025 17:03:46 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
> Hi there,
> 
>> On 07. 05. 25 17: 41, Pantelis Antoniou wrote: Hi, > Recent updates
>> to net filesystems enabled zero copy operations, > which require
>> getting a user space page pinned. > > This does not work for pages
>> that were allocated via __get_user_pages
>> On 07.05.25 17:41, Pantelis Antoniou wrote:
>>
>> Hi,
>>
>>> Recent updates to net filesystems enabled zero copy operations,
>>> which require getting a user space page pinned.
>>>
>>> This does not work for pages that were allocated via
>>> __get_user_pages and then mapped to user-space via remap_pfn_rage.
>>
>> Right. Because the struct page of a VM_PFNMAP *must not be touched*.
>> It has to be treated like it doesn't exist.
>>
> 
> Well, that's not exactly the case. For pages mapped to user space via
> remap_pfn_range() the VM_PFNMAP bit is set even though the pages do
> have a struct page.

Yes. And VM_PFNMAP is the big flag that these pages shall not be 
touched. Even if it exists. Even if you say please. :)

See the comment above vm_normal_page():

	"Special" mappings do not wish to be associated with a "struct
	page" (either it doesn't exist, or it exists but they don't want
	to touch it)

VM_MIXEDMAP could maybe be used for that purpose: possibly GUP also has 
to be updated to make use of that. (I was hoping we can get rid of 
VM_MIXEDMAP at some point)


> 
> The details of how it happens are at the cover page of this patch but
> let me paste the relevant bits here.
> 
> "In our emulation environment we have noticed failing writes when
> performing I/O from a userspace mapped DRM GEM buffer object.
> The platform does not use VRAM, all graphics memory is regular DRAM
> memory, allocated via __get_free_pages
> 
> The same write was successful from a heap allocated bounce buffer.
> 
> The sequence of events is as follows.
> 
> 1. A BO (Buffer Object) is created, and it's backing memory is allocated via
>     __get_user_pages()

__get_user_pages() only allocates memory via page faults. Are you sure 
you meant __get_user_pages() here?

> 
> 2. Userspace mmaps a BO (Buffer Object) via a mmap call on the opened
>     file handle of a DRM driver. The mapping is done via the
>     drm_gem_mmap_obj() call.
> 
> 3. Userspace issues a write to a file copying the contents of the BO.
> 
> 3a. If the file is located on regular filesystem (like ext4), the write
>      completes successfully.
> 
> 3b. If the file is located on a network filesystem, like 9p the write fails.
> 
> The write fails because v9fs_file_write_iter() will call
> netfs_unbuffered_write_iter(), netfs_unbuffered_write_iter_locked() which will
> call netfs_extract_user_iter()
> 
> netfs_extract_user_iter() will in turn call iov_iter_extract_pages() which for
> a user backed iterator will call iov_iter_extract_user_pages which will call
> pin_user_pages_fast() which finally will call __gup_longterm_locked().
> 
> __gup_longterm_locked() will call __get_user_pages_locked() which will fail
> because the VMA is marked with the VM_IO and VM_PFNMAP flags."

So, drm_gem_mmap_obj() ends up using remap_pfn_rage()?

I can spot that drm_gem_mmap_obj() has a path where it explicitly sets

	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND |
		     VM_DONTDUMP);

Which is a clear sign to core-MM (incl. GUP) to never mess with the 
mapped pages.

> 
>>>
>>> remap_pfn_range_internal() will turn on VM_IO | VM_PFNMAP vma bits.
>>> VM_PFNMAP in particular mark the pages as not having struct_page
>>> associated with them, which is not the case for __get_user_pages()
>>>
>>> This in turn makes any attempt to lock a page fail, and breaking
>>> I/O from that address range.
>>>
>>> This patch address it by special casing pages in those VMAs and not
>>> calling vm_normal_page() for them.
>>>
>>> Signed-off-by: Pantelis Antoniou <p.antoniou@partner.samsung.com>
>>> ---
>>>    mm/gup.c | 22 ++++++++++++++++++----
>>>    1 file changed, 18 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 84461d384ae2..e185c18c0c81 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -833,6 +833,20 @@ static inline bool can_follow_write_pte(pte_t
>>> pte, struct page *page, return !userfaultfd_pte_wp(vma, pte);
>>>    }
>>>    
>>> +static struct page *gup_normal_page(struct vm_area_struct *vma,
>>> +		unsigned long address, pte_t pte)
>>> +{
>>> +	unsigned long pfn;
>>> +
>>> +	if (vma->vm_flags & (VM_MIXEDMAP | VM_PFNMAP)) {
>>> +		pfn = pte_pfn(pte);
>>> +		if (!pfn_valid(pfn) || is_zero_pfn(pfn) || pfn >
>>> highest_memmap_pfn)
>>> +			return NULL;
>>> +		return pfn_to_page(pfn);
>>> +	}
>>> +	return vm_normal_page(vma, address, pte);
>>
>> I enjoy seeing vm_normal_page() checks in GUP code.
>>
>> I don't enjoy seeing what you added before that :)
>>
>> If vm_normal_page() tells you "this is not a normal", then we should
>> not touch it. There is one exception: the shared zeropage.
>>
>>
>> So, unfortunately, this is wrong.
>>
> 
> Well, lets talk about a proper fix then for the previously mentioned
> user-space regression.

You really have to find out the responsible commit. GUP has been 
behaving like that forever I'm afraid.

And even the VM_PFNMAP was in drm_gem_mmap_obj() already at least in 
2012 if I am not wrong.

-- 
Cheers,

David / dhildenb

