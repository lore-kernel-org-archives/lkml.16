Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49979BA53
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738630435; cv=none; b=ASRg8/u5ukweP5Ee6mW/H/3spfYHPxdv/3VXkQcbJyAF2EBuj1OLOPBoX0jzYGnIshcDByFkmfFHImhhaRz5Tqoow2U0RA5+Ir6BLG1wN/m8KnLF3y6S7iBB+eX3Cf0/8CJxCruVp8BlzB40YFJFLBnk89VMcRAT9KipTxnRyLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738630435; c=relaxed/simple;
	bh=kUWJ2yg5TUpwk2k09vZoefUSzFfdfRLXTdtA77V4IC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9BaeS5avOJAV5shcwA5ou1GWJIHdRa0XS2vRpWPeOPC9CtMrwHgUryNJ8KwQFECJRnX7UbaP62EyfsQj6toO96lJwohs6Fpy34sg0qaw/FzMKZNSR3X1em11/f9vLSd8QOhS6wd5rSixWF0atm7IlgI4FapgmdOMr4PQCLEra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hz3q7+za; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hz3q7+za"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-540215984f0so5553825e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 16:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738630431; x=1739235231; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n6vuKBBYDtQlrKgG61Z1x3H3QFhGAszRb9TzwuI7sqo=;
        b=Hz3q7+zaLLX3kpDCddDgRLEUX52YKjTtoRs0kD8usUpgDDwtKGEiorThsSsCgcNeDH
         ENcZASV5CdHz4uqa5Nh/XPzkWD8xFsNh0xAV36SEmNzIeqFVGSaLucnsAPwf8SpgGYQn
         zkCD7rM2AlQUnDM8BOSKLqRyRewF52ibbRS2YfIQduwC3TljAeNoJU7NWVWpcHBJS17R
         jnTyabEbbF3I+g+TV9+dGmE5rJgLJIRm8hmoIxX1oTuYDTEnZCDNCJh29vkVuX67eSzJ
         K98WysNPCfCRraRWYgZYbq/qpT+L1zI08t5unYGCkaiY9BKOAkY6fnHRWJ37nFrUQ2DE
         QgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738630431; x=1739235231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6vuKBBYDtQlrKgG61Z1x3H3QFhGAszRb9TzwuI7sqo=;
        b=fUeVxm0mXqGrQholPgCO9paR6MdlshJ+JeI7rN+f/Y3hB1VpyIZKOvYU0UFP6r8mIH
         jtCThVSsrpG9aUV9H6lg7cr+48r5dPFeDEBBhnR8nluFxpwxlKIxyKfjsDUeSl5rpYw1
         XmynqkWx418eLo5PbmqfI+uWT1zlvVCkowcgAhB6Sci7v7/fWOaeuvgM/+I4A4NUaFZr
         y0R08r/HuSMg7f9tcrTXGBZL1oNnEtaZqgGeBpdfjlBVvtFNoKatvZbpA+YaThaWsq9Q
         4afxDI0bHuthRyIBuAiCvkBQ6ZoqjwK6/7IGiyBJMxC8ex3fsEbi85wFZhOGOF34Kxz1
         SXIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJyk7uUGcGeWRzR8flQJvDv3VUTalAJejZ1TR0DLL95koskUMtNvzEOLpGCwa0t/o0RJaGktcYjH46tMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YykvHpdbZOFPTPyVbTyaQm5x8EqOKD7UfERjV7yHNpqwTIXw0Zc
	mZ3qy2Wi7r0MflsnuKgYm5+JX6J+vJrJeawFVmFwr8JraepN6Uq63njx2e8D+f8=
X-Gm-Gg: ASbGncuPIKKdjY8iAJ7/9Pc87kYT/IFRKcaZp/lrYri40k9EjKLXgFstPOWLW5q/eqA
	FTm9tH/biD1Ic6DkRzZTP21zz80qU7nW/tHmRdvXsVs74dw5iune7eD6gcxLcwHGTNTdf7Fmtlc
	dxsd9smWBBeuz7HD6bFlSqs2nEL5AEkvkMvod4Kl48DgNEAPrJxMGDLEYOYemlv/dlENXngOgVj
	iaMbnwzRnS7Z69M+qnFRhIPyjIuE0Qg0FVbn4jgxCqPx2Ap24VmkTt6Ki1omr/6dfnVyjOBOMzr
	9AWwYvTyysrhLixjGxSlLWLN63AWejVXAipl7FWlTuzVymyUCJ2f4HOmdieuFfqwAmoo9bE=
X-Google-Smtp-Source: AGHT+IFIPKJEQNA5tK1YiM+VNhZ5WPU2MCgZV77JwlTQH8IKAw7+yQkyR1eqXdmPkWOKHrIkKOF0rg==
X-Received: by 2002:a05:6512:e85:b0:542:97b9:89e8 with SMTP id 2adb3069b0e04-543e4c00dccmr7600330e87.23.1738630431219;
        Mon, 03 Feb 2025 16:53:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb7f20sm1432933e87.164.2025.02.03.16.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 16:53:50 -0800 (PST)
Date: Tue, 4 Feb 2025 02:53:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: rafael@beims.me
Cc: Adrien Grassein <adrien.grassein@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joao Paulo Goncalves <joao.goncalves@toradex.com>, Rafael Beims <rafael.beims@toradex.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/bridge: lt8912b: Add support for audio
Message-ID: <jqvns5poyixrbg7ql6txyqltyi5shi45a2npier4f5lgsnjkas@5ljhotjsk2y7>
References: <20250203192401.244651-1-rafael@beims.me>
 <20250203192401.244651-3-rafael@beims.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203192401.244651-3-rafael@beims.me>

On Mon, Feb 03, 2025 at 04:23:56PM -0300, rafael@beims.me wrote:
> From: Rafael Beims <rafael.beims@toradex.com>
> 
> Add support for HDMI codec with audio coming from the I2S input.
> Support 48kHz and 96kHz sample rate, with 16 bits word size.
> 
> Co-developed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> Signed-off-by: Rafael Beims <rafael.beims@toradex.com>

Please turn the bridge to support DRM_BRIDGE_OP_HDMI and then use
drm_hdmi_audio_helper features to provide audio support. Your
implementations misses ELD, plugged callback, etc.

> ---
>  drivers/gpu/drm/bridge/Kconfig           |   1 +
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 107 ++++++++++++++++++++++-
>  2 files changed, 107 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 6b4664d91faa..489ce1041203 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -117,6 +117,7 @@ config DRM_ITE_IT6505
>  
>  config DRM_LONTIUM_LT8912B
>  	tristate "Lontium LT8912B DSI/HDMI bridge"
> +	select SND_SOC_HDMI_CODEC if SND_SOC
>  	depends on OF
>  	select DRM_PANEL_BRIDGE
>  	select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> index 52da204f5740..2100b41e5f61 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -8,6 +8,8 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/media-bus-format.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
>  #include <drm/drm_probe_helper.h>
> @@ -16,6 +18,8 @@
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  
> +#include <sound/hdmi-codec.h>
> +
>  #include <video/videomode.h>
>  
>  #define I2C_MAIN 0
> @@ -24,7 +28,10 @@
>  #define I2C_CEC_DSI 1
>  #define I2C_ADDR_CEC_DSI 0x49
>  
> -#define I2C_MAX_IDX 2
> +#define I2C_AUDIO 2
> +#define I2C_ADDR_AUDIO 0x4a
> +
> +#define I2C_MAX_IDX 3
>  
>  struct lt8912 {
>  	struct device *dev;
> @@ -38,6 +45,7 @@ struct lt8912 {
>  	struct drm_bridge *hdmi_port;
>  
>  	struct mipi_dsi_device *dsi;
> +	struct platform_device *audio_pdev;
>  
>  	struct gpio_desc *gp_reset;
>  
> @@ -226,6 +234,7 @@ static int lt8912_init_i2c(struct lt8912 *lt, struct i2c_client *client)
>  	struct i2c_board_info info[] = {
>  		{ I2C_BOARD_INFO("lt8912p0", I2C_ADDR_MAIN), },
>  		{ I2C_BOARD_INFO("lt8912p1", I2C_ADDR_CEC_DSI), },
> +		{ I2C_BOARD_INFO("lt8912p2", I2C_ADDR_AUDIO), },
>  	};
>  
>  	if (!lt)
> @@ -754,6 +763,97 @@ static int lt8912_put_dt(struct lt8912 *lt)
>  	return 0;
>  }
>  
> +static int lt8912_hdmi_hw_params(struct device *dev, void *data,
> +				 struct hdmi_codec_daifmt *fmt,
> +				 struct hdmi_codec_params *hparms)
> +{
> +	struct lt8912 *lt = data;
> +	unsigned int audio_params = 0x08; /* 16 bit word size */
> +
> +	if (hparms->sample_width != 16)
> +		return -EINVAL;
> +
> +	if (hparms->sample_rate == 48000)
> +		audio_params |= 0x20;
> +	else if (hparms->sample_rate == 96000)
> +		audio_params |= 0xa0;
> +	else
> +		return -EINVAL;
> +
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x0f, audio_params);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x35, 0x00);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x36, 0x18);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x37, 0x00);
> +
> +	return 0;
> +}
> +
> +static int lt8912_audio_startup(struct device *dev, void *data)
> +{
> +	struct lt8912 *lt = data;
> +
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x34, 0xe2);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x3c, 0x60);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x07, 0xf0);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x06, 0x08);
> +
> +	return 0;
> +}
> +
> +static void lt8912_audio_shutdown(struct device *dev, void *data)
> +{
> +	struct lt8912 *lt = data;
> +
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x06, 0x00);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x07, 0x00);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x34, 0x52);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x3c, 0x40);
> +}
> +
> +static int lt8912_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
> +				      struct device_node *endpoint)
> +{
> +	struct of_endpoint of_ep;
> +	int ret;
> +
> +	ret = of_graph_parse_endpoint(endpoint, &of_ep);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (of_ep.port != 2)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static const struct hdmi_codec_ops lt8912_codec_ops = {
> +	.hw_params = lt8912_hdmi_hw_params,
> +	.audio_shutdown = lt8912_audio_shutdown,
> +	.audio_startup = lt8912_audio_startup,
> +	.get_dai_id = lt8912_hdmi_i2s_get_dai_id,
> +};
> +
> +static int lt8912_audio_init(struct device *dev, struct lt8912 *lt)
> +{
> +	struct hdmi_codec_pdata codec_data = {
> +		.ops = &lt8912_codec_ops,
> +		.max_i2s_channels = 2,
> +		.i2s = 1,
> +		.data = lt,
> +	};
> +
> +	lt->audio_pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
> +						       PLATFORM_DEVID_AUTO,
> +						       &codec_data, sizeof(codec_data));
> +
> +	return PTR_ERR_OR_ZERO(lt->audio_pdev);
> +}
> +
> +static void lt8912_audio_exit(struct lt8912 *lt)
> +{
> +	platform_device_unregister(lt->audio_pdev);
> +}
> +
>  static int lt8912_probe(struct i2c_client *client)
>  {
>  	static struct lt8912 *lt;
> @@ -788,6 +888,10 @@ static int lt8912_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_attach;
>  
> +	ret = lt8912_audio_init(dev, lt);
> +	if (ret)
> +		goto err_attach;
> +
>  	return 0;
>  
>  err_attach:
> @@ -803,6 +907,7 @@ static void lt8912_remove(struct i2c_client *client)
>  {
>  	struct lt8912 *lt = i2c_get_clientdata(client);
>  
> +	lt8912_audio_exit(lt);
>  	drm_bridge_remove(&lt->bridge);
>  	lt8912_free_i2c(lt);
>  	lt8912_put_dt(lt);
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
