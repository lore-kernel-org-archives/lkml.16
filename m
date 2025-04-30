Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD7825CC48
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018588; cv=none; b=OCkJnGQca3vd1cB1uNGP7/AdwSkOW0SQKGHUaoRn+I2RiG/Z7OO3m9WlaZUPsA4R/8qVaD7UvNTGMnfg6xYH2gSeEJyJtU5bk5RZlWBDTHMejojJYZ6LLgMJiZLEmtKamerfntaRP5eKfrI8a7BFO5s7w8/gpkYebaI4hXW2EfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018588; c=relaxed/simple;
	bh=nV185XwheoKL1ckDAuc6YrAB/FExadH5PepDm4c2j8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njTb26WFHvgme4mtqkgKLmXBbSIJ8lsZqjqI/Vr2q/A9RIOWSwEgo4N5Rdqxyf0FNr9G+RUm9xrXDGUiU37/A4QbqjM1Y2WbRZYuOhDQAZMaJVfcnZKk3HiIkVvGjNQmvZrmLRtxHMm8SGpQE1y0wGW2PCcozvffD3uuYTYCv1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdPTRbew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdPTRbew"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9Phbh032504
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRMOzQ1+a8EQloSooTZ1VPQWAuenrRDcnTPBGwn0XDk=; b=TdPTRbewAN+TNHGe
	NxnkUu8cl0q+5/I3KAw4TNDDFaIwyp6ja6iYQjo/dcbF7M2ZgapbqAw/H5dyN3iI
	VQex1vfjt+ogLMbv9q7yyFrTPbRhIOvSiDB5kQP1kE4mWkIIp/geLeT7Ifbc7VG0
	wLIgT07RMsu9I/+9m/bO76jk3zYPrSC3ONZd9EmtdmiKvogGZpDMvG+UORF+sxQw
	XnZM+IoXtcz+vduJPvPN5ckLfWNxX1k78wy28emvabbeMxJ7mNxmJrjrGRaaLiwV
	0l4xRDGklngle0GNSdXfGPJie1Q5hIImVQN7cry34YwqVA8D5SJysTQ3QFH/Ro/V
	iE0zhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2a8kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:09:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5841ae28eso106021685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018585; x=1746623385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRMOzQ1+a8EQloSooTZ1VPQWAuenrRDcnTPBGwn0XDk=;
        b=gFo9LXFUhNb5mKsJiN9DMWrrBr7AKumQiT9UAhEMlx/WwYPKmNwMZfT7j8q6Qhzm1+
         No5deAUP1ZJu8sgBC7yxQNrv6ZM1bu3uNyhd3PwlhRMckJdZKdzv26T81P3cEEqeqX5I
         Y3KpuGKa4hr/I9wZ1mFlQaXpvl0JyKY8XDfgqcmJRAln03KTd5omoJPiLeCzjS1Eu5Yy
         +M+7V0+QyLX9pZN7axlx2uTVewHcGIaAIOYlPGInSdQZf/kGLLoXMwA/gKJd4mBxTbC9
         SjyyscKOOVp/iGLCd+7olDjJJwo7NbdgGHFSh6Bj1Ku/qbQkewvLqn4J7AT4DO6I1Oqh
         s1HA==
X-Forwarded-Encrypted: i=1; AJvYcCUgQ9DvajpW8RvrcjZeT0TGHZs+3jL7CPv8fchE/Y7K3CXqyt5jVgz+rO7337MHjk2NyvDd1dcs1ls0k2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO1h9sZtZXOVJanx7d6pUwW6+fQ9cJjAfygsDz916+EeEHt88Q
	nMmt6s8JbcH6TUWrv9FXXm1ek9edOdkz1LJcMBueeDpQO8acZLs7pbO/JZlRzlR2kOi8FQYTFLP
	xpNaII7YMmtJEkctxmawKkXDZNXszjCbXY0hrSKVXvIfoa2SwananGdHnGRpKl+Y=
X-Gm-Gg: ASbGncvgdQk40slP/G8AjDnO3kwDOezrIJSw3kmrNWMQwSMJbwQpbPtzUEbyew6CWD3
	J9wotKu+bKoB29mIWAI4Iz5W70KQMJQ9QEj4HVCaQGaQPPRAY2YA4qQsOIRjWSStP8ZL2i5C8hn
	oiloY2N02S8k4eDALR2w9l2GJ3It8J8mfH3/G1XDbLwfgo7TBXZDk4fN2WSzvX+kwcfViXJTE7n
	CgyVG3Mkf4JvhDGJqjF8vIYfhGYtNQH62zX0y1v67RZX4JyOdEp6CtKnwoQUO/5YIYcHc1AVrh3
	4pTEfV1eaGQ1GfEpoDCiuK1pSGUMrElr6Y7qXCZODYnq6K1rt+f9skvqLWHtoF8lZcA=
X-Received: by 2002:a05:620a:4494:b0:7c0:af16:b4a8 with SMTP id af79cd13be357-7cacc172af5mr26595085a.3.1746018584844;
        Wed, 30 Apr 2025 06:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO097WTrfuIxU7CNWA83CThbCdCAbQ6J4gL7u3jo8Kby/5gjdIscRtpOeE3Q1bQkyisdevfw==
X-Received: by 2002:a05:620a:4494:b0:7c0:af16:b4a8 with SMTP id af79cd13be357-7cacc172af5mr26591185a.3.1746018584214;
        Wed, 30 Apr 2025 06:09:44 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4cd79dsm920573466b.38.2025.04.30.06.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 06:09:43 -0700 (PDT)
Message-ID: <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 15:09:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 62g4wT1HOSwIcpojaDFA5u3MknO-ErE5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5NCBTYWx0ZWRfX3zhAFuI5UfH7 aXsx6Ie41vW6QJl/Kog/wZ2X5/GjRNnXwiCTcZmWS6hLN13UIosdp8fAKctxtAYJVN9mvjpxG0F Z4K4xeqridnt+Ez07TkjJUAklbeUycPOaNvB+SCTtUQrZ6NnP/UDBej/a9u8Wl8bkIF/usQgQK6
 PgBkLvYWHPFziBJtxwnUN2XU8W/j7rYixZ9X+p4daPr13IJcf5scG0Ik4GeLHDb5cD1mz7nA37X hIsxr+h88eTFwcNR4yxERkKmrXZmungzFRORpXk0ffN1sRuYaB7uyw7mKOQyc2M2EufL05e404L 6cQt1lMoS9tec6MAi4jx3uYaTYsig4I3RrjUeVMn47JvtcfVtTQIAheEcesJAHXXNtQQq+rv2CB
 i5uzVTT7OlfirbLzUP2OX3EVqEuafS+YgvxZYyUQmVQoPuhu17jFpsAwtCMWEikjbEmxWSa7
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=68122119 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=aak9J4RPMLM6hOP-xocA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 62g4wT1HOSwIcpojaDFA5u3MknO-ErE5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300094

On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 14:35, Konrad Dybcio wrote:
>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>
>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>
>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>> should be speedbin 1", but what the values are for said "everything" are
>>>> not known, so that's an exercise left to the user..
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -11,6 +11,9 @@
>>>>    #include "a6xx.xml.h"
>>>>    #include "a6xx_gmu.xml.h"
>>>>    +#include <linux/soc/qcom/smem.h>
>>>> +#include <linux/soc/qcom/socinfo.h>
>>>> +
>>>>    static const struct adreno_reglist a612_hwcg[] = {
>>>>        {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>        {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>            },
>>>>            .address_space_size = SZ_16G,
>>>>            .preempt_record_size = 4192 * SZ_1K,
>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>
>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>
>> What I'm saying is that all other entries that happen to be possibly
>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>
>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>
>> No, the default was to allow speedbin mask ~(0U)
> 
> Hmm no:
> 
>     supp_hw = fuse_to_supp_hw(info, speedbin);
> 
>     if (supp_hw == UINT_MAX) {
>         DRM_DEV_ERROR(dev,
>             "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>             speedbin);
>         supp_hw = BIT(0); /* Default */
>     }
> 
>     ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>     if (ret)
>         return ret;

Right, that's my own code even..

in any case, the kernel can't know about the speed bins that aren't
defined and here we only define bin0, which doesn't break things

the kernel isn't aware about hw with bin1 with or without this change
so it effectively doesn't matter

Konrad
