Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474325522D;
	Mon,  9 Jun 2025 11:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467620; cv=none; b=drlWbP5D8uapnUhipV5rcuAq/udcoEWSr/fuxXtYuoNExYfKvmY9yT3Ne7MUIsol5roHinpa/VUDbZ33sBOkIN43O1kfHATrkScIuDR9aiwH/e4ZH5ORAOOIhi0NCDlRVTZK7BXm9ga+nfrrGHS/xZw5vbOsp3DwVyKXpj79NXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467620; c=relaxed/simple;
	bh=3HqGMKGCduvaDGSc0DKP2PEQ5rGYfFoGbzierq/LB8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjkwGYvnHeAZUz/k1r7T5KP/vNi2wcycKkoe4MMopT5yrOZ4mNUYg/czOUUU8BUfuAZ9AA+a17uyQGJLFRD/uP7eLPhniylV0+EmFipAi3cxpFTrEZzuwfm0iBYQdzP4DtZ79d+4bbw/8j5LzO8WLGl9pdLB/tX3J77wxBF4iUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hp3TTndV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hp3TTndV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so36106735e9.2;
        Mon, 09 Jun 2025 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749467615; x=1750072415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hOQhq6CZUPAVA4WdzdkgO6qvBO3SSzHLUEvm+OJdhdM=;
        b=hp3TTndVePW0juOx4VawOgmXx4cxrlEOTmX25KkR0/TXj3CohGxa3AyhYbfCJlboIM
         VCoDBXnbEox2AebItjNZ0ESRdwltXXzOkUC9rN5NJY1AaVf06Ai9Ql3r7h0dSrMkrJ4p
         XMwNxO4a9nhZL93Xq7OAjjgQ2tUmJpMTRx9whu9vfwaBy2J7PlJuXOe7IiemyOub4QHy
         QX5/KO9VptBeSjZi+7v7yV2ZU0R/ogcq26gjPMyjSGObkBYAqxjI7KMqFsNlCMvMmPZ1
         B9u2PH0i3zKTFbRY6OQGOQ73IVuJezXZ7EMVDebmBa7vzMrRHbsDw5OGcfk/vQfqup3F
         njSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749467615; x=1750072415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOQhq6CZUPAVA4WdzdkgO6qvBO3SSzHLUEvm+OJdhdM=;
        b=ZnIH6jzUeTSdyTCW+TOyjvxR05S2nDL3UgvXnh42ChmhJqxDOySoBMEEUtx/aNDfL2
         +bO1dgI82hrt8E7AjKASYtw46crWsD7G2DWiYh5LfeD7h8yoscB5sCDV6DMghfx9NnCS
         TkGHpgOyHBrILKGqnR9mwvbemmJcQbFVgbmuXiYe2I9OJodnMtn62QFVOzqM/xpbgBAr
         j4ElxAWAYveHTE8x63gqvmpkCeOwKnGUhdV8DZcBSl/hBtidXnbZqFTbUBewaJXEP45x
         UQ21zYc+7QPDp6pyDoqSYvIj67oqMkIZCeiVftSVKufF/PDy6aXXLNPjzlDmMxCqsWUq
         10+A==
X-Forwarded-Encrypted: i=1; AJvYcCW4R1QH3ltnIYLxoRkrW7OqTBXdoATYOANWr2jLJ59oTRrMq+j5ZBVDbbxndDmaif8jzomTihuatS6JtUcj@vger.kernel.org, AJvYcCXaA79qFIDGPa+xtCthTwdMiIxaG0AfI0ZksBsG/QgFLfA5hXvzMsf7x0yjyid0wJsHpyjdj5u/dO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLqy5VtYxMlonu0Dt341wbUKZKl7heC4koyZnQz/dijLTA9NN8
	5VzT8CSivbQRgGBLdl2gFHVaOhI5d1ACbKIvNpOUPIypvwccLbsPj6Qz
X-Gm-Gg: ASbGncv7xM3C7+TFYDAqElLdE4rlWPaZAeVnxMTf6VvrYrHU9xpIGyZrFQLf5KFOjNu
	CelDLJ9Tbk+WxDWz5h133nZ71QC6GNZOX1wFZaDiLrKCPXSleaw/m+CsWWmayae+16195xt1CLp
	bCv4I+zCYZXIM8b8PrRry9bPk6otm1VcZQy2PaTxx+1uBif7qPmXkcHIVNLOpqj7sln8Sf3FHS1
	Jr3O97fXJB57X9WzR3U/LiWecjykA+XR+Xx7YqXrdkvGiE9wymyMjpT/MXcUlxMN4mw6U/m4LSk
	v+cDvEl/eJ+QJSY0QL4wS7j8uNkeX8+/Y8Ir7dQAlDa3I3sANSdF7hTBh+Jbq4R4UUaxu46vksw
	9sFs0Q/iZw3SjIOYctkH6YFO1xSz9hFDXpK0MlEYQtVIv8orEWbjkm0VuhchcfA4=
X-Google-Smtp-Source: AGHT+IErQ40tdpyZuHenlWRHkHCZteBYphWC8Nt4IP+canzeifWBphgcwFkM0703Nk25Ypp6SVN4dQ==
X-Received: by 2002:a05:600c:4e88:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-45201367b68mr122748775e9.4.1749467614202;
        Mon, 09 Jun 2025 04:13:34 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229d96fsm9257379f8f.7.2025.06.09.04.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 04:13:33 -0700 (PDT)
Message-ID: <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
Date: Mon, 9 Jun 2025 12:13:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com,
 Juan Yescas <jyescas@google.com>, Breno Leitao <leitao@debian.org>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/06/2025 17:10, Zi Yan wrote:
> On 6 Jun 2025, at 11:38, Usama Arif wrote:
> 
>> On 06/06/2025 16:18, Zi Yan wrote:
>>> On 6 Jun 2025, at 10:37, Usama Arif wrote:
>>>
>>>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
>>>> watermarks are evaluated to extremely high values, for e.g. a server with
>>>> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
>>>> of the sizes set to never, the min, low and high watermarks evaluate to
>>>> 11.2G, 14G and 16.8G respectively.
>>>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
>>>> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
>>>> and 1G respectively.
>>>> This is because set_recommended_min_free_kbytes is designed for PMD
>>>> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
>>>> Such high watermark values can cause performance and latency issues in
>>>> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
>>>> most of them would never actually use a 512M PMD THP.
>>>>
>>>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
>>>> folio order enabled in set_recommended_min_free_kbytes.
>>>> With this patch, when only 2M THP hugepage size is set to madvise for the
>>>> same machine with 64K page size, with the rest of the sizes set to never,
>>>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
>>>> respectively. When 512M THP hugepage size is set to madvise for the same
>>>> machine with 64K page size, the min, low and high watermarks evaluate to
>>>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
>>>
>>> Getting pageblock_order involved here might be confusing. I think you just
>>> want to adjust min, low and high watermarks to reasonable values.
>>> Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_pages_per_zone
>>> and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, the changes
>>> look reasonable to me.
>>
>> Hi Zi,
>>
>> Thanks for the review!
>>
>> I forgot to change it in another place, sorry about that! So can't move
>> MIGRATE_PCPTYPES * MIGRATE_PCPTYPES into the combined function.
>> Have added the additional place where min_thp_pageblock_nr_pages() is called
>> as a fixlet here:
>> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/
>>
>> I think atleast in this context the orginal name pageblock_nr_pages isn't
>> correct as its min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER).
>> The new name min_thp_pageblock_nr_pages is also not really good, so happy
>> to change it to something appropriate.
> 
> Got it. pageblock is the defragmentation granularity. If user only wants
> 2MB mTHP, maybe pageblock order should be adjusted. Otherwise,
> kernel will defragment at 512MB granularity, which might not be efficient.
> Maybe make pageblock_order a boot time parameter?
> 
> In addition, we are mixing two things together:
> 1. min, low, and high watermarks: they affect when memory reclaim and compaction
>    will be triggered;
> 2. pageblock order: it is the granularity of defragmentation for creating
>    mTHP/THP.
> 
> In your use case, you want to lower watermarks, right? Considering what you
> said below, I wonder if we want a way of enforcing vm.min_free_kbytes,
> like a new sysctl knob, vm.force_min_free_kbytes (yeah the suggestion
> is lame, sorry).
> 
> I think for 2, we might want to decouple pageblock order from defragmentation
> granularity.
> 

This is a good point. I only did it for the watermarks in the RFC, but there
is no reason that the defrag granularity is done in 512M chunks and is probably
very inefficient to do so?

Instead of replacing the pageblock_nr_pages for just set_recommended_min_free_kbytes,
maybe we just need to change the definition of pageblock_order in [1] to take into
account the highest large folio order enabled instead of HPAGE_PMD_ORDER?

[1] https://elixir.bootlin.com/linux/v6.15.1/source/include/linux/pageblock-flags.h#L50

I really want to avoid coming up with a solution that requires changing a Kconfig or needs
kernel commandline to change. It would mean a reboot whenever a different workload
runs on a server that works optimally with a different THP size, and that would make
workload orchestration a nightmare.


> 
>>>
>>> Another concern on tying watermarks to highest THP order is that if
>>> user enables PMD THP on such systems with 2MB mTHP enabled initially,
>>> it could trigger unexpected memory reclaim and compaction, right?
>>> That might surprise user, since they just want to adjust availability
>>> of THP sizes, but the whole system suddenly begins to be busy.
>>> Have you experimented with it?
>>>
>>
>> Yes I would imagine it would trigger reclaim and compaction if the system memory
>> is too low, but that should hopefully be expected? If the user is enabling 512M
>> THP, they should expect changes by kernel to allow them to give hugepage of
>> that size.
>> Also hopefully, no one is enabling PMD THPs when the system is so low on
>> memory that it triggers reclaim! There would be an OOM after just a few
>> of those are faulted in.
> 
> 
> 
> Best Regards,
> Yan, Zi

