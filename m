Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573A525745A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140757; cv=none; b=AbGzJdeyW2uVRoJluxxWFiEVFIfF7F4T95r/YzKFix4SLuuo8cV1sZnGwCyKLTeW4vfIFb+VFTbkDw6NcLEEqHsHbfUQZc5cS4T72eXsM5fzrumaJNo4K7wl01GiruTDdbtGusgdvIN357YA3h+YbF6myPeWA5B0CX+mFyoFAG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140757; c=relaxed/simple;
	bh=nJhsyHoM8NB2Q1Qo/KLQehaUO1pFjUQPV+faNu30m68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pf3ql/UTqHSDcTk37SH/H7g91g0C8zgdwt8Razsg3wyVui5bP+33lXmMd0gEoAViMbC/A3L2Nuyfoh32/KYOg3WjRCadLqLX4Oqh4k3wpMYMImbz0724dYNSLFDjon0JFONNiGMic98bRPsBjrzRV8NRSqaN7r9M2FSmSJ6xSKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5m32YKp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5m32YKp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so41223955e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747140753; x=1747745553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ovgqc7rC+0i7F6t3MyfCH1QXEeImfFeRKV44bs3pIag=;
        b=a5m32YKpFpOAdpW3xs7gycMIIjos2P5K3Vo0Kmblais5yVFHECUBcEuzd2haBV4+G6
         1TuhdC0PCjrgWtMTfWByDsNPMN8Q+4zqX83boN2u7kOvqBk2I6F4NuA9WW7P5xQ1JYpd
         ezQTa8ODxZAfkmoeEtuSEZkIaJaHo5ratmP51TauBLUZTOo/VNazfML1M2ddg23LE+2D
         crvXCANCtnkpRITRezd23ivGhHeuEkfYaANPv+v2Zj9Gqnp4NbTb5UdnIQcMLTtj1TlE
         TTVMtXum662BaT/XAWhb9dZpkYu+6H6oMsjoeaBzsfxNoftJ/5cqTfQSeaG8nCkcvCF6
         Dywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140753; x=1747745553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovgqc7rC+0i7F6t3MyfCH1QXEeImfFeRKV44bs3pIag=;
        b=SOJIVB4LVh4RdVNCEgrknd4RlK8TK75BwNzlB1/MApgaPVIrCZjQLU8A2xFaJd/g20
         i/aeN/i5CshsL0OmUlduYRtw0lRkPSFgikXezMVLbAKmKMwtTHdAepE/M7nrEpYPGGzb
         QQxp9qNSQBlnmjDt9hgu7euAmacPFxH2Ea9x8bO+MZS8XSGeRP/FjVDpMVEkD28DVZIl
         NdVcFPljwsDRq/tHd65pvx8GMjIAb8coBtLcf4As01IxLPINyhrnEmOZn5lgY0WN0txT
         a+9+erXriIpAcQZAdr2Ag9NkHiK9YxxMKdk8Qrp3wR/9nEn7Ad1YQWhhDIjdpP71O4Rz
         3j4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEEh1N8rgszLvNMHGJuhRRTKAIDSQBn888uGI7LoJICITErM9CVV0V4jDO0Iikg+YYZL8bHP3h6kxxzVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxybZNFkMnzDdKUOpXuOg3NWiOupFIuViZjr9ThhjL0h72Nnx43
	NshcBbd9w19YHG2KBfAz/yT2EC90XQSEfWGsYkmXDZVwuZWsjiVs
X-Gm-Gg: ASbGncs46rLuwBv0nmSMDMnMUsGPG2y7l+n617O6T5nr1SL4NFTkOSKjWJxJP/+vwCm
	EIvDS493dEes3gB0zNDod5+F8J1v7eBgYKWgkPa1IdMaHrhAsCQWmhFeqponqruoALacJyPaEXJ
	RN3Df4KzUBWH7Pvbnq2Vzc+RgT5Dt2veT/hgv+bBMdSdRC+PPrRFJtlS/obHgNmmGa5UEfP50G2
	b44ULGtvHtq2PVlrk9SIlEdHMMvGidiuJJWBcslxXcI3+iWfVpSM6fw+AwF7mmpBuabYXmt2v7F
	VcA+a6FTT/TXIEw2SekrgTflC3Nz3hW6Vct6h9nHLFwZhmypL3/you8p/bNzGlH4ibtusQgoGlU
	QY7Hx+lkNeZ5iVDALslWT1R4zc8NT7DosAM/e6MrceRo=
X-Google-Smtp-Source: AGHT+IFf2bg52RNZJGo+rHY7+s+82rwvjasfaCxzOtsKjPH7EPA41e/9YLFWhnk4k4f0C/ZQm+pFYQ==
X-Received: by 2002:a05:600c:444c:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-442d6d3dcc8mr174303035e9.10.1747140753345;
        Tue, 13 May 2025 05:52:33 -0700 (PDT)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328455sm215109515e9.2.2025.05.13.05.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 05:52:33 -0700 (PDT)
Date: Tue, 13 May 2025 14:52:31 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	kieran.bingham+renesas@ideasonboard.com,
	linux-kernel@vger.kernel.org, devarsht@ti.com
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Message-ID: <aCNAjz1wt2lPukXv@toolbox>
References: <20250508115433.449102-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508115433.449102-1-j-choudhary@ti.com>

Hi

On Thu, May 08, 2025 at 05:24:33PM +0530, Jayesh Choudhary wrote:
> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
> call which was moved to other function calls subsequently.
> Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
> state always return 1 (always connected state)
> 
> Also, with the suspend and resume calls before every register access, the
> bridge starts with disconnected state and the HPD state is reflected
> correctly only after debounce time (400ms). However, adding this delay
> in the detect function causes frame drop and visible glitch in display.
> 
> So to get the detect utility working properly for DP mode without any
> performance issues in display, instead of reading HPD state from the
> register, rely on aux communication. Use 'drm_dp_dpcd_read_link_status'
> to find if we have something connected at the sink.
> 
> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> 
> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> 
> v1 patch link which was sent as RFC:
> <https://patchwork.kernel.org/project/dri-devel/patch/20250424105432.255309-1-j-choudhary@ti.com/>
> 
> Changelog v1->v2:
> - Drop additional property in bindings and use conditional.
> - Instead of register read for HPD state, use dpcd read which returns 0
>   for success and error codes for no connection
> - Add relevant history for the required change in commit message
> - Drop RFC subject-prefix in v2 as v2 is in better state after discussion
>   in v1 and Max's mail thread
> - Add "Cc:" tag 
> 
> This approach does not make suspend/resume no-op and no additional
> delay needs to be added in the detect hook which causes frame drops.
> 
> Here, I am adding conditional to HPD_DISABLE bit even when we are
> not using the register read to get HPD state. This is to prevent
> unnecessary register updates in every resume call.
> (It was adding to latency and leading to ~2-3 frame drop every 10 sec)
> 
> Tested and verified on TI's J784S4-EVM platform:
> - Display comes up
> - Detect utility works with a couple of seconds latency.
>   But I guess without interrupt support, this is acceptable.
> - No frame-drop observed
>  
> Discussion thread for Max's patch:
> <https://patchwork.kernel.org/project/dri-devel/patch/20250501074805.3069311-1-max.oss.09@gmail.com/>
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 60224f476e1d..9489e78b6da3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -352,8 +352,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
>  	 * change this to be conditional on someone specifying that HPD should
>  	 * be used.
>  	 */
> -	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> -			   HPD_DISABLE);
> +
> +	if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
> +		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> +				   HPD_DISABLE);
>  
>  	pdata->comms_enabled = true;
>  
> @@ -1194,13 +1196,14 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  	int val = 0;
> +	u8 link_status[DP_LINK_STATUS_SIZE];
>  
> -	pm_runtime_get_sync(pdata->dev);
> -	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> -	pm_runtime_put_autosuspend(pdata->dev);
> +	val = drm_dp_dpcd_read_link_status(&pdata->aux, link_status);
>  
> -	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> -					 : connector_status_disconnected;
> +	if (val < 0)
> +		return connector_status_disconnected;
> +	else
> +		return connector_status_connected;
>  }
>  
>  static const struct drm_edid *ti_sn_bridge_edid_read(struct drm_bridge *bridge,
> -- 
> 2.34.1
> 

This fixes the issues I have with detecting a not connected monitor on
boot.

As my HW has enable under software control but the power supplies not there
seem to be an issue to properly bring up the bridge after a disconnect and
then reconnect. I can work around that in the device tree by not adding the
optional enable gpio.

As such on a HW with a DP connector and a DP monitor:
Tested-by: Max Krummenacher <max.krummenacher@toradex.com>
