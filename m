Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9EB22D4C0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305262; cv=none; b=XoNt/dXKyRE0XuEMiaWy4Td2aDiFJjcFn6shiuMNB9vAvIeGVe4MH3GBE8JEKpI49LJpVrlNUAZEWDYsK5TKNqpTwjCro8QbEAJYZd7clPIDRLneQ70dX/W6a1JrrDOcBdo9Cz0JjjIVOCRyLsZz4F6sxPhdV8pi09BB6OOdTro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305262; c=relaxed/simple;
	bh=FE2K3bJQgAKPfWIVZmmWDSokM49rFEYcxQ49YtPUxAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOd986snvFLkBkRfsdE0LD0jM0j9tvRLBBG82S6D+gcqbcLg6rGE6Cj3f3NLxIsaP1SikfH03fRSNlBYnJWREtMDGs7pJyF5+OZO6X8ajLvlcoldMSnN0GpHd/WBe2RCNwbx4qyK4Wm3JvSP4GHxjQj4NUZQIIOpko2T0Bx6S04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KLpiv1Sf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KLpiv1Sf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745305258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OvaiTG3fjTk+MZW/mjqo3dThEyK+r2sDbddW9oT7Qrc=;
	b=KLpiv1SfPCoJMOeKSeEJCipO35p1Ta9dMllEbWUOe5J5o5N3i8eaysyf1ZM4tRqE1Mt6oc
	r3/jWTqydM2Y1bsjitN3WgT7WM2/rgtJfEYAT/TQxbFGgt78se8V6/2jLd8L0fWHRTi0eX
	q4Zp4SF5AZ1J0HCWcxZz/VJAnYQfA5w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-03Gyk9mUPz2guFCXullMiA-1; Tue, 22 Apr 2025 03:00:57 -0400
X-MC-Unique: 03Gyk9mUPz2guFCXullMiA-1
X-Mimecast-MFC-AGG-ID: 03Gyk9mUPz2guFCXullMiA_1745305256
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3913b2d355fso1333274f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305256; x=1745910056;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OvaiTG3fjTk+MZW/mjqo3dThEyK+r2sDbddW9oT7Qrc=;
        b=irCA0hB/r5Vx/+m2dTf4pGMduDu56kLDb5IhB0H8RkZy/cLHUO5FUKvSeZP0tUQzXY
         0ttOYI6227i8QFdmqaQ5mBD10btgd1F6zIdDanaWtEmKkLc1JYebiLQjJfr54hiQzpva
         xCmgNVS1JIfnedozvsGlqy0OfFNBkNv+sY7xbvmaKGFoHmbZ2isqzfejhuekI6xqOsRH
         J97Uxl4PMZJ041qgpvP9iVWr/DV3lPCuXloJhGOEIw3jnqTqIZ1at36OrfP6nispj3bF
         prZG2NibIivKXy+C8cL1lVh/g9mylJM1R6mreVC0oNrJIbWc2zi1fe/LGL2HE08HUduW
         OPmg==
X-Forwarded-Encrypted: i=1; AJvYcCW5FzIkMpprKWLTErbAXehHhlVpj+0qsCtdXjjoeCQ/p+4SHt94pXhGA7SZ/22kMwkKyeeBwJqPR66FwIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5DxUcKVc0pk7KCrg0+TJ7f2VOpPYO+85Oc1lWgS56xWWy6n73
	bBY8L4avR2O5BLj/wLIl2BXswjtlMn38dS2e5RUfd+pGOd3Ef0TWXzzsQFO60NyDQh+c+xzzT15
	NY8alqDTnQwEVC7/UvT2PqkX48nyzKBY0CjeiZEKP4iFIUTIzGTvwQRy6bPFZlHn2eFRV9h69IW
	s=
X-Gm-Gg: ASbGnctFlLe7s9hQ0KQd95flFYTXjKp+j12Eu6lrNlH2KmSr1d3zpQNSylHbVGLeqNi
	+FMBK4qPo/HN6a8PuRZeA8ry0swHt9OuvqtbaeWSp3S8Yq2vbtGMLkt6DqM5kVnxKaNR/9kvkb8
	V40Y2NgAztVCQmsZV2opeGQKPjl9DBOFkncCwEh2UAxbXnhK7XI6SS90EDs5DSYaOPshLiC7ykH
	/9vQXkTm/qOOd0zL+9y8D1BAcxf0SnMEy9SVlUAtXVVRrywjaVhkrBRFb0WD+sd35p6h06zsBGx
	LoKpE/EP/KpBtG9rbO/WC9sJcFxAa64iljUZUEZN
X-Received: by 2002:a05:6000:2501:b0:390:e5c6:920 with SMTP id ffacd0b85a97d-39efba397f5mr11096629f8f.3.1745305256007;
        Tue, 22 Apr 2025 00:00:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJF8PGun9lp2NmD9P7x1Oe/K/tnkg8j3LosKH9EVKIVT3JWCeNCCF7PBWqpKszz4mGfdpDhw==
X-Received: by 2002:a05:6000:2501:b0:390:e5c6:920 with SMTP id ffacd0b85a97d-39efba397f5mr11096603f8f.3.1745305255633;
        Tue, 22 Apr 2025 00:00:55 -0700 (PDT)
Received: from [192.168.3.141] (p5b0c62cd.dip0.t-ipconnect.de. [91.12.98.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5accc2sm162941515e9.14.2025.04.22.00.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:00:55 -0700 (PDT)
Message-ID: <fa4c886f-81d5-4679-bba3-4357f1d9c6ff@redhat.com>
Date: Tue, 22 Apr 2025 09:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
To: Lance Yang <lance.yang@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: mingzhe.yang@ly.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Lance Yang <ioworker0@gmail.com>
References: <20250418152228.20545-1-lance.yang@linux.dev>
 <20250420162925.2c58c018defee9ee192be553@linux-foundation.org>
 <641755b75b4ecb9c9822e15e707a0ebf1e250788@linux.dev>
 <20250421122239.710f5d63487853556cb8f57e@linux-foundation.org>
 <f091c3e4183e6d6384f645e609aeed926b320818@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f091c3e4183e6d6384f645e609aeed926b320818@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.04.25 06:35, Lance Yang wrote:
> April 22, 2025 at 3:22 AM, "Andrew Morton" <akpm@linux-foundation.org> wrote:
> 
> 
> 
>>
>> On Mon, 21 Apr 2025 05:13:03 +0000 "Lance Yang" <lance.yang@linux.dev> wrote:
>>
>>>
>>> Can we just slap "#ifdef CONFIG_MM_ID" around the whole function? It
>>>
>>>   
>>>
>>>   should have no callers, right? If the linker ends up complaining then
>>>
>>>   
>>>
>>>   something went wrong.
>>>
>>>   
>>>
>>>   The reason we can't simply add #ifdef CONFIG_MM_ID around folio_test_large_maybe_mapped_shared()
>>>
>>>   is because its caller folio_maybe_mapped_shared() relies on IS_ENABLED(CONFIG_MM_ID).
>>>
>>>   
>>>
>>>   If we do, with CONFIG_TRANSPARENT_HUGEPAGE=N, we'll hit compilation errors like:
>>>
>>>   
>>>
>>>   ./include/linux/mm.h: In function ‘folio_maybe_mapped_shared’:
>>>
>>>   ./include/linux/mm.h:2337:16: error: implicit declaration of function ‘folio_test_large_maybe_mapped_shared’; did you mean ‘folio_maybe_mapped_shared’? [-Werror=implicit-function-declaration]
>>>
>>>   2337 | return folio_test_large_maybe_mapped_shared(folio);
>>>
>>>   | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>>   | folio_maybe_mapped_shared
>>>
>>>   cc1: some warnings being treated as errors
>>>
>>
>> That's OK - provide a declaration of folio_maybe_mapped_shared() but no
>>
>> definition. So the compiled-out code can be compiled and the linker
>>
>> will confirm that it's never actually called.
>>
> 
> Got it, that works as well ;)
> 
> So if David is cool with it, I'll send out the new version like this:
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index d3909cb1e576..a762e4b4eab4 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -1230,10 +1230,15 @@ static inline int folio_has_private(const struct folio *folio)
>   	return !!(folio->flags & PAGE_FLAGS_PRIVATE);
>   }
> 
> +#ifdef CONFIG_MM_ID
>   static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
>   {
>   	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
>   }
> +#else
> +bool folio_test_large_maybe_mapped_shared(const struct folio *folio);
> +#endif

Fine with me. At this point, I do prefer inlining the function, though.

-- 
Cheers,

David / dhildenb

