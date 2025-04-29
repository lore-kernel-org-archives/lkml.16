Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420E81EEF9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928968; cv=none; b=ei+8aSOp6xW93rXPCq7nRASfL18deHEWWEbXdLElcDpJKH8T/9Yy9QIBKMj1OrjDs02ItI8w+NMM3oVSkzQgN/RAjj7Gpp7VlscMRs+IZoDCTKvBrMW09fca+06k44b26MntQxbfRdNG4wQVL8fyBIS+d229j8yZpPt1GsiiW3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928968; c=relaxed/simple;
	bh=COQgeNfKJjvwuvOsWE5I+CF+00x3Gj8zrYq55izzgt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYfcszYLABjTzsCkru6Qims1q3u6Vt/f4HKL5gk5xqcnwTn4JYbgo2Eer3Gl2R7wG4sYneYssTlVlkM8sYdZeyD0GxQi7RYZl2hwOoDEKO7u62wrJ2KGg/2l16lIzQ/C2K6BNdYNRuWIdRg2kCpxvNov3C5cf0bqp47wX2FQE0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TheRa7my; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TheRa7my"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TABh1r003054
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n6neZETVNC342qH7kNDFJ+hG
	N9sCBDLkRi5kj+90Mz4=; b=TheRa7my7FVsQXnG9WTVOK/1/f0bFVEaQFpTgwHV
	MKqLclqCxVqMZIPk8S/NSG40+RwsFR6Sx1HdEkn8hhsWj6C7SwY8e4DzFgtffc8Z
	baYT++07plw7XLAhNNlVTpnN8EkzfNLYwNN0qIXhsd//JuPHI8UmulkyUshIppnn
	6WFKMpdPOyH+d3H7riRRUE/tWVrokhSOI3ZjGlw2LZA99ehqfftxO7o6HXyauP2B
	6rkNew9Vkk42c7rAav8CGx0wqvjbaY4lsQOfbiP8s6td7jkBVA0YuX76CLa2/ODC
	VOSi6ainnKow095XNv1QCSLkwIb85LuiwHZiilPYZ3ITkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsbbevv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:16:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso1013500785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928965; x=1746533765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6neZETVNC342qH7kNDFJ+hGN9sCBDLkRi5kj+90Mz4=;
        b=e95iPaEo1uFU3MIE4c4ZGaaGGvsZUUejlnJeD7R++u4Ht3l+h/OGsW6+GEjAc6bcul
         0MSIWyd8+qW3scoSHKeibKlXX4Yez7Di+HbS9uh5zb9G2uLufbHeBjurvupyhlY7RVd5
         m2XtJlWQhDvHn99LeeXFKpWSEqn/Qpt01bn4WIIivWY9w7ZBfHiN7CIwLPVbMgk2E9uL
         9apPlBOHX1rtWphjt+VSCF9iNghhUdxA3ecm6q6UV874Ka3RV/J5Zv0hkJYVGuvlaLOO
         tPSG/Ro3I7nt4na85T3PU5jXAq9zjBMrYUG685dCHwMpSJsEKvtB/D/h5jTEuEqJ9zEL
         FC2w==
X-Forwarded-Encrypted: i=1; AJvYcCVWzi2w8zTXpf6MtJq3cx5wmnON9okkOatNMMlHcL/m0BvuXEElDaIYY218gbJjwTd8rFXhcsGczsn/bKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YymHpsuyDwAkZDlFMEwhrUceNPhV6Q0VK0X7MRX6RNKnEHXq/BC
	tkQYLqaiXye68rlSbe516oo+dG1YsrzzlvyCQ9c6qw851pZz+JshwL/yWXkzg4EHtddYcZgXmRN
	P10AVc23xSUqMxMZbMhigYbJ4wHNmwfQFFfQ9sjjZFdDRimS+qqKcVmX7vcXvpu0=
X-Gm-Gg: ASbGncuMfKRmagB+gtX9IXhhZohu1XFTe1s2ti1R98yl8XnRY80CedZQ7LlEl8Q6+Yd
	kwpDY+sAH1aYhA08fV6b5QMkvJx7kHUdCARs8MqJuhxntyGsk3Tt5TNFbV3Okp8INVOIFPVUTOY
	I4xajrFZOK6Lt1Rsg9LXVQF3r4YtL45fJLr5Uc//FqOv4lMn+eCOuBQ7ugWAlcp4hjGycusL9xc
	9FNATodwrnIatRxHGnNrl0SSa9SYc2r8B8GqlRnhbu4DlO1f/K3laYimD3na2XV/AghU/Yl5sQc
	G8SUItZLXh106qBpNgMts1DZGsJ8Evuz6N2IIX+YRRXHXLcyDOyXIHrYvcYhZLuvM2unBN3pKKk
	=
X-Received: by 2002:a05:620a:4104:b0:7c9:5d8f:4d09 with SMTP id af79cd13be357-7cabe60418bmr361511985a.34.1745928964980;
        Tue, 29 Apr 2025 05:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs8uaXttLX5fbQqqhvFbfdQMse8HccybmzieyiB0uxgppwccpl8V+Gy0PEioLWVPPX8E7lww==
X-Received: by 2002:a05:620a:4104:b0:7c9:5d8f:4d09 with SMTP id af79cd13be357-7cabe60418bmr361508285a.34.1745928964607;
        Tue, 29 Apr 2025 05:16:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8979sm1858087e87.257.2025.04.29.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:16:03 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:16:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: drop TE2 definitions
Message-ID: <iabwfwus4ze3jwekayyfgwhu5bdoerebp3sehisc7rfeic63xh@552zbik6uvmm>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
 <20250301-dpu-fix-catalog-v2-4-498271be8b50@linaro.org>
 <628f3361-6795-4e69-aac2-f9f3200eb6fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <628f3361-6795-4e69-aac2-f9f3200eb6fe@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MSBTYWx0ZWRfX8wrwumqRNLJS q1ulPz8DzOr95Om8ZRMmervqjgjsoK8TWVIZzuwVpx01uzLc0LFO8EezJW4Q+mZjFLHzHdEU2Tl sUwOU/DgdWjTERmQqhH5Ksd9m1f6kBJFrdHvriG9/9JVJr8CUxGi3Mjm4+4GggT6ZGKhbFlfuZd
 FrjVvVBcP/OiuDMnzYZ0ym3yTbxTzYazj8JPSSeoD+Pl5pLKr63Eb0xFK2Q6XaooCrIVbD7IPkf lqB8mqC6jeAfDBzQeCC8+rbAXgrjTTqvI8awIt5SEYrHwrMwLml4rDiTpL8yM6kxVANZqpHM0Er CE/xj2idK4HvuYO1aiLNVZvLM56MurR8leYVyUTXMuIZmO46tWmMshN6Xp9mke1+J4yll2Zm1qO
 3akhv3hPD0sk90Xx6XpAoHAl7SMYLyCYby4t87PO2FeSwlLHNqI7PCVikr5T72O9OhoMkmtd
X-Proofpoint-GUID: xHcb1jz1-WhJEQS1JXL33QzLqlT7GnRM
X-Proofpoint-ORIG-GUID: xHcb1jz1-WhJEQS1JXL33QzLqlT7GnRM
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=6810c306 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=0er1AAXFZ9cMRBjTt-wA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290091

On Mon, Apr 28, 2025 at 06:33:05PM -0700, Abhinav Kumar wrote:
> 
> 
> On 3/1/2025 1:24 AM, Dmitry Baryshkov wrote:
> > Neither DPU driver nor vendor SDE driver do not use TE2 definitions
> > (and, in case of SDE driver, never did). Semantics of the TE2 feature
> > bit and .te2 sblk are not completely clear. Drop these bits from the
> > catalog with the possibility of reintroducing them later if we need to
> > support ppsplit.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 17 -----------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  6 +-----
> >   7 files changed, 19 insertions(+), 40 deletions(-)
> > 
> 
> <snip>
> 
> > @@ -465,22 +459,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
> >   /*************************************************************
> >    * PINGPONG sub blocks config
> >    *************************************************************/
> > -static const struct dpu_pingpong_sub_blks msm8996_pp_sblk_te = {
> > -	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
> > -		.version = 0x1},
> > -};
> >   static const struct dpu_pingpong_sub_blks msm8996_pp_sblk = {
> >   	/* No dither block */
> >   };
> > -static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
> > -	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
> > -		.version = 0x1},
> > -	.dither = {.name = "dither", .base = 0x30e0,
> > -		.len = 0x20, .version = 0x10000},
> > -};
> > -
> 
> Agreed about TE2. I do not see even te2 sub-block programming in
> dpu_hw_pingpong but why do we also need to drop dither?

sdm845_pp_sblk has the dither block. If you scroll the original patch,
you'd see PPs being switched to that sblk definition.

> 
> That one is being used in dpu_hw_pp_setup_dither().
> 
> >   static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
> >   	.dither = {.name = "dither", .base = 0x30e0,
> >   		.len = 0x20, .version = 0x10000},
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..07b50e23ee954b96e7e6bd684dc12823f99d630b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -115,7 +115,6 @@ enum {
> >   /**
> >    * PINGPONG sub-blocks
> > - * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
> >    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
> >    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> >    * @DPU_PINGPONG_DITHER     Dither blocks
> > @@ -123,8 +122,7 @@ enum {
> >    * @DPU_PINGPONG_MAX
> >    */
> >   enum {
> > -	DPU_PINGPONG_TE2 = 0x1,
> > -	DPU_PINGPONG_SPLIT,
> > +	DPU_PINGPONG_SPLIT = 0x1,
> >   	DPU_PINGPONG_SLAVE,
> >   	DPU_PINGPONG_DITHER,
> >   	DPU_PINGPONG_DSC,
> > @@ -404,8 +402,6 @@ struct dpu_dspp_sub_blks {
> >   };
> >   struct dpu_pingpong_sub_blks {
> > -	struct dpu_pp_blk te;
> > -	struct dpu_pp_blk te2;
> >   	struct dpu_pp_blk dither;
> >   };
> > 
> 

-- 
With best wishes
Dmitry
