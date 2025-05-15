Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07B617BA3
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747279212; cv=none; b=f7DyQkGIKuoDkff7noIz5gPi8rEUmmm3XVDj0TtRrhXq7qdihSGzNTEW9ziff+/KQmrPtPOW/m0Eaa1yGA2S/HFsIrdXJFjlLMDVgSwBWil7W7BsdsrTQ0uVdvmcr19zyHVqD+7A/zoEXJXqy7C14k3/oEtm1dA89lwPXyGUjVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747279212; c=relaxed/simple;
	bh=wmyDntFHg9J1aeNDqXH9NMNtAddxfUhTvQ+e7PrYACI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=fn6lg4LFfkbn8+dz+N3OFzTaa4/5QsAt2Xsq5sSG4ZPFhgQIuizmgd6JGlt43VhgBVQqeisGFI22m60Tgrv2BVMXS1NVL4lP4YNPnmgK3k3ZZnsjvrXOSe1AIwsHTt+MBJ5P9iutUtbDQADVSLEIfgKF2bgJ2stpXKqOHN4+26Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8AxHHJmXSVoIaPoAA--.50643S3;
	Thu, 15 May 2025 11:20:06 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMBxb8deXSVorxzUAA--.14896S3;
	Thu, 15 May 2025 11:20:01 +0800 (CST)
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset
 race
To: Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>
Cc: Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Zi Yan <ziy@nvidia.com>
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
 <aAYXP4f417_bx6Is@harry> <025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn>
 <20250422171116.f3928045a13205dc1b9a46ea@linux-foundation.org>
 <CAJuCfpHbXmjAr2Rt0Mo_i32hpGOyXnVtXUd4qFjXriH9eYFDkQ@mail.gmail.com>
 <20250510200740.b7de2408e40be7ad5392fed9@linux-foundation.org>
 <CAJuCfpFdC6hgFSPy3M2sagkFobWeCuxLdcWiyV5pnzB55dgjZg@mail.gmail.com>
 <20250513121609.a9741e49a0e865f25f966de1@linux-foundation.org>
 <e783c311-2f3c-42ba-b0ba-734a206cf04c@suse.cz>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <75a7258b-224c-c4f2-47a9-fda3775d268c@loongson.cn>
Date: Thu, 15 May 2025 11:19:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e783c311-2f3c-42ba-b0ba-734a206cf04c@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMBxb8deXSVorxzUAA--.14896S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWw17Jw4fZr18Jw15ArWUAwc_yoWrAw15pF
	95uF1j9a1rJFWIk392yFykury0v39rJrW3JFWUJ34xZwnxCr4Iyry7urs8uFyUZrsIkF1j
	qr4YyryxXF1YvagCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8TCJPUUUUU==

Hi,

在 2025/5/14 下午3:34, Vlastimil Babka 写道:
> On 5/13/25 21:16, Andrew Morton wrote:
>> On Tue, 13 May 2025 09:26:53 -0700 Suren Baghdasaryan <surenb@google.com> wrote:
>>
>>>>>> This has been in mm-hotfixes-unstable for six days.  Hopefully we'll
>>>>>> see some review activity soon (please).
>>>>> I reviewed and provided my feedback but saw neither a reply nor a
>>>>> respin with proposed changes.
>>>> OK, thanks.  Do you have time to put together a modified version of this?
>>> I think the code is fine as is. Would be good to add Fixes: tag but it
>>> will require some investigation to find the appropriate patch to
>>> reference here.
>> Below is what is in mm-hotfixes.  It doesn't actually have any
>> acked-by's or reviewed-by's.
>>
>> So... final call for review, please.
>>
>>
>> From: Tianyang Zhang <zhangtianyang@loongson.cn>
>> Subject: mm/page_alloc.c: avoid infinite retries caused by cpuset race
>> Date: Wed, 16 Apr 2025 16:24:05 +0800
>>
>> __alloc_pages_slowpath has no change detection for ac->nodemask in the
>> part of retry path, while cpuset can modify it in parallel.  For some
>> processes that set mempolicy as MPOL_BIND, this results ac->nodemask
>> changes, and then the should_reclaim_retry will judge based on the latest
>> nodemask and jump to retry, while the get_page_from_freelist only
>> traverses the zonelist from ac->preferred_zoneref, which selected by a
>> expired nodemask and may cause infinite retries in some cases
>>
>> cpu 64:
>> __alloc_pages_slowpath {
>>          /* ..... */
>> retry:
>>          /* ac->nodemask = 0x1, ac->preferred->zone->nid = 1 */
>>          if (alloc_flags & ALLOC_KSWAPD)
>>                  wake_all_kswapds(order, gfp_mask, ac);
>>          /* cpu 1:
>>          cpuset_write_resmask
>>              update_nodemask
>>                  update_nodemasks_hier
>>                      update_tasks_nodemask
>>                          mpol_rebind_task
>>                           mpol_rebind_policy
>>                            mpol_rebind_nodemask
>> 		// mempolicy->nodes has been modified,
>> 		// which ac->nodemask point to
>>
>>          */
>>          /* ac->nodemask = 0x3, ac->preferred->zone->nid = 1 */
>>          if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
>>                                   did_some_progress > 0, &no_progress_loops))
>>                  goto retry;
>> }
>>
>> Simultaneously starting multiple cpuset01 from LTP can quickly reproduce
>> this issue on a multi node server when the maximum memory pressure is
>> reached and the swap is enabled
>>
>> Link: https://lkml.kernel.org/r/20250416082405.20988-1-zhangtianyang@loongson.cn
>> Fixes: 902b62810a57 ("mm, page_alloc: fix more premature OOM due to race with cpuset update").
> After the discussion in this thread, Suren retracted this Fixes: suggestion.
> I think it actually goes back to this one which introduced the
> preferred_zoneref caching.
>
> Fixes: c33d6c06f60f ("mm, page_alloc: avoid looking up the first zone in a
> zonelist twice")
Yes, the problem should be introduced by this patch, thank you
>
>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Suren Baghdasaryan <surenb@google.com>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Cc: Brendan Jackman <jackmanb@google.com>
>> Cc: Johannes Weiner <hannes@cmpxchg.org>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> I would have placed the check bit further down, just above the
> should_reclaim_retry() call, but it's not that important to hold up a fix
> and can be done later.
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
>> ---
>>
>>   mm/page_alloc.c |    8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> --- a/mm/page_alloc.c~mm-page_allocc-avoid-infinite-retries-caused-by-cpuset-race
>> +++ a/mm/page_alloc.c
>> @@ -4562,6 +4562,14 @@ restart:
>>   	}
>>   
>>   retry:
>> +	/*
>> +	 * Deal with possible cpuset update races or zonelist updates to avoid
>> +	 * infinite retries.
>> +	 */
>> +	if (check_retry_cpuset(cpuset_mems_cookie, ac) ||
>> +	    check_retry_zonelist(zonelist_iter_cookie))
>> +		goto restart;
>> +
>>   	/* Ensure kswapd doesn't accidentally go to sleep as long as we loop */
>>   	if (alloc_flags & ALLOC_KSWAPD)
>>   		wake_all_kswapds(order, gfp_mask, ac);
>> _
>>

