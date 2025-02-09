Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622A760DCF
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077738; cv=none; b=ohgiubQpl1QJkJSvl2LL6F7mllwSk3T9Ib/VHmLD5brQpC+9ga5HjCBd566mk1cqBjSJm9EP4S5PntPbO8GXnRYvnF5cAZBtBkCzN0TjScA8GBben6fnG3usRw9/J8HYThF5BMGLaL0845ji76xSumtuEmnuBPrdDZTXKYPObkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077738; c=relaxed/simple;
	bh=2dbjisNq1px4HLYr++2o6G7P1JxvQHvZ/N21ljjsiuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVF5JPpPrl8BKm2gcxH5xYEBhrjnb2ZJ6+7RJvIW9QfjEUc5q2QOOqxX9ZBfABI4E8kXpd/77nQm8NVYwt8MrbJh8KmYEPy93pgBRmHcZX0+p9yqlCusKfCD1P8tH7ydtnJaBUaAfVNbuO/y0C4eUby0U5xmW/hRee4dhxT+yLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KGMws4Qg; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KGMws4Qg"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5450475df04so990384e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 21:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077734; x=1739682534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vniHDsW5ouehiZFIChgglHKHfbM7mAiZxppcXJq6G8=;
        b=KGMws4QgK5s4xeda+5b4N2UI+HOJ3JyffojgQjtjYk7m3nYv6x1UB2restx4SkdVV8
         kAhL/vFL3YE6pg9sMhxHIMeIpH1Q8kDeqI+ZftKJA5QUgf5iagzQBZe5x7hfuC7YAVyt
         l65rstjNxZQGFJDHWxvQKSO4PNqjDAFYwIxWr+DWvUACGHg0SrKp+65imM0LEbENjc+7
         2J49AYN/iGLNqfN9eHMNPdh5/jHZtFCF8q2QoXuyZ9kcfpf0h+c51NcfJKjJCwEJwpOL
         sbkYOO1XmsPyjoiX/0IJkqPujeqZy5smmB5yyCqN+VandUCsGfg6Kr4WGrXPCuyYB31z
         1qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077734; x=1739682534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vniHDsW5ouehiZFIChgglHKHfbM7mAiZxppcXJq6G8=;
        b=BLE0uJScSdmMyLYye9de6WA7W99mfmxLN+y4UILgQNI+jMVxCfBOMlGwnSUVeBoBdw
         /neXxpA9Q4CqZKbGkrbdkNf/S8H0lgMJ6azB/OdcN7FGUfIfUSrtzCwJpB1NmKUJzv2F
         KZaFIqtTTs+5RsvNc8yAQRZWlvIjG/NICCGEpJyrQs/wyG8lmnUDJSIbUc9y+b0uKMhO
         IybPuel7YGNPEEWIFEpwAxPeWVaOMavnTugJ26xR7rLiDuNPQrWOJG96Sin6hW9MSUIG
         kCbxaoeXJQuQ+a0J4W93oz3O7juSEHd/Gh3SOgOEiIPW4R2P7sFQSDIVBzmOk3nhoaIo
         H5xw==
X-Forwarded-Encrypted: i=1; AJvYcCVN/qxw1UlH67N6TCBgVHqw8SuujC3eR8a7v6rQlIRCFuyE2yYEYyNjEJzTWZqrCWgHtdGOH45o6ZcXn3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtl4W483bKvCOMsx/RLLnwB8jPaBp+o0zNXtniJYEeeXLT6duL
	J4ym1jnHxq2OJgCY6YmHkQhVBwjuQf0wrT20s2FhMFlUSa4ir4wPvx2nbDhSUoE=
X-Gm-Gg: ASbGncvVf7HlAesBr8dbxZybO80o9MbUsfP1C8FlhOXrcClzMCEdNNswP9LZefvcYa+
	efug3RR0ZMd5SWX9nSm8B/Xb8txDhecO6MORPJZqLnvaO5i/tyIxRygCK9Fx7ySjg1rNxCBIa3e
	pvlftjLxG1gHRnTd1rXmmwlU5A/15qtBjDWGM4WeLBM7JCnLKd87JVMRakF4OqqhDgr+ltE216f
	tbh3OWeQdZd7R+mCr5Bn/P4F9zZED+uAYCOW1j/dtlaBRMbFxum74+SAeFRDk4IgjU4fQs/iBNT
	bddd0BRR/nPZe6D53bOGeNUXUce/kTfaxDgmfhik2MTdcrQMIAhzJkMIlhiBf+oN/NtbDr0=
X-Google-Smtp-Source: AGHT+IHVtTFImXGcQGNiXcqSV5QKAI+VPsdj45bt7ErMQHkXPNBwx4FZnW9ojCpLADgLC2pvgJg7ew==
X-Received: by 2002:a05:6512:3052:b0:544:f67:f0d with SMTP id 2adb3069b0e04-54414a9ccd3mr2948081e87.17.1739077734590;
        Sat, 08 Feb 2025 21:08:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450bc4f792sm3386e87.175.2025.02.08.21.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:08:53 -0800 (PST)
Date: Sun, 9 Feb 2025 07:08:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 15/35] drm/atomic-helper: Change parameter name of
 crtc_set_mode()
Message-ID: <trz6g733whfel76xu2pd5jtjwsclvrrwfdonjukgx6qg2c4pt3@vlxu4q6x2q7d>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-15-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-15-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:43PM +0100, Maxime Ripard wrote:
> crtc_set_mode() deals with calling the modeset related hooks for CRTC,
> connectors and bridges if and when a new commit changes them. It takes
> the drm_atomic_state being committed as a parameter.
> 
> However, that parameter name is called as old_state, which is pretty
> confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
