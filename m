Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2029281524
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420242; cv=none; b=mSS1el7BU3E0u4uOAAeiCP9hHH/EhZnqTjA5hJ31S4spD/EJFaiMJll3FFMgP9+2cZNs8R5FHxlQJlLIwo2vud8+UATaYiGsvN/qkTkOf4NxP393ZWZxaFkAySwKY/s2oVytjr6QGCH41j8eMntblBk5s06uz7tanGKK54Xe9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420242; c=relaxed/simple;
	bh=48oi0bMYSWCsrjjCcocriFjUmnSTwf74bn6dRV0xbTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9z+SFBFAfG7/JuGRoonuKNgugXmbluVt0cre3K8QHLOlIrO9FVCOKatPV6joYAC+4GH7qeh06NEQ3oY1uHQ62IKgy/27+JeGHgkAEY4yeikFRQAv2SzjbExrc2Hu/6ICRfLadPljER48C6Fl/pZ4SadKqNye8k5V8Nqf1ZznqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvTunfoH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvTunfoH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAmZm2016562
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NRWiVsbvNnHIcTKizG+XsT0FlriKnOrULiycN0aiQQ=; b=nvTunfoHTEC8X1zn
	QR3LnOD5QTP/KHCQnZIJv82ptdIsFjV36ZOl9IqTjeni4mcK0UCSfuaHotPOtdnQ
	LRFlVnVToEzL/RCq+yzS+kr2blw2jFwvXFhdz1hQQ/9qt9Dc8OfwsgqoVeFmd8P0
	gdLz0Oo7Hce459E4OKdZUpawGnoL2D7NN+k6qIvtAUU7P1Zk2tvJTYcj5JxUl8FF
	s6nOSZToJuSFP7JaE6GVZcAVym+2VVsadr+VQe2maYe42hf6PQ18LWVglfEwW+4z
	vV5t2kd+cJL4Fylk9oegXYXAfP5TBW0weF6VZQeubaNApbLei7NRMQv+xJ0veAhj
	Ll0R6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ah1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:57:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53d5f85c9so137140685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420238; x=1746025038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NRWiVsbvNnHIcTKizG+XsT0FlriKnOrULiycN0aiQQ=;
        b=q7lsA9Lc3fwiJAtzQ2M//glsZwoi4mf3/sROHVFI+Ck8P0DXADpS9yTQUyRqSNDs5M
         UNb5UvUjO65nHB9KtfpzknJi1feoJtREF67KyQ1rMlZ+MAtC9FydktNhjqUaIGLN7xpx
         AMcKb8Xi87diIX6BEOrzM+6KQYJ2xXdjDBv/y1iWejx4CvsvXNcGthgB6vrDCWZF2aqE
         YKh0Eb59BkKO39p0y2ak3wOx8d3Zxoy+kVQE7xyFfBVFnVxHiiyzNNlaBAL5Slmal1V+
         immXFfDTbGmZwvHHMSrQp/xSwbQJ1qIPjT/mTGCsPG3ijmJxa6IlDd+t+GCq35KDDF2n
         DcTA==
X-Forwarded-Encrypted: i=1; AJvYcCWUX+yHk7Gr3T9ugExZKS3m4fwLFqFV2nFeN8d2E94CqOhS/SJrF0NOWx639WOG9zKlJt/6n7f9xZCCAZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvNIzZ6bd4ILdug7wK2BRiABovt/c3cFrjdY1ZNX9qQWucvuYn
	oS7G/8UD/2aONpuBaqGHNVGiiImb7Z9I/wrbNhSoOK9/6PdDEjCu3L/vwfZdJrOgSafylWWlnIc
	IJtnYSvpdunNHYUwIGUl8sNAKFXpRf2jnOz0TjIcMoSAvkXqiyj6duuqjNMXJYV8=
X-Gm-Gg: ASbGncvr6+r0ih79utU97XrQN3DoQaR3KDpHJDaB61E7llUYUWuN947sZwjEIxLVHUI
	j/OTbHGL5zEkCE9FpTET/3f46edOaCA3pu3AG6hjF5Bs4Lf7dm7LWvO7A7db65YYk0bi+SL2eX1
	4Bajq37SAHYeCdJIcp0aUmezVrGlx/Z+AseqCM6+CzW5xGVJUehlmvcH8OaDRsuO0edyqkdhDiN
	L6UI69LIXCqqUPiYyu6LDhdHWFvjuKofkzMM9BWL9BW0DX1N3xvTefyyLtC76rjiVZ7C2TeAmkA
	ZO1chlClOko568eB4LIos91LiKoRbI29VovBlQz47pU2UBoPKQAkAsqw0MdwjT3Z4Ww=
X-Received: by 2002:a05:620a:1a83:b0:7c0:c024:d5 with SMTP id af79cd13be357-7c94d298995mr245300185a.8.1745420238252;
        Wed, 23 Apr 2025 07:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7NASz5S114ThP0dvyExe5F00+leMGaZwFVeXLrWh9p/BkVwDIsMC0C1e5A37iHj6HGPixnA==
X-Received: by 2002:a05:620a:1a83:b0:7c0:c024:d5 with SMTP id af79cd13be357-7c94d298995mr245297785a.8.1745420237855;
        Wed, 23 Apr 2025 07:57:17 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f62594985bsm7594334a12.74.2025.04.23.07.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:57:17 -0700 (PDT)
Message-ID: <4b1f9228-2600-4d97-a60e-9099878b3f2a@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:57:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        dri-devel
 <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
 <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6TFm8YwlOOZ4j9T9gpzlzavZNNyTfyAP
X-Proofpoint-ORIG-GUID: 6TFm8YwlOOZ4j9T9gpzlzavZNNyTfyAP
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6808ffcf cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=INHOtyMNgn4pQtdJY3IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwNSBTYWx0ZWRfX2IYZbOw+14EF zIuOG53hCto/VsDB+cuRcr77PS/SMyYQAC60E41ybmkHuvi4m8Re6HrdAPZdEQeFONmqYmgLvLF jgQ50zMSywmS1cTpKOua2XIng5HtXbOO0reAw/RBNfciHLdVnJw17aUjSeVS62FwuO5wrnOGL92
 7qfW/Gl5BlnJaqp6YweWBChPJhkhQqb0fM6FPt3HCNYBGVWUj9mqE9sCZrkqT/lr5Uod+zW4jFZ iWPwvbVdeHbnzX+OJQ+3mQvaOnhQOlgHq5q/wM0qePmk/pVL1JfMQ4iKw3HvCxK/K73lLEtjiSq Yhw24fd4tMeIVASbvgza9SWgIk1bKaWI7M5FWDZ4Ex02kXmyF6esL3CvouvoiBI0TnovRSbtIUB
 f5zwpZlb7z6fYIhekj3c1wZw1WUZZNnQl3Sr68D0cW3WWUfN859CNDxHEawmNYPPbkEdCUPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230105

On 4/23/25 4:55 PM, Rob Clark wrote:
> On Tue, Apr 22, 2025 at 4:57 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/21/25 10:13 PM, Rob Clark wrote:
>>> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>>>
>>>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>>>> default (the one used prior to this change) on error.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>>>  #include <linux/pm_domain.h>
>>>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>>>
>>>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>>>
>>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>>>
>>>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>  {
>>>>>>>>> +     int hbb;
>>>>>>>>> +
>>>>>>>>>       gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>>>       gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>>>       gpu->ubwc_config.min_acc_len = 0;
>>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>           adreno_is_a690(gpu) ||
>>>>>>>>>           adreno_is_a730(gpu) ||
>>>>>>>>>           adreno_is_a740_family(gpu)) {
>>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>>>               gpu->ubwc_config.amsbc = 1;
>>>>>>>>>               gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>>>               gpu->ubwc_config.min_acc_len = 1;
>>>>>>>>>       }
>>>>>>>>> +
>>>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>>>> +     if (hbb < 0)
>>>>>>>>> +             return;
>>>>>>>>> +
>>>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>>>
>>>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>>>
>>>>>>> To be clear about this, from the moment we introduced host image
>>>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>>>> here.
>>>>>>
>>>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>>>> is unused in production.
>>>>>
>>>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>>>> clear up any confusion about Mesa.
>>>>>
>>>>> Although, IIRC kgsl did set different values for a650 depending on
>>>>> memory type... do you know what source that used?
>>>>
>>>> KGSL relies on an undocumented devicetree node populated by bootloader
>>>> to detect ddrtype and calculates the HBB value based on that.
>>>
>>> Would it be reasonable to use the smem value, but if we find the
>>> undocumented dt property, WARN_ON() if it's value disagrees with smem?
>>>
>>> That would at least give some confidence, or justified un-confidence
>>> about the smem values
>>
>> The aforementioned value is populated based on the data that this
>> driver reads out, and only on the same range of platforms that this
>> driver happens to cater to
> 
> Did I understand that correctly to mean that the dt property is based
> on the same smem value that you are using?

Yes, abl reads it out and modifies the FDT based on what's in there

Konrad

>  In that case, there should
> be no argument against using the smem value as the source of truth.
> 
> BR,
> -R
