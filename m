Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2174235360
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596432; cv=none; b=Q1X5bLOx7eC4np+CNHGfaF+nQ0q1zELLvoNSR1EA3TM23/MkisAYEKtXqms34raldxeCU4NyuVLmirQGtWGxl66eYnZ4sby6cdFrXooByVJ1w10f5JNcV2vD/IknG6yC2hHFx6w6DilQj/923wyZoUnnrHAP0UYNGMvb6FIU4NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596432; c=relaxed/simple;
	bh=70nOqGYqrti79Y9MLuNG9YlKmlnR5yWu2hjCwtxkfuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJs491YF7wof61jqKC9y/PwDaZmQo9IqDwkORv5kxNh4f/55SPksfmIE870LZ6utbTEsEKAAYZtx1Mina/159BIrCJwG7insj49mIR0/2bNxbEwZFylzYJe6ZlIpcAFipMDAz11IcKgYFZqOhXBiNayGeCA90GmyWabzjeZGAIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MT/+5yre; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MT/+5yre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743596429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DEah2U8jPR7Oiio6Af0msiNDIaOYqYnOw4plTjzV214=;
	b=MT/+5yredkSKohN/Ja6EUf+ZdGLkKe3Tfvod/x5NfSg6yNm6tEJ1YAoSuP5FdoPgyFtLOX
	3Vwo7f2oyJKKnHEW9ps5BLH50bVucUcVsplnvDFBHYRqBAjzOcoUuLllKAJCTUUBsiAbAs
	1hifXZK+0AT6AF70j8TTH2377OiJgv4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-50LFJK75PWS-THDiR5PmfQ-1; Wed, 02 Apr 2025 08:20:28 -0400
X-MC-Unique: 50LFJK75PWS-THDiR5PmfQ-1
X-Mimecast-MFC-AGG-ID: 50LFJK75PWS-THDiR5PmfQ_1743596427
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912fe32a30so2580370f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596427; x=1744201227;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DEah2U8jPR7Oiio6Af0msiNDIaOYqYnOw4plTjzV214=;
        b=DBFyW/op/XGqxatO5n5UJxxTKPvZ/8IfFzGquOZMIlwaRzdWoDZAQWRza8alETu4mg
         fYPCrxCABND1m3pHWoQ6aiowQT9dZuXIaDS2ULwTBbE9hEYZBVloBk8ex4h54rfE7cRM
         NE+x/Ma8z748B9TatsWevMkpsK0t+3rK+0KWTNjR8dzCxAt7UFgg505i3wkSS49yFhuI
         J8+XDl6xOz4v3Pn9ToNp68Fuv+AGtlUgVzqj439V0EEzZEeVKw5OuFnHal8SAjjd2sFO
         OdUheCcaJoKmol68Rn3GSsWXECFsaKnt/tWisglIA9YYqxGwUA4NEEsJrSPZ3PN20+85
         alXQ==
X-Gm-Message-State: AOJu0YwEd6P5WLiIbvYD6XwoZfgH5N7a35FgcXlk7VI16VKn4rpoqD+m
	Pbc6tPWjg/y+yiVQS7zLP1altxKcPEfyk9C/bi8GqP8QNBVSWDtK976NdZYSjQK1GF9P+yrcUqz
	oB7Fkl93ZiO5PgMaBAnY+XoDTYSR0Y4xOgUbUyVCNfiriD+McDEdkRP45Cv5u2g==
X-Gm-Gg: ASbGncv9tGHXO28Uz1yHDgdKldflfrXCWCHFkKzMvEgJEtdlfOTaWwOP0LY3CWKkh9B
	VfCGbIF8ozoVSAri28x1lOqw0tBa8/Ifl0KXEq5copiryMMJillB9C+Sl+Ilt+ZbUssZXTvIHhd
	qPbQP8fgoWb3Qqd7090YxGf/2zWHI4VUnnMlrWzSEJx4/taZmzSnDL/hFXWA+hxGwzUK98UoPGG
	Gv+YR3WFfv5jGE2cO03Ih0BX/4SZwFs8ObnLqjwkAxnsmQXXI7LgIW1TSXStR6dLjDukmwf+Tm/
	unxa/80+jwpDtaej+cSWrGzbsrQDN5vjyOrMLhTdKc2LvHpi4jrO5U9bDhDE1N+dpkDuo7FhziJ
	bdDPVGL57VT04UB8UwMpoQSmxroA7lchD2k61gYnB
X-Received: by 2002:a05:6000:2481:b0:391:4743:6db1 with SMTP id ffacd0b85a97d-39c2364b4b7mr6105586f8f.20.1743596426885;
        Wed, 02 Apr 2025 05:20:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2fK+PYI9NatoJ1q++HXLvbxiB7el20WXfIfvjzMc17tvjgwF879p7taXMqDFimiqQmWy9ZA==
X-Received: by 2002:a05:6000:2481:b0:391:4743:6db1 with SMTP id ffacd0b85a97d-39c2364b4b7mr6105553f8f.20.1743596426304;
        Wed, 02 Apr 2025 05:20:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:cd00:4066:4674:d08:9535? (p200300cbc70fcd00406646740d089535.dip0.t-ipconnect.de. [2003:cb:c70f:cd00:4066:4674:d08:9535])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e14csm16821667f8f.76.2025.04.02.05.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:20:25 -0700 (PDT)
Message-ID: <f1544453-7bab-4e65-a6f9-d93aaedb8314@redhat.com>
Date: Wed, 2 Apr 2025 14:20:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 xingwei lee <xrivendell7@gmail.com>, yuxin wang <wang1315768607@163.com>,
 Marius Fleischer <fleischermarius@gmail.com>, Ingo Molnar
 <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Xu <peterx@redhat.com>, Liam Howlett <liam.howlett@oracle.com>
References: <20250325191951.471185-1-david@redhat.com>
 <abd1c60c-e177-4468-b097-f637bda6ff3c@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <abd1c60c-e177-4468-b097-f637bda6ff3c@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> v2 -> v3:
>> * Make some !MMU configs happy by just moving the code into memtype.c
> 
> Obviously we need to make the bots happy once again, re the issue at [0]...
> 
> [0]: https://lore.kernel.org/all/9b3b3296-ab21-418b-a0ff-8f5248f9b4ec@lucifer.local/
> 
> Which by the way you... didn't seem to be cc'd on, unless I missed it? I
> had to manually add you in which is... weird.
> 
>>
>> v1 -> v2:
>> * Avoid a second get_pat_info() [and thereby fix the error checking]
>>    by passing the pfn from track_pfn_copy() to untrack_pfn_copy()
>> * Simplify untrack_pfn_copy() by calling untrack_pfn().
>> * Retested
>>
>> Not sure if we want to CC stable ... it's really hard to trigger in
>> sane environments.
> 
> This kind of code path is probably in reality... theoretical. So I'm fine
> with this.
> 

Thanks a bunch for your review!

>>
>> ---
>>   arch/x86/mm/pat/memtype.c | 52 +++++++++++++++++++++------------------
>>   include/linux/pgtable.h   | 28 ++++++++++++++++-----
>>   kernel/fork.c             |  4 +++
>>   mm/memory.c               | 11 +++------
>>   4 files changed, 58 insertions(+), 37 deletions(-)
>>
>> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
>> index feb8cc6a12bf2..d721cc19addbd 100644
>> --- a/arch/x86/mm/pat/memtype.c
>> +++ b/arch/x86/mm/pat/memtype.c
>> @@ -984,29 +984,42 @@ static int get_pat_info(struct vm_area_struct *vma, resource_size_t *paddr,
>>   	return -EINVAL;
>>   }
>>
>> -/*
>> - * track_pfn_copy is called when vma that is covering the pfnmap gets
>> - * copied through copy_page_range().
>> - *
>> - * If the vma has a linear pfn mapping for the entire range, we get the prot
>> - * from pte and reserve the entire vma range with single reserve_pfn_range call.
>> - */
>> -int track_pfn_copy(struct vm_area_struct *vma)
>> +int track_pfn_copy(struct vm_area_struct *dst_vma,
>> +		struct vm_area_struct *src_vma, unsigned long *pfn)
> 
> I think we need an additional 'tracked' parameter so we know whether or not
> this pfn is valid.

See below.

> 
> It's kind of icky... see the bot report for context, but we we sort of need
> to differentiate between 'error' and 'nothing to do'. Of course PFN can
> conceivably be 0 so we can't just return that or an error (plus return
> values that can be both errors and values are fraught anyway).
> 
> So I guess -maybe- least horrid thing is:
> 
> int track_pfn_copy(struct vm_area_struct *dst_vma,
> 		struct vm_area_struct *src_vma, unsigned long *pfn,
> 		bool *pfn_tracked);
> 
> Then you can obviously invoke with track_pfn_copy(..., &pfn_tracked); and
> do an if (pfn_tracked) untrack_pfn_copy(...).
> 
> I'm really not in favour of just initialising PFN to 0 because there are
> code paths where this might actually get passed around and used
> incorrectly.
> 
> But on the other hand - I get that this is disgusting.

I'm in favor of letting VM_PAT take care of that. Observe how 
untrack_pfn_copy() -> untrack_pfn() takes care of that by checking for 
VM_PAT.

So this should be working as expected? No need to add something on top 
that makes it even more ugly in the caller.

> 
> 
>>   {
>> +	const unsigned long vma_size = src_vma->vm_end - src_vma->vm_start;
>>   	resource_size_t paddr;
>> -	unsigned long vma_size = vma->vm_end - vma->vm_start;
>>   	pgprot_t pgprot;
>> +	int rc;
>>
>> -	if (vma->vm_flags & VM_PAT) {
>> -		if (get_pat_info(vma, &paddr, &pgprot))
>> -			return -EINVAL;
>> -		/* reserve the whole chunk covered by vma. */
>> -		return reserve_pfn_range(paddr, vma_size, &pgprot, 1);
>> -	}
>> +	if (!(src_vma->vm_flags & VM_PAT))
>> +		return 0;
> 
> I do always like the use of the guard clause pattern :)
> 
> But here we have a case where now error = 0, pfn not set, and we will try
> to untrack it despite !VM_PAT.

Right, and untrack_pfn() is smart enough to filter that out. (just like 
for any other invokation)

> 
>> +
>> +	/*
>> +	 * Duplicate the PAT information for the dst VMA based on the src
>> +	 * VMA.
>> +	 */
>> +	if (get_pat_info(src_vma, &paddr, &pgprot))
>> +		return -EINVAL;
>> +	rc = reserve_pfn_range(paddr, vma_size, &pgprot, 1);
>> +	if (rc)
>> +		return rc;
> 
> I mean it's a crazy nit, but we use ret elsewhere but rc here, maybe better
> to use ret in both places.
> 
> But also feel free to ignore this.

"int retval;" ? ;)

> 
>>
>> +	/* Reservation for the destination VMA succeeded. */
>> +	vm_flags_set(dst_vma, VM_PAT);
>> +	*pfn = PHYS_PFN(paddr);
>>   	return 0;
>>   }
>>
>> +void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
>> +{
>> +	untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
>> +	/*
>> +	 * Reservation was freed, any copied page tables will get cleaned
>> +	 * up later, but without getting PAT involved again.
>> +	 */
>> +}
>> +
>>   /*
>>    * prot is passed in as a parameter for the new mapping. If the vma has
>>    * a linear pfn mapping for the entire range, or no vma is provided,
>> @@ -1095,15 +1108,6 @@ void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
>>   	}
>>   }
>>
>> -/*
>> - * untrack_pfn_clear is called if the following situation fits:
>> - *
>> - * 1) while mremapping a pfnmap for a new region,  with the old vma after
>> - * its pfnmap page table has been removed.  The new vma has a new pfnmap
>> - * to the same pfn & cache type with VM_PAT set.
>> - * 2) while duplicating vm area, the new vma fails to copy the pgtable from
>> - * old vma.
>> - */
> 
 > This just wrong now?

Note that I'm keeping the doc to a single place -- the stub in the 
header. (below)

Or can you elaborate what exactly is "wrong"?

> 
>>   void untrack_pfn_clear(struct vm_area_struct *vma)
>>   {
>>   	vm_flags_clear(vma, VM_PAT);
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 94d267d02372e..4c107e17c547e 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1508,14 +1508,25 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
>>   }
>>
>>   /*
>> - * track_pfn_copy is called when vma that is covering the pfnmap gets
>> - * copied through copy_page_range().
>> + * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
>> + * tables copied during copy_page_range(). On success, stores the pfn to be
>> + * passed to untrack_pfn_copy().
>>    */
>> -static inline int track_pfn_copy(struct vm_area_struct *vma)
>> +static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>> +		struct vm_area_struct *src_vma, unsigned long *pfn)
>>   {
>>   	return 0;
>>   }
>>
>> +/*
>> + * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
>> + * copy_page_range(), but after track_pfn_copy() was already called.
>> + */
> 
> Do we really care to put a comment like this on a stub function?

Whoever started this beautiful VM_PAT code decided to do it like that: 
and I think it's better kept at a single location.

> 
>> +static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
>> +		unsigned long pfn)
>> +{
>> +}
>> +
>>   /*
>>    * untrack_pfn is called while unmapping a pfnmap for a region.
>>    * untrack can be called for a specific region indicated by pfn and size or
>> @@ -1528,8 +1539,10 @@ static inline void untrack_pfn(struct vm_area_struct *vma,
>>   }
>>
>>   /*
>> - * untrack_pfn_clear is called while mremapping a pfnmap for a new region
>> - * or fails to copy pgtable during duplicate vm area.
>> + * untrack_pfn_clear is called in the following cases on a VM_PFNMAP VMA:
>> + *
>> + * 1) During mremap() on the src VMA after the page tables were moved.
>> + * 2) During fork() on the dst VMA, immediately after duplicating the src VMA.
>>    */
> 
> Can I say as an aside that I hate this kind of hook? Like quite a lot?
> 
> I mean I've been looking at mremap() of anon mappings as you know obv. but
> the thought of PFN mapping mremap()ing is kind of also a bit ugh.

I absolutely hate all of that, but I'll have to leave any cleanups to 
people with more spare time ;)

> 
>>   static inline void untrack_pfn_clear(struct vm_area_struct *vma)
>>   {
>> @@ -1540,7 +1553,10 @@ extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>>   			   unsigned long size);
>>   extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
>>   			     pfn_t pfn);
>> -extern int track_pfn_copy(struct vm_area_struct *vma);
>> +extern int track_pfn_copy(struct vm_area_struct *dst_vma,
>> +		struct vm_area_struct *src_vma, unsigned long *pfn);
>> +extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
>> +		unsigned long pfn);
>>   extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
>>   			unsigned long size, bool mm_wr_locked);
>>   extern void untrack_pfn_clear(struct vm_area_struct *vma);
>> diff --git a/kernel/fork.c b/kernel/fork.c
>> index 735405a9c5f32..ca2ca3884f763 100644
>> --- a/kernel/fork.c
>> +++ b/kernel/fork.c
>> @@ -504,6 +504,10 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>>   	vma_numab_state_init(new);
>>   	dup_anon_vma_name(orig, new);
>>
>> +	/* track_pfn_copy() will later take care of copying internal state. */
>> +	if (unlikely(new->vm_flags & VM_PFNMAP))
>> +		untrack_pfn_clear(new);
> 
> OK so maybe I'm being stupid here, but - is it the case that
> 
> a. We duplicate a VMA that has a PAT-tracked PFN map
 > b. We must clear any existing tracking so everything is 'reset' to 
zero> c. track_pfn_copy() will later in fork process set anything up we 
need here.
> 
> Is this correct?

Right. But b) is actually not "clearing any tracking" (because there is 
no tracking/reservation for the copied version yet) but marking it as 
"not tracked".

> 
>> +
>>   	return new;
>>   }
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index fb7b8dc751679..dc8efa1358e94 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -1362,12 +1362,12 @@ int
>>   copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>>   {
>>   	pgd_t *src_pgd, *dst_pgd;
>> -	unsigned long next;
>>   	unsigned long addr = src_vma->vm_start;
>>   	unsigned long end = src_vma->vm_end;
>>   	struct mm_struct *dst_mm = dst_vma->vm_mm;
>>   	struct mm_struct *src_mm = src_vma->vm_mm;
>>   	struct mmu_notifier_range range;
>> +	unsigned long next, pfn;
>>   	bool is_cow;
>>   	int ret;
>>
>> @@ -1378,11 +1378,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>>   		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
>>
>>   	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
>> -		/*
>> -		 * We do not free on error cases below as remove_vma
>> -		 * gets called on error from higher level routine
>> -		 */
>> -		ret = track_pfn_copy(src_vma);
>> +		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
>>   		if (ret)
>>   			return ret;
>>   	}
>> @@ -1419,7 +1415,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>>   			continue;
>>   		if (unlikely(copy_p4d_range(dst_vma, src_vma, dst_pgd, src_pgd,
>>   					    addr, next))) {
>> -			untrack_pfn_clear(dst_vma);
>>   			ret = -ENOMEM;
>>   			break;
>>   		}
>> @@ -1429,6 +1424,8 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>>   		raw_write_seqcount_end(&src_mm->write_protect_seq);
>>   		mmu_notifier_invalidate_range_end(&range);
>>   	}
>> +	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
>> +		untrack_pfn_copy(dst_vma, pfn);
> 
> Yeah, the problem here is that !(src_vma->vm_flags & VM_PFNMAP) is not the
> _only_ way we can not have a valid pfn.
> 
> Do we still want to untrack_pfn_copy() even if !VM_PAT?

Sure, let that be handled internally, where all the ugly VM_PAT handling 
resides.

Unless there is very good reason to do it differently.

Thanks!

-- 
Cheers,

David / dhildenb

