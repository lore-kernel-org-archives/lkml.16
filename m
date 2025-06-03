Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E7165F16
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965356; cv=none; b=WXbCU1zJV0KeLLcYd5mf0U4Izu/Y+dCi5d3Csn5vhKb152NUqL5h/s1sr8SS6EmptEOthyfvC9uYVxvamuIQBYnA8hvOHUhFc5gmoLWrcfTnhRem9i/ixvJ1g+JslYejFADT8uI+cfSDlHFwx6JNNvpO7ZTfGpwxOtct70n6VYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965356; c=relaxed/simple;
	bh=aXd1mfE46QugxwSZXiz25LerQokmN4vaLyDNy/EGmPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrguHckaOltwwUtUOHOqWN9RewdTF0ZisQslqBTY2o8NJAQN0IkMLxylTdIU5/6knVvPRdISQhfXQksIB4C/7Bs+dTbE2m2BtNa2kqyDpiHQkvltwz34Tp1Sl+9SHm6ymPXpEGOq2iGhEwV2FtZdNbKdXL7HZuxdo7J5FaYAZ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cAMwKFwj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cAMwKFwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748965353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GBxLRRnBqLAmeWB0B7HeK4vK3McXs0/oE4hTEermesE=;
	b=cAMwKFwjcjo2/DfygKxK3NpjHGJn7+xmwreTeUVuV4GrDIpydpzD9dRL5F50v0GVWtAWeG
	wOZgDX6FxinCKynV4lbhksgKd79C2oGRk0hrBcm+kfDCGmkp42ZUmfTG0bwqvJOnd2JLUQ
	5Sh9I8k2j8bhdoerLLkeOrDXLKiuzhk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-PH8i6TnVN5ClnYoPEjaW9g-1; Tue, 03 Jun 2025 11:42:31 -0400
X-MC-Unique: PH8i6TnVN5ClnYoPEjaW9g-1
X-Mimecast-MFC-AGG-ID: PH8i6TnVN5ClnYoPEjaW9g_1748965350
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so1700774f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 08:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965350; x=1749570150;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GBxLRRnBqLAmeWB0B7HeK4vK3McXs0/oE4hTEermesE=;
        b=aTmAXHYtg6aZPkk/PvulvI1MkyfSUhyZQkzqEAySJRJrEBSO8iZDbcfRltbiUBMVmC
         2o98OURZOur09Twedr7UjD1QSDfyJaW0cNsl7DUM7XoxK9FD2+URCM+8ieqptSW4F3H0
         DU0E5gf7oHTNmVTLajEu1/tdg6DGhkhaoP2S5Xiuet7GzeME5xQUJmCqVLTrw5GERAV+
         SxNuMgvoq8pm598WLDBJ5/NPR/B+qwbJp/ehLymO1cqfoHq0ziavth86NPhq2g4Ld9KF
         OHby4iJcxU/e1I/vPFoGOg+OiRUHuF38CA5s012EUmfcXyH6UjcD+F/DUmxft6K9f9h4
         SihQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBClvv+rgDaPd17R9uwWE/A9Y95vEWbXqtIRucj81BBTvlnmeSSWMkcYmN4jWFvdxLjN4aM8T5twpg+JA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzBKCXM6E2jy3A6Qt91wl2obPdaIkaigWjE0e8KtKfnaHMHRH3
	QGdSwWqFJw6XFf3F1iO5UmMxQ6G+g1BkpcdmR+VLGZbq9EWR8lhAgpgJx4Kv3gZQ5RFelQ54ecH
	JmyotvmX0uirFhDJvX9PNsI5EE+pcPZUpmbv48nQiVqLUOP4ru59q8JAie4ttCzoPZw==
X-Gm-Gg: ASbGncucnfdShIs9msqpiU/G7m71uJzkUIiJenRmuS7xjBX4E1S0pO+DKpsf/hxm3zZ
	gk9E/GXMEFd9LVp6tnF2CXSzMn1ykVH0VhX5oyHPCOsgSoMrZlvyssOfjEn61OGQs8V4Cdu1IK3
	IagfuQA0CgUuP92ZrCKuE4QTGQ8/bjmt3MzLB3cgjX0uHYqx+aBgvt3w4BaA+3fRRvjUVpBCIpb
	75LMXsMgHYx/+JH1kHw+KKtTxKqkj/9DFs3P1/6JDT93dQdcH7F/BN09cZhoEM9T/kmwgSZv8Vs
	sp836Q1d5KduaCJTb7ic6XTS5ufSsxo8UUXnwNH7nscrkaGxUVugJudOML16/W5hrOYevDCNM/o
	x03vUGiSCGECcqWtu08mjibwDigE1iNwwFIfSCDQ=
X-Received: by 2002:a05:6000:144e:b0:3a4:d975:7d62 with SMTP id ffacd0b85a97d-3a4fe393721mr11576314f8f.35.1748965350406;
        Tue, 03 Jun 2025 08:42:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAi0ScpkbGJg0544yhMX0kGvgGSLtYJr1P9QOROvdPDtv4vd+pL/0t3rJOBPb7O88sopGRPw==
X-Received: by 2002:a05:6000:144e:b0:3a4:d975:7d62 with SMTP id ffacd0b85a97d-3a4fe393721mr11576282f8f.35.1748965349905;
        Tue, 03 Jun 2025 08:42:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b87csm18935531f8f.12.2025.06.03.08.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 08:42:29 -0700 (PDT)
Message-ID: <3e075035-fb74-4b5b-81e4-d32b832de44f@redhat.com>
Date: Tue, 3 Jun 2025 17:42:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
To: Zi Yan <ziy@nvidia.com>
Cc: Juan Yescas <jyescas@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, tjmercier@google.com,
 isaacmanjarres@google.com, kaleshsingh@google.com, masahiroy@kernel.org,
 Minchan Kim <minchan@kernel.org>
References: <20250521215807.1860663-1-jyescas@google.com>
 <54943dbb-45fe-4b69-a6a8-96381304a268@redhat.com>
 <51739EAE-32CB-43AD-A969-B24FE3DAA351@nvidia.com>
 <74955261-748E-4E91-8D55-6ECAEBFB3F70@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <74955261-748E-4E91-8D55-6ECAEBFB3F70@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 17:14, Zi Yan wrote:
> On 3 Jun 2025, at 10:55, Zi Yan wrote:
> 
>> On 3 Jun 2025, at 9:03, David Hildenbrand wrote:
>>
>>> On 21.05.25 23:57, Juan Yescas wrote:
>>>> Problem: On large page size configurations (16KiB, 64KiB), the CMA
>>>> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
>>>> and this causes the CMA reservations to be larger than necessary.
>>>> This means that system will have less available MIGRATE_UNMOVABLE and
>>>> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
>>>>
>>>> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
>>>> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
>>>> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
>>>>
>>>> For example, in ARM, the CMA alignment requirement when:
>>>>
>>>> - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
>>>> - CONFIG_TRANSPARENT_HUGEPAGE is set:
>>>>
>>>> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
>>>> -----------------------------------------------------------------------
>>>>      4KiB   |      10        |       9         |  4KiB * (2 ^  9) =   2MiB
>>>>     16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =  32MiB
>>>>     64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
>>>>
>>>> There are some extreme cases for the CMA alignment requirement when:
>>>>
>>>> - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
>>>> - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
>>>> - CONFIG_HUGETLB_PAGE is NOT set
>>>>
>>>> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
>>>> ------------------------------------------------------------------------
>>>>      4KiB   |      15        |      15         |  4KiB * (2 ^ 15) = 128MiB
>>>>     16Kib   |      13        |      13         | 16KiB * (2 ^ 13) = 128MiB
>>>>     64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
>>>>
>>>> This affects the CMA reservations for the drivers. If a driver in a
>>>> 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
>>>> reservation has to be 32MiB due to the alignment requirements:
>>>>
>>>> reserved-memory {
>>>>       ...
>>>>       cma_test_reserve: cma_test_reserve {
>>>>           compatible = "shared-dma-pool";
>>>>           size = <0x0 0x400000>; /* 4 MiB */
>>>>           ...
>>>>       };
>>>> };
>>>>
>>>> reserved-memory {
>>>>       ...
>>>>       cma_test_reserve: cma_test_reserve {
>>>>           compatible = "shared-dma-pool";
>>>>           size = <0x0 0x2000000>; /* 32 MiB */
>>>>           ...
>>>>       };
>>>> };
>>>>
>>>> Solution: Add a new config CONFIG_PAGE_BLOCK_ORDER that
>>>> allows to set the page block order in all the architectures.
>>>> The maximum page block order will be given by
>>>> ARCH_FORCE_MAX_ORDER.
>>>>
>>>> By default, CONFIG_PAGE_BLOCK_ORDER will have the same
>>>> value that ARCH_FORCE_MAX_ORDER. This will make sure that
>>>> current kernel configurations won't be affected by this
>>>> change. It is a opt-in change.
>>>>
>>>> This patch will allow to have the same CMA alignment
>>>> requirements for large page sizes (16KiB, 64KiB) as that
>>>> in 4kb kernels by setting a lower pageblock_order.
>>>>
>>>> Tests:
>>>>
>>>> - Verified that HugeTLB pages work when pageblock_order is 1, 7, 10
>>>> on 4k and 16k kernels.
>>>>
>>>> - Verified that Transparent Huge Pages work when pageblock_order
>>>> is 1, 7, 10 on 4k and 16k kernels.
>>>>
>>>> - Verified that dma-buf heaps allocations work when pageblock_order
>>>> is 1, 7, 10 on 4k and 16k kernels.
>>>>
>>>> Benchmarks:
>>>>
>>>> The benchmarks compare 16kb kernels with pageblock_order 10 and 7. The
>>>> reason for the pageblock_order 7 is because this value makes the min
>>>> CMA alignment requirement the same as that in 4kb kernels (2MB).
>>>>
>>>> - Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
>>>> SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
>>>> (https://developer.android.com/ndk/guides/simpleperf) to measure
>>>> the # of instructions and page-faults on 16k kernels.
>>>> The benchmark was executed 10 times. The averages are below:
>>>>
>>>>              # instructions         |     #page-faults
>>>>       order 10     |  order 7       | order 10 | order 7
>>>> --------------------------------------------------------
>>>>    13,891,765,770	 | 11,425,777,314 |    220   |   217
>>>>    14,456,293,487	 | 12,660,819,302 |    224   |   219
>>>>    13,924,261,018	 | 13,243,970,736 |    217   |   221
>>>>    13,910,886,504	 | 13,845,519,630 |    217   |   221
>>>>    14,388,071,190	 | 13,498,583,098 |    223   |   224
>>>>    13,656,442,167	 | 12,915,831,681 |    216   |   218
>>>>    13,300,268,343	 | 12,930,484,776 |    222   |   218
>>>>    13,625,470,223	 | 14,234,092,777 |    219   |   218
>>>>    13,508,964,965	 | 13,432,689,094 |    225   |   219
>>>>    13,368,950,667	 | 13,683,587,37  |    219   |   225
>>>> -------------------------------------------------------------------
>>>>    13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
>>>>
>>>> There were 4.85% #instructions when order was 7, in comparison
>>>> with order 10.
>>>>
>>>>        13,803,137,433 - 13,131,974,268 = -671,163,166 (-4.86%)
>>>>
>>>> The number of page faults in order 7 and 10 were the same.
>>>>
>>>> These results didn't show any significant regression when the
>>>> pageblock_order is set to 7 on 16kb kernels.
>>>>
>>>> - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 times
>>>>    on the 16k kernels with pageblock_order 7 and 10.
>>>>
>>>> order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
>>>> -------------------------------------------------------------------
>>>>     15.8	 |  16.4    |         0.6        |     3.80%
>>>>     16.4	 |  16.2    |        -0.2        |    -1.22%
>>>>     16.6	 |  16.3    |        -0.3        |    -1.81%
>>>>     16.8	 |  16.3    |        -0.5        |    -2.98%
>>>>     16.6	 |  16.8    |         0.2        |     1.20%
>>>> -------------------------------------------------------------------
>>>>     16.44     16.4            -0.04	          -0.24%   Averages
>>>>
>>>> The results didn't show any significant regression when the
>>>> pageblock_order is set to 7 on 16kb kernels.
>>>>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: Vlastimil Babka <vbabka@suse.cz>
>>>> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> CC: Mike Rapoport <rppt@kernel.org>
>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>>> Cc: Minchan Kim <minchan@kernel.org>
>>>> Signed-off-by: Juan Yescas <jyescas@google.com>
>>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>>> ---
>>>> Changes in v7:
>>>>     - Update alignment calculation to 2MiB as per David's
>>>>       observation.
>>>>     - Update page block order calculation in mm/mm_init.c for
>>>>       powerpc when CONFIG_HUGETLB_PAGE_SIZE_VARIABLE is set.
>>>>
>>>> Changes in v6:
>>>>     - Applied the change provided by Zi Yan to fix
>>>>       the Kconfig. The change consists in evaluating
>>>>       to true or false in the if expression for range:
>>>>       range 1 <symbol> if <expression to eval true/false>.
>>>>
>>>> Changes in v5:
>>>>     - Remove the ranges for CONFIG_PAGE_BLOCK_ORDER. The
>>>>       ranges with config definitions don't work in Kconfig,
>>>>       for example (range 1 MY_CONFIG).
>>>>     - Add PAGE_BLOCK_ORDER_MANUAL config for the
>>>>       page block order number. The default value was not
>>>>       defined.
>>>>     - Fix typos reported by Andrew.
>>>>     - Test default configs in powerpc.
>>>>
>>>> Changes in v4:
>>>>     - Set PAGE_BLOCK_ORDER in incluxe/linux/mmzone.h to
>>>>       validate that MAX_PAGE_ORDER >= PAGE_BLOCK_ORDER at
>>>>       compile time.
>>>>     - This change fixes the warning in:
>>>>     https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v-lkp@intel.com/
>>>>
>>>> Changes in v3:
>>>>     - Rename ARCH_FORCE_PAGE_BLOCK_ORDER to PAGE_BLOCK_ORDER
>>>>       as per Matthew's suggestion.
>>>>     - Update comments in pageblock-flags.h for pageblock_order
>>>>       value when THP or HugeTLB are not used.
>>>>
>>>> Changes in v2:
>>>>     - Add Zi's Acked-by tag.
>>>>     - Move ARCH_FORCE_PAGE_BLOCK_ORDER config to mm/Kconfig as
>>>>       per Zi and Matthew suggestion so it is available to
>>>>       all the architectures.
>>>>     - Set ARCH_FORCE_PAGE_BLOCK_ORDER to 10 by default when
>>>>       ARCH_FORCE_MAX_ORDER is not available.
>>>>
>>>>    include/linux/mmzone.h          | 16 ++++++++++++++++
>>>>    include/linux/pageblock-flags.h |  8 ++++----
>>>>    mm/Kconfig                      | 34 +++++++++++++++++++++++++++++++++
>>>>    mm/mm_init.c                    |  2 +-
>>>>    4 files changed, 55 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>>>> index 6ccec1bf2896..05610337bbb6 100644
>>>> --- a/include/linux/mmzone.h
>>>> +++ b/include/linux/mmzone.h
>>>> @@ -37,6 +37,22 @@
>>>>     #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
>>>>   +/* Defines the order for the number of pages that have a migrate type. */
>>>> +#ifndef CONFIG_PAGE_BLOCK_ORDER
>>>> +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
>>>> +#else
>>>> +#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
>>>> +#endif /* CONFIG_PAGE_BLOCK_ORDER */
>>>> +
>>>> +/*
>>>> + * The MAX_PAGE_ORDER, which defines the max order of pages to be allocated
>>>> + * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_ORDER,
>>>> + * which defines the order for the number of pages that can have a migrate type
>>>> + */
>>>> +#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
>>>> +#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER
>>>> +#endif
>>>> +
>>>>    /*
>>>>     * PAGE_ALLOC_COSTLY_ORDER is the order at which allocations are deemed
>>>>     * costly to service.  That is between allocation orders which should
>>>> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
>>>> index fc6b9c87cb0a..e73a4292ef02 100644
>>>> --- a/include/linux/pageblock-flags.h
>>>> +++ b/include/linux/pageblock-flags.h
>>>> @@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
>>>>     * Huge pages are a constant size, but don't exceed the maximum allocation
>>>>     * granularity.
>>>>     */
>>>> -#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, MAX_PAGE_ORDER)
>>>> +#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
>>>>     #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>>>>     #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>>>>   -#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_PAGE_ORDER)
>>>> +#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
>>>>     #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>>>>   -/* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
>>>> -#define pageblock_order		MAX_PAGE_ORDER
>>>> +/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
>>>> +#define pageblock_order		PAGE_BLOCK_ORDER
>>>>     #endif /* CONFIG_HUGETLB_PAGE */
>>>>   diff --git a/mm/Kconfig b/mm/Kconfig
>>>> index e113f713b493..13a5c4f6e6b6 100644
>>>> --- a/mm/Kconfig
>>>> +++ b/mm/Kconfig
>>>> @@ -989,6 +989,40 @@ config CMA_AREAS
>>>>     	  If unsure, leave the default value "8" in UMA and "20" in NUMA.
>>>>   +#
>>>> +# Select this config option from the architecture Kconfig, if available, to set
>>>> +# the max page order for physically contiguous allocations.
>>>> +#
>>>> +config ARCH_FORCE_MAX_ORDER
>>>> +	int
>>>> +
>>>> +#
>>>> +# When ARCH_FORCE_MAX_ORDER is not defined,
>>>> +# the default page block order is MAX_PAGE_ORDER (10) as per
>>>> +# include/linux/mmzone.h.
>>>> +#
>>>> +config PAGE_BLOCK_ORDER
>>>> +	int "Page Block Order"
>>>> +	range 1 10 if ARCH_FORCE_MAX_ORDER = 0
>>>> +	default 10 if ARCH_FORCE_MAX_ORDER = 0
>>>> +	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0
>>>> +	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0
>>>> +	help
>>>> +	  The page block order refers to the power of two number of pages that
>>>> +	  are physically contiguous and can have a migrate type associated to
>>>> +	  them. The maximum size of the page block order is limited by
>>>> +	  ARCH_FORCE_MAX_ORDER.
>>>> +
>>>> +	  This config allows overriding the default page block order when the
>>>> +	  page block order is required to be smaller than ARCH_FORCE_MAX_ORDER
>>>> +	  or MAX_PAGE_ORDER.
>>>> +
>>>> +	  Reducing pageblock order can negatively impact THP generation
>>>> +	  success rate. If your workloads uses THP heavily, please use this
>>>> +	  option with caution.
>>>> +
>>>> +	  Don't change if unsure.
>>>
>>>
>>> The semantics are now very confusing [1]. The default in x86-64 will be 10, so we'll have
>>>
>>> CONFIG_PAGE_BLOCK_ORDER=10
>>>
>>>
>>> But then, we'll do this
>>>
>>> #define pageblock_order MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
>>>
>>>
>>> So the actual pageblock order will be different than CONFIG_PAGE_BLOCK_ORDER.
>>>
>>> Confusing.
>>>
>>> Either CONFIG_PAGE_BLOCK_ORDER is misnamed (CONFIG_PAGE_BLOCK_ORDER_CEIL ? CONFIG_PAGE_BLOCK_ORDER_LIMIT ?), or the semantics should be changed.
>>
>> IIRC, Juan's intention is to limit/lower pageblock order to reduce CMA region
>> size. CONFIG_PAGE_BLOCK_ORDER_LIMIT sounds reasonable to me.
> 
> LIMIT might be still ambiguous, since it can be lower limit or upper limit.
> CONFIG_PAGE_BLOCK_ORDER_CEIL is better. Here is the patch I come up with,
> if it looks good to you, I can send it out properly.

LGTM

-- 
Cheers,

David / dhildenb

