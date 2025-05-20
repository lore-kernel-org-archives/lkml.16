Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AE9281360
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771637; cv=none; b=JMdiKdl/O1dojTgxdKDlAzcb0W3FUuJ4DbU/xFVRb3gocwJiQrAsnGt8efryCwA132SO+VoqVExBgFtsM4R+lTcvGZG17JjMgt99IueSr+UAfqoWDiMikV8D3HKX92sfAZ9Zi4nZ6h68OGZ9Q8XmR/IeVq2Dfj2igxh3PoMjrps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771637; c=relaxed/simple;
	bh=XPuvDT6TSWe7zvKeUnoGJQNymZiLkHqbbi39dBJDQqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LULa8m93uz7nYvbNBirsxKQlK9FcG3wZjzJ3mOcxwV4VGTvTdsrpvAQvQ5PpqFbDIbhOPWqMDKb8+EuyUKL8TPuckYqYhTZZzFH0KiUwXQkf+W8SpT6+6xJRQUSVaxqdoaMlKeg2AJK5DrSNFOgBsAllBn3IRcGq5zra9k5F9MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zo+n/FMs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zo+n/FMs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe0w1000714
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4+TilPmXDGw/Gtk0BqOASle1
	/UOmT/X4bq+tNDck6q8=; b=Zo+n/FMszjKFBUWpEfP52eZJPyhg4y7h1VjyQptn
	9X1oEHTRtb/0U2ZF5HaCpX3xq4i0JAX1yB5ZmxqXyKSBliCiigqjulOhXff3qJcc
	/JdtG9DuzWUM2DYKZR5aRquMgfE+Rzow5zwtpHbN8llRmKPpqJ4INUe6k+CmWabu
	YEkNKSuTQsIp7oLRHDO3DBSS5kPpQTAP2gLg8K6avYEhLg86cQQc0jddhdm+vL0o
	qz4L76TeOq9SjQ6V/NsS5wiGmqHuHCvc24JhdSEHwIYWEc8jc19EeM5zFj9+dHnh
	WevVPQU6n/7qtHLVAryGlXgb4E2z5572+nZcaEzo6x+izQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4rga9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:07:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5293788a7e1so4521675e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771633; x=1748376433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+TilPmXDGw/Gtk0BqOASle1/UOmT/X4bq+tNDck6q8=;
        b=H7KSJJLHVr6zU0gaEVUs+qHc1R84QSI1/bdU20uGAG/6NlLd8+tF29yJVVZuzsnzpE
         xIUX4KnNoSroHBtKlvGLOjk87BXhAlSNQnwBgPBjZenWxazpS2cH6hG+pOtO1KpKpYlx
         JDcBQFm29i6+m/y3yTLCnXIDdTuj/l9QFdSXV6iUGJuKdmIeU2wB+3lQNoWaQGA1h+2i
         pMo4L+ZEQ6X+I0MOYPgcj4Rq+jRrTWhz3F+tLSsDk9sWQdjZjy9TnlzQY2lXzTLayt0N
         GcKYS+cI9ZU9zCCLfKPlA0QF8FJiO7VBoIAF8G0M+eKGpa9r+15jBahmzCY5rhaexxZt
         o7aA==
X-Forwarded-Encrypted: i=1; AJvYcCWssrdN2wED4e6xK9buSkUg+bA+ZZEG83EFzVKgpcGCoX7rC3XvlfIhQll55G8K5wT1RgBEGqmYrG/JXSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6CXNniAqycdjvtWqAMUXoA6cljbFMnyqI8HOJixSQw+fB0Uv5
	hI8uIl+W/x6wHw2etHQ8cszpMQw7M5iq5B1AUcGQiSj1b7khOaBgzVpPqjReuS8+A/h2XakAJL2
	9q8E4WYkqdOYj2SbWBW7clh0t+dtYghsxLg5CaNPUoG6FKC/udRUmmWVE0qJGli1o/pzvctSh3x
	wseg==
X-Gm-Gg: ASbGncuaFAD/eOYZP3IDQAYP04oebkXqx4ErQ2HYFnSlB3FXk8fdiRNx9wqWh5j+iTm
	rqCCEuWVBU53Cc8r4apDPhX9k9LPmU56rfScsPqBwFaCPJblXIhz23oIm8JQFN+G6cjYRFzLv1U
	G7Haq7OBfuJlbLL8o554gMWwBQZpi9cDnyJi0B6+r8FKg9PShyM8cVZofxAEe0UVSUAOoiJYFCa
	TVPOuWGU38UFAtgvueZ6KGhg/kzcg9Zvt2rmi7zxMXhL+ujyJiKBCY0A8DumHaV4Uy9db7xcN7F
	ixs1+/Nb+/F6xhVPdeEdN7XjXD6WJnYPQ+CGwgkvvJS+JCLO2321hXCi0Nla7CXyrsX3M+e/M3I
	=
X-Received: by 2002:a05:6122:31a0:b0:52c:5590:72c9 with SMTP id 71dfb90a1353d-52dba8909a4mr17000978e0c.5.1747771627835;
        Tue, 20 May 2025 13:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ0ooob77YB33x3sc9TZXU71R5l2H/nFxJ6YO2AEHokNTU7hQE0QXzh10z0MZ3u3nyRxcaMg==
X-Received: by 2002:a05:6214:1251:b0:6e6:6964:ca77 with SMTP id 6a1803df08f44-6f8b09023b4mr282754806d6.28.1747771614002;
        Tue, 20 May 2025 13:06:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f18sm2485042e87.158.2025.05.20.13.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:06:53 -0700 (PDT)
Date: Tue, 20 May 2025 23:06:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Message-ID: <3ywacd4x23zadvwikw4hdprgbgxxdmbcar3lyayy4ezmd5lcyw@3h2oosmbk6yb>
References: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: UU6HwpFfu8TsqLNnqmOuwtlrHbh1UaDP
X-Proofpoint-ORIG-GUID: UU6HwpFfu8TsqLNnqmOuwtlrHbh1UaDP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MSBTYWx0ZWRfXwvHUOX9JWl2o
 SItqWUm3S10XVVOd/83YvpZC8k3awle989i+2P/hi5TTCsJ6mRkZeKigdIkB/7Gfh/DPvImVGQW
 SWwr1qMFvC4tRWeazD9A/2ZbsDMxufd/Sr0X6kkmooT7wMhA49vVjNnCCRS5Ygma4TLkSmslFwp
 Xm9Nn6+o6Rm+gEq5sHW26fp9W52IF9CfqPaPoDwjMCXX7ThvvjUoa+Q8LXfkaQ5ooNfZEX02xLF
 di6ws1uXxkzV/MN/02Syzmz2FuXK39bNhoTHnDKVRz4Gr57LH/eaQvjD/zcsYyilQSHfqJX/x9h
 mq24DiSqEAcnLRdnhT5jSXFEbMqocH3RcGV90MToxKyNKlIhBDmNTDdQnIyNoUdC5TkWjU0825+
 ojf/ImKON7D5ECWeDPyji1jTYfyBy1Ucrw4jlRBgyp2XsSX2nXmCP+iU8nlZpc5okY7ikNNJ
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682ce0f2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qeqVY09uaiYIOShEJ-EA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200161

On Tue, May 20, 2025 at 01:13:26PM +0200, Krzysztof Kozlowski wrote:
> Driver unconditionally saves current state on first init in
> dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
> divider registers.  The state is then restored during probe/enable via
> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> dsi_10nm_pll_restore_state().
> 
> Restoring calls dsi_pll_10nm_vco_set_rate() with
> pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> tree.  This makes anyway little sense - VCO rate was not saved, so
> should not be restored.
> 
> If PLL was not configured configure it to minimum rate to avoid glitches
> and configuring entire in clock hierarchy to 0 Hz.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Fixes?

> 
> ---
> 
> Not tested on hardware.
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 9812b4d69197..af2e30f3f842 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -704,6 +704,13 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
>  	/* TODO: Remove this when we have proper display handover support */
>  	msm_dsi_phy_pll_save_state(phy);
>  
> +	/*
> +	 * Store also proper vco_current_rate, because its value will be used in
> +	 * dsi_10nm_pll_restore_state().
> +	 */
> +	if (!dsi_pll_10nm_vco_recalc_rate(&pll_10nm->clk_hw, VCO_REF_CLK_RATE))
> +		pll_10nm->vco_current_rate = pll_10nm->phy->cfg->min_pll_rate;
> +
>  	return 0;
>  }
>  
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
