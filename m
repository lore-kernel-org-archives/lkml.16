Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C6822A4EB
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989008; cv=none; b=GwndfG+1qCSc6iaoOlmEaull03JNhEkdUJxPoGNAo76dLJCn/WRrcjMVy6q2GOnYb+xHgFBcXz627+m6RJoHYyU9CdYVn3dmtZPC1XndwE+QA+Zv4O/AAQrR5ZhnSyqFuuUG9gFZExxsP4sFkcsP1X1xbSXdTl9RCLBGdLYE0Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989008; c=relaxed/simple;
	bh=Ba/qEJqFr6Ls+4+wQI/kPTBtztizrY6suF60TaJ7cfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlsF5EctlIhxZvNNexbxfkC4IBU5drOVDF7ZdMACCkzcnjZpcsKXiDTzb5Bglkzlrw98rB90CUoc0IIKF3cp4W+PCUcs/cU7CY0biizCLBKcEkHA6xSajd6jVcYrXcoV2OKOi8nQUirOBSvwR2pXAkTOkraGJvp9YQkMjOlAmQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpHJpQN0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpHJpQN0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N3EMhA031739
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VfiheIwlbsPSX3tKRqcUN7oc
	TCW0r9qBhyKUU/kzcNM=; b=KpHJpQN0dwtJLO+HTWzFKrFnk7bx+iSwn8bK+dSQ
	OcDSzPCmLUMrm/kv9g/5xyF0sMhlh7fYHwVBpNLpRtNlXPqjfnzO2V7n7/shn76n
	H+1+qDbvv7oTE12vRufyynS784yTKkqgKG3HYryJHeGvRlw6VpH29+fp5d6v2mh+
	O0EljvCWr36c4t6relmE6w4GeExam1CEKbOEzDi2Vv2gXldPFq+aLeAFJRke+mBQ
	wi4GT93K8pVkXpt80tvRVnaalOgvdiYPtKD4WUzq3WLp8LDuhgYoZIqJPy7cXJB0
	SOeAYJIab+0mlin0k1dpH1a8nO9fBiWQkDml+gGCajTHSw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c27yde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:30:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d3f48f35so92321536d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989002; x=1748593802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfiheIwlbsPSX3tKRqcUN7ocTCW0r9qBhyKUU/kzcNM=;
        b=F0dIZc6Up+eC/Z1nTU8kN/8m6bZA8f3A0b0AdjSuaLg6ATUHxHwxHUeD9k+FcI4EZO
         Y8/1ucZNNJCd7ZTCa1I5Ft+TT+yW91mCKQufnIa4akCnJwS18uvWSgm5x/m7BS0oEO99
         ua85APoRfDZn2mw4Fpc23ce9wgK1K07IxkqryhFTaQuXz7wE7R3VWqMjonBbM/MXJsi2
         UFt5TBgzKWYkQATfmN5e/G9t5+pckX9tfgUhbK7vCth/DoJ9x+A6aNpnW5uDhehV11gR
         JkeXUsjnbD6lpA8CoZWbuwV5xw/YtQRRF80xr9BGekotB8vfHXvX8FiHuYH5g2uHEa23
         07cw==
X-Forwarded-Encrypted: i=1; AJvYcCVTXepq2qGDrRe8ozDOIT/H7bu7VztQVUSTRofGDQ05eAY7s5Ha8SOWHbMxhSeprtK7X8hUt/b9+waWO6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAncG4zsx/aqP9W6uzzWz1hOa/AOGz6lRAPGoiXVUbzN5yY1Y5
	LUnpUtp9IImhHnIdtWAqrnDdYR9/+NJWRIMcFUCo0UhFRLBBPJD/IjZQmH8cIeMlo5YwkGRO/OZ
	AoAQXeWXlsNNJngK35t5N4CPr6FRN8V9wu4nAcpBaPIpB6VWh2feKycbASXal6uN74Hg=
X-Gm-Gg: ASbGncs2SFQ02JT2GKsJqkmKM/UIZI4FQ4KdjCS7dGaEkq+fRW5bN2Y3FAnrEFFx4qQ
	dR+99U15cA01uxxtkOj+d8zsQvw442aBtISxdGJkUgfinqkRghCy/cMMdAcXZTNXOmcN7ZkSWsf
	W4jHxZXR4nh+b8fwv/ueznL4Hif0tjU7xawSpfikZGbVFQyDUi5Ce65sNN+6KrctrC0Drgn2pmt
	Kfngeqr/F+SP/UCXKGTLmupYHLvxPfoJnmBoz7mjmcDkltAwR7AEmFNWAxWJ8Dowe+gu9xh77Yk
	CA4DZf0EGNm8qJzqWlyv5S1KdAeXecIchMlbaQzqF2Rw0S34/maQs8hgSPSvvwYVn7+RATrZjPc
	=
X-Received: by 2002:a05:6214:2aa1:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fa93aa463fmr35204466d6.32.1747989002042;
        Fri, 23 May 2025 01:30:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQTPt4MTIbkICZvOrh1skICymAaWmqgOHvMqVvofwa6vGpCOsSPPMr6URNTP7Fxd27LeFefg==
X-Received: by 2002:a05:6214:2aa1:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fa93aa463fmr35204156d6.32.1747989001635;
        Fri, 23 May 2025 01:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551faf6be77sm1933997e87.84.2025.05.23.01.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:30:00 -0700 (PDT)
Date: Fri, 23 May 2025 11:29:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <dlkrweid62i6jz3iexahbludm32hppzen2odjx27sxfe6opt5c@zqnryzjpzqoe>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <aDAbxAnCN1lGGcGH@linaro.org>
 <aDAdax7xdeDsvQHB@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDAdax7xdeDsvQHB@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfX/I0PvCjJLNkC
 8kXjjF67ITgckQyLIKDbhTJcByLXNUeX85bXmScHU3UIL7WAFs1Yvv7qr09BV6oVLBjau0buGp9
 dnHZk582NZRcXRReOYXe7vnUdqkITcaGjTzbi+RWJd783sAOXr/v/KuWEPhtU+SaNZ7dwtMc7J7
 pfCVaNx7gk2TvRXm1QAw9sokIaEtrN0La/6XSuhY3ozW9eGyShhMFwmxeDtMQIU3/Y3oOlmuzGr
 +YskLCUF+n7XlgXZANPrKwj60QoppRA6HqvB8s0g551CZFJF9R6tdYPA+YcVqbxRQCGGbYv459m
 tY4CleIfPeiVTYEi2INVT+cxQKvSJpma4Kgk508o45T/FNq5qzG99fmWVvFaVZZo2z1IBB0Z7Zm
 qOyxsu50KMsyCrswyH2ibBwNV1BCCN/3XUglSwSeV1lludQRkwCZOFpJ1FKdCsz/8Esg6dUI
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=6830320d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pcGS-iR_AO2RkNitFtoA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yesvx7VttVy6ycpTm38P7K7s5bjsi2GV
X-Proofpoint-GUID: yesvx7VttVy6ycpTm38P7K7s5bjsi2GV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230077

On Fri, May 23, 2025 at 10:02:03AM +0300, Abel Vesa wrote:
> On 25-05-23 09:55:00, Abel Vesa wrote:
> > On 25-04-30 15:00:51, Krzysztof Kozlowski wrote:
> > > v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> > > differences and new implementations of setup_alpha_out(),
> > > setup_border_color() and setup_blend_config().
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > 
> > > ---
> > > 
> > > Changes in v4:
> > > 1. Lowercase hex, use spaces for define indentation
> > > 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> > > 
> > > Changes in v3:
> > > 1. New patch, split from previous big DPU v12.0.
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
> > >  2 files changed, 94 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> > >  }
> > >  
> > >  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > > -		struct dpu_plane_state *pstate, const struct msm_format *format)
> > > +				      struct dpu_plane_state *pstate,
> > > +				      const struct msm_format *format,
> > > +				      const struct dpu_mdss_version *mdss_ver)
> > >  {
> > >  	struct dpu_hw_mixer *lm = mixer->hw_lm;
> > >  	uint32_t blend_op;
> > > -	uint32_t fg_alpha, bg_alpha;
> > > +	uint32_t fg_alpha, bg_alpha, max_alpha;
> > >  
> > >  	fg_alpha = pstate->base.alpha >> 8;
> > 
> > For the 10-bit alpha, you need to shift here by 5 instead of 8.
> 
> Typo. "6 instead of 8".

Granted there would be a next iteration of this patch, I'd suggest to
modify _dpu_crtc_setup_blend_cfg() to always use 16-bit values and pass
them down to LM's setup_blend_config() callback. Then LM can perform
version-specific shifts, utilizing either 8 bits or 10 bits of alpha
channel values.

-- 
With best wishes
Dmitry
