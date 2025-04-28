Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB850215040
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874005; cv=none; b=JjTgklXEdtFgdxXKjOhaiyTOEe44wDPnZK8/Rp9Gmv0aV1hosLfxqC8ekzh9J6HevX7vl4DI3il2qah/hTEndlZW4+KeyPRD2n/TRcXOaMArkAS2QG7/mZeUtjsVM9sHIMrm3XBMOSFPyUNk221YKs+wIvUXFGgXmcy4xCZqhMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874005; c=relaxed/simple;
	bh=sehDf/wz1Jc2NfNVJoDIU1m599/TWswRXczsp9U/qmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anYGmhV4HtD2X1j7zMQDtZKksGpgsxwEXAhUk+AE9H8341Y+o4cM92T6lJFdJcd3kHRzCesZhw47/84ItbFqSPcgLpvO+C2GmPkrjjgJqC/v9pS0inv7C/jYgO2RcZbGjDbHVCXLEgVK/0yJ94YpdpExiSEIuzcR/mPqAU4+UQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TQUxzz02; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TQUxzz02"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2279915e06eso60181745ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745874003; x=1746478803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HZyp8budJTYWJ9MOmTZnBjDzB8PV0g52ckHb+nyRQs=;
        b=TQUxzz020MzDVuIb0uO4mHR8l8h9m6for5Kg6hHyN0KvXC6163Q4PW8ZK49hywFtrt
         i6RST2EcJna1He2vEoRGei/d4tpMmwVA0ShEW2r7VTq8vm8+XzBuRORreTl4I8u6mmK7
         pe80hRbgYz9qCqN7CzF1K4GrPJlnr1cLBP40Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874003; x=1746478803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HZyp8budJTYWJ9MOmTZnBjDzB8PV0g52ckHb+nyRQs=;
        b=iJP426hiN5TIln5liy0aCzmb4sVa9oDuF4eCbu2nNgl4wXJ3gO3HBXKTsjheqvlvlb
         I1MomIqk3AoGJ19XsmUCOxfwcUaJF8iW4TSKwdeh8cATrNLkBNbqNC2YKfEyPVhi4HNU
         cKWWzsiyXPF9liOhdnr9/qYo+D/7kOiw0+b4tFOskfLE2b931BOgodqWBG9V92ki1xcK
         SzsExyFdwS53LY+U+mxGumWStbvlWA2uKKzvYRWDbZ4gFcZBR7UYhA2TMRFbM9FHq5PU
         MVfAD8tFmX5aorTzL5Cfeu9KuczyyC7vewBzHhzfLr3lLjqg8lLLMUsCb3x2SBffZz8O
         XCfw==
X-Forwarded-Encrypted: i=1; AJvYcCVkcNTHqauVQQNIZ9j0U8qElixwV9bAYvG9nITYNYauusj03y9dPkb6wh8OW6zv5dE4AxjTmidR0i9K2sU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkI+WOZX3LLfJzzk9t6UYL/Wd+RBvKbAkjZ2q3Kt/JL9SkZVIB
	6gNvtsJ4wiotvfJh/Ryjizl9JzFWSYcusFk4e3Vu19DkALZ5Jxvio/Y2wm0TossIDosu4pYzdnE
	=
X-Gm-Gg: ASbGncvDy1YlWHL/Auhp4CMCmI/0590pE4hrY5gF6Oe9vtY6trquPObxrlFqBAB553T
	KbaI3zaY5Nx3kK40vGuCYzW6e8ubc2Px+I4skyIXiXK4Gv1tT59ZXcC5iNfp7T4zrP878PQaoyi
	s76UnIBYI74d05DVNqKwecP+OMB5FFZj8gd9LuvwpFQBVwdu8D9+PdPuprvZZafzYvi96tdJmbR
	1xJFqrLOzuNZwKxxhUyEvwZVzUNJLClPyQn1FayjtMd3PRe9RM+AwTLbKvzJO2Fw9s3Ni+jCn4c
	WUTRKr6FU1FzVHwNI654miBQE0YOAbsDEvUQBc3Np7NYEUm8IZZkTQ7f+P4ROMAwcEQth98Arn+
	6IRsB
X-Google-Smtp-Source: AGHT+IEVMYocYOgy7ppjzZ24dgJjG2cS85f8o0riwUXC/hRmYeqiE5NSrAQUur6zgaLbWXdJgioCSA==
X-Received: by 2002:a17:902:c412:b0:223:66bc:f1de with SMTP id d9443c01a7336-22dc6a04765mr167475875ad.21.1745874002884;
        Mon, 28 Apr 2025 14:00:02 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76d12sm88291485ad.25.2025.04.28.14.00.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:00:02 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so4361206a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:00:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgZFcwUIwcZFmWTKzVB/xWkQbKYrGzS+CyHiWw23VPMIJViFYHswABG6wh2jddRqMDUjWyTlrzidUc4Q0=@vger.kernel.org
X-Received: by 2002:a17:90b:2e03:b0:2fa:1a23:c01d with SMTP id
 98e67ed59e1d1-30a0132e771mr15291417a91.21.1745874002058; Mon, 28 Apr 2025
 14:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:59:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
X-Gm-Features: ATxdqUFp3e4vRAA9U9jS3-gUD9FhwChMaNCvlfej-PAqltrXksVDq12UxaUaXqM
Message-ID: <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 11:59=E2=80=AFAM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> devm_drm_bridge_alloc() is the new API to be used for allocating (and
> partially initializing) a private driver struct embedding a struct
> drm_bridge.
>
> For many drivers having a simple code flow in the probe function, this
> commit does a mass conversion automatically with the following semantic
> patch. The changes have been reviewed manually for correctness as well as
> to find any false positives.
>
>   @@
>   type T;
>   identifier C;
>   identifier BR;
>   expression DEV;
>   expression FUNCS;
>   @@
>   -T *C;
>   +T *C;
>    ...
>   (
>   -C =3D devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return -ENOMEM;
>   +C =3D devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   |
>   -C =3D devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return ERR_PTR(-ENOMEM);
>   +C =3D devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   )
>    ...
>   -C->BR.funcs =3D FUNCS;
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Adrien Grassein <adrien.grassein@gmail.com>
> Cc: Aleksandr Mishin <amishin@t-argos.ru>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Christoph Fritz <chf.fritz@googlemail.com>
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Cc: Detlev Casanova <detlev.casanova@collabora.com>
> Cc: Dharma Balasubiramani <dharma.b@microchip.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Janne Grunau <j@jannau.net>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Jesse Van Gavere <jesseevg@gmail.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Phong LE <ple@baylibre.com>
> Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Cc: Sugar Zhang <sugar.zhang@rock-chips.com>
> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: Vitalii Mordan <mordan@ispras.ru>
>
> Changed in v2:
> - added missing PTR_ERR() in the second spatch alternative
> ---
>  drivers/gpu/drm/adp/adp-mipi.c                      |  8 ++++----
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c        |  9 ++++-----
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c  |  9 ++++-----
>  drivers/gpu/drm/bridge/aux-bridge.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c             |  9 +++++----
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  8 ++++----
>  drivers/gpu/drm/bridge/chipone-icn6211.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/chrontel-ch7033.c            |  8 ++++----
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/fsl-ldb.c                    |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c      |  9 ++++-----
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        | 10 ++++------
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  8 ++++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 ++++----
>  drivers/gpu/drm/bridge/ite-it6263.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/ite-it6505.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/ite-it66121.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/lontium-lt8912b.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/lontium-lt9211.c             |  8 +++-----
>  drivers/gpu/drm/bridge/lontium-lt9611.c             |  9 ++++-----
>  drivers/gpu/drm/bridge/lvds-codec.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/microchip-lvds.c             |  8 ++++----
>  drivers/gpu/drm/bridge/nwl-dsi.c                    |  8 ++++----
>  drivers/gpu/drm/bridge/parade-ps8622.c              |  9 ++++-----
>  drivers/gpu/drm/bridge/parade-ps8640.c              |  9 ++++-----
>  drivers/gpu/drm/bridge/sii9234.c                    |  9 ++++-----
>  drivers/gpu/drm/bridge/sil-sii8620.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/simple-bridge.c              | 10 ++++------
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  8 ++++----
>  drivers/gpu/drm/bridge/tc358762.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358764.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358768.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358775.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/thc63lvd1024.c               |  8 ++++----
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/ti-tdp158.c                  |  8 ++++----
>  drivers/gpu/drm/bridge/ti-tfp410.c                  |  9 ++++-----
>  drivers/gpu/drm/bridge/ti-tpd12s015.c               |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dp.c                   |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dpi.c                  |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  9 ++++-----
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c          | 12 ++++++------
>  drivers/gpu/drm/meson/meson_encoder_dsi.c           | 12 ++++++------
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c          | 12 ++++++------
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  9 ++++-----
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++------
>  49 files changed, 201 insertions(+), 237 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
