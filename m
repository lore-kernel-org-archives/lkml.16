Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB72AE7F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359350; cv=none; b=SedLAfKVblamAqkYAS0Qn4XU4lfDTWBLT9E5JaGkjxkfAexKDmQ/3zQbUa1HHf5JveK6BGxGZpX207Q6GS3RfFNG46jRG6jS1dLIa9umFzgm9wrILjPSJWRR9ibKkKJ6tUrdTnmaRWKB7XXiy783bF3NvyQxt3SFU5zw27CrZ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359350; c=relaxed/simple;
	bh=glFLdVjV+SmRxlC4eGe85Z97j3U6cBmTC5iPfx9NWVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WEoYsWYOSfwbk2jfLWqA9/Px5G/3c4HiP+z5vTJwHlk57Ux6+YTcwuEo9GgSCKFvpvWBgsRx0Csik9ghOKjvP/+czN4Pse7j4XC2uqBY/ZtuITdWl9/1D+H8YaiL3RHkTyHMG8xB+timWHqGNIIohv5OkUZnYWuaVak83dN43b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=azQtzDFa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="azQtzDFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744359347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ivVEpFmmqTmXbovQzDT60ia4DtfARluaUZ+HrEwHddc=;
	b=azQtzDFaA1zHhzDREKCuHkIilnFGajcV0npmtPXHtY7G46DjsY9fSFoBWHbIehe3O4n0Ir
	8NxbaQ35v8nn1Xgl9tHFyFptrF8BgTVm80C9TDFi9YfUoChBhz79fLololJJ00i7CaY3fr
	hc+ZN21CHx2hQeWl+pjV+g9HM368jOQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-tF6lzySxNemfa-hZvgvK-w-1; Fri, 11 Apr 2025 04:15:45 -0400
X-MC-Unique: tF6lzySxNemfa-hZvgvK-w-1
X-Mimecast-MFC-AGG-ID: tF6lzySxNemfa-hZvgvK-w_1744359344
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so13018975e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744359344; x=1744964144;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ivVEpFmmqTmXbovQzDT60ia4DtfARluaUZ+HrEwHddc=;
        b=EzlJuyU74UPMO1lJFxDyQuaHO497xEc8JoSb4MXHbGb0sZmoa3QTQRBdITcfTLmsai
         hGgY/qxEY3pkXOV9I8OcECArh7sZ4nC9iEVdlZ07vE6ftFRi1mE7G1lALCKlxo7wMJI4
         O769WTKTHobCm6Pl/TR7mYRBiEtpaUri/J8aYKnsjny4Z/xnnwasF2dov2Tgob10OLCy
         EjN4hUU297bI8w5IjOXjVo6fLOPmNfq8n0tekORqK7MCaBSPd51kDIHcx2Vu3lItUSou
         DVn6NPQi1iZOXjMeIXEdhxDo+jyKPEfslc7hDYKefu4XP9jJ7SfFI15nYrEvmJN/wKai
         EsoA==
X-Forwarded-Encrypted: i=1; AJvYcCWqrkipXwQFsPsmZqUlSQOppy8a0n9gnYGarr43EsZFXOe/KLQPwMmpvTBQCtlUlmSW2R/+nE6RYTGNPxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81Sl/SgohAwQxO4cN/3WcQa4h/uOnTnykHpnnUPxKzqvJ7iUh
	At0VtL3ABRvKoGLH5NPjKYWhkeVu1noa+C2xJWmHbCfrKmcUMWgmX6QiJBt9SyR2FZPkVHCEJEH
	lXY5edxlpd+oIRNo7wU8atcMpBpf7BvAAMmuzmOO1Tz+oBBtFZ3Y1b9vILuQc4A==
X-Gm-Gg: ASbGncsOGvAQD3jxx5RmcqQK3RSuML86gDqRx+H2v8rfpqPRiJwZcIzWE+lDe5q6n0A
	w31uP6qYcMdJb/Pvf7Xi5pwlf1bJm5UjM7t7ZUuRD0XHe8OhKRUl6Fcwp7E7PdoKOKMHIBqhcQ1
	YKRPJMiBrnNAI6kcy/tI6iv7o+G4T2T/985ssWhvkwmvnDbsPXrxP+KGfSBYFdBfyNqM3yvd0R8
	EBDAUFLTqiik2BldYk3QqcPHJLPjy1FxbvlxOEW8VTXZn5dDjDq6WIGkeumpf3Zo1QJVMyXbEJG
	6YCzCifhWhGSAZm9GgN+MdTlG8ylRRQ3AHVctHHnQ7eEW6vu0reWeZY/GtN9YwiJIHSb+H5PZku
	V7BAmeKA5c7otQonaEFgwt/stu9FvPsil5y6c
X-Received: by 2002:a05:600c:3848:b0:43d:988b:7732 with SMTP id 5b1f17b1804b1-43f3a94d9bbmr13971965e9.14.1744359344317;
        Fri, 11 Apr 2025 01:15:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYbwrYzF5ACvieHvZ2EasQcPng/7b1Zy3Ik2suvtSEqmT/HL1se3+khlqkbA4OGA8iyPfXvQ==
X-Received: by 2002:a05:600c:3848:b0:43d:988b:7732 with SMTP id 5b1f17b1804b1-43f3a94d9bbmr13971715e9.14.1744359344003;
        Fri, 11 Apr 2025 01:15:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c726:6800:7ddf:5fc:2ee5:f08a? (p200300cbc72668007ddf05fc2ee5f08a.dip0.t-ipconnect.de. [2003:cb:c726:6800:7ddf:5fc:2ee5:f08a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625ea4sm79131475e9.12.2025.04.11.01.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:15:43 -0700 (PDT)
Message-ID: <5a37ec06-ff98-475a-8998-0330dc8073c0@redhat.com>
Date: Fri, 11 Apr 2025 10:15:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/base/memory: Avoid overhead from
 for_each_present_section_nr()
To: Gavin Shan <gshan@redhat.com>, Oscar Salvador <osalvador@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, adityag@linux.ibm.com,
 donettom@linux.ibm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
 dakr@kernel.org, akpm@linux-foundation.org, shan.gavin@gmail.com
References: <20250410125110.1232329-1-gshan@redhat.com>
 <9deb3725-8991-43d1-8c3d-56523fabff28@redhat.com>
 <Z_fNx7hTOR8St0SM@localhost.localdomain>
 <Z_fR6c4o1V57ZAXR@localhost.localdomain>
 <a950dd20-d7eb-429b-b638-2df68208918d@redhat.com>
 <44dff493-9d79-4343-ba81-0c262d7a5b4e@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <44dff493-9d79-4343-ba81-0c262d7a5b4e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.04.25 07:04, Gavin Shan wrote:
> On 4/11/25 12:25 AM, David Hildenbrand wrote:
>> On 10.04.25 16:12, Oscar Salvador wrote:
>>> On Thu, Apr 10, 2025 at 03:55:19PM +0200, Oscar Salvador wrote:
>>>> All in all, I think we are better, and the code is slightly simpler?
>>>
>>> One thing to notice is that maybe we could further improve and leap 'nr'
>>> by the number of sections_per_block, so in those scenarios where
>>> a memory-block spans multiple sections this could be faster?
>>
>> Essentially, when we created a block we could always start with the next section that starts after the block.
>>
> 
> I think it's a good point. Tried a quick test on a ARM64 machine whose memory
> capacity is 1TB. Leaping 'nr' by 'sections_per_block' improves the performance a bit,
> even it's not too much. The time taken by memory_dev_init() drops from 110ms to 100ms.
> For the IBM Power9 machine (64GB memory) I have, there are not too much space to be
> improved because the time taken by memory_dev_init() is only 10ms. I will post a patch
> for review after this patch gets merged, if you agree.
> 
>           for_each_present_section_nr(0, nr) {
> -               if (block_id != ULONG_MAX && memory_block_id(nr) == block_id)
> -                       continue;
> -
> -               block_id = memory_block_id(nr);
> -               ret = add_memory_block(block_id, MEM_ONLINE, NULL, NULL);
> +               ret = add_memory_block(memory_block_id(nr), MEM_ONLINE, NULL, NULL);
>                   if (ret) {
>                           panic("%s() failed to add memory block: %d\n",
>                                 __func__, ret);
>                   }
> +
> +               /* Align to next block, minus one section */

/*
  * Forward to the last section in this block, so we'll process the first
  * section of the next block in the next iteration.
  */

> +               nr = ALIGN(nr + 1, sections_per_block) - 1;

Yeah, that should work.

-- 
Cheers,

David / dhildenb

