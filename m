Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9659A243948
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739045946; cv=none; b=hByXN1p4pDINj26SeCvDDhsl7LZBMSELcSeFL1ShU5WfUkGxqAYMU9y/FBm0m1J9anv1PzuP2CujlSgWUzcm5Te5jm5L18asR5zdnVQY1qVdgjQl3/vzYwLx6PajzhR8hVN9mXLWYQ28jUUwcK/pTdIQ3QSv/snodMy0YVsd45g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739045946; c=relaxed/simple;
	bh=7hmdjLWt4jHJirAMRANdiWgDmcoIGi97y2de8Lnssg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amlXAO1RB1ft543pM+ZfEw6IW4ZzwEgj87U5mHXeH8QYxALARFbGeL/eQQdNvfXJTd8vVC69l7HQS+EiIiu47YmTJiFdxcrUTe38gSztRS9X7MJJBdDnvGrjSGVYf7mfcSH7DJnIbDNchLuA9JKBMvmznL0huHk2sb9s2SH5x9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AiQDkYh7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AiQDkYh7"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30762598511so31564321fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739045941; x=1739650741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nev1SLQZQQHmDHpF4OBWN7y4nvz5UF/4e0pDV1IuWdI=;
        b=AiQDkYh7nsxu1CiDFNmXyn/IGL8oSBwcpB7HkVg0qZk507HVj5fl/m8J63o/bzrNyp
         3b/gSSWW8reOagz2mTB1QDB8JzmLCIDfX9436bbOKQs6xLfePO708JNcUSFLLIng3zVA
         KwM+CDuYhqr42kluBCS55cZICN9ffsfjKpDjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739045941; x=1739650741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nev1SLQZQQHmDHpF4OBWN7y4nvz5UF/4e0pDV1IuWdI=;
        b=scA0XN8TfrW8Gmc4+VL7zdK//A6ePWVHlmN1HTMdaq2JpG6McHWVdDvMJGUxfl09RE
         f+Rx3GOKogFjAMTYlCW35UqOA2Rj34VLmuRclj+HkeDlfSq59GFJP8uKTQO5uGBEgFCf
         qb3T1HklEMdkS9u/UEcgK+TEJGo4S5PPkHva2F0eor6Hf+DMIjJw+gLKDbI5D4nyHuh6
         r0j2A+fNAx11/U+DbVYUvgUawkvJkJra9LBuNnfCf42DYcwrsp37Kf0YT5kK/UXytNA9
         DvJnKSrL2aIw39Nv7BKeF/9jhFS5dR0jATEP7LLmPF/By0WsAFdJtoYyAVuMF/LNjUXN
         +CvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5uGMfPziYXh91/AIgaOfZoR7K4B11NdMlMQOAYPCx4QUU4xsX5YHI70XQzRJXZCXo2fxW1OWPc1cF27E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvC7z5P3uYx/Nnera1BT+w/cYXeYE4jPxlOeL1usrZMuKQRuw
	p4xE8SbqmPocTyUpBYo2LqD7CvzeBS8ffm77kTVuk1nWmoydqwsjoJwCSeJvdmowQYTgjGD35SE
	v+iL3
X-Gm-Gg: ASbGncuRbRfVhnjDSQiSOEqT0u+U2UlxzVfk/TH/FNjtkRMfkPUOA7M4OvY9RnK0Xi8
	oz6IKghMJLwBIRwIHvTLzisdRE3iFyhohNOIPPk8ThxsuKfhafBCzz9/RyCeMPyYp0/gaHjwwri
	eeGdFeM6KccQg8U0HyN7ZhwNNidZlqjKU5vP0n+8J5IE0k+aBa0+PpHGKmyQQRJoEEiOIAaUCGJ
	FFqwMv3tjDaIHoCZnD0Bg30YZ5ABytk/LhodcDf4iTw/WhgMKt3w1DgSIWfn0nZKad9ta5oBPg6
	Jbc+nbmaFvgMP0eih5tr7i//p706iGDUKc6Km0ooBs91BEwg+e2KfmI=
X-Google-Smtp-Source: AGHT+IGbYT6BPosdrfgg88O097A9/qPAQBJ6MkGsVEmRI4Y0kDV40+FSnFWQaeN863DRQG7LAG0lCQ==
X-Received: by 2002:a2e:9a11:0:b0:2ff:e5fa:1ae7 with SMTP id 38308e7fff4ca-307e580c52bmr26052501fa.21.1739045940749;
        Sat, 08 Feb 2025 12:19:00 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2dbbc8sm7916981fa.95.2025.02.08.12.18.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 12:19:00 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-545064389d3so589660e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW88eHrOL7SSNNFDouenf2pYxOuBd6UOZF1uNHHRE8fyLnJpSLYOrdFKQLkI6g0RCZyvYk0cBGgIpucGQc=@vger.kernel.org
X-Received: by 2002:ac2:5461:0:b0:545:3dd:aa68 with SMTP id
 2adb3069b0e04-54503ddac50mr1113948e87.32.1739045938669; Sat, 08 Feb 2025
 12:18:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208051541.176667-1-tejasvipin76@gmail.com>
In-Reply-To: <20250208051541.176667-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:18:47 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WmOhHq4qQ5neDjfBy71za3AguvtQ9hFnwf0hwtwSmiqw@mail.gmail.com>
X-Gm-Features: AWEUYZm13bCaUiucxyQUvz1BOJ8yfU7zXn9Iokz6ONSlwhzPjfipmbHjpI1UbLc
Message-ID: <CAD=FV=WmOhHq4qQ5neDjfBy71za3AguvtQ9hFnwf0hwtwSmiqw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: visionox-r66451: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 7, 2025 at 9:16=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Change the visionox-r66451 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-visionox-r66451.c | 179 ++++++++----------
>  1 file changed, 76 insertions(+), 103 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/=
drm/panel/panel-visionox-r66451.c
> index 493f2a6076f8..81d615e1937a 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-r66451.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> @@ -42,85 +42,84 @@ static void visionox_r66451_reset(struct visionox_r66=
451 *ctx)
>  static int visionox_r66451_on(struct visionox_r66451 *ctx)
>  {
>         struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
>         dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xc2,
> -                              0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, =
0x00, 0x00,
> -                              0x09, 0x3c);
> -       mipi_dsi_dcs_write_seq(dsi, 0xd7,
> -                              0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, =
0xa0, 0x0a,
> -                              0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x19,
> -                              0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
> -       mipi_dsi_dcs_write_seq(dsi, 0xde,
> -                              0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, =
0x00, 0x18,
> -                              0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, =
0x02, 0x00, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0xe8, 0x00, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x00, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xc4,
> -                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00,
> -                              0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
> -       mipi_dsi_dcs_write_seq(dsi, 0xcf,
> -                              0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x08,
> -                              0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, =
0x01, 0x01,
> -                              0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
> -       mipi_dsi_dcs_write_seq(dsi, 0xd3,
> -                              0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, =
0x15, 0x07,
> -                              0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, =
0x00, 0xa0,
> -                              0x3c, 0x9c);
> -       mipi_dsi_dcs_write_seq(dsi, 0xd7,
> -                              0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, =
0xa0, 0x0a,
> -                              0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x19,
> -                              0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
> -       mipi_dsi_dcs_write_seq(dsi, 0xd8,
> -                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00,
> -                              0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, =
0x00, 0x3a,
> -                              0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00,
> -                              0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, =
0x00, 0x00,
> -                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x0a,
> -                              0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
> -       mipi_dsi_dcs_write_seq(dsi, 0xdf,
> -                              0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, =
0x00, 0x00,
> -                              0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00,
> -                              0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, =
0x00, 0x00,
> -                              0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, =
0x00, 0x00,
> -                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
> -       mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x34, 0xb4, 0x00, 0x00, 0x00, 0=
x39, 0x04, 0x09, 0x34);
> -       mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x40);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x11);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x00, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x19);
> -       mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x42);
> -       mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -       mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
> -       mipi_dsi_dcs_set_page_address(dsi, 0, 2340 - 1);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
> +                                    0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, =
0x00, 0x00, 0x00,
> +                                    0x09, 0x3c);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7,
> +                                    0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, =
0x00, 0xa0, 0x0a,
> +                                    0x00, 0x40, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x19,
> +                                    0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, =
0x0a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde,
> +                                    0x40, 0x00, 0x18, 0x00, 0x18, 0x00, =
0x18, 0x00, 0x18,
> +                                    0x10, 0x00, 0x18, 0x00, 0x18, 0x00, =
0x18, 0x02, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe8, 0x00, 0x02);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x00, 0x08);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x02, 0x00, 0x00, 0x00, =
0x32);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcf,
> +                                    0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x08,
> +                                    0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, =
0x01, 0x01, 0x01,
> +                                    0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3,
> +                                    0x45, 0x00, 0x00, 0x01, 0x13, 0x15, =
0x00, 0x15, 0x07,
> +                                    0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, =
0x11, 0x00, 0xa0,
> +                                    0x3c, 0x9c);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7,
> +                                    0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, =
0x00, 0xa0, 0x0a,
> +                                    0x00, 0x40, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x19,
> +                                    0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, =
0x0a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd8,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, =
0x3a, 0x00, 0x3a,
> +                                    0x05, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x0a,
> +                                    0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf,
> +                                    0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
> +                                    0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, =
0x0e, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, =
0xf1, 0x00, 0x00,
> +                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x34, 0xb4, 0x00, 0x=
00, 0x00, 0x39,
> +                                    0x04, 0x09, 0x34);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x40);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x50, 0x00, 0x00, 0x=
00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x11);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x01, 0x00, 0x00, 0x=
00, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x00, 0x02);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x19);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x42);
> +       mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_V=
BLANK);
> +       mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, 1080 - 1);
> +       mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, 2340 - 1);
>
>         dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;

I think that to match the old behavior the most correctly, you'd only
want to clear MIPI_DSI_MODE_LPM if there were no errors, right? All of
the old mipi_dsi_dcs_write_seq() calls would have returned early in
the case of an error because of that non-obvious control flow.

I'm not a total expert on MIPI_DSI_MODE_LPM, but I suspect your new
behavior is actually more correct, but it might not hurt to at least
point out this change in behavior in the commit message.


> @@ -187,25 +181,13 @@ static int visionox_r66451_enable(struct drm_panel =
*panel)
>         }
>
>         drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> -       ret =3D mipi_dsi_picture_parameter_set(dsi, &pps);
> -       if (ret) {
> -               dev_err(&dsi->dev, "Failed to set PPS\n");
> -               return ret;
> -       }
> +       mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
>
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret < 0) {
> -               dev_err(&dsi->dev, "Failed to exit sleep mode: %d\n", ret=
);
> -               return ret;
> -       }
> -       msleep(120);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
>
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret < 0) {
> -               dev_err(&dsi->dev, "Failed on set display on: %d\n", ret)=
;
> -               return ret;
> -       }
> -       msleep(20);
> +       mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 20);
>
>         return 0;

As Dmitry said, return dsi_ctx.accum_err


-Doug
