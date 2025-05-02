Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519FF4400
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 03:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746157110; cv=none; b=Vaiiag2KAzMDC5jl4N7zZUmttaoa8NoUmL7cXyizX2Jhd9rtr8JMIv3pJ3EF+TIXQTXp0QcuL3+XEiXQ0DPyg+0wIrR80F9F+dBKtPRNfy1o9lb2I4DKaCwM8qXQufwk4uTVziXqdfV0dvEynOChKaFNTtH6oiTjgBitJt89dM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746157110; c=relaxed/simple;
	bh=9PEpXpBpktsu6FpKmaFtmRSYdozC+iwM4yh13OUVe8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sfQsll2IwscyuuLJvDgXqIxiFWe2VeBZbuInu+0/r+4YpZYHRtlnHba1KT5ji0+lMTuZuMCLsuiuzQewKpPe7v8466rAU25UXMZ3nHvgkXZKBK+lzmBQBrM+P0l2U8Gpuhs+V1VfKb9Fpv724ThrEOXVIPl9i8dh6wuDNQzFCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YJF7YMwP; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YJF7YMwP"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2240b4de12bso26585365ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 20:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746157108; x=1746761908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPJbY5868L+3A1cDgA46X38/XlY0WsfhVjXq+7oUVv4=;
        b=YJF7YMwPzG8IRRm+pMYM/hGyChLtEH0mIFo+Y+YHRnMLIZ/g9zB8Er0RYvZD1zi5C9
         79xpEbuK9smu0RSlt9pSxk0uIaf8ZdRsRnyWQwVPmIMZkX2U3ww2dtTQKEyfhIZ9FS7b
         RsqwRTgoxKzFxJczA71jDtcN4CXk7al3LGVsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746157108; x=1746761908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPJbY5868L+3A1cDgA46X38/XlY0WsfhVjXq+7oUVv4=;
        b=AnmqmkCPa7RPd3vKQIb1uz+gIJjIoRu5GZhVI1k8XB7B2fGQw1h84Kfi/g2lW7PxJa
         hTrcenoptAQk1JqKdRDB1IR9kz7ql+qcfKIOVeBEnF4WvKUPY1wXKggrQ4W6nYdqicWU
         mAM74tRgN1HdbEXgrV/tvsZp20EpUnsv/Qh4NI0cFMvBm3qrbQBmB4Sxlnwu8x2d/BiG
         1DzsvogwIW69ACNB0KQlGMkbEqWTcZXhOsyKGmFnhTFamAphgEdkchR2HIraZMCu+unc
         U8vjetlatmRiWwCSCl/umHwJ9fFfTHOKlkb0xQx/yB040ZXfxAYVyjvGFoG1qFCpz3QF
         nwRg==
X-Forwarded-Encrypted: i=1; AJvYcCUSjZG2CYmbWBh02WejXTdseLM1j80pxIV/4HIpW5GSnU+srdtsRKVIE2zUmoxuVV37/LvfB4MxcB2pYQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdyEkTpZMER2daQEv6Py4XNUJYnLSvLNC1jzqIaTy2JHJecGe
	gU4HAcKhqsk6AlwPJOhNcMKf/5ibZO0SnaFVwDX/6SdeEXNPVvkq/GLZ9mBOIXBnHwo6ITcKXGX
	qag==
X-Gm-Gg: ASbGncvjIvXUyVqtzrx5hmsHlCBGULKUwjELQNMOEYIpZ5zhWr1mHW8ZTTg1hy0wo58
	yAbIkRYnHpUiAspPSWLKnffWZ7bTvnvzEHH8kg3WGRinbQOL/eBVZyBbHwo8RYjV7IGtP5ADij8
	653oUm+K7j+rOj4o+JM5THM6z8He/AsEXiNJ+thE/IAUCEDrvEvDtUmyr/jYYc2E2iYbvQey56f
	slyEYIsL4eT4RYnBgKSXZ/zpY/UN0I0KcJpkuMzpduOHVDGEhCPtC/cBYJzWId0M1LSihFoWaHa
	KO8JnChleFFhKsHZmP2Oq4cOfjBHsuhUPm8dJYTZQNjdC90vV2Tzo40D+dx1OHIz4dn12C31F2r
	4Nv2k
X-Google-Smtp-Source: AGHT+IHbYDW4bwk+8LkjlPPt8mZ+yp+VCJkR7P9GfEf9oGzJQifc8x3T2G0uAGBGZ3KNQHIkII4lHA==
X-Received: by 2002:a17:902:d4c6:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-22e102dfcb1mr19014245ad.26.1746157108588;
        Thu, 01 May 2025 20:38:28 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e10911caasm4156265ad.160.2025.05.01.20.38.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 20:38:28 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30a5094df42so224307a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 20:38:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLLjCpfNYKQD5mjPAOK0MCgiEWiOycuEZ8Du3IyQ0LqB9GJRYu/9t5/Z7sbZTxU2swszrSPCaO3mjEsK0=@vger.kernel.org
X-Received: by 2002:a17:90a:f944:b0:2ff:6aa6:47a3 with SMTP id
 98e67ed59e1d1-30a4e686b6amr2145034a91.25.1746157107521; Thu, 01 May 2025
 20:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501074805.3069311-1-max.oss.09@gmail.com>
In-Reply-To: <20250501074805.3069311-1-max.oss.09@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 May 2025 20:38:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=NjbM9ZXLw7gH-_4CnpU7QU=sKCVQVxgmgP-Qpt-3hg@mail.gmail.com>
X-Gm-Features: ATxdqUFyowe41v3nrLRGFu76N4r5nn_xrMaypod_FFNLGmwvMmshLREDILcpah8
Message-ID: <CAD=FV=W=NjbM9ZXLw7gH-_4CnpU7QU=sKCVQVxgmgP-Qpt-3hg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Use HPD in a DP use case
To: max.oss.09@gmail.com
Cc: max.krummenacher@toradex.com, Jayesh Choudhary <j-choudhary@ti.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 1, 2025 at 12:48=E2=80=AFAM <max.oss.09@gmail.com> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> The bridge driver currently disables handling the hot plug input and
> relies on a always connected eDP panel with fixed delays when the
> panel is ready.

Not entirely correct. In some cases we don't have fixed delays and
instead use a GPIO for HPD. That GPIO gets routed to the eDP panel
code.


> If one uses the bridge for a regular display port monitor this
> assumption is no longer true.
> If used with a display port monitor change to keep the hot plug
> detection functionality enabled and change to have the bridge working
> during runtime suspend to be able to detect the connection state.
>
> Note that if HPD_DISABLE is set the HPD bit always returns connected
> independent of the actual state of the hot plug pin. Thus
> currently bridge->detect() always returns connected.

If that's true, it feels like this needs:

Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge
connector operations for DP")

...and it would be nice to get Laurent to confirm. Seems weird that he
wouldn't have noticed that.


> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>
> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 01d456b955ab..c7496bf142d1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -333,9 +333,11 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65=
dsi86 *pdata)
>          * If HPD somehow makes sense on some future panel we'll have to
>          * change this to be conditional on someone specifying that HPD s=
hould
>          * be used.
> +        * Only disable HDP if used for eDP.
>          */
> -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE=
,
> -                          HPD_DISABLE);
> +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_eDP)
> +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> +                                  HPD_DISABLE, HPD_DISABLE);
>
>         pdata->comms_enabled =3D true;
>
> @@ -357,6 +359,10 @@ static int __maybe_unused ti_sn65dsi86_resume(struct=
 device *dev)
>         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(dev);
>         int ret;
>
> +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort &&
> +           pdata->comms_enabled)
> +               return 0;
> +

I don't understand this part of the patch. You're basically making
suspend/resume a no-op for the DP case? I don't think that's right...

First, I don't _think_ you need it, right? ...since "detect" is
already grabbing the pm_runtime reference this shouldn't be needed
from a correctness point of view.

Second, if you're looking to eventually make the interrupt work, I
don't think this is the right first step. I think in previous
discussions about this it was agreed that if we wanted the interrupt
to work then we should just do a "pm_runtime_get_sync()" before
enabling the interrupt and then a "pm_runtime_put()" after disabling
it. That'll keep things from suspending.

Does that sound correct, or did I goof up on anything?

-Doug
