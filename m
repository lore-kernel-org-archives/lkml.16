Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB59A2528E2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197488; cv=none; b=Dt37oINuFPPpWZS+BDYAd/qrXre7JF23tIlqSuO3HlD11qk+5yEMdp3XpN6dpPZxGP1WsLeefTxBqhu7z28KAe3i0z1CLWqsM/B6flK7i1VrlFaZtwhhtjRNc8zgjFtsGBIBd4Y+gHCpD09RH4ySjAmiwwbsOL/z6nNSiwK0rgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197488; c=relaxed/simple;
	bh=MlzTlURcRazNKRPERcpu3wWUiDsFAtTTqDclBmXqKAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us0tuJDZ8vdKT0srfM4w08lmu3wQR8+iLhNaULL6P7OuTXNLahvwVupasb7dEw+klZzWNEC+I+Dt322X1pRDTUEIqyo1sK2TnU9cIIYF08WR9SpBFVLddhaIGH93FWrtyOHcb8ja6/zGcjf8RgvqHy9cO8Gwib3H2cZg+m3Siqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vxl1HXsG; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vxl1HXsG"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5450681b606so1749966e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739197485; x=1739802285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXTOeRR1tSy6DIJNpPaZKkX1fXiI12lzCj4/r2SjPr8=;
        b=Vxl1HXsGRFJgA10jD8qY2rdx1WSujjTGe7uqrc19jbJgltu0xz8WvseaP3USiQIQmF
         lURRcVHcjxmlbtTbbIAFJynLtnM+8MGN8JsljvPQ+obGjcK2w4Xxjv/6tM34lqNIZfR1
         iOVkXhLX4ywG6aPXBqf61wBVSNIz17W7VtTTRL/NZIDHfKxBqxyr5NfcQ8I+u4to8gvb
         l9lEkS38Z2CLPzq/ISJlazBNpn3sAcKjrxHIg6c89smvZrGqDF+zSs3J5eGRGZWqQLD9
         AyI9FDC99VNY4UYjtpHchU0QgAI78Cvye4hgudQ1xQfCTX3SZEBmEVHB2FM0xFIpkd1B
         nSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197485; x=1739802285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXTOeRR1tSy6DIJNpPaZKkX1fXiI12lzCj4/r2SjPr8=;
        b=GWFQn1ta03Zz0TmHwykw4aGsn1/YFGipc9uQQyPV7d31yTNU4sF3CqWrg1BxDYqiZX
         nLnMZw5E6oIr9ZlYhWzhK+ixhRZCrVuJ8g85U4X4CQqjpgBit4hAU0oUgtI9DvsTQhGk
         1ngYhH1ejRyXEM64aG6N6Kk0og0g/6tICUVqoiRo/sht6WYdoW5pYtfHI4M1K7VvYwFs
         UuyhawflWd10iRgsVrRJVojTMF4Fn2eGVBHekVd7z9j2SX/Y7+5fNtt8gyr+N+ul/9cT
         NGH0oSj5N/nWkCAIkkORl3kY+wAqAljq/3Um5oKxA8/u7jq/ydcJ2u97jWfoOJH5MN8p
         RvIA==
X-Forwarded-Encrypted: i=1; AJvYcCWrggMh3evMb4Yfr6DtcAMpnCifqk/EXmmbDfofG5QI5+HPMP3qd3LYtNRRwKTQ8SCXMA0yBQrCKvP9vIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLfKDvPYH/LaJuhu+LoRyfRaYm11zi/UhEreIwOfgOLzX3mrL3
	CdWWZxCj9Z2TNmclFm5kxR0h1qVji74IPpeu3eei1EPbcHN2Gj1Fet0mx0tkRnc=
X-Gm-Gg: ASbGncvBoTxXlR6/Kx/FcNdYsO3XgYJN4CS4ZjCdAMw7Gt3jti9o3k5IfjJLlh5y2UW
	yMu5R9RuZQc4aYZzW2xzMn9TCIV6nm06k1lp1n7rmxorQ1fL2rhykHdKsudOlKZyvrcc/D7GlES
	Dase+TrpIMhackkV2YJ5lfNo0J1wmkFFjwW8BVYFvJzVJLbs6KZAT8V3mD/a9iY/8ynmx32yIu7
	R2IRzxg3twV1C6Vfop1bIBgiN21HhigoWffe9hBQdTUpb949B1ZAfpqCsgMEBlIxi1NTjwhngNl
	pqw+hMdcxdrZWsjjQF5pV78bmQZnFGdNUnxi7QVVWrIG3h5cY2dZBe8xp/VBzjWymLIb3K0=
X-Google-Smtp-Source: AGHT+IELaktaXJDIQE5h3TJtIdi4mlctf8TeZ8f9LCc0ZKKRgqhqCKUX1/reDvwqcfshWriFj4Hheg==
X-Received: by 2002:a05:6512:2384:b0:545:d45:3958 with SMTP id 2adb3069b0e04-5450d4539a2mr1325590e87.31.1739197484772;
        Mon, 10 Feb 2025 06:24:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bfe6fsm1261556e87.110.2025.02.10.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:24:44 -0800 (PST)
Date: Mon, 10 Feb 2025 16:24:42 +0200
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
Message-ID: <x4jced57uhdfnq4d7tdqsozxbdosu2fcmsjlqtuuvh25ltx2rc@2eqsa7e4vcdv>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
 <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
 <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>

On Mon, Feb 10, 2025 at 01:54:29PM +0100, Marijn Suijten wrote:
> On 2025-02-10 01:11:59, Dmitry Baryshkov wrote:
> > On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> > > Ordering issues here cause an uninitialized (default STANDALONE)
> > > usecase to be programmed (which appears to be a MUX) in some cases
> > > when msm_dsi_host_register() is called, leading to the slave PLL in
> > > bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> > > 
> > > This should seemingly not be a problem as the actual dispcc clocks from
> > > DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> > > bit still seems to have an effect on them somehow and causes the right
> > > side of the panel controlled by DSI1 to not function.
> > > 
> > > In an ideal world this code is refactored to no longer have such
> > > error-prone calls "across subsystems", and instead model the "PLL src"
> > > register field as a regular mux so that changing the clock parents
> > > programmatically or in DTS via `assigned-clock-parents` has the
> > > desired effect.
> > > But for the avid reader, the clocks that we *are* muxing into DSI0's
> > > tree are way further down, so if this bit turns out to be a simple mux
> > > between dsiXvco and out_div, that shouldn't have any effect as this
> > > whole tree is off anyway.
> > > 
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++++++++++++-----------
> > >  1 file changed, 19 insertions(+), 11 deletions(-)
> > 
> > 
> > Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
> 
> I'm not exactly confident about that.  Abhinav pointed out in
> https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2375646 that
> msm_dsi_host_register() was not supposed to be enabling the PHY, which I
> provided a counter-stacktrace for to show that is indeed the case.
> 
> Either this was always a problem that's only become visible now (and it's an
> issue with that patch), or a different change causes msm_dsi_host_register()
> to enable the PHY and program the usecase too early?

As currently usecase is being programmed after the DSI host being
registered, there might be a race condition between panel driver probe
_and_ usecase programming.

> 
> What do you think?
> 
> - Marijn
> 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
> > >  	int ret;
> > >  
> > >  	if (!IS_BONDED_DSI()) {
> > > +		/* Set the usecase before calling msm_dsi_host_register(), which would
> > > +		 * already program the PLL source mux based on a default usecase.
> > > +		 */
> > > +		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> > > +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > +
> > >  		ret = msm_dsi_host_register(msm_dsi->host);
> > >  		if (ret)
> > >  			return ret;
> > > -
> > > -		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> > > -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > >  	} else if (other_dsi) {
> > >  		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > >  							msm_dsi : other_dsi;
> > >  		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > >  							other_dsi : msm_dsi;
> > > +
> > > +		/* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> > > +		 *
> > > +		/* Set the usecase before calling msm_dsi_host_register(), which would
> > > +		 * already program the PLL source mux based on a default usecase.
> > > +		 */
> > > +		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> > > +					MSM_DSI_PHY_MASTER);
> > > +		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> > > +					MSM_DSI_PHY_SLAVE);
> > > +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > +		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> > > +
> > >  		/* Register slave host first, so that slave DSI device
> > >  		 * has a chance to probe, and do not block the master
> > >  		 * DSI device's probe.
> > > @@ -98,14 +114,6 @@ static int dsi_mgr_setup_components(int id)
> > >  		ret = msm_dsi_host_register(master_link_dsi->host);
> > >  		if (ret)
> > >  			return ret;
> > > -
> > > -		/* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> > > -		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> > > -					MSM_DSI_PHY_MASTER);
> > > -		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> > > -					MSM_DSI_PHY_SLAVE);
> > > -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > -		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> > >  	}
> > >  
> > >  	return 0;
> > > 
> > > -- 
> > > 2.48.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
