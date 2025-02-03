Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DC820408E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603924; cv=none; b=OCRg9e92yYD0nXZjXQrU5ClnK3DahaRmFNFlSnuindGEXFaLf1bWo9+vMwwgoDPUre2zp9QljSbnmiWvsW0iM85sf1XPsLz8qHBvxTWrARdTcsyxT8FknZ2+gPtq2Ktyj+oi6RXgTVgXdvCTEp43Wrry+Nt9k787M3xkoxYY+Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603924; c=relaxed/simple;
	bh=eW+9sLogoJNS3MlfDW1hQ4aHnNCiXDjjBW6j/M1G7ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHLCNIXRPeysmz7Ysgw0A/5BOipZkar/WDVBtpEn28Ig1m3N7OeyHM3LZdmtS7bqRWcqMeIphI0cIcFEwdORDr1bCGxXuOJFOKhL9DwkgNM75ZyfIx2I0DnPE5KudpcPaWTtK7TCPL0W8JjgTBO6MMU1Zu0G9zTH71vBhpyrE68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UqhJau7g; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UqhJau7g"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540218726d5so4518466e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738603921; x=1739208721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GDUijl8uS2TQuu4uVYKfLNqBTHvBE5FjtYAu/OpsnPw=;
        b=UqhJau7gOnUjIjZazsyohPGQt+t+h6RIGpMe3lb/m6dnGxdl8D2H+C0pEeES0oX3nX
         hXmEtNu2r9AG6N5yGVCHvb5Zb9zUqc9AY/hkjqPhNn50xArEaF3T/hYYazQd73du3OjV
         GVOqKAAKBnK/GmSMxCWDy90c6b1OQRBTalYL1AwY5AKBN2ZxPgIF/o4MCq5GsGIYrlE3
         bEaO8wNonMqPu7C3UYUGrrKmML/nqEBr4kB1/jAcaLjro+yFPIE2AoGRSM0e8LViN4EP
         J4Vba3muXTdw5q6wAu9kKq0eO5lRB7au7M/g/Ap7mlSpsGFKJKc6JUUoAZ0c5pDayptA
         jJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603921; x=1739208721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDUijl8uS2TQuu4uVYKfLNqBTHvBE5FjtYAu/OpsnPw=;
        b=kfatMmWz95ChNrtfhfEZ6vZP9mePt7IjtYG2rxRlsywS5GQiASt8KsiQc/oAmZe94w
         c/J/B4faD1zouUaWIxetcG5Af8Mon0Kx9k+a+Nam90bKYA6htRpKSZlBB/P0Bjc0WILO
         BG7wxi/iiOguaQlfo0fTJYD5n2+PGHh9Bwq+lM5meupz/K4mVOcJwmi0ZO2FY5Y8oYz0
         Il0j1pQCSYw2IXUx68KUdXitL+QToE3L0QOHPyCCluHobTP15VkrzTM5S03wUa90um9I
         2EcfYWYW80kbZNNez3IGT4nAn3ApU1caI8dGGr9Ah/lLyrsFBCgxI4oO1k/M6iVLGDce
         gF/g==
X-Forwarded-Encrypted: i=1; AJvYcCUkRPBmu9xS5KA4qH3ZFxex6lRma5glRtQT4je5KCshxiKbAlW/yPZs03eHQWdtMaed5zyclqp7SgtimkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/8EiB5NSqiDzj7yMRGmDmhu2ILxeNyGIcFUtS7apvPXR/CAvh
	IW5rbwLDfoKavJQ292SCOkwRLT36y3a0JFuJQMleiLsht5gK6W0Md5kOtB8MhgU=
X-Gm-Gg: ASbGnctG254x34NQtRl7xtrsLgZQ/0xITsWDQYnReWxVtkCOeHbwOoHgZp+2vb06UJv
	gMQhyYTWFv/cUQlXGDdwXrJQhl3skehgUzmR65QLQ6/lR8Ggik9eZCLZDKW7VnJVaU+afzvIRpY
	pjheCT7ngMXKgk1hzjLvIn8s5WfP2CCZOw7OOzf/ReQcwk5UklXgSVQhLPHcka2W6GhN9fFAEMa
	nqSzlaftfKiO0mK6to+2Pnz/4CMDXODAt2+yrMqHaFOh27JWKZUWwdclDjT6oK/coO1FJIAQgwx
	Ew/+ODKAkqOrCNuR1wxGI/VJ+RUcGSZHYkrwHyXw+JKLmk3C83N9W54h7v69EDwOruQshL4=
X-Google-Smtp-Source: AGHT+IEb+YyAW/StovyfhGvTrplF4uSDM9l+hAFGlMM+ryuL+SzWuAvhltLr7IYW4VtZW5P8EU0Sug==
X-Received: by 2002:ac2:5142:0:b0:542:91a5:1d5c with SMTP id 2adb3069b0e04-543e4bdff1fmr5990527e87.8.1738603921128;
        Mon, 03 Feb 2025 09:32:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebeb49sm1356174e87.225.2025.02.03.09.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:31:59 -0800 (PST)
Date: Mon, 3 Feb 2025 19:31:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 3/4] drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
Message-ID: <75boqmmyd5hqpdluidnd72b6ygaxsharxtlxv5jmkgtehnmyuu@3udsy5y6s4hc>
References: <20250203161607.223731-1-herve.codina@bootlin.com>
 <20250203161607.223731-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203161607.223731-4-herve.codina@bootlin.com>

On Mon, Feb 03, 2025 at 05:16:05PM +0100, Herve Codina wrote:
> The current code uses a the reset_pipe() local function to reset the
> CRTC outputs.
> 
> drm_atomic_helper_reset_crtc() has been introduced recently and it
> performs exact same operations.
> 
> In order to avoid code duplication, use the new helper instead of the
> local function.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 30 +-----------------------------
>  1 file changed, 1 insertion(+), 29 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
