Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC854A3C;
	Mon,  9 Jun 2025 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749468870; cv=none; b=WUbbduowlDtKTSosjKN0zSDCjMx35oU8SrCeuTuAZMBKKffUAkH49mfAhZ5xruVwmFsUKT97cUw3aQZ7LbfFSa+qJOcq+oOKnRxcC88qJlfg8Kr5qJdj6BV2G5ucKev4jUX8PTmEjnshpgwJwcL/FqSeOqnx3tUBhAfQvrjKKFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749468870; c=relaxed/simple;
	bh=0IJBW8K+peopy2wk5BcVvEo1rjg8kgaWPUDz78nBcp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oa6rBrk8RMsCmNHpC5HWi8X2V2ofGCh4P/bc0zoZRjUQCUMnMUrsl8EkV3UDXQTOCpP74e+wwD1ptWAu2ZWB4NxbhVDxmFCchNyg4pTjS03niJvLC093m7EhdlaE8v511257BNRyIvw44GhdrAM+OFwoa4GnNwtgCvvSBATuJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pd+r8CfH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pd+r8CfH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4508287895dso32100405e9.1;
        Mon, 09 Jun 2025 04:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749468867; x=1750073667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+ipcKqABSb+lKkWdrUxsmQBri1lQ1CzkeGIMLOQuDs=;
        b=Pd+r8CfHN1I9JElEZi1+aFr0AxFmLl94PZSzyxhf8tNz+jUFiNJNF8ywe+dc6U6f++
         e8R4vXQ9N6ECzCoTGLm/+BedP8lYdy3PA65+WN2fgetwJizUoSREf2saUz3B9EHJ/ukQ
         1Wfv2SFQSyR/W2MkFj/m9ZP23bUFf/7zoXMebnDIHw77wRHj8qMby4dg8+LgYyWx7M3q
         Ccoijd2WoioMWcPvZN3em1r6jfrZbdPCx6OmKI4J682171+bwOlBkSFWUcCMIcXz+Rtz
         3PHM5p6Nnwc9nMNF2bBT0XcjWTJK6nGcFkEcNg2xVWZKeZ+azBoSM3yvERXCDd9isdtR
         47rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749468867; x=1750073667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+ipcKqABSb+lKkWdrUxsmQBri1lQ1CzkeGIMLOQuDs=;
        b=IDfb5/sWBVkOqpDCkzRlChSKdtY0ZUtWLUFDVDT9kP8HrZ8nc8l1MEHH1ETl6ryYUH
         ZzowQbLP96W7DlKHyiSc0qr3DgnAY00USa/fvBI1/ivtMsW9h57uKWPkgntwdDrnP9Ho
         qWNDrIwyrYt6hGpC4e8RMnBtyq8zp3KD9C8k6lq/nKS7VDmIKlnT2+FVGBugKXGfeIIH
         njh8bWtK+0ONWqkPy48t0FFW1oR8YIDgzoyUSBrFYP660T/OLVl/SUFeaXXq9iljqTB3
         PFIZGFpalAx5st6wKimdzuRfWAEZhkwFTbzaklrrbnkZALcdM1ZsBAAxtuRiz5rbC3ze
         HE5g==
X-Forwarded-Encrypted: i=1; AJvYcCUs9lJpqvBG1KLIADRmGNgG9MPdUcYOU1ZmJcAveur/vtTS/B1CbAUZpX5sNA0q9MKU1kFmRbXvu9VtSErB@vger.kernel.org, AJvYcCVXUXCeZFB5yBtD0bG+pcjkgRjnsAqLxM3f70JXPr6WBRM2qk2OZcI9/jqPcOCBqqkYiBjjjLF4nX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdGCfOp4B7zw4qlRjvPm6XYr3nHtas34Ls9hy7FDw5gaS/k7SL
	hdpevg5I2Uul9ds1FDlRMAn/RvYyJfnklesSwY6ItYuIw40PAoyqeN7mzwUbcg==
X-Gm-Gg: ASbGncsqTLMQ6VaOZfAO87aglWppkzr6R8sqlJh0fsVe0KCgBtiLKXFmsKGd9pMbqY/
	V+NtQRhfXWGHUXSoc5aXwxP+0cRPaLlqqKlVrqzO21mtSVkfux8wRiVS0Zzqu1zhwtmW7IN0q/2
	LTvn4yjUbdgFzfXZWksj4fZI7nXas6x7vvVuzlzxPRhJda5813ti9iEyFavpnCgiSCBhFErKPIw
	W6IWzeJyZUXchUV5ue4Acn2VU79byNWHBLj7A5yJZ14xscKyUTNieKo3qnNI+yw7hsho+0h7Vjo
	3BlBlsGXL1GONEv1xKNGzoCp1+MEkQGu20VUlmjbBQA4td6yEJsuo85YCmeMRmq/l3sarLsFg5M
	nXr9Qwh7tcn1Po61KamuncPV/N8k0qG+wTlFf0wRgitjz8hs+DhFA
X-Google-Smtp-Source: AGHT+IHTYTxaJmzwLMVIsTAJwEV4y9pfUGpoQtN410+8NUHonS9MSn/rjc7YIQvaHPllT/zGNuwLeA==
X-Received: by 2002:a5d:5f96:0:b0:3a4:d685:3de7 with SMTP id ffacd0b85a97d-3a526dcdd91mr13416592f8f.8.1749468866721;
        Mon, 09 Jun 2025 04:34:26 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464e3csm9469713f8f.99.2025.06.09.04.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 04:34:26 -0700 (PDT)
Message-ID: <4adf1f8b-781d-4ab0-b82e-49795ad712cb@gmail.com>
Date: Mon, 9 Jun 2025 12:34:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com,
 Matthew Wilcox <willy@infradead.org>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <4c1d5033-0c90-4672-84a1-15978ced245d@redhat.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <4c1d5033-0c90-4672-84a1-15978ced245d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/06/2025 18:37, David Hildenbrand wrote:
> On 06.06.25 16:37, Usama Arif wrote:
>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
>> watermarks are evaluated to extremely high values, for e.g. a server with
>> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
>> of the sizes set to never, the min, low and high watermarks evaluate to
>> 11.2G, 14G and 16.8G respectively.
>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
>> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
>> and 1G respectively.
>> This is because set_recommended_min_free_kbytes is designed for PMD
>> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
>> Such high watermark values can cause performance and latency issues in
>> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
>> most of them would never actually use a 512M PMD THP.
>>
>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
>> folio order enabled in set_recommended_min_free_kbytes.
>> With this patch, when only 2M THP hugepage size is set to madvise for the
>> same machine with 64K page size, with the rest of the sizes set to never,
>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
>> respectively. When 512M THP hugepage size is set to madvise for the same
>> machine with 64K page size, the min, low and high watermarks evaluate to
>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
>>
>> An alternative solution would be to change PAGE_BLOCK_ORDER by changing
>> ARCH_FORCE_MAX_ORDER to a lower value for ARM64_64K_PAGES. However, this
>> is not dynamic with hugepage size, will need different kernel builds for
>> different hugepage sizes and most users won't know that this needs to be
>> done as it can be difficult to detmermine that the performance and latency
>> issues are coming from the high watermark values.
>>
>> All watermark numbers are for zones of nodes that had the highest number
>> of pages, i.e. the value for min size for 4K is obtained using:
>> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 4096 / 1024 / 1024}';
>> and for 64K using:
>> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 65536 / 1024 / 1024}';
>>
>> An arbirtary min of 128 pages is used for when no hugepage sizes are set
>> enabled.
>>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> ---
>>   include/linux/huge_mm.h | 25 +++++++++++++++++++++++++
>>   mm/khugepaged.c         | 32 ++++++++++++++++++++++++++++----
>>   mm/shmem.c              | 29 +++++------------------------
>>   3 files changed, 58 insertions(+), 28 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2f190c90192d..fb4e51ef0acb 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -170,6 +170,25 @@ static inline void count_mthp_stat(int order, enum mthp_stat_item item)
>>   }
>>   #endif
>>   +/*
>> + * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
>> + *
>> + * SHMEM_HUGE_NEVER:
>> + *    disables huge pages for the mount;
>> + * SHMEM_HUGE_ALWAYS:
>> + *    enables huge pages for the mount;
>> + * SHMEM_HUGE_WITHIN_SIZE:
>> + *    only allocate huge pages if the page will be fully within i_size,
>> + *    also respect madvise() hints;
>> + * SHMEM_HUGE_ADVISE:
>> + *    only allocate huge pages if requested with madvise();
>> + */
>> +
>> + #define SHMEM_HUGE_NEVER    0
>> + #define SHMEM_HUGE_ALWAYS    1
>> + #define SHMEM_HUGE_WITHIN_SIZE    2
>> + #define SHMEM_HUGE_ADVISE    3
>> +
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>     extern unsigned long transparent_hugepage_flags;
>> @@ -177,6 +196,12 @@ extern unsigned long huge_anon_orders_always;
>>   extern unsigned long huge_anon_orders_madvise;
>>   extern unsigned long huge_anon_orders_inherit;
>>   +extern int shmem_huge __read_mostly;
>> +extern unsigned long huge_shmem_orders_always;
>> +extern unsigned long huge_shmem_orders_madvise;
>> +extern unsigned long huge_shmem_orders_inherit;
>> +extern unsigned long huge_shmem_orders_within_size;
> 
> Do really all of these have to be exported?
> 

Hi David,

Thanks for the review!

For the RFC, I just did it similar to the anon ones when I got the build error
trying to use these, but yeah a much better approach would be to just have a
function in shmem that would return the largest shmem thp allowable order.

>> +
>>   static inline bool hugepage_global_enabled(void)
>>   {
>>       return transparent_hugepage_flags &
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 15203ea7d007..e64cba74eb2a 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -2607,6 +2607,26 @@ static int khugepaged(void *none)
>>       return 0;
>>   }
>>   +static int thp_highest_allowable_order(void)
> 
> Did you mean "largest" ?

Yes

> 
>> +{
>> +    unsigned long orders = READ_ONCE(huge_anon_orders_always)
>> +                   | READ_ONCE(huge_anon_orders_madvise)
>> +                   | READ_ONCE(huge_shmem_orders_always)
>> +                   | READ_ONCE(huge_shmem_orders_madvise)
>> +                   | READ_ONCE(huge_shmem_orders_within_size);
>> +    if (hugepage_global_enabled())
>> +        orders |= READ_ONCE(huge_anon_orders_inherit);
>> +    if (shmem_huge != SHMEM_HUGE_NEVER)
>> +        orders |= READ_ONCE(huge_shmem_orders_inherit);
>> +
>> +    return orders == 0 ? 0 : fls(orders) - 1;
>> +}
> 
> But how does this interact with large folios / THPs in the page cache?
> 

Yes this will be a problem.

From what I see, there doesn't seem to be a max order for pagecache, only
mapping_set_folio_min_order for the min.
Does this mean that pagecache can fault in 128M, 256M, 512M large folios?

I think this could increase the OOM rate significantly when ARM64 servers
are used with filesystems that support large folios..

Should there be an upper limit for pagecache? If so, it would either be a new
sysfs entry (which I dont like :( ) or just try and reuse the existing entries
with something like thp_highest_allowable_order?
 

>> +
>> +static unsigned long min_thp_pageblock_nr_pages(void)
> 
> Reading the function name, I have no idea what this function is supposed to do.
> 
> 
Yeah sorry about that. I knew even before sending the RFC that this was a bad name :(

I think an issue is that pageblock_nr_pages is not really 1 << PAGE_BLOCK_ORDER but is
1 << min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER) when THP is enabled.

I wanted to highlight with the name that it will use the minimum of the max THP order that
is enabled and PAGE_BLOCK_ORDER when calculating the number of pages..


