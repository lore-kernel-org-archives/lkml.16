Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E573F253B50
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904006; cv=none; b=MqmMDnMZDvxUTccepNMHNhWrJVHjjH4uxlMLdLfq2Vr9uODVBc1CTFFjai7l6erM6U1SspGQhNcc6SILK9Z9uxRIV87C0moKWV0kUDqlbCsSXf8sOpkmglcMeV3p7Xrd6bCFjEORjWXUn0v5H/uGm16MyRzUk4AFJEb32P+pCDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904006; c=relaxed/simple;
	bh=K3iLNXyJEzlCnDNUMxpE2Wr/g8TUeZ+PpBw5iVCHCV8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SzIPrIoZobedbkMGT75AifmyG5bXx1ah20rhxQpJyq2wmw+3TjYQNxZ17mVd1mVVyWbTRx874nwsVEivBjdW3R94znFKS0H2quOj75Lv0oKFge/sH8EXDQN9Qo1IXHyhGqPeZCfu5T+VUdNzwbTFvyE7agWzWk1dbepx+2Q9apc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPdaOgkA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPdaOgkA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so862642f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744904002; x=1745508802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJU0YKLI3O3XfSZX1Z7o87cRZxiutDHxVPjCfrI5PcM=;
        b=xPdaOgkAlH8/v2aJf5+DYq5uwfsWdO45KjuS5bEQ5IbgrtM9c9eqqJFFOyYCxFLXjm
         RuEn0ZxzgfSnc5LU/Zb2DXfwElRgQZumUBx4fg7ivnYRi0/iKWG+d81rExgeyRafOQ38
         nil1HydvIT727Cmj6Bb6nPOHkbr3AenqCIiMC4AkaLz7x7AAv7D3k2r/pWAjDstW1UFy
         KvgCc3rDEYHHBs/hyf0ik3oxRGLZ/MrnQLxDg9NV3k7Vl4Jj5DlWStFKt6zSP+fT97l4
         JFU7bMTsXud1quHoK8ei/EPKcLtQRLCOpcd5OYo16H8gYRk9iqkp0SHP6PzUAIl2FMjD
         qdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904002; x=1745508802;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HJU0YKLI3O3XfSZX1Z7o87cRZxiutDHxVPjCfrI5PcM=;
        b=J+zYxVnuYV3v3QoIFC5nf0xICQ0u/MUsq1CFVl0EmVTZPOeCueKXutllEuPFbiF/xl
         jkq7M8PE7I0s11c/fykV5uOV/ZYxusVaCj26v4e9x5M0IbZirChDiWrMQ/ZOhBSl2m9u
         bGLKtwPxOTS4pPHoGTiiiv5i0TL6CFi0F/JW/YF2+94/Tp0ARN7+DAL7ikxbRZaj1FDF
         fDBI9Uc9VeDKE3dVmFF00RtgLw0ig4S00htOvvkLscZ2XjilTO2VXfk/Uo8CxbRo23UB
         iNilehg9EFxW96TU9AQ7YeoKzjVGZahJ6hflezI+UthvDYTq2N3iK6WIQve3GhLHp/Ly
         L0iw==
X-Forwarded-Encrypted: i=1; AJvYcCXB8TVyzSDjlJxcr5wxEIvhwcdzoCqI3IwPh+UYNM1QPH2fgK8k4S8ZyWp9lJf68/dKCFNZAMTV88/JsMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTPk3WkGNhYxD/hw9dxck8JeP0SO1S/ELM1hFpM/nJphNU0yWb
	x8m4EN9nuPX1bUzW3+7hLLUPIbTIpy3JcHBKa1Nt+yQyImLvG9tqliaaWy7mFFE=
X-Gm-Gg: ASbGnctAo4Xp3O8eriv03yYW4tp5EoBKFS8eiyD24/7wJgRuYoHU7jTTQylW8KGHrB7
	vqAEb0SX01Oei9AAj+prg6r5oDUbnSaxt0RUP9ZOwtBtFqYO9M/oV4qPH5cvaMfAcLGsLPypKcU
	BaK2bctHiQvx/XZ+Loa8aVwS8dThdHd02gIZcVAhi3ftCE3xYJt1knJpFiG8dGZoiBW1adTd91Z
	vykz7e4ZZty+Fjn7UwWR0l0jOiGeGiSR1m9O6zUYtUCivjLYrLrlRQw/Rd0WErXAb+CU6KY1nWi
	GdFRPza+NDrXOAW1AwvFewALaW02+ytP0TlRwMwhUn5YFWPBuxaqmYqXPY/Tax6QdYU/ATVg3j3
	xitEKlJpbWeohy6A=
X-Google-Smtp-Source: AGHT+IHl/iJqSPWLXHFLfXn1RWvFeEQD5851u9lh41q0RF/5itUaj3iomTMY3WyXh953wOfL5h54rA==
X-Received: by 2002:a05:6000:144f:b0:39c:1257:ccae with SMTP id ffacd0b85a97d-39ee5ba01e5mr6361648f8f.57.1744904002001;
        Thu, 17 Apr 2025 08:33:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546? ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640fdsm20429438f8f.7.2025.04.17.08.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 08:33:21 -0700 (PDT)
Message-ID: <422dd45d-dab3-4bff-a0c2-669deb6d081d@linaro.org>
Date: Thu, 17 Apr 2025 17:33:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/2] drm/panel: Add Visionox G2647FB105 panel driver
To: Alexander Baransky <sanyapilot496@gmail.com>, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250414172637.197792-1-sanyapilot496@gmail.com>
 <20250414172637.197792-3-sanyapilot496@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250414172637.197792-3-sanyapilot496@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/04/2025 19:26, Alexander Baransky wrote:
> Add the driver for Visionox G2647FB105 6.47" FHD Plus CMD mode AMOLED panel
> support found in:
> - Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
> - Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)
> 
> Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   .../gpu/drm/panel/panel-visionox-g2647fb105.c | 280 ++++++++++++++++++
>   3 files changed, 290 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index e059b06e0239..8b73f1e8bef4 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -996,6 +996,15 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
>   	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
>   	  Video Mode panel
>   
> +config DRM_PANEL_VISIONOX_G2647FB105
> +	tristate "Visionox G2647FB105"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the Visionox
> +	  G2647FB105 (2340x1080@60Hz) AMOLED DSI cmd mode panel.
> +
>   config DRM_PANEL_VISIONOX_R66451
>   	tristate "Visionox R66451"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 1bb8ae46b59b..911400bca51a 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>   obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>   obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>   obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
> +obj-$(CONFIG_DRM_PANEL_VISIONOX_G2647FB105) += panel-visionox-g2647fb105.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_RM692E5) += panel-visionox-rm692e5.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
> diff --git a/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
> new file mode 100644
> index 000000000000..413849f7b4de
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> + *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + *   Copyright (c) 2025, Alexander Baransky <sanyapilot496@gmail.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +struct visionox_g2647fb105 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data *supplies;
> +};
> +
> +static const struct regulator_bulk_data visionox_g2647fb105_supplies[] = {
> +	{ .supply = "vdd3p3" },
> +	{ .supply = "vddio" },
> +	{ .supply = "vsn" },
> +	{ .supply = "vsp" },
> +};
> +
> +static inline
> +struct visionox_g2647fb105 *to_visionox_g2647fb105(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct visionox_g2647fb105, panel);
> +}
> +
> +static void visionox_g2647fb105_reset(struct visionox_g2647fb105 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int visionox_g2647fb105_on(struct visionox_g2647fb105 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbf, 0xbb);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0xdd);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
> +
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int visionox_g2647fb105_off(struct visionox_g2647fb105 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int visionox_g2647fb105_prepare(struct drm_panel *panel)
> +{
> +	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	visionox_g2647fb105_reset(ctx);
> +
> +	ret = visionox_g2647fb105_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int visionox_g2647fb105_unprepare(struct drm_panel *panel)
> +{
> +	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = visionox_g2647fb105_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode visionox_g2647fb105_mode = {
> +	.clock = (1080 + 28 + 4 + 36) * (2340 + 8 + 4 + 4) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 28,
> +	.hsync_end = 1080 + 28 + 4,
> +	.htotal = 1080 + 28 + 4 + 36,
> +	.vdisplay = 2340,
> +	.vsync_start = 2340 + 8,
> +	.vsync_end = 2340 + 8 + 4,
> +	.vtotal = 2340 + 8 + 4 + 4,
> +	.width_mm = 69,
> +	.height_mm = 149,
> +};
> +
> +static int visionox_g2647fb105_get_modes(struct drm_panel *panel,
> +					struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &visionox_g2647fb105_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs visionox_g2647fb105_panel_funcs = {
> +	.prepare = visionox_g2647fb105_prepare,
> +	.unprepare = visionox_g2647fb105_unprepare,
> +	.get_modes = visionox_g2647fb105_get_modes,
> +};
> +
> +static int visionox_g2647fb105_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops visionox_g2647fb105_bl_ops = {
> +	.update_status = visionox_g2647fb105_bl_update_status,
> +};
> +
> +static struct backlight_device *
> +visionox_g2647fb105_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 1023,
> +		.max_brightness = 2047,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &visionox_g2647fb105_bl_ops, &props);
> +}
> +
> +static int visionox_g2647fb105_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_g2647fb105 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ret = devm_regulator_bulk_get_const(dev,
> +					    ARRAY_SIZE(visionox_g2647fb105_supplies),
> +					    visionox_g2647fb105_supplies,
> +					    &ctx->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_g2647fb105_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = visionox_g2647fb105_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void visionox_g2647fb105_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct visionox_g2647fb105 *ctx = mipi_dsi_get_drvdata(dsi);
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id visionox_g2647fb105_of_match[] = {
> +	{ .compatible = "visionox,g2647fb105" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, visionox_g2647fb105_of_match);
> +
> +static struct mipi_dsi_driver visionox_g2647fb105_driver = {
> +	.probe = visionox_g2647fb105_probe,
> +	.remove = visionox_g2647fb105_remove,
> +	.driver = {
> +		.name = "panel-visionox-g2647fb105",
> +		.of_match_table = visionox_g2647fb105_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(visionox_g2647fb105_driver);
> +
> +MODULE_AUTHOR("Alexander Baransky <sanyapilot496@gmail.com>");
> +MODULE_DESCRIPTION("DRM driver for Visionox G2647FB105 AMOLED DSI panel");
> +MODULE_LICENSE("GPL");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
