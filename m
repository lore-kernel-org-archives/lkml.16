Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE45AD2D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750723241; cv=none; b=QajlznBMTeAWvjJu9MHlVyy1WzNXQMmtqPcJ9vRymRoFvWPzOrVNCmOVHKw5Cm38kNYDH/OInkHPqV8PNCX6zTWC9J4sVEFt0ni3Uy5wgbVU7DXnKUbyKeceltiCdv22+Ckv50N36+lm6kzat1nGGD5NujoE1iitxoC7nvPytIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750723241; c=relaxed/simple;
	bh=5RtONKbBRKFcqnmXnSPVrVyShbQzMi83+Jjl8YVpVII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vo6G1WL/YFP3LOKP8NOUqy1ujeEj1tpt22vCI/cpO/tGznlNMagGQZAQFXbkpTMNjPvsMwDDsNCY/8UCscICdgpLJsUaPRu+pzUOwG6gMf7yytS99QPXSoLG60kQl5rkedMJAe/wO7yzFApeCIL3Y6GM3nfxsp4k5otMB+2g0j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmI6CYKJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmI6CYKJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NIRe0J014481
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Asi+qo8nTCI1mKiB5x94ZBX2989X9Lw801FHpxrzws=; b=KmI6CYKJcLNpKpPl
	LNiInYXuUfgawGi7aY39IqnzcblG0HK/I1T7TjB/iv7yufGSaWoeHAuSrf8r0yeP
	AVcGKuFKqR8qAbAS/ZE/SzmOANZH8NhNuafY3Udmsr39gpDfaBfT8pg5YWwfRA/F
	O/2U87VnVKc4Ov4cFHcYv7l/xNLbva/aCOHydgTjxaU3wM3bg++iI1Z+5ibPC6zz
	0fAredJZTSF40k9tPR9R9sj9R8IeAwwhfENQ5+ia+I1XLT5jpYqhFDI1htHCK8gt
	gJliLSeairOTGOqWMvlCdxvmaSjyqcvguuY6shOZArFVTfNPAiRVRuz9DX4YT7iH
	Dp0nyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5kc32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:00:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d15c975968so733622285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750723238; x=1751328038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Asi+qo8nTCI1mKiB5x94ZBX2989X9Lw801FHpxrzws=;
        b=wRQTsbbeFgyQInUubN8hlMCRA/QRx/xvwzWjkiyLtmDOQyG40qBHJBbQV4Au8cphGu
         fdnqO9OZTYHw2frZhDyVVVfN+vL/CwHavfbd0DamCGoxsTUgWUwkrqCOKA8i70mi+A3O
         14Iwa8MdD5CXeG/kps7S6duocL0jcUO0H25XR80sZzqBiEr3VRUr3Cz1XBKbq2CL0teD
         LXD8qPofSzjUH3kxNBrInOraGkQJelVwY55n14MUeMjCFXqJQ3V0rUQByhtKnpM/jOxQ
         s003610I4jjPgrwVayJK+pMh58pJJURo1XiEoaxHP7Rcj5Lwz2pzkNvHJ+TFLbbmf/FR
         wP6A==
X-Forwarded-Encrypted: i=1; AJvYcCWNSiA2Ml8jZvyL6lKjymo7T3+nOTBccWzIwh7l8LDvXknO1S3sn9HdnGpC6PdqSHt9zzmaqrK/rHgVdT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/o/jH4zOZuDT6c0dAtC36NlNFP/lvZqmi6gGI5ryBeJJd9fm
	FTBobi2XzBRW+2l78f2qMeQqCqXXOp7GaK7mH7P6/tE712DobeEjsbwYrt6JwfBKwU5YczCfdU3
	E8l0fc3If8fJ9JKMgSYwH4kZemun8FP689q7C5vhhupn4VcEKB93PK+A1Vun3hgB7Wk0=
X-Gm-Gg: ASbGncsKpnoW7q++MGDt9Z4aeqmIG6JZQPN0gjp926jGesBnQp+lENmlMofKXPemZzE
	kKUyFWEK+dTdA53ZeAGKc7t0A5LwsvdH6oXHCCe3ohxyqPbhfiPNvIUvjzoOmcs+YlLCnewAd5D
	B03vNkiHpJ6nCFTC74VdwiFK3UF7LU6DWvVK0nY+uPnguYLlEwT7f3MzYOGLpAplf8egMt6ZzKx
	2lCu1dBzubBMnDjdlyM47/so1yx6NO19KegieaIrdNcz3LSRO17SWsWPJEHeife77lM2QCxPB6E
	XkIXX0xtGBqzGjWYT7WM5Oojw7ZaKbKDVEoyl01SmTq/9SZ2yv6lFTC3b+wJBu76+ZoRjzAMvsI
	KIQKl0uqesa12W6lk3p9Bb0qW2hZ6ADCvVFQ=
X-Received: by 2002:a05:620a:4085:b0:7d3:913e:802e with SMTP id af79cd13be357-7d3f994880amr2222737185a.41.1750723237890;
        Mon, 23 Jun 2025 17:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG17w7pk2aosN4FygWcUzSUrA3VkoKfC8yJPuyal8/htdlf/PM2J6oSDnLvCagyiRaIxM1Q0g==
X-Received: by 2002:a05:620a:4085:b0:7d3:913e:802e with SMTP id af79cd13be357-7d3f994880amr2222732585a.41.1750723237409;
        Mon, 23 Jun 2025 17:00:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3b8bsm1610263e87.176.2025.06.23.17.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 17:00:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH RESEND] drm/bridge-connector: Fix bridge in drm_connector_hdmi_audio_init()
Date: Tue, 24 Jun 2025 03:00:35 +0300
Message-Id: <175072321565.2143591.15673248726597624264.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620011616.118-1-kernel@airkyi.com>
References: <20250620011616.118-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 33MpkMtvmWUukPffrm7Bo5VVBu210huh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE2NyBTYWx0ZWRfXymxQmyEBvkyM
 SKPli2CVBgM0yLaQdaBbQ60VWXVnfhkEliebQuse5TP0y43Jiokg0q7oW2ooBioHPP6VRMBAL1S
 Zh7K4J0ycplVLZH80MHLiPw09q+zTyGbbZSsWPg8MAGANQFConKh2a5dbqgrnTEHZvPZz2StzUZ
 bP1RbKf01Ppuh7P+nm4v0FQnf8h0Aw7lze7yctZsNSPXgqVsi10TfhfPU7ZguYs0C1WX2mpylSa
 B/dbwHNRMXlu6Xcf+y9Jywk8AZQec1MV1XQY7eTmv8IPFGp9JfsDJxHFMXITXNWHdc8kHSPdMu/
 Mvn9HwxFYYZiEQmMLTx4Li+lqlfHTpw/ztmtAdClWZfhg4DsbsR+PZq/wNn8u5y/WJW2tCcgLYS
 c7DMA3Nczm5H2hyCq8cda11eO8BSKYfi8gvFKAyRp+oxKgvTlBnvoqPicKXAZxVrY/8F7mcC
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=6859eaa7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=XOHZOQEbOLC72XWR49MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 33MpkMtvmWUukPffrm7Bo5VVBu210huh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230167

On Fri, 20 Jun 2025 09:16:16 +0800, Chaoyi Chen wrote:
> The bridge used in drm_connector_hdmi_audio_init() does not correctly
> point to the required audio bridge, which lead to incorrect audio
> configuration input.
> 
> 

Applied to drm-misc-fixes, thanks!

[1/1] drm/bridge-connector: Fix bridge in drm_connector_hdmi_audio_init()
      commit: 10357824151262636fda879845f8b64553541106

Best regards,
-- 
With best wishes
Dmitry

