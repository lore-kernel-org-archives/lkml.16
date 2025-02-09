Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E321348
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 02:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739069109; cv=none; b=nYMKFdWWb9UVPpNQNne4T1aiGygyPgmuZxXez4rRdm0ti5D36GM258xFyLFHfp3RLs0oqjD3ItdnM5joFFlTgrG9YBXmStUu50pJS/Yxk8OwMpFeO2iYHiKfIeHql9+bhOJjWChpGgVFe8rutrEqvtEKPWYEp6mZ1rfJvm9bsd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739069109; c=relaxed/simple;
	bh=m2VHEf92lKIN+NgNSFlwUaygKiKuK+4NGXJsFAASV0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2r9yOxhgAx+hyZMKhAz4FoLFDzEt0nwr5aRQM1OC6qeVXI6mcqS68/nghQLuFtPMUfm/pclvkFqQSE+GwA/9OFzhTCXaSpaPIJg3WbN+Zh+MCqRExfLYiTYzJ+ELfUeZRTydMVjYsWT3xRWTv/C1M+vhGm8lRIyqvoygLE3evs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hViThGQf; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hViThGQf"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5439e331cceso3807373e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 18:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739069106; x=1739673906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5E4Czvi+4b6NoImst1oTpYf2yNfwaBvKvGHOmPo0O/I=;
        b=hViThGQfBLPRrWWzTf7HyI2AFJ3Izp5JeRs4NZ8/ROZIMUqkJYmqe3pna8BfA7VxFR
         FlKTrcS9GZiu6SzBr3Fg5gDqK1tRsLAHCzAkTDM6LzHRf9EOQoVLWubybI8SO6VlBaGM
         kPz55jwAx9+VQjLtvWpI7ADqMFb3AfKwpzyvEt73vYFL5NeuI/1SrgNHHoYsaBBUDW7B
         Oew1clGwUecN+m00cb5nFwvuGGsNGruXb5vpna0R7YVFgT6qubBvosWKoO7/rfGfZeDL
         zhIsp5RqecBjxCj6RBFCVCNWEFjwjy/J6ApPUxh55dhLg38uiOd5srphF0/aq7PUyhkX
         h4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739069106; x=1739673906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5E4Czvi+4b6NoImst1oTpYf2yNfwaBvKvGHOmPo0O/I=;
        b=OS9nL1oNaUPOMXaTlcFsTtsOAJ+6NCf/UGshe36YBSjbXA2SYZAg/0PLWwvdkU0N46
         K5dxIlrRGN/FPEbjtuO3k0P4esuxdl5x/BPeoBSonRP2EvpKmFXAEpF1IiRGjYr5IPZn
         +hT5WLxu/87Nw5SJ399nj18tmS7pJrFRG3qPBcpqoTTeRwqZw2IwJtgLNLMmRnI7DFos
         qEWeNameWuKsHv5+yXXrpdtzjefT6i9KcLNgq5+DHpczGuN+8p0P38iNOd7EatEzX+7e
         xrmpFHalibY5x7Jiyk/kgm17O177luNqRRNS0JouJj3WIRD0JX1jsERIYZirDf+UCXxZ
         okZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+yWqNtHz1FAdRjt6AbB+qo4cd2o79D9xvPv4tRK+xnN+1J1QW0hmreJYBEJuoEG7nRfvQ/nAP1XPLyAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCePyPHTAeE7S1nLqTjd9wgDTvo9c1N5nntmGZFWqHJtfLwNfy
	p1iaXdI0isyvh0OXF5Pa4tgaKsbVHNypYZE0/zZaKBtearEEoxeKUmvQm4hvp6E=
X-Gm-Gg: ASbGncvgFlrlGYZkCXZQYxKc1oZc01SucBzOSBS8FWJY1Ay5MIUZ4T/Qk65zAttX0gd
	O6fkYVInhYR/fjRw3W19ZtQkZ0Am2XxjNSkWT2xww2OQJD4hL7rMVH2Ycz4E/xSnsS5q6dVOLl8
	pTCV2lEi6U2KzOfmO2yNLMwDNnNLSpahU6Hl1vFthXeNSx+COod77OJXOGZMK/glNRZX5u5x31L
	gAOHCmCrVVjJrSs8cULQvoUftGaMIJRWxaJLvhSBK5kyhVznW+KClWZEebchy39Pg5A5sjuswBy
	WQrCBdBLNwAq4O9bKEvwtQavoedEXKuOAP47PxYiTiZxaAZAtrsGNOQS5syy938z+ikD3E0=
X-Google-Smtp-Source: AGHT+IHKVEnB/heAWEX5K5PYOtO1674PmCFwQZHj2jVxqeg1oJK7o9e3PbDB8ap5M6kBjp7L17/uSw==
X-Received: by 2002:ac2:4a75:0:b0:545:9e:bed5 with SMTP id 2adb3069b0e04-545009ebf32mr1663142e87.47.1739069105957;
        Sat, 08 Feb 2025 18:45:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54505438d10sm309219e87.147.2025.02.08.18.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 18:45:04 -0800 (PST)
Date: Sun, 9 Feb 2025 04:45:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/35] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_disable()
Message-ID: <6vlxq3hwlq6dnslg5c2mzorvoiz2r5hq3abzytflv5rbj2lima@vx6mrw3ggd4h>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-12-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-12-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:40PM +0100, Maxime Ripard wrote:
> drm_atomic_bridge_chain_disable() disables all bridges affected by a new
> commit. It takes the drm_atomic_state being committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
