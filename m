Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A71621770C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607204; cv=none; b=qEL/3EUSmF0HcdOQDN7UUhIBzF4vssrJjbEUjpH7EBb0v9rcKE/zjFbAgVp7XZ/OklmCQVw8RFy2GoS/5BImyPfBr5BrCvg83iLfuGQs3CMFlgi2Y/XcG9UXJ/i2Ixg+CThh7QsxN6y7QxBZE5JeVx5Y41TzyI/Q2mR45dwkvJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607204; c=relaxed/simple;
	bh=m8U+SaJlJqAcQf4j9rulo89S9cGvVWfX8qZgOZMg1n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUmvgLFqPcaVjTunmz55wAsLkpoNq7JSsKwqBnW47zPgrUo62DfLC/7NL6434fAg41zUraBXUJt4i5mencte5wAC7crnDlUTshKt52HHIBuGyXNMqhhRhAVSNS2DPuCjVGL2VBTZHZOdyhcwFnzMZK3nUBrTEpYz5Kk50MohzQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ccly0v2N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccly0v2N"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuEn011082
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EyI1RYrs4XXWK6Jk0wNG+VY0
	wHQ7kc01RAG4sha1MzY=; b=ccly0v2NJWjBD/RWATeomyvHcfgv2NaRvB99ZMGJ
	Oo24ULU1DzVtNt0YzDnlZN2U7vD2b6/y4zJ7QPS4qHl2Hv3mbL4AtGebIEuBmTWT
	mzxz61C0CPyx0SgzVNPjXDSzL8+cJytICNAA97YlShxCGt5QWkeugqJFf+GDaz9F
	bqXCfPMw9uaktthG38TBXppReKEX/lxueCaWhIayEvIVPesUdzPLCcUAhQeopy6H
	66O2NhkauzuI8TI8ko7HiP22/KUW468Klp+z3nGXHoHAhIVkuFcdayLhVzsbJLou
	n7/8+rGttxuO6pCewEgBhJM1ipURX2WNVLS1jNjZPNNgzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j6e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:53:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0b0cf53f3so384651485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607201; x=1746212001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyI1RYrs4XXWK6Jk0wNG+VY0wHQ7kc01RAG4sha1MzY=;
        b=TgUl9OYBznJPTzvuL8/gaspAta89pPx56BmHuSnZoVbMSOoZVDbArf4m0em+LPnK6e
         T+sdtOl9vTjs/1zgSF/5qhseZ75PO9uxgDq1h+c+T6bosV8Ho/jOQ5O8OKwbchg9hqw8
         lyjeNNZ2LuDmJiTCGHNIDs5ntjHTZk07KwFbKXMgr2cGkc3I4Z5MsS8bwQOyjh4jWF9w
         Q6lQihSwFVpSezmJEvGld/EbBOmFdZW+EBtEH39IJRYjj4eEuRa12zfuXbNtFVIZMPRV
         ODjBi2vV0/Vn2nt82LtS3ncoRzOL+5+zNuaXhaXHZCh9mMIeIxstzBW06gX34hdM1CRg
         +lLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl+iSkglsJiPthFk0Zg+xdDjiwxbGhdqn91JcBPlTVBod0DYRQund60ZbH2pqqLXwYRciTjpAtJGnJYEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMyVy0zZnwOtI7/ggS1bGWGvIf1Kx7VWXVLF7kphMDIp9OLaV2
	iq8LpeUpdZWR2GkAazj2Dgz25hr5c1mf32Q98wvCXwW+eqSuDZdDklIOak3Y4weq7vwi6NX315Z
	GxeMDUfgMNkW+f5DX1nSrHJG4lZqgzGm0QoaukEpRB/OGZEi+2f0PRniiv8BRc/8=
X-Gm-Gg: ASbGnct+/y10N7JB3rETGHEbVsptpUA4MbYQsgshg+dsqNxvwlR156EBYxnBAiqLq3a
	hN4esKzGEHbyNFKeHN8yX295p05UnvsJnmSBwT2S4XU33VB4cpBiwRIc9amnQspi17Q+FVGl5g8
	wIrpoEgS5E6KeQlIxZyPCw8H1SPQeQsXM/Ee10NVB992qcb8QplM/3MnqKeZOQYoQeUF86dCVnw
	DCNOoVpxJ6y0ACDRE1DFc7Qa7FgLtmckK+zeLrxBe1eBjNHskT9+G8rUuWCvwVx+elSMcdtvE+V
	cefpvXSclb2Fl9trKDm2Ep6Hxva+3GBYAJUsv5rBldCNke8LgpqZd+QNpOMbl6crR8PPeDXjx4g
	=
X-Received: by 2002:a05:620a:414e:b0:7c5:5e9f:eb30 with SMTP id af79cd13be357-7c96687307fmr83995185a.15.1745607201019;
        Fri, 25 Apr 2025 11:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzpHwv43BxegR84WM3cKeKkomXnTuNqjngSJPB2sfsV1ntCPBMFR2CHLVVFpG3qFUcYD6E9g==
X-Received: by 2002:a05:620a:414e:b0:7c5:5e9f:eb30 with SMTP id af79cd13be357-7c96687307fmr83991685a.15.1745607200558;
        Fri, 25 Apr 2025 11:53:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8cabsm690134e87.258.2025.04.25.11.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:53:19 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:53:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm/dpu: enable SmartDMA on SM8150
Message-ID: <c62wafi73jwdf7qz5a7gp3xqhqg27aifn5ollr7dmufeaeyldr@rbzbtpbfenkc>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-1-f1b5d101ae0b@linaro.org>
 <bf242898-bf47-4235-9086-745bd4f05acf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf242898-bf47-4235-9086-745bd4f05acf@quicinc.com>
X-Proofpoint-GUID: EbeMZMoENvkdMxqSjFwqUa1OvHt_Lnri
X-Proofpoint-ORIG-GUID: EbeMZMoENvkdMxqSjFwqUa1OvHt_Lnri
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bda22 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=jGqEa9bayqSivQyTaeQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfX9oiM8JQRdfQK yxNLisdlmBQekGcUS5PIoXNF35LdFu05fYE+7Fa1e/zG3QtWgBaqLj76fPSmxtc34D4UArUJUdm crPHMQOTQnEizBku9UjAKd4E4/b0FU4vH3hvxwY+3g6T9/pc0PpMow8Re8ABU0Vh0Xj+srIsK7s
 nb8WMjrfuh0djdtUBD+8+CvWiVO3VRXq3HCVr6x0FOCAdo3yQtrS4j4u8CqXgWng7UjTeMgnTW6 XIr2zi5MCt1+YoF1gkvT0piTj6IyT92/eyNk6YhE0IkzsjROvDcWRe/6rRAQHoMvK5gcK68TIrP Owx4VOyV96w338YZsuWGHoVjyCYRZI84/c08IjFiIfwtHgnBYnTNi+hLdMCdYdxO6RL7ameW4S4
 ClFWhz1bMPYOe2J1R1ZOMErnmBgwoTPikpddh84ad7zkSGa6mMmMk7PCwio2/1q/bds5DClF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250134

On Fri, Apr 25, 2025 at 11:26:20AM -0700, Jessica Zhang wrote:
> 
> 
> On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reworking of the catalog dropped the SmartDMA feature bit on the SM8150
> > platform. Renable SmartDMA support on this SoC.
> > 
> > Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
> 
> Hi Dmitry,
> 
> The code LGTM, but was just wondering why there's a fixes tag for the first
> two patches but not for the other catalog changes.
> 
> Is there some context I'm missing with regards to this?

As I wrote in the commit message, SmartDMA for these two platforms was
enabled previously, but then it got disabled by the mistake in the
commit 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries").
For the rest of the platforms SmartDMA supoprt was never enabled, so
no need for Fixes tags.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > index 23188290001ffb45563a9953a9f710bacb4dac89..fe4de5b31644de33b77a882fa21a18f48ecd1790 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > @@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	{
> >   		.name = "sspp_0", .id = SSPP_VIG0,
> >   		.base = 0x4000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 0,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_1", .id = SSPP_VIG1,
> >   		.base = 0x6000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 4,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_2", .id = SSPP_VIG2,
> >   		.base = 0x8000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 8,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_3", .id = SSPP_VIG3,
> >   		.base = 0xa000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 12,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_8", .id = SSPP_DMA0,
> >   		.base = 0x24000, .len = 0x1f0,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 1,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_9", .id = SSPP_DMA1,
> >   		.base = 0x26000, .len = 0x1f0,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 5,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_10", .id = SSPP_DMA2,
> >   		.base = 0x28000, .len = 0x1f0,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 9,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_11", .id = SSPP_DMA3,
> >   		.base = 0x2a000, .len = 0x1f0,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 13,
> >   		.type = SSPP_TYPE_DMA,
> > 
> 

-- 
With best wishes
Dmitry
