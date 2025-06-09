Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA131F3BB0;
	Mon,  9 Jun 2025 20:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499410; cv=none; b=TIGwrmzjVWQUjd2nsf01EUiauKqZJVbJKcm29J+Xu+feozyRKx6EQskp3Xj/Wy+B1GAMM6Y6Iwtm4sFY7V9i+LniGfn0AzytRdeJ58PBIQbgS81f6a0Q0koYgBEjdfDE3xrki+TURndAcLvW/j2GvWTpSMb4Lni4T2P3uvg+Ybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499410; c=relaxed/simple;
	bh=QjqxOXFq0T6lYq2ifb+GxxeHi70wQ5dfgqzH81P8O8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryiOKsd74GBl3s+NSjO0vaiCq1eWb4YUARsVJZn6FbZkykw1Dzxs96avIBm+NPSKYZ4lRwDFyc0GxqrMB9FeUucBr0Z8RRl0icx4VrjBKwrxyLoHk9rDqz0reZ+lqZ4HNAKjrtBTL/wT8TsvIlbZkR5cNmNBkOALU2aKlD0mJh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGmwAqg5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGmwAqg5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so38633085e9.0;
        Mon, 09 Jun 2025 13:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749499407; x=1750104207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3XzMKnu0mIQ95ufMeBLRVI9/OO5W5wFHMg0c5ffM7c=;
        b=DGmwAqg5oiUyAINdqgcZnJDT5ELDFBjFozUm+7fD4z1VJ/gn9K1Izca5WD2mEOTpCb
         4CgQOSZhIs7YyagJ0/AdLohhFFxKNEMIMhh9VrAQzt6eAsyUpFpet2weTp4cqSo2YgnP
         q+T96TYeMSNdF49riJKNyhEZY1A3AXpv2HUZM02VUIWYKwXE1zWmuX68NwMKab3441YZ
         ZASoGWDErrZUNbFLFk3S/NHIviiy+2PiERqI7TsGIIHxaelSq7kV2AiFWrQgQq2k8hsd
         +kLwhi8lviMUhlq0aAcMvH4kunT8l1AQV/XXMA52mI1BSfnmTgpxuNgCiXHTwjHnyaeh
         sm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749499407; x=1750104207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3XzMKnu0mIQ95ufMeBLRVI9/OO5W5wFHMg0c5ffM7c=;
        b=rYfSjf0gDIFyNvYqL/xDSHpT3dN7ZdTpxaxI70EWk/kQKgGesxS/F6Jz2XZwTzCeeU
         y2Gj3NdtBOPU0uZFDEicAVZjjVdZcfrwbMlfPWJyrAchj69WNJSIzjsLbVEBz5M6rT0p
         xUY3zA34DR/Smm1UZyy4GF2jGn5D2+KUOA79WfwhAwbfza9fnG1nKk9XwZhB+fdYfoQn
         hvgYxRWe9pqgneRXr8r52iP1RFoX2h9qRfxyFBQid6103o9SpbCVNMOAi9i3M8MIzNA+
         u+ZnUFL8cxF1V8iIO6MVlcGkTR3KOqEWKP9GQUT4nVtb8qBvYFMdVHIhT83Zelliu1H0
         ltjg==
X-Forwarded-Encrypted: i=1; AJvYcCUWZSbz51ampQBfak9KqMRNQRhTHCj8wsgfZdQ5TlPaa/tpK9R9SxF+e4d0CgQ5ZU/X7GcpwQdjIvc=@vger.kernel.org, AJvYcCUtx0lUKVKzev/0P+WDWnvV0WHr3qZppZUQdCmyGFCsZ7SiM5uB2z8Jm1BXQGPndK975byFalWiOw/DtKzp@vger.kernel.org
X-Gm-Message-State: AOJu0YxblPCeG0P6olRS8OKgWcBTpS9SkjxYVeqNVAGPjtjy2X6mGO7D
	LtL7tFKZzN7qVUv4xNxGMTEXY5sR/uICVSPu588Aw8E6CZM/D5n06a5B
X-Gm-Gg: ASbGncun5u/gKcj5UCEpvrN7qVygYU3tshUOQgoCyzkZ3yascngGNiNvx7dUit/ufni
	nSarYLUZQ+ZQun3Saoxi//y7X5CODnqUdrrtLpjGZsozMDiFMYbQj22onGjGQJVJfxNWblpzKE+
	0H35mdTv4DHovcKLxt2pE8/Uk06SoKC9tB4wohSDC4auBfP6J29Nstl3MGZJu+HACAa59Md7y0G
	scq1pG11zufpveaOi8EOBG9f3GWpWO+d34SEkjMboQOdI3HSrtHZb5TAuvCFnjJQpZUklZS3Jvr
	HMedvHxhsNx+YDVstswZhVPwu6n5aaG+iI8fD3nEOM9bcyJkCNtvd2Ad3K0Pid4eApq+kt3ru3v
	PPBUwdX464Hb56M0d3XEVopttYBwj2krio57RmuPCVSowRx8=
X-Google-Smtp-Source: AGHT+IGowvBUP/O3pdklAdz+N/DtoDcUGaG42o5RJmofp/W7d1VrV3PEWR87sR4Qiah+t4LIncEkoA==
X-Received: by 2002:a5d:5f86:0:b0:3a3:64fb:304d with SMTP id ffacd0b85a97d-3a5319ba166mr11059717f8f.12.1749499406780;
        Mon, 09 Jun 2025 13:03:26 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463ed4sm10366760f8f.94.2025.06.09.13.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 13:03:26 -0700 (PDT)
Message-ID: <35c82f60-0090-4d23-bb83-9898393cf928@gmail.com>
Date: Mon, 9 Jun 2025 21:03:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
To: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: david@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Juan Yescas <jyescas@google.com>,
 Breno Leitao <leitao@debian.org>
References: <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
 <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
 <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
 <61da7d25-f115-4be3-a09f-7696efe7f0ec@lucifer.local>
 <AA2C4D68-B1DC-48A6-A807-56516067B9C7@nvidia.com>
 <f980e652-8e2a-41da-af9b-39fdd439fefc@lucifer.local>
 <2338896F-7F86-4F5A-A3CC-D14459B8F227@nvidia.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <2338896F-7F86-4F5A-A3CC-D14459B8F227@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/06/2025 20:49, Zi Yan wrote:
> On 9 Jun 2025, at 15:40, Lorenzo Stoakes wrote:
> 
>> On Mon, Jun 09, 2025 at 11:20:04AM -0400, Zi Yan wrote:
>>> On 9 Jun 2025, at 10:50, Lorenzo Stoakes wrote:
>>>
>>>> On Mon, Jun 09, 2025 at 10:37:26AM -0400, Zi Yan wrote:
>>>>> On 9 Jun 2025, at 10:16, Lorenzo Stoakes wrote:
>>>>>
>>>>>> On Mon, Jun 09, 2025 at 03:11:27PM +0100, Usama Arif wrote:
>>>>
>>>> [snip]
>>>>
>>>>>>> So I guess the question is what should be the next step? The following has been discussed:
>>>>>>>
>>>>>>> - Changing pageblock_order at runtime: This seems unreasonable after Zi's explanation above
>>>>>>>   and might have unintended consequences if done at runtime, so a no go?
>>>>>>> - Decouple only watermark calculation and defrag granularity from pageblock order (also from Zi).
>>>>>>>   The decoupling can be done separately. Watermark calculation can be decoupled using the
>>>>>>>   approach taken in this RFC. Although max order used by pagecache needs to be addressed.
>>>>>>>
>>>>>>
>>>>>> I need to catch up with the thread (workload crazy atm), but why isn't it
>>>>>> feasible to simply statically adjust the pageblock size?
>>>>>>
>>>>>> The whole point of 'defragmentation' is to _heuristically_ make it less
>>>>>> likely there'll be fragmentation when requesting page blocks.
>>>>>>
>>>>>> And the watermark code is explicitly about providing reserves at a
>>>>>> _pageblock granularity_.
>>>>>>
>>>>>> Why would we want to 'defragment' to 512MB physically contiguous chunks
>>>>>> that we rarely use?
>>>>>>
>>>>>> Since it's all heuristic, it seems reasonable to me to cap it at a sensible
>>>>>> level no?
>>>>>
>>>>> What is a sensible level? 2MB is a good starting point. If we cap pageblock
>>>>> at 2MB, everyone should be happy at the moment. But if one user wants to
>>>>> allocate 4MB mTHP, they will most likely fail miserably, because pageblock
>>>>> is 2MB, kernel is OK to have a 2MB MIGRATE_MOVABLE pageblock next to a 2MB
>>>>> MGIRATE_UNMOVABLE one, making defragmenting 4MB an impossible job.
>>>>>
>>>>> Defragmentation has two components: 1) pageblock, which has migratetypes
>>>>> to prevent mixing movable and unmovable pages, as a single unmovable page
>>>>> blocks large free pages from being created; 2) memory compaction granularity,
>>>>> which is the actual work to move pages around and form a large free pages.
>>>>> Currently, kernel assumes pageblock size = defragmentation granularity,
>>>>> but in reality, as long as pageblock size >= defragmentation granularity,
>>>>> memory compaction would still work, but not the other way around. So we
>>>>> need to choose pageblock size carefully to not break memory compaction.
>>>>
>>>> OK I get it - the issue is that compaction itself operations at a pageblock
>>>> granularity, and once you get so fragmented that compaction is critical to
>>>> defragmentation, you are stuck if the pageblock is not big enough.
>>>
>>> Right.
>>>
>>>>
>>>> Thing is, 512MB pageblock size for compaction seems insanely inefficient in
>>>> itself, and if we're complaining about issues with unavailable reserved
>>>> memory due to crazy PMD size, surely one will encounter the compaction
>>>> process simply failing to succeed/taking forever/causing issues with
>>>> reclaim/higher order folio allocation.
>>>
>>> Yep. Initially, we probably never thought PMD THP would be as large as
>>> 512MB.
>>
>> Of course, such is the 'organic' nature of kernel development :)
>>
>>>
>>>>
>>>> I mean, I don't really know the compaction code _at all_ (ran out of time
>>>> to cover in book ;), but is it all or-nothing? Does it grab a pageblock or
>>>> gives up?
>>>
>>> compaction works on one pageblock at a time, trying to migrate in-use pages
>>> within the pageblock away to create a free page for THP allocation.
>>> It assumes PMD THP size is equal to pageblock size. It will keep working
>>> until a PMD THP size free page is created. This is a very high level
>>> description, omitting a lot of details like how to avoid excessive compaction
>>> work, how to reduce compaction latency.
>>
>> Yeah this matches my assumptions.
>>
>>>
>>>>
>>>> Because it strikes me that a crazy pageblock size would cause really
>>>> serious system issues on that basis alone if that's the case.
>>>>
>>>> And again this leads me back to thinking it should just be the page block
>>>> size _as a whole_ that should be adjusted.
>>>>
>>>> Keep in mind a user can literally reduce the page block size already via
>>>> CONFIG_PAGE_BLOCK_MAX_ORDER.
>>>>
>>>> To me it seems that we should cap it at the highest _reasonable_ mTHP size
>>>> you can get on a 64KB (i.e. maximum right? RIGHT? :P) base page size
>>>> system.
>>>>
>>>> That way, people _can still get_ super huge PMD sized huge folios up to the
>>>> point of fragmentation.
>>>>
>>>> If we do reduce things this way we should give a config option to allow
>>>> users who truly want collosal PMD sizes with associated
>>>> watermarks/compaction to be able to still have it.
>>>>
>>>> CONFIG_PAGE_BLOCK_HARD_LIMIT_MB or something?
>>>
>>> I agree with capping pageblock size at a highest reasonable mTHP size.
>>> In case there is some user relying on this huge PMD THP, making
>>> pageblock a boot time variable might be a little better, since
>>> they do not need to recompile the kernel for their need, assuming
>>> distros will pick something like 2MB as the default pageblock size.
>>
>> Right, this seems sensible, as long as we set a _default_ that limits to
>> whatever it would be, 2MB or such.
>>
>> I don't think it's unreasonable to make that change since this 512 MB thing
>> is so entirely unexpected and unusual.
>>
>> I think Usama said it would be a pain it working this way if it had to be
>> explicitly set as a boot time variable without defaulting like this.
>>
>>>
>>>>
>>>> I also question this de-coupling in general (I may be missing somethig
>>>> however!) - the watermark code _very explicitly_ refers to providing
>>>> _pageblocks_ in order to ensure _defragmentation_ right?
>>>
>>> Yes. Since without enough free memory (bigger than a PMD THP),
>>> memory compaction will just do useless work.
>>
>> Yeah right, so this is a key thing and why we need to rework the current
>> state of the patch.
>>
>>>
>>>>
>>>> We would need to absolutely justify why it's suddenly ok to not provide
>>>> page blocks here.
>>>>
>>>> This is very very delicate code we have to be SO careful about.
>>>>
>>>> This is why I am being cautious here :)
>>>
>>> Understood. In theory, we can associate watermarks with THP allowed orders
>>> the other way around too, meaning if user lowers vm.min_free_kbytes,
>>> all THP/mTHP sizes bigger than the watermark threshold are disabled
>>> automatically. This could fix the memory compaction issues, but
>>> that might also drive user crazy as they cannot use the THP sizes
>>> they want.
>>
>> Yeah that's interesting but I think that's just far too subtle and people will
>> have no idea what's going on.
>>
>> I really think a hard cap, expressed in KB/MB, on pageblock size is the way to
>> go (but overrideable for people crazy enough to truly want 512 MB pages - and
>> who cannot then complain about watermarks).
> 
> I agree. Basically, I am thinking:
> 1) use something like 2MB as default pageblock size for all arch (the value can
> be set differently if some arch wants a different pageblock size due to other reasons), this can be done by modifying PAGE_BLOCK_MAX_ORDER’s default
> value;
> 
> 2) make pageblock_order a boot time parameter, so that user who wants
> 512MB pages can still get it by changing pageblock order at boot time.
> 
> WDYT?
> 

I was really hoping we would come up with a dynamic way of doing this,
especially one that doesn't require any more input from the user apart
from just setting the mTHP size via sysfs..

1) in a way is already done. We can set it to 2M by setting
ARCH_FORCE_MAX_ORDER to 5:

In arch/arm64/Kconfig we already have:

config ARCH_FORCE_MAX_ORDER
	int
	default "13" if ARM64_64K_PAGES
	default "11" if ARM64_16K_PAGES
	default "10"

Doing 2) would require reboot and doing this just for changing mTHP size
will probably be a nightmare for workload orchestration.

