Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471725A65E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 02:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738723995; cv=none; b=JC8kb8hmrMTY1T4PrASn3z178XQQLwvwy8oUtf6w+kvXmPcAlckXMs579Nr6KyGf0bSj/+3UDhz1Oz0tFMFzj86tDVFuMgXgg1R/77xhk2QhqRkRPsrhyqw6YGi4SGANOiVhZ+VMGtbv4VlRt+6Nsz1LG1W74+DEVsC8RREenH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738723995; c=relaxed/simple;
	bh=rU+9dOITFvQrvlaa/ZjH6yN1AlHvbn3Nk5uGkgnSq2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEMrPs4eULziiDu3dCji3Sz7bI9Fd8Vq22kDhamDJ1Ry8jzEsp5qQLMEm5EAdB+4Il/Q6ZU7S+9KqrrHlv6t6LPIb1Fw3mHklKjehyStqhcXyEyz2Q9bNYKZQv7g4iJoerHw8cyTeZebZMdcddWV+KjlrtnUbXo2RLtyKR5ao2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JbJp8uzp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JbJp8uzp"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53f757134cdso6536694e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 18:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738723991; x=1739328791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CJCxeQf3VyCaGV3Y2vA9kcx9yqwJL3rmHKrDp4Nke4g=;
        b=JbJp8uzpve1nHROG8OfOfB5V2FOMv13DsMlcPw36hl0qJDFwJhUNrQqI4clwK78u8u
         oUw+m0cvgYiCfIB+mF/tSBgMiYqMnaPf44kWlYKVMVhfRyjHhDiGEbCMVGPdDcWELZ/7
         Bs9MKJMSnTONMe5z+sZ+piuRwhF8WC7FfuMaZnS4+hwfOaiFtt8htsWBIdlmSfDyIj1T
         Xio2/PYyextwxykDz6PNFW1pYf/E4v6MWxCpfaLb7ZuYZk99flzqK2lBLcn0Z6/2UBbo
         TLjoM4vcO4NKBJrWFSLbwB17XaAi9i8xiUD9E6PHbv3fZtJOqnkujaxw0bq0KtkHR5te
         K9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738723991; x=1739328791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJCxeQf3VyCaGV3Y2vA9kcx9yqwJL3rmHKrDp4Nke4g=;
        b=NiDzx//0s5JZiIZb8JY06EqyM/3+kP7L2Q3CFcndSN8I4CxGHH48+51Ffz2D7ZPXws
         WIUgNOX5R391GYieu2GOShKlX8+ZKTXlkCm84nsmaoky7b8Sj7RUUbvCk1pB9/ybYmQf
         prE3qMfeS1BBCwtd3la2Ar1LIhC/jdwQaIPu5/NO5EWnxA45H43OOxfuAaXmDybIkzz1
         OPyVeIj977kQQEQhLdomFGm9ofpEiqv9bntr/1RW579tNJhk5SlHqeY2VwD+H246p6/x
         5ddo8KEo7yalvlgU4MyP+w523HoPkSMzTTzGFLOJpKhWkuTZTPDuzyf9kJLMfKIhDDbm
         rRgg==
X-Forwarded-Encrypted: i=1; AJvYcCXZryGeUPWoFJCokODjxtySXqWZfRvUuVafkRcAS/zd7iroHiCNtLeQCyaBUMm9o2+pBHoNCfQCn8gS79Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaU53WYV0CKp/FRdZ0tKrqoFjshgayl0rkHVTBFzhunar2qwzj
	iIEzhFNrIm5KNmSUC1Gw8UDtPHlCoagT8XVUjHi+9RT/P+TV4Z89Elv/e05FWvw=
X-Gm-Gg: ASbGncsvxyvZx4jZ1OM7CuSPx8KSr7mQXxZD1Y7BiOVAhbbehFZD5JmK6/N0Qw1RdJb
	hY27FhDzOspZhBMTVUM9FpAjE4+xGvG9PCJdCaJxrclPiLbgNpqU9L7Wl+OC21aDnwDY6ktDgkb
	MqWmhsRlIVpkyy1gm9SEVSy9//X1ixH5YTLoA82tKrHt9ogmh0o8MCbXuVwnhPTjzUcvYHlwjgJ
	x9N75fybekd7dskF2fP3+u9CZK+l5heeASroj0kNyDMQl3MfBatPMKG6eK/j6vk8dGQ29e9xtd/
	mgYZQFzRhuDkqJ1lMZtDay3Az6g/4Em7b6Jk3fYuSlYJlui9r/6zBN8JV5Fd6r+KGKQx0wg=
X-Google-Smtp-Source: AGHT+IHKbdkPoD4sLQRcYq98EifYY7LO/k/V7T3PEuc6tS1CgUEZ17hANIO0DvmUVzFJE0G3jLyJtA==
X-Received: by 2002:a05:6512:3ca8:b0:543:e0c9:1d97 with SMTP id 2adb3069b0e04-54405a1067emr296878e87.12.1738723991212;
        Tue, 04 Feb 2025 18:53:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0a8asm1737939e87.151.2025.02.04.18.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 18:53:09 -0800 (PST)
Date: Wed, 5 Feb 2025 04:53:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/35] drm/bridge: Pass full state to atomic_pre_enable
Message-ID: <bedgtbsqog4euxdxfskwdqqimribehtge3khh7rvebh2o2j7jx@xpbt62sg5faa>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-2-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-2-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:30PM +0100, Maxime Ripard wrote:
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_pre_enable hook prototype to
> pass it directly.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  6 ++----
>  drivers/gpu/drm/bridge/chipone-icn6211.c           |  2 +-
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  7 +++----
>  drivers/gpu/drm/bridge/ite-it6505.c                |  2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c            |  2 +-
>  drivers/gpu/drm/bridge/panel.c                     |  3 +--
>  drivers/gpu/drm/bridge/parade-ps8640.c             |  2 +-
>  drivers/gpu/drm/bridge/samsung-dsim.c              |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  2 +-
>  drivers/gpu/drm/bridge/tc358762.c                  |  3 ++-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c               |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  3 +--
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  2 +-
>  drivers/gpu/drm/drm_bridge.c                       | 15 +++------------
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |  3 +--
>  include/drm/drm_bridge.h                           |  2 +-
>  19 files changed, 25 insertions(+), 39 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
