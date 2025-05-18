Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1138C7E1
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747562391; cv=none; b=nYzAxH8/KzixdqO+Jo42udg6etS122NaY3eW99QrVEVnN7hNuBLF/ypNyv2AWB5W/yty1ESXXcUiBnTzkw9vU/pyYFey8TJlsimusspfkAaWZ5oy+n5U7WbkNzMkoI8qBcEExL2XSng9Lu/fLOyM13naXYA69dL3aaPz3qU0w5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747562391; c=relaxed/simple;
	bh=ueWk3TgqMfa5c9wV+6RoVaZpGnywa4/zBpLz6UmdNOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGBiNdaBzdHp3CI0is61EbkSAxt4uwMNCLT7jqsl5JIxZpG6SmjclHTtysg4AP2YLgZio9bZ5wUwVK0REm8k6YLusEd3GdRqOo3sUkdRpfjISE14GVMyxMkXVfiL80+9BmMEK6yMkNMQHKV3D8u1nThO5DCAaxVQxZmOUeHZTYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWcQIgYq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWcQIgYq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7ViUl017701
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K50CCOhb1oRvXdqTRxazbRT6
	Bc6ZaplqyOTawwp2iHI=; b=OWcQIgYqPHCqvOadeF2z3+wWe5ESOqrErI+jWY/x
	q5UcGZRPDiqUJTyK91vxfVqdoH9Duct/rlliGEGDrjkpiiVSahIHMCs8gCJU9Q3o
	ED87fm3cPVfb2sZLy52qX1D5b0aDz8yuor8Lk+dxJo/AB0ZF9AytO7aWktzd9P3V
	AqjfoFChpBHm3u4xdVWdsI8rKNBDnKjWPPACSNOGsrKR0/Tsre1LpxDAkwuE5gue
	Mcom6RTlP24CEwOyODkwxRYorhOfgm3RRGy53+6LyAdzyWq1cIkluphu4Nu0Hgro
	ra/7awc1wUEKsYGGVTrkFxdQChynVik1h/N94EhLI8ulLg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcsu2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:59:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d0bdd023so22643386d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 02:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747562388; x=1748167188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K50CCOhb1oRvXdqTRxazbRT6Bc6ZaplqyOTawwp2iHI=;
        b=uuMFPQmG9k1F8HuW1sX0FQjgm4PjjAap/rmTnNqDM5VUFtaFQECcdA7JjjZzOPhGmN
         3vJDSweXgL7dKCEIMbFQXEl74eYDtlqWvq4lfEsoB9yFq2ZjX3RXjBFJ/TBrqTCiKWc+
         zxZ1y0i9590sVMuEv6dSkWRUeQOF/JJ11t7o/AZ1ifun2eKzzqSu+GYSCijpF6qmF+Vm
         RQ4IKAjQEqTLv7hsrmxPwHSpXs6GuHJm/RE35DAuZKJ5AwRLx/WyiKzqx0EtePGrf3wn
         pBJ7sP7imy2vRFD04Q+hNy5WTFilA1n3+yf8PJzdV+iIJ9FPZtt1Gaza7eRMQLBUKCiI
         GeRA==
X-Forwarded-Encrypted: i=1; AJvYcCVHq2ThXSIEE3GpUGy6Zk+EGjcu4/diHFk22BY2yZ3hL0ujgKDOOd7Z3Ra2xAekcAc2WYISfXWZeIZ+VL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6RjJMDJWJ5HnsMcVw1BiVdKC0a+WjfRO6OoB/dNU77NANh3NU
	GespHOzXoep8xo+n0ZfwWpKJBPbWTVbtBHU6OpHrwqWgrFoUYQRuvBw9F5TP0pSKK1kn5n6lQRj
	BPTQ6WNh9AVnLZHFFh167jIbNF17x/HqT/b2YARu5HpLAjuYXKNf5HqsuMbThd5OajW8=
X-Gm-Gg: ASbGncvPtWNrHYSwl8vRtvOKg2xQ2gwCSMqkjqif7a+QiNT8ncLkr4xoaa8dyhMh8WP
	3O9hYJWYUCYhj51BNpIFT7qNZtCePhilnxffH1WVcXeB1ElufKPCGiVJf7aFIeuAsJ+BquL54b8
	gOEq8FpmJZGmJyuZUVusO59Onl8kjoPac/9TtPJvc8Jkd/RAi0MjGtgaAIsEOj0B0KwmbONjprg
	w61PueYYVxNX02GFbdd9br/zwSbHFQXo/7HJ57IwO6P6CifSK6O5yi8EmwHJ1xhABsSMOoWJD14
	eV8IZNh6A71BaPDuF1RsMMjrIwpkIJcobKWKbi2UtwHiAUKD08P8z2IwLz0HHuuCa1lcZOYaCEc
	=
X-Received: by 2002:a05:6214:248a:b0:6f2:c81f:9ef0 with SMTP id 6a1803df08f44-6f8b2d15058mr139256326d6.28.1747562387945;
        Sun, 18 May 2025 02:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvht8meUEeI5mfZ3Bwjo3DPt0lB/3QmCreZafC8XgUYj5EDksJoZDDg/reTUlqAbsb+namaQ==
X-Received: by 2002:a05:6214:248a:b0:6f2:c81f:9ef0 with SMTP id 6a1803df08f44-6f8b2d15058mr139256106d6.28.1747562387580;
        Sun, 18 May 2025 02:59:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085f5d17sm13804061fa.113.2025.05.18.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:59:46 -0700 (PDT)
Date: Sun, 18 May 2025 12:59:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 13/14] soc: qcom: ubwc: Fill in UBWC swizzle cfg
 for platforms that lack one
Message-ID: <k57pmwohvnubbsxjxc7y74nkuayiktcrolbqlm5vorayrifemw@uuou33ffwdlb>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-13-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-13-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: ls0yReBClKLYRgJDG7mKPjfPMUt2bPrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NCBTYWx0ZWRfX24L2huPhpAod
 kiDFHEv9APz/jGKpTdALo1MLZ02vZtNCSe9fuca1+atO5+uMUSDk4JXVgEzkkedLfrmV3VZS5W3
 BabryjIqgSTNwXJwgCedXsclf6qpcOA9fKP6sBcIfsR6gVSUslGZzgJ74NFzUg8l0LIYojlencX
 q7iOL95dEJqPkz0vd2HVTjR2xrmq7LoNYHZe7valTZZTUBY4Mt907mQZBjEZQEAQo27YKyNEX7p
 +un843YZSt7XrkwKv5pDjxxl/ZvP8c6e8WYcbJLxJlfHKKuA0mS8vXURpklYrc5Ogrd9OJViF17
 5yiNGxychDkhep59mq5SscYcOM6QRpJgbdZAAJEtp+VmehcbuKa/migbWKsWxNexuKLwrnK0sr+
 EXxeQqrgof5rjhEn7s/ZjRiBXUAoD5TIWUaK6cmtGqVWZ6zpf0SsVN7Y+f1BBU1+kK+PCX8A
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829af94 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IaUOA4i9ptLxJl9v6jsA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: ls0yReBClKLYRgJDG7mKPjfPMUt2bPrE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180094

On Sat, May 17, 2025 at 07:32:47PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The UBWC 1.0 case is easy - it must be all 3 enabled.
> UBWC2.0 and 3.x require that level1 is removed, follow suit.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Ideally we should test this on relevant platforms, the commit LGTM

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index fe874ccd8df6acb4fac65f7d261afb05861117c2..a4b730dac6c4aaa609d41b2782c9dc522387d8dd 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -15,12 +15,18 @@
>  static const struct qcom_ubwc_cfg_data msm8937_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
> +			UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data msm8998_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
> +			UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> @@ -70,6 +76,8 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
>  static const struct qcom_ubwc_cfg_data sc8180x_data = {
>  	.ubwc_enc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 16,
>  	.macrotile_mode = true,
>  };
> @@ -87,12 +95,16 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
>  static const struct qcom_ubwc_cfg_data sdm670_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data sdm845_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> @@ -118,6 +130,8 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
>  static const struct qcom_ubwc_cfg_data sm6150_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
> @@ -133,12 +147,16 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
>  static const struct qcom_ubwc_cfg_data sm7150_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data sm8150_data = {
>  	.ubwc_enc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
