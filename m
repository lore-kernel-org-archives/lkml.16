Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32B20A5C3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598213; cv=none; b=sXs2uE+Re+IV789jJiZzq4ow13CBQFeX+mc9HzopSKM0ExCehehRyym0UVMngdMUVpxgYHhRXSfh0e8taPUnuaK7TWErDV/GlZWAFARtysC2745OR2rFD538iemCSMnQRIMB4suAreMIHvfCrsGAuxr9sCT7XMjZYZrqRHMDDQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598213; c=relaxed/simple;
	bh=sXfqWlwbcujmw1i93Pe17OOd8xLt9XzHJjEUzliQeOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByFH67vzg5M3YmtkH7oltbO42g5diKm7I0SoDW2fLB1bIuLCbm2GrDVZJvTtFNVRoeLEJQJ9rgkVIU3CKL9E6bwxonxgU4zqIhXnhndEdvIJi9ThWelWgp2E/hpnQc0CYmdDYlu8h3r0cph+rwVcHsjHWZEdqKc2Cf5+ReOjq5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S1JxrfM0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S1JxrfM0"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401c68b89eso4190548e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738598209; x=1739203009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuPn9eD2+NZOGE/JtJyvNpoPT7dTMzCQ+q+2GtUzeK0=;
        b=S1JxrfM0v0G8hrKeCjKTCMBHw03ur2dIvKYKxkMychNvFC3AKZY6y8iUX529AgukQm
         HDlkV9bogJPxbXyrHa6Vqy1/ZDENnhsxNalBC2hi8aQ3bSZpFwFSFWV52hZ4y+cS4bpN
         O+aPwggTSL4VD7D+Tg1C6ihRtZCUf8+s2oTCi6/JtMr8Uh6SaFjFLoq69FhE6JiiVjzV
         wrGKqXcrJXYXPzKagtwx+Lsk24/wdCJo3pxX4vAT6P3JWENzr2SEguvRZHrTw/hTnDnn
         SyaIES8YXGdGOh+PzEg+8Xbj2l2eGgRGNmrHoEiSDiVrDs+NbWs46NN7uEgFHXLpdhBL
         2hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598209; x=1739203009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuPn9eD2+NZOGE/JtJyvNpoPT7dTMzCQ+q+2GtUzeK0=;
        b=TnKxRJu2ICNWDz3ShCjsORyXQxhNjhDMqBojpPjTi0ncK27+6NxwfwhGH4u8yc9jax
         zs/RUe7JSj/fhtMPHTFZNwAAbs60LZulZNBXljpjD5K26nY3ZKH/1I0tzFQpFt2Wwogx
         qh79Logx2vJ/uy3s8fFXqnnf3BhNawYAb9kqjFY8FZd5ydJW7bCag4Mg9PtTf6rKHdtC
         DU1kDvxewWd+9UidA7g4R7DV++yW1UqzUGW6/uD9sf5X6GQijnWXTtEVdnnf3X+mezfZ
         LAgiiuUwudVlBBfCFEzMtF+Ecqwz9VkldQzKCw9yGEEvrwaUmFcwMtc8Ps5Wwcek2Aua
         D7NA==
X-Forwarded-Encrypted: i=1; AJvYcCVjzOznYmJppYHHUNgokawic2qsIbdxhANeITYSHxSnTsT3Sd5KHdPoNOe3NK4CJodrFHtm37SKPl+970Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhIhrH2OT2pTTPpSQkz7qxNageB83ki2mEH4Allj70JlTNf2nB
	IWiOeQ0A0zRFenrEVoAELX5t5fgzBWjB6gR6p0zIaumkJ5LlNh5WhXLz25qH9ZI=
X-Gm-Gg: ASbGncsDJKu2dY4YafwZLWmjINJP4sw1+TsGqDOyquYYB/m2jtiGhaBVm+epUpFTQmP
	no7fcA0vR4tqjxVeXOUut6nRHa4hqyKDc3EUD+OTa0kHrlyM0gx0cxJcJUjNhdbmRhJd3Mvmo0U
	dcQTN7w4qR0kjNQAINotR27HE3N/TkBwJrbEr2rTemXfWcBjDpf0/qpmzZe+fisTqeNJXbCK3tB
	0WUzUA4vGYVr1XLuvux1sEefpO7FiM+mRPt76LuD4hz9VZFAlr7dA+5aJTDgZhe4Sjp4QKzvqgG
	3SjygvA1QJ7K69c4iFY8H3EqkBjqed3KJSFdSdtKXR1HhsbXtUsJXJ2kyGUAQhUot5kKxPg=
X-Google-Smtp-Source: AGHT+IHSnoSCZLZHMn/lU1E0tDL4ALU9pDTSYGpNUSZmjEf9hrT7l0l/+rTZfGCvvt4GZkbgG33ukQ==
X-Received: by 2002:a05:6512:3e09:b0:543:9b0d:d388 with SMTP id 2adb3069b0e04-543f0f25369mr4615484e87.19.1738598209413;
        Mon, 03 Feb 2025 07:56:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb797fsm1333435e87.189.2025.02.03.07.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:56:49 -0800 (PST)
Date: Mon, 3 Feb 2025 17:56:46 +0200
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
Subject: Re: [PATCH v4 3/4] drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
Message-ID: <lu2crev4ikpn2tu6mizmvi4oorb7tbat2uxmcci3qekqi4ohqq@vfps25gpnurk>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
 <20250203145824.155869-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203145824.155869-4-herve.codina@bootlin.com>

On Mon, Feb 03, 2025 at 03:58:22PM +0100, Herve Codina wrote:
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
