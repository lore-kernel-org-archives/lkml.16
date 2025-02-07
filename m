Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DCC148FF5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894026; cv=none; b=SHpBAWE6EDURpLZ7VXgz/opqdCagXqqtszuc8a+dgzxenUHFqzC1kXQawwIivRgduEV0jgvx7pVlSlV6UfifCnqRzb7UGsJ3CrkKKZSgbT1NgTmf4V5CXUNUjpHRy4xGZxumPd4LEhZY08goy18blnnP6QC96IEyG88jA+KypdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894026; c=relaxed/simple;
	bh=T88ScYXJqgxQSfLGWMZ4xmJDvZQgeWbChnGw2+KfG8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgkJi/TRrblzTea/6Fo0xw1z2tJla5tEuggnW5KHzgPnUzt5bvv17iOooD4rnBmpY+b9YTj4tuFTRHe6nmQgcxxkrxK8J94n/FlPeOLFh/M8kPJvvZJfJ47Tm9ybDfXanhAnWETDJyN8M+L9eU653ad69tQt23wI1HzndPUm578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KVorvurz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KVorvurz"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5440d5aae5cso1714562e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894023; x=1739498823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyDyLt0s4sxED3YeKSYF1hhjE6HeGLhhhc5RXgEX8Q4=;
        b=KVorvurzWQtCXvIiTFzjXCsZM0BuH9NAg0VKUxdlhAbkM4u00RLuhYsiz8t/aNJ7oc
         TYXXt5c29NLYiEtifoJG+pf0ImZsxurRpun4h1bKszS5K7+8Erzt0LAZBPN+jdoU8abV
         Jz514FSnwN5GBzqpif5RpD/zCo+4ASgiDiwl+8ivKEXW6yW+nx+xFfP8aT/a29Rj/gwC
         o2vxGWPav7B1bhs3k/mo8XaGnyVZ0mp4RvdF7iixIwW1QOEQfomBE3InXAJXT9v/hCVp
         B8Bx2UtHymiS+CVm/VBzq93J/xP7AVOD45AQ4jyqUkLMSXbtttgyvfW7hDFNl2O6rQP1
         8Q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894023; x=1739498823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyDyLt0s4sxED3YeKSYF1hhjE6HeGLhhhc5RXgEX8Q4=;
        b=Mz/bZ14uxTETTjk6PRt4BF74yx+fM+GDNCCwXB6DoEA4KTpZyDVnFG48F7SOLajCsC
         kQVBH6RjB/7R+aXSUQQ0Pyk65BORgG6CvOLxVfE9xnuF3ErZcS1lkoG6WRCgQ/VmqG7i
         HsLtf4i9QCBQhVVHWa3ZBABZ8kHmISXMZAAmoUI5cPmCvaNeEfrQJkoFa4WbupMK8TbY
         fwzMCOiGNJRrQDh82+UCA2P1QI0XISTo6ftjPflMCUW1suETNerxd4eZo4DwtmADMs2g
         fDpPW6xLCrW5UBjD+Vx3mW1GPgfo/dcUcPR1XiBCOFMwfUFWppw5+nr7LKbvDMi301x2
         WvdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfNtzhtziZ2JgUe1xxI2ywsqrZQCRmzSjIbLo7G2CeSGEcfpdE2YvYIJP/PpS3UR1/jxbHNdIOECrJPpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl0uqpzuRiXrDAbrj7QmXZmXM/XVvRHyO9/elyUGufnQ2No2xb
	YC/kUX32ohXfJozjvsUJvc+pNMy80psHygZ5WsxQE0gAFi4UEpgOgzmqisVG4YA=
X-Gm-Gg: ASbGncsO6DswahwRwuSsXV9QR4NX+vtigbyQP/eeFOIHbTKeLcJba6gJbCAcZgSM3i3
	nU0ly/9t3yF0MUMoxiXu4/Pv6bfp8+9fLtJ1A1uDQK8mhUhzWDIfDcsMXfwJoVB/m8aqnwFmAbT
	ezqrE8sE6nRrYjH1hlsbw59GZGqwgh9lbFi8S/8ly2Km8uS/0RTHGEfmYR0rj9N+xsIUawlcNU/
	oYu4vKZzUip/XVDyaNpntahF8r01owim4K/l5n2n76Qx0E6J+sfyNNOEmA1fNxS5qNK2ze1nENC
	kCsZ1wCmK+b6BGG5DwGQxVl3OUL6smJZW9hrzQQtKxSojxGy+dMDZwqYXwW9yIIWI6SsmZ4=
X-Google-Smtp-Source: AGHT+IFwAZ+OzzbukVZoC+RyK7oCA6hsn6G2MyRAFDLm/u//Zdyj+Li+eJOThMosTwozpZa/I5Wr7g==
X-Received: by 2002:a05:6512:2348:b0:542:28a9:dcb7 with SMTP id 2adb3069b0e04-54414ab6999mr282681e87.21.1738894022599;
        Thu, 06 Feb 2025 18:07:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ec09sm291476e87.5.2025.02.06.18.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:07:01 -0800 (PST)
Date: Fri, 7 Feb 2025 04:06:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 01/26] drm/debugfs: fix printk format for bridge index
Message-ID: <mubhj23fer6btbssvo7yqrst5c45kgqetsnh3kcsrrgqnqkg2j@dx5plvv75e5e>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-1-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-1-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:16PM +0100, Luca Ceresoli wrote:
> idx is an unsigned int, use %u for printk-style strings.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
