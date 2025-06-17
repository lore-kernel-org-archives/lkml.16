Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2D1292B2D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152075; cv=none; b=d56TJ6itfCnxD385wS2RJLNQ8UVnabcIZNBN63OG9VRwJ9G9XnZdxN47AAjehaXSAcMCdXe9z7zrdYybuA33QxbFqaRIXSDZXeVg9CmnFEz3qZxMXyVnm0DQPeWFsVIUZIs96n8eIAANoJcMhwpDaEODyMep3+rvg11vMiS001A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152075; c=relaxed/simple;
	bh=pv6NOo0JjJRQSbVugTbjenxxKrUDmgUgtZePZT4E2Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLHS6J4+TNpVNmXoD4JRr1sgJ515FpasBiVMhaVDBj+Eo7tC0Hyt1wg6DJKBpFHdeBBqFk09tqJ0/sU5awa0KHCO+1VnMCSUF/Mp5vltb88mQRmBwlfoRa1SbV4gyuRXV105RJEiEVKxbGfiOwIsDXzSUqKzWtapm2UcUjq/y2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Dd6FDGyg; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Dd6FDGyg"
Message-ID: <142cb257-6c04-4a8f-9153-4759c50aff4e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750152068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7X3zKdDa6C/f9djBhnhvhmD9Fs51aNtXIyVNL1VTRk=;
	b=Dd6FDGygEjufLhqJ9Z2/eOK4jp/IHSPlY3m5/IVJQmj1cgBIsMiDOIK679YmM/lxK1ekB4
	/I7zRM9rZTaQYTK+glOlivsdq9XXfgqOkYJUFgOYrENTLXNBtqUdRr/vty+CPcPhGC9x5c
	PvcfiWXfd3FBbEkTNvNZ8GjfRTL1Trc=
Date: Tue, 17 Jun 2025 17:21:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, 21cnbao@gmail.com, david@redhat.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lance Yang <ioworker0@gmail.com>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <6181fd25-6527-4cd0-b67f-2098191d262d@lucifer.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <6181fd25-6527-4cd0-b67f-2098191d262d@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/17 16:50, Lorenzo Stoakes wrote:
> Lace - To simplify and not get bogged down in sub-threads am replying at the top
> level.
> 
> TL;DR this fix is incorrect, but the issue is correct :)
> 
> So the patch at [0] introduced by Barry changed things in a way that _appears_
> broken but in fact aren't, however we should do something about this, obviously.
> 
> That patch added:
> 
> 	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
> 		vma = try_vma_read_lock(mm, madv_behavior, start, end);
> 		if (vma) {
> 			error = visit(vma, &prev, start, end, arg);
> 			vma_end_read(vma);
> 			return error;
> 		}
> 	}
> 
> And the problem is, in this case, we don't initialise prev.
> 
> In all other cases, we do (under mmap lock):
> 
> 	vma = find_vma_prev(mm, start, &prev);
> 	if (vma && start > vma->vm_start)
> 		prev = vma;
> 
> The reason this isn't a problem is that the only madvise operation that
> currently supports this, madvise_dontneed_free() will initialise *prev = vma.
> 
> BUT we really shouldn't be relying on this, so I attach a fixpatch.
> 
> Given Barry's patch isn't mainline yet, I think this should just be squashed
> into that as a fix?
> 
> It kind of sucks to do this, but it resolves any potential bug.
> 
> I think a follow up is needed, as there's an implicit assumption it seems that
> prev is updated immediately for most callers, but of course anon_vma_name is a
> special snowflake.
> 
> todos++;

Ah, please keep me in the loop ;)

> 
> Lance - I suggest you reply to Barry's series with the below fix, or I can if
> you prefer?

Sure, go ahead!

Thanks,
Lance

> 
> [0]: https://lore.kernel.org/linux-mm/20250607220150.2980-1-21cnbao@gmail.com/
> 
> Thanks!
> 
> On Tue, Jun 17, 2025 at 10:05:43AM +0800, Lance Yang wrote:
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> The prev pointer was uninitialized, which could lead to undefined behavior
>> where its address is taken and passed to the visit() callback without being
>> assigned a value.
>>
>> Initializing it to NULL makes the code safer and prevents potential bugs
>> if a future callback function attempts to read from it.
>>
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>> ---
>>   mm/madvise.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/madvise.c b/mm/madvise.c
>> index 267d8e4adf31..c87325000303 100644
>> --- a/mm/madvise.c
>> +++ b/mm/madvise.c
>> @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>>   				   struct vm_area_struct **prev, unsigned long start,
>>   				   unsigned long end, void *arg))
>>   {
>> +	struct vm_area_struct *prev = NULL;
>>   	struct vm_area_struct *vma;
>> -	struct vm_area_struct *prev;
>> -	unsigned long tmp;
>>   	int unmapped_error = 0;
>> +	unsigned long tmp;
>>   	int error;
>>
>>   	/*
>> --
>> 2.49.0
>>
> 
> ----8<----
>  From c8dc9f5b2929e389cac44b79201fff43e0ab8195 Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Tue, 17 Jun 2025 09:46:27 +0100
> Subject: [PATCH] fix
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   mm/madvise.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 267d8e4adf31..45ea4588e34e 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1549,6 +1549,7 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>   	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
>   		vma = try_vma_read_lock(mm, madv_behavior, start, end);
>   		if (vma) {
> +			*prev = vma;
>   			error = visit(vma, &prev, start, end, arg);
>   			vma_end_read(vma);
>   			return error;
> --
> 2.49.0

