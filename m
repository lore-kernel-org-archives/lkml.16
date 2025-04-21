Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC90EEDE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745219868; cv=none; b=njq/lYRj2wEyBDr45eIOgHOOA7ue1QvgPQ0R+4JXJQF9BISDt0WSZ6Chvvn+nAmDC0n286yVKYtMvaSEo98tUayWw/Eo0cWgj0Ws2yoiCLCPOPQyBORzOsmKNMpz9cAnVtwbnN6SJ3aZYJO/xhp+Zp7HYaXF5GF0UrWwIDZkrFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745219868; c=relaxed/simple;
	bh=z4upDJZci7xHnzViGeYDSLslIrODk6y5axDmehZGDBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXZDpC2s9D47C1Sdwe9vc/wjMaIjNi20LPnignfSR8W6RrofcqTa2YVBZg7VFSx9BdTIBY1NL36VlR2ussNvxMdbuFsPRX9Hz3ZkgVxKF7Onh6WxeEiFnXtOC3ypWSM7zbIA1nSm+Nh7ak7At8ucbiVquoEh3CogaDAc9TjhcjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WLtaX82A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WLtaX82A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745219864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T5mW9NCCHCkay/jPJBmMQL4bt1khz2U8sjcPo5OyGgM=;
	b=WLtaX82ANZZq+llUHR5s1TzYNrgRrtFC94rVWO6oBh0KpLHicrewVTtbAPSVnaMDo11QBb
	BK87G+ygZyhL/dFoDQ+6oXnJC9SS8Obe1HzfVxhnEMmBBO83YGBoDYZ8n505gpJ/rm6lii
	ZOiV299TcIHS2/YoL2ufjgGUFw+Xg1I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-VF3ltyNQOCyHjaTfsIdhTw-1; Mon, 21 Apr 2025 03:17:40 -0400
X-MC-Unique: VF3ltyNQOCyHjaTfsIdhTw-1
X-Mimecast-MFC-AGG-ID: VF3ltyNQOCyHjaTfsIdhTw_1745219859
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391492acb59so1744932f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 00:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745219859; x=1745824659;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T5mW9NCCHCkay/jPJBmMQL4bt1khz2U8sjcPo5OyGgM=;
        b=F2mlrR8YAK1H2Rt/MBJ1T8XpBWkgZR6Bx/MDyIawzja84Pmsjk26QYZZ2asxh/oM+V
         yQyzU7d6xOg48RsF9uGCe+Mb8+Xoa1+oonYKIgcwERLNBpuo3vyZBPaCFnvMrMqn8QOE
         Fq8VZBR7w+fh4wyxpplZLPPfIe2ubdxHHgx8F1AHw9aHILiRcjZLJNCq93xCzCajd0uz
         oFkjSP3o2Ldeh5MxmTfiS1w5LLRTOvsa5/ANvI71vFxlYBrLISe2yjtND1fGCkXSF/qP
         Kj5/tcMbulvgBc0T1YKQPuxHHDHKRA5MoY86+CTrQNcj+ujH0T2QOwBObT/wOilVtC5V
         7wMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK0JOegeQWFU2AhyP4bJx9TqA0hHsJgNGSWGEWjSebPkjAQiEd/Vf7HaEsiXvG+urfdhVOkjxj9y0tAEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZCKG1tVii3mJHh3f4x/ott7dXJzlio7MdyYy31R7B2tYsnyeu
	gB4G3KeUJMeMBN8mlOAx1UuOPahyWR1Ig+4dc4a6FQBsBU9wEwrrXCAcam22R4ZaIMHZ5/sndi5
	WzgioBcgw+qY9apep4Mkk4YUHSer0HYsGvQLR3Y9ttz+C3LdZCbkwIOhAgqsDXg==
X-Gm-Gg: ASbGnctaWb//UzgNBHH9sPHiVWrSatoOvemz4QAwUz/p4rSd+GEHOO1l7dDcYOnFpcs
	mQo03pvpnXziiAfmUsh2EhYqWSIPrpp9PxHTKAvbq498ypcB/72E34CfpRvch3K9pwEvRo01egc
	9R7XXAak3IR8MAzfv592o7oVq78wXrSbh8nURxSky2mRqjYuXwQ7A3eq5hgnyMjg3q97alwi5Sm
	UCRUWyGB4wnFvKyunUc8IhJXuKCAsZhAg/16+OM59nWnVP40iAueZZzh5NeROCjVlOS1idRh/8u
	VCya28qvzGLGHFfvHzIJyO9hf8r+MxFAbRFr9UnLGUyJq9tGFRjmkSDLhSwy3BxHbLFNHI73JxS
	DSi4Qc8jHZDuo2kz5z/xzXt0uUGOFoNGm7qrD960=
X-Received: by 2002:a5d:648d:0:b0:39c:141b:904a with SMTP id ffacd0b85a97d-39efba2ca27mr7845171f8f.11.1745219859453;
        Mon, 21 Apr 2025 00:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa5JpNd0bUwH4c2uwFSJFx8GqNF4KiWfX89tD5Q6hv3uVQ6xAc5kB997MPn1gXgsFzCR/NCw==
X-Received: by 2002:a5d:648d:0:b0:39c:141b:904a with SMTP id ffacd0b85a97d-39efba2ca27mr7845148f8f.11.1745219859055;
        Mon, 21 Apr 2025 00:17:39 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf20sm10774796f8f.48.2025.04.21.00.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 00:17:38 -0700 (PDT)
Message-ID: <d562572c-6b0d-443f-bcae-b862338fa7f7@redhat.com>
Date: Mon, 21 Apr 2025 09:17:37 +0200
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
 <1c81b176893c349dfb12feaebd17e0694fedec0b@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1c81b176893c349dfb12feaebd17e0694fedec0b@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.04.25 07:16, Lance Yang wrote:
> April 21, 2025 at 1:13 PM, "Lance Yang" <lance.yang@linux.dev> wrote:
> 
> 
> 
>>
>> April 21, 2025 at 7:29 AM, "Andrew Morton" <akpm@linux-foundation.org> wrote:
>>
>>>
>>> On Fri, 18 Apr 2025 23:22:28 +0800 Lance Yang <ioworker0@gmail.com> wrote:
>>>
>>>   
>>>
>>>   
>>>
>>>   From: Lance Yang <lance.yang@linux.dev>
>>>
>>>   
>>>
>>>   
>>>
>>>   
>>>
>>>   To prevent folio_test_large_maybe_mapped_shared() from being used without
>>>
>>>   
>>>
>>>   CONFIG_MM_ID, we add a compile-time check rather than wrapping it in
>>>
>>>   
>>>
>>>   '#ifdef', avoiding even more #ifdef in callers that already use
>>>
>>>   
>>>
>>>   IS_ENABLED(CONFIG_MM_ID).
>>>
>>>   
>>>
>>>   
>>>
>>>   
>>>
>>>   Also, we used plenty of IS_ENABLED() on purpose to keep the code free of
>>>
>>>   
>>>
>>>   '#ifdef' mess.
>>>
>>>   
>>>
>>>   
>>>
>>>   I dunno, this just seems really whacky.
>>>
>>
>> I'd hope David could leave some comments on that.
>>
>>>
>>> --- a/include/linux/page-flags.h
>>>
>>>   
>>>
>>>   +++ b/include/linux/page-flags.h
>>>
>>>   
>>>
>>>   @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struct folio *folio)
>>>
>>>   
>>>
>>>   
>>>
>>>   
>>>
>>>   static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
>>>
>>>   
>>>
>>>   {
>>>
>>>   
>>>
>>>   + /* This function should never be called without CONFIG_MM_ID enabled. */
>>>
>>>   
>>>
>>>   
>>>
>>>   A correcter comment would be "This function should never be compiled
>>>
>>>   
>>>
>>>   without CONFIG_MM_ID enabled".
>>>
>>
>> Yes, that is more exact ;)
>>
>>>
>>> Which lets the cat out of the bag. Why the heck is it being compiled
>>>
>>>   
>>>
>>>   with CONFIG_MM_ID=n?? We have tools to prevent that.
>>>
>>>   
>>>
>>>   Can we just slap "#ifdef CONFIG_MM_ID" around the whole function? It
>>>
>>>   
>>>
>>>   should have no callers, right? If the linker ends up complaining then
>>>
>>>   
>>>
>>>   something went wrong.
>>>
>>
>> The reason we can't simply add #ifdef CONFIG_MM_ID around folio_test_large_maybe_mapped_shared()
>>
>> is because its caller folio_maybe_mapped_shared() relies on IS_ENABLED(CONFIG_MM_ID).
> 
> static inline bool folio_maybe_mapped_shared(struct folio *folio)
> {
>          [...]
>          if (!IS_ENABLED(CONFIG_MM_ID))
>                  return true;
>          [...]
>          return folio_test_large_maybe_mapped_shared(folio);
> }
> 
> folio_maybe_mapped_shared() is always available - doesn't depend on
> CONFIG_MM_ID or CONFIG_TRANSPARENT_HUGEPAGE.

We could #ifdef in folio_maybe_mapped_shared(), which I find rather 
suboptimal ...

or simply inline it into the 4 callers.

That might be the best approach, given that only selected user should be 
using the low-level primitive and everybody else should be using 
folio_maybe_mapped_shared().

-- 
Cheers,

David / dhildenb

