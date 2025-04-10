Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B6D1EB5F7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278464; cv=none; b=QfcvR9Z6IHPYptA0jr9r1OkQ15kI8rD5AfqlCAIB9+h63YqerzZngaCEdBT2XMRn5R8tE1+NOFMHCC6nhmkqK7PdhZiFv/D9zhsttEBNLmuaN988DpmQ1ey82Tj7TsePmhNzUXscjBYxaodiWv/SRm7qHZMst6jHr0Kc/NsFdXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278464; c=relaxed/simple;
	bh=PzdVv6n3eb36jMh11v5zeECTY+HUKqEvfzLNfKGVF90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXYF7BcqNtS2a/ZDwrBei87fO3IjVqTe8y+98kqPmgsc3aPCHuU+57JsxZUef6awhD4h3b8bkKLRNX/qUQDty1yTYuTdSdTMRWtweHxqer34nZzXyBCrwcdx16l8Z0CUc/nU6wkIcUlGL7BQQm2/DlNfyeZgAjv4R9Pk/AWQlcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCqqNIJk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCqqNIJk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75LHl010649
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RtFAhLnWjHj2Vdt72nOfnzwD
	dl81RhuU6X6p7dY45kY=; b=RCqqNIJkfPCkWt5tlsfwKh+AUa8UWhLwDQqkznVz
	7T0qhh8CnDlXNBgJaMXfndl+/2yqUQnPgd7UjSZg/i63sYUKbK/wuWY7XIQvV9jW
	YcQW7IqS4/jgvlL13ibQLpkrIUlk7tK54KOLnvtqbKw1+9RG39Hleuh1hmg+pZN3
	bt3FjaVj15oU+NVWQpbJPOQQfTzFO7G0KE+mH/VMhdIpJk7RsBmQWriF2vUZZi3r
	p93TPeG24iyAZz8bB5nCSrNy+WRt3cd+1o9HaGdwim/z8cW+QkGjmiaal3hXCMwS
	0zcD8+9FWAsaVs24GapDtPtmAaQ3KCCeEWb/gc1Tny2dkQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3pd2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:47:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ecfbdaaee3so9711566d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744278461; x=1744883261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtFAhLnWjHj2Vdt72nOfnzwDdl81RhuU6X6p7dY45kY=;
        b=q4W+97qqd3AEm8nupuAq2Cft0FErITy5U9WiOVKyNR4syiM85I2GS34ulBvtwsuZG7
         /JMnbxjSVLsF9o11sFQ5fRWT/dd9yeKXhZs2g1kmfslRRD3TBITsHPt+/JV7pCQ9RUUj
         /slZG/LrMKsvX/1v8AVEb9Dayna/0RC9LcP6rAgmYO1iUzPdOdXY0pgBDGYsfEUXzVEM
         tHpqXeSDeFVx9GaPYr8ohqI6+XIbjXSH6y4mybvxK9CS43DjJhTcauStjds1a5R4H7U/
         LnwT8f0y21z7i/Wxb0A5fljh3HDgP3qwF0wzYrhA+2B8AaLsacPO4yfBBS4TYRGE5ShL
         V2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAOfeHxU9rgaA+fs7//G+ky1X25zVN2G1CfKVx7Gma9AZgGR+IiGVUsG9A2/PR6pKrDpjVlRtzDiLDNC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ+ZA8EjKw4WE1/UZoRzaocjfJWCiF8NNM56dESlt4Q8zFldUY
	aySGrw9eCjl8tIP9lDiJDSrDgqtr8tjQiDj2Nm2Hm1ez9kQPbHLbBNcQECLEWe60p5MbO3vtr/B
	bynLDB9AvenQ5HT9sSM+4ZljGLz9Yo/MC6oZFOjnjTdU0YOy9ryoUWmpP5LDcy3w=
X-Gm-Gg: ASbGncuYEsUUaoiPMLboZge+WVcGbtJf6RtQz+0pB3o+YtodJSH6XpYryXNKPZO/CvA
	uTW0yZ5UemaWsCzLu+Kea8r60WKHeBR2WQhFbybDf95KQbbbHP0ESEHVPaw/iQlQsLN9GjUV2Qi
	lpj6ycO2mfQKztS3Ze9YVYsy1k2GZ2/EFMbIZGNaFFJUkhX6u5U/HZTgPG1LY8lAsz7jABegRQY
	Ey3q/OvQyaRgTjaUTnVSEI2sJWF12A0iizB8/6WMtKKYjYFtAqguiPlFpUkJzeLD4bcObIgdG1C
	AsAtBo8dwH+VYeYVjUkOPej5a5yEEyAYsV0eu7ni0idmULwnpPNMzK9lI2MMHDa6k5WS6AQfS2c
	=
X-Received: by 2002:a05:6214:2429:b0:6e6:6aa5:2326 with SMTP id 6a1803df08f44-6f0e5c077a2mr29592426d6.24.1744278461267;
        Thu, 10 Apr 2025 02:47:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT1JawutUvxmYR8lSzmTSyg/BqvttzgIC0oWCpvsKu3CJovvRayjBGGQe29GzvatBdsd/+ow==
X-Received: by 2002:a05:6214:2429:b0:6e6:6aa5:2326 with SMTP id 6a1803df08f44-6f0e5c077a2mr29592226d6.24.1744278460917;
        Thu, 10 Apr 2025 02:47:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d5ebfsm4052221fa.68.2025.04.10.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:47:40 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:47:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panel: ilitek-ili9881c: Add support for two-lane
 configuration
Message-ID: <nvfgrdmynquuwub3qy26zqyztb7ze3u74vv53tmk5xoltruw5c@nnbw3heppqd7>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
 <20250408-feature_sfto340xc-v1-2-f303d1b9a996@bootlin.com>
 <ioput75qsjfehxqaw2vyeeogtox43cosdk65psp4t5wp737dey@p7bwaltapdng>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ioput75qsjfehxqaw2vyeeogtox43cosdk65psp4t5wp737dey@p7bwaltapdng>
X-Proofpoint-GUID: 3g3nd5Uq35NbSQko7e8GrH3LyFRJpVat
X-Proofpoint-ORIG-GUID: 3g3nd5Uq35NbSQko7e8GrH3LyFRJpVat
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f793be cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=UfFV69bjFFh9RDvSpowA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100073

On Thu, Apr 10, 2025 at 12:34:15PM +0300, Dmitry Baryshkov wrote:
> On Tue, Apr 08, 2025 at 05:27:01PM +0200, Kory Maincent wrote:
> > Enable support for two-lane configuration which is done by setting the
> > LANSEL_SW_EN and LANSEL_SW bits in the Pad Control register.
> > 
> > Use the dsi-lanes device tree parameter to configure the number of lanes.
> > The default configuration remains set to four lanes.
> > 
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 35 +++++++++++++++++++++++++--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> > 
> > @@ -1504,7 +1523,7 @@ static const struct drm_panel_funcs ili9881c_funcs = {
> >  static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
> >  {
> >  	struct ili9881c *ctx;
> > -	int ret;
> > +	int ret, lanes;
> >  
> >  	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
> >  	if (!ctx)
> > @@ -1545,11 +1564,23 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = of_property_read_u32(dsi->dev.of_node, "dsi-lanes", &lanes);
> 
> Use dsi->lanes instead.

Please ignore this comment :-)

> 

-- 
With best wishes
Dmitry
