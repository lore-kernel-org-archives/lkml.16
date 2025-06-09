Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90B21FBC91;
	Mon,  9 Jun 2025 12:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471150; cv=none; b=mN4I4wSFA1zfyCgi1nJFD9ZmvWgssvlbsklIi30+z/F87Mp/xxpRTTn39vMFg76SH7D2FvK8rSAiLAAo7AbPtdBQruRLwd0R+UCWqOPbM6YsAeUxZcb3mDMKPqPL3E1u6mXW+YMz624lzwXD8hjl5a9i8Riu1SHKu8tW7OfbxXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471150; c=relaxed/simple;
	bh=TkDVKO5fyPmsNSZNS1lvjQeL87wVD4JhK+2OYMRm1C4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jqGwnbN7uYE5WkDKn5SMMB79RyT5uzlILJm+Art0MrwzHShtUxuk9DQaFdW3oi/nxwARaKGexkS0+heN0t057rHbmEy4KKNJasdMUNxPZNlcefWCIGtCQgeueADuA6eyop+qzRLmyymzbXYXmm61Twati/6bjAx7bQzqzFomvBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NY52ZD//; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY52ZD//"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a528243636so2422771f8f.3;
        Mon, 09 Jun 2025 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749471147; x=1750075947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vpun/tULtl0H5e1HVie0xVlPi4zB2Tu7EfAGao3SNJE=;
        b=NY52ZD//SprPzWycI+lPrxEv4LrH4Attx5ad55Y4q6hdHwbvpanr1JnvjYD9Hvjj/X
         HoMsvAxcpNEeEAhFdm1PfPSG5kDUJPA69Wt/DjWnu5jaFf+1twvnGMRAjJ13eGE5lcfN
         W6xCMAMgCpddpN6zEBH40e4TXvMhj+MaGEUsxYqwUIwytEo0q+aIkdThtLqWjTRPpQYE
         Qky7dRuH7wPDf0XW8y9r9ruoXRMvd2p89h5rIB+yPPBKaYS9bob8cDs2UpwVJl8kIzFA
         GienTLjvunNAzq2QOHrINnF7gYephFYfYCjWBDRRxbrmcBF6XtJ1zT+bPMxqiBTyNSG3
         RYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749471147; x=1750075947;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vpun/tULtl0H5e1HVie0xVlPi4zB2Tu7EfAGao3SNJE=;
        b=Vwei1PyaQIPht+++tBkRaaNJ3d/E863zXW9+xS2/m7SHK3EUyp5eohC+NRRPVYY+p2
         lPlExlT72qe80R8LbXY2bSfkqxagaKoepOOeVAivhnXOWvfyhj7FUbQk9nX/ErSePpG1
         yTsR1kDbrsV7ObPi6mtwZVDf/oyFCosc4tUzEKlBc3LiwWZLQjW4BLhzOGWBOKBSPWfT
         e7q8eZ8t/NYNT5GltFMgkRJyZTG7WR1rigsIagjUrYpdJyNdYOBoJKwO5jg2NUVV2GWc
         Z7sGDmMDoxwm+2L5p/I9Ob+G9UBLMCXsthefTvjyIu/okiQug79QXQ1eVw4o2Bh8NRRy
         8jJA==
X-Forwarded-Encrypted: i=1; AJvYcCVa4V+UL/V4tk8k5gQq8F3rbKuR5Xd8zKO1H0y4rLiq4aC8N9KMzdmOjKd0BovUp1HVbaD8vFMy2aj55mxk@vger.kernel.org, AJvYcCXk58O26lvRV9wr9hBMumS6zXjV+/uoUkNWANHq6Swbv1bTALKfM/Ay4hjuDBntYiiVRSUq2nMdKBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfR70GXR721ET6y1wckggx9Q7886wZVtkHamOflKNu1xCcnsc7
	I2Rq0Ud/vgw9f/ddJYvDhfMtTw9QQaJv+gmpvqOu0yKPR9UpcDHQbD2h
X-Gm-Gg: ASbGnct+1SdZ3j3y6HwsIcQsxDcTGj0C6JmY8JbKUnFAqHPhd7uU3vjcg3UMyV0KaPH
	5B34bKKd6D59PxGpyZ+3wq401NR535+Vmg9Wctyfn3zZFhs/OwYSffVdj1A9jircDPIzzhkmF5O
	5jkyNst0q6QW5M6khWSGoBUKvp6mLG6X8qAhYg5MiA1KjBhWnQMg1bJc6OFVQQbLcfoKIWWW4s9
	QYLxLvLWtWVHg7bNdsIbmivBM7dk2Jc7cDrXofMTcpAB6sA721B7ExqIBnv5Q2PTFtMYsp44tKk
	U1A7gQCBHNcZdORSPOJ5xFFTEhsjHj5uPcCHiVqml/jUHIizljlaG+RzNhaMQVKDe6lvt6gs1Ma
	hftdxou00E3FUfTOTpCCqMWbM0a/1QQx+9CCro63MfP7ZWnFX0S0OS0oraExXMPU=
X-Google-Smtp-Source: AGHT+IHj3m1slrOYKA98Ye1v9q7Jap88kFAbrM6JW9r3QccET9QUKTfsYMIkLaJZ5F8pwxecx//m7w==
X-Received: by 2002:a05:6000:400e:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a5319b4642mr10525747f8f.36.1749471146782;
        Mon, 09 Jun 2025 05:12:26 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm9712606f8f.16.2025.06.09.05.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 05:12:26 -0700 (PDT)
Message-ID: <b8490586-131b-4ce7-8835-aaa5437e3e97@gmail.com>
Date: Mon, 9 Jun 2025 13:12:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
From: Usama Arif <usamaarif642@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ziy@nvidia.com
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <063273aa-a852-492a-93da-ba5229f544ca@lucifer.local>
 <8200fd8b-edae-44ab-be47-7dfccab25a24@gmail.com>
Content-Language: en-US
In-Reply-To: <8200fd8b-edae-44ab-be47-7dfccab25a24@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> I dont like it either :)
> 

Pressed "Ctrl+enter" instead of "enter" by mistake which sent the email prematurely :)
Adding replies to the rest of the comments in this email.

As I mentioned in reply to David now in [1], pageblock_nr_pages is not really
1 << PAGE_BLOCK_ORDER but is 1 << min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER) when
THP is enabled.

It needs a better name, but I think the right approach is just to change
pageblock_order as recommended in [2]
 
[1] https://lore.kernel.org/all/4adf1f8b-781d-4ab0-b82e-49795ad712cb@gmail.com/
[2] https://lore.kernel.org/all/c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com/


> 
>>> +{
>>> +	return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
>>> +}
>>> +
>>>  static void set_recommended_min_free_kbytes(void)
>>>  {
>>>  	struct zone *zone;
>>> @@ -2638,12 +2658,16 @@ static void set_recommended_min_free_kbytes(void)
>>
>> You provide a 'patchlet' in
>> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/
>>
>> That also does:
>>
>>         /* Ensure 2 pageblocks are free to assist fragmentation avoidance */
>> -       recommended_min = pageblock_nr_pages * nr_zones * 2;
>> +       recommended_min = min_thp_pageblock_nr_pages() * nr_zones * 2;
>>
>> So comment here - this comment is now incorrect, this isn't 2 page blocks,
>> it's 2 of 'sub-pageblock size as if page blocks were dynamically altered by
>> always/madvise THP size'.
>>
>> Again, this whole thing strikes me as we're doing things at the wrong level
>> of abstraction.
>>
>> And you're definitely now not helping avoid pageblock-sized
>> fragmentation. You're accepting that you need less so... why not reduce
>> pageblock size? :)
>>

Yes agreed.

>> 	/*
>> 	 * Make sure that on average at least two pageblocks are almost free
>> 	 * of another type, one for a migratetype to fall back to and a
>>
>> ^ remainder of comment
>>
>>>  	 * second to avoid subsequent fallbacks of other types There are 3
>>>  	 * MIGRATE_TYPES we care about.
>>>  	 */
>>> -	recommended_min += pageblock_nr_pages * nr_zones *
>>> +	recommended_min += min_thp_pageblock_nr_pages() * nr_zones *
>>>  			   MIGRATE_PCPTYPES * MIGRATE_PCPTYPES;
>>
>> This just seems wrong now and contradicts the comment - you're setting
>> minimum pages based on migrate PCP types that operate at pageblock order
>> but without reference to the actual number of page block pages?
>>
>> So the comment is just wrong now? 'make sure there are at least two
>> pageblocks', well this isn't what you're doing is it? So why there are we
>> making reference to PCP counts etc.?
>>
>> This seems like we're essentially just tuning these numbers someswhat
>> arbitrarily to reduce them?
>>
>>>
>>> -	/* don't ever allow to reserve more than 5% of the lowmem */
>>> -	recommended_min = min(recommended_min,
>>> -			      (unsigned long) nr_free_buffer_pages() / 20);
>>> +	/*
>>> +	 * Don't ever allow to reserve more than 5% of the lowmem.
>>> +	 * Use a min of 128 pages when all THP orders are set to never.
>>
>> Why? Did you just choose this number out of the blue?


Mentioned this in the previous comment.
>>
>> Previously, on x86-64 with thp -> never on everything a pageblock order-9
>> wouldn't this be a much higher value?
>>
>> I mean just putting '128' here is not acceptable. It needs to be justified
>> (even if empirically with data to back it) and defined as a named thing.
>>
>>
>>> +	 */
>>> +	recommended_min = clamp(recommended_min, 128,
>>> +				(unsigned long) nr_free_buffer_pages() / 20);
>>> +
>>>  	recommended_min <<= (PAGE_SHIFT-10);
>>>
>>>  	if (recommended_min > min_free_kbytes) {
>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>> index 0c5fb4ffa03a..8e92678d1175 100644
>>> --- a/mm/shmem.c
>>> +++ b/mm/shmem.c
>>> @@ -136,10 +136,10 @@ struct shmem_options {
>>>  };
>>>
>>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> -static unsigned long huge_shmem_orders_always __read_mostly;
>>> -static unsigned long huge_shmem_orders_madvise __read_mostly;
>>> -static unsigned long huge_shmem_orders_inherit __read_mostly;
>>> -static unsigned long huge_shmem_orders_within_size __read_mostly;
>>> +unsigned long huge_shmem_orders_always __read_mostly;
>>> +unsigned long huge_shmem_orders_madvise __read_mostly;
>>> +unsigned long huge_shmem_orders_inherit __read_mostly;
>>> +unsigned long huge_shmem_orders_within_size __read_mostly;
>>
>> Again, we really shouldn't need to do this.

Agreed, for the RFC, I just did it similar to the anon ones when I got the build error
trying to use these, but yeah a much better approach would be to just have a
function in shmem that would return the largest shmem thp allowable order.


>>
>>>  static bool shmem_orders_configured __initdata;
>>>  #endif
>>>
>>> @@ -516,25 +516,6 @@ static bool shmem_confirm_swap(struct address_space *mapping,
>>>  	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
>>>  }
>>>
>>> -/*
>>> - * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
>>> - *
>>> - * SHMEM_HUGE_NEVER:
>>> - *	disables huge pages for the mount;
>>> - * SHMEM_HUGE_ALWAYS:
>>> - *	enables huge pages for the mount;
>>> - * SHMEM_HUGE_WITHIN_SIZE:
>>> - *	only allocate huge pages if the page will be fully within i_size,
>>> - *	also respect madvise() hints;
>>> - * SHMEM_HUGE_ADVISE:
>>> - *	only allocate huge pages if requested with madvise();
>>> - */
>>> -
>>> -#define SHMEM_HUGE_NEVER	0
>>> -#define SHMEM_HUGE_ALWAYS	1
>>> -#define SHMEM_HUGE_WITHIN_SIZE	2
>>> -#define SHMEM_HUGE_ADVISE	3
>>> -
>>
>> Again we really shouldn't need to do this, just provide some function from
>> shmem that gives you what you need.
>>
>>>  /*
>>>   * Special values.
>>>   * Only can be set via /sys/kernel/mm/transparent_hugepage/shmem_enabled:
>>> @@ -551,7 +532,7 @@ static bool shmem_confirm_swap(struct address_space *mapping,
>>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>  /* ifdef here to avoid bloating shmem.o when not necessary */
>>>
>>> -static int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
>>> +int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
>>
>> Same comment.
>>
>>>  static int tmpfs_huge __read_mostly = SHMEM_HUGE_NEVER;
>>>
>>>  /**
>>> --
>>> 2.47.1
>>>
> 

