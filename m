Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0EE1DE4DC
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747560004; cv=none; b=nVzp34kk5jM15ASzqJ0nvnBlDDbOzg7QZ28QNzIugmhWTmyuJUC+CYrstsFJKG7/XrFfk5eEavgs3AMhn5b5HvkOym0XCfGHiNbo29qb8JloucOOdxNwM9d/8QEj+Vco+N07ShMnjMTcpV3T/BYeM9hcFDH8D3aGu/qqf087BZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747560004; c=relaxed/simple;
	bh=NwnDkYuJbO6baWJtDzJD+ac3AzyxLIg8DB/BTRCMFpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uecCLGpZhXNf/cbmdkumq0RXaHnUCyqq0kbOJ9YxrEBT/n6AbIVwlbeeEK/3S9Rgd4lG/L2YngAs8g5a2uU7Ky2MdSSyML2DOIRvhhlOfl/sSJWKx7GMyj5Gc9A2TDVmwJb+C6z+6FyK2e2NTW6zgwxMi7/VDLI+hrl5MwKcqpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IX1RZ8in; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IX1RZ8in"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8TM7C028913
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XMNoRzvP+dJ2IDW6flXZL2r3
	UaSuQqsk3IYkQeVyCxU=; b=IX1RZ8inQ8q8VUsI/v2YFQcc9kdmPTplfQM01Hjb
	cPad6MO5J0eXzOEx6nVFBWAYs6eJCod9sofTY9NUtS7qEn8bs2AvahcDnUTEqlD0
	zw7tiSviwuDTgeGXh3K7pOeUg2kfOOvTqVoDWzIXKDTyCK2u0s1R8Ceo/IuMbcpx
	MizoGebOi5NdE7/iFHf2OYPFwNGRbbGw/sv6Qoy3ubogee7hrApQy4m/gNxdCrW6
	pzOomQ0Pp+f9BdRAiDGR85tii3XOPb5ycDPsl+KCBk+THYgCLP+u3Ny8OeL+OK/6
	kMdZNgWO5gGh7hvKkViulU9+T1MsDP6SiNPvt056WFb4Ow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju79rm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:20:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d4461e7bso1685846d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 02:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747560000; x=1748164800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMNoRzvP+dJ2IDW6flXZL2r3UaSuQqsk3IYkQeVyCxU=;
        b=SjXyAK66AZaon3jZsuwT7bwRLRAjqXck+yF6NksRsSK4K3MkznGQDLvn+yj7XE0Wjj
         XGjG3MVfE7/V6bg5jLIDhjSpRCLxYtlyCDUQsqC22V0c2mEKwaZzPlEaAY9auRCOUwDM
         bTAfCI/owW9oNZF0XEj9C9TjFSqhPUi48ZZo45u3j/0ycrTRyRq4CtbVzU+7f3HExpuT
         TMx8pyvEN3kaSfMKpdgoaN3s8Cz1WyOaxyrF0uEAN/O7/dxKBF6Bs1nsg8iImTnkBzDq
         3puf4sTKAf8rep0XLsxzO5u2QOfdA76mBWh0yi04Dcu1JsY6PIc6g/Lmgm9qmBPsofoj
         FYug==
X-Forwarded-Encrypted: i=1; AJvYcCVdxXcP/F6OFvv2C0c37UC4GZaXN7pzy4A0kqDlb4SbfjM4kw9YJuZyigYqaekrRZnwBdc40lDh74SQFu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxokk0j3Iv8Spvggf45UY3iV1APYt2tP5dnTNg6vhWbOdxb9vnZ
	U5wQdq7c0yE4mc9Ayv3PSEG9qYlIyfnlpw1p4vAUtbwwCg226MrmeHVmsk2z6poB8OgOWCzhGgt
	Nhze2kXkZilEdfnAxSQFM8GhHuwmeGn0emDyoxpaKAF4D1IEoMF23gpiyYs2pKrNQjsI=
X-Gm-Gg: ASbGncvPCTXvrC9KSF0T9jmRAwoAqsnLxZQ/aHLXt2E3+zDuy9NwWCBh/luqS7XmUeu
	QDJyyeGf+vCA+fJbHJZbnzpxGg1kiW9V5pqtIUdl99fgXdgbFkpOliPYlS3KxP6ffivyY3xblyD
	z9lD6XQjnWNR+TWXElrDU3lX83P+swRghP/sbH8dsR3Jzxqvl0fRgz+uI7eZfSTd0Kd59MrcbIf
	wBaCEmk2J/EQge5gWQ+fmWNERc3XAuHu56E7uHIgZOzkJfdLPacD5O2K2GMP6d4cA80c9GmMqv3
	H0dZckOJ1pLyrLQo0TWdHRZbVxMj5HM6Q9T3v9X2//VGX28jA/Tpbmbykt781Z5+G8C51wYcywI
	=
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id 6a1803df08f44-6f8bfbf5e85mr91753706d6.5.1747560000348;
        Sun, 18 May 2025 02:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4RAss6MeIbi1hTLUR3LACX5ncJPrM6W25dlFKp7HPzQXdfR4gH1QWUq4qPYEW0IMg9QDf2g==
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id 6a1803df08f44-6f8bfbf5e85mr91753586d6.5.1747559999984;
        Sun, 18 May 2025 02:19:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b170esm14076851fa.15.2025.05.18.02.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:19:59 -0700 (PDT)
Date: Sun, 18 May 2025 12:19:57 +0300
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
Subject: Re: [PATCH RFT v3 03/14] drm/msm: Use the central UBWC config
 database
Message-ID: <bcsoawpz4kxuyjl4e7gvmetqtozchsazpengerm7wmkkundpal@2picdwukiail>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-3-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-3-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=6829a641 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2JnZN4u0TTcLH5SyeT4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: qt_yz7pl9qZigbeLfpePO2SMG8oeH7Oh
X-Proofpoint-GUID: qt_yz7pl9qZigbeLfpePO2SMG8oeH7Oh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4NyBTYWx0ZWRfX4MS/dMAlo9FI
 /vacjo+99l+2oRHqikER6PldRmnLcHXmYxnLntAwAqVKmB7zga3wbk6Hpli6Z/UGokz8o41R+/i
 GYsCT91yzPpKPp6k7C1TIzgfNNPCzi0K7OkzoM2oT94TeZ9nqInFkDbs9UGumO5s+S1EyPQs/sJ
 7Hj0RfBD3ROCe7CK6n+kkn+oKXcxP3uwY4d8ipHGY77pmVGzwyevrvPxHynGfZ2UOVo2aejcKjD
 9R/nhCv/sZRuwyK8MtUFQl0aKu4C7TCsecjlKv1Th3FMdR/ye4RViJDtjVBWU09YkuygbVx3hPC
 dylbRJZNQ8wWQW1cvzNql+MijakD37OKPS+cyWsETzO07iFj+RC2d/bJ3iv3ahkuppPr6UyoCfs
 aThQhFN0tw/V5q/homdZ8cJtwiZgy2YHlnYJKAJaT0zUVD+fEHDYPKc9Lusk66uyxWpXuU5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180087

On Sat, May 17, 2025 at 07:32:37PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As discussed a lot in the past, the UBWC config must be coherent across
> a number of IP blocks (currently display and GPU, but it also may/will
> concern camera/video as the drivers evolve).
> 
> So far, we've been trying to keep the values reasonable in each of the
> two drivers separately, but it really make sense to do so centrally,
> especially given certain fields (e.g. HBB) may need to be gathered
> dynamically.
> 
> To reduce room for error, move to fetching the config from a central
> source, so that the data programmed into the hardware is consistent
> across all multimedia blocks that request it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig                 |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
>  drivers/gpu/drm/msm/msm_mdss.c              | 327 +++++-----------------------
>  drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
>  10 files changed, 73 insertions(+), 309 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
