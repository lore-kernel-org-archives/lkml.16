Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84282219A71
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776663; cv=none; b=JDQdZJSbDPmt83JmThYYWp+JecgN1AQLs9Q2+aVQmqyo8jMVLVweiNeXbfjDek2nTPBA8CN2icMgGV916DonVOSoXFXlmeup/5gvG+oapBuUnavrg3bm5iHWw/EoLtOERd2ZGfp1rPtD7JXULWQxMVnivLoNrNcnOO6kZE+LsTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776663; c=relaxed/simple;
	bh=ykKE4jKPGHFreqbSA8L6TvTpeZ5J+yyk1+NtFS/HP+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOWOUmNBmDrkgi/IzlfS0A/m/EVps4bLlwQbgS8KP1esUEHJhba+xVgJPBUdjVfqjuwRYBPb6gzR91dQfheL2nsh7/y1Nd6+xYtw9cjNUnuQbDMilPVjTXOttbgC5Idov/xQiJkp3+eJmsY82QvAwFt8Jix7jfZwzBAMs37GuCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUfq7W63; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUfq7W63"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGjCmh031860
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R5feMRXUbS4wQ06aTExWKDnE
	JW6wVqMRR4Tp50ILFfc=; b=RUfq7W63dbi7b1KGny1t6dsAE+EabY3+vywKqe3d
	27NC2yVruNHQOmPf5Zmp73lDwI4+hIe2+HLxIVC0eBN5viVwKTcHFfE2EEOOJ7W5
	iJwe92mV39IbkWcvkYWMltCyMsXj7oai6OoLlX7ZaCjD+B9ClqgUAdPP83A7IarQ
	UfUGqM6vYxMN4xF5byOtVI0QIUZkgEok3D1hUylPd+XdvUp963cEXHbKSP/ARQ9s
	riXCGxiaYC0t7X62hTah0IZLjOIKwR4RRIGjsKiGvQlrQkcozJl2+UpnBroqWH+8
	zuGl+J0P7GpWktnSPUgCY08CHFdWxaOpsO0prRDSkdgmsQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf00psb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:31:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-87be28261d9so1817252241.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776659; x=1748381459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5feMRXUbS4wQ06aTExWKDnEJW6wVqMRR4Tp50ILFfc=;
        b=AEObgqEzXaSdIx1DqktV3rM9DNKITTLitakM8fZfzB1tdB3jrKjQ3i/1BBFh3A0xmZ
         eZQN2OaU/WCs8wdLyOdynQzsVU4Nj0eP/EYsKKXpbJZZo5sTJv3ejdJaZSGxYPI8fMqr
         JbDu3v7jq4hyap83l9ExoQ9attJTpV7T2/CmGH4w/QxseNb2uVTSaIDcmWGnBBKjtdOc
         RNF3n/jNQaZ1RcnNmTTDNM4lnxITAVfD4vWfUmEk+cgPC9NnEAMJmV29NswW6atZeYJI
         DBwJwGADF469Uuh6Ue57pgTa8nrGavh/d2wo682TNegI5r1i1jJxkokikwUhUKHNaZIi
         gmZw==
X-Forwarded-Encrypted: i=1; AJvYcCXwNI4wk1G0IVkMZylNizEZgzPz8QfYthd7g7+sDKq/G/7Dth/69sHZWyCmgByY3wKZzIpnxsyJmIzUeMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPFIlc88IufRNkHGBPvMTjB95tq+l0TM3KoCqr49gukIILaGkp
	lflYxMKDlQ4g/gfec9G7g583KIqCXEMTIyGp5zdqvpMvEgPWqEubbFllZyXUdvTwuSPoek+ecla
	BSMipdYUArqJQhjW6G552hnklafZModTzcdLI5D4NmXAiYTa3o1puLadaqqsiU3ZmThU=
X-Gm-Gg: ASbGncuFa8cbR2sJDPHNE9Pj+y0CPmDzhRG64fGF/IbcJCeJdDYH6hcQY1zJJMGK1Xk
	qWsT8uhz9J2giFqkiMc1TrlRF+1a1+jG7X8NeOBYRCvUAhoHAirIf7xUkiNPFYaJ6EU6Xoqdb2u
	Ig3LEpZjc3m/oVhs1oLhroFf/9OsqN0OM643lP7wsnOgrLOapbgCoOhdut3vdp/kXPFAwgwPi7b
	RwnEDztImEhxj3wUBj4/30JoHvFKx6QcubK1d+K5fl4qqFjSGFZHKNyYeBxK/SD0ErwnbxmEOLL
	MKFEzWnJ/aiew9s5vizYkfzxaXi1hjpcpPBnliM91MFzfpkYo7uhcpc9DLO9HZBdiS7XvHXfCDE
	=
X-Received: by 2002:a05:6102:14a1:b0:4df:a58d:9db2 with SMTP id ada2fe7eead31-4dfa6b586f8mr20307433137.9.1747776659099;
        Tue, 20 May 2025 14:30:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ0JUa9lKmM7vc8ucq5JsEnBy+m6NXYoj4X4dcDZidirslkniyjDSG1QivD3U9k2FiRTgBqA==
X-Received: by 2002:a05:6102:14a1:b0:4df:a58d:9db2 with SMTP id ada2fe7eead31-4dfa6b586f8mr20307392137.9.1747776658678;
        Tue, 20 May 2025 14:30:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701804esm2530018e87.152.2025.05.20.14.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:30:56 -0700 (PDT)
Date: Wed, 21 May 2025 00:30:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
Message-ID: <ym37vvngy3pvwreic56sxyneo5pkvuzrzqg7hu5x4g4smswalq@my2pe4naswdm>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-20-6c5e88e31383@oss.qualcomm.com>
 <ab430c92-ac4f-47a9-9808-ebf5c77f5a86@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab430c92-ac4f-47a9-9808-ebf5c77f5a86@linaro.org>
X-Proofpoint-GUID: JE7hIk9qDY-nE7MXpLvND6_a9-AS10hv
X-Proofpoint-ORIG-GUID: JE7hIk9qDY-nE7MXpLvND6_a9-AS10hv
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682cf494 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EkPWHm4ox5rSgcNimlMA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfX/kjYmpYSnKiV
 pQlBnGe8uduK3xn79XDncabHzIj278D8PNmfTxeHqFpZcX67IHe9fNUlkXp590lxI0IXNWhrV3V
 IxEsewcO0CZjdtIDPAds7Jd+EDvjobESdW26WzKBbbd6ragCBri5xqg2GGDgOS0a7RrC10gdNVN
 rhS1V2m/w8XdWjE5uX76cyx9ZBehLlzcK1hnnLMNIauLv3CzaLLH2I3eUDBQOMzvmNszc3SUlof
 Ls1xEeThoFgdGgDq7zR+bgfr3Es3daidfsq5fkswsPBXuExU0nwcakLD93NOvspcBAYHkucYlfO
 QCaQ0TYf/58BfDhhlT3hkezM9VBXRqwJAa3uYq1jnP5DXu9bvPY/wpVU0v5eqzfyZ1JP3TxHVq5
 cuJa08qoQjJe+XTXGaXs3VtZ/y6j6dTLyqFtZj2xkpZAfBo3eTbrJRhmvhd+sVOnzp+4YXDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200173

On Tue, May 20, 2025 at 09:53:42AM +0200, neil.armstrong@linaro.org wrote:
> On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Continue migration to the MDSS-revision based checks and replace
> > DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
> > core_major_ver == 5 check.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
> >   7 files changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > index 3e66feb3e18dcc1d9ed5403a42989d97f84a8edc..72a7257b4d7ba5bfe89ec76bac19550e023a2b50 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > @@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
> >   static const struct dpu_mdp_cfg sdm845_mdp = {
> >   	.name = "top_0",
> >   	.base = 0x0, .len = 0x45c,
> > -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >   	.clk_ctrls = {
> >   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> > index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> > @@ -11,7 +11,6 @@
> >   static const struct dpu_mdp_cfg sdm670_mdp = {
> >   	.name = "top_0",
> >   	.base = 0x0, .len = 0x45c,
> > -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >   	.clk_ctrls = {
> >   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > index e07c2cc4188bb12e2253068ca8666ce9364c69c1..23a3a458dd5c260399a42e5f4d4361b3c4e82c4f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > @@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
> >   static const struct dpu_mdp_cfg sm8150_mdp = {
> >   	.name = "top_0",
> >   	.base = 0x0, .len = 0x45c,
> > -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >   	.clk_ctrls = {
> >   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > index b350dba28caed77e542d6a41ceac191a93e165a7..75f8f69123a4a6afe8234a9de21ce68b23c11605 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > @@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
> >   static const struct dpu_mdp_cfg sc8180x_mdp = {
> >   	.name = "top_0",
> >   	.base = 0x0, .len = 0x45c,
> > -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >   	.clk_ctrls = {
> >   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> > index 27c71a8a1f31921e5e1f4b6b15e0efc25fb63537..6b895eca2fac53505f7a1d857d30bb8a5d23d4c8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> > @@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
> >   static const struct dpu_mdp_cfg sm7150_mdp = {
> >   	.name = "top_0",
> >   	.base = 0x0, .len = 0x45c,
> > -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >   	.clk_ctrls = {
> >   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index d3a7f46488a21e81a24a9af5071a9a7f5f48cdac..9ba9e273f81ab1966db1865b4ce28f8c18f750b8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -38,7 +38,6 @@
> >   enum {
> >   	DPU_MDP_PANIC_PER_PIPE = 0x1,
> >   	DPU_MDP_10BIT_SUPPORT,
> > -	DPU_MDP_AUDIO_SELECT,
> >   	DPU_MDP_MAX
> >   };
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > @@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> >   	if (mdss_rev->core_major_ver >= 5)
> >   		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
> > -	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
> > +	if (mdss_rev->core_major_ver == 4 ||
> > +	    mdss_rev->core_major_ver == 5)
> 
> Commit message says: core_major_ver == 8 || core_major_ver == 5
> 
> Which one is right ?

It should be 4, as in the code, I'll fix it later on.

> 
> Neil
> 
> >   		ops->intf_audio_select = dpu_hw_intf_audio_select;
> >   }
> > 
> 

-- 
With best wishes
Dmitry
