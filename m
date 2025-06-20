Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC49819CC28
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750387425; cv=none; b=sxX6HwZ9njrDl6Jf4Vao9VnrNs7sx0XRDRPHmMQQuL1sRWuKpqPDhe928JrInG4Hn67+qbxUGUJFuZbZPmX93pczzWRPJGxEkZy5O1BlUPXqGSjWCw9CQaYdvs26bvcNtjcWqZZU5wDXKgMVgeTQJJPUqw8KzvTDLqyCoLs5uHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750387425; c=relaxed/simple;
	bh=X6F8Hxlpdo8cDBqkmziXbgk/jGIm25DmRbQlDfS5rCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZPJezzcbn6+3Axh5GqLDW+TClnJEY1Jbzog/TC4PaU+OsxtUftKCzp415q/6DlGZulujG+yYWCzXl+pBwppAx13zcq3FOISUll2VV6F3LH2/4yoSSjl4gWWGqnSR0LhZNrZQ2E5/5GTTvFyHSxErbskmZBEeLIoBPVs6l/qyAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WlDeylwU; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WlDeylwU"
Message-ID: <4729217e-9bf5-48c8-9f93-fd33b66c5bcd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750387420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lgwgyegTdT3f5qQApwrjsK2gfY5fA2rr2Nr5ai/4OzQ=;
	b=WlDeylwUnzYoXMFi/YDPO7NJFj5s0X5DiWFp8+ONlvI8vk9TYvt/PRiAlpErdQHEsv45Su
	I+ZWvGRW6W7PvodixwvhzUPXLxBWjR8jsvIBZJE/M866PLOGoaZbfzbtXb1HXDMQzypbE8
	9cV8eIblvQU7Pwwn7T400TJlwXMLTRw=
Date: Fri, 20 Jun 2025 10:43:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] mm/madvise: remove the visitor pattern and thread
 anon_vma state
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Zi Yan <ziy@nvidia.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <4239e727b98763856b86cbd9eeaa0ba792eb2394.1750363557.git.lorenzo.stoakes@oracle.com>
 <85146A1C-767D-4761-A37D-3F2248F0C7E7@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <85146A1C-767D-4761-A37D-3F2248F0C7E7@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/20 09:32, Zi Yan wrote:
> On 19 Jun 2025, at 16:26, Lorenzo Stoakes wrote:
> 
>> Now we have the madvise_behavior helper struct we no longer need to mess
>> around with void* pointers in order to propagate anon_vma_name, and this
>> means we can get rid of the confusing and inconsistent visitor pattern
>> implementation in madvise_vma_anon_name().
>>
>> This means we now have a single state object that threads through most of
>> madvise()'s logic and a single code path which executes the majority of
>> madvise() behaviour (we maintain separate logic for failure injection and
>> memory population for the time being).
>>
>> Note that users cannot inadvertently cause this behaviour to occur, as
>> madvise_behavior_valid() would reject it.
>>
>> Doing this results in a can_modify_vma_madv() check for anonymous VMA name
>> changes, however this will cause no issues as this operation is not
>> prohibited.
>>
>> We can also then reuse more code and drop the redundant
>> madvise_vma_anon_name() function altogether.
>>
>> Additionally separate out behaviours that update VMAs from those that do
>> not.
>>
>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> ---
>>   mm/madvise.c | 167 +++++++++++++++++++++++++++------------------------
>>   1 file changed, 90 insertions(+), 77 deletions(-)
>>
>> diff --git a/mm/madvise.c b/mm/madvise.c
>> index 070132f9842b..9dd935d64692 100644
>> --- a/mm/madvise.c
>> +++ b/mm/madvise.c
>> @@ -37,6 +37,9 @@
>>   #include "internal.h"
>>   #include "swap.h"
>>
>> +#define __MADV_SET_ANON_VMA_NAME (-1)
>> +#define __MADV_CLEAR_ANON_VMA_NAME (-2)
>> +
> 
> These are stored in madvise_behavior.behavior field and used
> internally. At least you could add a comment in mman-common.h
> about this use, in case someone uses these values for MADV_*.
> Yes, these are large values that are very unlikely to be used,
> but who knows whether one will use them. :)
> 
>>   /*
>>    * Maximum number of attempts we make to install guard pages before we give up
>>    * and return -ERESTARTNOINTR to have userspace try again.
>> @@ -59,9 +62,13 @@ struct madvise_behavior {
>>   	int behavior;
>>   	struct mmu_gather *tlb;
>>   	enum madvise_lock_mode lock_mode;
>> +	struct anon_vma_name *anon_name;
>>   };
>>
>>   #ifdef CONFIG_ANON_VMA_NAME
>> +static int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>> +		unsigned long end, struct madvise_behavior *madv_behavior);
>> +
>>   struct anon_vma_name *anon_vma_name_alloc(const char *name)
>>   {
>>   	struct anon_vma_name *anon_name;
>> @@ -112,6 +119,48 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>>
>>   	return 0;
>>   }
>> +
>> +int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>> +			  unsigned long len_in, struct anon_vma_name *anon_name)
>> +{
>> +	unsigned long end;
>> +	unsigned long len;
>> +	struct madvise_behavior madv_behavior = {
>> +		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
>> +		.anon_name = anon_name,
>> +	};
>> +
>> +	if (start & ~PAGE_MASK)
>> +		return -EINVAL;
>> +	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
>> +
>> +	/* Check to see whether len was rounded up from small -ve to zero */
>> +	if (len_in && !len)
>> +		return -EINVAL;
>> +
>> +	end = start + len;
>> +	if (end < start)
>> +		return -EINVAL;
>> +
>> +	if (end == start)
>> +		return 0;
>> +
>> +	madv_behavior.behavior =
>> +		anon_name ? __MADV_SET_ANON_VMA_NAME : __MADV_CLEAR_ANON_VMA_NAME;
> 
> How are __MADV_SET_ANON_VMA_NAME and __MADV_CLEAR_ANON_VMA_NAME used?
> It seems to me that madvise_vma_behavior() treats them the same.
> Why does anon_name is NULL or not make a difference?
> 
>> +
>> +	return madvise_walk_vmas(mm, start, end, &madv_behavior);
>> +}
>> +
>> +static bool is_anon_vma_name(int behavior)
> 
> Maybe update_anon_vma_name()? Otherwise the function reads like
> the behavior can be anon_vma_name.
> 
>> +{
>> +	switch (behavior) {
>> +	case __MADV_SET_ANON_VMA_NAME:
>> +	case __MADV_CLEAR_ANON_VMA_NAME:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>>   #else /* CONFIG_ANON_VMA_NAME */
>>   static int replace_anon_vma_name(struct vm_area_struct *vma,
>>   				 struct anon_vma_name *anon_name)
>> @@ -121,6 +170,11 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>>
>>   	return 0;
>>   }
>> +
>> +static bool is_anon_vma_name(int behavior)
>> +{
>> +	return false;
>> +}
>>   #endif /* CONFIG_ANON_VMA_NAME */
>>   /*
>>    * Update the vm_flags on region of a vma, splitting it or merging it as
>> @@ -1252,13 +1306,12 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
>>   static int madvise_vma_behavior(struct vm_area_struct *vma,
>>   				struct vm_area_struct **prev,
>>   				unsigned long start, unsigned long end,
>> -				void *behavior_arg)
>> +				struct madvise_behavior *madv_behavior)
>>   {
>> -	struct madvise_behavior *arg = behavior_arg;
>> -	int behavior = arg->behavior;
>> -	int error;
>> -	struct anon_vma_name *anon_name;
>> +	int behavior = madv_behavior->behavior;
>> +	struct anon_vma_name *anon_name = madv_behavior->anon_name;
>>   	vm_flags_t new_flags = vma->vm_flags;
>> +	int error;
>>
>>   	if (unlikely(!can_modify_vma_madv(vma, behavior)))
>>   		return -EPERM;
>> @@ -1275,7 +1328,17 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
>>   	case MADV_FREE:
>>   	case MADV_DONTNEED:
>>   	case MADV_DONTNEED_LOCKED:
>> -		return madvise_dontneed_free(vma, prev, start, end, arg);
>> +		return madvise_dontneed_free(vma, prev, start, end,
>> +					     madv_behavior);
>> +	case MADV_COLLAPSE:
>> +		return madvise_collapse(vma, prev, start, end);
>> +	case MADV_GUARD_INSTALL:
>> +		return madvise_guard_install(vma, prev, start, end);
>> +	case MADV_GUARD_REMOVE:
>> +		return madvise_guard_remove(vma, prev, start, end);
>> +
>> +	/* The below behaviours update VMAs via madvise_update_vma(). */
>> +
> 
> Great comment and code move!
> 
>>   	case MADV_NORMAL:
>>   		new_flags = new_flags & ~VM_RAND_READ & ~VM_SEQ_READ;
>>   		break;
>> @@ -1325,21 +1388,25 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
>>   		if (error)
>>   			goto out;
>>   		break;
>> -	case MADV_COLLAPSE:
>> -		return madvise_collapse(vma, prev, start, end);
>> -	case MADV_GUARD_INSTALL:
>> -		return madvise_guard_install(vma, prev, start, end);
>> -	case MADV_GUARD_REMOVE:
>> -		return madvise_guard_remove(vma, prev, start, end);
>> +	case __MADV_SET_ANON_VMA_NAME:
>> +	case __MADV_CLEAR_ANON_VMA_NAME:


Would this be clearer and more closely describe the code's logic?

		/* Reject naming for regular file-backed mappings. */


>> +		/* Only anonymous mappings can be named */
>> +		if (vma->vm_file && !vma_is_anon_shmem(vma))
>> +			return -EBADF;
>> +		break;
>>   	}


Thanks,
Lance

> 
> __MADV_SET_ANON_VMA_NAME and __MADV_CLEAR_ANON_VMA_NAME are
> used here the code below. I do not see the functional difference
> of them. I understand a NULL anon_name means clear the name,
> but it is also just set the name to NULL.
> 
>>
>>   	/* We cannot provide prev in this lock mode. */
>> -	VM_WARN_ON_ONCE(arg->lock_mode == MADVISE_VMA_READ_LOCK);
>> -	anon_name = anon_vma_name(vma);
>> -	anon_vma_name_get(anon_name);
>> +	VM_WARN_ON_ONCE(madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK);
>> +
>> +	if (!is_anon_vma_name(behavior)) {
>> +		anon_name = anon_vma_name(vma);
>> +		anon_vma_name_get(anon_name);
>> +	}
>>   	error = madvise_update_vma(vma, prev, start, end, new_flags,
>>   				   anon_name);
>> -	anon_vma_name_put(anon_name);
>> +	if (!is_anon_vma_name(behavior))
>> +		anon_vma_name_put(anon_name);
> 
> Otherwise, the rest looks good to me.
> 
> --
> Best Regards,
> Yan, Zi

