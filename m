Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB50A1FDA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745221583; cv=none; b=btV6nGnE5S6ZhRLmboLmtjU9hw2+jEoGIAZCqkEfmFeMhL8PUg7FWd1I4PB/73FhGs9Dg2oafLeBpjfSE3o5D/apSLUnOtUTysfNickZRnFvUz8TGhs+CBNBkWByYZs4Sdud8vDTCd70OKAYPyiMCRVNz8oKHmZQIeP1UmaJnuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745221583; c=relaxed/simple;
	bh=HMDvi2OqoWFaAOsG2tPDoXRjPycE9wLKajMdfqq/DXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=urgSHRDbHYLwJTjJG6PSVMUXsFzTxdfvC60DobJOi5waf21e0g8B9Toq5sFkVZ6SG+7qbJnEiJTdyP+nEWTKblPl4EEcUVf/SA0/7Qh/wqTCjvAO0+qTburCgFO3qi63GJwVruzMYK4b6fhk1xRMwKMn8MEfmpOJ9NbvRGdq78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fZpU7HWY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fZpU7HWY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMK2PS004392;
	Mon, 21 Apr 2025 07:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/2VdwI72slCSKnJQaTEkuv8ka/G3kd/+oTh01RpLAU=; b=fZpU7HWY7kuNZoKv
	5H9EhiibhwtGyGiJuP23H8YYASIH2/vBM0MXp4zLLOceMY+AKvDyj+NhOrwxAfqx
	aq4W8IYo1djNzJNxeN+WAdh399eXMXcXSv5+ueCkl6+Z6vyov0rupgzcJzbkiHvc
	JY6hUMC8jwbi6blSibou20/HfpU9nO+qu7FRcPN7MLmz9orihFrIeV1rtqu+UbKq
	zOfEC6NJdDKX2AggwZZRYHvP4Um+CQIG4JIt9vPg8FGgd4VBS1kUiICwFNWZU9PZ
	kI7+EyGsFAuMecnVxZwrEbc2T0/WHYCBUtqWTeWjsGscdnp9p82UrCsAdSd3aiTs
	7cdiGw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bkanb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 07:46:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53L7k09S006425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 07:46:00 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Apr
 2025 00:45:57 -0700
Message-ID: <89b3fbd5-d817-4f43-9721-6a64e5153be6@quicinc.com>
Date: Mon, 21 Apr 2025 15:45:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, slab: clean up slab->obj_exts always
To: Suren Baghdasaryan <surenb@google.com>, Harry Yoo <harry.yoo@oracle.com>
CC: <cl@linux.com>, <rientjes@google.com>, <vbabka@suse.cz>,
        <roman.gushchin@linux.dev>, <pasha.tatashin@soleen.com>,
        <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>
References: <20250418061459.3898802-1-quic_zhenhuah@quicinc.com>
 <aAJtFwAH_ayIJ-SR@harry>
 <CAJuCfpFEoGaczKvL-fpd=tzaHvPa5xU6gMWTzp6=OPxYcxBVsA@mail.gmail.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <CAJuCfpFEoGaczKvL-fpd=tzaHvPa5xU6gMWTzp6=OPxYcxBVsA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=6805f7b9 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=yPCof4ZbAAAA:8 a=COk6AnOGAAAA:8 a=u5Vm5Qlev4DUF23fx0IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 44RLd3tKO7_fLQeP00ttHKhGs_DDtAoV
X-Proofpoint-GUID: 44RLd3tKO7_fLQeP00ttHKhGs_DDtAoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210060

Thanks Suren.

On 2025/4/19 7:09, Suren Baghdasaryan wrote:
> On Fri, Apr 18, 2025 at 8:17 AM Harry Yoo <harry.yoo@oracle.com> wrote:
>>
>> On Fri, Apr 18, 2025 at 02:14:59PM +0800, Zhenhua Huang wrote:
>>> When memory allocation profiling is disabled at runtime or due to an
>>> error, shutdown_mem_profiling() is called: slab->obj_exts which
>>> previously allocated remains.
>>> It won't be cleared by unaccount_slab() because of
>>> mem_alloc_profiling_enabled() not true. It's incorrect, slab->obj_exts
>>> should always be cleaned up in unaccount_slab() to avoid following error:
>>>
>>> [...]BUG: Bad page state in process...
>>> ..
>>> [...]page dumped because: page still charged to cgroup
>>>
>>> Fixes: 21c690a349baa ("mm: introduce slabobj_ext to support slab object extensions")
>>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> 
> Thanks for reporting and fixing the issue!
> 
>>> ---
>>
>> Acked-by: Harry Yoo <harry.yoo@oracle.com>
>>
>> I reproduced the issue locally and confirmed that this patch fixes
>> the issue.
>>
>> Tested-by: Harry Yoo <harry.yoo@oracle.com>
>>
>> By the way, I think this should probably be backported to -stable?
>>
>> --
>> Cheers,
>> Harry / Hyeonggon
>>
>>>   mm/slub.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/slub.c b/mm/slub.c
>>> index dac149df1be1..b42ce3a88806 100644
>>> --- a/mm/slub.c
>>> +++ b/mm/slub.c
>>> @@ -2023,7 +2023,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
>>>        return 0;
>>>   }
>>>
>>> -/* Should be called only if mem_alloc_profiling_enabled() */
>>> +/* Should be called if slab_obj_exts(slab) */
>>>   static noinline void free_slab_obj_exts(struct slab *slab)
>>>   {
>>>        struct slabobj_ext *obj_exts;
>>> @@ -2592,7 +2592,11 @@ static __always_inline void account_slab(struct slab *slab, int order,
>>>   static __always_inline void unaccount_slab(struct slab *slab, int order,
>>>                                           struct kmem_cache *s)
>>>   {
>>> -     if (memcg_kmem_online() || need_slab_obj_ext())
>>> +     /*
>>> +      * The slab object extensions should now be freed regardless of
>>> +      * whether mem_alloc_profiling_enabled() or not now.
> 
> This comment does not explain why. I amended it in my suggestion below.

I will follow your suggestion.

> 
>>> +      */
>>> +     if (memcg_kmem_online() || slab_obj_exts(slab))
>>>                free_slab_obj_exts(slab);
> 
> free_slab_obj_exts() will be checking again that for
> slab_obj_exts(slab) != NULL. Since this change effectively removes the
> static key check (mem_alloc_profiling_enabled() call inside
> need_slab_obj_ext()), I think we can simply make free_slab_obj_exts()
> inline function and remove the above condition completely. IOW:
> 

Got it. I'll send another version that includes these changes.

> static inline void free_slab_obj_exts(struct slab *slab)
> {
>          struct slabobj_ext *obj_exts;
> 
>          obj_exts = slab_obj_exts(slab);
>          if (!obj_exts)
>                  return;
>          ...
>          slab->obj_exts = 0;
> }
> 
> static __always_inline void unaccount_slab(...)
> {
>       /*
>        * The slab object extensions should be freed regardless of
>        * whether mem_alloc_profiling_enabled() or not because profiling
>        * might have been disabled after slab->obj_exts got allocated.
>        */
>        free_slab_obj_exts(slab);
>        ...
> }
> 
>>>
>>>        mod_node_page_state(slab_pgdat(slab), cache_vmstat_idx(s),
>>> --
>>> 2.25.1
>>>
>>>

