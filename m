Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B716C2AD02
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371484; cv=none; b=H9eRlPTqm2foXbR2m+zxjw43sy1LkuvdmZ/ruc3rWMYObb1BircLSqkzvmpSBTQRr0Bi2t/xrvhtgj4nBMFjIPsMrKoXWRaxbRCUEIabOd2959u4Wav3tVXYgBFv4SHxQc8GEIwn8hZkcyS0mjLTX9dbUg83ns0QSqOCNTnnbjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371484; c=relaxed/simple;
	bh=1lbvkwmcN9+XPKXalOgA9l2vSu8vLVpKPb/SY3OyzR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwZPqeAY4TJpYqBWFtM1NlQOlcU5ZXutul4NBWFUzgdQe6DIRejr39AkQzriag0AmDD4LZQgf3hoBh8fDt3JkcQELAlhUWlQgJZBOe57ANlSE/OKTX/t+ybsqosI3R2yPMqel+p4tcXfLi9Z21vX6I1LC38RNk5ijsk3XJy4Yag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsstwGVy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsstwGVy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A7f8P024875
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 12:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NHaWBJg+Ds90gbf6gIrNnGLkbKxLD7AC/sDGjFqo0Y=; b=fsstwGVyEgtyq39g
	I3qt8UYvjp80hCeAeu2Dmo+eU4zHnDDMIaTGO0RKueua50jsSOoWrL/Yme3lz3RS
	G3/D0BCyRUqcOA86qi4KkDHUz7iTU9YvY4bOP3DDsCvus6+n8CMGvKMjfqu50lWf
	WDlUkH2fluJltkZlpl+mSZR7jpG4mmiyaoyXyulDTcQfPgI1KwNSvqlDtKR3SaIX
	E+sfMhD/KSxl8SntvfYVUlXcPGw5iu3qHcOe1yydYwsSsTpxaQzg+j4n+9srw5do
	FpBOO/JjPs3/IOQF/wMByIsSonVwFMttvux/fboUlqBiJFRlH1UxMxoKRXPgyR0i
	UbKMlA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8020ps1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:04:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5b3aac5bfso10549301cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 05:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371480; x=1751976280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NHaWBJg+Ds90gbf6gIrNnGLkbKxLD7AC/sDGjFqo0Y=;
        b=NwbRi1sKo8ZCKk3vhb4pEhWzZUqLg6PnX54fBzAWZJmoCHZ2KKRidnM+vHhi7wr3jl
         E9MF/4E7hFT45ohky/KZPXpUh75jFzirFse83NEc6snZM6uafNfUc1vXohyeIkaAkSyc
         8Chb3VEc/iHyrk6hnyNGB59c7i1ZWAUuMAXz2MH7TG5ShifC6XkbHVdet4lVRZ3JWvAX
         DK5a0eEFFc3iVCYQXsATBdiWcnGZbOpLfmBaoR2NCNYICkaszkT2RYfO9SF9EKt/C1nw
         lQYPlX2CgXTZrxTSfludvRbAoRAdXDzV/IWZRGg2Ws11NOSeDfOJ2pkE8lmGROM9mKB8
         AClA==
X-Forwarded-Encrypted: i=1; AJvYcCWXnF1Sm8mXY8E5qbz6nl//zsJEfMCJAl1TcaeCAmHwO3Bk5xyFR0EPvuxK4iK2/WnOQ6K6CgSmoaBrdM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFK62o+LRV4+zLovARhYkargmzSy6cYLdw0qMEbEHFEUUXtXf5
	vd3Ja89TgfthiNMTqRJ17cORDvlbamYvxHRFYcofrjyr1jQ5kpHV4GpvaXwrLM5nwyn0GDpDQnr
	Zc/j7/5mYbAYGHq/IxizCN8JjpxOyk4X50WSMS6stxZHv5cSfPBKspSZSLFL6K7xDbns=
X-Gm-Gg: ASbGncs3vDUvUSS3dpUUNL/XRPOCpitspgOFNnqgDcdMwwZZh1ICC/oquluSr5hUpku
	Zj8A/Ho2a891vP4+vTEws/4gYJKyy1IZVnjswRO5kgbMbvjcZvt3RAzS6meYU5lt5REx6OkevUc
	RgRTYCmgmj44pXY77sdoinDyTPHRCsnhRI1DNOq3dKgSL/OGrQIt33KhxZ9CO4IN+I2VwhC3uqW
	rs7W7Va5Ve7IZ/T068zt4xhwIG+eu4irztn3hZTT+EQe2yPV3pOpKX9s0TiVbLd47O4Wr5d7p3I
	qmQNDlPgx8wwLfxXwf0dndBJLL3ccsDGDaXK0bdG9sXhUwC1Ja21FZ5/4HHnUGvH4JAkapCfvHu
	w5pUwCj/c
X-Received: by 2002:a05:620a:294a:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7d4688a26d0mr124885085a.2.1751371479548;
        Tue, 01 Jul 2025 05:04:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8XZoEPSj7bokOOVZKz/UcTzyquGklqsan9ThQP9FrWzaAytiLBv4obM8TRklGr/BZUMuQwA==
X-Received: by 2002:a05:620a:294a:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7d4688a26d0mr124876985a.2.1751371477590;
        Tue, 01 Jul 2025 05:04:37 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca20a0sm866875566b.177.2025.07.01.05.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:04:36 -0700 (PDT)
Message-ID: <84861a4d-3016-4d67-b606-ef698ea10e7d@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:04:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: iris: configure DMA device for vb2 queue on
 OUTPUT plane
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-5-51e18c0ffbce@quicinc.com>
 <d8a1fdd4-0056-480f-ade1-318a34d27204@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d8a1fdd4-0056-480f-ade1-318a34d27204@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9icw3fatsc2QqKiKqbf25JtPFbURpml0
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6863ced8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=QmyDNCatlCRWdA39UCgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9icw3fatsc2QqKiKqbf25JtPFbURpml0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NSBTYWx0ZWRfXwb1aDoSGr9Kr
 v8aMtRcKDkTLJHgu3S90pE+B/PJZVD9lX/sIAbEtaL09icQz//RkVLQnwZTDatkpRuHxma+3IZW
 NjAtDjWlbQ/iDTWpIRMDDr0RO3qSzgWk3G9fqq2MJWg2ghY2S1udlRGTqL60J0Np4uXObBvMZpM
 nWMIqlvV37dQ0W52OnrTq7th0cDuD77rzmdD3aZkENhxApOpw+IdqS8oakl61eM7AmWm+ffWHE5
 PsPhIZwc8rbGpWdIH6Lre75CgBjx2xoB84UJWSiDmxLDWOkmE5T3cjZ+yrOEaWRS4HJM2a0nIqz
 +DID7Q91psJ3iPpcjm6cg6ABsbHNmtX4yj3oX2EdQjR1Xv2Gua2IUBPljp4lx44Ih2TVxchCHPY
 ug6WL7XznMm0b5MbPsgKRgcrVWiazXzA1iqyuOhSV+brMpagNEUIFNEF2vY9343L99eW8bsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010075



On 27-Jun-25 19:08, Bryan O'Donoghue wrote:
> On 27/06/2025 16:48, Vikash Garodia wrote:
>> While setting up the vb2 queues, assign "non_pixel" device to manage
>> OUTPUT plane buffers i.e bitstream buffers incase of decoder. It prefers
>> the non_pixel device(np_dev) when available, falling back to core->dev
>> otherwise.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vb2.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index cdf11feb590b5cb7804db3fcde7282fb1f9f1a1e..01cc337970400d48063c558c1ac039539dbcbaba 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -159,6 +159,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>>       *num_planes = 1;
>>       sizes[0] = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>>   +    if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
>> +        q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +        q->dev = core->np_dev ? core->np_dev : core->dev;
>> +
>>   unlock:
>>       mutex_unlock(&inst->lock);
>>  
> 
> q->dev = core->dev;
> 
> if (thing || thing_else)
>     q->dev = core->np_dev;

q->dev = core->np_dev ?: core->dev;

Konrad
