Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EF91E4928
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 23:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739142727; cv=none; b=rkhVVCrOyRAXicIdY86Ysv6+d5Pu2cvR81+9e+3ySwJx7XJ7rAq8VbyHAHO97FooiWaKfjxIs5AjyHMKgbME0wxZfVyAPDKGcgQC3CO4LkveuWTjP6ysWaiRrW1Ew9q9o6rtN1OHy8m52QgAih9LZeHmSOgdqud/3iu40VNd/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739142727; c=relaxed/simple;
	bh=GkQTtG9hVz8ToxKu6fUNzw7ncBXdXnpvtOjdVioIQEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1JCfm0QhY3knedJA1QBoM3jMvQYOfrUOeLd8XQi7GYcS5QWZbmw0Bfq6C9NSOgdLihkNQHq9737y9AYRDH2phK4KaHw4X3co2VOOhgQD1CaqoEL1o+gmSXY0cdQYLKoZk2Tudzl/urhkQmYN1Ei+2Kpsaaf6I1wRr+siyHGRVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xXv14nIm; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXv14nIm"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5450b91dbc8so457623e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 15:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739142723; x=1739747523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+vFPwFXM4bR9tYX9V6EFmxAhSw4debbGpPDSv0t249A=;
        b=xXv14nImjQeeCFBzKyfB4yxi3S1BeUz1A1P8CLctwReP4fwpYgGLpEJMFrQJN6w9gX
         513rkpVigJJsfZCUqciHGu2rr7pHXuk37zfRdwVk+9XxJqcYIU0qAfOyaXfR0Ek/R/DT
         N97KHHBUfyccdZtp9+ssDBxwVUpq4KNrs1YzhEKsoRq3sFbHSrz++Gh7i9z+fpEmFOKG
         02UynE46OnjKKEKI+BJ5+r8Spr2348ow6lZoqlONjdd3/bCsEzFv2ympYotXhp0P20Im
         KBxSgtkfvFdTnoHD21ywEHRiK3TxSA2+tpgsEVbJ63wfvMJ6SZQWif5tNk6vLuclZ/e1
         VOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739142723; x=1739747523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vFPwFXM4bR9tYX9V6EFmxAhSw4debbGpPDSv0t249A=;
        b=bP634KKf9QelC5+u4pQMGkW7rzKlw+ew1XdDkNSUnlwBcEoYh7TK/XnGA8XynIv3TL
         4rOxXtcrruDe+hn+4tc1mvTLmjTsv3+GvlUiSD5OWg4AT+4SMlDJacypbbU1DPJLofKf
         sWqT62S7LCajnUS4e1SBqVJBdVc17f2zQ9nQCPFxzLF8fHV4KxN+sLrTG4EIpvMn4ZHA
         tIv2bXJ8RzFrh9E6M8SZD0Z/oxb6uWwcPEMHbxnEy88aGkEy3uk5bn412bkrqWGfeFWl
         s5XcEDW+0O4UTlpxozDuBraYdEteJOUfmjpAExV+vJBqaz7CRYOP6LGaBOfQWEEtKsSC
         FtEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG6DzJK5i0dyQp27HkgY9JtcjDp0jF4dcMeVYOftGmIy0obt/GjnCbpPQRdx0ug+4e9ug10RmTnR9IOQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4kBFsIX2nwHYIvseSv9WOtKud8Ot5gCwg/L91CxgwkMPnfGqS
	upOa6ep15UKJZ3dbFlssH3dvjd3TksSjvYoQq1abCZvhQ4zOhb5YkpEaRTygXwU=
X-Gm-Gg: ASbGncszR2Zmy7/9BSOtXvlIthukAGCOjlMf/lyrGuQtGyxMji14Zns/WzkECvzKt/2
	zRjTx776qxjbkTwZKwol5IkRKArbmCaXlDDsktIIuFnvk4q2zFe2RWSB7ewz7D5TNcLo25i7Z3C
	FOclHiS7UzcGiUt2VZe3XZhs2JZSSpM705R0NY44UJTD98adv97ISYovqXzxvxaTb0/q8myRaHc
	5zvQSXwnrk20jtiAwYqhADAIh/I7Fa9Dp7Sr9Z8jIHuF4sOK4BpPtPcG86M0+EDaWHVBYr7r3uU
	4Km8JvWVEQB3iay6e32NUo+q/yNmD7RJpzLRU2Zw6cGtmcIiS326x5FGgHqbuVmkP/AzTBc=
X-Google-Smtp-Source: AGHT+IF00rLDAE/Zu8DuAgn3EOiGHavqn93g+Q4K+br4ppdg5/rNEYRwOpkH1xQrqhqfhAl/+SpNmA==
X-Received: by 2002:a05:6512:6c5:b0:545:a89:4dc7 with SMTP id 2adb3069b0e04-5450a894ef0mr906708e87.52.1739142722973;
        Sun, 09 Feb 2025 15:12:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450bb646a5sm208604e87.146.2025.02.09.15.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:12:01 -0800 (PST)
Date: Mon, 10 Feb 2025 01:11:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
Message-ID: <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>

On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> Ordering issues here cause an uninitialized (default STANDALONE)
> usecase to be programmed (which appears to be a MUX) in some cases
> when msm_dsi_host_register() is called, leading to the slave PLL in
> bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> 
> This should seemingly not be a problem as the actual dispcc clocks from
> DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> bit still seems to have an effect on them somehow and causes the right
> side of the panel controlled by DSI1 to not function.
> 
> In an ideal world this code is refactored to no longer have such
> error-prone calls "across subsystems", and instead model the "PLL src"
> register field as a regular mux so that changing the clock parents
> programmatically or in DTS via `assigned-clock-parents` has the
> desired effect.
> But for the avid reader, the clocks that we *are* muxing into DSI0's
> tree are way further down, so if this bit turns out to be a simple mux
> between dsiXvco and out_div, that shouldn't have any effect as this
> whole tree is off anyway.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)


Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
>  	int ret;
>  
>  	if (!IS_BONDED_DSI()) {
> +		/* Set the usecase before calling msm_dsi_host_register(), which would
> +		 * already program the PLL source mux based on a default usecase.
> +		 */
> +		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> +
>  		ret = msm_dsi_host_register(msm_dsi->host);
>  		if (ret)
>  			return ret;
> -
> -		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>  	} else if (other_dsi) {
>  		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
>  							msm_dsi : other_dsi;
>  		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
>  							other_dsi : msm_dsi;
> +
> +		/* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> +		 *
> +		/* Set the usecase before calling msm_dsi_host_register(), which would
> +		 * already program the PLL source mux based on a default usecase.
> +		 */
> +		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> +					MSM_DSI_PHY_MASTER);
> +		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> +					MSM_DSI_PHY_SLAVE);
> +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> +		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> +
>  		/* Register slave host first, so that slave DSI device
>  		 * has a chance to probe, and do not block the master
>  		 * DSI device's probe.
> @@ -98,14 +114,6 @@ static int dsi_mgr_setup_components(int id)
>  		ret = msm_dsi_host_register(master_link_dsi->host);
>  		if (ret)
>  			return ret;
> -
> -		/* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> -		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> -					MSM_DSI_PHY_MASTER);
> -		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> -					MSM_DSI_PHY_SLAVE);
> -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> -		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
>  	}
>  
>  	return 0;
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
