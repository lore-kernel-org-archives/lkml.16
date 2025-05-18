Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545DA211A28
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747560267; cv=none; b=Tov/6Ye9Xu4aIsfinq/ofOcZypuBS1jSDJhoN9lJeFscIZpGEyoI9XlrOxfX+wFGHgEgUy1qY1OoHfKXAqJz6i0NxuSAU6Sc3vKv/T7aj83kDEcZf1BCvTK91C6cHG4wJuxB5kYQcCBzDVbtIuSERgxJ1q3flLq3SKYPtz6PuDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747560267; c=relaxed/simple;
	bh=hWysVJMbOZ6iQqPzcJYa8eXNwI2zL234dGpZfx1pQoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWjg34RGuS/woKHcYBwEpTg90HXSmG18guLkvlDZNT3SqCubAcoOc1XdCluVW7AcmRdkJ6gnskYNGNW7Y+gobBbrodpr1Sxc392+oLuSPrXgOZepvaF9epR14XEPSGJWHbP9X/gct36Q+ywBktGy6JgzJx5oSiydJRNBNl8XzvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQKz+doQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQKz+doQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I0PmMH020337
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8adgWh/hWNFS/Xt0M8yK5bfg
	fpi+Em2QHRbR8lIk0N8=; b=eQKz+doQfwzx7JurT6dHNy6N/tar0UJZncyIGAV+
	zoO/Z4AdHSX2XkbineQUuh93Y4jBo5FA1VPz99MsWTfn9GbE0gD1Glv5a8Hlrql2
	jBZMrXwDJekjOtuiUjpE1aVgUPdG0bI6gr7BciPFMS/Di23rm+f83a8Wp2R+wM5m
	hUdI0e/0Agx+9al8cyhrlyEIbqkhFNOA9RO4WzOFD5ARulH4dwdnOxC/AOIkFzyT
	Y/KAcBaj1GU33EcyoH0cOkqDhzbxjNKGLY39KsnQd4iu++nI3ACV4moSJe8v4dxa
	ZIDTVuUSRFHAxr476ZvRkToSgStFrAYeOCz8Urt584/pLQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsss6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:24:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c6ce05e0so17138146d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 02:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747560264; x=1748165064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8adgWh/hWNFS/Xt0M8yK5bfgfpi+Em2QHRbR8lIk0N8=;
        b=bBMAAXOdAKusNDxRfZyxP08lzoAiU8WoabjrmlTXQhF/SmSUyUd0TOsRlOVutkBEMg
         4hsNve8ObnH6SL66wKp8Ltd2l4Q93FdpXPkEOpIUcvZDf1yFhOUS3r+hkxIikMcMVbGf
         zvvciSyFv08Qzq9ZuD921GiUWHSoi6Njjp1PWxZRN+i7Q29nqw29x60ts9y6AP9Xwtz7
         D5L2wjYOJ85DJFF7nN2tOuFnT6z4SY//mORq9hMethY7TmftYluTcsWKzrh9MpApmCcJ
         Jwudn1UwDbegrOYr3trgKnivrLjNnZwivP7m07qkGj/GHHAAzFwZWAcbg3yG5H+FKmE+
         DzuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtWHcJPMw9uPdWQNl5ej+mB04tsXOpTOLZwB1eFrTiLnmkwX2tzMXKT/tF6axgXBLDKfBXajf0cHr2llg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4JYLp4x369cxpsyxT4DuoE44jy9tAfxOcdy7/hDSAECg8TfCg
	MzitKI2DYpB27qew3spwMsHkg2x+S1CuCvmc9bmju/81t5IWGN9tjjDRyA4IlRIQ/CZQwYGy7xj
	lgLPj0gCMATMe1iX3KAX1RSIgtid78LNFw2W6VjHkuWuMpY9lwasIgcqb8FvFOxXqmJI=
X-Gm-Gg: ASbGncuhWfkgk73yyvvBjvLASxqANYs9PG6sW+jcWCfFAZCx7X5VZJVQowyrtmsUUKI
	ndnrhMyBqpKudxI4aj2F6j/gJZZcxuaHf1uvAoZXvy3JZmvq/KH+NTIBz+SpMFeMYQO5LiPPKc9
	eKY9ltxxmv3c0Hb0FMLxxAeEDv0YHvABNDIYoHVPMeZF2NlDhNRdN3ncMcKFSJvqrEaEVPvTz/a
	6RfpbFkVmFzEHKiEgwCjLgmzZums0YDJnBBmAStBE/o3ZQhv0NgCLTMg0r1u0AvWxtIaJI8qt1/
	jOI2uCQvr1xlZuCrFPAK+Skh4GUJnxe/M4iyc57nsWTxZo/7YZy0eFw/MabcR6sOXzBXZWF96M4
	=
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id 6a1803df08f44-6f8b08b7479mr165682796d6.23.1747560263947;
        Sun, 18 May 2025 02:24:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUs9JyXLQMqLiJw+mJBxX8dsSHNhuvKCwCIcelIHVBLDBUriVWMpazHRFkx+FOTJbGlzEbsg==
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id 6a1803df08f44-6f8b08b7479mr165682586d6.23.1747560263591;
        Sun, 18 May 2025 02:24:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702cf90sm1359428e87.177.2025.05.18.02.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:24:22 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:19 +0300
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
Subject: Re: [PATCH RFT v3 04/14] drm/msm/a6xx: Get a handle to the common
 UBWC config
Message-ID: <6mlja3igqehhxdxgfyhlmknmcvbz5j64vxhevejlg4om6xuhkk@6exwpmczaoqr>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -1zpwuL4uWelie9GKmEZGU1jROMRtDa1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4OCBTYWx0ZWRfXwoebLLzKcTi3
 rMe3iUKnLXqvX/wgWYZtnTVlVzy+1v6vSvcidahjcKeHUo4zz0VJU5//C06N+uThuQ5mEBMOeON
 Siuq28STNNITrQ3NGqdhxy6Xbq8L6y6OMT5pGjikPFDBwM9cVG33j2OYrjooBhFgwQWUjG0ma1i
 iFFWZi5znasEE5wTWueCVrb9JrOGkjWr5fdmP3kB9D4d74ocaM+E4j3VHiZnmDZr1BipqH3Etof
 x+77s8hUV1NeQLXaW3TjctyxT32TRwisRhoQzqgkj0sJQ29DvsZwI7NK3tiLY9fsQXOLCBON92L
 H4+gRYG9gqTGqlIkxh/FcKCUcipuL6bbXNheWwhLb4ImF2DfVuIEGGPHzM9OiFumk7v4/+wIn8T
 OlPJWrRa4N7Xp2OjuXYuaJkONG2mJAn6qIAXuGGXGsXGP0BFTpeNee+QbCZ+v3+9Fju9VIoZ
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=6829a749 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=93Yf4Y-vqGi4v4eIoEMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: -1zpwuL4uWelie9GKmEZGU1jROMRtDa1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=992 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180088

On Sat, May 17, 2025 at 07:32:38PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Start the great despaghettification by getting a pointer to the common
> UBWC configuration, which houses e.g. UBWC versions that we need to
> make decisions.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  2 files changed, 17 insertions(+), 2 deletions(-)

It is possible to build DPU-less DRM_MSM driver, so DRM_MSM should also
select new UBWC CONFIG entry. I've started a work on splitting GPU part,
but it is not yet merged.

-- 
With best wishes
Dmitry
