Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF2076026
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148318; cv=none; b=nZ0QEUK6/ZWk0Xep3vJtKPcC4Wx52/Czm04QfdJh1vg7IHYEcTBmxsiatYdORUtQGNtrIgdl0Aiq3+Xd9RPef4UO5D1+xV+r2zxQPzyD9GFaHZF1fuYjNUc2o7vWNUHfObtZP33447+Zl5OQxWMNk5xJ3Qd9clhDeJaqrEeB8lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148318; c=relaxed/simple;
	bh=7ktTNoTJKeacOqxjY219tiUAsNfWDVlw8BwzLZN/7uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSIz+gAVBBneDdLiTnKPgdMTaw5zOm1oCuysC/6+TqB+/Wixbp2RbjlFjRQZj/DA1KcF1bnxrKvDVUH+Y/aP9a7AvZZ0wmPc9OQ51ggfy3mSrklNkj36v9K22OwIMNMoz/R5tEAPl8E6S5wALr1pSn/fwMmTxD2Vwt5DVM0ka/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FDckDr/M; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FDckDr/M"
Message-ID: <a6c69b04-6857-4021-8b7c-85398778deab@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750148312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A1FkqVxwYvuLbKfximV4nOd1sO0YqsqNdMqotcHBlZM=;
	b=FDckDr/MWkYDaipG5ywk10/+fpoBjYB42eVALTmxU/dwb9jHjKcl5xlSyC5+QquG86xjw3
	9DrjYYcQ072iMnp5ypIUpz8bfvSGeB+0JURWS9BxHh8pytjIA5eL8w0m5d4Ebe5wDbtr8M
	BlGA/RFHlPgPG68Tj33Nb5Obgt7Ww6k=
Date: Tue, 17 Jun 2025 16:18:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: 21cnbao@gmail.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, lorenzo.stoakes@oracle.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Lance Yang <ioworker0@gmail.com>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/17 15:54, David Hildenbrand wrote:
> On 17.06.25 04:05, Lance Yang wrote:
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> The prev pointer was uninitialized, which could lead to undefined 
>> behavior
>> where its address is taken and passed to the visit() callback without 
>> being
>> assigned a value.
> 
> So, we are passing the pointer value to visit(), which is not undefined 
> behavior.
> 
> The issue would be if anybody takes a look at the value stored at that 
> pointer. Because, already passing an uninitialized value to a (non- 
> inlined) function is undefined behavior according to C.

Yes, that is precisely is what I am concerned about ;)

> 
> In madvise_update_vma()->vma_modify_flags_name() we do exactly that, 
> correct?
> 
>      vma = vma_modify_flags_name(&vmi, *prev, ...
> 
> We should use Fixes: then.

Exactly, I missed that. Will add the "Fixes" tag and send out a new version.

> 
> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!
Lance

> 
>>
>> Initializing it to NULL makes the code safer and prevents potential bugs
>> if a future callback function attempts to read from it.
>>
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>> ---
>>   mm/madvise.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/madvise.c b/mm/madvise.c
>> index 267d8e4adf31..c87325000303 100644
>> --- a/mm/madvise.c
>> +++ b/mm/madvise.c
>> @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, 
>> unsigned long start,
>>                      struct vm_area_struct **prev, unsigned long start,
>>                      unsigned long end, void *arg))
>>   {
>> +    struct vm_area_struct *prev = NULL;
>>       struct vm_area_struct *vma;
>> -    struct vm_area_struct *prev;
>> -    unsigned long tmp;
>>       int unmapped_error = 0;
>> +    unsigned long tmp;
>>       int error;
>>       /*
> 
> 

