Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B4E21930A
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225814; cv=none; b=fxrhQBxeyyqy2PumVO94FuZoaAYBviXARN9ZrbQr04Sq/W8e3eJBE3zyYd1ofShI7M1WIqtT12G18s2qfrm+b2q9lAPOZ9uhZIauTr9fZTu23GsxaFnIPkhuJIfZAOYgtZsjWmax3W1RRv03avmp4lkzG2guonXkGd5RfCZCWpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225814; c=relaxed/simple;
	bh=cT8nC8mZfOCD7lTXfvpIEpKdy39UtRQgSpJDhtuMs84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GN5RFpCvkOdLX/wMw9+h7m33U62+O3UZl5NISJk2NYr1gtuOtVnKyA1t2hs1Q+jKeeY5LReTgqg6kf0zt5WPIPzeSrZp4QtV00oOBwM6YNd6s2fO9mlAi9Zo8N9Ng57dM/ISmy9A3EUi+ng+pSzJGAaHwrfVaQNG5+A2IdaheDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBZRc5D4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBZRc5D4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KArVR009084
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 22:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CN7xAI5RxauZHSlfvB2dYCQh
	k2oKQHJwg6cw+tFAgxI=; b=gBZRc5D4VtIwHTesw8c96N0We8YMT9B1/H4e/S5U
	3oYIKUD8+rjDiCJYS++0hTrSNHQW/yllkOhaeAZk/5CFoPZ4d+MT8AfjwirCgHs6
	keSX1ZnmoOhr/N229UAKoi36p9S4gALDRHCM5wf8i56AOMMRFKn3QibqUPe4liG+
	jtBYahA/Kus2Ldh89xMnaJmhQ2eGqVwNY0yf4LW4/PYI0AMLoeZuXcfoFjbi4fF5
	a9wuRCyDx0X0IZmc4yZX0XnXFyjGine1RWPxsnS5iaXVv4KoIJIedI5EEcgWJqTt
	Nf/GOisGHzNcLKCwGaqC+IhZT6Mx7orcvLEihyJfnaPuzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u21jus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:43:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4769a1db721so65715871cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 15:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746225810; x=1746830610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN7xAI5RxauZHSlfvB2dYCQhk2oKQHJwg6cw+tFAgxI=;
        b=LWhIw5AAxj8xj4++8RuRZCGDH6CB2/7a/jof2bNpxf5cD+4JQf8pwTUV84hLALwMLX
         ZPxwT3F07wK6gMncXy5S0HpWEn8vH9uWj7lB2DSSdssh0NxhWeCRcsqTyU0c1llW9Ya1
         K9lVNeGojfq8qfkcwX4ijhm5QtJtJ+QpQGUArZhw53cFIQoGOe0a7D+4O75iY/GFiGVi
         cB1Sq4np8TfpqHcgtJFebvd8jt4WJx4wgp5kuI9RoVd0jD3TQvUeyNDY5MoxNcyYfZ0F
         D057JavGtlV7t3ZtRnmTz7bF3rrdHYOBoIFBQhNNXMGqjXeiBT9g+tGB9t3O9gbOgEyK
         CvyA==
X-Forwarded-Encrypted: i=1; AJvYcCW36Sm4E3T4PN/8o+ylDU0SInDJPixF3bKnR0UFlOu7tM/kz0jz3wGVJNCZ91LON3cRpcJPEDyHTLSzGqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcc1uMG8cKHY7eP9HiRaomHgueN1dr9GN7q8y6+mbjiKu3ZTa
	kMsN9fYFhCbxIdFIsVA4UjSH1kbfdw+Zs9qRjiodeGoYE1+ERJWCRZFRyb17FwAfUDe9de0TkTF
	0RUDUjmJm3Hbsh6YBLGS4Z7DU05B/OUZHXoVqQe2QzGk6gVj9N4JLdJNomMlqgnY=
X-Gm-Gg: ASbGncuWELY5Acau/3tMegOHxyFs5F4EGzfgKTJOw5gFl4qIfdHPBK/9feo0ztmPnaw
	clj2vzPtaOx/lGXp4NeuCFWdTSy48DCtEN74WBIkepweSQkoqEwAX1VqqyqruWqHhHs8UueIgi0
	Ui1vsW1C2aRveJWIT2ETpQ845WnWXQycxCK4spi6WrP+haGEvjlf2I6rC32suCSTGdefPp17hFU
	jNLeXeawXZa+JozHRuyD78LBUGzLZ4DhckxuE3exvKAj1llnnWbQkTq9cJenu4VZvEGn2S7l2Rz
	axaIePy/XqVDsYY6FPSDNV+EYB87QocnsMtvYy2WXRc1agB+LvvLg+PzxDk8NgcA9v7K1agsvi8
	=
X-Received: by 2002:a05:622a:5c14:b0:476:b480:e440 with SMTP id d75a77b69052e-48c31a224a3mr79130561cf.23.1746225810295;
        Fri, 02 May 2025 15:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyDC/ycgAmMGrAX3PIpDNuTMextZpMxyJBxhg9RzguKAZ/R/C4ebf5Fg9mF7ewzlpaMNVwpg==
X-Received: by 2002:a05:622a:5c14:b0:476:b480:e440 with SMTP id d75a77b69052e-48c31a224a3mr79130141cf.23.1746225809891;
        Fri, 02 May 2025 15:43:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a897cc6sm5072491fa.70.2025.05.02.15.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:43:29 -0700 (PDT)
Date: Sat, 3 May 2025 01:43:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
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
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 14/24] drm/msm/dsi/phy: Toggle back buffer resync
 after preparing PLL
Message-ID: <b3dbtmqigdrazkhlu55r5tzo5w7ixf65m6y56nvqnaetkv6onk@xsakfzc7mmzu>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=68154a92 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XEkVnyDaZeylL3GQtG4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfX9RSpWZwKPHhj TfEqlBNbkVLq6xWtzyIDPga0btam2dCECLVTpGA9E2cdsFpLQP9G+kdeZUCXOxXR8vLOhLApl3s mj10irfuJfEVfVIaa2hrnFgLAK8spo7iHkjmzgUOXHN+Zg8BrCSh5uKXVsa0kxGvLQvRIm2TnC/
 MlRiV9iPGU/L7loCVVI3RnM+MThDDFrEkONv75SQHao3Zxm7oii9quSRANxEODwEPEtfQ8lScmn m2PoEUwThQP/NIhnVc2lWIOfbH6dAM66mUfeR1VV1tKcGmjOiBmNqqjb87LxRYlqYshhwssZZUT Rkpe2oDVHq/jim3kdb/MH0MNsNxuEoBAOCwUYa3byzLoZc2zt+6lYSTCwU0/44c4u6gMJxABqOR
 w28dwRWyGmLXcMOgYIAu05/+MQAuveIEWcUgH8sfSwwZl0QcCAKunJCBHTd4OvlgbMX7GN9h
X-Proofpoint-GUID: 2i9y9g5UcsKeJRemJjOmVqCWoXWNxRL9
X-Proofpoint-ORIG-GUID: 2i9y9g5UcsKeJRemJjOmVqCWoXWNxRL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=771
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186

On Wed, Apr 30, 2025 at 03:00:44PM +0200, Krzysztof Kozlowski wrote:
> According to Hardware Programming Guide for DSI PHY, the retime buffer
> resync should be done after PLL clock users (byte_clk and intf_byte_clk)
> are enabled.  Downstream also does it as part of configuring the PLL.
> 
> Driver was only turning of the resync FIFO buffer, but never bringing it
> on again.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
