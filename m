Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123C21AED5C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490243; cv=none; b=ta842xWF7CI98cpJbXbnNTCTcsNWBn436JsglkfPkgLSUcUJ04nFfFdaBcy93n/P/ZYbNB1KNgCG4OnzRi9beiUAlo0eEt+/xx/fOhUDVDEM+ZcaDVhcbrIOZzG1coTHaR5cXrrLqib6VJaizRCevOjsqrrnlBX0DhhMKC9nhZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490243; c=relaxed/simple;
	bh=6TWXQGTUy8wIt2JEPMNkmc5GEl594rGt7tbRCILOuMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edLp7sNe56CMa6pxSYHOSpF7C5OnVom2BCcjF10EHMS9G3GU8ASQMMaBPJmGfQiYn9Z1t1dRxlhh9AsfK15e6/t1Tkwi7muBwcO2xKSytK08DYNS8ImZJhKz6Cssl0OTnkVW8tZh4xY33Tu4+Z1v13TDDMWn7ngGbpiOHHBKtqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpruXzTc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpruXzTc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F5Su016930
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j4BDsTwObQmRXQvxX4u8s4xU
	g+eG5lJxHUSU9lC6EcQ=; b=EpruXzTcKEU5BmMvqpw/QQaUDBzAPkOffdIFSJEw
	FoyxdVwsIhNa31Czq77FhSSby3J1kLf5ezY2h26exod+X8nD+TK44OvLJ1NlMP6z
	yl8IVEbLkDv35gymNNLUqIFB+e0VbbfN/Qf0hBI6/5m2WpXf1Tk9/5e5MIRnfMOF
	UhuCaL7QJee2rrMAqxlHi/OsI5jR3jr7+TLcZxgUWVfOWUkMGy2LMRBmFnz2ZWXA
	kSCEh9R+HxRsWWoHKs2wfE3ECbwU1oiC0VWP095gcpEQykVfJ3KZcc6MpghdUPKU
	eNpEMR7PgVt9V3lDYgN+YpDvFCq8ZSUVLYvMutaFUDrDSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh154j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:24:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d9d8890fso365331585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490240; x=1746095040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4BDsTwObQmRXQvxX4u8s4xUg+eG5lJxHUSU9lC6EcQ=;
        b=WUBLJVF1DShNhvBh3vw4mBi0FIEoMOZo2UJVSBq7Un0v4TYw+o2OS2oPNbjuD/6XGU
         qtq4Y0ItBodacsPqXASIssSJaTid4lOP6daR1x8RPqRfnwJmHSD1nvzl7rosagoYRDGh
         nmHYAbSDCGBEL0uMeWNpdmsxzDkewNUVGht0Ma7Z3vqClIDZP5EXLF9fGKkgIbbeYw6D
         hhvxPeb6QaFbzDyKUvAovW4vrISrPJ7AKR6nYh16AI1Rbvr8mMQy6sD5mYVZ2Qf9ro/q
         huGueKVQ+xxAUm3n5iDrvNYgO667GcxX7gbM9W7rkAt+J8RzlM8j4gekrOUXX1TU6a1r
         jDUg==
X-Forwarded-Encrypted: i=1; AJvYcCXqby2qWnWBxpybF3PSTNDyszLCu2eM32TEEYV5UUId+WCh3jr4c4o3Q8vvStOjzhWYi5sbYV+7qrpTyfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQaIW1Q2bfOcnMgHfaLD3K7TbVsMRALS/DaqQtzf7AueO6XdB
	3ToVyxEgAmJxzgW3p8m+JRofPZtAMi5Jf5dln/AFYz3EfyI/yhl60pPewZ3LsVNkRFPHctVsjcj
	WXhWwcXdkZEApiidGC0I2kj78SM64Q8uR+tvVCi+eH/rtWEAzaot5ZgR/Zt5fS84=
X-Gm-Gg: ASbGncuII7pJL+WuH7U4Nv+zNN7V5GV89g2rreVo2O7WNiobBroMznTB7qOf+TTOiFN
	0zV2rl+cVLQBaDAEtkdLncanifKi3vbVONZjo/NXRzh7FBzJI7Ee/A4SW/alMRg7lMgNmhZaQWF
	HWft/aBj0oIrzRXbnfJA42dVv8yNkEUjQZowwr9FRMklvxiUEjThTufLmTwgmLoaKgRuFE6euPl
	kFuPb1NeSkYHUItpLjJIkWtAJxHzEawuFiO41hsjsLNmQMh5JD9FqDmdOhUHtf8RautvlFZ84YC
	v5neWysWMMONbDq71aiauaseFjSyHxjMKDvlLm2WJviNpp7sRlJUuMTuSL/TKH7LyccmozoXu9s
	=
X-Received: by 2002:a05:620a:f0b:b0:7c0:b350:820 with SMTP id af79cd13be357-7c95859b8d8mr248842485a.5.1745490239948;
        Thu, 24 Apr 2025 03:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQQEXVZzHdQnlD3zO5Vs5rn2DZ4H/JAobpVLZpVt95WPenNjUM3LZuNMO+8GOdOAF/WC9wFA==
X-Received: by 2002:a05:620a:f0b:b0:7c0:b350:820 with SMTP id af79cd13be357-7c95859b8d8mr248839085a.5.1745490239479;
        Thu, 24 Apr 2025 03:23:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8055sm176606e87.234.2025.04.24.03.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:23:58 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:23:57 +0300
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] drm/msm/mdp4: switch LVDS to use
 drm_bridge/_connector
Message-ID: <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org>
 <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
X-Proofpoint-GUID: tSAD0ZWeeL-R9m-iQF9VH4qwx6UumxaB
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a1140 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=OCSEMTtbVqUzc-lEabkA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tSAD0ZWeeL-R9m-iQF9VH4qwx6UumxaB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OCBTYWx0ZWRfXw0babBMWYA/3 yCM2pC4u7tuAc2BoWtEhchGz28zEbcz94nD3A+o9AhwxZSGSn3qyQtpCZtFGRj9+d9A5mLs6K/d 3ckUg45BIylzN38rgTUDjKfgi/vTv/ql3B005L0ryLGO2Erx6Dq5XFxLsa29m7hTqtx7TNIf2kb
 69HripCpRdA7XVk9PnlMj9UDMG7XAccX4pfJlJzwEpPBog48Mg1jpAloIuu7atNsiLvFxzUV15b RUU+/KZEiFgEZGfKSFuPooYTXbMPUzrg5qGDpS1b6q3dWf0Icq/+rNBnz5YEeUjyvZBDw3+Dp9H E/SLo2l0rzIu15+d4pS3Rq2FDrXjcYjzwewvy0nFJ7FLMbqvWrfOHbva1tsFleiPNxpeDXv++mx
 L1FV+oh5j8b0zD1yWHAH1sclBSowE0jQKcyDh1UhAn1ZtXy0nvc5YCbjmGBQ4qm3foKw8yme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240068

On Wed, Apr 23, 2025 at 07:04:16PM -0700, Abhinav Kumar wrote:
> 
> 
> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> > LVDS support in MDP4 driver makes use of drm_connector directly. However
> > LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> > them to use drm_panel_bridge/drm_bridge_connector. This allows using
> > standard interface for the drm_panel and also inserting additional
> > bridges between encoder and panel.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/Makefile                       |   1 -
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
> >   .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
> >   5 files changed, 28 insertions(+), 133 deletions(-)
> > 
> > @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
> >   		 * bail out early if there is no panel node (no need to
> >   		 * initialize LCDC encoder and LVDS connector)
> >   		 */
> > -		panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> > -		if (!panel_node)
> > -			return 0;
> > +		next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> > +		if (IS_ERR(next_bridge)) {
> > +			ret = PTR_ERR(next_bridge);
> > +			if (ret == -ENODEV)
> > +				return 0;
> > +			return ret;
> > +		}
> > -		encoder = mdp4_lcdc_encoder_init(dev, panel_node);
> > +		encoder = mdp4_lcdc_encoder_init(dev);
> >   		if (IS_ERR(encoder)) {
> >   			DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> > -			of_node_put(panel_node);
> >   			return PTR_ERR(encoder);
> >   		}
> >   		/* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
> >   		encoder->possible_crtcs = 1 << DMA_P;
> > -		connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
> > +		ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +		if (ret) {
> > +			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
> > +
> > +			return ret;
> > +		}
> 
> Can you pls point me to the lvds bridge used with this apq8064 board? I was
> unable to find it. Just wanted to compare that against this while reviewing.

It's the panel bridge, wrapping one of the LVDS panels.

> > +
> > +		connector = drm_bridge_connector_init(dev, encoder);
> >   		if (IS_ERR(connector)) {
> >   			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> > -			of_node_put(panel_node);
> >   			return PTR_ERR(connector);
> >   		}
> > +		ret = drm_connector_attach_encoder(connector, encoder);
> > +		if (ret) {
> > +			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
> > +
> > +			return ret;
> > +		}
> > +
> >   		break;
> >   	case DRM_MODE_ENCODER_TMDS:
> >   		encoder = mdp4_dtv_encoder_init(dev);

-- 
With best wishes
Dmitry
