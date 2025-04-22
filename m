Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9E527CB1F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323853; cv=none; b=ujbTaPnQt7mcTUzpAep59VPkocwFQfyUKRINnojDagiNGsm/xGz2gRR7ddTPrXn56YaaR9vdU9F2gTCSwzl/CNgVirxP/eOpM2A6pPOO1ZWM0/FFUnvhiuqNmja1YiAk7ca5RbhYfI0BegK0wELq9oO3V8Pfs7rwcAOkoo3PJ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323853; c=relaxed/simple;
	bh=HBXxxcMj6yimVD2C3On0JjGwyRFmqNjW2E9yu56nhPw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=C5UH2xWdUu9fPP55oLO1lVR0i3DetqugDTLkM054c/CyTyIaPHQ7KwK43IB8sNGgWhIM82d9mzgUgTQJoe5u7NnDzuYm5xhkCrlyztG0EGBHcXdie2gGF6zazigpC3PsTumHtkxHE/ojuh1zfM2vHkNVYgZDfuX2gLUI4lX8uP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8AxjmtHhwdongTEAA--.62012S3;
	Tue, 22 Apr 2025 20:10:47 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMBx3MRDhwdoA_GPAA--.28378S3;
	Tue, 22 Apr 2025 20:10:45 +0800 (CST)
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset
 race
To: Harry Yoo <harry.yoo@oracle.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Zi Yan <ziy@nvidia.com>
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
 <aAYXP4f417_bx6Is@harry>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn>
Date: Tue, 22 Apr 2025 20:10:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aAYXP4f417_bx6Is@harry>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMBx3MRDhwdoA_GPAA--.28378S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZryrCw1fWw4DAr45Cr13ZFc_yoW8ur1Upa
	yxJF13Kws3JF18Grs2v3409ryUZw4DJrW3Jr1UJryUA3s3G3yIkr47WrZ09FWDCrnxJw15
	tF4Yy348WF4FvagCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
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

Hi.

ÔÚ 2025/4/21 ÏÂÎç6:00, Harry Yoo Ð´µÀ:
> On Wed, Apr 16, 2025 at 04:24:05PM +0800, Tianyang Zhang wrote:
>> __alloc_pages_slowpath has no change detection for ac->nodemask
>> in the part of retry path, while cpuset can modify it in parallel.
>> For some processes that set mempolicy as MPOL_BIND, this results
>> ac->nodemask changes, and then the should_reclaim_retry will
>> judge based on the latest nodemask and jump to retry, while the
>> get_page_from_freelist only traverses the zonelist from
>> ac->preferred_zoneref, which selected by a expired nodemask
>> and may cause infinite retries in some cases
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
>> Simultaneously starting multiple cpuset01 from LTP can quickly
>> reproduce this issue on a multi node server when the maximum
>> memory pressure is reached and the swap is enabled
>>
>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>> ---
> What commit does it fix and should it be backported to -stable?
>
> There's a new 'MEMORY MANAGEMENT - PAGE ALLOCATOR' entry (only in
> Andrew's mm.git repository now).
>
> Let's Cc the page allocator folks here!

We first identified this issue in 6.6.52-stable , and through root cause 
analysis,

it appears the problem may have existed for a significant period.

However It is recommended that the fix should be backported to at least 
Linux kernel versions after 6.6-stable

