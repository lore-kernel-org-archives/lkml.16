Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF7339A8
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739084845; cv=none; b=I0kkN2amofg0ux42EIziMNMgdLlzhKVqWn+BjrTRS2YOcQTilQr1mwy0Uj0bZwQmjREwgtVuVR9M0hksj1/g0SZ5MzUKU6aIb8iiM7SxuPB3iO8gKS+LGPZVtJqiGZQy18ysVqgHVFWNOfyjXJLQnQHAm6/7DiaCc7FjtxbSx9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739084845; c=relaxed/simple;
	bh=gHmNUOtwYheXRdJpp9Qy+hAjxftqhdUIl3CPGImZQ6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG9wGrOc6YNhOOTPH5n1VSfNPS9+SDW0ogsjgY7tyddid2VJGBDK/aCMmxs29r3kJ7P2SoOFK2vnyH1JCuL/cp1iL+FLNBucrhRD7tJEefjmMgzcSNT3chEOkmOK7unaXMThv0X2wucu5jq5apP1LkMMa67r/KqS2xnuH81EOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JnWraNYh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JnWraNYh"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so3876068e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 23:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739084841; x=1739689641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHZAQrpjHEZtEYNS00KjVl0M/seQdBn5MlJtjVGzMmU=;
        b=JnWraNYhsXEikBJGdpyGJ2n/N2HjGQazTB4aeXXj/y7lz2AfatvsX/So2ELcmZCinC
         jGENm+c5tuot2sLxC9u3EMn2svsY0AGAXHi27TBHn42vwHMfavUJwtGNw/4DHLcPB+pi
         x9LLUJtyC++6OgYuxy3wV89RlYtjq+k4C9eO3XSQBdPIUuxaNRPIkeOlUr9U/y0PsLe+
         B+r4oZ8KrQinMXrsIH2+YYaBrC4GzjqG0BeVdhgtX+ptQprciLUbMtFyvQprndZ4sVKH
         glmU2cpiOyKNHbvgiNLMJ60ePFmg6TYXzlzuTesfG9RS8zcQnPqDdH7t9uO55g1lg0to
         rQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739084841; x=1739689641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHZAQrpjHEZtEYNS00KjVl0M/seQdBn5MlJtjVGzMmU=;
        b=PiOrEf77TwAS8s6csH8Rn8TdJskjc/C0gYra/eThvRARuccaGzZ5CnPK9dyhYGKx//
         Fjx7GCJ4T7LaJ6x0jvCQjHU1YjIAP22QQrvZIf+G8Q6DNleN7vLUiGv4yqkRavW4VRK6
         do2PDx+07xlnMqGKNYMcWIcicRLQXu7fiPxZ0bjPS0Ufv5boXNKpq+6YTK3oEgTHEH/V
         43gXgvMRe9WVkwy6WpIVs4QA4ZMR+vLa+UUT59+OdOfzp+Ivop2IIFK2XoXeB/AIbs+P
         7wQn9JY8vxJr/MB7x5NpnqY5PecRe8PmwnXJZi1X7/utROsOWm0YVDD+ratPpTPIt0H7
         KMzg==
X-Forwarded-Encrypted: i=1; AJvYcCU2fH67brqr+B7BwZWEnJesMmY15cQ3oi5fyIM6RKx/QI2hm0DY61bN20+0/azDmXpLopp9J8p/3B//1B8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3z2WNQvDf1wHXFmUDn6iFuG7/jjdkHW5Cg74ycNI9378aO1fU
	pussc3xmnHh2FtVOTAD0q+2zAwb7DC5b+lc4AHL1ptajmXDljsDnikjnizYRrIc=
X-Gm-Gg: ASbGncuJPcHWFWDwgys4eeuW+TNsacTyYImlz7032N2esxBqYGd1mpkBQMfLZRJqNay
	nxbbJotNmA9dE8jM8EVfTErPw/1cVzSYBnS6PmleS9hEQqmszfum5CfQOnzh7tV0KoLtcbNDV6g
	Ry7rYQ6j5ppCGAkbJ1UT1Jx6di671krZWAgYKMkiDAGqQNQRm+nIUNCkAwUylFuvNIGh/yMDqYj
	nliDY7BH2rUNff7lKSn5/4tHCp2U36g81CJ6OlLoCDCFpKqifSlLPCQdBvWnjBPVMhJJ9wrDCOC
	lFJYhIKPP7FT2K9IgQuLhvRyoxbmMAZK/eqKipXMhElyfnSpw27X1MeVwsUjxE5XkthQn9E=
X-Google-Smtp-Source: AGHT+IHURvdmo8Y832vNqtsKFMargNUdHATmLMGUU27oaMH1tsiKLFGe4aKRkUydJa5Pv3ZEX5tUsg==
X-Received: by 2002:a05:6512:1c7:b0:545:23a:d9ae with SMTP id 2adb3069b0e04-545023add6emr1464047e87.41.1739084841141;
        Sat, 08 Feb 2025 23:07:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450487ac88sm381133e87.247.2025.02.08.23.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 23:07:19 -0800 (PST)
Date: Sun, 9 Feb 2025 09:07:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 33/35] drm/bridge: tc358775: Switch to atomic commit
Message-ID: <nckkn6neo52g4kc66x6ikwkj7poj2pivyypdfucg6jshmey7nk@xem7bdybplze>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-33-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-33-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:58:01PM +0100, Maxime Ripard wrote:
> The tc358775 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.

Same comments as for the previous patch.

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 36 +++++++++++++++---------------------
>  1 file changed, 15 insertions(+), 21 deletions(-)
> 

-- 
With best wishes
Dmitry
