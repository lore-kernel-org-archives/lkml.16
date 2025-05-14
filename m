Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EAD28CF76
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250104; cv=none; b=eWpUjUjGqRBA8cW1N8c5BfnMp1PncdbzwQcSnPRXLSawYnIPKsZurd0vK05aR8zN9kMocNZbivG9pik5CLgAopU8ws2wcw7k8nJgXThnWQeTE2UibzUbyfAOpOUHQZSK3p90HHEGKxeUtHaVjxfQPrvCHGUhZzAaQaUrX70Jmjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250104; c=relaxed/simple;
	bh=iiULBkW+A+3L2DbNYgvzwu4y/DM2eJd7Yutv/4OpIGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOiaTgH4esnp2mwvYSKD4CLpumFiPk3F2RUufEobCiXxgWvHgocasrfHvLhCcI8quuXDjJ7L1XrbE8C2ZSBqYiwvLr7zcDtsS8vB6hIzFyP8h4l8uYrjI3KuDHx/JojqaBA3R1oFlIoB0J79hzXg0njonbcqQnLaJgGE/Z1ZaGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmK1PI8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmK1PI8Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EI6IQF002689
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vh7H0yLxNzQIQl3kX5HeQXht
	XXVVGd4YVC324hHcq88=; b=BmK1PI8YpbDEFywyps9bUzBkXATRBOuoq1qk0J1k
	8HDMFeHYixJV+zUoheAkidxTdW0/TLoprYNSVsRGQJEmYwU4d1vXhwCu+jdaixZI
	dVxajHBskTn4upXzTrA+83Spo8PMXNqtD6qHolFpKpxBOy0NZgvww0Sn7Rm8OLYK
	BpHt9A/2Hq9236dbMEJgGIpKjDIRETNPf01wt7MYN14GwzxjrM7FIce2JgKf9lHB
	/+WJmtdtlKHPxUj72Au/adN37tYcYIlaMomwVITGXokwF3THnN+VLoWScIcaWxVs
	B9nNh+S+BPhhfbrDNVa6J1tZ84TaQUaPMt15S4ZODgi7aw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex3tkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:15:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caef20a527so21163885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250099; x=1747854899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh7H0yLxNzQIQl3kX5HeQXhtXXVVGd4YVC324hHcq88=;
        b=v6a0Y2vRHj41UlfPJZ/KKwQKCiwHpqcrMt/0CUwXBY9KuDQ3MDjqy7lNTjEE0aD+J/
         pgZFv87li3v4EBPuw7hAD/441Ho5T3xJPskvwSfg/NqrhDn6aA9LkmLs00bQr3bzzHTt
         YpABXH7Su46jg9H4Ojp22V+T9Gc3injWreN9A6FvD4oIYg3mwfL/0WEpVI3ki/9psrm5
         0QqaQWu2k1ZPwiv/k5prqa+6CzrvfogYikWJn2NJOxCankciWMrriG3B1hk3tHmO34xX
         Gl9mAuekY+Z5h4VibbLmcUGgooOQ6uXe+IA8n3kzJoEL1PlCYoErwqi1xogRqxBLrU6L
         MP2w==
X-Forwarded-Encrypted: i=1; AJvYcCUubDwXPqRMqXRSf/sRF3PR0BbEd9x8xlxACzAqnAPGDR4P1KRhFlAthSa4e7OQFZy90JUYpvMz1OsCRB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfztgNjeFc2OG+CCxZA3bpS3n2VOO0ibs6SFw2YOGgRRRvcq1T
	NgoA5fw0nDBVReDBmOxux2eS38W2ARG58ksSRa8kCd2Mjubut7M9D2oLmmSQoleJPo5RNnR2T4n
	XDvY5taK79nqpg7FzyOKlsYp4YHw5lYi5ODd4JWihj0lbNR7DW4vUt/RQB8sP6JU=
X-Gm-Gg: ASbGncu4Evmh+P7iYPibSS+yUhFABFfCMkaBr/WDwLx1lC68gk1JXkf/TL+umCznn6N
	7Y4T94mpUJS1kHNPbF9UcftCgwasj69eHg9C3FUKZ7UBnDbS0/wSQ0snxWbJviN1sbSne+au7ca
	470c26dhFJjKhNQ0TdHgWoQmyEwHHM1A1p8zM6/vMdURQCICNFs12kE3bw/28p+s2AoV9tvrXFo
	fawFmDDE5tlB8RpEqTmmckbreVeV2ic7kTnZv3k6D/i/LuJIF+nONZ4oom6X6ubrlOtbP34CRqv
	rYE7d720Vj3idDWBbczT72oGof7O5xXq1wcH2Gdr4+UllHlWxByxIqTSOLz4Jn4x6Fo1r+mS4mg
	=
X-Received: by 2002:a05:620a:3954:b0:7ca:f039:7365 with SMTP id af79cd13be357-7cd287f8e29mr760419585a.8.1747250099354;
        Wed, 14 May 2025 12:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW1uLW0kicqfgbHoNdFUn95rpD1RDFnA/XLJvVUD+FX4xES0n5KnnFI6QYVl2bk5Get+Fxgw==
X-Received: by 2002:a05:620a:3954:b0:7ca:f039:7365 with SMTP id af79cd13be357-7cd287f8e29mr760414185a.8.1747250098844;
        Wed, 14 May 2025 12:14:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bee73sm2349244e87.162.2025.05.14.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:14:58 -0700 (PDT)
Date: Wed, 14 May 2025 22:14:56 +0300
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
Subject: Re: [PATCH RFT v2 07/15] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
Message-ID: <xzmvy6ulog67b5ibzg5gm37rvxerbwszoq3qr47kapj2rbjeuf@wr25nsuasa4d>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX+Z3X2weu/kKN
 +0+sctI7z6//5R7jdN9rw6U+VzG3A3Dk+IBrcCGIsPiklrPH3bzRm6VdZse7RcuNO8+wwffFtfs
 xsYKFhwPuXWubXiKfyTThmQt7wjNqiL33WPOuHdd4H31xM6D3R57oss7VgDYevej+Hb2C0QzYaq
 zIMKncBzxIT4gDnVCmn/SkJRmvhM6MJRxhh7QUWHBY01VvKiUE0WryIJSu0zuaCU8w5Sk0KFZho
 IHKLDalbdoxO5q5lggilhiUycVo4Xu+UzM9ixcUx69JA8ZVjhI527ePPVek3N5AsXArn0JoqfAy
 YmIdDBD+q6L3w+an0wOEsZwSDg0jl0mJPUbH+TgjnT0Mn7ii8y9oT9CjXIjhqRt+VlTxV3dTqOE
 z0TBNakFSs4juhOr4rL+4N5TD4EujALOmKzKxxi4goYOmbFLD0e5ULsaVV+WjtOTBrPORXut
X-Proofpoint-ORIG-GUID: yjEdtpEVG_UR-C1D9nZAhNXBqcGO8AFC
X-Proofpoint-GUID: yjEdtpEVG_UR-C1D9nZAhNXBqcGO8AFC
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6824ebb4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yx7l2LZIIY2QNE-vfc0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140175

On Wed, May 14, 2025 at 05:10:27PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This bit is set iff the UBWC version is 1.0. That notably does not
> include QCM2290's "no UBWC".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e7c89f9c7d89798699848743843eed6a58b94bd3..6af4e70c1b936a30c1934dd49f2889be13c9780d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -669,10 +669,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	 */
>  	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>  	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);

I'd really prefer if the function came in this patch rather than being
added at some earlier point. I understand that you want to simplify
cross-tree merging, but I think we should also simplify reviewing.

>  	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
>  	u32 hbb_hi = hbb >> 2;
>  	u32 hbb_lo = hbb & 3;
> -	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>  	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>  
>  	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
