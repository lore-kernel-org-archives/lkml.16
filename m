Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2532563
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739081911; cv=none; b=h2/kzKfDCiyF+6DdbWLT0lhKs6Yoe+EvSnNPMneA1Xl8g4gC0K0zPH3uVQfO3pMOAn3O57NA88PiFAnmlS6Kn7ePw5Tv6sdQ/rqVWe2oYHKqjIffwHec0ksTdOT/Zl9JBid1++6AXH+KTRufhIWud56KRx/sGDJICTbAzhHD2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739081911; c=relaxed/simple;
	bh=g0GO/63kAD3T7VQ2uRFXublxfNspMyf8aJlieiKzHBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUpJRcxBx2lLzUNq/Mnp66rM9kLUf2zbBNFzb8/rMKgPQcHaKdJqx57jovsdY14GQMxfYqyMp5hx8841vTmny06PiF1wlGKxSjBxdbp8wgJ77EfEo4okA1yAOWHYOg0DIv0F8k1iAmBlcuVhTquc6/aKZg92gGksKlYBtKSe8tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdJQq41K; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdJQq41K"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-306007227d3so35051181fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 22:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739081908; x=1739686708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=htkXXB7hjh9tN44FJz5MK8aOhFXrnSM1y8XrIzHSCXQ=;
        b=pdJQq41KfUO8lOsuDQdysSyzk8BGXdkiFCbjKR+b+Xto7XUh40dcoVTkGDEM0igSM9
         JbnPEzATK+ZuQm7OOKmqbHO1nLzl9HJ/QgoRoUhuLHjOnzdUIzSV8bYfqyTk+gNOT3+G
         eAs2fuoy9o5qBWsoqRapHGPOmJkAixVc9dQShW8A2W789hh1ieIfuQuUhLF9+Am8NZVw
         CSH6EryhYDli56egl/CAYwDqesE8JOVZC7oa4EkLNfuyPsew6hh+JVP3UFJNh/GEViJW
         gwDArd3sUNzIHGcKan0HPiUgl/WatFsf8hP2RcoDC/jdOAeXCFO/Yi177eFVfa4ORUyI
         BcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739081908; x=1739686708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htkXXB7hjh9tN44FJz5MK8aOhFXrnSM1y8XrIzHSCXQ=;
        b=o0hiYpx0YhRYQlHniD9wNPIxPg8xxt3kBt22k9wLcBJXa9/XAcxd7kWxN0LDzp41io
         xtC9bm3WleIB/QgntV3dmneNnTM26le8MSZozhnVZ+yT0ZZCp02GKVlWGbjQ1YtceEwB
         92qw8UN1tcZaUeV6ZjFESqFlXn1SIpjttyu6KLhiasY5ChBnuD7l62h4T/rdcXm1x5tT
         hPWIeV9VJ680FFqpQ6Jj/iyPXkhCjfmhTR5ncB66OGer2N4phnB8FoNK9uziVoAldvwg
         bIUvlML3OMzdhRoBthqi37LHwNNFEYPrQBZV2BtvNtIU8xjahScESaa6+CNuufYmsWKZ
         cDnA==
X-Forwarded-Encrypted: i=1; AJvYcCVqP5EoGPC/9sVn6oB3mPtyqB5i72jPskRxvlt32om5mMXqwv8nkzyvLUflugpy++IB8GBMC+Elxo2U+Dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzXCs0eh//ebkYPSMoa+cs1ktArX8p6EvELwdbpz8hXFiFQ0ns
	sBUTyNZ0PegrvzEXhlkviSb6iGXUifbl4Qew+RabTfDsAOQBvV9NSpLrNXBSkW8=
X-Gm-Gg: ASbGncsLPsbozL1E4G1vWa5CKjBdPjN2IdQaD7kGM1nC/TpEmXm3cAArGhSuODgsXCU
	BfhoWIT4PlJlnly+2Z9aVrQQMPglOOpGE/6ZDohDlH4WxM0JSSaR1myiAnub80jPcdjAJQZi2hv
	TEM/DHzZT/EWa0nIxSIghd2rGIvlJwWkxmyeRK57YK2Drq9lileTGBepDYepePY85o42ydVsZZK
	GWShpWU7Vvj2V7vnFJsYCbio+xTIBjWlGdPLe/3xM9K7PaP4wn0rrVluc9gMiitjn+888uV1prm
	m1RxFaVvGKmL4oHKF0EKp7gExtuez/FNRlY28gziDJ7OcUKimKGEe+lB2qHHN0im/rtsrLU=
X-Google-Smtp-Source: AGHT+IGgF3szSNrfu2MbeKVhjkce8cOMaTG201Ct9UsQDHLoebAoA0gFEiDQtHl3l574oYtatynpfQ==
X-Received: by 2002:a05:651c:982:b0:307:46f3:4e92 with SMTP id 38308e7fff4ca-307e5a8acadmr39302301fa.32.1739081907633;
        Sat, 08 Feb 2025 22:18:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2bb126sm9410501fa.72.2025.02.08.22.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 22:18:26 -0800 (PST)
Date: Sun, 9 Feb 2025 08:18:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 27/35] drm/bridge: Add encoder parameter to
 drm_bridge_funcs.attach
Message-ID: <c32yyscbj2hjad4f4nzrod5us5zw4d5yh6jyxlhvaulg6vqxhh@7dpb3dchfcv2>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-27-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-27-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:55PM +0100, Maxime Ripard wrote:
> The drm_bridge structure contains an encoder pointer that is widely used
> by bridge drivers. This pattern is largely documented as deprecated in
> other KMS entities for atomic drivers.
> 
> However, one of the main use of that pointer is done in attach to just
> call drm_bridge_attach on the next bridge to add it to the bridge list.
> While this dereferences the bridge->encoder pointer, it's effectively
> the same encoder the bridge was being attached to.
> 
> We can make it more explicit by adding the encoder the bridge is
> attached to to the list of attach parameters. This also removes the need
> to dereference bridge->encoder in most drivers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Note, tc358767.c and ti-sn65dsi86.c also has several bridge.encoder uses
in attach callbacks.

Also, we still have a lot of usecases for bridge->encoder. including
core functions like drm_bridge_get_next_bridge() and
drm_bridge_get_prev_bridge().

Maybe that's handled in a later patches.

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             |  3 ++-
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       |  3 ++-
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       |  3 ++-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c       |  2 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c                |  3 ++-
>  drivers/gpu/drm/bridge/aux-bridge.c                      |  3 ++-
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c                  |  1 +
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c           |  3 ++-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      |  1 +
>  drivers/gpu/drm/bridge/chipone-icn6211.c                 |  6 ++++--
>  drivers/gpu/drm/bridge/chrontel-ch7033.c                 |  5 +++--
>  drivers/gpu/drm/bridge/display-connector.c               |  1 +
>  drivers/gpu/drm/bridge/fsl-ldb.c                         |  3 ++-
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c              |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h              |  2 +-
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c           |  3 ++-
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c             |  3 ++-
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c      |  3 ++-
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c          |  3 ++-
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c             |  3 ++-
>  drivers/gpu/drm/bridge/ite-it6263.c                      |  7 ++++---
>  drivers/gpu/drm/bridge/ite-it6505.c                      |  1 +
>  drivers/gpu/drm/bridge/ite-it66121.c                     |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c                 |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt9211.c                  |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt9611.c                  |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c               |  3 ++-
>  drivers/gpu/drm/bridge/lvds-codec.c                      |  3 ++-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  1 +
>  drivers/gpu/drm/bridge/microchip-lvds.c                  |  3 ++-
>  drivers/gpu/drm/bridge/nwl-dsi.c                         |  3 ++-
>  drivers/gpu/drm/bridge/nxp-ptn3460.c                     |  5 +++--
>  drivers/gpu/drm/bridge/panel.c                           |  3 ++-
>  drivers/gpu/drm/bridge/parade-ps8622.c                   |  1 +
>  drivers/gpu/drm/bridge/parade-ps8640.c                   |  3 ++-
>  drivers/gpu/drm/bridge/samsung-dsim.c                    |  3 ++-
>  drivers/gpu/drm/bridge/sii902x.c                         |  5 +++--
>  drivers/gpu/drm/bridge/sil-sii8620.c                     |  1 +
>  drivers/gpu/drm/bridge/simple-bridge.c                   |  5 +++--
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                |  3 ++-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c            |  5 +++--
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c           |  5 +++--
>  drivers/gpu/drm/bridge/tc358762.c                        |  3 ++-
>  drivers/gpu/drm/bridge/tc358764.c                        |  3 ++-
>  drivers/gpu/drm/bridge/tc358767.c                        |  2 ++
>  drivers/gpu/drm/bridge/tc358768.c                        |  3 ++-
>  drivers/gpu/drm/bridge/tc358775.c                        |  3 ++-
>  drivers/gpu/drm/bridge/thc63lvd1024.c                    |  3 ++-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                     |  4 ++--
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c                    |  3 ++-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    |  3 ++-
>  drivers/gpu/drm/bridge/ti-tdp158.c                       |  6 ++++--
>  drivers/gpu/drm/bridge/ti-tfp410.c                       |  5 +++--
>  drivers/gpu/drm/bridge/ti-tpd12s015.c                    |  3 ++-
>  drivers/gpu/drm/drm_bridge.c                             |  2 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c                        |  1 +
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c             |  3 ++-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c                |  5 +++--
>  drivers/gpu/drm/mcde/mcde_dsi.c                          |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_dp.c                        |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                       |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                       |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                      |  3 ++-
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c               |  3 ++-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c                |  3 ++-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c               |  3 ++-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c                    |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/dpi.c                        |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/dsi.c                        |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                      |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                      |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/sdi.c                        |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/venc.c                       |  3 ++-
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c              |  3 ++-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c          |  3 ++-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c           |  3 ++-
>  drivers/gpu/drm/stm/lvds.c                               | 11 +++++------
>  drivers/gpu/drm/tidss/tidss_encoder.c                    |  3 ++-
>  drivers/gpu/drm/vc4/vc4_dsi.c                            |  3 ++-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                         |  3 ++-
>  drivers/platform/arm64/acer-aspire1-ec.c                 |  3 ++-
>  include/drm/drm_bridge.h                                 |  2 +-
>  82 files changed, 170 insertions(+), 94 deletions(-)

-- 
With best wishes
Dmitry
