Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD533C9
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 08:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555242; cv=none; b=kS81YoWofFK2UoeqrPPF/MfPumcwqWf9kTiGuedhgmG6SK3hfc0n9uTF81xzwDX2sHR3HCmiLsQUyIYs6kDZcfmsbk6XCp4pLiSQUoLg9L844LAsQJJ7z53jYkXU66vHP/MfS2sKSnsP9bDhoskkXMIg0rBu+b1zecj8+1MG/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555242; c=relaxed/simple;
	bh=eEpOAGltDfZQrcPF5EABRdNdezAR1P/s0r0PFrHNgxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0mRAZDQ8z6km3nv0mO4bNAsENYxoD8HMuvWWENwnLPxP7n30/0rsm4bXhHs+6MZjL2MdE4cg5uFCYDFUx1LXpkPM+ZChjy4XWro/aZkWr8KEJqZBuSGOakSu4ldkG3/J2vurjrxla/PzEthetk9+iiR2LRYvaY0vPw7/OyZ4s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8AiQOaQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8AiQOaQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7b3mc023302
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 08:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M1hSROUXIIz884cqASZZtnpd
	DRy1hYWsqulvbnSF7qA=; b=S8AiQOaQ+pE5llTKK816AwTQwrikZRsMjbxfApB+
	eR7tEcghOsJ+FZuhw+P0+8AfonM8xnZAWctboybc8Ep1f2NNGrT0/f0vBj9BRqzX
	Z+QUX7kdNLNkh8fMmNd1+eIENl5jhC6x609GUSCgd52y4m40auKxpcKYeBzvoMb+
	grhZVoS9+8xM9RrIv3Xn7BS9lNDyZwUb1Ij5XwH7HvsTfL3a8UDc7zpqn/hG25O2
	T1DQOHYk8xSZoeC06hNn6oMEj0KSkMDBhSC6g2b59IhEUXGw40uP6txUwFDdeZlO
	nSWKowVBFtHunsDcUTo21VbPNeToMpYaG9OVX+lgfxxUfQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmesp92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 08:00:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2b50a75d8so53511606d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 01:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747555239; x=1748160039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1hSROUXIIz884cqASZZtnpdDRy1hYWsqulvbnSF7qA=;
        b=S9rojZCgF1yLanIF0thL7kga7TbtilojF5956THe7VIyp1wJEg7NpmH9lEm3D82Cvc
         cA8cfe5fxddY48zcQQE4ynMj5IVGJEXYa7UWvjIqdr97mmV1sXbj5pZ0t+pttX1Wb5QC
         V5nDcC+XZCHVP6ER7TPJMWMmIJLMkqFTUtBWWa2Q/tv8mSy3egp5Y6UdjkCtsC3mcayF
         mVmWS47OSF5JXc5u5v8EaV+jnxn3lhQy3JrWQsIDlYxtQe7qT509kTF8ZkvaYr5iIi47
         OWQO2nX2A2sGrOewVZlvEgorpXOKCPuONhkBHQ8e4koKKrwMSf3p/7k7P47Ni+djvv4b
         GjJA==
X-Forwarded-Encrypted: i=1; AJvYcCXHRXKO8lSSUjP9tQxt59+GcQZVdyFNSgjXYtZMwsQqKffhlT5q4FMt9bwY50Jx5QRyCoqI7WfaqTFaFtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbYz4kkoDWbOTsRxeHFsAFvQTJ2Rq05xGiuSq3rc0hiGC/a6ZV
	nlAbfkJsSM/r8D/s5OykiSTSz9IFjnr3v3v35YTRcJQzDdFGnsV6yuQuncJkMTOM1eOSzm1ar/i
	M1P3tf219y0vGQDt9tgWvJhTdboPSFmHYGIwx8tnp+DMB2QeSU/+SNxhZLo2FhQHoRKM=
X-Gm-Gg: ASbGnctw6yiA6wfWYTG6a36C8UE5jt2Y/g/XXaG2Ougy+R/qcE+Otl1n7GokgcMPzPk
	zWkzxmkLJCozqhV0KU781Cou/3CanZvgC1Dc6oKiu9ZOXjGRFQQMSiKVDVUzaCcv2PRRMHPPbew
	aoeEIY9QzVF46/mcV7xzvxCdKGCPPlMr9v5xKxfSPzoXffLmn6R3oczJNOJHrOhyPoguyitOXng
	J05vaaFDyKpexoeS5phPW+swPaIkwvoqFjH9Ibb0HchUxFfqg5zTJtnsk0GzOeWh7heokINN0hD
	am/UATX8fAEyRl8/XitodX5/paSnq4eo4Tl6Da7Bl3iW+D6hRMGDfLSN/W25AIvkumuHVVxm5S8
	=
X-Received: by 2002:a05:6214:1244:b0:6e8:fde9:5d07 with SMTP id 6a1803df08f44-6f8b2d43931mr128485986d6.26.1747555239341;
        Sun, 18 May 2025 01:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7U6yVFqqgxWTJepkwkMTRStZXikQatyTxkBmj5oyJSp2W376ewY4h0spqmrjhxjC95bxVtQ==
X-Received: by 2002:a05:6214:1244:b0:6e8:fde9:5d07 with SMTP id 6a1803df08f44-6f8b2d43931mr128485546d6.26.1747555238986;
        Sun, 18 May 2025 01:00:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca0b9sm13615991fa.32.2025.05.18.01.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 01:00:38 -0700 (PDT)
Date: Sun, 18 May 2025 11:00:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: qcom: camss: Add qcs615 camss support
Message-ID: <dw37t3kefhxtzmygcdkdtl6nh733qbx6cpqmygaanbq7pg42b2@lutist5sdt2e>
References: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
 <20250518-qcs615_camss-v1-3-12723e26ea3e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518-qcs615_camss-v1-3-12723e26ea3e@quicinc.com>
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=682993a8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Zj0UxLc9_TXd3n-uCjcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uLsGUT0uuTnFiRDcCO_AQN2Nvyyg6NuV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA3NCBTYWx0ZWRfX5imukqKfgHjz
 c/RIZx/5zZUeCrUDLPYOPDVPdSDjxrjhMXjRdBcycL+BstafQLbE4pq+WHrHn76PZFikwFCQBxQ
 ODT8pWecRfBZATh9pBw8oRLpLO9ZOoCFDw0tPAyajCaeJaI+bcBQpB9qjxt+GNQx8hUgM4WuAlr
 PrN0cCTABzhjJbwi3IM4K9jMR2o74vrm7b6xy0hdUzcUs1YJyR5Piiq5zxVH7NQaV0/JTbSUAcA
 gzGMuT3GXqatAuhQfrlh5rWXNskfjzkzWEifrBNjpstqJB177JiPxJvri3nA5x88k5wbpC9cbNf
 RwXE+CQ4RVkINZlWMthIQYpBRxVnMwvGaRCTgF4+YINcDi0KZydb0IXwmGVnJLl7CJ1HFBheVd5
 ujgj4lrXkQe2yczyVCfMGDE1LBIhZET+/+uuytyi3BzX496hqJH3WydyS932xBShtwKRbEwb
X-Proofpoint-GUID: uLsGUT0uuTnFiRDcCO_AQN2Nvyyg6NuV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180074

On Sun, May 18, 2025 at 02:33:09PM +0800, Wenmeng Liu wrote:
> Populate CAMSS with qcs615 specific hooks.

QCS615

> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +
>  drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>  drivers/media/platform/qcom/camss/camss.c          | 196 +++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h          |   1 +
>  4 files changed, 204 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 3f3d875b8a74ee8f6585bebd29629bdb16eadb28..3b58b938ad419b6d482314e23b4f51aae5f8a59e 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -824,6 +824,7 @@ static bool csiphy_is_gen2(u32 version)
>  	bool ret = false;
>  
>  	switch (version) {
> +	case CAMSS_615:
>  	case CAMSS_7280:
>  	case CAMSS_8250:
>  	case CAMSS_8280XP:
> @@ -905,6 +906,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
>  	regs->offset = 0x800;
>  
>  	switch (csiphy->camss->res->version) {
> +	case CAMSS_615:
> +		regs->lane_regs = &lane_regs_qcs615[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcs615);
> +		break;
>  	case CAMSS_845:
>  		regs->lane_regs = &lane_regs_sdm845[0];
>  		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);

This definitely should be a part of the previous commit.


> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 63c0afee154a02194820016ccf554620d6521c8b..04e2359fccd5f61b27692caadf2855a1fde31ed9 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -77,6 +77,7 @@ enum pm_domain {
>  };
>  
>  enum camss_version {
> +	CAMSS_615,
>  	CAMSS_660,
>  	CAMSS_7280,
>  	CAMSS_8x16,

And, as a dependency, this chunk.

-- 
With best wishes
Dmitry
