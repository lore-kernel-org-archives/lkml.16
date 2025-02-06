Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6955D1537AC
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812416; cv=none; b=pmTWiL0aWHum1oo0v5lqVTF2pzJApkIC3WMA9bJNlOf/DQPYu0Z+ownRhepXDTJM+yoxGvcFZTv6n1CfEY0IQ9ssqCoRijAqd+y6Y3ctQUG0+dTHzsrEAqh1K4cdfY+Cb7AjMiDoNqF6A2keyTBNgrU5WB0Acz+JcGvKEJe0emQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812416; c=relaxed/simple;
	bh=jpu9uDNeDBdC6VtS2p5oWuNJTeUlGlui3vXVeWRSCEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phGTrLNc1WTCT/ZQpa+4oW4Nr6cN30poIrxuCDVt5GTvFbzWF/9osER6xRU1uk2m/UnpDIb1irT0xLkCDvpYmPVcgrkxNpad3hvR9zm+5J9jaHRDi5vdWFhPPTgQgqZLFlqIHC8SlsE1W+OT1mruexFFvkSFh9fOWnYlnsgvWcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QzcUkAx2; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QzcUkAx2"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30613802a04so4764101fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738812410; x=1739417210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DdG5Jn1MW15Wn8u30uTGjRTJ9vbOt12LrxRPZobjB0=;
        b=QzcUkAx2wVwWMhRj0ORTFQvbPiZU0IQ/X8dW8XiG8irpktTCpMIO8ldLh8i9JYZRjJ
         34WhALQcO5gEyM+HQ4WrtN+wmCvtQ6CdQ6PPrZqrEnshA3PhYLxBPLtQXTRZGC2gznG3
         mnLt9ovYrE0Ha8v8dYUzl6+p0j3gXF2fbawkKB6vpQGJGRGlNxF48AbykON/J7aW6qzy
         8Z1L+KUJnQDI+kdKUOExMoXNh55huu5PimlzE6GyRW/Exxv8aFYBojUO5A5pAl8b6cCK
         XEalE3jnbrXHdwcR/itLmkpZwZDXiW1yY70VQV6yZ5yaIDbWMsBhLQZK/8wUCD9qm4Uz
         NLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738812410; x=1739417210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DdG5Jn1MW15Wn8u30uTGjRTJ9vbOt12LrxRPZobjB0=;
        b=VwNsv9+I3LrY99QvQp/5cuNXjhZsLndXpdFdbNrfpjuUImsQ4srR6IMdBB+D2oHpht
         OYT8HVhU0wWounbBmB0yxu8gZj050St2OywsI7xGEsc6jwn8ZZxV1jmf9//K62+UhCrr
         uX9EJ+EZMbPFJOUXdgCgKKIOsWzQlS0pmQ34m+vuwBzzHBq9pI38YhNMtyIM/ZCAvANA
         JSI4aaYmcrhrbTBuWSwu7b8BrU4JrD8G4v8xWG22cognxzYFnoGmDptlCrcJ5qM7BjRY
         wbCAfp/pTLe8PkbwqazRS8EPBJP0u9XTcfrcOxaiadzHZWW+/QdC1ZaOuDDEE+flr4u3
         I4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUuiJX7zVbODDDQGBMLi1fy2m32OR1TpsmFudSLx3Wnq+1rP5g4M/yrLPeOOCCWWsjHl9ApAGv/yErsW4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6AF6yiQvqvgTy+/vjJ13JlMY5I+fpPlbvRVorJpr+BQc6JS1S
	OQCoMQ8eWtDD9xB4Ws9OlPjo+0BM7k4HaKHZ99sxVzQbw/NB31o7prfSZoHoViw=
X-Gm-Gg: ASbGncuwBwwILObDBSIt+VFjvRZaqyGWQgfAmqbHHub34c/Hn+bRuteFoMa6irwv4dG
	azxvP8wJUJJHIstfbXah/eEf0el8gm8riBNsv4ow7d07toSeKwtvfRgjyyarE/R4C+37qNtvyaf
	I1LRbqva1YuqL7E6a4Xai5Nv3cKrL2G2tfSf+z8Ynids+O+gYCkr5NRwNu8rfm4qcgb/W2GH5xm
	x+5vgMWpzNSSs5t06I1vNwE8CTqGPrEWx56flqYyXsGpDOOmhNkWF71mr6cc+qZre5UK6Ror457
	NDDloM1wMKJP2tlTsXxYZm1ZvARy811hN6R4hf2NMkoQwRzhWeAxBSeGh19im7DKVm7i9LQ=
X-Google-Smtp-Source: AGHT+IHW1jb3KW8x6tt/qBgkvjmxR3wnyBKxeKsQxRREB62A0u+WNaONlVtge6tXCMFRwKna1G8X8A==
X-Received: by 2002:a2e:a54f:0:b0:300:33b1:f0e1 with SMTP id 38308e7fff4ca-307cf23dbd9mr17475791fa.0.1738812410424;
        Wed, 05 Feb 2025 19:26:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1c797csm236761fa.63.2025.02.05.19.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:26:49 -0800 (PST)
Date: Thu, 6 Feb 2025 05:26:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v5 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <lnsv5o2uln3bvwryxybx7xb4w3j4e3rr2h5inj7t6cat5zord5@lgohn6yrygrt>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-2-4e4ec979bbf2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-adpdrm-v5-2-4e4ec979bbf2@gmail.com>

On Wed, Feb 05, 2025 at 11:10:51PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This display controller is present on M-series chips and is used
> to drive the touchbar display.
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig        |   2 +
>  drivers/gpu/drm/Makefile       |   1 +
>  drivers/gpu/drm/adp/Kconfig    |  17 ++
>  drivers/gpu/drm/adp/Makefile   |   5 +
>  drivers/gpu/drm/adp/adp-mipi.c | 276 ++++++++++++++++++
>  drivers/gpu/drm/adp/adp_drv.c  | 617 +++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 918 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
