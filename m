Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F97B237186
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750136263; cv=none; b=MpMwihWN719D1H7gJg4thMTbdrjML90CHm7Qzzss151b9NUNZR7dQls90Wevaa+fT4cGw5aiYa/m7fMGMINrIu8Vj47o2nGEOhsFSez6oJPWaQSdWxl+AVoC3KBWxc5iIjD4PcwtyLQ8WkkRA4ZKFlojBIH4wq8IiGADc1RdeWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750136263; c=relaxed/simple;
	bh=BZYBtu3U7DmGbJSr/+Gu0BBaUmqGnffbGRgchTXcodI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gn0Y2Xv8crl2GVcL6Ee+aDqH8fV1s6+OIAI0HYSuW22MMp+23X4wjne9DJkY/Plwjs5gZPo5qexoZEsGFT0RT6ZDnlsim5ij5kjuOKtE7sGZz2J0QbqoqyIbvgS4ITL07ofndUE/jDFBPAZrL5vZWkqinh9YGjg+7CF17YiXrm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Nnj3aTky; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Nnj3aTky"
Message-ID: <6fe09fdd-ff38-42cc-b101-520204213f82@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750136259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hil9x3SFzq0mA+kmRpahAqJWFan5rxRExJSxI+VuBQQ=;
	b=Nnj3aTkyKFWn5UoeLEZXeEpKoUqzrDCgq+nvpHkVZfecwktvJRTRjwxzH2dL7SKT60cOMj
	OWHl1w7S+HvNNnEzayFg1BdLF5iuDIJv8VdTZTl+utRc6X9uguWdOu7QabZ9JQmSvzzT1a
	sjUn9TFaYj4zYj+sjWoUoirA4BNenAY=
Date: Tue, 17 Jun 2025 12:57:29 +0800
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAGsJ_4ySwMuKGYxywY+RH_FkNvjsThhvFQr+d1++KykOqjxarg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/17 10:24, Barry Song wrote:
> On Tue, Jun 17, 2025 at 2:05 PM Lance Yang <ioworker0@gmail.com> wrote:
>>
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> The prev pointer was uninitialized, which could lead to undefined behavior
>> where its address is taken and passed to the visit() callback without being
>> assigned a value.
>>
>> Initializing it to NULL makes the code safer and prevents potential bugs
>> if a future callback function attempts to read from it.
> 
> Is there any read-before-write case here? I haven't found one.


It appears that the following is a call chain showing the read-before-write
of prev:

-> madvise_vma_anon_name(..., struct vm_area_struct **prev, ...)
         Receives the address of madvise_walk_vmas's prev.
         Passes this pointer directly to madvise_update_vma.
         Note that prev is not updated before visit() is called
         if !(start > vma->vm_start) in the slow path.

         -> madvise_update_vma(..., struct vm_area_struct **prev, ...)
                 It calls the next function with *prev.

                 -> vma_modify_flags_name(..., *prev, ...)
                         Stores the value of madvise_walk_vmas's prev in 
vmg.prev
                         using the VMG_VMA_STATE macro.

                         -> vma_modify(struct vma_merge_struct *vmg)
                                 Receives the vmg struct.
                                 Passes vmg to vma_merge_existing_range.

                                 -> vma_merge_existing_range(struct 
vma_merge_struct *vmg)
                                         Retrieves the value: struct 
vm_area_struct *prev = vmg->prev;
                                         The value is now used in a 
conditional check:
                                         VM_WARN_ON_VMG(prev && start <= 
prev->vm_start, vmg)
                                         If prev was uninitialized, this 
would cause a crash.

Thanks,
Lance

> 
> It also looks like we're assuming that *prev == NULL implies
> a specific condition:
> 
> *prev = NULL;   /* tell sys_madvise we drop mmap_lock */
> 
> *prev = NULL; /* mmap_lock has been dropped, prev is stale */
> 
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
>>                                     struct vm_area_struct **prev, unsigned long start,
>>                                     unsigned long end, void *arg))
>>   {
>> +       struct vm_area_struct *prev = NULL;
>>          struct vm_area_struct *vma;
>> -       struct vm_area_struct *prev;
>> -       unsigned long tmp;
>>          int unmapped_error = 0;
>> +       unsigned long tmp;
>>          int error;
>>
>>          /*
>> --
>> 2.49.0
>>
> 
> Thanks
> Barry

