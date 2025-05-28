Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE671B040B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748466073; cv=none; b=M13wjsIwaF16DSBZqRIT2wsb046koszURhxfAuUww6z9INYEznuLUPNkHPDMyqjYZKBq8ia1SnWHAhVLNA72sZYBFoAvux0/sp5Ps8sFbTU1t6g7HiHzP2UkPuMKP8ldB59tIeMeMDcww2G/2GeN5NieNSaTKAAJe4RMGs9HHeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748466073; c=relaxed/simple;
	bh=RoXWxPAdoki1SHwDjDb/M3aWrEEZlxToIaGi+Z1lxWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLDavVlSqQ6u56pqlrYaOqs1R6+ctC6EKg+i7LgZ/VkrL2lEBgi/TvXKBWk2EjDNiTgvvGxfJvW71ThT+IorpYfMaxKZUV2l4SXr/rje5jTAIS3dj9I71J0hBMKxyxq33rdN68gUybD3GgaSqPmnZsWl8ZVQicYpeDtj+CjTdKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y0e2GwMg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y0e2GwMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748466070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TIs9A9vynPLs13u2u2i15iIW1/Si1viQD6ntfsowOjM=;
	b=Y0e2GwMgWZRoyDaKPF7vNBto2Odp7UVDM+trGdC4Srs5Z+UYO5zp3s7t/0Ozdcg21Ipu4Y
	NocKHSK4aiUMJuv98yGbLyC6f7oOCvKf+4ACSu1tCHVmlACL++QwlwVjjDSXcEkZlQaLo2
	gu4NcQhuZXpSibb7cvjmOaaheDJ6wEU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-u-Px3RE7Mn69ELIZIs0PrQ-1; Wed, 28 May 2025 17:01:08 -0400
X-MC-Unique: u-Px3RE7Mn69ELIZIs0PrQ-1
X-Mimecast-MFC-AGG-ID: u-Px3RE7Mn69ELIZIs0PrQ_1748466067
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so136068f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748466067; x=1749070867;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TIs9A9vynPLs13u2u2i15iIW1/Si1viQD6ntfsowOjM=;
        b=F3wHeHIlGXawRO/B6GLyflBbZJrJOIlIqeCdHPITndsN6mTcCbATBtQdtg4Hnk7xNT
         vL3Tw7v3rbG3M38FiQABtQWrUhXNmszLw7zI0AiY/54iWG1/vCoWneuTmelfhyOZeIi7
         OnoRWSbjZ5R2Ur2SXtQKIvLmVCZg2gDiYC/fLhJhiHtLKeiuirKNh6T3CPysuV/M5Lj1
         IdmQh7qmtuq7xI6NaT4vz/9zav3oXm6SndA8x+0/us3p6ag7beRDRcRUshepVXJ215ty
         5TmNH/Tw/AeXB7GwxrjMyV1I0zOsrhaAr6k1AJwimHF+2+HIm8tD2+RjGROym6egwuW9
         G0rA==
X-Forwarded-Encrypted: i=1; AJvYcCU+7XwUvrVEOjyseswTcuWRjgjtX9GKJql4nXhYz7EAjZDVVW3jI+lA3voQkCNGp5F19bN1VHtDvc5pX+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWaLb3Ur/vipIVuJNq1jX/fIhOFLn1sLTX2Q/9QsQwu7AoKET+
	ZdmoR8JEZI1mvx6Dsj6/I4COb1X6y012E3hxNwQOrymzqgPONvOk04QZz1DCiRsSkrASFAnHrGZ
	CUeavvaxzJ/xwnp2EGHE3s+G26JwblLRzgc3awaIpChlLmknXK/D9pijMi/5k1ymQMA==
X-Gm-Gg: ASbGncvEti46pvRMtzp4di2iOY5Nb/iG8ctryT+QvS0F2f/ytoGfkHd66iy0PUdOyPY
	ofrwVX2scdQr6y4ZA/avkROMb5FgkSqf8pVDI21/Px6xMj7BWDoCc7T3SM2d7lXvmNhyt47Dwh8
	R5lGnRI7/tF+wXYYHiq73w8UrKgR0jMUwG+ngLt0yhNLR2ZSKSH5Ami8LEglHhCu9ye2MToJMuk
	UcpNW/9myhwKPaABTRb8dMjv7L5y1phGF86WaxhXKKE+QvKVAn5EdnWQ1mONMRXLlBpMwj3Pd4c
	yLCZanvowXVg+meLKg8lMRVu6GX0afhZZrYdtpZLLQ==
X-Received: by 2002:a05:6000:2387:b0:3a4:dc0a:5c03 with SMTP id ffacd0b85a97d-3a4dc0a6165mr9475838f8f.39.1748466067108;
        Wed, 28 May 2025 14:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2aSzMv+587qfcit7qgAR0ifeKexVR32zWh2tQ8kfWF2L5PbKACsL68zv6XZf17ToPcyld3g==
X-Received: by 2002:a05:6000:2387:b0:3a4:dc0a:5c03 with SMTP id ffacd0b85a97d-3a4dc0a6165mr9475783f8f.39.1748466066631;
        Wed, 28 May 2025 14:01:06 -0700 (PDT)
Received: from [192.168.3.141] (p57a1aa11.dip0.t-ipconnect.de. [87.161.170.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eacd7cb0sm2474818f8f.67.2025.05.28.14.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 14:01:06 -0700 (PDT)
Message-ID: <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
Date: Wed, 28 May 2025 23:01:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
To: Baoquan He <bhe@redhat.com>, Donald Dutile <ddutile@redhat.com>,
 Jiri Bohac <jbohac@suse.cz>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 kexec@lists.infradead.org, Philipp Rudo <prudo@redhat.com>,
 Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <dhildenb@redhat.com>,
 Michal Hocko <mhocko@suse.cz>
References: <Z7dc9Cd8KX3b_brB@dwarf.suse.cz>
 <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.03.25 05:20, Baoquan He wrote:
> On 03/03/25 at 09:17am, Donald Dutile wrote:
>>
>>
>> On 3/3/25 3:25 AM, David Hildenbrand wrote:
>>> On 20.02.25 17:48, Jiri Bohac wrote:
>>>> Hi,
>>>>
>>>> this series implements a way to reserve additional crash kernel
>>>> memory using CMA.
>>>>
>>>> Link to the v1 discussion:
>>>> https://lore.kernel.org/lkml/ZWD_fAPqEWkFlEkM@dwarf.suse.cz/
>>>> See below for the changes since v1 and how concerns from the
>>>> discussion have been addressed.
>>>>
>>>> Currently, all the memory for the crash kernel is not usable by
>>>> the 1st (production) kernel. It is also unmapped so that it can't
>>>> be corrupted by the fault that will eventually trigger the crash.
>>>> This makes sense for the memory actually used by the kexec-loaded
>>>> crash kernel image and initrd and the data prepared during the
>>>> load (vmcoreinfo, ...). However, the reserved space needs to be
>>>> much larger than that to provide enough run-time memory for the
>>>> crash kernel and the kdump userspace. Estimating the amount of
>>>> memory to reserve is difficult. Being too careful makes kdump
>>>> likely to end in OOM, being too generous takes even more memory
>>>> from the production system. Also, the reservation only allows
>>>> reserving a single contiguous block (or two with the "low"
>>>> suffix). I've seen systems where this fails because the physical
>>>> memory is fragmented.
>>>>
>>>> By reserving additional crashkernel memory from CMA, the main
>>>> crashkernel reservation can be just large enough to fit the
>>>> kernel and initrd image, minimizing the memory taken away from
>>>> the production system. Most of the run-time memory for the crash
>>>> kernel will be memory previously available to userspace in the
>>>> production system. As this memory is no longer wasted, the
>>>> reservation can be done with a generous margin, making kdump more
>>>> reliable. Kernel memory that we need to preserve for dumping is
>>>> never allocated from CMA. User data is typically not dumped by
>>>> makedumpfile. When dumping of user data is intended this new CMA
>>>> reservation cannot be used.
>>>
>>>
>>> Hi,
>>>
>>> I'll note that your comment about "user space" is currently the case, but will likely not hold in the long run. The assumption you are making is that only user-space memory will be allocated from MIGRATE_CMA, which is not necessarily the case. Any movable allocation will end up in there.
>>>
>>> Besides LRU folios (user space memory and the pagecache), we already support migration of some kernel allocations using the non-lru migration framework. Such allocations (which use __GFP_MOVABLE, see __SetPageMovable()) currently only include
>>> * memory balloon: pages we never want to dump either way
>>> * zsmalloc (->zpool): only used by zswap (-> compressed LRU pages)
>>> * z3fold (->zpool): only used by zswap (-> compressed LRU pages)
>>>
>>> Just imagine if we support migration of other kernel allocations, such as user page tables. The dump would be missing important information.
>>>
>> IOMMUFD is a near-term candidate for user page tables with multi-stage iommu support with going through upstream review atm.
>> Just saying, that David's case will be a norm in high-end VMs with performance-enhanced guest-driven iommu support (for GPUs).
> 
> Thank both for valuable inputs, David and Don. I agree that we may argue
> not every system have ballon or enabling swap for now, while future
> extending of migration on other kernel allocation could become obstacle
> we can't detour.
> 
> If we have known for sure this feature could be a bad code, we may need
> to stop it in advance.

Sorry for the late reply.

I think we just have to be careful to document it properly -- especially 
the shortcomings and that this feature might become a problem in the 
future. Movable user-space page tables getting placed on CMA memory 
would probably not be a problem if we don't care about ... user-space 
data either way.

The whole "Direct I/O takes max 1s" part is a bit shaky. Maybe it could 
be configurable how long to wait? 10s is certainly "safer".

But maybe, in the target use case: VMs, direct I/O will not be that common.

-- 
Cheers,

David / dhildenb

