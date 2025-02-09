Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F08831
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739081578; cv=none; b=pbylxstuXoUSZTdNOtl5rBxgHbq8oTtam1gOgHQlG5PutzZg+xIk3I52nCx4/gk6OJluWrorlzDJycPUrC1FIXqVyakQx4FwQtheechnEmQy8CPqixdbofSY6aXrXY4MSpJygw4GSeoxr4GCmzvXTjC1f0ZdxGNhKgAq2GUblSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739081578; c=relaxed/simple;
	bh=jPuVcK9BYPHBx7oFFG1INuxE1BeDwHKdKfZWF/JbVsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOlhze11Hw8qBvpEPvRa4athq+yvdAxC0SX6iEa+2eRbA7Cv+KL8hCMkxvuZJMw2lxF2K4wGhXoGDppJWWY5VoujJIMWXOlfTxnYXX8B8h9+UVho/NzzmPj281b1+1YjeUDAf0AHX0B6CoV4atRFWCOxk/lsTzwQRLdDmJ+9zrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S6bepTLf; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S6bepTLf"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-307d9a13782so28919621fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 22:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739081575; x=1739686375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Fe0VF3HeXgNvgWt109zmaR5H6W57xLfEvBY6YhhqTM=;
        b=S6bepTLfvUDYKAI8Z8S1UXLNdGgRn6m6HdC2XXaZNER5uz0DCOn5cB0N4WTIVCIfIJ
         p5FtC4ATbHc7UsGZsvD5DHWhZMniPSRNFDcyEz2bx7NkHeSotVOFAg6kClVc1lNU2Xq+
         M2d3axbQVT+ghBLmTx9VBumOJFV6qBTtHpeGkPIf1m7WG+Zw89G6SE/ZsH+CcJbmv3rQ
         O2Tb2o+jx5zjbM2kG/90nESZlbbHuRGsQK93u0xEjUgwqEW+Q3cragjtteZ4UnCLJZRC
         dMR6m6LWlIB/nTxb07kM9BiP6WGiUthNTw/tyjAkK8TdIZxi9jcPa2/zOKcV4PcS0YJQ
         bT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739081575; x=1739686375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Fe0VF3HeXgNvgWt109zmaR5H6W57xLfEvBY6YhhqTM=;
        b=GCiaossdLOr9c+m5MhwAuVZYYb9Cqi5+ibA78rmDhPTDUW5jng/GsUzwo0SkT4q6MW
         zwdJ0w65SgGdwbuWTIlurq8mUxGAixfz46s7qkjcHrGJ0wF9FNZmvrzb8ZM3MOYe7oOY
         xWOosxYBhlxNpMM+LgyfQAjuUY0aZRPAnLmvXCziRY64xGXFp4YnfoiE1x3XNsv4dY7r
         X86KI2mxKrhHVpjPSkUR5xquBQoQHiLJ7pDwbjJab80WUf2u38TVtzUro1n9dRH3sp3b
         nQa+y3GBN8HQZHalKB7Q9SPlYYCrXoq62ycNARBOwT7OkufrvlzUecOHemjdLRqI6CKn
         TCtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg0nG07eP6HhdaAt6jsSbIXar4HJt3mzHmYXh8bpTm00HTiN5ABeIvl/jVr/eMlWQ9LesXfQvMbMIrkeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YycOJvo/lT3RNjgv+E8thM/2o6CSThSO7dJh3YVXkFI0DQgqFpo
	WQr8kHr5PB6awFwczp8CKnMBZHylRKVDPxPhlCBIiY4GPoPkf2ijPTP2d3QxaBY=
X-Gm-Gg: ASbGncssnn19MibcW7vdJYJiQzTJHe6kWXNU04QuhQJhSFzeYXTdDJpSxG9P9eB3a1A
	t9N5MFWvtj6Wmgdu9wgOZYXfE+MP36HezbhEF0VAnWvWjSOao95/FwIFHIHxZf8Q339W1s/dza/
	kPQCk62nuMeJoy6UyPUZrFWOAQiQSHT1shrYkUJa93WJmO/dK/1E+DfU2qIot6P5cEMb2EFtFmf
	hq/sYiUi1dGPEjpp9FOaFHV8LyPc4ViyAqul8AEFYG+aKJNkgEZllD3hDgE6xfNzuUWiTcIG3Xk
	4W2qN82SOnzBi4cKgTlhlonQRbKAjOgKhAVMiESUtg6swaN8RH7WWZ2UxmjuWNxr3vU+V5M=
X-Google-Smtp-Source: AGHT+IG0zA2FKGk15ye6q/mCoGATdsQEyiqMtLOacPVHzVEYQoHiMNvdIJk/YGglXVnIXqv4CG72qA==
X-Received: by 2002:a2e:9a84:0:b0:308:e54d:618a with SMTP id 38308e7fff4ca-308e54d637cmr6866631fa.29.1739081574778;
        Sat, 08 Feb 2025 22:12:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308e80067fdsm1789901fa.25.2025.02.08.22.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 22:12:53 -0800 (PST)
Date: Sun, 9 Feb 2025 08:12:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 28/35] drm/bridge: Provide a helper to retrieve
 current bridge state
Message-ID: <ogbqg2nchpyctndxvsox7zfnvmarlztxvjtxf74xftvaswz73y@54smvncbpkbe>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-28-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-28-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:56PM +0100, Maxime Ripard wrote:
> The current bridge state is accessible from the drm_bridge structure,
> but since it's fairly indirect it's not easy to figure out.
> 
> Provide a helper to retrieve it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_bridge.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index cf7ab89e652a982510ae9df1f5972b9c6eb13cf2..7a3664770c3ab8634a69e953b37a30ac467139b3 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -955,10 +955,31 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  {
>  	return NULL;
>  }
>  #endif
>  
> +/**
> + * @drm_bridge_get_current_state() - Get the current bridge state
> + * @bridge: bridge object
> + *
> + * This function must be called with the modeset lock held.
> + *
> + * RETURNS:
> + *
> + * The current bridge state, or NULL if there is none.
> + */
> +static inline struct drm_bridge_state *
> +drm_bridge_get_current_state(struct drm_bridge *bridge)
> +{
> +	lockdep_assert_held(&bridge->base.lock.mutex.base);

Please use drm_modeset_lock_assert_held() instead.

> +
> +	if (!bridge)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(bridge->base.state);
> +}
> +
>  /**
>   * drm_bridge_get_next_bridge() - Get the next bridge in the chain
>   * @bridge: bridge object
>   *
>   * RETURNS:
> 
> -- 
> 2.48.0
> 

-- 
With best wishes
Dmitry
