Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276CA1D6188
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888541; cv=none; b=iRyd+5vBDBW9uMQlgr21jQnRb8lFa6oIMk+KOqOQwH1VRIh4qQLFRE+eoLRjAgXaaerHV4ukpvGpDB4d+lUDKkRymQUr6QYjE/JKGKZoNSNeQrgmusRhg3eM42VsoBRCbrsPPsFj6oB9kV9xZ+fnt5uAvQK73iHYwkplga4/UlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888541; c=relaxed/simple;
	bh=SO2cOz0w28nDjmz/4KCVUhyYuZcYpM+EdXuWAg+c+MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcceA2BPL/G26imM1AS62Ogdf0EOCPOKxPAXOWxsGYEAebHnqv0ba3Wkt4JAkdAZY+TvXfrO9sZgx/PDl+qwn90DGS9I2ufxk/UsnHoR1ryWspNg0a5onG/7FX1Dvj/PnYiEsHAH+hi8vsNnhpj9wZPlAXpETYqiEcQUOkZKads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCak27oe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCak27oe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676p3iA013839
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 11:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EPmD/mqlIvExS85dVMv30F8Iy5Y5MWP3RJHR3V0RmEk=; b=kCak27oehArBQbs7
	HuVS7QtbLw98lQGjXAIM1ZQbi91QEOJl470Erw1CPSFwbmpWoZJI8AhTW1ARWoHH
	VuLIiIr7gorBBzRs0Kf782/QHJZlApOyMg3563oHtd44/n5kw9VLPcaoSIrF9E/1
	sanKnuyOHFwzwft4XmBKJvDvkPh26v8obbfB8PIPOIPEsMPPhsvgOAlT3RCKYX7s
	RRKK85e9Y+B24cFwrPOIg9QpqL5p8ggllBIiE5df4ZHVvt+tzYKmmbPmYz0lFhWN
	YKe60w5hw/GScJNjYP84trOui3F/UQA5Dnc1Ik9sIV+Kt/utpy8D2CM6erN0ITQ6
	W8KgiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0j6ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 11:42:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so41805085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 04:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888538; x=1752493338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPmD/mqlIvExS85dVMv30F8Iy5Y5MWP3RJHR3V0RmEk=;
        b=VHna2eFq0o2T+C4Nyoln+nKyFkZxFVHMl8UIYCEV3F7OHf14Jqa6fuG/nAElO9sWv0
         EC/OUW6EBvPMrIl19fYfb0Y6lexHy7Ks82R9/Tql9MnfpBy9nhBNA5sle4L+w0+vLKTN
         u7DJtT/mDb5CaKbbi6rQGokp5zXiN5hL40Ekj75dQmG31jmN7wdLv3HyFYEM3RVMKSvS
         XYNaV4kQAh6IP+0+mjSju9sCkVe9UuHZKiFCkvqMvtoYl6PiHwQsf6X3+xVQFa3qaV/T
         ++u0sFe5e2NFpt6U+ooNH7haPjPatdi7Mz9vUtEvrRmC8Bm7tC5OKCWKD+tPbYS4dV20
         IJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh/YOj3Prix0/lU9eHZXeU5N/xU1gs0cR6hOUvxMJ5P2BQ5TYa8EJKNjqShrR9YdXwyZj5cKhcudjdZ8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd6togEhUuyprdgEq9cNd5xgWGbj8m4MavmLjaFjkxq4OTIG6F
	W6XWwhs4AiRA63q4g+UQ06scydtC5EGTm4h+LBephASjBsfsrwSEmXoGiCYrIzr3eg++L1AQxfv
	b07VnMCfdj6hrkPMmR3JMjOKkg2Y9DmRmAxHk54Cnn0sAzWwN4Dw5c3b8BOFV9DPmRCM=
X-Gm-Gg: ASbGncso0YMhXjmKiKrLYfg0iih+KKMlRM5jQ3zoWAT/VJUcRHmjkqOILgMQ8t+xHui
	6jIwFiLFASZz8ce4p6+/lcC4gtQsXs4U//bB5DrKNuk3cWudV7Mp5t5rILgteqiSnvH6Wj9sfn+
	0AV9YGKkBHCQSiVCDMo+xTMW4+BJ5hpdSQ//62eFYHCreKIso51TeSFyWBcZkBKQY0LY5WUNt+n
	4qleqIY5mwfYsJEGdVlyheWw81KLdKu5EWQXIQPIdJlF/UD1mcnh6cxNiC9yuolkFTDh9Z+ibSy
	gdLomlymkni7JWQYx9LGahXGB4vpx5I0adFpmR5gI5TTh2W8QmcBiDUXlLZ2R3GNEIBnfAEIgeG
	qI2c=
X-Received: by 2002:a05:620a:198e:b0:7d5:d1b8:e02c with SMTP id af79cd13be357-7d5ddc509abmr651649585a.10.1751888537765;
        Mon, 07 Jul 2025 04:42:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9KOzB4zGkVpZwJx25vMl/UErrpqlqNGh0xSPchsvbG7/JV9ArfFw0uRjlumUIiFyMTjX47A==
X-Received: by 2002:a05:620a:198e:b0:7d5:d1b8:e02c with SMTP id af79cd13be357-7d5ddc509abmr651646885a.10.1751888537272;
        Mon, 07 Jul 2025 04:42:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e6fcsm695212066b.146.2025.07.07.04.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:42:16 -0700 (PDT)
Message-ID: <6579c65c-877d-44fe-aa81-5b0e602b33f5@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:42:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686bb29b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=By577mDeuySOoy4OwVYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2OCBTYWx0ZWRfX2sd0liwjjCTx
 BU5FfA9ALR85Q81ZxagLdHnNXgKLzOi4oTUwetHhlaubNT6lymPvud/6V1OQWwMSj/MVQxYidBg
 uUiMcD/atSeA8hP2L4ViOCzrNQ5sdRXeAO9oiWvmIK24W2SAHQGhnujV4KzeclkrjjVO4wMapCj
 9tauBHO/avOEHh2GptQKlC1nzFV4rr1YCbfgkbXnVPv+Zg1Ef9gzMFsX9fQaF2XEWbTiIKiOIvu
 XSZnfpR/ZD3Fb5dsJ+3q78pJuyluYy2sTFkNJD+fZnvhBdLRBalDue3GoUisCN+wccRURS/wVSy
 e/2JcvirshDxLekkCx1/VitewTuOHAn2c3ADE6/XgYAIZSthvdjEUpjhm2Vlftl7Avj1TYmDzsW
 GaztSJNDetZX/Bmnm8pWXa29AgVwSHQiiolpJoYJQL5EFAXvuRk4HZYfGmD9ZU+DHtOpUe2H
X-Proofpoint-GUID: i_CnJyq0jj-dHzi4D7fdmv_nfcO0go6P
X-Proofpoint-ORIG-GUID: i_CnJyq0jj-dHzi4D7fdmv_nfcO0go6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070068

On 7/5/25 4:52 PM, Rob Clark wrote:
> Avoid the possibility of missing features between the split and unified
> drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> in the drm_driver initializations.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b6efc5b9933b..5695de1bbae2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -816,14 +816,21 @@ static const struct file_operations fops = {
>  	.show_fdinfo = drm_show_fdinfo,
>  };
>  
> +#define DRIVER_FEATURES_GPU ( \
> +		DRIVER_GEM | \
> +		DRIVER_GEM_GPUVA | \
> +		DRIVER_RENDER | \
> +		DRIVER_SYNCOBJ_TIMELINE | \
> +		0 )
> +
> +#define DRIVER_FEATURES_KMS ( \
> +		DRIVER_GEM | \
> +		DRIVER_ATOMIC | \
> +		DRIVER_MODESET | \
> +		0 )

Perhaps I'm missing some C lore, but do we need the "| 0"?

Konrad
