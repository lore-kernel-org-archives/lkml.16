Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B4F1C8621
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875947; cv=none; b=eiISGS/AlzxVDe2djQDsJEJfQ8KwgkeSGsJfisyuHw84grwRExLmT7POLssd+q/rgkO/9++txZXOSNDW1k3zu/30fLD5DG7tKyIKj4JWGYUUIIRUX0mqmE+4B3757WKDhomJRwd0McKTwEjKwvuC1tzVUuQuTFC/DQ3kDJ2yYpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875947; c=relaxed/simple;
	bh=+ovEJMwQI9UphFTKGSGoY9aAX+2mOC85y+RlQ5VlzLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fA9jBRPq8cWfJi4autdF13g/crrFBsOaRHp0qvTry9jCKmZpUKTfRmQp15ChKClXe6wgpaI5QVYMxr3VGvWHEs4fMng4N99ANArAPyHJ4DU+ilLQnyFAtx7JXp0CV6ZldDnXTmDbWuSaUTfrfEt/Yz+CQ38YYs9PGMP1d63cMU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TqA+ceJf; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TqA+ceJf"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234d366e5f2so2998875ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750875941; x=1751480741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhlQKvgXhBKkjEGOu4VGBmR9okHVz/Noc/QfUL7Lp3k=;
        b=TqA+ceJfhhJ0UJ01HPE9X7di/TnaVxiWtltpz9y8XBlznXmowJFHMilIbJ4F3lqJgj
         Q5GvgsmS6lJdTTUA3G2MixTRkUaaoOrarQhoEW8kTcFgKNJ/z0swaE+PavuyIaUekT3X
         rLiBCsSF9cwbRMgTrzrv6HhpVnhiApzj3AUMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750875941; x=1751480741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhlQKvgXhBKkjEGOu4VGBmR9okHVz/Noc/QfUL7Lp3k=;
        b=iqD2Vq5OCcEeozC2GFuvbE5aMI4VEBTwmnax4OnJ5s5swS1HZJOnrITAZb7JLFqbxy
         KQHCcexGoyiXzFRLGSULPsvmH6ApwEDfCjm1l7hYiT8phb2+gpFQfwG1mioKiK9ChEmq
         1oHcdS5fZz34eWLdBTVWH1WGDJnieJlGFv8PEIamiLmTnq192SH06Acd3SktKLhTeOf5
         W3pOHVSs01JvXLnhG62YRkv6gmRPPE/93B7KvEp20WIEsRUdyvoH82H3OQdS0opLbevG
         +t/Fd5GXE7uVhBl/BH1Gvl+aWcFIMhI16CysMoreYzHjkIMxl8LfyFTO5uHxWDseO7q9
         VO/w==
X-Forwarded-Encrypted: i=1; AJvYcCW2I05JFoi68sRW81FeUxqpMClIQlG5AsEqLe6RuiSJjHv0rEAywToxdM6WqvJDJV8kJPhDPu8iIAzPlCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5OqdbXtoGL4ag8Y2TBKmcBEgh4DnVL86X2V76QNVNlcNtId3L
	y1o2QZavEMnaskoE8Zy63Nnutaix/+S+y3b9zmvXDuBu4NNhTbJJjhPGuG33oyWZ77Yq3uOHTqe
	WODQ=
X-Gm-Gg: ASbGncv+w8UX4w11EjJHwEGWvswGtJgBln73r0ol+Yt4UO7vfznWsSUBT1hZ4O7aKyL
	Vj9rCzI83c5mxJNIWgb+ogT8qBXGhDeXT/VYxbCvpQ5jpsgQY24aRBpmGXIix7wzbDNo9vZ2CBW
	hmYriF6O0OycwjskWaG8orjFpr/5i4JnBCjlFBNp3vdBAgq2oc3zUfklKoQXgD4VsjgAM1x7j1X
	CoX0C83HsiXTCZJwPysWhiQQ/SAbX8MuSM10SfnjBkEzMwWdO8cGb99g71lfFoLQrZsSRg0UJkm
	IEZQoeYHcf60j3knrRqRlWFs1bKBvme85YL8UqMwrAOQNPCfgu6cPm1Fh2s6HOMofmpxV29HGwh
	1n3phr8MSLtZLmKFsXnl149mgVvLU8A==
X-Google-Smtp-Source: AGHT+IF0XeiygFdIHsNJW1ztzo8cn1yVguQcQE2GFR8WyUo3Yd/rZFjIg5KaFwwuS6AOYHyBDxXkfA==
X-Received: by 2002:a17:902:e5c6:b0:235:ef56:7800 with SMTP id d9443c01a7336-2382404d8b0mr65491945ad.30.1750875941283;
        Wed, 25 Jun 2025 11:25:41 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237f5c7f4f3sm88301795ad.198.2025.06.25.11.25.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 11:25:39 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234d366e5f2so2997295ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:25:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjBtq6hjv/OGVUcySvAoIwMaYJWfyO2bOMZw+iyRl+7NHtn6Lp372bP7DTYl/zEAeY92ChS49hDeQIZYo=@vger.kernel.org
X-Received: by 2002:a17:903:110f:b0:235:f4f7:a633 with SMTP id
 d9443c01a7336-2382404b2f9mr69281635ad.28.1750875938884; Wed, 25 Jun 2025
 11:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620074951.32758-1-brgl@bgdev.pl>
In-Reply-To: <20250620074951.32758-1-brgl@bgdev.pl>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Jun 2025 11:25:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XD1bfz4e=JOscqa3pGL_Z1RBRjQdDh31yfxac9ZPX6YQ@mail.gmail.com>
X-Gm-Features: AX0GCFvGmQ04Lpb3ie1KV9hPN8Te_UvujGUQoddbWMoxDx1BT5BpEPNEUBtns9Y
Message-ID: <CAD=FV=XD1bfz4e=JOscqa3pGL_Z1RBRjQdDh31yfxac9ZPX6YQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: remove unnecessary GPIO line
 direction check
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 20, 2025 at 12:50=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
> lines"), the GPIO core makes sure values cannot be set on input lines.
> Remove the unnecessary check.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
