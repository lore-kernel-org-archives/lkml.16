Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCE527C869
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917729; cv=none; b=Q16s/X+kUa4ntxJy5HFh8rOVpBIuhUaTvjm7ga/qg6zfqcbnzoA3GrRtq2UZ2FjQrTE0xhlSGSexOR0ZxMk8cm3lhphlHbvXZQQ594TMSjuqx1zCj7jmZwlj8zIN7a5FHFODJSejTCpD2sWBajUMwfURIHu1eaHUCsi7mGMfujQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917729; c=relaxed/simple;
	bh=PVTUo9RUEI3NicCxY4KVL5G9/OumzmFOnSVPqggv7i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1D0NYAVZaEx8aLxo19JKsggibbDLv2zH0JR2B+GRmIjQPfKK72sgBg9Q8Yerl5fl7+NKNUIAV6UyaFLvdT1UxblukKR3degPYEbGrozdjD4SEa4gKRtALy9FsSs+556itRB67J4s1D0hHrpJZVuuK2/OWQEhw6LGd7HXv61iPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIDYPxl6; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIDYPxl6"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad545e74f60so968479366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747917726; x=1748522526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8h8VMy7nG682XM9lhzNlq6IHy3T2cGrxMUNGDBFIHI=;
        b=IIDYPxl6X1hT9VdR74tWXMs5fMkkabnC3O+cx+2RiiIf9OWNqdEbmT+fahea00LCT4
         EejtFcOYsTzqV/kKTDf9BlEQoTKblNYpVs1O9rOG+fljpw7/iYHLQgwEmDW5WOn+/KFR
         /8UEuSGzI2IziG57kKZBtWCAdEyg+65WTAmxqUr684fwp4q3SfCP2lo9X6PFTGRs/88B
         XSf9z0SOWOAv7a6aDu5HfLR/s+1GL4CA/e70ngWmIvHo8VEBdBroALj5iDkkp2JCisgO
         BCyHi2Um9CDBC0Bw5WLLtFU6BL8G2ksyRd6eKfS4Ozb9PMSInL7ObsopPkOHHbLLBfZb
         QwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917726; x=1748522526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8h8VMy7nG682XM9lhzNlq6IHy3T2cGrxMUNGDBFIHI=;
        b=AX+05p/p7uroVpv6l3SELMToL/8AyEN7pNXYgNQFkUUyACL+v2B5MlFB7U/oNB4Vnt
         Awjty8Ucj8hXJyaQc2szE23FsJ0RUtCmo7feX0mz1Gnvssh1qm2UfoV2ipdFUxvgkuHA
         XmE5IhYYgBmxUjQawwRyNiKn4BzZ6lOLjsBSZQICBFDBlpRNgao2DDJtLjhESxZW1nH1
         VeqY10UYXdNiAKEl81ohzw1ZjZytxim21QBtJnogKf25XwthC93tu+mX3+s4VJ16YIRW
         ZAqqMYCGRRv4RqZCdr2n6p+k/D6GAiH3UhaxrajimuqEceWwH8kVW1NldrrS47apSEZM
         yqBw==
X-Forwarded-Encrypted: i=1; AJvYcCVQsOPeLT0WX9g7Pp1LSQ7osW2OUpR4T7mM+5X/xQnX5UABd5CbsUwcteuHwfw6zfYsFG9TCqHQ6cMpybw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeL/Z8ODZEb6JHaGyhLY8WwWsBY8WH275t5yB2SWw/KuiMOnit
	H7uhGjmSCuiSdku0Bneq729VJHFNpR6g91QUUy6hW/dU6uSrM36kdQcm
X-Gm-Gg: ASbGnctx9EJtttZJ0Y8HToFeInvhyDC6PSYuADF1UPjsJGCtgqDj1Xp8DYzICJ3gA0Z
	D/yEOEsWhmxyM4gK4U1GBXNG1Sn6odfZWdJkWOyOHpViulFrmImJ6ngmC1IJwgmM/ay81uihHc9
	52pgVVNfRWrNwOl+huXU6Ck7fGCULvqieijJX8C9KU3bQ61/UQOl5xNBZhwXsNdCrdgnpKOlCsT
	c+/FUUSOmA2wo0iSEFNQLIdJ2v56eceL3IahGjkDM/JAVL0hd6wxfO3uppoB4/caCBtHtY30X+m
	w3lhyO61OwfbeIWXsA+iRFsNLxWeOEb0aPknJ+Irsn52a5SDNAzIKc+LXjCKkLe1Z7IKfFye+Mm
	1nlLQsY9dlYW+5TMShFoZAQtx/wYm
X-Google-Smtp-Source: AGHT+IHLAVBPibuhf8QzjbXW44030B4EB047Zq+RDL9gWkT9nEi3cm3/MnD48ZG0WtiuwILtclqN+A==
X-Received: by 2002:a17:907:1c92:b0:ad5:59ef:7f56 with SMTP id a640c23a62f3a-ad559ef8c28mr1973309466b.48.1747917725536;
        Thu, 22 May 2025 05:42:05 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:58:b3b6:ff61:e825? ([2620:10d:c092:600::1:d7d1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06b532sm1064205466b.43.2025.05.22.05.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 05:42:05 -0700 (PDT)
Message-ID: <5d8afe59-497b-4ff9-bea1-ede1f48772e0@gmail.com>
Date: Thu, 22 May 2025 13:42:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: slub: only warn once when allocating slab obj
 extensions fails
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, surenb@google.com,
 Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org,
 vlad.wing@gmail.com, linux-mm@kvack.org, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, vbabka@suse.cz,
 cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <20250520122547.1317050-2-usamaarif642@gmail.com> <aCyEyxHEXQ7DU9I1@harry>
 <cf17cfde-cd1a-4217-a09a-1aa86347f830@gmail.com>
 <h7mwe4tr4r233zewdqaoehmmoktaljslgcxvr2qybon2vnxhrz@pbwpt253olkd>
 <64b19c8f-e02e-490b-b987-9a996f36be21@gmail.com> <aC5s0CQMHeud3LDa@hyeyoo>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <aC5s0CQMHeud3LDa@hyeyoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22/05/2025 01:16, Harry Yoo wrote:
> On Tue, May 20, 2025 at 04:22:16PM +0100, Usama Arif wrote:
>>
>>
>> On 20/05/2025 15:18, Shakeel Butt wrote:
>>> On Tue, May 20, 2025 at 02:42:09PM +0100, Usama Arif wrote:
>>>>
>>>>
>>>> On 20/05/2025 14:34, Harry Yoo wrote:
>>>>> On Tue, May 20, 2025 at 01:25:47PM +0100, Usama Arif wrote:
>>>>>> In memory bound systems, a large number of warnings for failing this
>>>>>> allocation repeatedly may mask any real issues in the system
>>>>>> during memory pressure being reported in dmesg. Change this to
>>>>>> WARN_ONCE.
>>>>>>
>>>>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>>>>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
>>>>>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
>>>>>> ---
>>>>>
>>>>> Hi,
>>>>>
>>>>> Please Cc SLAB ALLOCATOR folks in MAINTAINERS on patches that touch
>>>>> slab code ;)
>>>>>
>>>>
>>>> Thanks for adding them to CC! I was just thinking of this as a memory
>>>> allocation profiling issue and added the maintainers for it,
>>>> but should have added slab maintainers as well.
>>>>
>>>>
>>>>>>  mm/slub.c | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/mm/slub.c b/mm/slub.c
>>>>>> index bf43c403ead2..97cb3d9e8d00 100644
>>>>>> --- a/mm/slub.c
>>>>>> +++ b/mm/slub.c
>>>>>> @@ -2102,7 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
>>>>>>  
>>>>>>  	slab = virt_to_slab(p);
>>>>>>  	if (!slab_obj_exts(slab) &&
>>>>>> -	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
>>>>>> +	    WARN_ONCE(alloc_slab_obj_exts(slab, s, flags, false),
>>>>>>  		 "%s, %s: Failed to create slab extension vector!\n",
>>>>>>  		 __func__, s->name))
>>>>>
>>>>> I think this should be pr_warn_once()?
>>>>> I'm not sure why this was WARN() in the first place.
>>>>>
>>>>
>>>> Isn't WARN_ONCE the same as pr_warn_once but with needing the condition
>>>> of the first arg to be true? We only want to warn if alloc_slab_obj_exts
>>>> returns non-zero. So WARN_ONCE should be ok?
>>>>
>>>
>>> The difference is the impact on panic_on_warn users which are mostly
>>> testing bots. This warning is not actionable, so I agree with Harry to
>>> covert this to pr_warn_once().
>>>
>>
>> Sounds good! Will change it to below for the next revision.
>> Will wait for the kvmalloc conversation to conclude before sending
>> the next revision.
>>
>> diff --git a/mm/slub.c b/mm/slub.c
>> index 08804d2f2ead..ab0b7ee87159 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -2101,11 +2101,13 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
>>                 return NULL;
>>  
>>         slab = virt_to_slab(p);
>> -       if (!slab_obj_exts(slab) &&
>> -           WARN(alloc_slab_obj_exts(slab, s, flags, false),
>> -                "%s, %s: Failed to create slab extension vector!\n",
>> -                __func__, s->name))
>> -               return NULL;
>> +       if (!slab_obj_exts(slab)) {
>> +               if(alloc_slab_obj_exts(slab, s, flags, false))
>> +                       pr_warn_once("%s, %s: Failed to create slab extension vector!\n",
>> +                               __func__, s->name);
>> +               else
>> +                       return NULL;
> 
> Returning NULL when alloc_slab_obj_exts() succeeds doesn't make sense.
> I think you meant something like this?
> 
> if (!slab_obj_exts(slab) &&
>     alloc_slab_obj_exts(slab, s, flags, false)) {
> 	pr_warn_once("%s, %s: Failed to create slab extension vector!\n",
> 		__func__, s->name);
> 	return NULL;
> }
> 
Yes, Thank you!

>> +       }
>>  
>>         return slab_obj_exts(slab) + obj_to_index(s, slab, p);
>>  }
>>
> 

