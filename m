Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A532234994
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810044; cv=none; b=sU4aLS1cIMPJfC3M9/kQakc4fu1lmgPaRnv3PONEI+Z0sQ1GSer5oE+5TT7Z2H5dIupyQ04Pb4WbkZG2eiuWo7k49vLQ0uJYOyEEnjL91UlmCPpHqudTsDoWHqBB8U2RpyJ2wmyMXk9QX61MCKhvOxML8b8bFBvGNhBgTPA5IRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810044; c=relaxed/simple;
	bh=PZRaUXCDZBJ5i7MMuLEccxjTABm/qQjKGrrWolfI15A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4jpRNDX12G9dJ5UXufs0Rc4yv0sqL01pTDKPfBfxnHVRNbyWv5NbRfFAjHfplgIzGkVpMssfahcRCZ5dHgPEBa8x/3lUOAJC2V5D5IUPFriP6svvzhroa2QCT7ODSY3p4MdSEp9V7sAk0YbzD39RinBnvXHRqwiDI0UEKuOYYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OQeIM9vJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OQeIM9vJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747810041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CzggIwj+jbUL0klDnOHDjZIax36vXKT+DrlAHi+v0/w=;
	b=OQeIM9vJda7yCYBO5gPdtTU2/o2sytsDpvJmyfC674lzYCgQp0iBKo2TYRoFPyQ/hFidWA
	WLvnp1hn2Se7MJl7eEOQOS0WtstjHk/6myIOsAqV82K5+NBbifrNJ5pPn+xPGEkRzcPPET
	Ov2x8ukOjthOHbRth2kUv5tAUUTCixU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-8maH-yFMMNeOSgVZVWLpWA-1; Wed, 21 May 2025 02:47:19 -0400
X-MC-Unique: 8maH-yFMMNeOSgVZVWLpWA-1
X-Mimecast-MFC-AGG-ID: 8maH-yFMMNeOSgVZVWLpWA_1747810038
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf446681cso38927005e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747810038; x=1748414838;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CzggIwj+jbUL0klDnOHDjZIax36vXKT+DrlAHi+v0/w=;
        b=k4z5eXXvwBdxZxUiE4NofWXqddSA99nCeQPP0DwbGAi9qgSAVM6RMESHerZCSvLhPc
         muf2eCt53gWyTAgfCppGB/hUjusY9V7zNjyovRg2Z5HeLQSskcS0iH/pzFCtmeLFZ+AM
         Fe5Tk+0QTJ02F1Ej8R38NO0H6/OELU7EdReFmNsPm1UmBORH2GBSBfS1WFYyMoxpULZ1
         XOcMrLXgLlqP4qINbuxfHQEZ+BXRFW6uhBWm6OTU4OT81OPH0X4B6vshs0t1wWmZpqlB
         lUgCUs8Hbc+/MA54Gxu28YgvIl00R9Q7ml0hb+yDRtkYpEbxXzJ9Ohh2OJy5+OJV6h9d
         5jhg==
X-Forwarded-Encrypted: i=1; AJvYcCV4yg3ErHFyCe6qVtYAket7hoIGT9+auF6aK4b/+zMF+tg0E6hO9O413Xlit3zH3y/AnYfZytKr/CAcSlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTqJBJ+uh3+7LO/ysL9ttsGH2Sn1UcPuLTPpeAGLzYx/mNdy1/
	AaxIa++T4HTYmvngm9NVZmYCXFn97aFzrv9GlNgKnI61f3IiCCJrJt/0DEUkb/065zeCrse42rM
	FAvsrWJ88E8E7U8lWiog2pN3ec4rHSep0hQLrvI0gCWJ1vttw+Yr8MlhfvjFxJ4uqgQ==
X-Gm-Gg: ASbGncvjq54XklVO4fjSdEIdm8nnMsdHkWhcuy+rtJCaUJ2GItGiqpgXFX4fJ5hWx1/
	x+2hzQDkYW69s9nojog7/iOFBr0BCrHZBrBLpuZe1/lLfTkhmL8Co2w9+UvcdEkjmeOYT7DN76t
	AGvzAqehB9eaKsgXPplgmeHsfg5m1ZT9Q/FFaRWAoTnxuS9h/zaOKPZ2H9Cd5zfFmi9xi6QH2Jj
	Xb3WLQ/xfQtlG6KFnTOeeB5KYfhNtzHU5aCJ36TAg4W4+58o8GHbheI6xK/mbZOfVKwj2gfR+KQ
	zrb9t41cwc5urPWfIK7tNNsu8kB0uaTLeKOmVJeHrrByf81s3TabeVDnAqJn1XEoYz+2Q38T/s7
	rI0LrF2sXRIvi6RseVgWHWrwCPmSztshXOhu6/SM=
X-Received: by 2002:a05:600c:5008:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-442fd622da0mr190709065e9.8.1747810037833;
        Tue, 20 May 2025 23:47:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeDC7SkGDrMBEZ5owvYgplQl0947LhChqbdM2mEtQqSK1gQj3GlyIntbS41H9xWby6DCozNw==
X-Received: by 2002:a05:600c:5008:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-442fd622da0mr190708725e9.8.1747810037369;
        Tue, 20 May 2025 23:47:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4481ca9f2d9sm56226205e9.19.2025.05.20.23.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:47:16 -0700 (PDT)
Message-ID: <28a2881d-fd33-44d9-a212-adeb8600e15b@redhat.com>
Date: Wed, 21 May 2025 08:47:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
To: Juan Yescas <jyescas@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: tjmercier@google.com, isaacmanjarres@google.com, kaleshsingh@google.com,
 masahiroy@kernel.org, Minchan Kim <minchan@kernel.org>
References: <20250520225945.991229-1-jyescas@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250520225945.991229-1-jyescas@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 00:59, Juan Yescas wrote:
> Problem: On large page size configurations (16KiB, 64KiB), the CMA
> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> and this causes the CMA reservations to be larger than necessary.
> This means that system will have less available MIGRATE_UNMOVABLE and
> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
> 
> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> 
> For example, in ARM, the CMA alignment requirement when:
> 
> - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
> - CONFIG_TRANSPARENT_HUGEPAGE is set:
> 
> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
> -----------------------------------------------------------------------
>     4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =  4MiB

Why is pageblock_nr_pages 10 in that case?

	#define pageblock_order MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_PAGE_ORDER)

So it should be 2 MiB (order-9)?

>    16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =  32MiB
>    64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
> 
> There are some extreme cases for the CMA alignment requirement when:
> 
> - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
> - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
> - CONFIG_HUGETLB_PAGE is NOT set

I think we should just always group at HPAGE_PMD_ORDER also in this case. But that's
a different thing to sort out :)

> 
> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
> ------------------------------------------------------------------------
>     4KiB   |      15        |      15         |  4KiB * (2 ^ 15) = 128MiB
>    16Kib   |      13        |      13         | 16KiB * (2 ^ 13) = 128MiB
>    64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
> 
> This affects the CMA reservations for the drivers. If a driver in a
> 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
> reservation has to be 32MiB due to the alignment requirements:
> 
> reserved-memory {
>      ...
>      cma_test_reserve: cma_test_reserve {
>          compatible = "shared-dma-pool";
>          size = <0x0 0x400000>; /* 4 MiB */
>          ...
>      };
> };
> 
> reserved-memory {
>      ...
>      cma_test_reserve: cma_test_reserve {
>          compatible = "shared-dma-pool";
>          size = <0x0 0x2000000>; /* 32 MiB */
>          ...
>      };
> };
> 
> Solution: Add a new config CONFIG_PAGE_BLOCK_ORDER that
> allows to set the page block order in all the architectures.
> The maximum page block order will be given by
> ARCH_FORCE_MAX_ORDER.
> 
> By default, CONFIG_PAGE_BLOCK_ORDER will have the same
> value that ARCH_FORCE_MAX_ORDER. This will make sure that
> current kernel configurations won't be affected by this
> change. It is a opt-in change.
> 
> This patch will allow to have the same CMA alignment
> requirements for large page sizes (16KiB, 64KiB) as that
> in 4kb kernels by setting a lower pageblock_order.
> 
> Tests:
> 
> - Verified that HugeTLB pages work when pageblock_order is 1, 7, 10
> on 4k and 16k kernels.
> 
> - Verified that Transparent Huge Pages work when pageblock_order
> is 1, 7, 10 on 4k and 16k kernels.
> 
> - Verified that dma-buf heaps allocations work when pageblock_order
> is 1, 7, 10 on 4k and 16k kernels.
> 
> Benchmarks:
> 
> The benchmarks compare 16kb kernels with pageblock_order 10 and 7. The
> reason for the pageblock_order 7 is because this value makes the min
> CMA alignment requirement the same as that in 4kb kernels (2MB).
> 
> - Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
> SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
> (https://developer.android.com/ndk/guides/simpleperf) to measure
> the # of instructions and page-faults on 16k kernels.
> The benchmark was executed 10 times. The averages are below:
> 
>             # instructions         |     #page-faults
>      order 10     |  order 7       | order 10 | order 7
> --------------------------------------------------------
>   13,891,765,770	 | 11,425,777,314 |    220   |   217
>   14,456,293,487	 | 12,660,819,302 |    224   |   219
>   13,924,261,018	 | 13,243,970,736 |    217   |   221
>   13,910,886,504	 | 13,845,519,630 |    217   |   221
>   14,388,071,190	 | 13,498,583,098 |    223   |   224
>   13,656,442,167	 | 12,915,831,681 |    216   |   218
>   13,300,268,343	 | 12,930,484,776 |    222   |   218
>   13,625,470,223	 | 14,234,092,777 |    219   |   218
>   13,508,964,965	 | 13,432,689,094 |    225   |   219
>   13,368,950,667	 | 13,683,587,37  |    219   |   225
> -------------------------------------------------------------------
>   13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
> 
> There were 4.85% #instructions when order was 7, in comparison
> with order 10.
> 
>       13,803,137,433 - 13,131,974,268 = -671,163,166 (-4.86%)
> 
> The number of page faults in order 7 and 10 were the same.
> 
> These results didn't show any significant regression when the
> pageblock_order is set to 7 on 16kb kernels.
> 
> - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 times
>   on the 16k kernels with pageblock_order 7 and 10.
> 
> order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
> -------------------------------------------------------------------
>    15.8	 |  16.4    |         0.6        |     3.80%
>    16.4	 |  16.2    |        -0.2        |    -1.22%
>    16.6	 |  16.3    |        -0.3        |    -1.81%
>    16.8	 |  16.3    |        -0.5        |    -2.98%
>    16.6	 |  16.8    |         0.2        |     1.20%
> -------------------------------------------------------------------
>    16.44     16.4            -0.04	          -0.24%   Averages
> 
> The results didn't show any significant regression when the
> pageblock_order is set to 7 on 16kb kernels.
> 

Sorry for the late reply. I think using a bootime option might have saved us
some of the headake. :)

[...]

> +/* Defines the order for the number of pages that have a migrate type. */
> +#ifndef CONFIG_PAGE_BLOCK_ORDER
> +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
> +#else
> +#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
> +#endif /* CONFIG_PAGE_BLOCK_ORDER */
> +
> +/*
> + * The MAX_PAGE_ORDER, which defines the max order of pages to be allocated
> + * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_ORDER,
> + * which defines the order for the number of pages that can have a migrate type
> + */
> +#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
> +#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER
> +#endif
> +>   /*
>    * PAGE_ALLOC_COSTLY_ORDER is the order at which allocations are deemed
>    * costly to service.  That is between allocation orders which should
> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
> index fc6b9c87cb0a..e73a4292ef02 100644
> --- a/include/linux/pageblock-flags.h
> +++ b/include/linux/pageblock-flags.h
> @@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
>    * Huge pages are a constant size, but don't exceed the maximum allocation
>    * granularity.
>    */

How is CONFIG_HUGETLB_PAGE_SIZE_VARIABLE handled?

> -#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, MAX_PAGE_ORDER)
> +#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
>   
>   #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>   
>   #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>   
> -#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_PAGE_ORDER)
> +#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)

Wait, why are we using the MIN_T in that case? If someone requests 4 MiB, why would we reduce
it to 2 MiB even though MAX_PAGE_ORDER allows for it?


Maybe we really have to clean all that up first :/

-- 
Cheers,

David / dhildenb

