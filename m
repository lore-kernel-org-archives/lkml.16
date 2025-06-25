Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEC12D9EF3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876989; cv=none; b=AGocIJfvfnyQOD1FGbwX/q1r746shf+Id4sA5DIOQYICMcZ4uCYvmBUlIx9MN0u7h74ruEFuS7XYArP2sFms8YsuHCnI6mFfiClyXkK1iQV6CDlGu9gmeIKG+AdeNxFgU43XM5RB3D22rH9dJyMvMs6oD2JhuqHfTGjqiG7eaVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876989; c=relaxed/simple;
	bh=ciB7/R85e1TQ8jkGKcUD1PsVenjfp39+N7RW9Y6A5tU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e/r5cmDFR0/rq3jn6OM+LE25LisZhVbKbTjBiFY2MsTzXCL5vUGNloX2na9NZMLOHnp+jQiEvpStCgpZ/DHrCv2FJJk3dh0NAst6U8kG81CE020hM+VUFo4Bfd89Kq0Sce+Hb2/VPRzb8Z33pDutN4LBUyfEj+sfpwzLKS15yb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcCOo5gA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcCOo5gA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750876988; x=1782412988;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ciB7/R85e1TQ8jkGKcUD1PsVenjfp39+N7RW9Y6A5tU=;
  b=YcCOo5gAU0DlnRRQI7JmF/kLnRsxXWOkwCGlJ9l/jbGODa63j4to6yn6
   LaaEiBiMmASH5M+UjXggbiwRw7nDa1XfHMTA7nNL0l6kKJbam3ODKV5p2
   ArdNPtyG1wJ+idfflsXsP27zLPa6lFViv0px7CQ7ut6xrdX6EO+/19IUB
   er1WBcPfYOHlhrctMQcTRB3JcFm/kkYUYIf9mJ/eEjdxQjWbTU+8sI7Gm
   O5sfzm+HLPLgd7dTC6ckDeAaE2Jrw/IcVPHy4fOtppAF716h8N315KM1M
   obRJtVcaFkwvaJ4K+z8ndN1IKvyvb3KEK+5/4iS0FFwXgzUkwPTnW62+t
   w==;
X-CSE-ConnectionGUID: xqoMUpasRPWEeFe5nxWzTw==
X-CSE-MsgGUID: 2WpF15zbRqy2Xv/GCQU6BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="70731211"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="70731211"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 11:43:07 -0700
X-CSE-ConnectionGUID: weLn+vGWTOC9tknuCQnPkg==
X-CSE-MsgGUID: dasfE1ldTY+KCjYtdTgYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="189484709"
Received: from monicael-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 11:42:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 17/32] drm/i915/dsi: convert to the .attach_new op
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-17-e36bc258a7c5@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
 <20250625-drm-dsi-host-no-device-ptr-v1-17-e36bc258a7c5@bootlin.com>
Date: Wed, 25 Jun 2025 21:42:56 +0300
Message-ID: <30d63fee31a9fdb668da2377767e68315d6f9995@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 25 Jun 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> This op does not pass any pointer to the DSI device, so the DSI host driver
> cannot store it.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree you find suitable.

> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c | 4 ++--
>  drivers/gpu/drm/i915/display/vlv_dsi.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index aa566ad3f5cd72fb8f9440e2645da0047da222b1..ce5d7b77444d2ac7bc71aecc150d42e2dbb59e0f 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1780,7 +1780,7 @@ static const struct drm_connector_helper_funcs gen11_dsi_connector_helper_funcs
>  };
>  
>  static int gen11_dsi_host_attach(struct mipi_dsi_host *host,
> -				 struct mipi_dsi_device *dsi)
> +				 const struct mipi_dsi_bus_fmt *bus_fmt)
>  {
>  	return 0;
>  }
> @@ -1826,7 +1826,7 @@ static ssize_t gen11_dsi_host_transfer(struct mipi_dsi_host *host,
>  }
>  
>  static const struct mipi_dsi_host_ops gen11_dsi_host_ops = {
> -	.attach = gen11_dsi_host_attach,
> +	.attach_new = gen11_dsi_host_attach,
>  	.detach = gen11_dsi_host_detach,
>  	.transfer = gen11_dsi_host_transfer,
>  };
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 346737f15fa93264ab8791912cc4cc128f2f3324..5f73919c4bb626f8c293e383479ce393869e47d4 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -199,7 +199,7 @@ static ssize_t intel_dsi_host_transfer(struct mipi_dsi_host *host,
>  }
>  
>  static int intel_dsi_host_attach(struct mipi_dsi_host *host,
> -				 struct mipi_dsi_device *dsi)
> +				 const struct mipi_dsi_bus_fmt *bus_fmt)
>  {
>  	return 0;
>  }
> @@ -211,7 +211,7 @@ static int intel_dsi_host_detach(struct mipi_dsi_host *host,
>  }
>  
>  static const struct mipi_dsi_host_ops intel_dsi_host_ops = {
> -	.attach = intel_dsi_host_attach,
> +	.attach_new = intel_dsi_host_attach,
>  	.detach = intel_dsi_host_detach,
>  	.transfer = intel_dsi_host_transfer,
>  };

-- 
Jani Nikula, Intel
