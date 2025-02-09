Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF460243365
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 03:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071629; cv=none; b=sYqWbsXw0XBKKuNeQAIzG/d3yHqzYVZyMEckAhZGNI51TfcW12GBkfxipWIGbvJ/aeR75/krKvuvDAOv3v9MuhOI1ysIbGtmp+r3nHp8/IJJR7KFy/cnlN25N32n71C4/mavjP45+CbmLwbEvD8kW1CUZU6b7XziQ9RQuGTe7qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071629; c=relaxed/simple;
	bh=LLv8tmmK/SZlK/XrujaJirdK0p7aZvSs3QKOmy6ZwkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pho/OJmxOUD90vP/beyIImwAyeLLDAVja/MPmH4m+1xXsozzZYceVBCtiQ4znnr+HVHmo2PfcHBEGkQRtPXIf4a2Amgb0/DRaveiNzzos+qCDsSc3LYPDgEGdPRLgl0CWyer7zdcvNRIpKJufiiV37GUyj4IL0zZ1/NrtV3EifE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LlFEmNnF; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LlFEmNnF"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30797730cbdso32046061fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 19:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071625; x=1739676425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MEMGOzMHg8q4HMuP8Kzf4ro/M59TspTkcMQCU5stT2k=;
        b=LlFEmNnFZ0qhpDU6JaLRN18IxUN6RDAsUl6dA4W44erNoI08F9opujCIQhJzJc8LEI
         htughqFsckS9OW1Eyz+g0cdjxREoGqqtn7+o4x7EK76j5P0JN0hZhcL9KnmGuzo1WRAN
         qUAEkvg/niStmUJbkDRmq9xoLdgerVn6873zviClHUpmqAr94acnMc/dAIuKCJqCHMLU
         BiRopaDJfFASsCvxu5ocuK8b6vD7q1ib2HjXR5jX6GqYEZv3T3FmuyhHUzlTUUn5LUPa
         oV+5gXL+AzuYJDmERgCtCPpWYdoFEUF+jLf5QaVNlXuk4A+vUIlyzwkm1qcIp0J1PIGs
         lstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071625; x=1739676425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEMGOzMHg8q4HMuP8Kzf4ro/M59TspTkcMQCU5stT2k=;
        b=F6eIGsgkDMdGN37EHYk7FIsL/VWNZ08oMMRFB7nRHtaWUKeFi8Pu5mydyN0GdGDBXD
         6aea9jlq1WubEzF/bsIFC2NyU7ImIoCqNUL1CMafFn797HmgmN+rvRS4Jofb9Ar+iJJG
         SWEUHMixFi/RLT9fkAUyn2opPpcDaLQi/JteS32VmsB1HhY/dxESD41gT3BRRYrVCAPT
         f5+lnfMPA6V8IIXpkc1zZ9bIjtrrpvUK/7CBdB0+plDL2CQtj65eCcbgArcocQHxJ4Dh
         MVlfMDH8FVt4+cBb6NJGWE0lPBt3fqczje2dgv8GG7E7auVf3LNtxuBpyONTBX24YU+0
         K3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnCwc8CKL0NFaXlOdpeuQyzndOttqNeat1ZqaT9foj8pA1OF+BaiWDO1WTzunc0A6ojVZu0v5l540KcL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6tU5oZ6z1YKuqnCLxXoEIRXoZ3dNd5oaEo9zydvoWQ0zDszm6
	s8uKn3ImJ2gvi+fGXyh8m/6fdbyxodWj+sJ7QatOh+qTiB8KEdQMvgy+B2UqMU4=
X-Gm-Gg: ASbGncteYajVVkqLpt2WBEkLQXn8U8ueyV9rfMpszOFD9XrF5WJSw7IsdAhQYi1NLxa
	5gLsYKdbGLlptETduOxVvQXyu/lVlXj4qODaHOcnM+at11mY3w9Peqc77/3hgTkNj55s5x+AZUH
	QerAySb6hBi/rzHilhc9ZWyxtNezAdjV1uBRfej0NS+nhqFWi1v+AUORIDQoBqcUCEL61nma3Mn
	1rOxGv+fM0uOUuH9G8/Yju6/2lYCSEhRb8FgKMtPBWuyrkvZpj5EdkATM55YDyc/vSEu9/KbRIz
	w7QwijPAuXtKJ2i4W1kMXEpiaG0TLONd31Eo/qaSWSZIulq9xvK5XNH/ry1m5HCUWJNp+/U=
X-Google-Smtp-Source: AGHT+IHWOaxReu1PjXNDThgwzOdk0tYkcKOZfUsXWgA+tH1ap47fTYHkaH6FCI/c9iY9x2qd2M3TgA==
X-Received: by 2002:a05:651c:b29:b0:302:3ad8:34 with SMTP id 38308e7fff4ca-307e57ca839mr25888001fa.12.1739071624853;
        Sat, 08 Feb 2025 19:27:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2bad67sm9037651fa.77.2025.02.08.19.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:27:03 -0800 (PST)
Date: Sun, 9 Feb 2025 05:27:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 00/35] drm/bridge: Various quality of life improvements
Message-ID: <yudkovtipwtnofr3o2qwqrmriwxlczrwploieh5i4ke3sx5zhk@5ktlrew7o6k2>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:28PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Here's a series of changes after to the KMS helpers and bridge API
> following a bunch of reviews I did.
> 
> It's mostly centered across providing an easier time to deal with bridge
> states, and a somewhat consistent with the other entities API.
> 
> It's build tested only, with arm64 allmodconfig.
> 
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v2:
> - Pass the full atomic state to bridge atomic hooks
> - Make attach take the encoder as a parameter
> - Mark bridge->encoder as deprecated
> - Rework the logic to detect if a bridge uses a state or not at
>   atomic_check time
> - Add lockdep assertion to drm_bridge_get_current_state()
> - Link to v1: https://lore.kernel.org/r/20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org
> 
> ---
> Maxime Ripard (35):
>       drm/atomic: Document history of drm_atomic_state
>       drm/bridge: Pass full state to atomic_pre_enable
>       drm/bridge: Pass full state to atomic_enable
>       drm/bridge: Pass full state to atomic_disable
>       drm/bridge: Pass full state to atomic_post_disable
>       drm/atomic-helper: Fix commit_tail state variable name
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_dependencies()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail_rpm()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_modeset_disables()
>       drm/atomic-helper: Change parameter name of disable_outputs()
>       drm/bridge: Change parameter name of drm_atomic_bridge_chain_disable()
>       drm/bridge: Change parameter name of drm_atomic_bridge_chain_post_disable()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_update_legacy_modeset_state()
>       drm/atomic-helper: Change parameter name of crtc_set_mode()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_planes()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_modeset_enables()
>       drm/bridge: Change parameter name of drm_atomic_bridge_chain_pre_enable()
>       drm/bridge: Change parameter name of drm_atomic_bridge_chain_enable()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_writebacks()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_fake_vblank()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_hw_done()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_vblanks()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_cleanup_planes()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_cleanup_done()
>       drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_flip_done()

I agree that use of the old_state can be confusing (and it has been
confusing to me for some time). The main question is, do we loose useful
memo 'this is the state after swap'. Most likely it is useless now, just
wanted to give it a second thought.

>       drm/bridge: Add encoder parameter to drm_bridge_funcs.attach
>       drm/bridge: Provide a helper to retrieve current bridge state
>       drm/bridge: Assume that a bridge is atomic if it has atomic_reset
>       drm/bridge: Provide pointers to the connector and crtc in bridge state
>       drm/bridge: Make encoder pointer deprecated
>       drm/bridge: cdns-csi: Switch to atomic helpers
>       drm/bridge: tc358775: Switch to atomic commit
>       drm/bridge: tc358768: Convert to atomic helpers
>       drm/bridge: ti-sn65dsi86: Use bridge_state crtc pointer
> 
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   3 +-
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   3 +-
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   3 +-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  26 +--
>  drivers/gpu/drm/bridge/analogix/anx7625.c          |  11 +-
>  drivers/gpu/drm/bridge/aux-bridge.c                |   3 +-
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c            |   1 +
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  30 ++-
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   6 +-
>  drivers/gpu/drm/bridge/chipone-icn6211.c           |  13 +-
>  drivers/gpu/drm/bridge/chrontel-ch7033.c           |   5 +-
>  drivers/gpu/drm/bridge/display-connector.c         |   1 +
>  drivers/gpu/drm/bridge/fsl-ldb.c                   |   8 +-
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |   7 +-
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |   2 +-
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |   3 +-
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |  10 +-
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |  10 +-
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  21 +-
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   8 +-
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  13 +-
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  11 +-
>  drivers/gpu/drm/bridge/ite-it6263.c                |  18 +-
>  drivers/gpu/drm/bridge/ite-it6505.c                |  10 +-
>  drivers/gpu/drm/bridge/ite-it66121.c               |   8 +-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c           |   3 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c            |   8 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c            |  21 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
>  drivers/gpu/drm/bridge/lvds-codec.c                |   3 +-
>  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   1 +
>  drivers/gpu/drm/bridge/microchip-lvds.c            |   3 +-
>  drivers/gpu/drm/bridge/nwl-dsi.c                   |  13 +-
>  drivers/gpu/drm/bridge/nxp-ptn3460.c               |   5 +-
>  drivers/gpu/drm/bridge/panel.c                     |  15 +-
>  drivers/gpu/drm/bridge/parade-ps8622.c             |   1 +
>  drivers/gpu/drm/bridge/parade-ps8640.c             |   7 +-
>  drivers/gpu/drm/bridge/samsung-dsim.c              |  11 +-
>  drivers/gpu/drm/bridge/sii902x.c                   |   9 +-
>  drivers/gpu/drm/bridge/sil-sii8620.c               |   1 +
>  drivers/gpu/drm/bridge/simple-bridge.c             |   5 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   5 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   8 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  11 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  11 +-
>  drivers/gpu/drm/bridge/tc358762.c                  |  12 +-
>  drivers/gpu/drm/bridge/tc358764.c                  |   3 +-
>  drivers/gpu/drm/bridge/tc358767.c                  |  22 +-
>  drivers/gpu/drm/bridge/tc358768.c                  |  33 ++-
>  drivers/gpu/drm/bridge/tc358775.c                  |  39 ++--
>  drivers/gpu/drm/bridge/thc63lvd1024.c              |   3 +-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c               |  10 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  10 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  63 ++++--
>  drivers/gpu/drm/bridge/ti-tdp158.c                 |  12 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c                 |   5 +-
>  drivers/gpu/drm/bridge/ti-tpd12s015.c              |   3 +-
>  drivers/gpu/drm/drm_atomic_helper.c                | 242 ++++++++++-----------
>  drivers/gpu/drm/drm_atomic_state_helper.c          |   5 +
>  drivers/gpu/drm/drm_bridge.c                       |  98 +++------
>  drivers/gpu/drm/i2c/tda998x_drv.c                  |   1 +
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c       |   3 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   9 +-
>  drivers/gpu/drm/mcde/mcde_dsi.c                    |   3 +-
>  drivers/gpu/drm/mediatek/mtk_dp.c                  |   9 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |   3 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  11 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |  12 +-
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   8 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c          |   8 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   8 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                |  28 +--
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |  19 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   6 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |   3 +-
>  drivers/gpu/drm/omapdrm/dss/dpi.c                  |   3 +-
>  drivers/gpu/drm/omapdrm/dss/dsi.c                  |   3 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                |   8 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                |   8 +-
>  drivers/gpu/drm/omapdrm/dss/sdi.c                  |   3 +-
>  drivers/gpu/drm/omapdrm/dss/venc.c                 |   3 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |   8 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   7 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |   8 +-
>  drivers/gpu/drm/stm/lvds.c                         |  16 +-
>  drivers/gpu/drm/tidss/tidss_encoder.c              |   3 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |  12 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  17 +-
>  drivers/platform/arm64/acer-aspire1-ec.c           |   3 +-
>  include/drm/drm_atomic.h                           |  45 ++++
>  include/drm/drm_bridge.h                           |  39 +++-
>  91 files changed, 681 insertions(+), 574 deletions(-)
> ---
> base-commit: 50d0a57d3a4193862a53fae0de7ed7749908cd8f
> change-id: 20250115-bridge-connector-f93194e267ff
> 
> Best regards,
> -- 
> Maxime Ripard <mripard@kernel.org>
> 

-- 
With best wishes
Dmitry
