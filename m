Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5402563
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739081899; cv=none; b=iNjewJ3QszR0TVlEItnMju+XXJl6zZXKtLKNu+BnsiGqPIyjklvV/0TEbNVHu4YfR+nX+SXmfr6MQWi1km7mLVwQRT3LFN+DdBXh2n/DSm7vG8Zz6Y0Nj4ZWeFuQGlK4FkmhrUhHguswQnb3IS+WTk7UuqUpIFu5mn3dsuHCtUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739081899; c=relaxed/simple;
	bh=xk+5+3R2Pdrc1TYUUTglCKHCKWOPyiYNwuVcXnRrIxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtrXalgaNHaQ72BJIZGnOFpUYTU4kbS3ZzhLaVzcaTcw1l0UIyUHqW979z069FK12IjsbC7DJ3WphCyjyu8qx6JuxemfBwMWfJoYKmwnZQyyZAxOyGTAIzf3/k6iq5VESymA1Mlpk8OsVphLYsn1XtMb7QkZjVheSqE4W0kyRBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=prO7ZQX0; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="prO7ZQX0"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3072f8dc069so35533321fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 22:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739081894; x=1739686694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lE2oPH+NznWU+A7rTznQcQge7zD1TQE7PnYcq5zX9eI=;
        b=prO7ZQX0bl825EHFI7T+6pKggS8LWHrMNSfjQjLhl2GEsHIEoOdEZk7daDJbtJjbAs
         w0VYFLHZZxv2kaAE8gSj4lHvljumGP5rXFXNWqRLkvYHQX/MNUMHwQlLI+PjuIVDV4cH
         WlzR7qzPwShCMdJxtx4Kv45jYRwB6/DxfbH9/aEutSAQSb1Bmm3PH2+axVoTRmiCfh9g
         7ok5KqjxkzYK7oPkj9PLx05wSbBtziEdlXD36aa7XEi1nCM6PP0S7F02p+Oo2pkRlnv9
         kB23Yd/P4nERRj6d4QhiKzyMOHCTfX8BxJ4m7Fspbx9JYJGzg9GLlpfZahqsjHKk1368
         gCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739081894; x=1739686694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lE2oPH+NznWU+A7rTznQcQge7zD1TQE7PnYcq5zX9eI=;
        b=ps0ZbUBmsaZfgn6tQ0XrIhwrBY9fZp2qnlffeRCmcjqqq7r0BlOki0xEc2zv5Pg+CM
         CQqA/x24ayv0vo0tLcBVReTjNf59CBnWvKEu6q/eNsubBbVTAUQ4Q2f+YazfYRelWTXi
         JNVfuZsBhgh1q9CKLznc/zViQAcN7x2U0xv8vg5S4UCyouBqpjzxloq6QdK8zW6kIViw
         Z676h+CLqNe7OZexNWDUXSrUm1MyXGIOgyOs8Y2e6nWFW4+hH8eRsKd/IS/FkBvZ5HLG
         kn1lhA64XlnwGtKmHZgYTliIJkavZ1Cj6stNvCZIhZlBUpkjvLHU6reknKzkPkh6O0B5
         YVzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPiXZahaSL6fb7PmQ/MGZoBZq1XF7RFstgfZrMs4agS386eCYoootygFMGO/OMyGDz4bLFHPFMmvWBYCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzurzFtJgiXtNb2sSP2EPai0nwnvyttjLT0nFALrMB6p0LELeWb
	CmjMk6TjuY6nV6r3cYCFWpnSosdgVQ5uvAGRqN3kcc23CiytBKPKF7lVkeIu7UY=
X-Gm-Gg: ASbGnctz5UmP13KyJ2sU38HdZNxPrkF/+wPdKSBroFtd4JmzKsqFKy8CAOHMxJHrxar
	n7zsdqw/ZiJVP2U+0zKoG2wh14rZ0NL+7cUdWzT5nlajMpGyo43PoV4OgpFtqIa9OQQ64yMov6U
	R8gXUVKftUaFztveOqVvCnLsxsioKFYOYXrX34rfYPivggi+Sx3IWKzVchxVc23ckBbJfFZqNxB
	E+gCIi9tADBU8bO7QGo8Qa9jPZDzVRLPFpbNooxZAxoFjVTH21EcmoHsNN5QmCjb0dLScZBVf06
	9DCuqCSiTHu+4PVQW+9y4I7TKz1SLipdzBJC1mmo0j6M0+St6iywTC8KpaDGsPt1yjF3na0=
X-Google-Smtp-Source: AGHT+IHgotXqPVdJ6aQX/zwyOsyj2WFgiPHoaaDkjyauV80cVRyVG+Oohw1MRE4f5iPbev+BKf+rdg==
X-Received: by 2002:a05:651c:555:b0:307:9555:dc5e with SMTP id 38308e7fff4ca-307e57cb001mr26580311fa.3.1739081894132;
        Sat, 08 Feb 2025 22:18:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2f511esm8864481fa.104.2025.02.08.22.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 22:18:12 -0800 (PST)
Date: Sun, 9 Feb 2025 08:18:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 29/35] drm/bridge: Assume that a bridge is atomic if
 it has atomic_reset
Message-ID: <stisurekwcm2jmh7qb5rm3nvh4us2oy2c26mhdvqf2nivoa4en@xs5m6rygbxkp>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-29-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-29-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:57PM +0100, Maxime Ripard wrote:
> A bridge is considered atomic-enabled if it has an atomic_check

I think this part of the explanation is a bit misleading. This code just
checks if there is a need to atomic_check() it.

> implementation. However, atomic_check is optional and thus a driver
> might very well not provide an implementation, and yet still be atomic.

I think the change is correct, but I'd rather suggest implementing
separate drm_bridge_has_atomic_state() helper and using it here and in
two other cases.

> 
> Switch to atomic_reset, which allocates the initial bridge state and is
> thus a better candidate.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index d7c17a26e86fd9a3e5a39f335edff4ffce30dd79..ad91a0ac375a9c8cf82834354ec7f654a59a7292 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -794,23 +794,25 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
>  
>  static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>  				   struct drm_crtc_state *crtc_state,
>  				   struct drm_connector_state *conn_state)
>  {
> -	if (bridge->funcs->atomic_check) {
> +	if (bridge->funcs->atomic_reset) {
>  		struct drm_bridge_state *bridge_state;
>  		int ret;
>  
>  		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
>  							       bridge);
>  		if (WARN_ON(!bridge_state))
>  			return -EINVAL;
>  
> -		ret = bridge->funcs->atomic_check(bridge, bridge_state,
> -						  crtc_state, conn_state);
> -		if (ret)
> -			return ret;
> +		if (bridge->funcs->atomic_check) {
> +			ret = bridge->funcs->atomic_check(bridge, bridge_state,
> +							  crtc_state, conn_state);
> +			if (ret)
> +				return ret;
> +		}
>  	} else if (bridge->funcs->mode_fixup) {
>  		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
>  					       &crtc_state->adjusted_mode))
>  			return -EINVAL;
>  	}
> 
> -- 
> 2.48.0
> 

-- 
With best wishes
Dmitry
