Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA2A2356D0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571922; cv=none; b=RAW1cj4QUJqFWj87wKfW/kRdb8De1z01hny1EDnjIxuf8cawL2FtxYMXWKvbuRH9fPT2ieVwX84XVwxXtOyUxKKofqWaaNLYIHL80HDONTbnmCLr4lC5nj0SNvatMOcqv2xy7kJ0sW+C9s7X9uVfAaSYNOouIQkxYqGKMWsUWv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571922; c=relaxed/simple;
	bh=sAcjzAuxsKz14wOdwYeN2vtA1y93MRiKA2xTQ7YT1Sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkVL0spnGhD+PTxVJNZhpUXRprLj7jnI5l2rUd2c0sOI9/zRsiqaDzW9JoACNZvT+/Zvbtla0WdI1d7mu/QuYr255a/0oeSwXOLsO23zy/eeUuBnGfOhismFEM7lafcuiH3NEpwv77b64a3HcvfKY2YAmGPb5BG39MQpvsQb0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VK31//24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VK31//24"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TAqn025097
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBp/Sktf2CJhOpU3vnuL93wkEwguX+kdhkqReJ8UHEc=; b=VK31//24CTcu+YHy
	G2FqZiJIRqkAdrUZPK5ArXf1xd7AQWXw9b01MdWhNno4vzJf4o8zgARCjj1is6YN
	E0yQGAqF8VgD3E6Ejpb9Gg8Yi/96NdN2VSSGwBnxnFb01+3we8eIXzP5iftLyCXZ
	jVB9nRrgBuxQAIQ9qXrV2ZXbRhsBmt0hdL5pe/Zvi9FYITOoddNU2gQjJ6pUFdu0
	gJxYi8hZg0JiIwJma4DSo7opZPvLDDgG6PzFxmx5c61pw7xDh1lvivniIxRgVHEN
	JyLRIkbp4PdxYRq0REb/w8XJ52nFHvNBDp4C13kHg8XtUXbJcmySDiovK+lMdIIq
	mtHkQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3rbt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:05:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4766654b0c3so4234111cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571919; x=1746176719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBp/Sktf2CJhOpU3vnuL93wkEwguX+kdhkqReJ8UHEc=;
        b=YjafDkb/qeFRNuBVM/F7EtaIPNvKLXpB1CXSOn4uy2Cr1/bHswfX/UTGWyICb/bBSv
         e53wKPiVxPRy1NrIW76EG1NlIoxy33XXnVnXjWoyQBqxgvFyTeNA2PMgYLWYKgwxNWk6
         t/TRm7wcp22I5kyV63eMqkowmisSSns6YXqwqDRw45vfHb/aWeSkSz9SJQbuhCmZKsPK
         +j56uZoVhNglMFH40maWoUT5piTgKZAUSMgDg5e9Zk6jXw+Ca8kKPAtgwyxs3MdTXgLC
         jGbzUZYQbIY0M/GSNIHnEYbxOCjHqBE4soRrxej3y1rUJq4uO7SPEqVvUaU/BccRrcSq
         HZlg==
X-Forwarded-Encrypted: i=1; AJvYcCXOc0ltOfRyT2a2rH3JCgMSNb/chtiVOccbSTOQ7YQfsuaxNybCV846a8V7OoGi87+qiIIsKBbl3RfCVRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqg/Pkoc+CrItiNDQeZDTuDv44a0He80OwulukJAIQwsyGYW59
	kT8NQbFhHDnY7GqJXIDbcHdp295qVydFFLTGXs+BaP11vsFmcRZWbnSs/8fVrD382ErcyrZ1dfh
	CzVykETX0GO6Kww1MZq/svUxaxN796mAwM4xB2U1xh1jRy4y0m1+TO3F82m6XPLc=
X-Gm-Gg: ASbGncvEocO2pqAOv0tbgZPm/g5ZV4GvVA5g72m3GxVFQFyX+SYo3e7tl8YpZzItt/+
	LVGGoC4AoJLKgKup/sRBEbSJ0IPOYqW+eMdXIb3iJj1+E7KIfMVa4aJn5OXRAjg0o6RI3oE7jQG
	8OD9o/+Y5dHzomaiiUtRO7PJmVBIJIY6bB1mk2QbK92MSJosQooNoUvLgLR8PGNHEQml8dYBd1m
	mkUPSUBL94Q/AlzWvjloJRw3ziEq0la2eRHLroLU0xDGMY/e6dBgM8oqfZ0ROsNF3z46Fndz5hW
	b3pc27Kysv746+LYxCGmQ7oZqcD0cM9MiO9Z0nTZupiHiSNk4owDuE3JaSSDkujA
X-Received: by 2002:a05:620a:2907:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c9607027e7mr84153585a.4.1745571918856;
        Fri, 25 Apr 2025 02:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ4HrzculVF+OYsrWB/QeY6ey0mgBw9+RURDMEsUzYNwrj4ge+kGalkHQyVtPOx4qELkRAtg==
X-Received: by 2002:a05:620a:2907:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c9607027e7mr84152185a.4.1745571918443;
        Fri, 25 Apr 2025 02:05:18 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc41sm104938866b.24.2025.04.25.02.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:05:17 -0700 (PDT)
Message-ID: <c6cff2a7-4497-44b3-a019-60e3c6034d4f@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:05:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
 <20240709-topic-smem_speedbin-v5-1-e2146be0c96f@linaro.org>
 <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ULNr4CZ8xZpoKDnCWiWXDx6WuDDf3Uk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NSBTYWx0ZWRfXyrLy3KI12znD jrcXfpqRBug8EFd2nAvWiVFwrj+tEdSKmg70B5RDCtxwlKevCLciBOwZOa1ctTiwFP4+3gtslZW yo03kmXujCwLMVc4kpfuxbCY3G1ZOvUQdViWUDfdfa9BfAzHyhXeEXZ4wFPAjVO/ScnhGbcT9tc
 uTey0cpKZ4I6TFetO2Qu9xoA7Oz88W0y5Joveq8rqtykb2OU3NpiS+tqBcd5oR084Y5qWTJZvsV zmHEELw2+9JybNksHLIj1RXKe0cXYwLdhCqFpFQ4UDNucjLuOYS5B5NF59PISbdrB22DPucj2t0 p+wYuUj1n4dZAskI0D9Oym5LWWvXxw8+PUw4xXWBaJunz6s6jrToHRVC7LwPNn0IWnRzQp8qvLE
 NNPRTDGg4g4HCMSyBfOWhxQ3FPH80sW6Pv3BRsTsyEPIYFLnEuL4LJYtbfSby67AUxKpouo3
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680b504f cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=RALOh4QmxscuBpg08HYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ULNr4CZ8xZpoKDnCWiWXDx6WuDDf3Uk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=874 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250065

On 7/15/24 10:04 PM, Akhil P Oommen wrote:
> On Tue, Jul 09, 2024 at 12:45:29PM +0200, Konrad Dybcio wrote:
>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>> abstracted through SMEM, instead of being directly available in a fuse.
>>
>> Add support for SMEM-based speed binning, which includes getting
>> "feature code" and "product code" from said source and parsing them
>> to form something that lets us match OPPs against.
>>
>> Due to the product code being ignored in the context of Adreno on
>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>>  
>>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>> @@ -1102,9 +1136,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>  			devm_pm_opp_set_clkname(dev, "core");
>>  	}
>>  
>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>  		speedbin = 0xffff;
>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>> +	adreno_gpu->speedbin = speedbin;
> 
> There are some chipsets which uses both Speedbin and Socinfo data for
> SKU detection [1]. We don't need to worry about that logic for now. But
> I am worried about mixing Speedbin and SKU_ID in the UABI with this patch.
> It will be difficult when we have to expose both to userspace.
> 
> I think we can use a separate bitfield to expose FCODE/PCODE. Currently,
> the lower 32 bit is reserved for chipid and 33-48 is reserved for speedbin,
> so I think we can use the rest of the 16 bits for SKU_ID. And within that
> 16bits, 12 bits should be sufficient for FCODE and the rest 8 bits
> reserved for future PCODE.

So I revisited this patchset and had another thought - maybe we could just
extend the speedbin bitfield to cover [63:32] and worry about filling these
higher bits in the future, when adding the platforms you mentioned?

Do we still have plans to use *both* SMEM and fuse encoding on them?

Konrad
