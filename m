Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B50426B09F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213627; cv=none; b=U5INxHN+A79kNksg55mO/OWPK/B31W00GmNq5KnsHKCF1bIVIC7gKlGkLhIpqhWNNT//VKCWpRa4/wVybs/YHUMJYX5uvymFRS1LCPCaJSwCRjTfAsDHmY/rN2KoKtLtZDlYKrplSpte/226CmhcSqa2kRR2qxB98e2AMWOKGt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213627; c=relaxed/simple;
	bh=oG7tmQ/ls/+HhXNBi0mONoy2wFrs+TaCAhJQB10Zq1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUktLDOBBhDVDHjUrK9s85sYhZaEKSO3DpDNAZIw9DHyd13E8cEuir448c+8B/H4zuFgWvNSGMjGyvWSGIZgwvYzZWF3SH6W7nQxBxsxOUi/GB4yUK0U2q40VVl4SkJmfIBhnE9+Rr6wLitnfZtwHWuunCSc7qoV5zlbZRmpdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGXx7aN8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGXx7aN8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398NdiH014999
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 15:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGj9y69QHKe3+tDT9FnF5QoDdKX7mW0cM2oMhuEhV7U=; b=IGXx7aN8BJcqZ0c/
	ExZcZRCzzLT0FlxaEWfaTB812bIDqg6FoU3dlGv4o63I3ZPeiDF0SsW5SMIrD0Fz
	xJDCNR3aEGiz3D0WsBGoymBOWWi84M6Ez/5OGMYp2/rtCmcpFHW7+0NxBAdv1sXm
	moqUrRDx4i+tDF8HDEVaprvxHd790LuxywfQmUb3uxJrNJ0kNUAUDRn6WjPjUclL
	h0Qc6KNJ12IKfMSKvAA2H/f81mBMyPrKBoRxrFL9Ad8o1US3L9dW7fG85X1j8/o4
	L4Dodd+efAT7iozwI1n5+3qrbkrRKeQ6EB3QMHgPKC9coJnCXpy08+5pPTBkza40
	u8YCNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbukwgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:47:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ad42d6bcso190666085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213624; x=1744818424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGj9y69QHKe3+tDT9FnF5QoDdKX7mW0cM2oMhuEhV7U=;
        b=OAeMgLmFcz8U19i4zykQ/RNJWbJckY8XS+X6lVSXElr42xBCQwb4mvAwC4GamepQMU
         cLM7UvtWxJobIthDG+4SAGpys6MyK3y0SFPkMABQ0+JzedRMrYfzyT8GJZw3hzSKYuVe
         KWPXAROsxmIC75z7/9xI+/Go7zL5+XcUAaruUA5yqyBsTI2zdkwP8vINF1cdHv/sOklD
         VRJDZiw/AGfKv37TiiRq8hjtI8usj8Oia2lAJNvOJYjCgCBOcvmBJH6h6TGa/ree67P5
         JPV4zLrzwt17b1JSaip5h8mgzuY/l4dXAvsjn0p1ptboCMFEtysE7zoTPcbFJ780CIza
         kXxw==
X-Forwarded-Encrypted: i=1; AJvYcCWms9Ulp9+BvjJT1N3SrLZfUl0KnA8kLHMF+UAFSYWl+7CQWgAkkNsFXUhA9QO9FR0ZPsTPeSBVtDzretM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5GARFlE7cKjIJe8acJph1uvn8kmjziIIupG4ZeSzZa9SCt+tT
	TsYdnzNkNYWrChcuEPFxSgm5FZSjw/uDY94vCit2oeVIZT2wm1WX+lvaxmmBTFuQVjoF6ojbHWs
	PD3LvqKgeNAv0P0QeyzE0ec94ecgkKqv6sYoCVImIXOOGkbbYdc78efGpm/AXqIo=
X-Gm-Gg: ASbGncuW9BQSM1U8eYst1MW1Q3eVlfwx5/xPO3AdcENAyK70Ykg/3XSZFJjyVtZuDHm
	PhNDmvwghJg/NXFWxezjtsbphB6dGbooo4qA5bpIK2ACnMvo2JQX1rTn3mRGFKZGQb8Io5cAJBr
	nS+dzcmmjowTqTv99l3jw/Zr7wMX7An8VgEKsNdrE5xbhOQPgvZ9rlvoWPldIOEjnp+f2YFr7YG
	otvQoTUaar7Qq4IQgH4Bt5wYZ0b8fWfKzUSuVNb3iFV41PB27XBG/KERJnM9jVBJ+RaOhFBWnKj
	Ns+N16k9kE6hUai+hHVDUrOZ2MjzFf5VPxw9HbAapqZ0ydXgYOjZQKsz9RIUpyIYLg==
X-Received: by 2002:a05:620a:319d:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7c79ddc0062mr131355085a.4.1744213623563;
        Wed, 09 Apr 2025 08:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9BR2XdeykvWdhqJj8WMwZYRklWgdHjFIJLEq2GXaWcLHLQ/K0yinWTGwViErAHu3nY6Avsw==
X-Received: by 2002:a05:620a:319d:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7c79ddc0062mr131352985a.4.1744213623083;
        Wed, 09 Apr 2025 08:47:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9c0dsm116187766b.61.2025.04.09.08.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:47:02 -0700 (PDT)
Message-ID: <0fda3b72-8bff-4f3d-b9e2-cfe1ac1d3082@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:46:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
 <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
 <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
 <CACu1E7F71M0Z5KUdArRYbLEMXoS3jQEtp=0-4LEYFRysOsYZfA@mail.gmail.com>
 <9a12e042-487b-4937-a583-709f0c37ab12@oss.qualcomm.com>
 <CACu1E7Hto_Ms3RxQjXXYB+RB+FC5n1VFtohKbe4EzKWgEk9uiQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7Hto_Ms3RxQjXXYB+RB+FC5n1VFtohKbe4EzKWgEk9uiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ggc5XkvCKh1bLslYizrhIsat9tiXKyjQ
X-Proofpoint-ORIG-GUID: Ggc5XkvCKh1bLslYizrhIsat9tiXKyjQ
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f69679 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=o9cw19nxWuB9g-ePJCEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090100

On 4/9/25 5:44 PM, Connor Abbott wrote:
> On Wed, Apr 9, 2025 at 11:40 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/9/25 5:30 PM, Connor Abbott wrote:
>>> On Wed, Apr 9, 2025 at 11:22 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 4/9/25 5:12 PM, Connor Abbott wrote:
>>>>> On Wed, Apr 9, 2025 at 10:48 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>>>
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>
>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>> default (the one used prior to this change) on error.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
>>>>>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209d0265ad9223e8b55c7 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> @@ -13,6 +13,7 @@
>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>  #include <linux/pm_domain.h>
>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>
>>>>>>  #define GPU_PAS_ID 13
>>>>>>
>>>>>> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>>>>>  {
>>>>>>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>>> +       u32 hbb = qcom_smem_dram_get_hbb();
>>>>>> +       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>>>>>> +       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>>>>>> +       u32 hbb_hi, hbb_lo;
>>>>>> +
>>>>>>         /*
>>>>>>          * We subtract 13 from the highest bank bit (13 is the minimum value
>>>>>>          * allowed by hw) and write the lowest two bits of the remaining value
>>>>>>          * as hbb_lo and the one above it as hbb_hi to the hardware.
>>>>>>          */
>>>>>> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>>>>>> -       u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
>>>>>> -       u32 hbb_hi = hbb >> 2;
>>>>>> -       u32 hbb_lo = hbb & 3;
>>>>>> -       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>>>>>> -       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>>>>>> +       if (hbb < 0)
>>>>>> +               hbb = adreno_gpu->ubwc_config.highest_bank_bit;
>>>>>
>>>>> No. The value we expose to userspace must match what we program.
>>>>> You'll break VK_EXT_host_image_copy otherwise.
>>>>
>>>> I didn't know that was exposed to userspace.
>>>>
>>>> The value must be altered either way - ultimately, the hardware must
>>>> receive the correct information. ubwc_config doesn't seem to be const,
>>>> so I can edit it there if you like it better.
>>>>
>>>> Konrad
>>>
>>> Yes, you should be calling qcom_smem_dram_get_hbb() in
>>> a6xx_calc_ubwc_config(). You can already see there's a TODO there to
>>> plug it in.
>>
>> Does this look good instead?
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 0cc397378c99..ae8dbc250e6a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -588,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>
>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  {
>> +       u8 hbb;
> 
> You can't make it u8 and then test for a negative value on error.

Fair. I think it was u8 in a pre-release version of the patchset and it
stuck in my mind.. though I'dve expected clang to warn me here..

> Other than that, looks good.

Thanks, I'll change it in v2.

Konrad
