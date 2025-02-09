Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFD839FCE
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077711; cv=none; b=mn3zSanv6jZ5dwtZ8eaF8zpg1FsKPMSTuveJefNOSVCJHp7qc9yi5D6VFjsHnNiY7REbnW5JwC9JBw0zfIoyoI5Hi9gnIl5CF+r29a+DDGt97OB3B/XgFXR0syqdRDbqTKs12Gv9zKnWf0BMaLKduOyYy5DqmZl1bLZA8GRdcw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077711; c=relaxed/simple;
	bh=VzfVWb+rHaSeMQH1Uc+1K2bho8LVA5ocVT45p8DB9oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLU5SmJSaPZRjdDaK5KrzoqJyAeILcpwPejLhYMgdWowopRAlqENPpa7ME/NCSUzSmiNLu5ht3pEHU8MZhkNJfOJK/4GdbwsoGoP9UOPq+2ZpYXXKLEqQJJdKBzm9Y5aemvo+mqwIc1eyfhdPyW1Pkr8t1edlkicLKsvXN6RccI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OeYFirBf; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OeYFirBf"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-545064389d3so812634e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 21:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077708; x=1739682508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xxe6b3I5l+DMAomwokzE2boxLKYMF2Wz1rXmU/foweY=;
        b=OeYFirBf+sNhmlEoKxWL+Qr6zxrHcn7c/YwH6viXyTTB1CTTcRW761mMytjBGuRqmt
         FgdkVjhfUi6+5mKRa+4z/FuRWKjnuBqBS0m1jzU4EFo0ZWGBVVTNiteWPE/vLwrg/g3F
         c1++5HwlCcKqfcxuymkhjh1Xyq3W+hApZND2wL2p6QH5nO/T4PrR4sNB0OYk52FDJMG0
         iZXQMM4LA3eS/wobhqHgrV3DmxByJ8pDtpzUmzN+ETtYPjeGfkBUBPAN25K2LLCnsMU6
         lG3Oyeah5A04jNLbF/KhUw/C4OASwLy8MFymOFPe8jQGla0cwDd9MW5XQRFdn3nC8QOq
         NNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077708; x=1739682508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xxe6b3I5l+DMAomwokzE2boxLKYMF2Wz1rXmU/foweY=;
        b=UMiJWIWgxRZd90T9cvtnfHnC6HM9czjAk1DvCO/WDys3J63CFgl7yssBfee5XAndjq
         8cI1F/UVlkRgAcuHY7tsVopskJx996A7oIqlq6qwG76yuZ9ha48Qwax8O1Zeb0W2lfHF
         xzyI3gvI3NZxq5T09teTt6BiQBrmO8Lv6rzWVRyOebEHXn68CklpqRFvQgDEod31q70j
         MkpW5d0YsIg3M4y388od5AQe0NgF9ZoL8SqdKRt79gxf25lGmSAxqFC1hT9h5LAOPiFS
         3gYkiWJNBvjk1xSCVQ+srP4a+7y8tRWn9U3KYjL8AkUiXjp2uPdDTdVNC82GAASupaaS
         ohgg==
X-Forwarded-Encrypted: i=1; AJvYcCUvgHWZxJ+yfbiuYEke5FnP1R0A1HmGL6lk7TWK/Gx6REmtaX/kuti+V58wQRVJrBdNNaZzLrs20ZOufn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7kqdRX4p1BUiazmw5837sZ+ndgNzeB1r+P8TPTcYzERESCsl
	VUiHE6maraU+zlaLgO2xUOM+TznuRt0wo3ah1bSAQo4nvyU+c/opzMCXABwl2xU=
X-Gm-Gg: ASbGncvssonuJWwuEQw+c1wAvk0FNzcpakM1V0/gqh9O0GlAH0vhkM0fp0roJwq5u8o
	TiMgkFRTBChc2LLx8OxUCy+FdzR0y34NlmNjCqjveMGe5TqOhjg1nZlRoC+efQdzveRuHNMSUAG
	5VWE3yFYh92BWFDaWdaWW2uPKqEiIah13DD7w3GPpYjgGbuSx3fHJahNA6qJ1S5zYIkoh55l2jD
	w2KY338Kah9vV7PGR4P8pNL+ZVXew31uTVuQ09azIIJHj6DFd2gzGwwzLmcy57wg/VdMs9uRzVl
	buIravWAtnTMhUZkO9boJL0qN+D9lOmioZUB/6+ThaoIbPcFBnOy69joSmi+5B4MYiKHqVc=
X-Google-Smtp-Source: AGHT+IEXroy9c9pG6Ok2Lw1EWFli5Ioo0Vjplntbo9wbjLdEIs0OWoeOfoRcX2MaSHiH8TCvuS+kSA==
X-Received: by 2002:a05:6512:1192:b0:545:4f1:5bc6 with SMTP id 2adb3069b0e04-54504f15dafmr1309852e87.16.1739077707960;
        Sat, 08 Feb 2025 21:08:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544ffbc5827sm490054e87.227.2025.02.08.21.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:08:26 -0800 (PST)
Date: Sun, 9 Feb 2025 07:08:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_update_legacy_modeset_state()
Message-ID: <zrw62skvprwygmcde7d3sdjpwzgm72jjvr7njkyidtnwosviop@p63cqie2hdj3>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-14-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-14-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:42PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_update_legacy_modeset_state() updates all the legacy
> modeset pointers a connector, encoder or CRTC might have with the ones
> being setup by a given commit. It takes the drm_atomic_state being
> committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
