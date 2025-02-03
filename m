Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381CB20A5C2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598200; cv=none; b=gde1qEVh3YDp/LSUQ9jL5m2u47eVscqfewNNngB3tAGPtYKwec7mUFfh3Vw/vka3y2i8Rn6+CNqDjV9Rc15oZHYpdAZugd0qal6Bwjzi4pbSFX5lpDz5z5xogQYacmMABPhH0aRfWJuchRiGhkYYtutROpQFtKksZocndFkT904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598200; c=relaxed/simple;
	bh=I6rSF3OmEBlc0hI6fkaomscsvVbmUsuMkJ0IXitAoDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p39CIAxLuhCx9v9iGEdh7Cw/eoBxutQImy+T92NrSpuTxBxTPnSIMjwgPclu1rB9VM43D0bMQgPOMNzZabQz6gF9dFEc/zgUtEBF9nXMWTwEADp8g4gCjw/LpQZKTYTti1+rsnV65TG2SF26C3ZHhwVIkPPdHIAIV0X1WMhWGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uIujRaaZ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uIujRaaZ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54298ec925bso5245228e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738598195; x=1739202995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ufx9LndyQ+Q8Y+4pq9rBmtvxrTRSiMJivVKQTd2MhM=;
        b=uIujRaaZRYJPaMrC54IMH3gxVzKsQbjGBCTeKHs2Q3jGlF8Ib1JmipSWHpyktmhgGS
         eWFWwgmSVA1fnJVF6oaXaI9+lN/56FiCRfwEenls90eThbv0pQWIZoT1UMmDcCdEFPWN
         4zeUo5Q3qGecNiSM2LV5CQ6uCIhzMrE4qPR7E8st9vwg8dMU/qLe+x6ATpgGwYq7Y87a
         vKXj93vQcj9t8hy/uB5wQBqhJQX3Hc45hqQ5sfQAo8oAHLHP5XGbXwXhTsUbRpqi/Oo8
         jVVcIyLGGmf1Wvm8S9cE/PHuqX+EpzIZi7/r7kRaIBvFo18a9aw3gsrpKN2HsLjYJZ4+
         ywoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598195; x=1739202995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ufx9LndyQ+Q8Y+4pq9rBmtvxrTRSiMJivVKQTd2MhM=;
        b=LfjCaLh6/YKhYBhIzqwfqi5MAb5y2NZudWth+YAy3IImflZALr8GMTGay+7XTbNAls
         s0A21bmgBvkptEX9p6kvfNSNXG8x+lM6Wx3nC0M5wasMM6UNZdQsxnh+jp/lHhDpwlAo
         mSgTkmLwi5mzJcVBGTmCAKiY9ul8p7lKx1ts2cnqiL83Hj6ZbkM1XGx/X9EO2B+g1OpT
         EVAzqMB7elw3QpqVu8KQWXlgGaN793YZNCZd4hz54fOBYw3CwK6dxanrnClVe6Y8Uv5Y
         ZEqJ/erStj/wwwNYLPqJMRIVYowRfGtnzQob3TH6Kz2lBg52T13c7NjVBB3yX7VPGe2T
         lSpw==
X-Forwarded-Encrypted: i=1; AJvYcCXurljQ0S+SlFobt7/tdoLMjA8FGP0IkxwT1gF1kZdkSVwMOflQXtNeAJLql3n4G2dpr4rJz6Jm2av6SJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJBeVrV5HLtwlDoFahqLwZFTLaJduQl32PpGFqvkOdup6UU/2j
	mbLbU816NoSUcEwPMzgc48bgCjQhFsBU+gQ8ARNJrAACq9tJ3839T63Ic6tTSNw=
X-Gm-Gg: ASbGncsoyxtOtR5Kq36ft39k/kCbUU02dvaddHrwAlTmmAoxS8sQluWZsi0U6a1iQD8
	qFMvmnA/KLZf/szYOQhd2nSIERNNdZLfPj1XJ9xDP2mmF7ji93RqsyKl+N09U0wcQZU06jBE1Xl
	R/h33hMPoRQxzfMZunZ8sstRBkK3ksFbbW7I9IHDVD56eV+9EWHTqnNJvc2byym24y/LnYfK7lR
	G2hjdmoB7eWc7gdP/f/N9p1PjCIGLvAVeoriR5mf9eeJrAZIR+C/doZMnnHJTbCcMqfooqw6bxC
	+z6DDESs7xAIbhuNbDmFjXIec91yk68jvm5muuGvnF45wev7gnUjFAHjK4yAyPAtLTLjS0Y=
X-Google-Smtp-Source: AGHT+IFT9JYuit2k0e9HSaZLgvpA0Li63Lnd/rY7xCOAkHWEzZCyLSO/loAyRrahXsnWpzZ++/uVIQ==
X-Received: by 2002:a05:6512:33c9:b0:542:29b6:9c27 with SMTP id 2adb3069b0e04-543e4c3fd62mr7381291e87.51.1738598195122;
        Mon, 03 Feb 2025 07:56:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb071csm1327031e87.134.2025.02.03.07.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:56:34 -0800 (PST)
Date: Mon, 3 Feb 2025 17:56:33 +0200
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
Subject: Re: [PATCH v4 2/4] drm/atomic-helper: Introduce
 drm_atomic_helper_reset_crtc()
Message-ID: <76stqnzkm5itcoavv4vl7hbjiiujtenov3qaigdikxqjsuyif4@jhanrdhw5jly>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
 <20250203145824.155869-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203145824.155869-3-herve.codina@bootlin.com>

On Mon, Feb 03, 2025 at 03:58:21PM +0100, Herve Codina wrote:
> drm_atomic_helper_reset_crtc() allows to reset the CRTC active outputs.
> 
> This resets all active components available between the CRTC and
> connectors.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
>  include/drm/drm_atomic_helper.h     |  2 ++
>  2 files changed, 43 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
