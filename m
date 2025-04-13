Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78917578
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 01:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744509144; cv=none; b=R4MJfZmi8dNUgtc/wwg5vsniOnZ4nn/2kvSQU3ZH7hZCxFe2EY+AY8abdvK2CxFcQZpourZh8l3vBzalcmG61lHHgbhjNCsPh2Fs3OtXRxrY5fOtIDvVFqPit1gvcl8bsS62Mu5EOvQMveZXR0Pv7uNHQni6bQXnYp0VGnP7uOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744509144; c=relaxed/simple;
	bh=uiyYpF1t+mm8FjViGPx7owyj+fZCk+bg2OxrUSyfEQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8iOAOA/RBkRj/8X3G7fP41PSeIxrjzMSepyY1zRh80qZTy25pLrkxTiRcZNPrdr4eqkDih6bvX5tvvivD+3ifNd0DkTJ571NmHnPnRJNsAlsBzdmc9ASZXI4YO/jkL1u/1uM+06TrQ7bmkkQdbklGKvXNe/ss/+GS47Yys83Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gSSQvlVu; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gSSQvlVu"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af590aea813so3972876a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744509139; x=1745113939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCTQJWawSWg/PCwYJa8jUas4BZqGOPd3d7ezcRRV13I=;
        b=gSSQvlVuoflAZ2+3OUGY0wDyyHT6lIyhBvVkoKWoPxml6d/3l+BFcIDp36eKsSBYPN
         JMKW8rfrVUjkFV0Fm1DCzq7FGz+68Mzv0eeCtoPN8mVe1hIYq6dNrpEISMv2i6/W9+mo
         NpZ/joQUpI7pgNKRtlCTIqLmasle/H2ZYYVq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744509139; x=1745113939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCTQJWawSWg/PCwYJa8jUas4BZqGOPd3d7ezcRRV13I=;
        b=Xzw+sCKwZc6ZhqcI7vPdevh8KBNv7hZk8756DWeCQwG94KLpl5/rBM9TIobiv3mzQG
         iC3uru6G77cBpB0cu0k2IO23XcU3DxYxwcLsMeGgpMlPcoXCB5H/k9RxRVbE2cp1WcNI
         FSVSgSEAlPOhIef8vpGdhomRMLe1KwVzp+XOKd10sCA8cI/uWQL3ztAeo+9JcGlmUt1q
         /jv+dTzIzIQNeGdE84DLEZKje1dbM5KnTRerDf/fydXx3msppXhIkI9yaXTbJyJUOVBR
         rliY9RyIwP6dEuoRe4KE6o3B776OTZXLiGXRHM32RoZfRvRkUMHgq704Cy/ok00NV/uo
         +SuA==
X-Forwarded-Encrypted: i=1; AJvYcCWRKmSMGSZiLgph3elvstEEeVpThpPXHLrpXkA2acfglxdGxyGz8tReh+XiLVjte2f+c4OjrgAKL3APywU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJozQbAJ/Mwcyv1UYOGfmRSoEFcFVW9Tm4Zi+YV1j7ug76Y0S
	2PGSeB/i0kcOHcuzLLCpcMwZdhfESu090FI1WzUB0vXfDmPG2pnMRRlsinVODfLT0UsQew7FGFw
	=
X-Gm-Gg: ASbGncvlxbmj5J7+X9LsFaERRh7ctoq0TWfE3jbC00kgfXAIUUwDcTT29f3/hYC49Yb
	PQaLYoSvpPJg7TsqqLYz5XBqgX3gyl6X8LqlB4xdtILo7i10ejQAeksjR056m+KfxdJAHJEIX5u
	HrXzCu7T5FFo5revu84+061mKpoZ39vtFbSfzavREoCo7CbcDfTWEWieWpPKxLYk2Zgb0+soFYS
	9FnCknwdXKKPlqUDfJcQEqvfrhnL1cwKF/enUoWucUbE3n4VzavWRJuRoP1pY66c25d+B2JYKM4
	Sz1Lw/biAoy8ciRIM4KFR4cdJ3YQf8QpqAhvsDUK2CGwML+ggOUxFXURQPxQv1Z86KEG34tuJOl
	bfOTwF9+I
X-Google-Smtp-Source: AGHT+IFSU1qDm37OB/K2zM0UQKkX7U2+NNzV3sbZWsW9GrmNC+S2Sk3zTbtAHWhyzeNiViZV9jON+Q==
X-Received: by 2002:a17:903:1b2f:b0:221:751f:cfbe with SMTP id d9443c01a7336-22bea0abfecmr117104085ad.19.1744509139204;
        Sat, 12 Apr 2025 18:52:19 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb5ddsm74086885ad.230.2025.04.12.18.52.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 18:52:17 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227914acd20so34441215ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUy1zaRC/U6epwJUQ/joZeidjqUmWj5lFagks3BRv4b5/ttKMW12ZgDlV5yiI5s3K2pWdsH95UXRF3cVo4=@vger.kernel.org
X-Received: by 2002:a17:903:19cb:b0:21f:6dcf:fd2b with SMTP id
 d9443c01a7336-22b69430257mr168548385ad.1.1744509136642; Sat, 12 Apr 2025
 18:52:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411092307.238398-1-j-choudhary@ti.com>
In-Reply-To: <20250411092307.238398-1-j-choudhary@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 12 Apr 2025 18:52:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vkj_YnmYnDF3K+eYZ5M4fFPgGdmryHS8ijZOLZWbt6ZA@mail.gmail.com>
X-Gm-Features: ATxdqUGb7QdQ_LDlwPlNOMi40rUKPP3F5zETnRQUFoTVZcy0vCeWXEwlUd9CXLY
Message-ID: <CAD=FV=Vkj_YnmYnDF3K+eYZ5M4fFPgGdmryHS8ijZOLZWbt6ZA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Add necessary DSI flags
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 11, 2025 at 2:23=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> Enable NO_EOT and SYNC flags for DSI to use VIDEO_SYNC_PULSE_MODE
> with EOT disabled.

Any chance you could add some details to this commit message? Your
subject says that these flags are "necessary", but people have been
using this driver successfully for many years now. Why did these flags
suddenly become necessary and why were things working before?

I'm not saying that we shouldn't use these flags, just trying to
understand. I actually don't know a ton about these details in MIPI,
so it would help me :-).


> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index f72675766e01..8e9a7eb927da 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -707,7 +707,8 @@ static int ti_sn_attach_host(struct auxiliary_device =
*adev, struct ti_sn65dsi86
>         /* TODO: setting to 4 MIPI lanes always for now */
>         dsi->lanes =3D 4;
>         dsi->format =3D MIPI_DSI_FMT_RGB888;
> -       dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO;
> +       dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PA=
CKET |
> +                         MIPI_DSI_MODE_VIDEO_SYNC_PULSE;

FWIW, I can confirm that on my board the screen still seems to light
up after this change. ...so I'd be OK w/

Tested-by: Douglas Anderson <dianders@chromium.org>

...before giving a Reviewed-by I'd want a description that helps me
understand it better.

-Doug
