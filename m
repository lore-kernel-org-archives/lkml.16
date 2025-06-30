Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9913A238151
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281313; cv=none; b=Z1/jiNn8PkJWz+IGk0sK+H1MCSLTpvxDKOuslIBTe4V39WXYpBnBfBef2FUDi1GRL02FBu5bDWA+ar7a4d1Xm6TmtN5gAWhndWIVbwFB1C0Wsapya7DwJ5Jti3kgkTFwFhYhBbvi1jzVBtJ0T3OCeOdB+2pvA6bbZieQqMi1kNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281313; c=relaxed/simple;
	bh=l7ErLLyaOAZpjV7P3IeLKZsOkVWT3Vy9j/nkLxGLW4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyXPiukKu5DlRNHOcCuVGvynyaK7RpvNvXsEJFKC/kczGkHe1h1b+djCfVG4xYvDdiqRO1XxVluuNlsjYShK5P709UKziw4P1Mg+46Q9kvlqp5PFgcng5ASsKskBqb4r5I7//4TsmT47Kf3j5yRuHC6CSvzfcuKB6fDcaKEypCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFe/3fQK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFe/3fQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751281310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MSwQnQoo9uo4uEMIruoLPlHEq/9wo6aDbD/OB18GecE=;
	b=IFe/3fQKB5lvXRYGPKfh8JJE1Pe5PrjVnrx1LyC+7dFBg9wtS0/jS+kzQaBhF/4HK31BEi
	2mgUF5WRERYxSiz+mJpSlMtOO2lPW+Bcdn3F7WwY+FbuydSkM2CsO1e7eVHZ/eJjEPlmTo
	iYvSArjSw95dOrprdNIvYRJN7XwtD4c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-NIwiVr13MT6XhY_a64ZTaw-1; Mon, 30 Jun 2025 07:01:48 -0400
X-MC-Unique: NIwiVr13MT6XhY_a64ZTaw-1
X-Mimecast-MFC-AGG-ID: NIwiVr13MT6XhY_a64ZTaw_1751281308
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso811099f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751281307; x=1751886107;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MSwQnQoo9uo4uEMIruoLPlHEq/9wo6aDbD/OB18GecE=;
        b=BmQV1rYO/t92NySu/VUiJVwn+EXNAV6hRAZ4Cb07LEf7vZUOJ0nOhO6oD2m+ivbt+s
         ne+biMHbX/tFs63FBIO9KoOZg5G51uauRywnjIn5SzWVyM8iUyw8v/mrMHiFADoFZspy
         Yth1HiSPzSZto3xby3/saFInYBicQJqqc9Ml0Kof0ymjDWX+C7+BcOJPEhe1VyF+J9ur
         syn/uKyW8kLqLxk8qAmv8yEhvlYu5XGr/Y9Hwyhbe5aprWoIA0MMboI1cfn1XtWocDg7
         CmDdAsc0ghME5pSQIGVMb++3qwIAvNNSbbRwbEQsiOBb4TqVCR66dzZfnd6d+Jj+JBuv
         JxcA==
X-Forwarded-Encrypted: i=1; AJvYcCWSWBBMBCuaNXmOBvXB6Sd0veg2wesQyy8lSjtTjkVihqhaHhAnf+t/zcntAfPpobbBSsPlTGc9MjWVOyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdH8yqASCrdGnJdhzs5fjJoUeWR/0yhXwSRuHOeQdFAfCsQTzx
	Ncy+Edf47GAFNc2/C6cLJf3SbQcS++ZiRYFwMTpPLg+w1vRn8H8h5Tx1pK1UvWcxO720cGq//GS
	ocaitUzLwYcJVNZldMqAetGno8k1aAFiR/1/HjH5mmNA43o1HM7jFYBnwH4uQCyC4ug==
X-Gm-Gg: ASbGncsGvhvfJSdZNhPuzrAHvksZskOVkqgvIFMKO7GWTYStBNVYqLljWF+dndALpiZ
	8DZZt9Pe0p7XPxsNvZcUAJN819aiNaA6uGpTAn9mZMefS1ILjSb/9H2hqwlUYD6cAH2bjn2Z5Y9
	MhKH5vOSd5ZQxy0sUOBQYhksyWYbvr8a6uQ0agMmdg+3g72RvwoWORHyar/vRMqhV/HqVBG977M
	FFptSelycggDzCYCgC0a79cSoYd/mwa3KgBd7a1nN1SrIJyZdJ6ucwbD8GF53aMxa3r26SYjgVM
	JtuFiJ+GUWCnpL6IevGkO08qjOfQNY724FABkXUj9IQIbHI1B/XGBR0esRkx4qVWSG7X8czufR1
	kYsex6GGdFdDCXEqzJLkZVjHU7UG4hZA76fxMzzINR57F5ZX4JQ==
X-Received: by 2002:adf:b356:0:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a8ff61608amr7420583f8f.49.1751281307286;
        Mon, 30 Jun 2025 04:01:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpeYuc3XyyeQgRvI3gADIX7s6OIvoHF1mK/ACsolsz2dC66QQ9rzo+Z7+5d9KFwP9gHrSrbA==
X-Received: by 2002:adf:b356:0:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a8ff61608amr7420529f8f.49.1751281306602;
        Mon, 30 Jun 2025 04:01:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e61f48sm10217418f8f.93.2025.06.30.04.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 04:01:46 -0700 (PDT)
Message-ID: <42794499-64d0-44a1-ad70-a361e849b890@redhat.com>
Date: Mon, 30 Jun 2025 13:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
To: Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
 <5c3428c6-25be-4a94-811a-6bb6718f6c58@arm.com>
 <cc846c55-0505-4ad6-9664-ac799d9c0226@redhat.com>
 <5375208d-2c11-4579-a303-e8416ab07159@arm.com>
 <aa9c4bd5-f36e-4820-9ca2-1154b44b8908@arm.com>
 <f0ccb18b-4297-4741-9dd9-d020b171c28d@redhat.com>
 <79525362-2377-441b-8575-d2307bd77f26@arm.com>
 <8993dbc9-6c9a-4ac7-8c04-813851eba938@redhat.com>
 <2ca5cbb3-9795-49ef-ae53-11c3143edee1@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <2ca5cbb3-9795-49ef-ae53-11c3143edee1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.06.25 12:57, Ryan Roberts wrote:
> On 30/06/2025 10:24, David Hildenbrand wrote:
>> On 30.06.25 11:18, Ryan Roberts wrote:
>>> On 30/06/2025 10:08, David Hildenbrand wrote:
>>>> On 30.06.25 11:04, Ryan Roberts wrote:
>>>>> On 30/06/2025 04:34, Dev Jain wrote:
>>>>>>
>>>>>> On 29/06/25 2:30 am, David Hildenbrand wrote:
>>>>>>> On 28.06.25 05:37, Dev Jain wrote:
>>>>>>>>
>>>>>>>> On 27/06/25 5:25 pm, David Hildenbrand wrote:
>>>>>>>>> Honoring these PTE bits is the exception, so let's invert the meaning.
>>>>>>>>>
>>>>>>>>> With this change, most callers don't have to pass any flags.
>>>>>>>>>
>>>>>>>>> No functional change intended.
>>>>>>>>
>>>>>>>> FWIW I had proposed this kind of change earlier to Ryan (CCed) and
>>>>>>>> he pointed out: "Doesn't that argument apply in reverse if you want
>>>>>>>> to ignore something new in future?
>>>>>>>>
>>>>>>>> By default we are comparing all the bits in the pte when determining the
>>>>>>>> batch.
>>>>>>>> The flags request to ignore certain bits.
>>>>>>>
>>>>>>> That statement is not true: as default we ignore the write and young bit. And
>>>>>>> we don't have flags for that ;)
>>>>>>>
>>>>>>> Now we also ignore the dirty and soft-dity bit as default, unless told not to
>>>>>>> do that by one very specific caller.
>>>>>>>
>>>>>>>> If we want to ignore extra bits in
>>>>>>>> future, we add new flags and the existing callers don't need to be updated.
>>>>>>>
>>>>>>> What stops you from using FPB_IGNORE_* for something else in the future?
>>>>>>>
>>>>>>> As a side note, there are not that many relevant PTE bits to worry about in
>>>>>>> the near future ;)
>>>>>>>
>>>>>>> I mean, uffd-wp, sure, ... and before we add a FPB_HONOR_UFFD_WP to all users
>>>>>>> to be safe (and changing the default to ignore), you could add a
>>>>>>> FPB_IGNORE_UFFD_WP first, to then check who really can tolerate just ignoring
>>>>>>> it (most of them, I assume).
>>>>>> I agree.
>>>>>
>>>>> Meh. Personally I think if you start mixing HONOR and IGNORE flags, it becomes
>>>>> very confusing to work out what is being checked for and what is not. I
>>>>> stand by
>>>>> my original view. But yeah, writable and young confuse it a bit... How about
>>>>> generalizing by explicitly requiring IGNORE flags for write and young, then
>>>>> also
>>>>> create a flags macro for the common case?
>>>>>
>>>>> #define FPB_IGNORE_COMMON (FPB_IGNORE_WRITE | FPB_IGNORE_YOUNG |    \
>>>>>                  FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY)
>>>>>
>>>>> It's not a hill I'm going to die on though...
>>>>
>>>> How about we make this function simpler, not more complicated? ;)
>>>
>>> I think here we both have different views of what is simpler... You are trying
>>> to optimize for the callers writing less code. I'm trying to optimize for the
>>> reader to be able to easily determine what the function will do for a given
>>> caller.
>>
>> See patch number #3: I want the default function -- folio_pte_batch() -- to not
>> have any flags at all.
>>
>> And I don't want to achieve that by internally using flags when calling
>> folio_pte_batch_ext().
>>
>> If you don't specify flags (folio_pte_batch()), behave just as if calling
>> folio_pte_batch_ext() without flags. Anything else would be more confusing IMHO.
> 
> OK, sorry I don't have the context of your actual series... I was just trying to
> defend what my quote that Dev sent. I'll go take a look at your series.

If we'd not do the split and always provide flags + non-inlined variant, 
then I'd agree.

> 
>>
>> I agree that mixing HONOR and IGNORE is not a good idea. But then, it's really
>> only uffd-wp that still could be batched, and likely we want it to be the
>> default, and respect/honor/whatever instead in the cases where we really have to.
>>
>> (If we really want to go down that path and batch it :) )
> 
> FWIW, I think we will need to honor the write bit for Dev's mprotect series (I
> just sent review comments against his v4). So if you want most callers to just
> call folio_pte_batch() and that will ignore the write bit, then I guess
> folio_pte_batch_ext() will have to accept a FPB_HONOR_WRITE bit? Which I guess
> aligns with what you are doing here to make all the flags HONOR.

I have to take a look at that one. Maybe it's sufficient to know if any 
PTE was writable, just like we did with fork().

But yes, anybody who requires more advanced handling (flags) shall use 
the extended variant -- however that one will be called.

-- 
Cheers,

David / dhildenb

