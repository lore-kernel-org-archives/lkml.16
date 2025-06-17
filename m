Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062D019F421
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750140215; cv=none; b=Lcaxb5OgMXVQW1JfmV/85DXxApcC9NretO+BUrBA66Z8a8tGcM+MMPnSV+uzGiN89Qt/r0BER7MxZjZiEPzb4yFfX62eDZ1rYMfpDu/1auY2igVjIEHV+w0bOWCt5Ef2bnK3U9qrMLU55ntNU/YgzNnZyLUa9H0wZ3MKADiuPMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750140215; c=relaxed/simple;
	bh=R85+3xivTi16MpxfaJKqNVPZkr71tEJi5+LtItNg5gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LqAYtvc30OF0uAVM2wsGMbkP2bBPnlxQHoo83puaNeHfk7CjZIE1/fWrTFIcOy3ti3nf0zFUE8qwNTipbfmj5vwyvPl2STyIBMM61e73jF11BEz4uh2AJmJcQBazPttOsOrT0ZnuCaBxOeFjJx38Rjh/lbI0WI5MtuoDARr9UDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BvCNgVhn; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BvCNgVhn"
Message-ID: <9533ce3a-4d87-4cff-b545-9e2f1afc607f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750140209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dm5gLE8p1RI+b2xU1al9yd130OkPO03e69aDHKUWjS8=;
	b=BvCNgVhnnJaBfrkxDAcwONceWTm80TxCGOZP6Sa8vhvMtQIkij3HCeciaE/5P5VdCGoaH/
	gW5+NbNF7zskB9xEJsSwPkDDB3GD6yZoTCOWckPtQRiESpB0OvA9UGXUfI4sEOXNQ/xZfm
	suIatakHQGU1UT8PlH6WiK06kGGyElE=
Date: Tue, 17 Jun 2025 14:03:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, lorenzo.stoakes@oracle.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lance Yang <ioworker0@gmail.com>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <CAGsJ_4ySwMuKGYxywY+RH_FkNvjsThhvFQr+d1++KykOqjxarg@mail.gmail.com>
 <6fe09fdd-ff38-42cc-b101-520204213f82@linux.dev>
 <CAGsJ_4zsP6i9+eq66981opoFGcA5SYjMxz5GumWc5DGJW4gjPQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAGsJ_4zsP6i9+eq66981opoFGcA5SYjMxz5GumWc5DGJW4gjPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/17 13:19, Barry Song wrote:
> On Tue, Jun 17, 2025 at 4:57 PM Lance Yang <lance.yang@linux.dev> wrote:
>>
>>
>>
>> On 2025/6/17 10:24, Barry Song wrote:
>>> On Tue, Jun 17, 2025 at 2:05 PM Lance Yang <ioworker0@gmail.com> wrote:
>>>>
>>>> From: Lance Yang <lance.yang@linux.dev>
>>>>
>>>> The prev pointer was uninitialized, which could lead to undefined behavior
>>>> where its address is taken and passed to the visit() callback without being
>>>> assigned a value.
>>>>
>>>> Initializing it to NULL makes the code safer and prevents potential bugs
>>>> if a future callback function attempts to read from it.
>>>
>>> Is there any read-before-write case here? I haven't found one.
>>
>>
>> It appears that the following is a call chain showing the read-before-write
>> of prev:
>>
>> -> madvise_vma_anon_name(..., struct vm_area_struct **prev, ...)
>>           Receives the address of madvise_walk_vmas's prev.
>>           Passes this pointer directly to madvise_update_vma.
>>           Note that prev is not updated before visit() is called
>>           if !(start > vma->vm_start) in the slow path.
>>
>>           -> madvise_update_vma(..., struct vm_area_struct **prev, ...)
>>                   It calls the next function with *prev.
>>
>>                   -> vma_modify_flags_name(..., *prev, ...)
>>                           Stores the value of madvise_walk_vmas's prev in
>> vmg.prev
>>                           using the VMG_VMA_STATE macro.
>>
>>                           -> vma_modify(struct vma_merge_struct *vmg)
>>                                   Receives the vmg struct.
>>                                   Passes vmg to vma_merge_existing_range.
>>
>>                                   -> vma_merge_existing_range(struct
>> vma_merge_struct *vmg)
>>                                           Retrieves the value: struct
>> vm_area_struct *prev = vmg->prev;
>>                                           The value is now used in a
>> conditional check:
>>                                           VM_WARN_ON_VMG(prev && start <=
>> prev->vm_start, vmg)
>>                                           If prev was uninitialized, this
>> would cause a crash.
> 
> Thanks!
> 
> Do you have a reproducer? I'd like to try.

Not yet ;)

It was found during code review to prevent potential bugs, and the
initialization itself is harmless.

Thanks,
Lance

> 
>>
>> Thanks,
>> Lance
>>
>>>
>>> It also looks like we're assuming that *prev == NULL implies
>>> a specific condition:
>>>
>>> *prev = NULL;   /* tell sys_madvise we drop mmap_lock */
>>>
>>> *prev = NULL; /* mmap_lock has been dropped, prev is stale */
>>>
>>>>
>>>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>>>> ---
>>>>    mm/madvise.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/mm/madvise.c b/mm/madvise.c
>>>> index 267d8e4adf31..c87325000303 100644
>>>> --- a/mm/madvise.c
>>>> +++ b/mm/madvise.c
>>>> @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>>>>                                      struct vm_area_struct **prev, unsigned long start,
>>>>                                      unsigned long end, void *arg))
>>>>    {
>>>> +       struct vm_area_struct *prev = NULL;
>>>>           struct vm_area_struct *vma;
>>>> -       struct vm_area_struct *prev;
>>>> -       unsigned long tmp;
>>>>           int unmapped_error = 0;
>>>> +       unsigned long tmp;
>>>>           int error;
>>>>
>>>>           /*
>>>> --
>>>> 2.49.0
>>>>
>>>
> 
> Thanks
> Barry

