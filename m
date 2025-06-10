Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F48021CC71;
	Tue, 10 Jun 2025 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552091; cv=none; b=db6TcOsEaMcwImHsPDeXPgoPrGiBZwww8l1+EwsoSsrllTPAxSLErcU8RCI4J57+X6HjWrEf9JSpWJoD8+IlvroBBP4Q6d5v+Tw7CHBGKB6zBpT/y8EVIFlsankLTJbU2u4QdfICqMhOTKHrbrRwMStiNAzzXnfaEOPeYCLSZUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552091; c=relaxed/simple;
	bh=hVsAPzl2ekcVzfIed1KYNBLOlJwSjoRMdMDWYK5DS3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNVzoQfkei2ZZqPmbtPo85UHGv1LkvxuEzbWgPL/WqONrXulL/4tjbrAMgjWske073LVs/kEeos93MJXxV/4gI1mOqMnPXBHJvgamz6mZyhI0T6NbMfrlCj13ZY/4dg6jed3CANynQl34HpUmH/YYaU3J6oHTnvVYTZQ9dbOBD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DglsHQAU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DglsHQAU"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so769100066b.0;
        Tue, 10 Jun 2025 03:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552088; x=1750156888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBEjVOIXjiw3gOSKaKGSvpUqb8Lc0rwKnc1mO4icXtA=;
        b=DglsHQAU50x8g01Rp15EpzLsETH4bM9kira+opwqE17EXLLgX44P4C5BhXsx5CpJKs
         Xyl2thK3gR9ltMdxuf+g6UARVYJrXGqpMtLg2V/QNQUYe6lKzPF5PYNBdZI+9OJHYNzJ
         nIGvnAiNHYFC6Ix9ipE3bPpVKDVe0A0doFKiEjGvfYm5r+mkjLl3CXoUyy7lWNPIQDLY
         qODxA6jOzrx9bZltvhK8WQYZQx4f0d/68jN77L4vOsb955P6nyhOOqAIY3PR3CCLaASY
         tbup7gnI+siHADCEOYcq1e43rhaNhoN62nQk+qGafsgeI0xayakwkp2Pd3v19s9fK45m
         fCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552088; x=1750156888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBEjVOIXjiw3gOSKaKGSvpUqb8Lc0rwKnc1mO4icXtA=;
        b=M8sC2xcxMIjLfxpbIQzX4exV8i+iNGGQnVaU5kLOqQ/S8OKkf3rPyPGSB0gFi5IiaD
         06ntEqXMH6wW2ag0mWsjB35xIrByRTRiPdVxbtdFXJe5BzCzdV9hu1qrgR316EA/F8Ga
         mgnroGT6Z7jFnkoEwRZStsUYIPVqhusBd68nfReEIyYZMMynFY/CfN28Gv5f8vVWrt7b
         ShXo4TT33cfOEba4yqIDmx5y74TPq76fLKB+DT8uCmKgSYGcPzGTDk2pL9hM6rofPCB7
         i3ELsJRZTf6WcIqhzp2AqT1o0eZYoXK5UWaYsyka/yJABryTykAcDTA5ShUxkiVxn57t
         ynJA==
X-Forwarded-Encrypted: i=1; AJvYcCWWAyYl7A2qR4WuAdXqtMDEr2OpKfcd5jHpNB17SXBG0njar5NACKIPIW9vfMDxXI3VS3KalvOKdo4=@vger.kernel.org, AJvYcCXkTx8zEmqq7e+C2bIIRHz6f2l2Y0MX4WxOX4TVMXeac+J5J8OMPiVYDynOFeqvYE/3/vB26KqSX4eEmJeZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy20qZRnsooqKQaqnBmuIQF0oDcEu3Nb7tBCgdum+OjLfYMeh+u
	b43JfohgvRIQ6s19Dm3VqF+HE5nAYout1qwJazIYKrfHSEz9eESlgNH/
X-Gm-Gg: ASbGncv4m6JLR2xaxy6ow2ItIqw9qsxLOtXpjeo6JoQXUmbJZ6anURp4PekO5nRYX28
	dYcLPQLNFR4EoLMkUBLzGXrjijXqvllT1sPzQhj7mCv6t50LiGFyah/cwkp5n23PBbJyTFxTQeY
	WUJsQkbui05Zyx8DJZr9Op8mnk/eU6s9XxjWsdg4ozL/snt0k3wwcKRDXIkMJQ/YYu2LsmQ1tH3
	yUNvoiNu57NbLV7em2ufCXWoaPV+R7MT70/zHEkkohay7wQUBisENB4l5CjKoeU77d47v77G4ft
	cpVDrWTGWivHzDGoCWlLVIEdYEylxZeKD7PaT8leu2FmBbDzeQyNTG4ylSJA6RcarPp6ta+s5qn
	/ZGnZis4LCbBKIfetbORtkViz5LjQEWSi
X-Google-Smtp-Source: AGHT+IHcRd//B2Wob0clnLjUDUSaP52MC+Ps+W/1XHa7A8GKWRdOP3YRJcxgX1/eeyrgGIb0PVksPQ==
X-Received: by 2002:a17:907:720d:b0:ad8:9909:20a8 with SMTP id a640c23a62f3a-ade1a9e911emr1615080466b.49.1749552087340;
        Tue, 10 Jun 2025 03:41:27 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:c2f:a34:6718:ee1d? ([2620:10d:c092:500::7:b9b7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7d300sm711097366b.179.2025.06.10.03.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:41:26 -0700 (PDT)
Message-ID: <b583f359-af9d-4121-a192-3b8991dfe8c9@gmail.com>
Date: Tue, 10 Jun 2025 11:41:25 +0100
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
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, david@redhat.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
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
 <35c82f60-0090-4d23-bb83-9898393cf928@gmail.com>
 <D3992D01-63C9-42A2-A0C4-0A119AAC1BE2@nvidia.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <D3992D01-63C9-42A2-A0C4-0A119AAC1BE2@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/06/2025 21:24, Zi Yan wrote:
> On 9 Jun 2025, at 16:03, Usama Arif wrote:
> 
>> On 09/06/2025 20:49, Zi Yan wrote:
>>> On 9 Jun 2025, at 15:40, Lorenzo Stoakes wrote:
>>>
>>>> On Mon, Jun 09, 2025 at 11:20:04AM -0400, Zi Yan wrote:
>>>>> On 9 Jun 2025, at 10:50, Lorenzo Stoakes wrote:
>>>>>
>>>>>> On Mon, Jun 09, 2025 at 10:37:26AM -0400, Zi Yan wrote:
>>>>>>> On 9 Jun 2025, at 10:16, Lorenzo Stoakes wrote:
>>>>>>>
>>>>>>>> On Mon, Jun 09, 2025 at 03:11:27PM +0100, Usama Arif wrote:
>>>>>>
>>>>>> [snip]
>>>>>>
>>>>>>>>> So I guess the question is what should be the next step? The following has been discussed:
>>>>>>>>>
>>>>>>>>> - Changing pageblock_order at runtime: This seems unreasonable after Zi's explanation above
>>>>>>>>>   and might have unintended consequences if done at runtime, so a no go?
>>>>>>>>> - Decouple only watermark calculation and defrag granularity from pageblock order (also from Zi).
>>>>>>>>>   The decoupling can be done separately. Watermark calculation can be decoupled using the
>>>>>>>>>   approach taken in this RFC. Although max order used by pagecache needs to be addressed.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I need to catch up with the thread (workload crazy atm), but why isn't it
>>>>>>>> feasible to simply statically adjust the pageblock size?
>>>>>>>>
>>>>>>>> The whole point of 'defragmentation' is to _heuristically_ make it less
>>>>>>>> likely there'll be fragmentation when requesting page blocks.
>>>>>>>>
>>>>>>>> And the watermark code is explicitly about providing reserves at a
>>>>>>>> _pageblock granularity_.
>>>>>>>>
>>>>>>>> Why would we want to 'defragment' to 512MB physically contiguous chunks
>>>>>>>> that we rarely use?
>>>>>>>>
>>>>>>>> Since it's all heuristic, it seems reasonable to me to cap it at a sensible
>>>>>>>> level no?
>>>>>>>
>>>>>>> What is a sensible level? 2MB is a good starting point. If we cap pageblock
>>>>>>> at 2MB, everyone should be happy at the moment. But if one user wants to
>>>>>>> allocate 4MB mTHP, they will most likely fail miserably, because pageblock
>>>>>>> is 2MB, kernel is OK to have a 2MB MIGRATE_MOVABLE pageblock next to a 2MB
>>>>>>> MGIRATE_UNMOVABLE one, making defragmenting 4MB an impossible job.
>>>>>>>
>>>>>>> Defragmentation has two components: 1) pageblock, which has migratetypes
>>>>>>> to prevent mixing movable and unmovable pages, as a single unmovable page
>>>>>>> blocks large free pages from being created; 2) memory compaction granularity,
>>>>>>> which is the actual work to move pages around and form a large free pages.
>>>>>>> Currently, kernel assumes pageblock size = defragmentation granularity,
>>>>>>> but in reality, as long as pageblock size >= defragmentation granularity,
>>>>>>> memory compaction would still work, but not the other way around. So we
>>>>>>> need to choose pageblock size carefully to not break memory compaction.
>>>>>>
>>>>>> OK I get it - the issue is that compaction itself operations at a pageblock
>>>>>> granularity, and once you get so fragmented that compaction is critical to
>>>>>> defragmentation, you are stuck if the pageblock is not big enough.
>>>>>
>>>>> Right.
>>>>>
>>>>>>
>>>>>> Thing is, 512MB pageblock size for compaction seems insanely inefficient in
>>>>>> itself, and if we're complaining about issues with unavailable reserved
>>>>>> memory due to crazy PMD size, surely one will encounter the compaction
>>>>>> process simply failing to succeed/taking forever/causing issues with
>>>>>> reclaim/higher order folio allocation.
>>>>>
>>>>> Yep. Initially, we probably never thought PMD THP would be as large as
>>>>> 512MB.
>>>>
>>>> Of course, such is the 'organic' nature of kernel development :)
>>>>
>>>>>
>>>>>>
>>>>>> I mean, I don't really know the compaction code _at all_ (ran out of time
>>>>>> to cover in book ;), but is it all or-nothing? Does it grab a pageblock or
>>>>>> gives up?
>>>>>
>>>>> compaction works on one pageblock at a time, trying to migrate in-use pages
>>>>> within the pageblock away to create a free page for THP allocation.
>>>>> It assumes PMD THP size is equal to pageblock size. It will keep working
>>>>> until a PMD THP size free page is created. This is a very high level
>>>>> description, omitting a lot of details like how to avoid excessive compaction
>>>>> work, how to reduce compaction latency.
>>>>
>>>> Yeah this matches my assumptions.
>>>>
>>>>>
>>>>>>
>>>>>> Because it strikes me that a crazy pageblock size would cause really
>>>>>> serious system issues on that basis alone if that's the case.
>>>>>>
>>>>>> And again this leads me back to thinking it should just be the page block
>>>>>> size _as a whole_ that should be adjusted.
>>>>>>
>>>>>> Keep in mind a user can literally reduce the page block size already via
>>>>>> CONFIG_PAGE_BLOCK_MAX_ORDER.
>>>>>>
>>>>>> To me it seems that we should cap it at the highest _reasonable_ mTHP size
>>>>>> you can get on a 64KB (i.e. maximum right? RIGHT? :P) base page size
>>>>>> system.
>>>>>>
>>>>>> That way, people _can still get_ super huge PMD sized huge folios up to the
>>>>>> point of fragmentation.
>>>>>>
>>>>>> If we do reduce things this way we should give a config option to allow
>>>>>> users who truly want collosal PMD sizes with associated
>>>>>> watermarks/compaction to be able to still have it.
>>>>>>
>>>>>> CONFIG_PAGE_BLOCK_HARD_LIMIT_MB or something?
>>>>>
>>>>> I agree with capping pageblock size at a highest reasonable mTHP size.
>>>>> In case there is some user relying on this huge PMD THP, making
>>>>> pageblock a boot time variable might be a little better, since
>>>>> they do not need to recompile the kernel for their need, assuming
>>>>> distros will pick something like 2MB as the default pageblock size.
>>>>
>>>> Right, this seems sensible, as long as we set a _default_ that limits to
>>>> whatever it would be, 2MB or such.
>>>>
>>>> I don't think it's unreasonable to make that change since this 512 MB thing
>>>> is so entirely unexpected and unusual.
>>>>
>>>> I think Usama said it would be a pain it working this way if it had to be
>>>> explicitly set as a boot time variable without defaulting like this.
>>>>
>>>>>
>>>>>>
>>>>>> I also question this de-coupling in general (I may be missing somethig
>>>>>> however!) - the watermark code _very explicitly_ refers to providing
>>>>>> _pageblocks_ in order to ensure _defragmentation_ right?
>>>>>
>>>>> Yes. Since without enough free memory (bigger than a PMD THP),
>>>>> memory compaction will just do useless work.
>>>>
>>>> Yeah right, so this is a key thing and why we need to rework the current
>>>> state of the patch.
>>>>
>>>>>
>>>>>>
>>>>>> We would need to absolutely justify why it's suddenly ok to not provide
>>>>>> page blocks here.
>>>>>>
>>>>>> This is very very delicate code we have to be SO careful about.
>>>>>>
>>>>>> This is why I am being cautious here :)
>>>>>
>>>>> Understood. In theory, we can associate watermarks with THP allowed orders
>>>>> the other way around too, meaning if user lowers vm.min_free_kbytes,
>>>>> all THP/mTHP sizes bigger than the watermark threshold are disabled
>>>>> automatically. This could fix the memory compaction issues, but
>>>>> that might also drive user crazy as they cannot use the THP sizes
>>>>> they want.
>>>>
>>>> Yeah that's interesting but I think that's just far too subtle and people will
>>>> have no idea what's going on.
>>>>
>>>> I really think a hard cap, expressed in KB/MB, on pageblock size is the way to
>>>> go (but overrideable for people crazy enough to truly want 512 MB pages - and
>>>> who cannot then complain about watermarks).
>>>
>>> I agree. Basically, I am thinking:
>>> 1) use something like 2MB as default pageblock size for all arch (the value can
>>> be set differently if some arch wants a different pageblock size due to other reasons), this can be done by modifying PAGE_BLOCK_MAX_ORDER’s default
>>> value;
>>>
>>> 2) make pageblock_order a boot time parameter, so that user who wants
>>> 512MB pages can still get it by changing pageblock order at boot time.
>>>
>>> WDYT?
>>>
>>
>> I was really hoping we would come up with a dynamic way of doing this,
>> especially one that doesn't require any more input from the user apart
>> from just setting the mTHP size via sysfs..
> 
> Then we will need to get rid of pageblock size from both watermark calculation
> and memory compaction and think about a new anti-fragmentation mechanism
> to handle unmovable pages as current pageblock based mechanism no longer
> fit the need.
> 
> What you are expecting is:
> 1) watermarks should change as the largest enabled THP/mTHP size changes;
> 2) memory compaction targets the largest enabled THP/mTHP size (next step
> would improve memory compaction to optimize for all enabled sizes);
> 3) partitions of movable and unmovable pages can change dynamically
> based on the largest enabled THP/mTHP size;
> 4) pageblock size becomes irrelevant.
> 

I think both 1 and 2 can be achieved in a similar way? i.e. changing
pageblock_order to be min(largest_enabled_thp_order(), PAGE_BLOCK_MAX_ORDER).
But there a lot of instances of pageblock_order and pageblock_nr_pages and
all of them would need to be audited very carefully.

For 3, we need to do the dynamic array resizing that you mentioned for
pageblock_flags?

Yeah overall it sounds like quite a big change and would need a lot
of testing to make sure nothing breaks.

>>
>> 1) in a way is already done. We can set it to 2M by setting
>> ARCH_FORCE_MAX_ORDER to 5:
>>
>> In arch/arm64/Kconfig we already have:
>>
>> config ARCH_FORCE_MAX_ORDER
>> 	int
>> 	default "13" if ARM64_64K_PAGES
>> 	default "11" if ARM64_16K_PAGES
>> 	default "10"
> 
> Nah, that means user no longer can allocate pages larger than 2MB,
> because the cap is in the buddy allocator.
> 
>>
>> Doing 2) would require reboot and doing this just for changing mTHP size
>> will probably be a nightmare for workload orchestration.
> 
> No. That is not what I mean. pageblock_order set at boot time only limits
> the largest mTHP size. By default, user can get up to 2MB THP/mTHP,
> but if they want to get 512MB THP, they can reboot with a larger pageblock
> order and they can still use 2MB mTHP. The downside is that with
> larger pageblock order, user cannot get the optimal THP/mTHP performance
> kernel is designed to achieve.
> 

Yes, I mean this as well. If the largest mTHP size enabled goes from 2M to
512M than we need a reboot to actually obtain 512M THPs. If we switch from 512M
to 2M, we again need a reboot to get the best performance out of the server.

> Best Regards,
> Yan, Zi

