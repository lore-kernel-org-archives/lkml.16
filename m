Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0724B254B14;
	Mon,  9 Jun 2025 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749470868; cv=none; b=P9pJj1BlaQs0SPrOtNahoxNx/HF8AIo+IGbvc0yt+nf3/yCOOP1z96zesR6yidDrIdYfk0hee7NCMKurs20OyVqmS6Y4bOZeT8dZg6VAIRcxRP8kHLth9p+84/BH2JikESDWFDqM+kXnNKV6yMKaMAQ7lL0FKhr1DlJjcdqOWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749470868; c=relaxed/simple;
	bh=C60f1zNWoeyrA5j8X122LLeoSBDW/7kP8ngEP7pgr0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRSqlGjGYoq2uaurNTo6YMTT36Lx0ocTgCVbHorSSk31c+s9WZJLYWy3qPnhJqMbFrPvUt6PrEWWZRmKQoItmjKijk4SpFXgluK1TZplsh0OecwuJogMfHZZ8DVxjdLLUCobAOHoNMk+DSX/QGvJX3XwyTDwtY98Nua/yjFITvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laSiyk1s; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laSiyk1s"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so3122537f8f.2;
        Mon, 09 Jun 2025 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749470864; x=1750075664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftX+KMe2/g53504nbG7XlQigo3v9q6s3BbMSZH618qA=;
        b=laSiyk1sy8pz5Il/pgcW5xurX5CwSKbSo3Rdnxf7uViv544HUeXCqkfy724SpdBQtv
         0MLlDo0kAXWYbXCkulm30Yy+6uAia7Nx5KPBQ/Ztf6IOBA9RoujJPkdxzuoRnvOqCEGJ
         2XNq0wwak9CCqhtJC0caalM+robimYb+Wl+3TGcdz+DP84SlUz5TS5Dy/NUgGQ03C46j
         pAz8NtTC/k72ctymXtakMpDsEXjVrwcfVzOVdteHwx52zBB83psVUTJPodceLSRigBeD
         zP82C+cso+aegQpt6uLH+j+lKfK8b5TY2vSgJ7TRBPwDQaoPtVnEnLDKjK2TP4JDDB12
         jmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749470864; x=1750075664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftX+KMe2/g53504nbG7XlQigo3v9q6s3BbMSZH618qA=;
        b=iq71GIPkp+VKG2DBstMIhq9E8ratyIXru0oGAQAjzl/AZyq90DgjWxkF1MK+5rx372
         UqOtWZvoJjxgABoGp/xflDFEsrp4ZSaknQBgMA0nfj95l9SEjXIrgFjRXZpnV3PLzz/U
         sye3rij0ZSOeaSfJKyZ6jIRbuv5O1rM7kedMQky6nfStgeg+lj5FSTGVZhf7ZA7gIxIw
         EJs7PJjcHMmlAZgWgVop2ulivF6pBPwyRih++35NLI6zh/18SXK3wOkGrZnTUVTV5v+v
         NOPEdVrB6VNM8CFbslwN9i2/TTdUqFxkkVhXsyzL7t0BQuLdnAYX/MZSZkBS5o+lyOhE
         KaaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWG+m+Cu7D59GDqYr7XGuCtQEC1QXQZdgmksgBnYnCw6XBe7i5ghStuFILMw5Nyxmx0OmW4d8uHhA=@vger.kernel.org, AJvYcCXpm1qqBs7ClPUv5xC3WfHP3zPU4gbNamjyb18fIkh7csy4DSnBr/P9SpjJ2XsC19GqLI6/CKFtHjC0+Ma2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+U5C3Hxo0RgciDhiNO+JBVd2m19rxpcGFJafzSgDJES3ngae3
	tevUjB/0aw835N/RwJEQimAch53N7FscnVnU66RlcYd0+4jquDyB7gZB
X-Gm-Gg: ASbGnctyS16Z+AUO+zSE3iTPv2VicpenjX2bMFs1Jn0wXDitZwGRpGs7uiyMKKZZ6hK
	gd8bUP6EOmmY8rgfQG/EyeyilrHIst82X0AqOC6Mr2uRVmmhyNGnC/D4oLIh/EIINJC5LHWuO1Y
	x5LSoy1DQ4faJ7j/ccvrpoCEPF9kNqsHPp2eKbJqJ3imNwoPm/mZEvuhWpil06UwmCGVcpNdCEW
	njbJRhyV826C06fgUMx4ZdmM34FTuUzve7yxNUG/SGNeL2cLafZMHdm4NYHHzRUIlfMbdda7/ho
	/VPQXnxKnpBI5VAKxfXz5OVo6tFegFe/6Mk8DoAOCGznGCf1gOrCbtnE6nx66aaaU3fX3n3LTfU
	ZEnHyyd3CJl4JAmeHaaPHFLjgGGHorT1dtqDyJ/0EVV8S5pf4JjIkwj8eO8XaefBpjM4C7y1MeA
	==
X-Google-Smtp-Source: AGHT+IFOFg6bFB1AM9ERUWAWhyfdOaFb9+OSBD7HyfhOxSgT0+PdWXsU4niDdHa/Y9c/ynWVZy2P+w==
X-Received: by 2002:a05:6000:4387:b0:3a4:d274:1d9b with SMTP id ffacd0b85a97d-3a53188dcb7mr10273549f8f.25.1749470863961;
        Mon, 09 Jun 2025 05:07:43 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324361ffsm9276136f8f.47.2025.06.09.05.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 05:07:43 -0700 (PDT)
Message-ID: <8200fd8b-edae-44ab-be47-7dfccab25a24@gmail.com>
Date: Mon, 9 Jun 2025 13:07:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ziy@nvidia.com
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <063273aa-a852-492a-93da-ba5229f544ca@lucifer.local>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <063273aa-a852-492a-93da-ba5229f544ca@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/06/2025 09:18, Lorenzo Stoakes wrote:
> It's important to base against mm-new for new mm stuff, PAGE_BLOCK_ORDER got
> renamed to PAGE_BLOCK_MAX_ORDER in Zi's series at [0] and this doesn't compile.
> 
> Please always do a quick rebase + compile check before sending.
> 
> [0]:  https://lkml.kernel.org/r/20250604211427.1590859-1-ziy@nvidia.com
> 
> Overall this seems to me to be implemented at the wrong level of
> abstraction - we implement set_recommended_min_free_kbytes() to interact
> with the page block mechanism.
> 
> While the problem you describe is absolutely a problem and we need to
> figure out a way to avoid reserving ridiculous amounts of memory for higher
> page tables, we surely need to figure this out at a page block granularity
> don't we?
> 

Yes agreed, Zi raised a good point in [1], and I think there is no reason to just
do it to lower watermarks, it should be done at page block order so that defrag
also happens at for 2M and not 512M with the example given in the commit message.

[1] https://lore.kernel.org/all/c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com/

> On Fri, Jun 06, 2025 at 03:37:00PM +0100, Usama Arif wrote:
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
> 
> Right it is, but not this line really, the _pageblock order_ is set to be
> the minimum of the huge page PMD order and PAGE_BLOCK_MAX_ORDER as it makes
> sense to use page block heuristics to reduce the odds of fragmentation and
> so we can grab a PMD huge page at a time.
> 
> Obviously if the user wants to set a _smaller_ page block order they can,
> but if it's larger we want to heuristically avoid fragmentation of
> physically contiguous huge page aligned ranges (the whole page block
> mechanism).
> 
> I absolutely hate how set_recommended_min_free_kbytes() has basically
> hacked in some THP considerations but otherwise invokes
> calculate_min_free_kbytes()... ugh. But an existing issue.
> 
>> Such high watermark values can cause performance and latency issues in
>> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
>> most of them would never actually use a 512M PMD THP.
> 
> 512MB, yeah crazy. We've not thought this through, and this is a very real
> issue.
> 
> Again, it strikes me that we should be changing the page block order for 64
> KB arm64 rather than this calculation though.
> 

yes agreed. I think changing pageblock_order is the right approach.

> Keep in mind pageblocks are a heuristic mechanism designed to reduce
> fragmentation, the decision could be made to cap how far we're willing to
> go with that...
> 
>>
>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
>> folio order enabled in set_recommended_min_free_kbytes.
>> With this patch, when only 2M THP hugepage size is set to madvise for the
>> same machine with 64K page size, with the rest of the sizes set to never,
>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
>> respectively. When 512M THP hugepage size is set to madvise for the same
>> machine with 64K page size, the min, low and high watermarks evaluate to
>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
> 
> Hmm, but what happens if a user changes this live, does this get updated?
> 
> OK I see it does via:
> 
> sysfs stuff -> enabled_store() -> start_stop_khugepaged() -> set_recommended_min_free_kbytes()
> 
> But don't we want to change this in general? Does somebody happening to
> have 512MB THP at madvise or always suggest we want insane watermark
> numbers?

Unfortunately the answer to this is probably a lot of servers that use 64K
page size do. You can see in [1] that if anyone hasn't actually configured
the hugepage sizes via kernel commandline, and if the global policy is set
to madvise or always, then 512M is inheriting madvise/always and they would
have a very high watermark set. I dont think this behaviour is what most
people are expecting.

I actually think [1] should be wrapped in ifndef CONFIG_PAGE_SIZE_64KB,
but its always been the case that PMD is set to inherit, so probably
shouldnt be wrapped.

[1] https://elixir.bootlin.com/linux/v6.15.1/source/mm/huge_memory.c#L782

> 
> I'm not really convinced by this 'dynamic' aspect, you're changing global
> watermark numbers and reserves _massively_ based on a 'maybe' use of
> something that's meant to be transparent + best-effort...
> 

If someone sets 512M to madvise/always, it brings back the watermarks to
the levels without this patch.

>>
>> An alternative solution would be to change PAGE_BLOCK_ORDER by changing
>> ARCH_FORCE_MAX_ORDER to a lower value for ARM64_64K_PAGES. However, this
>> is not dynamic with hugepage size, will need different kernel builds for
>> different hugepage sizes and most users won't know that this needs to be
>> done as it can be difficult to detmermine that the performance and latency
>> issues are coming from the high watermark values.
> 
> Or, we could adjust pageblock_order accordingly in this instance no?
> 
>>
>> All watermark numbers are for zones of nodes that had the highest number
>> of pages, i.e. the value for min size for 4K is obtained using:
>> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 4096 / 1024 / 1024}';
>> and for 64K using:
>> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 65536 / 1024 / 1024}';
>>
>> An arbirtary min of 128 pages is used for when no hugepage sizes are set
>> enabled.
> 
> I don't think it's really okay to out and out add an arbitrary value like this
> without explanation. This is basis for rejection of the patch already.
> 

I just took 128 from calculate_min_free_kbytes, although I realize now that over there
its 128 kB, but over it will mean 128 pages = 128*64kB.

I think maybe a better number is sqrt(lowmem_kbytes * 16) from calculate_min_free_kbytes.

I cant see in git history how 128 and the sqrt number was chosen in calculate_min_free_kbytes.

> That seems a little low too no?
> 
> IMPORTANT: I'd really like to see some before/after numbers for 4k, 16k,
> 64k with THP enabled/disabled so you can prove your patch isn't
> fundamentally changing these values unexpectedly for users that aren't
> using crazy page sizes.
> 
>>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> ---
>>  include/linux/huge_mm.h | 25 +++++++++++++++++++++++++
>>  mm/khugepaged.c         | 32 ++++++++++++++++++++++++++++----
>>  mm/shmem.c              | 29 +++++------------------------
>>  3 files changed, 58 insertions(+), 28 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2f190c90192d..fb4e51ef0acb 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -170,6 +170,25 @@ static inline void count_mthp_stat(int order, enum mthp_stat_item item)
>>  }
>>  #endif
>>
>> +/*
>> + * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
>> + *
>> + * SHMEM_HUGE_NEVER:
>> + *	disables huge pages for the mount;
>> + * SHMEM_HUGE_ALWAYS:
>> + *	enables huge pages for the mount;
>> + * SHMEM_HUGE_WITHIN_SIZE:
>> + *	only allocate huge pages if the page will be fully within i_size,
>> + *	also respect madvise() hints;
>> + * SHMEM_HUGE_ADVISE:
>> + *	only allocate huge pages if requested with madvise();
>> + */
>> +
>> + #define SHMEM_HUGE_NEVER	0
>> + #define SHMEM_HUGE_ALWAYS	1
>> + #define SHMEM_HUGE_WITHIN_SIZE	2
>> + #define SHMEM_HUGE_ADVISE	3
>> +
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>
>>  extern unsigned long transparent_hugepage_flags;
>> @@ -177,6 +196,12 @@ extern unsigned long huge_anon_orders_always;
>>  extern unsigned long huge_anon_orders_madvise;
>>  extern unsigned long huge_anon_orders_inherit;
>>
>> +extern int shmem_huge __read_mostly;
>> +extern unsigned long huge_shmem_orders_always;
>> +extern unsigned long huge_shmem_orders_madvise;
>> +extern unsigned long huge_shmem_orders_inherit;
>> +extern unsigned long huge_shmem_orders_within_size;
>> +
> 
> Rather than exposing all of this shmem state as globals, can we not just have
> shmem provide a function that grabs this informtaion?
> 
>>  static inline bool hugepage_global_enabled(void)
>>  {
>>  	return transparent_hugepage_flags &
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 15203ea7d007..e64cba74eb2a 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -2607,6 +2607,26 @@ static int khugepaged(void *none)
>>  	return 0;
>>  }
>>
> 
>> +static int thp_highest_allowable_order(void)
> 
> Thisa absolutely needs a comment.
> 
>> +{
>> +	unsigned long orders = READ_ONCE(huge_anon_orders_always)
>> +			       | READ_ONCE(huge_anon_orders_madvise)
>> +			       | READ_ONCE(huge_shmem_orders_always)
>> +			       | READ_ONCE(huge_shmem_orders_madvise)
>> +			       | READ_ONCE(huge_shmem_orders_within_size);
> 
> Same comment as above, have shmem export this.
> 
>> +	if (hugepage_global_enabled())
>> +		orders |= READ_ONCE(huge_anon_orders_inherit);
>> +	if (shmem_huge != SHMEM_HUGE_NEVER)
>> +		orders |= READ_ONCE(huge_shmem_orders_inherit);
>> +
>> +	return orders == 0 ? 0 : fls(orders) - 1;
>> +}
>> +
>> +static unsigned long min_thp_pageblock_nr_pages(void)
> 
> I really really hate this name. This isn't number of pageblock pages any
> more this is something else? You're not changing the page block size right?
> 

I dont like it either :)

As I mentioned in reply to David now in [1], pageblock_nr_pages is not really
1 << PAGE_BLOCK_ORDER but is 1 << min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER) when
THP is enabled.

It needs a better name, but I think the right approach is just to change
pageblock_order as recommended in [2]

[1] https://lore.kernel.org/all/4adf1f8b-781d-4ab0-b82e-49795ad712cb@gmail.com/

>> +{
>> +	return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
>> +}
>> +
>>  static void set_recommended_min_free_kbytes(void)
>>  {
>>  	struct zone *zone;
>> @@ -2638,12 +2658,16 @@ static void set_recommended_min_free_kbytes(void)
> 
> You provide a 'patchlet' in
> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/
> 
> That also does:
> 
>         /* Ensure 2 pageblocks are free to assist fragmentation avoidance */
> -       recommended_min = pageblock_nr_pages * nr_zones * 2;
> +       recommended_min = min_thp_pageblock_nr_pages() * nr_zones * 2;
> 
> So comment here - this comment is now incorrect, this isn't 2 page blocks,
> it's 2 of 'sub-pageblock size as if page blocks were dynamically altered by
> always/madvise THP size'.
> 
> Again, this whole thing strikes me as we're doing things at the wrong level
> of abstraction.
> 
> And you're definitely now not helping avoid pageblock-sized
> fragmentation. You're accepting that you need less so... why not reduce
> pageblock size? :)
> 
> 	/*
> 	 * Make sure that on average at least two pageblocks are almost free
> 	 * of another type, one for a migratetype to fall back to and a
> 
> ^ remainder of comment
> 
>>  	 * second to avoid subsequent fallbacks of other types There are 3
>>  	 * MIGRATE_TYPES we care about.
>>  	 */
>> -	recommended_min += pageblock_nr_pages * nr_zones *
>> +	recommended_min += min_thp_pageblock_nr_pages() * nr_zones *
>>  			   MIGRATE_PCPTYPES * MIGRATE_PCPTYPES;
> 
> This just seems wrong now and contradicts the comment - you're setting
> minimum pages based on migrate PCP types that operate at pageblock order
> but without reference to the actual number of page block pages?
> 
> So the comment is just wrong now? 'make sure there are at least two
> pageblocks', well this isn't what you're doing is it? So why there are we
> making reference to PCP counts etc.?
> 
> This seems like we're essentially just tuning these numbers someswhat
> arbitrarily to reduce them?
> 
>>
>> -	/* don't ever allow to reserve more than 5% of the lowmem */
>> -	recommended_min = min(recommended_min,
>> -			      (unsigned long) nr_free_buffer_pages() / 20);
>> +	/*
>> +	 * Don't ever allow to reserve more than 5% of the lowmem.
>> +	 * Use a min of 128 pages when all THP orders are set to never.
> 
> Why? Did you just choose this number out of the blue?
> 
> Previously, on x86-64 with thp -> never on everything a pageblock order-9
> wouldn't this be a much higher value?
> 
> I mean just putting '128' here is not acceptable. It needs to be justified
> (even if empirically with data to back it) and defined as a named thing.
> 
> 
>> +	 */
>> +	recommended_min = clamp(recommended_min, 128,
>> +				(unsigned long) nr_free_buffer_pages() / 20);
>> +
>>  	recommended_min <<= (PAGE_SHIFT-10);
>>
>>  	if (recommended_min > min_free_kbytes) {
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index 0c5fb4ffa03a..8e92678d1175 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -136,10 +136,10 @@ struct shmem_options {
>>  };
>>
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -static unsigned long huge_shmem_orders_always __read_mostly;
>> -static unsigned long huge_shmem_orders_madvise __read_mostly;
>> -static unsigned long huge_shmem_orders_inherit __read_mostly;
>> -static unsigned long huge_shmem_orders_within_size __read_mostly;
>> +unsigned long huge_shmem_orders_always __read_mostly;
>> +unsigned long huge_shmem_orders_madvise __read_mostly;
>> +unsigned long huge_shmem_orders_inherit __read_mostly;
>> +unsigned long huge_shmem_orders_within_size __read_mostly;
> 
> Again, we really shouldn't need to do this.
> 
>>  static bool shmem_orders_configured __initdata;
>>  #endif
>>
>> @@ -516,25 +516,6 @@ static bool shmem_confirm_swap(struct address_space *mapping,
>>  	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
>>  }
>>
>> -/*
>> - * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
>> - *
>> - * SHMEM_HUGE_NEVER:
>> - *	disables huge pages for the mount;
>> - * SHMEM_HUGE_ALWAYS:
>> - *	enables huge pages for the mount;
>> - * SHMEM_HUGE_WITHIN_SIZE:
>> - *	only allocate huge pages if the page will be fully within i_size,
>> - *	also respect madvise() hints;
>> - * SHMEM_HUGE_ADVISE:
>> - *	only allocate huge pages if requested with madvise();
>> - */
>> -
>> -#define SHMEM_HUGE_NEVER	0
>> -#define SHMEM_HUGE_ALWAYS	1
>> -#define SHMEM_HUGE_WITHIN_SIZE	2
>> -#define SHMEM_HUGE_ADVISE	3
>> -
> 
> Again we really shouldn't need to do this, just provide some function from
> shmem that gives you what you need.
> 
>>  /*
>>   * Special values.
>>   * Only can be set via /sys/kernel/mm/transparent_hugepage/shmem_enabled:
>> @@ -551,7 +532,7 @@ static bool shmem_confirm_swap(struct address_space *mapping,
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  /* ifdef here to avoid bloating shmem.o when not necessary */
>>
>> -static int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
>> +int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
> 
> Same comment.
> 
>>  static int tmpfs_huge __read_mostly = SHMEM_HUGE_NEVER;
>>
>>  /**
>> --
>> 2.47.1
>>

