Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15101D5166
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747563454; cv=none; b=WA8022oihy3O3zgRIwN7Fj5yrMsr3nYclsYKpdbKbMYd+jyQ+dHPSv8evqKE0CHW3Uic5wf/lAC1lzDAbzddn+LnA7KzEW0aT3o7t6tBH/tibHMOtSd+U6HfFB6wZoiu6MJWM2sR/8ZPqXv7doNpDDV1QwqGLUZERbfx88UoLEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747563454; c=relaxed/simple;
	bh=culphbIjQKSAVceom6DR+nNUbn37uifukgB0Zsxyyus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG6bPGDdIIYEYNGcBEy74ayeDkQEj6WUKkZHgoGmDu2cOUyuKlBiCOHNZ2Itrv/U8qq7mBFywHVknmKpaOhJgd4QuVX076uN1GbVOiL49RNTEk/IaoZwRyiUFa0qE+/Csd2siPaoh8OxU3aiEPoaDbKFv1dHQH4QhSVAd7T9P5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqYmtgij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqYmtgij"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IABCGO007399
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xhP2SUjlpvQeAhCQLCmidVhe
	TvgcNKpIoIA/DfNmF0w=; b=aqYmtgijKPblFq2cjnFlErAz+xLO8o76zBtq84Ey
	la+rOgsOL8EX9MRiz/0iCCQOwjc1F/zhnepbT7Sei80RzXhxDebmiMjvFZBG8T7z
	8ie0S2evStccKTK+8jPrHmUNdE3ypmM3ipv4MThgKjcfF/bxWX06NHRd+eu5yA0L
	3MqRFYhSkNO+Zd+H0qR40nANgLa4w89X920/ntIYSHrKSzCIlcoaFGWEfv6uiEDp
	OvID5V44n5pM090M1QltDdYZtANQV8mpOWwHJAnQg0eM2H4RfxvkRxMO5Jn5IM9O
	X8oHMAAl5W0RcrYaBIyZKYfe18lM8TmujdGbB4ibxqduig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcsuq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:17:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2b50a75d8so54746096d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747563451; x=1748168251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhP2SUjlpvQeAhCQLCmidVheTvgcNKpIoIA/DfNmF0w=;
        b=aBzxun+AJRa43v0tAshLmbzp1qjmPyaTr4M0WUEMISCeo8XzoSYytoL6wbPn3tkeMu
         j5bxgZWLAqxyoLt+Rr59o+I0bwbDj08FHBusYC5MCqzMMCBNNBbawPPQ1ARU+hcbz8kc
         xzuglUeWmconD1W5fA9bzp2wg6UbsW9RXUOlm6Z2lHuhPw689H0LrRmbzw3VHWSS3laJ
         Ewd4O/3RZ4OZK6nZQCFsTI/peow+yzAk4YoRKbryZOOIavKEyYeaQf/7B1EW2c0tn5W7
         erB+7akLOTUwrM4DMtuKofOYZy1yF8nCkPMSHeCBa2yjft5Ctt6C2cq8VOqIBBNCXVJM
         Vnfg==
X-Forwarded-Encrypted: i=1; AJvYcCUplG6mHWqz5GJ0Lud3KD675pGqPZasaWi4r4+F2H9jhZzvwGF3lc76JTUzBRk1T8NIkMNmzjPxoxKbUOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVflujVpiUAU9N5DroJAdEEI1F+B2P+wcqzrOkQtNwMHpM83dl
	zmF7ADCqkXG3LzfworCNfDQbpt/vO6NawHqs3d24NGrTHZ3JV5oT9sJQHslN66y7Xhd5DFjRYId
	Ea5kCBRCJnPz+Q/yY76aMPFAKQBHoRQkH+cHKyBxyiU+lddl+iNDMBRqHTUO+VSCjPi8=
X-Gm-Gg: ASbGncsMpGOfQMgevdh90wzhS8HBr0D5CG5xs4RodgQUxvmqNF50P3ssT3fDZjrK2oI
	3/InXpvrh3poMtEVRbguSvkHBQaYUSUp2aqspJhkuXocqj8IkZC9++g0ChHb7wAdfI+KJOx11Gn
	fL+jXTawZ+rapMDweQ6w6vD3PQ0r3VcTXqYHhf1iMp50PG22ATgv0IPuiomstabi8EY0sf1lyu3
	dHpJkErI2VDLBDp08tunYI3suPeTbTGh0t1CdSuYqgPMb5AtgK+uu+C3AhbEwK/U1Kxzg9QZGjf
	deBEbPyAXIUDivC47AcmVAW7XUdrUAIStoAASQn425baiNU9TNplXBUNFsGTVkcd5f8BnH68nd4
	=
X-Received: by 2002:a05:6214:252c:b0:6f8:9a2e:170a with SMTP id 6a1803df08f44-6f8b2b67f15mr145182256d6.0.1747563450919;
        Sun, 18 May 2025 03:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/QdroMCAgOdxUn8/7R10XW9Bp00ARKToH4sQUo+1oHi7NcXV+IvTd0N1GOa+Vj7DtOkw51A==
X-Received: by 2002:a05:6214:252c:b0:6f8:9a2e:170a with SMTP id 6a1803df08f44-6f8b2b67f15mr145182006d6.0.1747563450612;
        Sun, 18 May 2025 03:17:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e8bea4b0sm1319372e87.19.2025.05.18.03.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:17:29 -0700 (PDT)
Date: Sun, 18 May 2025 13:17:27 +0300
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
Subject: Re: [PATCH RFT v3 14/14] drm/msm/adreno: Switch to the common UBWC
 config struct
Message-ID: <dwhxtakgpjzd54krxqxpocpuwrk3cgh7sfiel4thgawsolo63b@ty7me7p6a3lo>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-14-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-14-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: 476GNtcOGw2GRYxBN9nB2bntCfpVZI-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NyBTYWx0ZWRfX92HtB+QH13Pv
 z63QpRECiBRoyp107zt3H8ddtveyS+77N7ufS+f3AOmJR01bhF4YsHuiT69OA1opYdeDEwDcEDM
 qwuFa82HlIhoPYWgtEltWGsGNnYKql3bQzgYss+kwHcguxjIVI1pNIpHyBk/wyyR4Ce6OQN+zlR
 Gv6CZRapmprsMQ60xzraOyPCjj3psO8dAurOMvnjTsK6xsATZB9hkIbEghDsDJtfXnG2ElRdpuB
 W5NYyzedAsMZf96/cM2n4YrTfuw09wrCMDDGY0s/+kIzF/IXLSVNA78pMQLAuRatLgm2HlKFIQ9
 g7pRyDU2j+4PwzwSmKMRNBHmg3U41EaMSNsvNfQttBdi8bHD/XjdRQh/IGzi9okVF2oihsarR0D
 7rTrIG3pWi3GFY/jZ5VGMCqvrb/Wo1BuOAoET6wKvLmY5UAqcshw6XlGU6cemt+pR7JGNaxi
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829b3bb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=dxQFKmM27UcP91gbFjcA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 476GNtcOGw2GRYxBN9nB2bntCfpVZI-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=880 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180097

On Sat, May 17, 2025 at 07:32:48PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that Adreno specifics are out of the way, use the common config
> (but leave the HBB hardcoding in place until that is wired up on the
> other side).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 ++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 76 ++++++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 +--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 +++----------------
>  4 files changed, 60 insertions(+), 87 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
