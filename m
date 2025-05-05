Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CF5204C2E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448022; cv=none; b=jsd9cBIlEOhgbKxPfQ6VOPh8hf/MkjxlfUthKPcAY8YkUXfwRblkwArX8QjIZBh8Gn+Xjw9QidF/0KOh93BuiKcY4fosICn1cIndxuQuLDPUZ2D4y/AwJm2l5L+GpXyafCWj+tQn+0A3hw+r+4Z0xlpG4A/gkxEs12bjwp5FMbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448022; c=relaxed/simple;
	bh=/p70rkRqnMYx3U9ktfseD6NXbe/+GaD6xbDbp6Jd+bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpMpa745GvOZUQov1W3UlbCs2jU/SWroGU3zpa6iEfdg933OTEsd7TqnZW34wWCcewjyCk9k2Ll+d9wjcAtr6CoxyGhUlfyX89BZEQ6yqL0yaLvFa+2ttMwcRtAEI0I33byuLwlqyo7vgfR5EvfnF55zaUBdC6wxu7AB6IYHsTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Snwu1JF6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Snwu1JF6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CQB3V001905
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 12:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1mZ5cx/TFXOUdnYEfCMZ+itC
	mBzAFu0OJ39D1ob48qs=; b=Snwu1JF6jiDnY3FnTue7MIWf3tpumP8RkSw4+rAX
	67EtRve8C3jCOXwHxrZMnE5UsZ42i/fBuvqOM8g5j/VbQkqK3I+b6GHct9/tvlkk
	j3Qms1NM4WIORBQTCvXfBMf0wx7PWUHjhXhfjpuaWdS0gx7fJwa4h3A85GGdaTt5
	Y38zaS+8VwCrG2zORN1ZMka5guvz4/k/EZgYjqVgHIGrUlZreEYegpQEYC2QKF3P
	XAg+P5hIuheUREnqHtJkExAWD7wDigOAH1pXgF6IBJNNh/BpcsBYVmlrarDXi2ND
	AMTlKBEDDoqpxABuxKaXeTdTtX+ex/YhnVmyl9L5ILZY3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5c2c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:26:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so138555585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448018; x=1747052818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mZ5cx/TFXOUdnYEfCMZ+itCmBzAFu0OJ39D1ob48qs=;
        b=A0NDBQ1j/plSa7ebjpejmOt5gjXeubjxfWzudYyB3MT0YRwS8sEqq+UNkRhrPDaYSp
         OY4IyzeB6B/0z5iuMCRfKJE674tge1Mi2yC+zwA9GXecvzjQexrtsxuCXWAuBIRNZTMl
         tGhaOyBKtT7cdVFuD6uhSS/WnW8cRhi63D6rmJsC1VEdOiz0lj44NCEC+qLbXO/79WDI
         5yy4QssXhtZCAFNJbzNPnkqtq9uzkcmFWfYR4GM7cUAC0LWu8elvRGUC21jlZ/uOdf+t
         MB9paicVujlvVSywaP6YVEFj2Fe0xTgDqLgR5wcfSEinmNxD/LkU9KjjPJsSx68J9+rW
         Dd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAdzL48paVq5lxci9ptpEoxXkPEFuMqt+I0F29PUjmlpRFaSUo2JzVHTfKakbeFljvmuXwBLncFaui2kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLXEwHRtd2/DJG2GsU0xwAAjkj4Sario10lMWUUCMZa1BB/MvV
	bONJIZ1OQ5NoP2sylJuZaBVEzp6FmlxMXuPJqS/QJbtNxciDxI0LwvuCE9HGcNdPPM8qP5xKqXL
	WYC3hPSB3x1p5L/SpadzFoUJ6Qjk44u+c+x7BjDCq7cxTWGi6QMoV+X1528ZWYhE=
X-Gm-Gg: ASbGncs/qKENMJQ8iSUn4bxhTZ9Isafw0+QSrbCKyfz9+99LfplashttTLNKS2R3ik4
	gQdfJm2y+6OaLQoCpKDGIO7s90AghdXjDi3PclHjAQA4Gwv919K1+K4V+1QKrFiFAacYwd3dG/d
	sMMbubc9UZCo1V+E/dzTb1gV4RCcXCXrRcdeaBTivwpIPgvfTpdmnpbLpCMtKLTaEWE5Nq/gVgb
	JgIbYHbC68RXcjp/ac6RXkbxKC/ee7nI5rwZbgsgcS+4re5QwXhbar+RvbX3t172pgcWGgH4pzj
	N83Ph8J3UmP5QK+XSxXTtW9VjpDiZPkcIbaJTeHbWZli95Wl7MOLwvqwkgpS37VN7xVTEVa9L7c
	=
X-Received: by 2002:a05:620a:44ca:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7cadfdd1fb3mr1066502385a.14.1746448018576;
        Mon, 05 May 2025 05:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbP4vMWfoDCZb1OxRZYoOdMiV7yVyeGR4Et3hvHSFh8b7ad1aFuUaJ40fNUggHnRpeog6jYw==
X-Received: by 2002:a05:620a:44ca:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7cadfdd1fb3mr1066497885a.14.1746448018233;
        Mon, 05 May 2025 05:26:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017379sm16984351fa.31.2025.05.05.05.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:26:57 -0700 (PDT)
Date: Mon, 5 May 2025 15:26:55 +0300
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
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 19/24] drm/msm/dsi: Add support for SM8750
Message-ID: <d2dh7lolcc4h4jr4zytc25tjcj4wyuoo55wk2vs4eaqensynme@txkk56x3zm4s>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-19-8cab30c3e4df@linaro.org>
 <ahx623ttvzd62u4fri6iqguj7mirlf22tvwbu6k2ngxw6hwbcp@oh7mmex5fjmz>
 <5c307e88-a3fc-430b-8ccc-af59e2097da3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c307e88-a3fc-430b-8ccc-af59e2097da3@linaro.org>
X-Proofpoint-GUID: VBvrEA5VGidDuRTFyUpU6me6kUgihjOG
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6818ae93 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=GiW35wlXn3FmTEwGCggA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VBvrEA5VGidDuRTFyUpU6me6kUgihjOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExOSBTYWx0ZWRfX6/K16TbwGqvq
 8U1YtZaEgNHXPO9BU12zl1VobtADzOTNNk1MkoVGeULEB/bQ2UPjKcmRowtZMIC7d8kjKkGHCdP
 4gr/tTBmWpVGcmqq9RhaNM5O3sy9E0x1uZWUr95w22AcksESAbxEKwpY5ElBa2gn6ExzA+MnhIF
 Y9Pqx41CVrE28MWKzRRIbG2fLfGD0Bgr06Ebv3OY8f/H+JsUHxVb+udQR5WMhAUlMBDHTr81yTj
 lN740rZ7+smOgYK+6EvM5UYpLdxoCnC3Jm5QwC//P8npN1GFuwOtbnOCWLLsH8CbnzIewYF0r2O
 Tg6XvpWbNEgxG/kQILLe54/do8WDe91HH8xu+vRqqakEY+bf20CDd9Oj3ufEZ6S7+HP3nCUXq0h
 bM0qL3Hose0j3EbwRfMAJKDDC2wlyK6gfC+M4KEqxGr2uLmudCoWvTDtQUC2nxI192lc5JHU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=713 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050119

On Mon, May 05, 2025 at 08:45:01AM +0200, Krzysztof Kozlowski wrote:
> On 03/05/2025 00:52, Dmitry Baryshkov wrote:
> > On Wed, Apr 30, 2025 at 03:00:49PM +0200, Krzysztof Kozlowski wrote:
> >> Add support for DSI on Qualcomm SM8750 SoC with notable difference:
> >>
> >> DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> >> parents before DSI PHY is configured, the PLLs are prepared and their
> >> initial rate is set.  Therefore assigned-clock-parents are not working
> >> here and driver is responsible for reparenting clocks with proper
> >> procedure: see dsi_clk_init_6g_v2_9().
> > 
> > Is it still the case? I thought you've said that with the proper flags
> 
> Yes, as we discussed many times - this is still needed even with the
> proper flags.
> 
> > there would be no need to perform this in the driver.
> 
> assigned-clock-xxx are not respecting that flag and anyway, even if that

This is really strange as the flag should be handled by the framework
itself.

> was solved, they are executed too early - before PHY is initialized. You
> cannot prepare PHY PLL before PHY is initialized and enabled.

Ack

-- 
With best wishes
Dmitry
