Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C380D19AD90
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 04:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746852209; cv=none; b=o0FHpkRIod+zE87R3Qfkh/7E9dFgEGu3HkH3cbwsXaCs3mlrOJdiaORgOfdY8g4KuIMnPL3ramc1HNS+d9hcz8IbUXCCeEvxdtb+USdrV0ezspUUjUCjUW5iA4gAVeZJq7HvTakXuLlZ9Kq0s3lejQMbUEDYe4OIxUkB6+0vrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746852209; c=relaxed/simple;
	bh=/5JPn8nkuaHhvBTbLLNhMRbfLHVvXtgnWLb7683hvpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iuJCcWqHW9k0xQmQFgH2spZ1N5vIV2nj/fvSK1Tk4PpCo+VtpEHEZL/L8SvRjqobAK53DtcZvCIqJICjP95gCJ0Ja61bedR3k9dZKJhrM8yV+xYesDH3Y5C1C1R5csnb1fY+l9g6A09cZOTQBH3ULZ3nFscO3mK4taBtkDVtdD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qDhuPHIS; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qDhuPHIS"
Message-ID: <093ee42f-4dd5-4f52-b7a5-ba5e22b18bdc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746852202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwCCg12m3qDujlSkl2Q/Jkzw0xDwNqi9grEtKdNHxG4=;
	b=qDhuPHISiuVFaRNbhf1jtwhqt7tU2W8dmqsQ14U0+FHCOLfmFGKjDb3SUnMIPp821KVPlb
	rb4EJtR46DDQRRXoez0Y4BnNfoIms1UqQL/iCqelOpT1WAQKOIGRKfYhQok6te/3I0BVvS
	cSsCIn/+V36xt8RNCOyxRqLND4qujZA=
Date: Sat, 10 May 2025 06:43:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH for-next v2 1/2] RDMA/rxe: Implement synchronous prefetch
 for ODP MRs
To: Daisuke Matsuda <dskmtsd@gmail.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, leon@kernel.org, jgg@ziepe.ca,
 zyjzyj2000@gmail.com
References: <20250503134224.4867-1-dskmtsd@gmail.com>
 <20250503134224.4867-2-dskmtsd@gmail.com>
 <cdea578b-5570-4a8d-98cc-61081a281a84@linux.dev>
 <b5560914-e613-499d-88c8-82f5255a1dd1@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <b5560914-e613-499d-88c8-82f5255a1dd1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/5/10 4:46, Daisuke Matsuda 写道:
> On 2025/05/10 0:19, Zhu Yanjun wrote:
>> On 03.05.25 15:42, Daisuke Matsuda wrote:
>>> Minimal implementation of ibv_advise_mr(3) requires synchronous 
>>> calls being
>>> successful with the IBV_ADVISE_MR_FLAG_FLUSH flag. Asynchronous 
>>> requests,
>>> which are best-effort, will be added subsequently.
>>>
>>> Signed-off-by: Daisuke Matsuda <dskmtsd@gmail.com>
>>> ---
>>>   drivers/infiniband/sw/rxe/rxe.c     |  7 +++
>>>   drivers/infiniband/sw/rxe/rxe_loc.h | 10 ++++
>>>   drivers/infiniband/sw/rxe/rxe_odp.c | 86 
>>> +++++++++++++++++++++++++++++
>>>   3 files changed, 103 insertions(+)
>>>
>>> diff --git a/drivers/infiniband/sw/rxe/rxe.c 
>>> b/drivers/infiniband/sw/rxe/rxe.c
>>> index 3a77d6db1720..e891199cbdef 100644
>>> --- a/drivers/infiniband/sw/rxe/rxe.c
>>> +++ b/drivers/infiniband/sw/rxe/rxe.c
>>> @@ -34,6 +34,10 @@ void rxe_dealloc(struct ib_device *ib_dev)
>>>       mutex_destroy(&rxe->usdev_lock);
>>>   }
>>> +static const struct ib_device_ops rxe_ib_dev_odp_ops = {
>>> +    .advise_mr = rxe_ib_advise_mr,
>>> +};
>>> +
>>>   /* initialize rxe device parameters */
>>>   static void rxe_init_device_param(struct rxe_dev *rxe, struct 
>>> net_device *ndev)
>>>   {
>>> @@ -103,6 +107,9 @@ static void rxe_init_device_param(struct rxe_dev 
>>> *rxe, struct net_device *ndev)
>>>           rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
>>> IB_ODP_SUPPORT_SRQ_RECV;
>>>           rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
>>> IB_ODP_SUPPORT_FLUSH;
>>>           rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
>>> IB_ODP_SUPPORT_ATOMIC_WRITE;
>>> +
>>> +        /* set handler for ODP prefetching API - ibv_advise_mr(3) */
>>> +        ib_set_device_ops(&rxe->ib_dev, &rxe_ib_dev_odp_ops);
>>>       }
>>>   }
>>> diff --git a/drivers/infiniband/sw/rxe/rxe_loc.h 
>>> b/drivers/infiniband/sw/rxe/rxe_loc.h
>>> index f7dbb9cddd12..21b070f3dbb8 100644
>>> --- a/drivers/infiniband/sw/rxe/rxe_loc.h
>>> +++ b/drivers/infiniband/sw/rxe/rxe_loc.h
>>> @@ -197,6 +197,9 @@ enum resp_states rxe_odp_atomic_op(struct rxe_mr 
>>> *mr, u64 iova, int opcode,
>>>   int rxe_odp_flush_pmem_iova(struct rxe_mr *mr, u64 iova,
>>>                   unsigned int length);
>>>   enum resp_states rxe_odp_do_atomic_write(struct rxe_mr *mr, u64 
>>> iova, u64 value);
>>> +int rxe_ib_advise_mr(struct ib_pd *pd, enum 
>>> ib_uverbs_advise_mr_advice advice,
>>> +             u32 flags, struct ib_sge *sg_list, u32 num_sge,
>>> +             struct uverbs_attr_bundle *attrs);
>>>   #else /* CONFIG_INFINIBAND_ON_DEMAND_PAGING */
>>>   static inline int
>>>   rxe_odp_mr_init_user(struct rxe_dev *rxe, u64 start, u64 length, 
>>> u64 iova,
>>> @@ -225,6 +228,13 @@ static inline enum resp_states 
>>> rxe_odp_do_atomic_write(struct rxe_mr *mr,
>>>   {
>>>       return RESPST_ERR_UNSUPPORTED_OPCODE;
>>>   }
>>> +static inline int rxe_ib_advise_mr(struct ib_pd *pd, enum 
>>> ib_uverbs_advise_mr_advice advice,
>>> +                   u32 flags, struct ib_sge *sg_list, u32 num_sge,
>>> +                   struct uverbs_attr_bundle *attrs)
>>> +{
>>> +    return -EOPNOTSUPP;
>>> +}
>>> +
>>>   #endif /* CONFIG_INFINIBAND_ON_DEMAND_PAGING */
>>>   #endif /* RXE_LOC_H */
>>> diff --git a/drivers/infiniband/sw/rxe/rxe_odp.c 
>>> b/drivers/infiniband/sw/rxe/rxe_odp.c
>>> index 6149d9ffe7f7..e5c60b061d7e 100644
>>> --- a/drivers/infiniband/sw/rxe/rxe_odp.c
>>> +++ b/drivers/infiniband/sw/rxe/rxe_odp.c
>>> @@ -424,3 +424,89 @@ enum resp_states rxe_odp_do_atomic_write(struct 
>>> rxe_mr *mr, u64 iova, u64 value)
>>>       return RESPST_NONE;
>>>   }
>>> +
>>> +static int rxe_ib_prefetch_sg_list(struct ib_pd *ibpd,
>>> +                   enum ib_uverbs_advise_mr_advice advice,
>>> +                   u32 pf_flags, struct ib_sge *sg_list,
>>> +                   u32 num_sge)
>>> +{
>>> +    struct rxe_pd *pd = container_of(ibpd, struct rxe_pd, ibpd);
>>> +    unsigned int i;
>>> +    int ret = 0;
>>> +
>>> +    for (i = 0; i < num_sge; ++i) {
>>> +        struct rxe_mr *mr;
>>> +        struct ib_umem_odp *umem_odp;
>>> +
>>> +        mr = lookup_mr(pd, IB_ACCESS_LOCAL_WRITE,
>>> +                   sg_list[i].lkey, RXE_LOOKUP_LOCAL);
>>> +
>>> +        if (IS_ERR(mr)) {
>>> +            rxe_dbg_pd(pd, "mr with lkey %x not found\n", 
>>> sg_list[i].lkey);
>>> +            return PTR_ERR(mr);
>>> +        }
>>> +
>>> +        if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
>>> +            !mr->umem->writable) {
>>> +            rxe_dbg_mr(mr, "missing write permission\n");
>>> +            rxe_put(mr);
>>> +            return -EPERM;
>>> +        }
>>> +
>>> +        ret = rxe_odp_do_pagefault_and_lock(mr, sg_list[i].addr,
>>> +                            sg_list[i].length, pf_flags);
>>> +        if (ret < 0) {
>>> +            if (sg_list[i].length == 0)
>>> +                continue;
>>> +
>>> +            rxe_dbg_mr(mr, "failed to prefetch the mr\n");
>>> +            rxe_put(mr);
>>> +            return ret;
>>> +        }
>>> +
>>> +        umem_odp = to_ib_umem_odp(mr->umem);
>>> +        mutex_unlock(&umem_odp->umem_mutex);
>>> +
>>> +        rxe_put(mr);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int rxe_ib_advise_mr_prefetch(struct ib_pd *ibpd,
>>> +                     enum ib_uverbs_advise_mr_advice advice,
>>> +                     u32 flags, struct ib_sge *sg_list, u32 num_sge)
>>> +{
>>> +    u32 pf_flags = RXE_PAGEFAULT_DEFAULT;
>>> +
>>> +    if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH)
>>> +        pf_flags |= RXE_PAGEFAULT_RDONLY;
>>> +
>>> +    if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_NO_FAULT)
>>> +        pf_flags |= RXE_PAGEFAULT_SNAPSHOT;
>>> +
>>> +    /* Synchronous call */
>>> +    if (flags & IB_UVERBS_ADVISE_MR_FLAG_FLUSH)
>>> +        return rxe_ib_prefetch_sg_list(ibpd, advice, pf_flags, 
>>> sg_list,
>>> +                           num_sge);
>>> +
>>> +    /* Asynchronous call is "best-effort" */
>>
>> Asynchronous call is not implemented now, why does this comment appear?
>
> Even without the 2nd patch, async calls are reported as successful.


Async call is not implemented. How to call "async calls are reported as 
successful"?


Zhu Yanjun

> The comment is inserted to show the reason, which is based on the
> description from 'man 3 ibv_advise_mr' as follows:
> ===
> An application may pre-fetch any address range within an ODP MR when 
> using the IBV_ADVISE_MR_ADVICE_PREFETCH or 
> IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE advice. Semantically, this 
> operation is best-effort. That means the kernel does not guarantee 
> that underlying pages are updated in the HCA or the pre-fetched pages 
> would remain resident.
> ===
>
> Thanks,
> Daisuke
>
>>
>> Zhu Yanjun
>>
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +int rxe_ib_advise_mr(struct ib_pd *ibpd,
>>> +             enum ib_uverbs_advise_mr_advice advice,
>>> +             u32 flags,
>>> +             struct ib_sge *sg_list,
>>> +             u32 num_sge,
>>> +             struct uverbs_attr_bundle *attrs)
>>> +{
>>> +    if (advice != IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH &&
>>> +        advice != IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
>>> +        advice != IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_NO_FAULT)
>>> +        return -EOPNOTSUPP;
>>> +
>>> +    return rxe_ib_advise_mr_prefetch(ibpd, advice, flags,
>>> +                     sg_list, num_sge);
>>> +}
>>
>
-- 
Best Regards,
Yanjun.Zhu

