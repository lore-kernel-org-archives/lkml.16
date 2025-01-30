Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235472F30
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738274488; cv=none; b=ki2aGXLOmeKcM/zdiEpl360nRDE8SARlDfLPj/AChCbd+hWjIM8t9QrawEDq080sDuMCoBqGn7jgmFJG65VfIbmVk7VLohgAUWapijDLuHWptgDCQGL8/78FeFTNDKLI7G6U3WBmYypwHoP18VedyyElEk3RtpFFMiTPh/BJtCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738274488; c=relaxed/simple;
	bh=90cF7DIZ7OamdqPQuknkLovPPwl/nMhTfmsNZaNtlFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrIU6EUBKB5k5VV/InK9gfZjfjmkh7f+gN8I/urylYveGvRhVvmxszezWVaAUQ/xbn1jpMLn+k1kPJ2NeOtoPMu2Zqtf6E5KF4NGsX3m2OHZCsHfQAytUwAlonfBO6kL+oVLNTP0mn5vdRDqv6dbVHcqDUS7Kq8Arj5UEpR01kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLj+BAl8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLj+BAl8"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5439a6179a7so1320468e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738274484; x=1738879284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cBlNXsRHjI4Icc/cJrwUE5dS89XMGKvK0YRLR8DFXAg=;
        b=jLj+BAl82jcBP96Z51RN4k4COrrS6wMRBhZH59BmDN8fxea90AXDa6wjFkFLmj0lGQ
         qSTAfj2bMCdyxWq1n8+edeAK4unaKJVuuOTMHitlNEcoaGu07g6nH5wVjZLpTXeLqJH3
         JBw1o8eT73cPmoZsCgeAKlKHy3IzrdPSxymNQzC4U23wsumagc01IgiEK8qjm7adJTW4
         Zz5lT6nHByXen/fi+wxsPHlV0uykU0Elgyw+S0ICF+AYed/hOZIAwGh7uDoY6TgsfjSS
         8/0vu2RIouqUo4Lw1fFLFEIhW4hMmyMpxcXAZFPwLW6jqHWwm5PD/MumbwZhFmcXw1va
         Uaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274484; x=1738879284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBlNXsRHjI4Icc/cJrwUE5dS89XMGKvK0YRLR8DFXAg=;
        b=BQxj8jqlUSIpINSgBz5AllxLGhP5WMnkKCzrYsbcag4FYF/54noJ5yzGlWLkZHT6Pd
         6DpNt4dp1a0JsUxG8csVJAqQ4VvVz/sm6knb1PtEH08zqYrP7S/vT2bV2bVA/UfGz4w6
         uMAG7LEA+l4U6CZX0W4pnwgdwl67wD5rfwfbSFT+IdVcFYzU0AD6/kRJ24GdHoCEBcRF
         5M0lXGDOTkFHXMo53K7zGa4YYEaVnZGESfSRSfkfXfz/zExqpOBtBKhxchmSS20UmZVS
         yoyk/BcS9RP02VtGgLy8hY001h635491hUBGVCMmXaumShVQ2lDAXEODFP2XBR5ICJ3U
         NSJw==
X-Gm-Message-State: AOJu0YxRvJvjiXxi2VZbqhcrgfVQZSC9/ClTIFmrXVi9UbZvwcjVqDJz
	DfuN8XnaQ+F/EMlOadnDzaqQoaYzqx+vNNqp3iFm1wly/PE+a8ANVrSqhltSmuo=
X-Gm-Gg: ASbGncssZd3Mw+Ite9ARhxu0PgO3yV3kLFgWQx7zGiZhi+IVr8PiieqiaBHSha7WZWi
	6lslztIieOTogHshy2SX/YTk/qunn3Pxa3Utm2Or3RxAje2i1EQ5PIRkztmPutJHvPKNr5yMyeQ
	JTbvzReaRSrgX6NYPIFyuVvyBnvG4VP4AA26pJpzzw8jsDFKd6WPgfA1ZYcDrlLcN5aAYXBBD4I
	GbQ1T9isftAu0A6TgJqMMaf95nwGmNeLUQlXz0Q+YEJwlB0H5jpm6WeVaCkES/cY86aT9vfSt0+
	k7PEVVphZl0TBNNH6VRtT1YzHc+mECN2C7lPckA/jHUAiKy5xX3TB8kXwOaeK5SOsbks0dk=
X-Google-Smtp-Source: AGHT+IH4P4gNbyEayjwfxNHgKoxFSQta9sI/Y3L5cdMV5aw8SzodtwlXrZDsCpO0rA5Hkb9HY+WXJQ==
X-Received: by 2002:ac2:53a1:0:b0:540:2fbb:22fe with SMTP id 2adb3069b0e04-543ea3fbcaamr1423019e87.26.1738274483663;
        Thu, 30 Jan 2025 14:01:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10625sm264424e87.78.2025.01.30.14.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 14:01:22 -0800 (PST)
Date: Fri, 31 Jan 2025 00:01:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Alexey Charkov <alchark@gmail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Johan Jonker <jbx6244@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 1/2] drm/bridge: synopsys: Add audio support for
 dw-hdmi-qp
Message-ID: <5j5kgecsmehbcslq6aickhnv4qpzxptzp62p4s3qamegmdnohc@oq6hmgf23jbq>
References: <20250130165126.2292107-1-detlev.casanova@collabora.com>
 <20250130165126.2292107-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130165126.2292107-2-detlev.casanova@collabora.com>

On Thu, Jan 30, 2025 at 11:45:17AM -0500, Detlev Casanova wrote:
> From: Sugar Zhang <sugar.zhang@rock-chips.com>
> 
> Register the dw-hdmi-qp bridge driver as an HDMI audio codec.
> 
> The register values computation functions (for n) are based on the
> downstream driver, as well as the register writing functions.
> 
> The driver uses the generic HDMI Codec framework in order to implement
> the HDMI audio support.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 497 +++++++++++++++++++
>  1 file changed, 497 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index b281cabfe992e..7937504c2dcef 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -36,6 +36,88 @@
>  
>  #define SCRAMB_POLL_DELAY_MS	3000
>  
> +/*
> + * Unless otherwise noted, entries in this table are 100% optimization.
> + * Values can be obtained from hdmi_compute_n() but that function is
> + * slow so we pre-compute values we expect to see.
> + *
> + * The values for TMDS 25175, 25200, 27000, 54000, 74250 and 148500 kHz are
> + * the recommended N values specified in the Audio chapter of the HDMI
> + * specification.
> + */
> +static const struct dw_hdmi_audio_tmds_n {
> +	unsigned long tmds;
> +	unsigned int n_32k;
> +	unsigned int n_44k1;
> +	unsigned int n_48k;
> +} common_tmds_n_table[] = {
> +	{ .tmds = 25175000,  .n_32k = 4576,  .n_44k1 = 7007,  .n_48k = 6864, },
> +	{ .tmds = 25200000,  .n_32k = 4096,  .n_44k1 = 6272,  .n_48k = 6144, },
> +	{ .tmds = 27000000,  .n_32k = 4096,  .n_44k1 = 6272,  .n_48k = 6144, },
> +	{ .tmds = 28320000,  .n_32k = 4096,  .n_44k1 = 5586,  .n_48k = 6144, },
> +	{ .tmds = 30240000,  .n_32k = 4096,  .n_44k1 = 5642,  .n_48k = 6144, },
> +	{ .tmds = 31500000,  .n_32k = 4096,  .n_44k1 = 5600,  .n_48k = 6144, },
> +	{ .tmds = 32000000,  .n_32k = 4096,  .n_44k1 = 5733,  .n_48k = 6144, },
> +	{ .tmds = 33750000,  .n_32k = 4096,  .n_44k1 = 6272,  .n_48k = 6144, },
> +	{ .tmds = 36000000,  .n_32k = 4096,  .n_44k1 = 5684,  .n_48k = 6144, },
> +	{ .tmds = 40000000,  .n_32k = 4096,  .n_44k1 = 5733,  .n_48k = 6144, },
> +	{ .tmds = 49500000,  .n_32k = 4096,  .n_44k1 = 5488,  .n_48k = 6144, },
> +	{ .tmds = 50000000,  .n_32k = 4096,  .n_44k1 = 5292,  .n_48k = 6144, },
> +	{ .tmds = 54000000,  .n_32k = 4096,  .n_44k1 = 6272,  .n_48k = 6144, },
> +	{ .tmds = 65000000,  .n_32k = 4096,  .n_44k1 = 7056,  .n_48k = 6144, },
> +	{ .tmds = 68250000,  .n_32k = 4096,  .n_44k1 = 5376,  .n_48k = 6144, },
> +	{ .tmds = 71000000,  .n_32k = 4096,  .n_44k1 = 7056,  .n_48k = 6144, },
> +	{ .tmds = 72000000,  .n_32k = 4096,  .n_44k1 = 5635,  .n_48k = 6144, },
> +	{ .tmds = 73250000,  .n_32k = 11648, .n_44k1 = 14112, .n_48k = 6144, },
> +	{ .tmds = 74250000,  .n_32k = 4096,  .n_44k1 = 6272,  .n_48k = 6144, },
> +	{ .tmds = 75000000,  .n_32k = 4096,  .n_44k1 = 5880,  .n_48k = 6144, },
> +	{ .tmds = 78750000,  .n_32k = 4096,  .n_44k1 = 5600,  .n_48k = 6144, },
> +	{ .tmds = 78800000,  .n_32k = 4096,  .n_44k1 = 5292,  .n_48k = 6144, },
> +	{ .tmds = 79500000,  .n_32k = 4096,  .n_44k1 = 4704,  .n_48k = 6144, },
> +	{ .tmds = 83500000,  .n_32k = 4096,  .n_44k1 = 7056,  .n_48k = 6144, },
> +	{ .tmds = 85500000,  .n_32k = 4096,  .n_44k1 = 5488,  .n_48k = 6144, },
> +	{ .tmds = 88750000,  .n_32k = 4096,  .n_44k1 = 14112, .n_48k = 6144, },
> +	{ .tmds = 97750000,  .n_32k = 4096,  .n_44k1 = 14112, .n_48k = 6144, },
> +	{ .tmds = 101000000, .n_32k = 4096,  .n_44k1 = 7056,  .n_48k = 6144, },
> +	{ .tmds = 106500000, .n_32k = 4096,  .n_44k1 = 4704,  .n_48k = 6144, },
> +	{ .tmds = 108000000, .n_32k = 4096,  .n_44k1 = 5684,  .n_48k = 6144, },
> +	{ .tmds = 115500000, .n_32k = 4096,  .n_44k1 = 5712,  .n_48k = 6144, },
> +	{ .tmds = 119000000, .n_32k = 4096,  .n_44k1 = 5544,  .n_48k = 6144, },
> +	{ .tmds = 135000000, .n_32k = 4096,  .n_44k1 = 5488,  .n_48k = 6144, },
> +	{ .tmds = 146250000, .n_32k = 11648, .n_44k1 = 6272,  .n_48k = 6144, },
> +	{ .tmds = 148500000, .n_32k = 4096,  .n_44k1 = 6272,  .n_48k = 6144, },
> +	{ .tmds = 154000000, .n_32k = 4096,  .n_44k1 = 5544,  .n_48k = 6144, },
> +	{ .tmds = 162000000, .n_32k = 4096,  .n_44k1 = 5684,  .n_48k = 6144, },
> +
> +	/* For 297 MHz+ HDMI spec have some other rule for setting N */
> +	{ .tmds = 297000000, .n_32k = 3073,  .n_44k1 = 4704,  .n_48k = 5120, },
> +	{ .tmds = 594000000, .n_32k = 3073,  .n_44k1 = 9408,  .n_48k = 10240,},
> +
> +	/* End of table */
> +	{ .tmds = 0,         .n_32k = 0,     .n_44k1 = 0,     .n_48k = 0,    },
> +};
> +
> +/*
> + * These are the CTS values as recommended in the Audio chapter of the HDMI
> + * specification.
> + */
> +static const struct dw_hdmi_audio_tmds_cts {
> +	unsigned long tmds;
> +	unsigned int cts_32k;
> +	unsigned int cts_44k1;
> +	unsigned int cts_48k;
> +} common_tmds_cts_table[] = {
> +	{ .tmds = 25175000,  .cts_32k = 28125,  .cts_44k1 = 31250,  .cts_48k = 28125,  },
> +	{ .tmds = 25200000,  .cts_32k = 25200,  .cts_44k1 = 28000,  .cts_48k = 25200,  },
> +	{ .tmds = 27000000,  .cts_32k = 27000,  .cts_44k1 = 30000,  .cts_48k = 27000,  },
> +	{ .tmds = 54000000,  .cts_32k = 54000,  .cts_44k1 = 60000,  .cts_48k = 54000,  },
> +	{ .tmds = 74250000,  .cts_32k = 74250,  .cts_44k1 = 82500,  .cts_48k = 74250,  },
> +	{ .tmds = 148500000, .cts_32k = 148500, .cts_44k1 = 165000, .cts_48k = 148500, },
> +
> +	/* End of table */
> +	{ .tmds = 0,         .cts_32k = 0,      .cts_44k1 = 0,      .cts_48k = 0,      },
> +};
> +
>  struct dw_hdmi_qp_i2c {
>  	struct i2c_adapter	adap;
>  
> @@ -60,6 +142,8 @@ struct dw_hdmi_qp {
>  	} phy;
>  
>  	struct regmap *regm;
> +
> +	unsigned long tmds_char_rate;
>  };
>  
>  static void dw_hdmi_qp_write(struct dw_hdmi_qp *hdmi, unsigned int val,
> @@ -83,6 +167,354 @@ static void dw_hdmi_qp_mod(struct dw_hdmi_qp *hdmi, unsigned int data,
>  	regmap_update_bits(hdmi->regm, reg, mask, data);
>  }
>  
> +static struct dw_hdmi_qp *dw_hdmi_qp_from_bridge(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct dw_hdmi_qp, bridge);
> +}
> +
> +static void hdmi_set_cts_n(struct dw_hdmi_qp *hdmi, unsigned int cts,
> +			   unsigned int n)

I'm sorry, I should have pointed out in the previous review cycle. Could
you please rename those functions so that their name start with
dw_hdmi_qp_*.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +{
> +	/* Set N */
> +	dw_hdmi_qp_mod(hdmi, n, AUDPKT_ACR_N_VALUE, AUDPKT_ACR_CONTROL0);
> +
> +	/* Set CTS */
> +	if (cts)
> +		dw_hdmi_qp_mod(hdmi, AUDPKT_ACR_CTS_OVR_EN, AUDPKT_ACR_CTS_OVR_EN_MSK,
> +			  AUDPKT_ACR_CONTROL1);
> +	else
> +		dw_hdmi_qp_mod(hdmi, 0, AUDPKT_ACR_CTS_OVR_EN_MSK,
> +			  AUDPKT_ACR_CONTROL1);
> +
> +	dw_hdmi_qp_mod(hdmi, AUDPKT_ACR_CTS_OVR_VAL(cts), AUDPKT_ACR_CTS_OVR_VAL_MSK,
> +		  AUDPKT_ACR_CONTROL1);
> +}
> +

-- 
With best wishes
Dmitry
