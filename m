Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF7E4EB51
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738898517; cv=none; b=PnkvvpwDIaeUAfJwo6il6ZQwB1llfBAz6ne4Ah4qT4NpLDfAtVUoXcR5Mq+hTmVBHKOIjXw/vUdR2vhCcW0jJYzh10K3Mx3tKNEMjBWH2B5eEWfejlsKzXAtNJP2pzPnPiOWUDZEuELkKDRodsIGh/7UXpDVPuULQvF6xuuyBMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738898517; c=relaxed/simple;
	bh=F+28qg9YTaIwRBWA1n1GIKXKj6a+s8cz5r1jPqCjxT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A//f3Q/TQzxNe63gvnyPUsSNL2g1Mu7jWBUf78H4Lk6IiOzSBbVfnVFGaOwLX19jMQe5n6+o/0B1hRfUahsX2NxC1IS+DxWX96UCfiGWDgkMbw10q5kp/d69HpKWa96sG5SItJELghc/jnZebLqOXsPK/CyhN4CXOEDa+MCYlLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEIhVHEN; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEIhVHEN"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3086edccb4cso1052121fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 19:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738898513; x=1739503313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jwcmk7k9AC7czFUQf0n+C1hcOeDbMPV004qK25+fyvM=;
        b=cEIhVHENnUY3W3XVH89bHL+T+So2852eIgn53MnwcZK0weYP5m6UjBWqZHE3BqFz4K
         gWSMUoye3LFi1PEyXojZzkf1LQ+IBYfFDWNQu5lxU/NTSmkxjkyhK6DSh58s/CfUFk3r
         8a8RKjEVlZYwF72guFj3+6H3ty3Qi6M+5U+iFm7l4Wb2BUWvU0qz/GVBiH+4wb2K3h4V
         gtfU5QA+pmAdYwVV5PILkYnR51Pn0tM9RfRjGMFrmzrc1jEECc2KgQbGZcICkTbNY5iY
         FoUhy6ueF62p1ttLEqECt8UmQUE6maFYppz0jldrBs7igEHRGrflj8oWLnuztYYNF8W5
         EZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738898513; x=1739503313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwcmk7k9AC7czFUQf0n+C1hcOeDbMPV004qK25+fyvM=;
        b=P3x41GHfAu7+jgOmtnFFxPuO/XTGHtvcpvtB/adxbmChf0+RHDDFsVZ6H+YiVXNjtv
         ommnqsNnOu6Eyc+B8U1YdKPGqbQOsm1Ix7UCA7/ZSHdE/eTZtZ+DB5JJL2VHvDLXfGXV
         5tQmfvFprR1gtmVFrV+qs7tPiOgia973/lpXGM7LWmAINi6qpjugIyWb69W2g/2lIWQz
         YIBwgQbjmuVRtbECG4o+wIiwXNkdj0OCyR9t/n5z0h7oJpgcyf1aJrV8YM9GQgXAV0Gb
         a8HUdXjQYgGMB7XyVDu0SxUEOYBxvK4WqPLmWCAYzRE0+zDF2OhoYpwvfM5O5RTXQyrY
         DhZg==
X-Forwarded-Encrypted: i=1; AJvYcCVZnH+Rebeq5nJC41z7vnFdp1oTMeAfkOZJrcVJ8XEDDFrfJ/I1KkxD5QOZMjM1UuBMzZyEujTR0t0M2OY=@vger.kernel.org
X-Gm-Message-State: AOJu0YymMb7OrVFarSEyT7Npz+w7O/B2AV63WWQFSO9zimlP8hYwpJlt
	k8d2rGaphmt5cJsWImcV/IZ1h98nFJQ1VnmuHRvBtI+1a3tCBMRSfViK2EA/oZY=
X-Gm-Gg: ASbGncvSwOHeKMLPT5iKAv+GA4WyWsu6dOIiVU4j7+d2EX/uDysMi2BOfNKa2w16asp
	aP9Hgt33f1sHEoe4QiC6KddyyodpoKQ7HIT414QuQ6jR2iV9o4TCzlroQDKcKNmCWz8d4HEC4KW
	Dt4dQhssEdeXsPXcGwASiJxT6O3mshoVuGjj+BTEHBeUmTVul94QDGMA4hVWDuvS7XhvxiGHhIX
	nR1ZDBcZ3NxDieNCuBuKt+Yd/Fl+9/zgvO92Kvff1KPqpRgIvs931GwvOH09pPF5lPRNelGPMgb
	EJYNPaDe4ujan0kF2ljgEZcStbLHHEgx6iaU2AeajVfGCzwp9smA9XzP4/CUL2OWsd49zk4=
X-Google-Smtp-Source: AGHT+IGXPxYYkbFiwpsaOKJBOzOC8iwJk/HxhUGnU6Jn7j20z0rhZR/XSqLWFXE34k0c+Sb2YWRUKA==
X-Received: by 2002:a2e:bccb:0:b0:306:1524:20e with SMTP id 38308e7fff4ca-307e581946dmr5062581fa.18.1738898513349;
        Thu, 06 Feb 2025 19:21:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2b9c95sm2960931fa.82.2025.02.06.19.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 19:21:52 -0800 (PST)
Date: Fri, 7 Feb 2025 05:21:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] drm/bridge: minor cleanups
Message-ID: <zp2jw3plc26v3vm4d22jetolcxhmcsikadt33ecfi64t6rw6zx@u3mi35nxisdo>
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>

On Thu, Feb 06, 2025 at 06:02:32PM +0100, Luca Ceresoli wrote:
> This series removes some unnecessary #includes and and unused forward
> declarations, which I noticed while preparing a way more complex series
> (bridge hotplug). I decided to split these trivial patches to a separate
> series to limit the noise on the larger series.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Luca Ceresoli (8):
>       drm/panel: remove unnecessary forward declaration
>       drm/bridge: nxp-ptn3460: remove unused drm_panel.h include
>       drm/bridge: parade-ps8622: remove unused drm_panel.h include
>       drm/bridge: parade-ps8640: remove unused drm_panel.h include
>       drm/bridge: tc358762: remove unused drm_panel.h include, add drm_bridge.h
>       drm/bridge: tc358775: remove unused drm_panel.h include
>       drm/bridge: ti-sn65dsi83: remove unused drm_panel.h include
>       drm/bridge: ti-sn65dsi86: remove unused drm_panel.h include
> 
>  drivers/gpu/drm/bridge/nxp-ptn3460.c   | 1 -
>  drivers/gpu/drm/bridge/parade-ps8622.c | 1 -
>  drivers/gpu/drm/bridge/parade-ps8640.c | 1 -
>  drivers/gpu/drm/bridge/tc358762.c      | 2 +-
>  drivers/gpu/drm/bridge/tc358775.c      | 1 -
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c  | 1 -
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c  | 1 -
>  include/drm/drm_panel.h                | 1 -
>  8 files changed, 1 insertion(+), 8 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250206-drm-cleanups-b78703e04e9f
> 

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
