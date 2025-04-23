Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3CA2E403
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745375967; cv=none; b=fAXJ0UE/XF1/Gkc6ttLcWkjc21n8uR38/hBepudIXufr77aXLmjD2pKNDHVJmFqcPOGmRnzEk5XhcGV3IrS1OeQogpbcrwQr392HhMFhscMuOg6dVBy3sLRCTEjngp8FQEeMmbPVrxUhVcemp/j1InAnnVbztB0dllZsahQ0Cqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745375967; c=relaxed/simple;
	bh=oZ5h4WyczZWCYYA3oNdRhEcrvOD7RuIN+lRc5BFhf3Q=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pDIuMHqm37lZkFwgUZg0ieae+PghAHyviIvwLmmHMF4Kspjb2T1avsZ7Oc6BOAZ4m7QthDYmtdml2t4m0DOh+WC+Z5ECatn/LU4Vx4OEDXM2u1XX0w2uJJctBZDSqCOpRJQkPKQfpMjx/IMt3xLF5KGqfDr/AFkz31AF5mVvK8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8DxvnPXUghoMWbEAA--.30603S3;
	Wed, 23 Apr 2025 10:39:19 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMAxj8XHUghoTPyQAA--.35520S3;
	Wed, 23 Apr 2025 10:39:05 +0800 (CST)
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset
 race
To: Suren Baghdasaryan <surenb@google.com>, Harry Yoo <harry.yoo@oracle.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
 <aAYXP4f417_bx6Is@harry>
 <CAJuCfpGEm04Eebt7FK=keu3ZF_34GTTmxMWVCiA1q3RQAVwAOA@mail.gmail.com>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <f7f831bc-8887-4974-a869-f5f473d3040c@loongson.cn>
Date: Wed, 23 Apr 2025 10:38:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAJuCfpGEm04Eebt7FK=keu3ZF_34GTTmxMWVCiA1q3RQAVwAOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMAxj8XHUghoTPyQAA--.35520S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAF4DZFWkZry5XF1fuw1rAFc_yoWrAF13pF
	WxuF1jkws5AF1UCws7tw1kuFy0v3srtFW3JFyUGryxZwnIkryxKr1jkrWa9Fy8Zrs8AF1j
	qr4YyayxZFZ8AagCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jr9NsUUUUU=

Hi, Suren

在 2025/4/22 上午4:28, Suren Baghdasaryan 写道:
> On Mon, Apr 21, 2025 at 3:00 AM Harry Yoo <harry.yoo@oracle.com> wrote:
>> On Wed, Apr 16, 2025 at 04:24:05PM +0800, Tianyang Zhang wrote:
>>> __alloc_pages_slowpath has no change detection for ac->nodemask
>>> in the part of retry path, while cpuset can modify it in parallel.
>>> For some processes that set mempolicy as MPOL_BIND, this results
>>> ac->nodemask changes, and then the should_reclaim_retry will
>>> judge based on the latest nodemask and jump to retry, while the
>>> get_page_from_freelist only traverses the zonelist from
>>> ac->preferred_zoneref, which selected by a expired nodemask
>>> and may cause infinite retries in some cases
>>>
>>> cpu 64:
>>> __alloc_pages_slowpath {
>>>          /* ..... */
>>> retry:
>>>          /* ac->nodemask = 0x1, ac->preferred->zone->nid = 1 */
>>>          if (alloc_flags & ALLOC_KSWAPD)
>>>                  wake_all_kswapds(order, gfp_mask, ac);
>>>          /* cpu 1:
>>>          cpuset_write_resmask
>>>              update_nodemask
>>>                  update_nodemasks_hier
>>>                      update_tasks_nodemask
>>>                          mpol_rebind_task
>>>                           mpol_rebind_policy
>>>                            mpol_rebind_nodemask
>>>                // mempolicy->nodes has been modified,
>>>                // which ac->nodemask point to
>>>
>>>          */
>>>          /* ac->nodemask = 0x3, ac->preferred->zone->nid = 1 */
>>>          if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
>>>                                   did_some_progress > 0, &no_progress_loops))
>>>                  goto retry;
>>> }
>>>
>>> Simultaneously starting multiple cpuset01 from LTP can quickly
>>> reproduce this issue on a multi node server when the maximum
>>> memory pressure is reached and the swap is enabled
>>>
>>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>>> ---
>> What commit does it fix and should it be backported to -stable?
> I think it fixes 902b62810a57 ("mm, page_alloc: fix more premature OOM
> due to race with cpuset update").

I think this issue is unlikely to have been introduced by Patch 
902b62810a57 ,

as the infinite-reties section from

https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4568
to
https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4628

where the cpuset race condition occurs remains unmodified in the logic 
of Patch 902b62810a57.

>> There's a new 'MEMORY MANAGEMENT - PAGE ALLOCATOR' entry (only in
>> Andrew's mm.git repository now).
>>
>> Let's Cc the page allocator folks here!
>>
>> --
>> Cheers,
>> Harry / Hyeonggon
>>
>>>   mm/page_alloc.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>> index fd6b865cb1ab..1e82f5214a42 100644
>>> --- a/mm/page_alloc.c
>>> +++ b/mm/page_alloc.c
>>> @@ -4530,6 +4530,14 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
>>>        }
>>>
>>>   retry:
>>> +     /*
>>> +      * Deal with possible cpuset update races or zonelist updates to avoid
>>> +      * infinite retries.
>>> +      */
>>> +     if (check_retry_cpuset(cpuset_mems_cookie, ac) ||
>>> +         check_retry_zonelist(zonelist_iter_cookie))
>>> +             goto restart;
>>> +
> We have this check later in this block:
> https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652,
> so IIUC you effectively are moving it to be called before
> should_reclaim_retry(). If so, I think you should remove the old one
> (the one I linked earlier) as it seems to be unnecessary duplication
> at this point.
In my understanding, the code in

https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652

was introduced to prevent unnecessary OOM (Out-of-Memory) conditions 
in__alloc_pages_may_oom.

If old code is removed, the newly added code (on retry loop entry) 
cannot guarantee that the cpuset

remains valid when the flow reaches in__alloc_pages_may_oom, especially 
if scheduling occurs during this section.

Therefore, I think retaining the original code logic is necessary to 
ensure correctness under concurrency.

>
>
>>>        /* Ensure kswapd doesn't accidentally go to sleep as long as we loop */
>>>        if (alloc_flags & ALLOC_KSWAPD)
>>>                wake_all_kswapds(order, gfp_mask, ac);
>>> --
>>> 2.20.1
>>>
>>>
Thanks

