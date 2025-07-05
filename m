Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E87110942
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742198; cv=none; b=XvHJUm8XA/VXu/u96M96UFLlrIA5sGmvfES+DjbtyEG2qHSLeW4Qitrw6CHkiXE2gLmBAIKENJyjq8H0TTWUY6lo8azdqU4mHL0X7aZTLfIPYhmfqxmjf7VTlcjudh8z8rpMvVPGYRv669d96LcXGLiSbsY1qBofDPX7yaP6U3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742198; c=relaxed/simple;
	bh=CIfEAdGw2O1R8b3FT158TGO0fY2CDehsQ/I7lst0ODQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bawKukmlRk5M5gECFPHs63g66WXbMbEswnIWL/NkhWmEEO7gW0y6w1mJv+3TNFNvLpa1odr/BT5vILpbPMwm9NxhWtwuT7n7OHYyEbDUa2fZJXCY+MpEzVaOT19SdcEEIx0KnS/4yB6PK8oN6g+NKpI3EHwFwS6vVnpqykv48mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4262PbB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4262PbB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565HnjCA023791
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 19:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GbeLfqtbM84GigusBY9E85yZ
	ET2t+I54GGzPiTHuUK8=; b=X4262PbBT0ocS+G1VzLtUvvO6QeTriYKsQ7KM6Gl
	a3/Fp1XauDYfMEYw+cIIH+0GRaRFDS7OQ7oFR0+pbUpB4ju2BqdzCog51Et74914
	4HcGXKQnqP/5XDoOeXWxJddBafY4mxgBKnFAZFszy6B2BlO1kfR9VIE/nJoDATpt
	HEyYlIu3uwcFn71ZYfG54yWQKMAwIVvdl9JUD5f6Fp8ave1iVz7xoO1jb1sVUGuo
	5bHfs/pr8+/xOfb/n5D+I3DByTwemsYT64Qrte3vcMiS/57yYNcSKizeTNYAFSCR
	JVFVhX8tpqnFmY2AMeCqiznGGxtSSfrKs/glJ4vdZDfXjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqa10t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 19:03:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d413a10b4cso281125885a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 12:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742195; x=1752346995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbeLfqtbM84GigusBY9E85yZET2t+I54GGzPiTHuUK8=;
        b=C0qXto1EepMuGU9X5///HzMLPFMXJuy7AQhbVm1y48/GU+PY5i3aVslDObuaLU8e16
         +aRs2H+DNgjy8mvRxogFG8IgDf66QgtaabtMJOP8tuuZWcfEDziMal/N7atNQEaEH9L+
         EFNDC8LK50ODAhHEQci79DHDVCaf5oT1MxWizjSE657gxy6FQF/EVXFB4nROKb3DK6sg
         sqOhvAJnit/za1fp5LCw0USDcD3nq1lzAkLyosaBw+9CsVZ2vzrC4CTcwAuyGlifeiFq
         ixyMP/YIOrfu2kTaFFYmKb4GwBLLcic7vNY6eXVKX3zNamBcggbECDDJxgZZIj4YV2nm
         oRTg==
X-Forwarded-Encrypted: i=1; AJvYcCX62D7mxfZsyJb98uEGHuXjlwdtGG2KHQuZ6aDy5W5nq9B7mGg4Osa6QKQY65Jsth1ooZ5579kmmOAHsE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytOR8WXV1655ndRw0vi5ACYoF6KrtekzetYXT2qecM1xqjTx3h
	kXxlZZXXNjwN79hpTrED5d5TvguUCkq7BSBd11uFLTzojdLLN+YYN2lOpLlD62FDa0JrNtWP1hQ
	UoMm76OP3VUjTZZGKC+x0Y3fAlVRTgR00kKQTVJ8DswCDqX1yojQdi7TvKMOucUrDysc=
X-Gm-Gg: ASbGncsdU33dWtDwBa25ukBzN3z/uOQJAvtveFVnp0eH0yDnXdY+z3sv/otVP8A2f4x
	Z5dAtkID5Jj5tCH4FgPcmhZUYjkAKkqzezZ0SsFJTbbqEcmOVhOGv8ZLwIsUfMJ5qwa9FzQRzjo
	2jHHztKOeBXW/ziqRvK3FLpiLdGVgfw6IZ045FcfCUgG1PHRWHbjXPyfS5GSHA2oKUIDsu5FAIg
	KYiBFKEXOt8s0dc9CNy/9RhATk7aUaqlFyElKzdvgzE+VX5aO2JRKrCuoddmEiMf3RIRoBgQHnV
	PdH+FQJx/MIzG8IMxGIefPmmuNfRwHZ4gz1CoJ+lxcfoBRDtD0zX4GHxYRbDOBkZObNoiM2KmVp
	4UIRBMsNTbbbPpFQiCcNQo5bhu4uVE85w0eo=
X-Received: by 2002:a05:620a:1b96:b0:7d4:4abb:908f with SMTP id af79cd13be357-7d5f2f3f5fbmr408995385a.42.1751742194441;
        Sat, 05 Jul 2025 12:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcvtS4mI2BDeyqNJVRJsTnuleGJAXLklqYBVVRwEGb4WyHXNKOFHugdKts46+FzAjULo25pw==
X-Received: by 2002:a05:620a:1b96:b0:7d4:4abb:908f with SMTP id af79cd13be357-7d5f2f3f5fbmr408991985a.42.1751742193996;
        Sat, 05 Jul 2025 12:03:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c18d3sm658991e87.212.2025.07.05.12.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:03:13 -0700 (PDT)
Date: Sat, 5 Jul 2025 22:03:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Fix
 DRM_BRIDGE_OP_HDMI_{AUDIO|CEC_ADAPTER} setup
Message-ID: <d2a4ixu6xjcltjylv5c43gkzksbr2n4cqhw4x6tljaph77is7q@mdlp7fhoms26>
References: <20250704-adv7511-bridge-ops-fix-v1-1-c1385922066e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-adv7511-bridge-ops-fix-v1-1-c1385922066e@collabora.com>
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686976f3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=1kJDpHXNGl3mU_r8nRYA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: EvnBKaMXhuW-uootCZjZlouCD--aJhL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNSBTYWx0ZWRfX2AluVN7gsb4i
 X+fj0bI5nXHAs2Rf6dKgTCMuOulLc9EL09BrQl1bPo92IBywvC/8aZMTAFLfgHsZPDVuJMYjnl/
 VUd0SlA3R1Xn3czrmuNnsoa/N1PHquL4OKpebCMfVZKD43ZFzSIg5/8dGtHenFuvzKESos8q7Nj
 HFPtu2QZrnVWw3ivQBPI34pnnL08+0RjsTjvzHe6BZ/stlXCyHnw9YOS2C+kAIw0QyJgX+SWPlO
 +BzJBV5X755i2RBMANcEKBlTWTbUJWIx//WOAlqCBBwaEFMGZtCuGx7tRB79lpC/nkm3EbJyzqF
 unnVXwiyM0lyRc0sMIXUK/O5D+Z1W6+osTTB9prEVPpfeRJ2Y8miffbGe2ZFRoEguowHQBjos7C
 qgW8CmXNrH3warFcfUTFgrAGXG0uHTjifEZ9ZqkzemG/8QFfrBO1at0MLUcC5biWcoakctBj
X-Proofpoint-GUID: EvnBKaMXhuW-uootCZjZlouCD--aJhL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050125

On Fri, Jul 04, 2025 at 02:52:54PM +0300, Cristian Ciocaltea wrote:
> When driver is built with either CONFIG_DRM_I2C_ADV7511_AUDIO or
> CONFIG_DRM_I2C_ADV7511_CEC disabled, drm_bridge_connector_init() is
> expected to fail with -EINVAL.  That is because all required audio (or
> CEC) related callbacks in adv7511_bridge_funcs ended up being NULL.
> 
> Set DRM_BRIDGE_OP_HDMI_AUDIO and DRM_BRIDGE_OP_HDMI_CEC_ADAPTER bridge
> ops only when the aforementioned kernel config options have been
> enabled.
> 
> Fixes: ae01d3183d27 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
