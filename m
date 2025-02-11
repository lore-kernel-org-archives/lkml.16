Received: from smtp.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0972505DF;
	Tue, 11 Feb 2025 19:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301456; cv=none; b=CY3N9uG3W6fU1ViRvkA9bV3CXTjJNmDE2sx65GsMRrHrF4GYUcNDm1f6qE6tj8WS5cdckJKFDONCLbpXoGuAVz5Eg0Nx11hZXYjiMQUBmIiVJbgY3o9OJAMPoyDORU2tHBJVD4ZMxv6JZCckheOnAdYelgp7KF3nzcRNq4INmJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301456; c=relaxed/simple;
	bh=ASaC2e+tDeLUOisSnGSZy787GJMFs7GnJk4X0T9KNxw=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=LrDSYvcJ6K/J7TzWT7+u5+d3SUcHgqBiBCu4MtyFPaqoKqnSlVOXpNyINCC8c/7pHAhXz13feIAPrVdMwW8xo4C1gpnoP+mpTP5LWNqFlInFbt8c0xcspdiuB6C/qWJbQevwycHhfVlb7YN2qPBKAwAEe7U/R+2TKsaJk91hAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=SBzCIS7C; arc=none smtp.client-ip=80.12.242.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SBzCIS7C"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id hvjztIygzQ2A9hvk3tEnUB; Tue, 11 Feb 2025 20:16:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1739301382;
	bh=cH43ckbxkmqeH4mk5wN+BIlfdEqOZW8FE1jnkTs7Pj8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=SBzCIS7Cos8YlytVW/viykz62E5IEiqEIQHah3CFWrLE7vfN7KIPkmdyH8iGKEq+S
	 jKaPNTIndh7Egp0zTnKuhTlqSIPFBvBEwqvnSX5l86uGtVS2/2o4J9JMgeX77eFVUH
	 8NYAdyjfUr6tpxyYg8+5FrMNGeSPPWxyGIK0YZ5w1g2gjjHcac5+RIcRLEOglF7Faw
	 aBVRjhTxWVTNRCSKEVVVJOkGXwfku/PK4My3DSuzz2STZTth4F3007Ii4RfVpKgSE2
	 Co1xWlvL3kHGkY9Y5+iINwhlwl84yPJrZ7/zUE760uusLcphPCdE8mSzXlnduWMETA
	 t0dY3YxJkl8PQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 11 Feb 2025 20:16:22 +0100
X-ME-IP: 90.11.132.44
Message-ID: <a72cb224-2cae-44a6-90d5-87d9f4f80044@wanadoo.fr>
Date: Tue, 11 Feb 2025 20:16:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm: panel: Add driver for Himax HX8279 and
 Startek KD070FHFID078
References: <20250211114429.1519148-1-angelogioacchino.delregno@collabora.com>
 <20250211114429.1519148-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, pablo.sun@mediatek.com,
 quic_jesszhan@quicinc.com, robh@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
In-Reply-To: <20250211114429.1519148-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 11/02/2025 à 12:44, AngeloGioacchino Del Regno a écrit :
> Add a driver for the Himax HX8279-D MIPI-DSI DriverIC with support
> for the Startek KX070FHFID078 7.0" 1200x1920 IPS panel, found on
> various MediaTek Genio Evaluation Kit boards.

...

> +	if (!hx->skip_goa_config) {
> +		if ((desc->goa_stv_lead_time_ck > HX8279_P3_GOA_STV_LEAD) ||
> +		    (desc->goa_ckv_lead_time_ck > HX8279_P3_GOA_CKV_LEAD) ||
> +		    (desc->goa_ckv_dummy_vblank_num > HX8279_P3_GOA_CKV_DUMMY))
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid lead timings in GOA config\n");
> +		/*
> +		 * Don't perform zero check for polarity and start position, as
> +		 * both pol=0 and start=0 are valid configuration values.
> +		 */
> +		num_clr = 0;
> +		for (i = 0; i < ARRAY_SIZE(desc->goa_clr_start_pos); i++) {
> +			if (desc->goa_clr_start_pos[i] < 0)
> +				continue;
> +			else if (desc->goa_clr_start_pos[i] > HX8279_P3_GOA_CLR_CFG_STARTPOS)
> +				return dev_err_probe(dev, -EINVAL,
> +						     "Invalid start position for CLR%d\n", i + 1);
> +			else
> +				num_clr++;
> +		}
> +		if (!num_clr)
> +			return -EINVAL;
> +
> +		for (i = 0; i < ARRAY_SIZE(desc->goa_clr_polarity); i++) {
> +			if (num_clr < 0)
> +				return -EINVAL;
> +
> +			if (desc->goa_clr_polarity[i] < 0)
> +				continue;
> +			else if (desc->goa_clr_polarity[i] > 1)
> +				return dev_err_probe(dev, -EINVAL,
> +						     "Invalid polarity for CLR%d\n", i + 1);
> +			else if (desc->goa_clr_polarity[i] >= 0)

The if () looks superfluous.

> +				num_clr--;
> +		}
> +	}
> +
> +	/* MIPI Configuration validation */
> +	if (!desc->bta_tlpx && !desc->lhs_settle_time_by_osc25 &&
> +	    !desc->ths_settle_time && !desc->timing_unk_b8 &&
> +	    !desc->timing_unk_bc && !desc->timing_unk_d6)
> +		hx->skip_mipi_timing = true;
> +
> +	/* Gamma Configuration validation */
> +	if (desc->gamma_ctl > (HX8279_P6_GAMMA_POCGM_CTL | HX8279_P6_GAMMA_POGCMD_CTL))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int hx8279_probe(struct mipi_dsi_device *dsi)
> +{

...

> +	/* If the panel is connected on two DSIs then DSI0 left, DSI1 right */
> +	if (hx->desc->is_dual_dsi) {
> +		const struct mipi_dsi_device_info *info = &hx->desc->dsi_info;
> +		struct mipi_dsi_host *dsi_r_host;
> +		struct device_node *dsi_r;
> +
> +		dsi_r = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> +		if (!dsi_r)
> +			return dev_err_probe(dev, -ENODEV, "Cannot get secondary DSI node.\n");
> +
> +		dsi_r_host = of_find_mipi_dsi_host_by_node(dsi_r);
> +		of_node_put(dsi_r);
> +		if (!dsi_r_host)
> +			return dev_err_probe(dev, -EPROBE_DEFER,
> +					     "Cannot get secondary DSI host\n");
> +
> +		hx->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi_r_host, info);
> +		if (IS_ERR(hx->dsi[1]))
> +			return dev_err_probe(dev, PTR_ERR(hx->dsi[1]),
> +					     "Cannot get secondary DSI node\n");
> +		num_dsis++;
> +		mipi_dsi_set_drvdata(hx->dsi[1], hx);
> +	}
> +
> +	hx->dsi[0] = dsi;
> +	mipi_dsi_set_drvdata(dsi, hx);
> +
> +	drm_panel_init(&hx->panel, dev, &hx8279_panel_funcs, DRM_MODE_CONNECTOR_DSI);
> +
> +	ret = drm_panel_of_backlight(&hx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&hx->panel);
> +
> +	for (i = 0; i < num_dsis; i++) {
> +		hx->dsi[i]->lanes = hx->desc->num_lanes;
> +		hx->dsi[i]->format = MIPI_DSI_FMT_RGB888;
> +
> +		hx->dsi[i]->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +					 MIPI_DSI_MODE_LPM;
> +
> +		if (hx->desc->mode_data[0].is_video_mode)
> +			hx->dsi[i]->mode_flags |= MIPI_DSI_MODE_VIDEO |
> +						  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +
> +		ret = devm_mipi_dsi_attach(dev, hx->dsi[i]);
> +		if (ret < 0) {
> +			/* If we fail to attach to either host, we're done */
> +			if (num_dsis == 2)
> +				mipi_dsi_device_unregister(hx->dsi[1]);

Is it needed?
(devm_mipi_dsi_device_register_full() was used)

> +
> +			return dev_err_probe(dev, ret,
> +					     "Cannot attach to DSI%d host.\n", i);
> +		}
> +	}
> +
> +	/* Make sure we start in a known state: panel off */
> +	gpiod_set_value_cansleep(hx->reset_gpio, 0);
> +	gpiod_set_value_cansleep(hx->enable_gpio, 0);
> +
> +	return 0;
> +}

...

CJ
