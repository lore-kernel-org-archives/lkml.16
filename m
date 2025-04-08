Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA226A0E4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114026; cv=none; b=r7SakK/8H/1bt8rGPPv+jtTm/uiEFGXjj5upHRWSEzleND6E5A2otIA5s8ay5yDVnxZidKLLW2ZELvr5BNcyQ+xsFplrDCOtZ7+sqZfItQlVHDBeOKm9UF5jPCerGzEIHw3IauXwjRIGBIy6/yci0mGOXaiQbmpit5l1w9qtk8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114026; c=relaxed/simple;
	bh=wcqcXnqgwA/2UFVEPkOb/WW5TyibBYqvJ5HM/5PHHSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzElmXH5wRMVK73kgo0VrDsN4kHGdpyJaDD+tG0FWi5vAxzhcDcEsRmB5qe9x9lrjmGFjnG94xdUWk8qbfMMwNg0Wv9TVZ5BgEVnVeIG/jE5BpqzQrAy3N47pCO5ffExmTKNrNSIhAHjuoz70r/fTVq37UO9WXv9g4aiuNuEKdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGSHs8Ie; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGSHs8Ie"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538C6OCu014169
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 12:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=okr4ff8snDUBXMIQ3O2Kjam3
	gElpjdiFVfB7cr7ArbI=; b=UGSHs8IecqIbnMxL8cE1GcJ8I8WeNKJR9JUc1AsP
	p2wvlCfST4uFdb8kTot56MzlQCypCTyqcHkcu2J3Qmv04DDP3odCH20qUYjQ/iTS
	kwXyL9wAxYAOKtbt689MAPkn7omIy0lc0PpDQJaXZgEyWtU8KXMEpVqisIDfCHRT
	bnq8uH65plRDMMdvgxhTBO752R41Uy/u53ibTzjTFWiJQAxUePstp8LhNa0vLEOa
	AbeGPbXj9HaHmT4/4Vm/khvxuTFXxbU9EUMvBR76FsXMDx9zvgfxxfbUUAd93t2U
	SsRWUWH/PFGqGXW7N15KN9AEjSCq4Ll8kmt8vWaOufuYjA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm7mpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:07:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso62668746d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114022; x=1744718822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okr4ff8snDUBXMIQ3O2Kjam3gElpjdiFVfB7cr7ArbI=;
        b=vu2pWOrAWVpPeNpWd3P7fEyVFviTVfctWEN3y/nngFdvxfcL/sF2QO3BXfUonmjHtP
         W8STAy5KG4ws8rwdoO+V3ngNq421Le3bTc7EFdj/Rg/qAcKlN4/tKIpOL21XfncXIYAO
         lF0lqdd3MvihsutoHFRn5iYqzyMShF+XC4/FCOEeNEuKPxp1At4jLuMsUoNzGzQN6jVX
         3eYhAY6srEfZB0/WPKjEI9CpNYwrknULHhRzGY/rEX1zmR+m++Zf/+JBtq3vjRwe6gRr
         jPfVjjp2DacuI/5uapJN+K2AEyuH/6CiYqoa2tJzRV9VndHraFTn16uwabdrp6PEyQYK
         fb+w==
X-Forwarded-Encrypted: i=1; AJvYcCXSv9iDrx+JJC1tdejnfCbAz9Bds5Qz2vAs9bQ8p9Ilx8rztBgYCJ9X5DNMjh2M9LprtA5OJ5z3XqjkRig=@vger.kernel.org
X-Gm-Message-State: AOJu0YywE1ypC/sleAo7gZivt7tglk7B/chve4yzgi4kIfDOypf7PLON
	Uy7Jd8OhrF5WtUAKS3R92knyZpGYjweU1rkPkdWTsruMmFEpciTJLWa6uM8YJsItVOdWj6GNSwU
	mB2JRhDm80oaa4/SCC/gg/QcWDaDdVca7cZ3ZdQZR+jIsn2Ad/v9xXmqKQ20u2fE=
X-Gm-Gg: ASbGncu2TVzn2uA1sCJXJIHitU9AYSFAxjpxy00O17ygAC3PKyKMKhIZ74INJvL1kv6
	THxUjC0dCvU35q1zzazbfHmHbCrmDLV/lfnc459yfrDyXlAV62uzqnPhb2OPJx1v4/fNQ5pE3XZ
	J7d0hY2JHFiVqytErhufx+ISrpVzGbsoT8ueCFe4bqxXPTXYy4rOpgiDzlGwFWKQGO6nMfPn+HY
	HzT6fhH8151R5DoLEinfMkYkNMb5PG4s5NznUkdbD0p/t5NgjrOYdahLy67QM4+/PFYc2C2FQnZ
	9+lI0tHtrzCoDjNRtO/g8cYN3czLFY1BrKgOv9jTJvyQlBn5TmftA0MLVjVOiohAeIpq3ODJqb9
	dXk0=
X-Received: by 2002:a05:6214:2588:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6f0584a4650mr222250556d6.8.1744114022417;
        Tue, 08 Apr 2025 05:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9w2RBz2reqBHaAnbyBnIgRXepoq+7WOMXuECx/UyL5hge9Ble8kyyEI6oTqzp8dfXIATI6A==
X-Received: by 2002:a05:6214:2588:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6f0584a4650mr222250096d6.8.1744114022090;
        Tue, 08 Apr 2025 05:07:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e66377esm1493456e87.209.2025.04.08.05.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:00 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:06:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 06/34] drm/bridge: display-connector: convert to
 devm_drm_bridge_alloc() API
Message-ID: <o23cjtq5i6m5xwjj7ymknorjsv32e27anugbek42nao643kdct@6nghdmm746ij>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-6-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-6-42113ff8d9c0@bootlin.com>
X-Proofpoint-GUID: qCtGKuH1ZLxZFEHBBo4o4I9RD0KfxO3C
X-Proofpoint-ORIG-GUID: qCtGKuH1ZLxZFEHBBo4o4I9RD0KfxO3C
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f51167 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=IO8BAnyXGLrJ2ajCqTsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=960 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080086

On Mon, Apr 07, 2025 at 04:23:21PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
