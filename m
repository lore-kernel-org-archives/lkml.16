Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D725428B4FD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594338; cv=none; b=AyyUrTMasbRipqlUKzPM2nkij3ts0RxuDi3PZBAfj+xDE51Q0y8mfqn95T4b99CbXrCOLWEKcMw2gtnanTDK+S9Y+KXmSEStjDTW+7u9D+BKL53FNQmTFm3Rkv3X7dlLECsMnhyw6jyUXkVUaFTY6xjwJ5xruApsKJ3W3+tf42E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594338; c=relaxed/simple;
	bh=ZblPVCW6RisPNEnVqYsXRlK3rux83HEJD1kpftoB4OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QL2l08Ntl4H3crzZWGRUE2W1rwOheYNcYiseuf6g4r8N5GqeHMAztXv95n70Uuz0hnbiWMPNovTlxNyUh5fCnNQe5/k22xGeurmGfBN3uBRZuE0Aax/PvR0kerhyEQjRgOJDAb/c60wZBl7hiFh+zWG9+1LMec3V/WQshPZuDPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrEE2rKO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrEE2rKO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPxKA003170
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NIZerdv5856btQLeZiz5wtEr
	Wi3yo26TMxxYpxr5HC4=; b=RrEE2rKOCsDtipjqNu3tng1rbnolbgehv7+H0EAY
	FEZ3H6HJXAhgS62zP8ebfAMARG5HvgV9pM3dCS4KYpPB+BbADg18KKaiF23MAviK
	aWKYFISZQw1nOkOu4S98mILVhI3YL8NvaIbMq+tSvVxm6RH7+mPzzhFd8kcdEiEx
	CbWXr38/2kLY4ZqvMTtkyibG1i6PTw5lI3XtrE4ZMWb9yKLIWvaiLhoFiQIHGo/w
	E+U3k3aU54O3uGviqpsf8HqDgVh5HwDx9qqUoI8DI1zZ2HEvyU02MNC4Z6GZ2G6f
	vwbOSUWzItq5h2m9uqp/dgqun15+RhvbHDPEduLyoYWF4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y5tk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:25:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f876bfe0so1063683785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594335; x=1750199135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIZerdv5856btQLeZiz5wtErWi3yo26TMxxYpxr5HC4=;
        b=mgCjIsbwiQHGSCnfbCV6HfPUkHGDOa3FN9PcZ0av2fZRAxajPBXGyxPd1Zp/r3b1Gm
         mSBHpWrHu7kcjLfwAO7GVxZ+AgyovA3G/Zayf3Wl0FMYb1oVHL/ZSLD3Tya8Wkn+99Qv
         jBH6Zks98lyPLkz2Y6tLbDqxEYQyTeuT/FyJEn9jBS+CH6H261zbk7LecubU7dRVIBvX
         XKESsITMBv0j3h0JjBZUh0REU6e3ONueza+AKkqzzkjqkozuPNe/DIVE1pPIcZxuKtaE
         2N9xH/mkds9Dg/WSEIPRWmyaBvsrxv59UtfBvhegFUEUmbKHGs+836WnqTnohtEvqfJa
         mHSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIz30xKAPRyI8QMscjsGzfCVzvLliHpcqhe1mLf+FcR730gAhka+3gQ4tqzaFItYdiO8OLk1oXmqIKPUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8gLYnjjPNA+esNflvHDZAthySuElPxwMSo2vZHXXhbnovNCGe
	4T4rFpyjZy9SNyafARXYXm/tD6KmWIKEAOimqFAEIPERg7amQc4+Ja83FxDXS2x7fIx/Fl0nt0M
	qOS79BQqCGfKCDH6h4l02uG7XBWLElXTS11m4upTOQCBeHel0auYkexesMSZdITIOPE0=
X-Gm-Gg: ASbGncsiOOTaMKbLjxWE4oi1gDkqWFGRbWeMYc8hi5qeMg9fc/8KfRs/GUFaMz1fR83
	XDK2fM730q4YHRtLjDQIplpzP9WcRk8VeQj0O5m2cUsv35jwlb+kOBoMzyT6oJjWoFKqLvXtonI
	ILG80AUjtMoZY/n2mxbDjU6y0eg48NYaEmCGXoFn2U0BS+8QQznr/qHkt9WoG1YuDqXX8WbLOsW
	aOrLF7txebMhN+BPJc7270EgwtLvuM8xB59suL3PKiF9eZM4cQEcVvRgK2k6UrsptRXoOQsVRge
	vlUwla9L7k61Qer7QsdN/WmPohk/k+dr156k9MDW+1plGNAUNDjiWll+83odKA88ja00RfClvDG
	YGGB1YqrDEtltGCHMbWUe7yTyH07XKCVMrSk=
X-Received: by 2002:a05:620a:1a85:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3a8806306mr191677685a.8.1749594334745;
        Tue, 10 Jun 2025 15:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvqgKPApzu3rPogEhB0z1OsbrjkQcClCu9eRwx2CiVtQGPtd7+Q1xiMRbqpX3rcwtgL9CA7w==
X-Received: by 2002:a05:620a:1a85:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3a8806306mr191671485a.8.1749594334288;
        Tue, 10 Jun 2025 15:25:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a80csm1706310e87.162.2025.06.10.15.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:25:33 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:25:31 +0300
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
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 13/17] drm/msm/dpu: Consistently use u32 instead of
 uint32_t
Message-ID: <gvxglu5n6esoortifeyeapjlkwks4adxktshj4mcc2iyigq5fj@ztsuritnshkf>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NSBTYWx0ZWRfX4HYbkmD0YzVo
 xgsovNTv2mpinIrlqneahSvuP9Hyd0KXjX48Pt53L4PuMJJXCD8mKwgYhGy1p4XvE3QWFrsaoxn
 gWc0Mg4B9+VwTWegA8Sk9OdB88TknyvwQexDqMTTlW9mD4ToVzhlmBNY2QB1NO4IxAqpA+34k/0
 +qU3lX8/uqHTrxrwEv6VrN7yvJRsC+9HwpHhdH4HE0WPB+CvPfgWwFXp22DZlqYv2S8mbh9ZJTJ
 corb7e02MQRGx5ZPs7TorCaYo+SJW2GUmmXQ3OY6avtx8UcS1rwNivldqP/ZlNVjhZn0/RMNZZ0
 +BD2FDKKkNcYoj1b9PKhcuFGmX0JaONmU3Tk0DMTw4CI+0/LVqlN9rAo9FzBqt/YuN/uXC4acyx
 PzQsb6ATc8KloAshs1NXeQnyWpBTCLL130m6L2RvKLpW40a8wqbpkR+K+/zznxlKePRGVNUE
X-Proofpoint-GUID: _jSVObRfK2x94AGhh0D1MGWoFAOiAhtC
X-Proofpoint-ORIG-GUID: _jSVObRfK2x94AGhh0D1MGWoFAOiAhtC
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6848b0e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Sbni8NmfYZyP3K5nzVUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=810 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100185

On Tue, Jun 10, 2025 at 04:05:51PM +0200, Krzysztof Kozlowski wrote:
> Linux coding style asks to use kernel types like u32 instead of uint32_t
> and code already has it in other places, so unify the remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v6:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
