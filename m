Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A4270540
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294313; cv=none; b=jaoyvdup6lOyqY6gaSj1Vx22b0DTcaDa5QtUFIswvntjh6e6Bs4IQN/k+QwMoDDxpBpiD1PerPeomU4hoBU8NlUZrJjXMIeaPgonvIA/RkqMjwxZL85eWcRdH7fFuBCihvX9wYD6YveZuxfx9ECQ4dSkXGBE7j+eSEBEtKLBUZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294313; c=relaxed/simple;
	bh=YMmmwj4I70wT+dNJaxfQgP5CbbH7usffFIoS5o5D9mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqPl5Fa+I106e9wGk57IuZ3cYgM0bgn6hTj2aauv7w58xYKr0u+At4qxFChR8oyyEyi9q+PppP95AfOIVjvxgGceWNgREztjbN+5AXMsjCjaFiWdDs+bGS3lC45gfi7h5N7xa7vZZXEwk0s1c4lbDtO2jimMVlTREvAlmxaRQX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d6WMAHl8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d6WMAHl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751294309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dLNDWn+c6Slj1cTlasvqzpQ5+dIBruMnNq/SRSmpwEw=;
	b=d6WMAHl85IvFDFdPi+upP32xpB2nZVfwbAPZU9nREAbwlibAyCAtoXzESARljbpa/lNesn
	6oJur4psMhf2pxlE766fHvb5Q1KamTBUWlc5pZWOhnAhhja4CzxHaLdvl9teVRP1GpgZ42
	A2aE0OS/8tbMIkledSzlu4hbHC7g2T8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-rddDqH7ANXCouROBiMsXLg-1; Mon, 30 Jun 2025 10:38:28 -0400
X-MC-Unique: rddDqH7ANXCouROBiMsXLg-1
X-Mimecast-MFC-AGG-ID: rddDqH7ANXCouROBiMsXLg_1751294307
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4538f375e86so21945915e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294307; x=1751899107;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dLNDWn+c6Slj1cTlasvqzpQ5+dIBruMnNq/SRSmpwEw=;
        b=sqJHayINXm6H/oWwdmyMXSphn8F1PNZA6YjYKVX8sg3t2PCOT6E+snWPki2I06VbRn
         V3tJa4M1GNcH4oK3t7OQcLB5m6/ThMFeGBx2RZPOlxLzaDo0ofl9TJx9CFyUxXY5zE6I
         3qByzsPRRGXdyssC1S6NvhdLtv5HZj8/T+jU07fz+60DuPJokoGQlL1TGunJmNpT4LJv
         mqqvzOLNKl7oRGNlf7JowynpKDFveI0O8zfeJMSzHMa9K9Q028k4JL5vWxOXseESrRsT
         vrGt0W6uvV+ewDrPsvmyraD69SCr8m9NYiqILCqtu0kYUYUga61DNOvNcX/kPEPOFPit
         VB6g==
X-Forwarded-Encrypted: i=1; AJvYcCVdLyDT6kTsYKcyBOyX+iZaMUGcsFg2XGQ/lWXEVLDYuh46eQ+P1itGra4bHi3NIs2Ns9E9H9mTZbrU5gE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqXGxx70/2l2TrSaafKCHtQiRYhkUaTa27vTRc8ReeYmPIam7l
	Mclez4yw7fX8u0P7H2vfWfIcHIq60DkWwIuLJNETSSHA/VLcTo6d2qBTnz+ucxmHHCbWFm3rnwj
	Gr+5v49MwAWgd8ldiU3waNswCF/ATx5XkhA0IDn/JndQ67yyE4p1jG9uOG53VGvlDQw==
X-Gm-Gg: ASbGnctmXD4pCnqbCYW3c63DVcJk2dZo51bE94t4ovbBoz5eeJxBv6LZZf08mJKIZNb
	Cly/Xr1g/yZzB5qwapuN8FE/p5urOQBUxiklxZrZzzb9Yh/vRLVoxqlx9VsXyNvMWIjLIAPlisB
	hmJwEOnDu9PRj0Eip/Ebt2hXdX/TPRbOKFLHDIlpGylSuxge432UNyycLFG5U5yrgQm3zrJthyc
	Zxrjw6fg472WbUoDK4qNdHa5mZ3Equ1x5EvmUXlputvaAvZu5NHMfzkxrT87oCilx/pEOoKDCMi
	QoEYRsOQimTkPZqCCuihkex0G+uvEPBaQwJ1mTMtBt86Taq8zm4N4xVVhJSmyhRDC/V+NAgmrID
	3FVN9AcwGdWyQ5xSve/m4uJD2+tB1DJP3BQJMc0uqB7OdqxFkcA==
X-Received: by 2002:a05:600c:1c8b:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-453917ee4afmr129222685e9.4.1751294306669;
        Mon, 30 Jun 2025 07:38:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnD9r4PvOzD5cwTLp6+K47C3mOJEJPn5vbMsxpz5jwCGLxU4Kqf3vYGoh2dZvH6exJkEnPWA==
X-Received: by 2002:a05:600c:1c8b:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-453917ee4afmr129222315e9.4.1751294306269;
        Mon, 30 Jun 2025 07:38:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ac6ee0d0b9sm4870506f8f.18.2025.06.30.07.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 07:38:25 -0700 (PDT)
Message-ID: <1df06854-f5e6-493f-98e6-6426bd37da3c@redhat.com>
Date: Mon, 30 Jun 2025 16:38:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] mm/debug_vm_pgtable: Use a swp_entry_t input
 value for swap tests
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, linux-s390@vger.kernel.org
References: <20250623184321.927418-1-gerald.schaefer@linux.ibm.com>
 <20250623184321.927418-2-gerald.schaefer@linux.ibm.com>
 <9fb04185-5b71-46c0-b62c-0e0e6ee59e6e@arm.com>
 <20250625182846.5bce1aaf@thinkpad-T15>
 <db8ab8d0-20f5-4922-a1e2-6f7409747664@redhat.com>
 <e60539ab-e319-4a7c-a7ee-493df3f7f833@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e60539ab-e319-4a7c-a7ee-493df3f7f833@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.06.25 06:18, Anshuman Khandual wrote:
> 
> 
> On 25/06/25 10:17 PM, David Hildenbrand wrote:
>>> [...]
>>>>> @@ -1166,6 +1173,7 @@ static void __init init_fixed_pfns(struct pgtable_debug_args *args)
>>>>>      static int __init init_args(struct pgtable_debug_args *args)
>>>>>    {
>>>>> +    unsigned long max_swap_offset;
>>>>>        struct page *page = NULL;
>>>>>        int ret = 0;
>>>>>    @@ -1248,6 +1256,11 @@ static int __init init_args(struct pgtable_debug_args *args)
>>>>>          init_fixed_pfns(args);
>>>>>    +    /* See generic_max_swapfile_size(): probe the maximum offset */
>>>>> +    max_swap_offset = swp_offset(pte_to_swp_entry(swp_entry_to_pte(swp_entry(0, ~0UL))));
>>>> Why not directly use generic_max_swapfile_size() which is doing exact same thing.
>>>>
>>>> unsigned long generic_max_swapfile_size(void)
>>>> {
>>>>      return swp_offset(pte_to_swp_entry(
>>>>              swp_entry_to_pte(swp_entry(0, ~0UL)))) + 1;
>>>> }
>>>
>>> Good question. I just moved this code here from pte_swap_exclusive_tests(),
>>> see above, and did not think about that. Now I also wonder why
>>> generic_max_swapfile_size() wasn't used before.
>>>
>>> But it is not exactly the same thing, there is an extra "+ 1" there.
>>> Maybe that is the reason, but I don't really understand the details /
>>> difference, and therefore would not want to change it.
>>>
>>> David, do you remember why you didn't use generic_max_swapfile_size()
>>> in your pte_swap_exclusive_tests()?
>>
>> Excellent question. If only I would remember :)
>>
>> generic_max_swapfile_size() resides in mm/swapfile.c, which is only around with CONFIG_SWAP.
>>
>> It makes sense to have that function only if there are ... actual swapfiles.
>>
>> These checks here are independent of CONFIG_SWAP (at least in theory -- for migration entries etc we don't need CONFIG_SWAP), and we simply want to construct a swap PTE with all possible bits set.
> 
> After this modification of PMD based swap test - there will be now
> two uses for generic_max_swapfile_size(). Rather than refactoring
> these into a similar helper in mm/debug_vm_pgtable.c - should the
> existing helper just be moved outside of CONFIG_SWAP, thus making
> it available in general ?

As I said, having generic_max_swapfile_size() that returns something != 
0 with !CONFIG_SWAP feels rather odd.

No swap -> no swapfile -> no swapfile max size.

No strong opinion though,, but desperately trying to de-duplicate 2 LOC 
might not be worth the churn at all.

-- 
Cheers,

David / dhildenb

