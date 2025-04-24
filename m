Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B73F221D99
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490160; cv=none; b=J/yEXjUh0OcTLkeYL+7iWNyllTj/nIhefOw2xK16MP9O8OzJCMQuLgEOiUpHWeEACgrYmBuzWEMrAlYpj7B8CBPNgz5W0bUhQut9Vmp0iN1vy/X33J9i36v5WVpQk6aRas9jJjB9ZSXe6aWH34+c8VqF7Hg99giX6hoL53ToN9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490160; c=relaxed/simple;
	bh=BAtigd51U4uYQawH2leKL2DrNhD2xbURj0nU4NCxYSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b68VV6xECaW9vxIT0Kl6Gbt4G4+x6+MdhIdTYkv7zYIuhVI8WWwZtNr44okihD/hlrSvodCsxSM7proEYtLn5gnSKYiGO3y9UJnw/24qdACBHbWnqR4jvYBypLJqw7WHWmcCrePFjjE2+UOAqndHEjRBXvaFr3UgzZxBesjCGd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljeIjiWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljeIjiWM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OA2rYR010294
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SRAxpDNuwfhW3PHrfYeTwTaf
	uh1/vvz3kKMzJSGCp2s=; b=ljeIjiWMTqg6x1v1U/Tu9BxU0yP/PtChw5oBLEOl
	stSVbEmAl1+g6WEzxTMaGkkBD4kyCQkoWVbgIyB90Z/MOrVj4mtYm+P8ww6EVTwZ
	Iy6SLeNIkw3xd5dCQDUMGBUhhnCIpIl8t3/ax+ls8q0N2eCnTQl36deQRr9vR5SM
	9RyghjNu9WyhCaDgxwSm8j9py8myvS5/MFeEplfsvzHxQoVSp5kc27e05ODhXB35
	21lK7kpSQ/SCUgZQHa8hCA8KJpaG4fIb07TUIUDra5xWT2RDCbK4eXXKprulbInB
	YQ9N70nQ7VKg3OJVqTEgB38qvyUb2ilkZ5uym6JzrHvhcA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3n54c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:22:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ead629f6c6so12945476d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490157; x=1746094957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRAxpDNuwfhW3PHrfYeTwTafuh1/vvz3kKMzJSGCp2s=;
        b=sVwQUsTy/mCirCALeEN9DXqRpLX1hC/AkXHVA4vB/yJHfPnevInaEt/oH/GI+71gFN
         m9DuHfIvIpMY8qBjS/96hqkopjXANdgD7BeJsAFru6Up3FomqOxkqgKOiBVOgaYNDQMH
         yXJB0kpiBXenBgo7HXaKYqmOGnUQosrnlCrZCmE3p7hgr65cmjVI2wxEDdtw/WTYPqJ4
         ++ZwGxPdwB3qc9ebbFOdJKBzsB2Zk//sBPwM+WLljeKnUgSoSztMFaz5pAj01aI8Qp6G
         PdU891+8YYtYm6qgAMEAM3DTzsa3ca5sqCggcRvQHL9pUHil9NV2dByA3JD3ihOSAL5D
         w7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVHO//j/ZQCv5cRb57xi5UtldBFja1sROJehs09oHrBP4rPvMJU4J2LwMLgFgefF/h79tm5bvjkxhnSbsw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5nHiDKMhXQGTpu/swsAjJS9rSGvyvePOU3HDUgMSeB7LW+q8H
	ZkoH0B/QO7igsnp8UcWPeOMkzQi/OQJ3QV3byUh/mRsg4sJ79JZLFt7Cx+iadPDccyoGodj/ejc
	7fUrdCbSvrc+u7OlSsmgXMZ6B9LlYONBfB7C/OTRtvg6gGJCsHZfkwalwFmiTHhY=
X-Gm-Gg: ASbGncv+smlQUWwQN8tVHfRAoOlyQCgpk1O8ZZ3ZQMgfnQVNSPo+Hn6ainD6brYhd0f
	TKcityh+CgSO9Cdp7LC51dAU6Ti13NMU5BeVGB1UrnN1DNFOyUpdPWOoYKLrwvRt9T90hhT8xXh
	m67++b2abpagCSyefR8H0bDmquMIssFCwfliYWO89tA6M/j5wQs0ZW/E0K+LuzeKhVWRx2NStgr
	dtTgMAv2T0f8GA7cfj3vWvrgS0UvOO54FN7aOLnpUcjPXBS67oHakAhK9dsHB6OWHd12/FznF6y
	d5ibna86GCEUf0fKOEkKcAARg3stJGBU1GBWnCK6RIhCJGUoFH4njLLDeLwL3XtS74griGBtfjM
	=
X-Received: by 2002:ad4:5c48:0:b0:6e8:efd0:2dad with SMTP id 6a1803df08f44-6f4bfbea7a2mr28149426d6.12.1745490157192;
        Thu, 24 Apr 2025 03:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgzsgx15Qut4NSB+bBKJh1rVxVjonV6TkGCbeCeN7hQttgUdN1oI7waEXbtgP5UUOSfMKNrA==
X-Received: by 2002:ad4:5c48:0:b0:6e8:efd0:2dad with SMTP id 6a1803df08f44-6f4bfbea7a2mr28149076d6.12.1745490156892;
        Thu, 24 Apr 2025 03:22:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659af7sm2028831fa.15.2025.04.24.03.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:22:36 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:22:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/7] drm/msm/mdp4: register the LVDS PLL as a clock
 provider
Message-ID: <orh3v7knajhmpv4uzmarpgdbfhkhtipjxc7agfmvlqdzggpwzz@yohc5d763ynp>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-3-c983788987ae@linaro.org>
 <029f3bfb-a031-4dfe-a2b4-bc41a0da7772@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <029f3bfb-a031-4dfe-a2b4-bc41a0da7772@quicinc.com>
X-Proofpoint-ORIG-GUID: PX3PQrxGB_Dg9RvjTdA0qBO2yY2aFuCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OSBTYWx0ZWRfX813JQo84Bb+R 0tEpjC6LLiBK9MXJo1OxoteC31RKsZrIC5Q2VQGdLrsJZ2VA1qmcgAHsQc0tnXiO5yijB7FFZ82 MKMynk8DuFV5R9UZn8ZqOWpe5reSzSVFttq8tT2STwYVR2AkbcRi0t6VJK3SrRi9qRlF9T8qLj+
 ZHOIShmwW7XkkoIfFK1j6g3U3iNqi92ddnSWpUtREaPs1A4tTM4GL/LrtgxJsE2NpV5lUx8Itpa TST6Z3+26BXfofXJuYY7lYbYcuxBx5nxv1GEkNmakc2K9gJfxodzSDb4XHZMu/duS1hlk+nmDZq nJEFzV+QMdUZIWBiZfqpMzYo611tN8/JpZdcXR5zdVN0yFjD/5tId9+hAzi2KbaAYX61zBgjcUc
 GmaIwiEluijxK2vzMXZK1CRUe2ex92Vu66MhC3c6KKpfVBZiPUTUszVYNHzPXbubIjLfBFJt
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a10ed cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=DMSj4145jBr-G1g3eIsA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PX3PQrxGB_Dg9RvjTdA0qBO2yY2aFuCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240069

On Wed, Apr 23, 2025 at 03:54:13PM -0700, Abhinav Kumar wrote:
> 
> 
> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> > The LVDS/LCDC controller uses pixel clock coming from the multimedia
> > controller (mmcc) rather than using the PLL directly. Stop using LVDS
> > PLL directly and register it as a clock provider. Use lcdc_clk as a
> > pixel clock for the LCDC.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |  2 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  8 +++++++-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c     | 22 +++++++---------------
> >   3 files changed, 15 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> > index 142ccb68b435263f91ba1ab27676e426d43e5d84..b8bdc3712c73b14f3547dce3439a895e3d10f193 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> > @@ -207,6 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
> >   }
> >   #endif
> > -struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
> > +int mpd4_lvds_pll_init(struct drm_device *dev);
> >   #endif /* __MDP4_KMS_H__ */
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > index 8bbc7fb881d599e7d309cc61bda83697fecd253a..db93795916cdaa87ac8e61d3b44c2dadac10fd9e 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > @@ -381,7 +381,13 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
> >   	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
> >   	/* TODO: do we need different pll in other cases? */
> > -	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
> > +	ret = mpd4_lvds_pll_init(dev);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev->dev, "failed to register LVDS PLL\n");
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	mdp4_lcdc_encoder->lcdc_clk = devm_clk_get(dev->dev, "lcdc_clk");
> >   	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
> >   		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
> >   		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
> 
> Change seems fine to me, one question on the order of changes, DT change has
> to be merged first otherwise it will fail here?

It is already semi-broken, as just enabling the PLL is not enough. The
branch clocks in MMSS are to be toggled / manipulated. As such, it's
questionable if we need to coordinate or not.

> 
> Will that be managed by co-ordinating with the DT maintainer?
> 

-- 
With best wishes
Dmitry
