Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B526210FB;
	Mon,  9 Jun 2025 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749478292; cv=none; b=I3Xl9Q8dN04L1nFVptqI1g4uTy+t8LocKQl8E02udeUWEWokfJeiuef+yzTGv++hsggWyje6uKbP9tOAlNTAmXaFiYgJuH9y0x+GVmfTCiKH94vJeoSAygWLrdKkU5rGussWAGEYqnnYJ2NjeaLu+C/y9jnpGlKSLBjMNtbZbxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749478292; c=relaxed/simple;
	bh=hkZ3oWDM2z+n3ObO3qlZWo2kAt+rd9hr2QuU7hepOtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=miRIfS4u8KtE1sb+Y7UD+Zv85p44hpRZak5OV4PCwV7A/mCEc1Qcw6obIKDzojr03BENsoq8CpLsmte61RSX5ho5oYIspuS9XcxAqpmNmlLoImAY/on/zhvvyBc51i1LRFX22NOQ4mqweeL0udGb5rvfS1/6fTmIvbvyXcIxgRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5irnpIj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5irnpIj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1026697f8f.1;
        Mon, 09 Jun 2025 07:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749478288; x=1750083088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqh3lxLD1G5TsyFks4Etlv2Tl+EoVaAQIQ7gKoDHURQ=;
        b=Y5irnpIj9FvKgY6q8cStyKm0uPvoJ10fFUAzlqCH+qoxxALOS0qWQT/VSZuJV1yRUh
         bsYFxKm35qzAoHmkIT4icO4eu0k1kCW29j3R2iv45h8cG2IQ/zH4OIZnMu6hWIKsw4EJ
         fqDqLV9G63pJQhGyraskW5Lvv4t+cZF3milCnORYJh6ITWJlX2FP9GCW2Q3PYcvqgNFl
         1M9p1JUUkDSEuFmyIIauwfhxngXEetF3EevrfioVRuZWPxa1SUVZKkmMmZFKc4+9mOSo
         4aF8H0Qjbv5TUZtlQTw4njN+odzsna7r+QUGfjeTDoOGh8RWGW3l8JJUc+7uSrqy2gb9
         DjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749478288; x=1750083088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pqh3lxLD1G5TsyFks4Etlv2Tl+EoVaAQIQ7gKoDHURQ=;
        b=gWNIxFDtF7iTWsHjWPt1Ml+HuAOkbiopGcz+UUkGVfu3AycnZxah72WLzSAQn3Hrrz
         moRxx27Ek84Qa3McKqKVO95Pa6P9DZ197NtT7g2tAmw1USG5o8y1kcaO0jH2EuqO9VOF
         wsmeSURRlTyvgBm1XfPtqmUD7c37cZfEOPgDw2IgJlJLnQQXpy4EbLsOwD19w+3RO8hn
         OEJeJGl+QCMqtjdf3DqdYw1axnnzjv2vRFbZ6+PFBJG3ZLThYLFoRR+c7wRbcQvq1HK2
         30oHH130ZxwJPIHGi04hwKcfi48d3ojjAoz7BYM+UWSZDzssdQjK2XrUXj6tvfTlyne+
         iUPA==
X-Forwarded-Encrypted: i=1; AJvYcCUNBUwWXiZZaU/dD9TgmdPOxVMTiB8O23lbwOT56WrPeYulhSeeAt0Zkg+D55ZfdsmL5Loo7Pr/V4lrkaoD@vger.kernel.org, AJvYcCVlBh1Ee+du2LJDSVnO4ewXg1+Qni8V3dtw+8206TdzvgaJzuRMtlxj5FN3nc26HYxJp4FmjfVKDnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX8W04ZrH8OaPC/hVmpU0FUbQtj7D0EZ0g0feICem2oCSDkwi4
	HxZHuoRiHsnnjy7jm71Tb5Iqmwzx8OtbFvGH9+9BSe3kN6kN7f8QKQGm75kA8w==
X-Gm-Gg: ASbGnctYKf9qT9sWq31wskXXkte2GZTiduGqOpIH4zg6P1LctmkRJSTH+28yVNcld2z
	qykgaO9CqznG7vtm92Fs1XrbhA6wvcHwKTmNYjZDI6mpO1LvVxwXXNTsy7tcIPbLjyKmrIQ7G7G
	PMVDPVNG3zuRy2nn2hfrObqg+FNxe1C0v0iRMgxlzs1ujvGVcogu2AebN6YweQbg4glpB5rKG54
	wctyOrK/w5EQ7NrAlBPkowS76LYk6qxmcjqi8YvIKLb6o17AkcUDOS9h0etygh0NWPbe0Puy22T
	lSrhuAdBfZKWa0rRciSeXRkUfAYGmIqJt4Fi5DTkytFKeJOcu+sIhmSzDBkg/eBJ6V354DA/pEt
	QZCITg0CSApVQAaNKU3YLLeLBqMAFNeKcebkIDoBeo/i9KdE=
X-Google-Smtp-Source: AGHT+IG/tZn1MX2LCYyK8fzHb137FZNS0uL6i7Rke5cNQNTYJ1nN+Try44K5lIUnI4d8IJGw5yuSUQ==
X-Received: by 2002:a5d:62c8:0:b0:3a5:3b40:6e8f with SMTP id ffacd0b85a97d-3a53b406f9fmr5622569f8f.1.1749478288173;
        Mon, 09 Jun 2025 07:11:28 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de53sm9602495f8f.8.2025.06.09.07.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 07:11:27 -0700 (PDT)
Message-ID: <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
Date: Mon, 9 Jun 2025 15:11:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
To: Zi Yan <ziy@nvidia.com>, lorenzo.stoakes@oracle.com, david@redhat.com
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Juan Yescas <jyescas@google.com>,
 Breno Leitao <leitao@debian.org>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/06/2025 14:19, Zi Yan wrote:
> On 9 Jun 2025, at 7:13, Usama Arif wrote:
> 
>> On 06/06/2025 17:10, Zi Yan wrote:
>>> On 6 Jun 2025, at 11:38, Usama Arif wrote:
>>>
>>>> On 06/06/2025 16:18, Zi Yan wrote:
>>>>> On 6 Jun 2025, at 10:37, Usama Arif wrote:
>>>>>
>>>>>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
>>>>>> watermarks are evaluated to extremely high values, for e.g. a server with
>>>>>> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
>>>>>> of the sizes set to never, the min, low and high watermarks evaluate to
>>>>>> 11.2G, 14G and 16.8G respectively.
>>>>>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
>>>>>> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
>>>>>> and 1G respectively.
>>>>>> This is because set_recommended_min_free_kbytes is designed for PMD
>>>>>> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
>>>>>> Such high watermark values can cause performance and latency issues in
>>>>>> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
>>>>>> most of them would never actually use a 512M PMD THP.
>>>>>>
>>>>>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
>>>>>> folio order enabled in set_recommended_min_free_kbytes.
>>>>>> With this patch, when only 2M THP hugepage size is set to madvise for the
>>>>>> same machine with 64K page size, with the rest of the sizes set to never,
>>>>>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
>>>>>> respectively. When 512M THP hugepage size is set to madvise for the same
>>>>>> machine with 64K page size, the min, low and high watermarks evaluate to
>>>>>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
>>>>>
>>>>> Getting pageblock_order involved here might be confusing. I think you just
>>>>> want to adjust min, low and high watermarks to reasonable values.
>>>>> Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_pages_per_zone
>>>>> and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, the changes
>>>>> look reasonable to me.
>>>>
>>>> Hi Zi,
>>>>
>>>> Thanks for the review!
>>>>
>>>> I forgot to change it in another place, sorry about that! So can't move
>>>> MIGRATE_PCPTYPES * MIGRATE_PCPTYPES into the combined function.
>>>> Have added the additional place where min_thp_pageblock_nr_pages() is called
>>>> as a fixlet here:
>>>> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/
>>>>
>>>> I think atleast in this context the orginal name pageblock_nr_pages isn't
>>>> correct as its min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER).
>>>> The new name min_thp_pageblock_nr_pages is also not really good, so happy
>>>> to change it to something appropriate.
>>>
>>> Got it. pageblock is the defragmentation granularity. If user only wants
>>> 2MB mTHP, maybe pageblock order should be adjusted. Otherwise,
>>> kernel will defragment at 512MB granularity, which might not be efficient.
>>> Maybe make pageblock_order a boot time parameter?
>>>
>>> In addition, we are mixing two things together:
>>> 1. min, low, and high watermarks: they affect when memory reclaim and compaction
>>>    will be triggered;
>>> 2. pageblock order: it is the granularity of defragmentation for creating
>>>    mTHP/THP.
>>>
>>> In your use case, you want to lower watermarks, right? Considering what you
>>> said below, I wonder if we want a way of enforcing vm.min_free_kbytes,
>>> like a new sysctl knob, vm.force_min_free_kbytes (yeah the suggestion
>>> is lame, sorry).
>>>
>>> I think for 2, we might want to decouple pageblock order from defragmentation
>>> granularity.
>>>
>>
>> This is a good point. I only did it for the watermarks in the RFC, but there
>> is no reason that the defrag granularity is done in 512M chunks and is probably
>> very inefficient to do so?
>>
>> Instead of replacing the pageblock_nr_pages for just set_recommended_min_free_kbytes,
>> maybe we just need to change the definition of pageblock_order in [1] to take into
>> account the highest large folio order enabled instead of HPAGE_PMD_ORDER?
> 
> Ideally, yes. But pageblock migratetypes are stored in a fixed size array
> determined by pageblock_order at boot time (see usemap_size() in mm/mm_init.c).
> Changing pageblock_order at runtime means we will need to resize pageblock
> migratetypes array, which is a little unrealistic. In a system with GBs or TBs
> memory, reducing pageblock_order by 1 means doubling pageblock migratetypes
> array and replicating one pageblock migratetypes to two; increasing pageblock
> order by 1 means halving the array and splitting a pageblock into two.
> The former, if memory is enough, might be easy, but the latter is a little
> involved, since for a pageblock with both movable and unmovable pages,
> you will need to check all pages to decide the migratetypes of the after-split
> pageblocks to make sure pageblock migratetype matches the pages inside that
> pageblock.
> 

Thanks for explaining this so well and the code pointer!

Yeah it doesnt seem reasonable to change the size of pageblock_flags at runtime.
> 
>>
>> [1] https://elixir.bootlin.com/linux/v6.15.1/source/include/linux/pageblock-flags.h#L50
>>
>> I really want to avoid coming up with a solution that requires changing a Kconfig or needs
>> kernel commandline to change. It would mean a reboot whenever a different workload
>> runs on a server that works optimally with a different THP size, and that would make
>> workload orchestration a nightmare.
>>
> 
> As I said above, changing pageblock order at runtime might not be easy. But
> changing defragmentation granularity should be fine, since it just changes
> the range of memory compaction. That is the reason of my proposal,
> decoupling pageblock order from defragmentation granularity. We probably
> need to do some experiments to see the impact of the decoupling, as I
> imagine defragmenting a range smaller than pageblock order is fine, but
> defragmenting a range larger than pageblock order might cause issues
> if there is any unmovable pageblock within that range. Since it is very likely
> unmovable pages reside in an unmovable pageblock and lead to a defragmentation
> failure.
> 
>

I saw you mentioned of a proposal to decouple pageblock order from defrag granularity
in one of the other replies as well, just wanted to check if there was anything you had
sent in lore in terms of proposal or RFC that I could look at.

So I guess the question is what should be the next step? The following has been discussed:

- Changing pageblock_order at runtime: This seems unreasonable after Zi's explanation above
  and might have unintended consequences if done at runtime, so a no go?
- Decouple only watermark calculation and defrag granularity from pageblock order (also from Zi).
  The decoupling can be done separately. Watermark calculation can be decoupled using the
  approach taken in this RFC. Although max order used by pagecache needs to be addressed.


> --
> Best Regards,
> Yan, Zi

