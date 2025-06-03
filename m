Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C22690D9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934698; cv=none; b=YxQM3sRCLL6ottoh6YUtTFfO8GLmW+vgYr+wx/bqu5EYYlWpwOvviZ59lSrkJwJgeOj8c0pdB9ShCAuJLSST0/TcS6lf7Wu7ksI3TXa3IQYp1HF67hz2r93PEu5BGfrdLSVBMu0wslUAq2Y0CRqgpUXaOh/LzsndgqloGSHpX3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934698; c=relaxed/simple;
	bh=mL+MB9sT5jktnVzl73SbKdG0xZoa7DasqXdQr1/ZCr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oqu0Plp+AEg7ia3gGU/eOwyMSw3p1ZhCI0uJZ3nTodpAoWk6HkQgJdba/x11lFvbPiiTcbly438ab2Wd2Xf4k///0O8cXMs+rJPnYVZtXBqYC3kACrB5e/CLjn0DVyNoQq4yCfD9GFSVSk3Iq6SLuemtUp0Zob8H8uI9JNSfrM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5b2472969so462340985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934695; x=1749539495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLb8HhO98/51A3Sg1akRHkfjqC4wsBeHTx0qur+bJ6w=;
        b=ZJltEYDeyxheZz/G+0hNr7Q33mAaMjB9vQ7y4+PdUBmEUs90TbZpAcsjezqH5/hIMp
         OUDnjG02440zBHxb+5M9w9HuuY6Z05znZVGsvP3sdMTj0AdWvzdNsaDGPgSEN4OvUBQj
         IskU7IQEEYhMegHmCDqQK/IbZLaCju1YbgIlnChUrHhWcgGF3VRow7gMY9WyGKBVBuPT
         E2+MIz7tMpOBZSnrQESIkXTOTh97mhJUeDQp2Pg5Kkavheaj5VPFwHsJnm5ML6ghCi+8
         JwP2knWRxEraL4NiuJGHcvqlasWRCaU0DLjFd1alaaF3Fyp3rXG5UQDZTOKdjp2GbKZ8
         UiMA==
X-Forwarded-Encrypted: i=1; AJvYcCUDIzZg4VhJ6dw4Dpu96JvTaQwtOQ1mIetvLRFqpRy0hCEzVpNvDdK0vvLMoQqZF79ngcjN5+cKwxjvvac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVKhOOjJ4Z695W5A4MPOp0tf430AYm9Px8gHbfyv1faZXceKWU
	Qmy9B2hXAinkpF78Z1JAAKuDa2/Wv1iKaiZ7d6baCN1QmGJvyMLEGIZTs3giDwqJ
X-Gm-Gg: ASbGncuDr1qOyeiENSO1dUZysOoIfJ5rt/t5AxetWGplxO7/sNHuRQHe/Odn46j5gpV
	VcHuQCkxRr4MHAtB6uQGNcUlF024T4blk3VdWxXlrSbtYmvcSsSHs4iUTlSUnzTd0cDDVV51WRZ
	hcyu5YeC5efqezrey/AzLv41s7qStKVyOow7RIa4aheFgJPuFtROjIBVkc4HbaoknImWrAlPIMi
	pgpH8cdOdZTZ0elZYVNmaJBbntiJPr+u9805yGsCAs7q+EuL+wmuxow2tb+h/6Xdt8XcN/5ILLB
	cZ4zC++AHgY6RpWhQroWMD75vu5D6hFZO5UiY1KMRRRFtNXF7TulXOPhC/88IeEyf++iMxFfpyq
	XmRF12NdKCYoGRvtdQqzau9js
X-Google-Smtp-Source: AGHT+IGahx/mMNIGz+y0cXDORhNZqGlPcsUxvWkT1LcqYkc9cP7T9L4ZcBE2nfGHlsHxSoBRKgJWzA==
X-Received: by 2002:a05:6102:292c:b0:4e5:9380:9c20 with SMTP id ada2fe7eead31-4e6e40d92b3mr14691075137.2.1748934684154;
        Tue, 03 Jun 2025 00:11:24 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a2a2f46sm7115880241.12.2025.06.03.00.11.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 00:11:23 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87de47585acso3824982241.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:11:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW55I7fL+Wj3ni/jtuUYYwTV93j903vC+AoXzzxUQLMG1RpyiU6qbK3Gqy1JxySP9es/SiQS5+Y9xKL4Es=@vger.kernel.org
X-Received: by 2002:a05:6102:3751:b0:4dd:b192:960f with SMTP id
 ada2fe7eead31-4e6e410d39amr14204348137.13.1748934671280; Tue, 03 Jun 2025
 00:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-1-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-1-5d75a3711e40@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Jun 2025 09:10:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsGVNsm_WdiZ2hNuErrUUaj49SN_ROr-_KfEWW63omTw@mail.gmail.com>
X-Gm-Features: AX0GCFtcVOHqZD8BcFzZWMq6QGLbY93W1tbb2YLDvTYE6IWQhmuycmj54r1gmT0
Message-ID: <CAMuHMdWsGVNsm_WdiZ2hNuErrUUaj49SN_ROr-_KfEWW63omTw@mail.gmail.com>
Subject: Re: [PATCH v2 01/46] panel/orisetech-otm8009a: Use refcounted
 allocation in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Robert Chiras <robert.chiras@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>, 
	Dzmitry Sankouski <dsankouski@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Anusha,

On Fri, 30 May 2025 at 20:28, Anusha Srivatsa <asrivats@redhat.com> wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks for your patch!

I have a generic comment that applies to all patches in the series.

> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -424,9 +424,11 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
>         struct otm8009a *ctx;
>         int ret;
>
> -       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);

The old code used sizeof(*ctx) instead of an explicit type, for
increased type-safety.

> -       if (!ctx)
> -               return -ENOMEM;
> +       ctx = devm_drm_panel_alloc(dev, struct otm8009a, panel,

Can't you use __typeof(*ctx) instead of the explicit type here, too?

> +                                  &otm8009a_drm_funcs,
> +                                  DRM_MODE_CONNECTOR_DSI);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
>
>         ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>         if (IS_ERR(ctx->reset_gpio)) {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
