Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC40227FD7A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420846; cv=none; b=Hfd31xXEe2WfTKhiEpqBpYWOfXGD4haZYUi7c6W9TSLpt/XML0k1A7gPkP00O0c+4dWKT0qpWRt8r64FB0GiI8D9Y4hbvUa6GDPgcKsePLKBd9c4AUzf2M++X85Qnn6T3NHMXidi8xdBcePpngyJLz3AE3BxNHjo0qN0MuQPQYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420846; c=relaxed/simple;
	bh=0qLq6C9nC74yKJhixSLN/mgZGQ06Kzm0RtJXMfbpLkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MxJtFxEcbsFT7R/GDRKY/ssaJKBPAHBGR/Umbce6cpEvs9Qq2CNUrMznA1ML6RTugbGQGZGKdVq4l0p1cItxyO9Rb4VyXRBQiHRk5S6PQZAWm9irmxk4A8kqdtlh8MmXCGpTht2SU9WQKrfvglc3e31O7DIhM/1nrTU83ZvKyz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lN51bZXz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lN51bZXz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBGHTp024379
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooYfMd07xIcz3T1xZDga/jOa+Ql6uCCOowC2QW8VZ5A=; b=lN51bZXzgfPS4Es7
	zf3kF7mctoa7zY9zgsPfAZIBspN/Usg1a5wZP3g04Vd0VTVhJbsxVHcTMt30WDbI
	KqTOBn61xtF6rxTTGSKRt9WupjJSe1Q/iyf+8SVODafFCt44wJh1uvvd4x+ADsTA
	SMqPROFlesC+2FBoiFZu1aRRAGioiGMHh4+bjNf6ZsEqn1tPIsEu7ow+e/CLnV7Z
	WSh0309u4AO7OhAJXWDsmF/O0c4GOM7rKuxCPMhY3YZD3mrGo/G0HCWeNZreo+OE
	g3VqFQOS3mvAdu8Do3EqIAqIZAWwPhWvcrmTnSfzoNsVkwrc1BTAeUdq0iQXBKJn
	TkOGlg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ah65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:07:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5466ca3e9so73341185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420843; x=1746025643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooYfMd07xIcz3T1xZDga/jOa+Ql6uCCOowC2QW8VZ5A=;
        b=SI0kIhOK5k1SBsVlRLTTBqt7NXM9wFdi2HkrqYuspZ3id92QEJUEUV7/XJ8nsAoGgm
         ZxV8hgqW7px7OmzFsEKJo/HCRkr31XYSBCtPKMck9AYG9/Be7RFwLRtozmfGuKSKgCUU
         /IEQGlC2rG28hJ23BRCYeWmJf7VId0AhkTONYtTriWHSlHvOSyOhJMuis2xbQpoJ/o8p
         Rv22kVuk+zoZXUv4BJT/zVoQ9shOTS0Q3AOk+7lJ/IlLWV0iDWnMpFydTjQOG4kkRdkG
         qfanYuvAwEB9b2BGUxwS3sc8HmSPDzzL+ZTuhVmo5u19AgelSyNfWhe1a3yryMsqB3Fp
         rx9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2xGFlECAEz2ncwfLuScUpCo/MDs+PqfVQYZUhy4FuFW8NivErAi6dOSfkppADNPIlWgRJDtzPw/SBurk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHVDJNCw6xxbeQi8o39cCMHZP0EqC1kWbWeCmsgOcr2b99Whs7
	3cDkLRybH7MyPFs1hi4d4Etk3TlsyEu6j0anlrihJjHWNpr+xEmyhddhqBV/rElQg5OMkW3By8u
	EetMCz/m9d4DKqv71OBGNTJ4R0dvhS44RuQzzCSJO0wlPcUwzumWL+UAtuWQD1QM=
X-Gm-Gg: ASbGncvvORpW76A7RWdgzsODhA/DX/NR5o43yfmF4sg6blJpINlrfDgxy4MjLyh7/+1
	V58DarEYES4AoW8ZfnK4nx5m/TWVRX78XFHlBS+WYeZm3DtoYS38hBzHAtkH7eSkv5auiiMQVr3
	sPUXbakozLsL8f9xW7vkfA64foxcy9YkFrW8JhA2P0A+2t7/WuEGg8TCih4Q+zbGh8KtclLo/SZ
	NwH3jiA5KjUW08mXIy1Z0oZxSHha+nv/KHsNF3ij3LI80LRCa423HTH7Y/iJjfc1zt3O2kcb9UA
	3JW3d7pCY8IOuHRZRBSe8Qywc+/xFzIy1UPfa8ynfI1YaH/NITgmeB2xOTvENjwOPis=
X-Received: by 2002:a05:620a:4001:b0:7c3:dd6d:54e4 with SMTP id af79cd13be357-7c94d312c29mr193729885a.10.1745420842512;
        Wed, 23 Apr 2025 08:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3y2fbQMoGaZH1uZ10kEG8hUKVPrF8IAie/9F8Wav9gJS/3cG/yHeOsM4uimNso9CUToqxzw==
X-Received: by 2002:a05:620a:4001:b0:7c3:dd6d:54e4 with SMTP id af79cd13be357-7c94d312c29mr193727885a.10.1745420841997;
        Wed, 23 Apr 2025 08:07:21 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625578345sm7656981a12.28.2025.04.23.08.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 08:07:21 -0700 (PDT)
Message-ID: <bd9fe032-9844-4b1b-9e25-645b9c6a773d@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 17:07:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
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
 <d67b8fe7-ab92-4756-b549-827210240593@quicinc.com>
 <CAF6AEGut3VQpj=v1euA+re55cLYot+BpjWVBs7orHURQ=Xdhdg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGut3VQpj=v1euA+re55cLYot+BpjWVBs7orHURQ=Xdhdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mHPZbCgY0iDCmoa2Q9G0aoVOWQkhjE-O
X-Proofpoint-GUID: mHPZbCgY0iDCmoa2Q9G0aoVOWQkhjE-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwNiBTYWx0ZWRfX5IhmZ1EpW2MB +At8qP6bIvwUfEjwN7OtjJMQ6Knds8yZ+Of/s9+MSpmV8avYDhBHdId/g3PUHelKE8UNYyBQ2Xx GTIBpZwChZtJ2mLO0TBn6I3SPrHv701txtGoTuIUomZJtSYHCp8Jli/go8Cidch87zIcXamo5Yv
 NlcH5icocHl1YhY4FGieji/HtFYjT6p5tgmAxH7aywmw2UztsmHXPo3Z1/f+YGvTuYEU/oo3HkO f6CngmJGK3/3VVx243pXcXQ8Ya6nnLPuV2zEnMQ+WtYoYID+xlQVEs2TtLasZWjFviqZVLueL4w BcmMzd53HLtelZFrdpkxh3s4aN4ghD4OHkGuS+KdDN3szrnlKV/iz/Mkb8m/Q0ObUGfedhsnii6
 ym+Vew6pMF8JuLdB03JZGZA4azaV9gTVDmVDW46CH5CB7NMg38j4CyPXLfwiODsP1ls6jFFz
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6809022c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=U4o27yoWPFISaBf6hsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_09,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230106

On 4/23/25 4:56 PM, Rob Clark wrote:
> On Tue, Apr 22, 2025 at 11:55 PM Akhil P Oommen
> <quic_akhilpo@quicinc.com> wrote:
>>
>> On 4/23/2025 5:27 AM, Konrad Dybcio wrote:
>>> On 4/21/25 10:13 PM, Rob Clark wrote:
>>>> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>
>>>>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>>>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>
>>>>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>>
>>>>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>>>>
>>>>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>>>>> default (the one used prior to this change) on error.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>> ---
>>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>>>>  #include <linux/pm_domain.h>
>>>>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>>>>
>>>>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>>>>
>>>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>>>>
>>>>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>>  {
>>>>>>>>>> +     int hbb;
>>>>>>>>>> +
>>>>>>>>>>       gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>>>>       gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>>>>       gpu->ubwc_config.min_acc_len = 0;
>>>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>>           adreno_is_a690(gpu) ||
>>>>>>>>>>           adreno_is_a730(gpu) ||
>>>>>>>>>>           adreno_is_a740_family(gpu)) {
>>>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>>>>               gpu->ubwc_config.amsbc = 1;
>>>>>>>>>>               gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>>>>               gpu->ubwc_config.min_acc_len = 1;
>>>>>>>>>>       }
>>>>>>>>>> +
>>>>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>>>>> +     if (hbb < 0)
>>>>>>>>>> +             return;
>>>>>>>>>> +
>>>>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>>>>
>>>>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>>>>
>>>>>>>> To be clear about this, from the moment we introduced host image
>>>>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>>>>> here.
>>>>>>>
>>>>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>>>>> is unused in production.
>>>>>>
>>>>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>>>>> clear up any confusion about Mesa.
>>>>>>
>>>>>> Although, IIRC kgsl did set different values for a650 depending on
>>>>>> memory type... do you know what source that used?
>>>>>
>>>>> KGSL relies on an undocumented devicetree node populated by bootloader
>>>>> to detect ddrtype and calculates the HBB value based on that.
>>>>
>>>> Would it be reasonable to use the smem value, but if we find the
>>>> undocumented dt property, WARN_ON() if it's value disagrees with smem?
>>>>
>>>> That would at least give some confidence, or justified un-confidence
>>>> about the smem values
>>>
>>> The aforementioned value is populated based on the data that this
>>> driver reads out, and only on the same range of platforms that this
>>> driver happens to cater to
>>
>> Like I suggested privately, can we centralize all ubwc configuration so
>> that it is consistent across all drivers. With that, we will need to
>> maintain a table of ubwc config for each chipset and HBB can be
>> calculated based on the DDR configuration identified from SMEM. Once we
>> migrate the downstream drivers to the new API, we can hopefully move to
>> the HBB value from SMEM. This will ensure that the SMEM data for HBB is
>> accurate in all future chipsets.
>>
> 
> yes please

Alright, I'll get this sorted out 

Konrad
