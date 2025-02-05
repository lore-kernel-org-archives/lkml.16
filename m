Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132E725A65E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 02:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738724062; cv=none; b=NGouP9ToSUlYbT3Ui7LZhkiSnR3kW2qCkQ2lPG6J9NRyQGvYR3fZx9Zwvwlr1vOgyKKoKYJQqrnmPthGxqFF6/9eUrbWxRAP5rj8r+/txvAi1gtNsuAF/SU9l0TpFpPSef19cNDLzP7fka2WcXDRbrMtolUzba5YvMP/ugjjFg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738724062; c=relaxed/simple;
	bh=TBihKvKUDqNG+XzUjVY2C25WQdGwbq0zbkOWC5sSNXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3QdzEAtmPOPedUG1W7A59p5pAoEYtjWKt0BfbO7bQ2eh8XBnLEcqCMJb72INKtec4Ltp3gBKnwsy4lGMX0PSEziVvhjTK+JacMyOg98RSCJ2bHhRsBlfL/eaKpk7EkNxIzeVi3V8PwjMx39s5JsBjvhlq9qKHPdLkSMFzgWuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ohpo0Kgx; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ohpo0Kgx"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-305d843d925so49783431fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 18:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738724058; x=1739328858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OYZuDPFMLQ+OLhTc7ZzIuiQKs2wek7VNQb4qjvs/Nn8=;
        b=Ohpo0Kgxcj2Cu8+Sp542DIAB0cem1InJ5/bMD71HUKyvmSNswiNmLFg032Yl1W0BVG
         FzHR6vWRQu4KQ3ndM4zjBZyh3xswN5uPu8nbtEJKQJYkze4sYCQ2UNwJBHArIrP+oZwT
         4dL6j7wJ1Rdh4EEvIGx/2AEUOWjUd+06DPlP/8UfCdmc3yUYILYggFlqIBc9fw7YhBC5
         EHc6lBHQISA8U5ds8zJuVb/bsp4HOtfY8vnVVlmov1Htk7fl8zynZ9l9pe2QtS033wC9
         V1415dmcA1/OI26fnKhSUeP1vGEgNz3nT4lwadc4sGgs49PO7nsTp6kcueZ83nfgNB8m
         c+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738724058; x=1739328858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYZuDPFMLQ+OLhTc7ZzIuiQKs2wek7VNQb4qjvs/Nn8=;
        b=DnNXex2YNcgj+T7iwTY+G1rYwasxCzTMwcK5GeOIhYKvXUpWqbYa/OQKt5IxTuTEhg
         Q61WSyGWUOxs2+R3tqdbT04kYuTzEBtZpZvMTeYaicE93E8OVP41E2gcq1znx9+TUk0l
         QTiqrWjv+e7q8UD6dZ16fHGTqkqW/1L9iYey5Dh44iJRKwtQtptK2vM7PUcXLK4ApDUH
         OefI2siRbgB28qLaTYmiAfq9d82YJL6FGo9LRT3bRcOcHKu0FgjnqCBkCHgQJUAFS77l
         e0Qg7HeV8SH09fpEgkKFyr7beCaNXhgcH24P9yyo4Pdwfcmzh4oo0nNMWlpAFhL7OO2e
         mLpw==
X-Forwarded-Encrypted: i=1; AJvYcCU9upyOcBMF/5vYFqEQxeilFJbpc5OamgUuNnrAYy0HLL51vLX/qxIG3wMHsO6x4R6P8dvrlQcQbxTbK9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzndWN/d+gtjjh7ft2CiVExsdHNcbYgAx61uJKgsoXKVF9JR4n1
	FXikV5oxt/6Z/6ruYEDA7P/AX9qEYQiwdFJCn87eM6U8fE2rgO1CRKSBkqA8Xx0=
X-Gm-Gg: ASbGncsxO9E5+ar3vh5WZKGNRbeUj5rPVbzg4PjRTfEo/Z/YsR8GdisjW+4RfepcCPM
	w0xpvUSUP86cCLxqX0mMWHh39ebmDayCs04dtIf4jAegeznCKh/1LdZnvvx94k31yUITvZN4uqk
	yMjXbu0U/ItOsnbogK8upD42hC9ew1hvwnJe1WLl26PsTYPptezmt9l4nAQgNS2WLCVI2T+Sz9M
	V/DQGVR3hCnRprrSbssPFXKd+X02M4HYabEEOTtUYFYGN2G9N2IKzLP1+RopGXIU1LXRbqgGcFb
	+b9AP2HWOdjn/6vP0qM7OiMomo8ChfIUGainpycf/gwhY0Hb1PX0nXnpWG3F9RBa6yngpd8=
X-Google-Smtp-Source: AGHT+IHPVoXXLHIxl6ddc44Iw6mnopmfN70pRmNow34QqWOLsoeN3BSDLVO0cC1hibW9A/XhOv4Nzw==
X-Received: by 2002:a05:651c:220e:b0:2ff:d7cf:a6cb with SMTP id 38308e7fff4ca-307cf2fdd34mr3899241fa.11.1738724058047;
        Tue, 04 Feb 2025 18:54:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a34288b4sm19027531fa.105.2025.02.04.18.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 18:54:16 -0800 (PST)
Date: Wed, 5 Feb 2025 04:54:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/35] drm/bridge: Pass full state to atomic_enable
Message-ID: <iai7btbq23r3vkimz6c4ukfb2fjwijkdgswxiq6kvfm3pgsjhq@firhtmoa2l2z>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-3-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-3-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:31PM +0100, Maxime Ripard wrote:
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_enable hook prototype to pass it
> directly.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  |  6 ++----
>  drivers/gpu/drm/bridge/analogix/anx7625.c           |  6 +++---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  3 +--
>  drivers/gpu/drm/bridge/chipone-icn6211.c            |  3 +--
>  drivers/gpu/drm/bridge/fsl-ldb.c                    |  3 +--
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        |  5 +++--
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c             |  5 ++---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  5 ++---
>  drivers/gpu/drm/bridge/ite-it6263.c                 |  6 ++----
>  drivers/gpu/drm/bridge/ite-it6505.c                 |  3 +--
>  drivers/gpu/drm/bridge/ite-it66121.c                |  3 +--
>  drivers/gpu/drm/bridge/lontium-lt9211.c             |  3 +--
>  drivers/gpu/drm/bridge/lontium-lt9611.c             |  6 ++----
>  drivers/gpu/drm/bridge/nwl-dsi.c                    |  5 ++---
>  drivers/gpu/drm/bridge/panel.c                      |  3 +--
>  drivers/gpu/drm/bridge/samsung-dsim.c               |  2 +-
>  drivers/gpu/drm/bridge/sii902x.c                    |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  3 +--
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           |  3 +--
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  2 +-
>  drivers/gpu/drm/bridge/tc358762.c                   |  3 ++-
>  drivers/gpu/drm/bridge/tc358767.c                   | 10 ++++------
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c               |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c               |  4 ++--
>  drivers/gpu/drm/bridge/ti-tdp158.c                  |  3 ++-
>  drivers/gpu/drm/drm_bridge.c                        | 10 +---------
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c           |  2 +-
>  drivers/gpu/drm/mediatek/mtk_dp.c                   |  4 ++--
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  3 +--
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c          |  3 +--
>  drivers/gpu/drm/meson/meson_encoder_dsi.c           |  3 +--
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c          |  3 +--
>  drivers/gpu/drm/msm/dp/dp_display.c                 | 12 ++++++------
>  drivers/gpu/drm/msm/dp/dp_drm.c                     |  9 ++++-----
>  drivers/gpu/drm/msm/dp/dp_drm.h                     |  2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                 |  3 +--
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                 |  3 +--
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  3 +--
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c     |  2 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      |  3 +--
>  drivers/gpu/drm/stm/lvds.c                          |  3 +--
>  drivers/gpu/drm/vc4/vc4_dsi.c                       |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                    | 10 ++++------
>  include/drm/drm_bridge.h                            |  2 +-
>  48 files changed, 78 insertions(+), 116 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
