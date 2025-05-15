Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FA821B185
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325917; cv=none; b=M1UqXaVdq8cxoeS1GQgRupNVELuizKFYwJ7FyiIND8VKrRSnA0eA2JpFo5t/owRJf6J+JzgHS1XOGX0HpJP3ga/9S7HpvpzvWN6E/zLs5kKhbS6FFzjGXxe5u/1/v3HNKwTEQQe3oC+ZbTPID1cWBhUbbERuEePoTaOzKG7ZrM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325917; c=relaxed/simple;
	bh=2/kjnN8zQR+qtnayP7lkAqy0pxVPK2sXezwBc0V/tJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpPvh28LDGTd0zmCUokPqWVSxymVgyMzc4MC9sMED+eNp1vqxSbh+xNpXVJk60AepuSraG0LztTeZ+XixYMajjPJN0cBZLSVkkP4Asfzqmlo21CpwgefHY0hBQmoIfTj6WzSaq30QhzkD/UWL6+iH4U3DbdvWXFO49GYkFxKvtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BF3cvFgJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BF3cvFgJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDaX001798
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qX+FKmvWae7qk6ZxShDL/DRRc09xp5kjpRbX5MzVt+8=; b=BF3cvFgJQh0FUiNG
	Ha8PNY81gbzM3nBFoNq6K4IgbvECb3TRxgAcOYMl7gfyB3IPggYT6NQGz0z9iNjK
	C5wniCpHjaCmOw3V6Mv2HrL67z+CAKVcpInvglt7fpmpun1aMHVux4pjFBYy5xEN
	wnv77ppz+7FvqJzhA5T/EUghYpQfRXf0X1BstFeUqYdmfhdBY8PrqVNQC1thF3Xx
	tek/PPOqSgp5qE5SESZE+3YGyhEw6HZO0JwzI748WpvJ/2Aq9V4vtiDTAk11wrx7
	N6c8TyJZXt0frd/NXNaWuPlil6Aeu4qwVe3KAA/i38ydmfcoBjwM0ObufZmJt9wX
	k2HJPw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcreqev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:18:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c8929757so3257116d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747325914; x=1747930714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qX+FKmvWae7qk6ZxShDL/DRRc09xp5kjpRbX5MzVt+8=;
        b=YYZcr9bLKAc51F2Yo0ml32cYg47Bd9UQb3BoGlof9INyS8GoVE91vKFsUwoBKTomil
         tS49mymrUOevLrxixhUHHyMovXNiSZ+s08rVgA+nJuWcNdfoQBh+CuUdGAyfCXNdM+QG
         AZeLkf+i4vqR/9Hc9hn6MKgb7Esb8/oHQVWpYwy1DzvVM82aTRZjFbrR27W/8L4nA2SV
         /60sjEFLIWbRYpl1S/8abcEzw6FyIkOoRey6e7bw6129ueEOHVNhyg46ZRFxwxRZzJqA
         vDW6/aI3onQS0kBqm0NOyJwmrJf/7/2tjQXEk35X2Gfw3IJ5r4UajOdrjDGw3kT7P52l
         qKPw==
X-Forwarded-Encrypted: i=1; AJvYcCWzQiK7kWfA0XsA0/56HCKrSGXxdY+5QSDVF4WW33NCBYx90ej+gwlRgqvGFbCji2irV/Z9Rf56qmNTRko=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF59GXSnpbSTZ4qTGlNr5suGzp8NxomcnMfQlbd8aHj5zRKn1f
	/700K50Z+4Uyttx7B9sPt9laWkFHK7XEsNCieEhr7vU4km7idVvzIfOz/g/zgznOBiceApnWSnR
	Mdxli1DB+EcouWFdrXmEp0xKeXHahItdSfnOC60c34zKFWWztU6YcGik+CDU4Ld7jdNU=
X-Gm-Gg: ASbGncs7BuabmCzrED1q2l0akG8nEYUIKcuJnT4yoZkPGQ6ruSbqQYDpTyuYALsigHf
	TIF4T7fJspJ5iXKheNpjEM7tqxXEFtukEVlngdp6XrcgeuJrDt+/c7LZzRp5sTDmW2M4J7JhlQu
	E7Yhb5Ij8wYB7+LJULCv5ChzJ/uxjDRDX8hi1P5br/g88qYgFJleM0V06Vx+EFKirnxtX2sYTFU
	mzDCwfV5WrIGPlKNVaK0UNqGCyxWyfZocYni7Ap25EqsEmq8QlxS1ebilqmIR0TCatwQAVApGp8
	e/1FVIo7Y5O/QvUb0KR/e4wJFBpCLEEsIYNwCYIgaHiZvpfAl9rdS99nDTyafYB/jg==
X-Received: by 2002:a05:6214:f0c:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f8b09398f4mr1585806d6.11.1747325913503;
        Thu, 15 May 2025 09:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs5o7TMvuHlAVqEVKuzoLrDE2O7PdxwnnYC6+0RPVnhmYXHkLwqwBcqjjj6lsYHcU9JpqmmA==
X-Received: by 2002:a05:6214:f0c:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f8b09398f4mr1585516d6.11.1747325912806;
        Thu, 15 May 2025 09:18:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d441fb5sm9987466b.108.2025.05.15.09.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 09:18:32 -0700 (PDT)
Message-ID: <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
Date: Thu, 15 May 2025 18:18:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
 <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a2skIqfkea8KtC5Xou2DuDIlPKzIAsJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MiBTYWx0ZWRfX7jbmfpdWwpfK
 EL6dyllCp/meH23iQRo6odYzwwg70clHpAQxmbSXZd1jmJAvoCgyoRqrNorKv7Nx0Z+PKC/GV7W
 q2ajIbEcvEr+2/em3W5RMQbKIIGluVL5I6YrKSuOXkRty4WtXYiQRsQsMGNnrZAIOgeI31cdL79
 62mO+D+7EZ+wjR5I7kUW6FCmG7QCX4sZM6zURRN2Apqsb8ZZAjqxir85FsD8yo1a6w5rQ1ZdoeV
 OgmjeSIEvkYvz7Cd78ZADKeg0IHrkIll+NFfUoqhRplJekW5ZrQR1oqc37KM8JgnYk4Y2hhgFHN
 KjCn0xYp1RlZa5O+opl+m0+HcikjRIDzUor4fF47A69o1CLFPTrnCiBnWCcz3pg1FOIJH1CCUdS
 m5+o/g9+RGELzBYMceQBR+HC3sdkm4x3GakL0wQ9XGBvGX3mJpA5/srBHhPLT2+0392tXad6
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=682613da cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=4UHGY1WjEP5fiMyc6oEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: a2skIqfkea8KtC5Xou2DuDIlPKzIAsJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150162

On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
> On 14/05/2025 23:05, Konrad Dybcio wrote:
>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>> 1.0 encoder).
>>>>
>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>> bits, as they weren't consumed on this platform).
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>   drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>   static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>       .ubwc_enc_version = UBWC_1_0,
>>>>       .ubwc_dec_version = UBWC_3_0,
>>>> -    .ubwc_swizzle = 1,
>>>> +    .ubwc_swizzle = 7,
>>>>       .highest_bank_bit = 14,
>>>>   };
>>>
>>> Add a comment and squash into the patch 1.
>>
>> I don't think that's a good idea, plus this series should be merged
>> together anyway
> 
> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
> 
> - MDSS: offset HBB by 13 (patch 2)
> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
> - get a handle (patch 4)
> - resolve / simplify (patches 5-10, not squashed)
> - fix sm6125 (patch 13)
> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)

Does this bring any functional benefit? This series is unfun to remix

Konrad
