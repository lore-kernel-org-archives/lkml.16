Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C57325A647
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 03:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738725590; cv=none; b=hFKRMoQFlSBTcw4qE6IIHDBux0enm8JCNNZioOycsylvcx9l1/3zUjSQYKs3Ij1EEcwIsfzWTQ45DOrS8dsDZrNt1vybzZb5Q+A3UMYqJ6ku14TfIX54hQQL17XwuTURzE/gHeHSxxfbD7HHaYzMWPGubwqmMwKraVTGQB+GPF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738725590; c=relaxed/simple;
	bh=zAF+0BTBqUwM/COz0k9XAusgcwVddd/iGvX2qH8k7b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGnGSsZQcUqRKqm1Dx6X77YuB+78sYrf2SizB+wJJEANY+CChpgbexA4hf6jvMFIkOxU/2IFNnajtLB5GL8jIuPrf/dFX/Djfas3OnZti0S0OWZ56A3edumVHUkcWY616XvGJMU9/WWODQTjrGtg9p66Pmp8CIwlWbzODlFnWOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hJUyWziO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hJUyWziO"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30613802a59so69431791fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 19:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738725586; x=1739330386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cbkbGS95q8+bWdGiDPErm44A724Ht0geUTiMi7tCq8w=;
        b=hJUyWziOOqKKDO3J8/cPITRmJF0sB3bMqx/t6sLpXzz0+v5knVVtZF4C4m/NmMfGHO
         KvBy1TRfwnkuuRJpQufQEkMh+xfh4D0i7/Qih2cuaZ390ERQSppAoAius3QAH5jttTg0
         p9SEyL2qvFoxDjmgswV7MuZMUKbYrUgRQxABN8snSbd3nAGqx4PqdTy6m5xiBJkGARIn
         ktfTbiRZ/omYhSwj+g+82w7+kmn1ZrnxWyQmoLm/liGoejWWYNEGkReHX8PFRri0bMTM
         qdbYVyDr1yKbDyn+mtd9FCZ38IP8sxC5HF9iHFiWD8wieMFSUZii89H+X5huOn5btk8u
         zGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738725586; x=1739330386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbkbGS95q8+bWdGiDPErm44A724Ht0geUTiMi7tCq8w=;
        b=exaUnGtHk/d4tLitXEvidvAVMeT9KQeTCowsT5iCGQ+a497Fz1kDqKswyPtP1ko7xA
         Lj8XHsvo0p8DlDQlQ2+uST/0fxa9/+upkN1r18O62pL0FV9jAfcZQnKtz3xptxA1u7Vm
         HwMLik138Vk2JFFkv0LB9hyHdC4YZco/S+yrtdyH6Kjsr5SA7Ynv1fAA3JiDE/XzFBv4
         2E0nTRlk1I/ZUlWVBesHPc6msgEO2vhssPSS9XVq0XZmZr/fynU4ua0Mh6+HLgm1S3gD
         SS2SnfZo9syXXerVKclA0Ct5vh99oP5areasoY45YMAYPgWnasS9NfDPhRtjZVKrGlEr
         61bA==
X-Forwarded-Encrypted: i=1; AJvYcCVG8BZv9dmfd19EoUHczAVUXI4KVdNHNxY7/fx5xOKMj3oSIRQmvcNDxvfQEk7NKG8EdMVB7Hd0u7ED5LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyguTQicI6SRl3IPopGhxmH+nLQz02N5V5FBkZdCWiEHKfFr0WW
	GHjujjwed/T0pfNZFg5HHWhhRKMgUnvtT0cebamqhf3ek3uuJpaqOhrGeUshkfynte0NhGGnBtx
	Hgpg=
X-Gm-Gg: ASbGnctlOv+ypRUKOO/tFvP+yj3XxPZ+NAUAb3lgyH6Iww7Zv3ZNAdSF2EZZyX8eNVN
	tjegwdfnZEr7KORkJUw4fU6lYVHKWcd9MFPZq89B1Bl1owsFTr24gFhS/oC/Y/n3x4y3bBaKChK
	lB2vehL86ApSZKXTaza1+Cj4oGVI3Yti+CwxqQp/4bqCxHZe5/IjfHgU2cKS7LHhM31WyA6SVZQ
	KZCfXaUaeiz4Mmapq1EQRKuyXGVniqgpBQk9jta/RckbIwLaGvdr6ro6fU67eWbOat6t+9FaVxT
	umY0INUwdC+NAt/liMDQGEsjcCzQKstN8AzxPBuCw+Br2Kb5RgWyw1+JGT4Bd2eErI1//cM=
X-Google-Smtp-Source: AGHT+IFQaxEYR8WTMaL8TfzTtKZBrxzwSEhBdjR8KdYYZRdGHPczYQQAvfnIGP5de9L+IAXEp2+hOw==
X-Received: by 2002:a2e:a551:0:b0:302:3ff6:c8c6 with SMTP id 38308e7fff4ca-307cf388cf4mr3014021fa.33.1738725586220;
        Tue, 04 Feb 2025 19:19:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a306a325sm20306381fa.13.2025.02.04.19.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 19:19:44 -0800 (PST)
Date: Wed, 5 Feb 2025 05:19:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/35] drm/bridge: Pass full state to atomic_disable
Message-ID: <eaojxhsfvm6m4tz7px4dttmak3w5avn7kkuq4xrotfiftysjtl@dgso5zknraeh>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-4-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-4-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:32PM +0100, Maxime Ripard wrote:
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_disable hook prototype to pass
> it directly.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  |  6 ++----
>  drivers/gpu/drm/bridge/analogix/anx7625.c           |  2 +-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  2 +-
>  drivers/gpu/drm/bridge/fsl-ldb.c                    |  2 +-
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        |  2 +-
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c             |  5 ++---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c |  5 ++---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  5 ++---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 +++-----
>  drivers/gpu/drm/bridge/ite-it6263.c                 |  5 ++---
>  drivers/gpu/drm/bridge/ite-it6505.c                 |  2 +-
>  drivers/gpu/drm/bridge/ite-it66121.c                |  2 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c             |  2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c             |  5 ++---
>  drivers/gpu/drm/bridge/nwl-dsi.c                    |  5 ++---
>  drivers/gpu/drm/bridge/panel.c                      |  3 +--
>  drivers/gpu/drm/bridge/samsung-dsim.c               |  2 +-
>  drivers/gpu/drm/bridge/sii902x.c                    |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           |  2 +-
>  drivers/gpu/drm/bridge/tc358767.c                   | 10 ++++------
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c               |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c               |  2 +-
>  drivers/gpu/drm/bridge/ti-tdp158.c                  |  3 ++-
>  drivers/gpu/drm/drm_bridge.c                        | 10 +---------
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c           |  2 +-
>  drivers/gpu/drm/mediatek/mtk_dp.c                   |  2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  2 +-
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c          |  2 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c           |  2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c          |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                 |  2 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c                     |  5 ++---
>  drivers/gpu/drm/msm/dp/dp_drm.h                     |  2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                 |  2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                 |  2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c     |  2 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      |  2 +-
>  drivers/gpu/drm/stm/lvds.c                          |  2 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                       |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                    |  4 +++-
>  include/drm/drm_bridge.h                            |  2 +-
>  45 files changed, 63 insertions(+), 83 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
