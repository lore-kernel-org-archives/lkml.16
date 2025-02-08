Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67DD1E515
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 05:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991972; cv=none; b=YMVwrlzsiMTZsFZFLrRybjEuxJhMqqaQIWzD2hYxE36H9xuQrlZgeRg9qPi7CyKCTLbVetXXLTpexSVbfH1RFrhVr52Yfoapq1lJ6PHChHIZ2IS3idLj88kb7VIZDI86xF0DqijnxE8E/uYl99T7NgnUbVttuft9FnVmusaPnPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991972; c=relaxed/simple;
	bh=WE53Zhv/fLeUZ5rHu0F0uGAkBNohYeCqkpNl9GxxKqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZYOTXIXw4kGbUjapavzyArmMrSSGJiGcS5TqY/yneu2sGNq4MmoLhEnxzktrdUV9/JHctMLFQ0UfVzOazYYoe4X148LsBCNRmn83ZyP4WmWlzcl537NupvaMmODx+oMBqk6I7VOHHGXoi4+Fy08uhYj25CIgiV5JiIbcJPBatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pqlFT7hf; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqlFT7hf"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54505a75445so162677e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 21:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738991969; x=1739596769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XbmEch0kSfMOKC6/rJ1doWwYVcmMwQu5vCq8pLMJYLw=;
        b=pqlFT7hf2SGQSUwRETLjfYK5Fwm/Z86rj029G8RZG1zHCpc/eP4qcGRoXpGcwFRsBH
         iN/t9b2whobHmT2mB0V2b9330qhjLjPzkXP5wMvzxILjsQ0wku/y32shwTZXr6vfyrE/
         oyQmOuiHKsSw5APjLTUa+hO1PChl4i0BVC/EU74jqKpFloo6/PWrdl0gFhzO0eddufSR
         UtQ8e7ShHNCDSioHpszvF5sLP4Jg5VIYnJ9uHOcZgwkirR4KJjoWOK20YSbo2vQq7mhl
         Ewtwayftri0y0TjvpHpS44GHHct/sc81QLISjhpBmytn9q0gfZzW28dTJf/vkjLh1gJ7
         zp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738991969; x=1739596769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbmEch0kSfMOKC6/rJ1doWwYVcmMwQu5vCq8pLMJYLw=;
        b=TfZ2LvETGVpfGECcD6Vy3NZ4L3F9t9Jp8h5eh6fbQNUH7o4nNNCYzaUeKb8YR5jwSL
         H87zwIgE1fZl8+OAxTwN05kqIrM19KemC1kWKAB96aGLykLfISmpjeDQVHiOlfR9F88s
         +3TxuRgQu4LYi6wpiGHIQc5PFYcedZn/qXQLEr2Va9MZIl6LOtsW2aL5HQkMcllPth+n
         Gcf1pR87TPix8JFuvgRYLqXfbimkzbGR0mXyZx+eWzFX3pY9o6kKHMPYWYR0FhhBCuj4
         Zss2ssinhht5lTHrux+obMhFhDLX1zFZ6X29tp7cIS7TGIQnys0PIRUZe0Z4S0/2ipaT
         ig3g==
X-Forwarded-Encrypted: i=1; AJvYcCX0igyM5IxO6n5OAWn1fyn3uV5OKm80TlTBFU6iUv1rDDj22PVQUJ8DEXTXeMlLNcIks8syeLAqhikbKiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQQ0tKdNC/uIEwqG+FX268L17u8Lx00H/Ji/9IHwJZ929i9yNO
	pzwGNrw+Vg2Bb3sQteoTpgBJ/yC45tD+iCsYMeAJwptvDDNTf24bXrJdoAT4Iqy02WDulj8EryM
	qD8c=
X-Gm-Gg: ASbGncsYi7QH7mdg5LZf7C7PDgsM+7sfZrtZsyl7UFY1Qqa1unjd3bd9bABvOOZp3gH
	9VcmbZwCqgBjqHC3PzK1vJFModSmXAJPVK867gMNOOTGdnwoe/hbQFxv99b4bS4kF/238mdM90R
	ifJEpy2sgBkYh3NfcxQajcO/C+z6ipZuu0PnMbbsBb1jOLTWFUC/6M1bA9+kiyB3ByBuCc5ZbNk
	Dk7mYG35CIA756V0CvZEeHNGE5IYJI0DaZKy4uddNqJOPAPvIKoUkbx0Ok/T5VOsBk92idinave
	ayMm9H5D3XhsZCf/YBU1SccWsvOoMpN1Ny4VLYc+2twGTWMdGIyKLZPhIBnmmHfb+v645VA=
X-Google-Smtp-Source: AGHT+IEgvj0rP082XMOnWmPAOgxRus50LsWzxvsljRKd/lfLJp/HnL9/Ij+KWNkNuMgAahlz+FUAew==
X-Received: by 2002:a05:6512:348e:b0:542:2a28:e30f with SMTP id 2adb3069b0e04-54414abba5bmr1913205e87.31.1738991968614;
        Fri, 07 Feb 2025 21:19:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ecccsm626483e87.21.2025.02.07.21.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 21:19:27 -0800 (PST)
Date: Sat, 8 Feb 2025 07:19:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/35] drm/bridge: Pass full state to
 atomic_post_disable
Message-ID: <thnyq2advlb6mumnokx55x4wcpqv63bttsd3numf47tpxermpd@e7buh4vhuq57>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-5-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-5-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:33PM +0100, Maxime Ripard wrote:
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_post_disable hook prototype to
> pass it directly.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  6 ++----
>  drivers/gpu/drm/bridge/chipone-icn6211.c           |  2 +-
>  drivers/gpu/drm/bridge/ite-it6505.c                |  2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c            |  5 ++---
>  drivers/gpu/drm/bridge/panel.c                     |  3 +--
>  drivers/gpu/drm/bridge/parade-ps8640.c             |  2 +-
>  drivers/gpu/drm/bridge/samsung-dsim.c              |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  2 +-
>  drivers/gpu/drm/bridge/tc358762.c                  |  3 ++-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c               |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  2 +-
>  drivers/gpu/drm/drm_bridge.c                       | 16 +++-------------
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                | 14 +++++++-------
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |  5 ++---
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |  2 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |  2 +-
>  include/drm/drm_bridge.h                           |  2 +-
>  20 files changed, 32 insertions(+), 46 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
