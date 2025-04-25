Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA81BD9CE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607623; cv=none; b=dpzbt+bgLCVnVouqjC8JpHEQlfXJ5KjrsyLEHU0mvUqkb7392Yw+2i7drZ1JaLFz+CxgctEY7wl33A7uECcRDC4lhzX1k1/XOHhoUHta85KoJGQdjDmOMJ8JE+x+cAU08wZQSL30XTp3bbThnkRa4JsEltsutQeiSnXewJ/KdSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607623; c=relaxed/simple;
	bh=8eEeoNBuVrR/ztDvPzSdjZW+Env88fQ2lTVMpmvhASQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKaKCVf3lzi8SXK+Cr4CiT7P867nsYDsy0VoUhWzIl9yOOUjn4HZwNSrs5pjEcUwa9kltOGUFOx2feEmwhyUyNQ+BG1nz39dmChdph6lcC9Vbr8631d1M8byxhwx2fl+wXyoC4G5LaW0IMvcVopShs+Yj3RN4MKkDL9/oHtZK0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcEM6FEY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcEM6FEY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtaE007900
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kynr/LDxnO/0j5Svx4zTYeWD
	nbMxvk+4kjf7vw9ZD38=; b=EcEM6FEY80+DfBnp4YVx0uTH1I7C6OPuUN7ZxNBA
	1YT2X9/TsEMyD64lUtkGaWlM/+O9u8z9tH4LRi2J0YJGfl7LbDUOG6JWvagwzL4C
	5vbl6FBsYroOz37qdb4KEZl4QwXPKBEjdrJ5net3wxdGWIWgUl4WM5XYTeNd04kg
	za3H4oi//SMeeYVQMJAzSAHVQY7atWWUoZbNOD8bPRM3MMjbmrp6hZu/PO8SC8eq
	/+9Pus2z7vzqsiquXVVav9ry4EXLUpj8IbkAEdabFcerzs9/0AIhql7DC7MpQUcs
	AbaUB7v7LVjd4hx3Ybgmq01ywrB1ljPiCP/Z66la7/ItKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2j3vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:00:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47693206d3bso55680401cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607620; x=1746212420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kynr/LDxnO/0j5Svx4zTYeWDnbMxvk+4kjf7vw9ZD38=;
        b=f3J0N9ax2fgTrPHUzyS8gDup2siVq4gJBUnVXx4IBQlmhQ85E7J7UmGHhBgyz3al98
         1oxPvpu2LMJd1xwsgvvnQsBBXgAkPn1sQhYHfnfQL+zdL4DlqxoFz4OfVz/aiWL5wJ5u
         kNuWvCie3mqScoIMgmwN3ETldo9eVrqU/E4iaFA5d6iIrivwN2GdEegIokt4HoIABGS5
         jtA4Y2/OZntNl/NdILWonF27WXffCSJdt6l/qM8JElEo/9OOiPs8uE9Er2gx1izzKyVR
         wqIth6ZneSOWIPIOrZcLlX4ENTeVJPvy4oA6UdYx9v+n8wt/vr/oKzLPG/vjVBHYh5uA
         67bg==
X-Forwarded-Encrypted: i=1; AJvYcCUxweLCnUSlQo6Ay8RgXUaJa9O7BFS7GXilmph3kjgzBLmybMoDSO9mVgyUJaDZj/jKAbz2Te1cZ2au3TA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvjQSXPQoBJUcdkCXUeXgijQJ7G8HGP4qKyvRwQsHaHMtFGYv4
	GxjKWKKFeEdJW13eQVQtetr1giqeD3VsU7Ve4P23BOgJa9n7hkSjyM1AKXGlxJXSXFdU5ydoR69
	+IHiKs4C++58ThZITobrduJee49441YaaAeOrLKOWRtrI2jYjey4LUtXpNR4/dPE=
X-Gm-Gg: ASbGncvLFrv5tYXaBid05UXPPRV3Pi0/kno+sgO5cqCh1JWv50z/vnjBoVK0pXztPPL
	BwJpt8r7gYxue5RzM1bUcD8AkKEXbycvFaAN5s66yYYDUrkFSYEAthl691TUEHqY1fgVECbrx0g
	ggJ68sP9i4qmSAQ9E/koWCaI4zk+660q2JgYxk2hWH6RcjuH/Ol2+ayBlXY+KmI2exRs6m3F5dh
	oC0Gz9bs9U5xnty/BX3c9/0/HrSji1Lk2x0NRC5Oa2e3VqyhpALHbVm+CZktD1Ao/TLgOkNaLQD
	SNAvTXTnHkzZg/A9RNmX65N9tiXt9qcqArLGrmtKcaiGYBbMDVHFyeE70rzktOvBWB/Wzn3JEDE
	=
X-Received: by 2002:a05:6214:1d05:b0:6ed:1158:428b with SMTP id 6a1803df08f44-6f4d1f90d04mr10767826d6.36.1745607608507;
        Fri, 25 Apr 2025 12:00:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV/zQcAEoUhIcUkNwJorB5dQ/+HT+EzchzBf22nnLbvROjpmuT256JVRjN9I2KxR7k9bllog==
X-Received: by 2002:a05:6214:1d05:b0:6ed:1158:428b with SMTP id 6a1803df08f44-6f4d1f90d04mr10760926d6.36.1745607604984;
        Fri, 25 Apr 2025 12:00:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3a67csm694856e87.80.2025.04.25.12.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:00:04 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:00:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
Message-ID: <6kgxzonjqfmup7xvpddlk76w7zcnpf6c6x7isqy6plxk5los5z@hznswxtjoz4r>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-3-f1b5d101ae0b@linaro.org>
 <aae55674-1ef1-4cf8-b1ef-e2b67c086b77@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aae55674-1ef1-4cf8-b1ef-e2b67c086b77@quicinc.com>
X-Proofpoint-GUID: addIh9K05V0RXDi91Q-tMzogvwHPcNoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX4wrNerf7VlLv ggOrHkQnW2esyrHs0XpQ+XEZ6eHsjqxofCjmq8hLaLmyIyxRBNJfErS/PeQG9l22K4Ul3/2Z3Ck h/LdQLlO/7ZVYw6yqG6HgF5A7SNFR0dLHlqKXwq5SDmJcNJBZ1KFCUQ3Ls3uw0WbRz9mloEt4gL
 K6kHm7D6c8shzBad1o0WL5NQoY/qe64L/A9/vJgvARaP7FiaaIzrFrjpaGN3sG29iy8L1aMup85 a1VvOSJ1GZbLEF7SRIjNVW0c7vc7LH0oH7CHIBrT7DneXVhYVwT8gnJLhyM0I+fuXBZmX6fDazs 85Ut3AzEH7enQNqXW+pa3NONZrDg6ieffUSPz2T5hyZ63SJRMy4xCHixgkeoJ/SKlWeVuTOYWv3
 teaVKRmvQ+EpUixTaNBYwpaHjUHc1aYGsgn1yGl/1DuD5J5u+Rx6VvsKSb17fndBE7jgcQ6z
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bdbc5 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=lXfSKzHXarEsLVuZBnEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: addIh9K05V0RXDi91Q-tMzogvwHPcNoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 11:34:18AM -0700, Jessica Zhang wrote:
> 
> 
> On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
> > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > 
> > In order to support more versatile configuration of the display pipes on
> > SC8280XP, enable SmartDMA for this platform.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Hi Dmitry,
> 
> Seems like Abhinav's signed-off-by is missing for the patches that list him
> as author.
> 

Good point. I don't remember, why these patches mark him as an author,
but lack SoB. Googling doesn't point out any previous patches. I think
the easiest way to fix the issue would be for Abhinav to respond with
the SoB. Another option would be for me to reset the author.

> Thanks,
> 
> Jessica Zhang
> 
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > index fcee1c3665f88a9defca4fec38dd76d56c97297e..923afc202f5195fa15bcfc1e141fc44134c965e4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > @@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	{
> >   		.name = "sspp_0", .id = SSPP_VIG0,
> >   		.base = 0x4000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 0,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_1", .id = SSPP_VIG1,
> >   		.base = 0x6000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 4,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_2", .id = SSPP_VIG2,
> >   		.base = 0x8000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 8,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_3", .id = SSPP_VIG3,
> >   		.base = 0xa000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 12,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_8", .id = SSPP_DMA0,
> >   		.base = 0x24000, .len = 0x2ac,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 1,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_9", .id = SSPP_DMA1,
> >   		.base = 0x26000, .len = 0x2ac,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 5,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_10", .id = SSPP_DMA2,
> >   		.base = 0x28000, .len = 0x2ac,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 9,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_11", .id = SSPP_DMA3,
> >   		.base = 0x2a000, .len = 0x2ac,
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
