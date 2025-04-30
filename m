Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B2254AE1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016525; cv=none; b=MlbaPKkwCVis6G4CRWr5pl40qufoHCGafD+P47b35tKOpHOymFD6UDPANXE6tFzyT5YCQwQaFRybHLJW+1cr9ivotGFkLzDCGmoHJxoh5HS/YUbZJntUzeawsT37+3CH2M810rTeOoxve8CPer9WudtPxv9fB3oHlEWp2KsutS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016525; c=relaxed/simple;
	bh=jEcC9UGE/YqMYrqwTIiNtzaSZ07n6/H/NMhDizZasxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UM4hd1JOWXURIV7upIjgJ/QTs/HEOkC2+XJ3+Jyjt9QTxBlDU1xI8gucBW1F26KwrV2HmZeZ+qH+qdFbeYhKDf9fXo9xRnHgtgmUc1W2jeIh/ah671hEuLgVlZ/sho7kyzymNrDX2H/CUoveWrKQpTJRCMEGopQ+VcMLCjKXKHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCOo2aW/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCOo2aW/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U97pN6001242
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cnlo59KsvGmoAJK5ykVOnV/qLVIIalGNC4+OxntEXxE=; b=kCOo2aW/dNR4HZBi
	hTvCsRcyGXI6Sr5fc1x0GWYvFjc6V9Lq1WrSbyvVXEAapiPIGUqnXXq/Eneyuds/
	eMmWZvRyBYy7LH6j760UO+GOoWz7Ab76FhnNgd9hfZiKGT/EmUqy2/A+B1GxZkbD
	oLmAVhlvc1COl6Sd7pBlGZI89TgZ1fpax5qbsPgvdi5viqcmMLugbxWBgQSBiYRA
	uBfAg2trRUMJ1ISyL0mbv0s71nUP8F0BtGgvTISxIBaTqIE/BrhnQa/hAnXVBjg7
	BImfF0zodWtqi82nB3kQbmOe+b97rBBh5RtJKXPxdUG71gIDeY9mqGq0SFfdu87b
	QevxqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9t4ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:35:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4768b27fef3so12150321cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016521; x=1746621321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnlo59KsvGmoAJK5ykVOnV/qLVIIalGNC4+OxntEXxE=;
        b=nBTvLRrQ5FnbbgViLMjLWVIagFACWvmRWBo9l0riAEZ8BN2sogC2ygk9yBxvticT4e
         TN2Kinq//wzPXY7kvkGWaRf9Vjo+f/vs+LBsqxm+8x/sayCslGft0dWC54EyuU6YtDoQ
         X8DQT0dKfY50LvHsnK+FxuQJcG2BHwXHO5wbm3uKEMyzGyFSaDdx2nDbhP+FrxMDPOnM
         6I3C2OhTZBO0WXTN5Qh9tWLZ5yi6CMdzFL1ESMfqxIn5jX8oPFn8RFYt1mf8w5bDzxDu
         MTJ/gTtU7Ce/wwdmd1nHroP4M2aeAZmlKBzGhbtRPj60JKUEHVlUWScCfkK45vgiRiP+
         BNiw==
X-Forwarded-Encrypted: i=1; AJvYcCVMF+jpcCEn4DuZfva13+A+19x1aibHFqurcF8t26B0h29ZI/MfuN78HHmIVjXbJYg2ElifQOE37K3QEDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQKk6mCC2JLj6Mrrzg2dunwMi5uVw+SL2i0vPpiMt7BXYEx3An
	AkEJxX2YBFghlXyKmjP8mo1eluctwwSs4LmSg+FBo5NY2vkuL5vkOHMfw0W9N0JNiamXQimvkCh
	dPxzJr1jU2wBPtcSH3MBbIqwZLWsp8umTZ08wrWecBVPF0dKoMFTttDtKxQJiWT0=
X-Gm-Gg: ASbGncsHlhn2UdmgMPK0pWuNHknK3xqfN/moqsqNJgHb3WkH+2Cyz3g33ofZHhK1umU
	nKEujgM+9L5mAiYkUoAJaIJRsuNogFdBuRQSIYV9YR01HdO2Zo/3q+1+UGJyEC4sLTvmodY6JBt
	MUUlL0Zhcef/jKWaP00MLdQ98j+B117Ta17Xv8mLrADIgFBSF9V50gsClJ9pnUceW2DwfnqXrFs
	GFxHeGePpgZUfYlOWNzoDTzhBPcQqLTX3AV0xh5pwt5Pr8PSlY7ZflyYpSZ9TzEgr506OJgVI0G
	yThQfx018N3lh120DJ+GDIgMJheZBxQBdx3bAvzSUu17ZQ3YX4hqN9BJBUWJomAF4NI=
X-Received: by 2002:a05:620a:2722:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cac85a0299mr123371185a.8.1746016521549;
        Wed, 30 Apr 2025 05:35:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5YnBbAS+ImgEHeNjfO53rm94FOWqBYpnXyEX6Ie1ldv17RmYfaWc5AhrZsf2uYwjVaJF4eg==
X-Received: by 2002:a05:620a:2722:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cac85a0299mr123368385a.8.1746016521141;
        Wed, 30 Apr 2025 05:35:21 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edae042sm913931766b.169.2025.04.30.05.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 05:35:20 -0700 (PDT)
Message-ID: <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 14:35:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: byuwnzwq6z49IOi_IBaJst0wHcJI2KEo
X-Proofpoint-ORIG-GUID: byuwnzwq6z49IOi_IBaJst0wHcJI2KEo
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=6812190a cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=_6aSloehX7qqCDj74gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4OSBTYWx0ZWRfX4UTlul8bfp6W gGw5Ia1k2oIJVEoN/8CLw0kdITuaEjMNTqs/sSoqJmwPD21qMFNDg2oRzh3nx0kiqSTWwknbisr tX2tXyg69/e73eXjfhu0nQT0jL8CzZBBwm2XUvA93y83c5SMy8fsrYzM1IrKzyZP4oCVtTgWS+p
 UfzxqObah6E8l/Nap+4+UBqGg1h0z3pV0gFQ5RwH7eji83WcH+5LUqcIEagN8bHf7JD0XBRfvg1 kvsIs1CCkgNki8NqOwJ3glPHDhin3plWYHcxhbv82UzA3Nzo+nrnXoRpNylwPB92QKdyJaDtYZF FkG0iuUQHJBFt1smdw2wtsyntHCyOgpQX/kFa4/37mM846yT/lmtWUX1ZlNFDX01zgI26JOxduH
 FOvdaXSCe9sH8xQU5jJa8XtLypgpBsGHX57oUxqzGNxcviRI/Nps14c+lZiV83fPvDE3AVs+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300089

On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 30/04/2025 13:34, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>
>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>> should be speedbin 1", but what the values are for said "everything" are
>> not known, so that's an exercise left to the user..
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -11,6 +11,9 @@
>>   #include "a6xx.xml.h"
>>   #include "a6xx_gmu.xml.h"
>>   +#include <linux/soc/qcom/smem.h>
>> +#include <linux/soc/qcom/socinfo.h>
>> +
>>   static const struct adreno_reglist a612_hwcg[] = {
>>       {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>       {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>           },
>>           .address_space_size = SZ_16G,
>>           .preempt_record_size = 4192 * SZ_1K,
>> +        .speedbins = ADRENO_SPEEDBINS(
>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
> 
> I'm trying to understand this sentence. because reading patch 4, when there's no match
> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?

What I'm saying is that all other entries that happen to be possibly
added down the line are expected to be speedbin 1 (i.e. BIT(1))

> Before this change the fallback was speedbin = BIT(0), but this disappeared.

No, the default was to allow speedbin mask ~(0U)

Konrad
