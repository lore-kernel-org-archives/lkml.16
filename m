Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401021A95D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324271; cv=none; b=GBpinz+G+/eCsFfHjrMtVvC4y741PK7G2L1+EUnmRNng4bbpO5kHhaD4HwLMQrwUmonPkBYRF3jRLbwL22Z05SceA9XuS7ZGFwUjSM4p+qYJaSUyh9bGjGAUmdbcddbRsN/dCXiBItMHabgskBNHof1Gx4DfXKdq1akd6o9txO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324271; c=relaxed/simple;
	bh=/Ll25eGOig8uLptB/ZNRa/LgifV0dB9j9Ahb9Pe9pGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVr/S+r+nhasBGNzZ0Ho+OesqtY2mRSRPvxzhvUk6vsdnx0ulUjwSkrObJU5owuvGnOEI5Xe5w6eUO5K5bhpFkK0QSRsIGyaH4sKipI3HoV2NEedY/K75UOQn1cgIag1I4wGD84MvBtmgorBTIXwKbIa7/4sujZXA72ZOhXdC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiXF5xpl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiXF5xpl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFStW000334
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwVpEIqOsJer60fiNoaqHMYmRIZm7xE7Ct+1ZmlS3Vo=; b=GiXF5xpl7xptwRm4
	pF19Ie4+u9zfT3/0yx/lR+Plg5siSxVxCoZqPYLXYudzC6fan3bDGi21iMkiYH7m
	CDEprpPjdpkkKiMg99Bm6QH8BiCwvolrAl8J+TV8PWsvGY2XXjhXFshGDeFQaNMn
	sSkApNLLbWr3QUtpTLSawzouCafJktmVFIqgViNC9d+zt9gCzoBcJqkACr0AsNQ3
	iLJR8hBv8ydXUoDWnOsFX+C4g1c9VBahqhk2FTKVmPBWmg1MB+MGr1i0f5RIfnRb
	V1Vp/cIR2+okLCUOp2k+hA76l+/wZBfe1kDsmxYynkFYDx1JJVfPMPhuYBAaFJLv
	uTaI/Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxp1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:51:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c8929757so3183656d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324268; x=1747929068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bwVpEIqOsJer60fiNoaqHMYmRIZm7xE7Ct+1ZmlS3Vo=;
        b=TQgoAqVegxqe3PZTcn95RuNeBST5u/ziJUf3a45p7yF0S1HedIfksEYK2Kq6MdxW6R
         2zaBBTPABgElUzRS7wm5hj0eY2dqcY59gSrt+J8gBlXpXSKN8/6bd5ghqaWeyWHz0vgH
         RJxQaNGf/99rPKgq8o0wMjVRG54Uqb9ulnuLu9lQ6ed3/qYlWn9UDFlrXrTrfzGvdvFw
         ySY/WUh0I5FJNC8JRx36hQamt7/U5IAdwMWeSxQJeqy5xYMETDso/Zl9fosF/FOv9J+2
         gfvgrz8DIgvfhSlarANEXn+maqrE6TiN5Ub4w8r+jov2j/R0d0zAC/z9DKLq9XTqGHkk
         9/tA==
X-Forwarded-Encrypted: i=1; AJvYcCXIoZBosGHZ1etPiJFGCNBVy3Gh0/eOmQw77y9G5dbT62go8QEbIbF9jAXLZtLxHnn41vyyClCAavAoKRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzARmJpQ3U1OwIijTe4svplig4ZCom8EdH61qbMKbFre30brm11
	F+K9zRzmRluNLgvRf1kZ2JCQ/sRFinKQMRXkeQE09ySaB8ZWPuETKlUJMwtBCmjjPHYSposFyA1
	S8La13mYe6Epgb4fy42NToTLvDQSkCVnDZk4yiFjlWjVwwH2Np82enydlugQoJq85SVo=
X-Gm-Gg: ASbGnctuDrThttAt6PO1Aol9U6Z24gJcr8lBjSeP4N5IGCxmwwPuGwYHfZjqUEWMqMp
	VOcTNJHyoYWmGhf1zZ5EG1PO2nHiePOVm2RV2O/GOFh/iGlPafV+5mMxnp01BvTX1vJsoe/M0Ip
	IFQlAkEg5jGVa9XHt06m9s2RSdcZPIB2ysOaxEZ5iisI4ge+aDdP18M66yj8H313GIOwVJnhLZk
	XcNM1x16FEkwHS5ZjhOKinf4my0wHMyyvNVHy9wQNKc+7NjPX9A8cK+6aGxgKScoIRcUn8x//zA
	OkzY6xsyqF3KohWTszRQZzUMHXCVCj52+9CS2WyH/tddcAGp9oKT3i2MHd4IbXfASw==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id 6a1803df08f44-6f8b08811b3mr1262646d6.5.1747324267827;
        Thu, 15 May 2025 08:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuP636c4a4W/vTuDcHADRpcLgMarKC0rmzXDUBxsuM0NINQpQHYG/rJHp1KJPbZZsCqr9WEQ==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id 6a1803df08f44-6f8b08811b3mr1262376d6.5.1747324267436;
        Thu, 15 May 2025 08:51:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d276592sm7839866b.73.2025.05.15.08.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:51:06 -0700 (PDT)
Message-ID: <d7cf919e-bded-45a1-a352-6b2e659d0197@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:51:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 10/15] drm/msm/a6xx: Simplify min_acc_len
 calculation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
 <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t8_KGJH_POQ-FpPnSQqykkM9SsQ4WaVg
X-Proofpoint-ORIG-GUID: t8_KGJH_POQ-FpPnSQqykkM9SsQ4WaVg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NyBTYWx0ZWRfXz1mY5SzHbVNz
 9Fj4bksR4+CkEw+pCXFdcCHWdq2sIZ8bn30Yn7OLBk7ItgxPHwMlNbh0VkKDYxWoQxp9TEkS9Bz
 nPuHIiSxCxjiAktHRbjVBVlcgojrg3WC8yShsfV/tyw1uc9DA/zUD3NUWla3+zc6oEUmSzIs+H3
 EEyyNBAn11XkpcACDjyX5nsB4GDfqZ0FuIWSPiTMR+e0GHH9o89wTi0SmSJelgSyEIH6gKleiMT
 KvNxThayTOMRghHKkyj2/cW0wPqesDORCmd9kM4xVt+B1VL9WGoq/k7r6qL5Go6eNS+AEotW94f
 yxXu6ttPHA3azldAJrz4qn5rQ2msT+cc2IaHeNXgQGMg1bujFitV0rwL41Txtppw6GRUyvw7Zmk
 T5SiVMm/0wFHu0z6OzIORlv/2gef2aN8S09rcBBdWyU8PaPPrY9ahHm1GJ+lzPQjENsi7Ina
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=68260d6c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=zQN7QPYGGEOyCfchBhgA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150157

On 5/14/25 9:19 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:30PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> It's only necessary for some lower end parts.
>> Also rename it to min_acc_len_64b to denote that if set, the minimum
>> access length is 64 bits, 32b otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>>  1 file changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 5ee5f8dc90fe0d1647ce07b7dbcadc6ca2ecd416..fdc843c47c075a92ec8305217c355e4ccee876dc 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -592,14 +592,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  	if (IS_ERR(gpu->common_ubwc_cfg))
>>  		return -EINVAL;
>>  
>> -	gpu->ubwc_config.min_acc_len = 0;
>>  	gpu->ubwc_config.ubwc_swizzle = 0x6;
>>  	gpu->ubwc_config.macrotile_mode = 0;
>>  	gpu->ubwc_config.highest_bank_bit = 15;
> 
> It occurred to me that here (and in some previous patches) you stopped
> setting the field, but you didn't drop it from adreno_gpu.ubwc_config.
> Would you mind updating the patches in this way?
> 
> With that fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I mean.. I could.. but I delete the whole thing couple patches later

Konrad
