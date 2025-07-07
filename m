Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B652829AAFE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891228; cv=none; b=NEhmepwhJ5Ou+JyJNqir7OH5ZK81lyD1Ez8A/NfJMJIVE/tzNzBtjhyzmQ5vIWRbhaFYepw53dReKWrKQbYq5EZ6sbJXV30EhWZEJIDNwQbNY02iu1bm2RsOBOpzj/Q+JYQdMsfrPLqx9/rIR1wg6BaztB5Qc67MpO3zrtvhh1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891228; c=relaxed/simple;
	bh=SiamkW4p0sHmPHfw0HI98RA2vEVf9L1sceBboAOadc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VaT3QFBQPOoRAkSbtNnUu9MnI3vGTrmaA5KTX5/psEbRaIV4niCC+PhlqyRwNoHww4NlDBxqCZBSmrHfzfaC6ujV02IJHao3s6qfwS42KTgVVJzQDVSh+vfJgM4JoCwDbnsJwD9KSQcJglgqsZfE2kXp4oUMe/e8qspyplAQ5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PNf/4sKk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PNf/4sKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751891225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wY8lE8wC8eAfhb8ll785VUJiuBffYyzCALhS+n19wVM=;
	b=PNf/4sKkOPTlyqFbD56VPbg9gAvylEcRDKPi3oyYJy2h6pWNR2tnCo4khBp1L/oI5Tnswz
	O0WxsNiE55uzBIv8aqJ6ySxxRYuCD2dCxzFPy7ahMpJ2noQEG7sm46FkOBh9r8Yv2ajAk2
	FCiDCre5D7PAJ5X+1NV4P33tHt4hyb4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-0nEr6JlEMjeQbegz3iJV8A-1; Mon, 07 Jul 2025 08:27:04 -0400
X-MC-Unique: 0nEr6JlEMjeQbegz3iJV8A-1
X-Mimecast-MFC-AGG-ID: 0nEr6JlEMjeQbegz3iJV8A_1751891223
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-453691d0a1dso16688385e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751891223; x=1752496023;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wY8lE8wC8eAfhb8ll785VUJiuBffYyzCALhS+n19wVM=;
        b=Tscq2er2yMccd3S7kl1Nn0dw4n8LMhuG76JNM5NqIEOfwC3/hB5iM5qCqrUJi/CTTw
         FTMYGkz8HaorBhOfh3TQcw3lSCKYt41C42jRtPLmNlf/Ju89kL1K9JYcjR0Kh77EIgZ2
         LhfC1JJV7uyfh2ZGYdfc7GLM6YDyX9Z7+rj4/Ek86OAlj6FrWkMst4/DO3vUSQpb5t8U
         0wNb+Q7gMO5WCifVfr+/r0LE7X7yyyF+IJEm90QiJUp4y6FhNDkW0pIaRIKtikggqu7m
         42gaBR1Uj6Jp++Y66V4CtEfb5ZjYUfu2U1lySwmfa0MNTrJXdGe9/Zi3HWAH7Y/u38kk
         UzMA==
X-Gm-Message-State: AOJu0Yyyy/kUsyPE7TKXYEqv5ljHE+eWSzVIdCLY/gNP+Fu3rqjGMXUO
	cfNhWqP8T5ES5wy0iuqd/DyAj3vRsC0KKybxHyUe3nT+UCSs4aDShx+mUrrfOEDmRLhbh1uZcfv
	ctO8XvUiS6jQNrN1r5+pzyakeoASOlI+NXqrEDbz2AkDYXMuHRZWJczDk0opRY1/q6Q==
X-Gm-Gg: ASbGnctrUoL2ghii191+AkHKkZxIx8MIizd9FVOPjuy6v+bmTtLBpm7x+txktEelBYL
	QszyEeQIhpLGtyitbFlc9fJa7UZ7EWLuRVdegJ3ZHNkj6HJ4reJZ21jdIGZyaCPkNyUhyIjC8YF
	gTEmAGO2j7HgZkMKnHHIXiUHUXRU8oGG1Xq2lLwDgk1xUEcima2dmSM4T+fjlifg43Y8kpxnWA4
	YALNLBcxOkAmRxifPT1sz47UYxo9K5+eTzn8jpeCze3TBB5Ah4PveQqWE976DfCkIb9xn4qpRew
	y+XGSW4YtWMIZWynaMVu8I4nIRKip8J9V69IocF3OrarqaYrsAiE8MibAaV3gbFn/TwiVCIOjv2
	cyqsuKH1j2CjNEjPEf0CVTs6NutIsT+4PONJz+S8uch8u2xYKRQ==
X-Received: by 2002:a05:6000:24c9:b0:3a5:541c:b40f with SMTP id ffacd0b85a97d-3b49700c57cmr9811112f8f.9.1751891223262;
        Mon, 07 Jul 2025 05:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGg0YwhBPmAg1bf9YjDTrSJkMLz1ztSLKmgPprux2EAywCbSdveDKfoeqqEqisiVJiYs3rJg==
X-Received: by 2002:a05:6000:24c9:b0:3a5:541c:b40f with SMTP id ffacd0b85a97d-3b49700c57cmr9811087f8f.9.1751891222801;
        Mon, 07 Jul 2025 05:27:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f38:1d00:657c:2aac:ecf5:5df8? (p200300d82f381d00657c2aacecf55df8.dip0.t-ipconnect.de. [2003:d8:2f38:1d00:657c:2aac:ecf5:5df8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0a5csm9878091f8f.29.2025.07.07.05.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 05:27:02 -0700 (PDT)
Message-ID: <ea66f8a5-de20-4f6e-afcc-2eda84709958@redhat.com>
Date: Mon, 7 Jul 2025 14:27:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] mm/memory: fix null pointer dereference in
 fault_dirty_shared_page
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yuntao Liu <liuyuntao12@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
 surenb@google.com, rppt@kernel.org, vbabka@suse.cz, Liam.Howlett@oracle.com,
 akpm@linux-foundation.org
References: <20250707105118.413056-1-liuyuntao12@huawei.com>
 <2b716e2f-0642-49df-a955-abfe0525cefd@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <2b716e2f-0642-49df-a955-abfe0525cefd@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.07.25 13:14, Lorenzo Stoakes wrote:
> On Mon, Jul 07, 2025 at 10:51:18AM +0000, Yuntao Liu wrote:
>> Page mapping with "VM_READ|VM_WRITE|VM_MAYREAD|VM_MAYWRITE|VM_SHARED",
>> the first time accessing this address through a write operation will
>> trigger a do_shared_fault, if mapping is anonymous, it can lead to a
>> null pointer dereference.
> 
> How can it be anonymous with VM_SHARED set? This would be a far, far bigger
> bug.
> 
>>
>> [   23.232336][  T195] Call trace:
>> [   23.232542][  T195]  file_update_time+0x2c/0xd8
>> [   23.232801][  T195]  fault_dirty_shared_page+0x1a0/0x220
>> [   23.233099][  T195]  do_shared_fault+0xe8/0x240
>> [   23.233374][  T195]  do_fault+0x78/0x240
>> [   23.233629][  T195]  handle_pte_fault+0x1f0/0x3f0
>> [   23.233905][  T195]  __handle_mm_fault+0x2b0/0x548
>> [   23.234186][  T195]  handle_mm_fault+0xd4/0x2f8
>> [   23.234462][  T195]  do_page_fault+0x2f0/0x5f8
>> [   23.234727][  T195]  do_translation_fault+0x8c/0xc8
>> [   23.235021][  T195]  do_mem_abort+0x68/0x100
>> [   23.235283][  T195]  el0_da+0x4c/0x1a8
>> [   23.235551][  T195]  el0t_64_sync_handler+0xe4/0x158
>> [   23.235861][  T195]  el0t_64_sync+0x37c/0x380
> 
> How have you obtained this? Are you somehow injecting invalid state here?
> 
>>
>> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
>> ---
>>   mm/memory.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index eaf98d518289..8106ef8a5036 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -3412,7 +3412,7 @@ static vm_fault_t fault_dirty_shared_page(struct vm_fault *vmf)
>>   	mapping = folio_raw_mapping(folio);
>>   	folio_unlock(folio);
>>
>> -	if (!page_mkwrite)
>> +	if (!page_mkwrite && vma->vm_file)
> 
> The function is ltierally fault_dirty_shared_page(), how are we arriving
> here with !vma->vm_file?

IIRC, MAP_ANON |MAP_SHARED would have done a shmem_zero_setup().

mm/mmap.c still has the comment "mmap_region() will call 
shmem_zero_setup() to create a file".

I think this was moved to __mmap_new_vma().

Is there any (error) path where we could not call that by accident?

-- 
Cheers,

David / dhildenb

