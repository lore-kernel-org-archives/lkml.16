Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EC71F4720
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873648; cv=none; b=sfqhXW+Y9GGgOjH5fhMnXMmD3vu/vTCKOp8pvZZnCXviW//NtzLNQKFmfR+xaMfH9oFBqGk0U9aJHZ1vkt5CPXCI7/bYwmWWS8lhh3osQ+SIwZG/pZ7qnlaZ67DvPytDo/8JLB5nAzjWKJ/hGcSjhbUXWL9YuYvzFKUggPWGEPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873648; c=relaxed/simple;
	bh=n4WGwCItyZewiOJcBSp4Eaj+wnGcnc5O6i3QGT0fNG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHiDHmpc2sjAzoR6YWONIIGNqYZiFI//8gO87GCIljwLA+GFuaB01CQKS96pYXT/y6+Bl+MIvLg97b9YBs41mKdhiJkVtiagS0S4uX5qixM8sl+es83kOH+j3VqU6jqmUtXYubPo/G4d2DUhRCOns5EBRiuXzhkCV1I4BKpnijU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YHujt9MM; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YHujt9MM"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73972a54919so4473660b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745873645; x=1746478445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=YHujt9MMTp8bKrMsFmXM63bMM8a+I2YXydtfpVDqQAF3DVIzLp41fZ7aZMRYjXHg1l
         DhEJEskBspuF4q7G933v3fo40LBtspLETpFYAIzL7KWa41H2k04Aq+LRX3YOefHIPU/Q
         nfKgompPqt/dqYsgIAhR4l+BSNllmue2YLiEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873645; x=1746478445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=NKKxcNrtv+S9oio87TKP2h4yoDfMLzMZo6/EEc+jqtsRUp3w0FjkXCB71LFeBNOHUE
         Y9SkH0R6DE+zlWNetWx5l/Pb5GDpMx5ilVZnDC37NwT5wFsnt7z5Ae9EBKhKT3ykv+GR
         9cfemUrjW896AXrhLr+AkztlJvhnmCC44acrDi36sqvJoRxrDg3b/LL7xZ7/Hq2XzHju
         0O84GifJxjnaZj1+B9wDqg6ILu2WO7Z6Qtv3rL4TKbyaZDRoSAefo5dO9TsIOMYG+LwT
         eoE+VFUKOfsSLHaw1kqeMHuXJa/D475AdYtjN3YZYDQs0mpQXc6F0zbRCADa8fIoSZWS
         IFng==
X-Forwarded-Encrypted: i=1; AJvYcCXuSIoKmDjqaVbDk+cjAavyqbmmjBNaPUAvMvhL5srpHtnvlRczkdm2N5eUImlj04jJHFCzgF63qbNJmgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLNuC932G8BsCXNVUCZLuWLWoSh7hseN72PaOinHDLNm7aqpXH
	L2Zt4lhw0A83OTCT8CUqq83YwSeE4svkPv8yghFf5L2RxCpnMaTc87JAbVI5BIDJtvNNrHg/xQk
	=
X-Gm-Gg: ASbGncuFVamuZrHVqGzvGQrZ1cZBKiKZvslIeT29mITUc5WQb6HIXLBdRJN0E37DUXv
	hBYGIGHwhwX0PJTC1LlgS6PLMoLEWgEbbRztRhDMg9N0jXNnUGPaHgj+vLmc0oGXc78iDv4F4pZ
	yiPX2ss9ViZ0uPnMdji5j8m4n+Qp8KVp4JDwX+t9voHvbO/P+q4r017/3cspJN7D5ysC7y1Jxna
	MY+YMGCPUp4HMejUzMRgeq9MCXKiwYGcABVIbAf3ZGFCCKGyd401xLhVysK7cKpKi2KMXQxAISg
	0MTVmcFAzl7Xafs96mxirltu2GqGOoU8zMiSsNyXNAxBel9PrSUlRuwxMaUZWEmAatLqSpAV/cd
	CW/yGdj8mm5o0L9gDg0M=
X-Google-Smtp-Source: AGHT+IF3Bi94CxAHL97eJS91iuNb6rJiq3P3EwiR/TTRRbF/5RkQv32y2rcE3yw211WOk61XSxOHtA==
X-Received: by 2002:a05:6a21:31c8:b0:1f5:7862:7f3a with SMTP id adf61e73a8af0-2093c7e1f0emr1283275637.14.1745873645392;
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941eecsm8782624b3a.54.2025.04.28.13.54.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4205344a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMje5rJSdifAoyghELCK3hJuwCWjrFvgHW1M0Y++szHAtMP5JGzwKkUIeeNomBFyl9dH8iGl9HmX9HHeM=@vger.kernel.org
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.
