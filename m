Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2372339A8
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739084491; cv=none; b=OasDLprKeecR3ZSd5y6ZGCtDlzchMpQGXkcJHGdFJ5Xt9UN65/kHW8FZHoaWI76EB9bsjSMQGlm27G/XwIeqGRV9nZhX6kkDq74qVZOBIBKQrwgiAfrLVyW8yYWcXnfJvIOAbEYLHyQzL0RStGn6oSYJbvO1VRsealE3Zs0eQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739084491; c=relaxed/simple;
	bh=9i0EIslvB4FdgPva+JCxYuPLcI1pgTEyCfQnbnzxksM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDc/KSaYbzePFRCNcV6Hl1uP9DGMsMCquierZAYrmPZ2/hYIuY39nVy/rYgz86EbIoAq+pTMjj+XH2cLwEhhZxEpEAqh5dTcYo4bj8m1fU5sCcgs3pAbAJtwtuwrvBHAit0StuXuYRiLthFBW9WVFRYyvPTgMvooZ8z0P5DnCSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/xvMOgm; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/xvMOgm"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30227c56b11so35963501fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 23:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739084488; x=1739689288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iq4qRSJV5uULnfmrLvFv7xZxubtH0jGdLt8QWyGqzOA=;
        b=h/xvMOgm87hjukFA+mJCavJRX8dGvEwp5PqmHhzVkVMbStvulShZMC2YvNbe1VkOe1
         2AyevOwOi8NZNBfaE2CyUvScQOJTxPAFP0Osgxk5ktiZiu0G3JpzNLR1sAo6rPMRvcEa
         dRRfUnaJqC4bwL52dDHkyNdqWI0hOYQIWyzEaP6zhz+Lg3VjMSeqo2DGchdcuVLFMlLn
         Mm2J9iby+YDykoyA87SYZc+zuxZnl+3nGHfcsXBbGYE9DDaTcGEEDC70lpUM12MrWz4G
         1G07TMAVhNHEInba/j/hPx3wv/TfuWRx6PSqqp+XyN7nA8rRTIHMFN4qJwHSs2zgCD57
         6hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739084488; x=1739689288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iq4qRSJV5uULnfmrLvFv7xZxubtH0jGdLt8QWyGqzOA=;
        b=QXTe/FeKSTKAI+XUK0YwHIu24ER/WkyoIfq9tQeZoWheWRAYfbSvivjJHxtNyVpPr2
         xrBUjQ58enMD4xW9MpOe5HkHbZF9+utpDhSmz6mOTgtmyKWRKJE7JXCbPFUS93W1iAlV
         4am9qz3ZsYbpezClwYFpg31VLMWVnP4HrjPCogZ8W9p3A0pEVG0fd6jlX7PPaA/qBhCc
         U+RRALnRui4xLWkQXdFZHKuTQf5EgAb4PI18gicX2Zr8zMkwC5osPP2awc7gVGeda6MA
         fHQO66E+d/fBoZuC1tzDF1+Y08UMGYVzuaZF/1v4Dse3WVx2VSz5sMrFVhZTAY4Rg5RE
         blQA==
X-Forwarded-Encrypted: i=1; AJvYcCU1uhsX0J6e5uMDmkMKyeRrIKHLxKEy7LtJmjcDO7J2eYjhWowmAyExCXACDTB68R/smQ6xdxRt0ZUhjvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhKWNNQ2/vpMypDNk5EB2l9GFGL1WMigI/KbCFBCmc025Xlfn1
	TdZoRWE6NTK/Vq5TTZ0MpBsS68f61VOWaeag4IzEkqRhnU7qlFGJoM6sdil8sSM=
X-Gm-Gg: ASbGncvLF+tPW8q6iYDi0Vyyo+8PjaOHXLAhaDhF2QATmxBNahXJLFeILZnbstkpY1t
	pIxszCmav8592eveVyAJJyW6996+fMMI+PxVjRXSMO2ThbMmR7MdVfSYtdyM29wpYTutjFROHnv
	Yy2888ElaRMmQIR/vdWfp8wzWHYaCuPT5sh0MryVHvJHzAzAdPGh5TCNShV2m4mBCFEmTrK+4+2
	OCOVo8xpXUhISLi1Ax7e++mtQU7jXDKE4eb2jL5RmIg/O3uXIEBSmTqYZhkiwCMYYYD56ozsOwL
	FYVtGc3FjexXQZ4G4UVycSuJqPTtu3lFAZyLKP51UU0PoaMJaHo57QCamMixYapXHv0RVLs=
X-Google-Smtp-Source: AGHT+IE2JdpPRXE6BXPYqP41DnyeGkbzBX1fLmBvKaoIaPeVfLE7uZzzI3vSGU6XnQBVtX+HCEBANw==
X-Received: by 2002:a05:651c:2112:b0:300:2c9f:ac51 with SMTP id 38308e7fff4ca-307e57cf74dmr29182731fa.2.1739084487750;
        Sat, 08 Feb 2025 23:01:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308dd1c0ea2sm4365671fa.61.2025.02.08.23.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 23:01:26 -0800 (PST)
Date: Sun, 9 Feb 2025 09:01:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 31/35] drm/bridge: Make encoder pointer deprecated
Message-ID: <esxj7jknjhrdlio3gl3s6ec7h3ralblni5mwwc4s4krpqp35xm@n3t6i2bdvhjv>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-31-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-31-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:59PM +0100, Maxime Ripard wrote:
> Other entities (drm_connector.crtc, drm_encoder.crtc, etc.) have
> pointer to other currently bound entities. They are all considered
> relevant only for non-atomic drivers, and generally perceived as
> deprecated in favour of the equivalent pointers in the atomic states.
> 
> It used to be useful because we didn't have alternatives, but now that
> we do, let's make sure it's done for drm_bridge.encoder too.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_bridge.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
