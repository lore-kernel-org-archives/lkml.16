Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE08519F130
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749747722; cv=none; b=k7fjcSPXevCjZN1B+hCOH8Vl1PrWons0k9jjWiiS2paj5m1s+3QOoDPCH5r1/VUGk6uVPF5LVHolmZZg7r2EhjwknVRU90popo5ma1tXkaqiJo7ncqUp5B0xPMIskbJG20cIagVfmKmzK0Aa98NHqPAMm+XgXHrYyeuvKsdhJtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749747722; c=relaxed/simple;
	bh=Wgc0OTFdZiG86Notyo8kKoTGmeK0tIluI4EeOr0pt+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VW3qR+7ZYXaf1DxU8stkn2wL2VqTRjkqLGuK4QBYWCXtQxUtKV682ItX79k9qoKjvnVo77tt49GWS9gG+o1OMTLMOnv9LkYebZ6v4oNd/yMpmRq3M1IcOU/EQqoX4tyBoSDkUbXsiDOy4vnC+Qdd0Bo/mK3s1qK8K0ProaANrVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gEISTzod; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gEISTzod"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e3c6b88dbso8227267b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749747719; x=1750352519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j029kDeFHGMi64Isb1RXeOmMbM70WI3AWi7tT+8rWYw=;
        b=gEISTzodbBybccEYGlddB/PgO1heEVjWhTmyNrIB0wsJTHk/NWvfLXdLvl9A9jokZp
         HSjjARifYR6wvuq7hxDB/rsShR1DUnEgY+s4PWm0A7OuOkKlsogNri93O+BXYKkfIjBs
         vTdb30H9QGAwDDKl4uwD4/3pRwjsO1qT0LmkUSMeT6SAgZUMUDj/KzwHiKXNaWvCYxwd
         pZE/sVqPoGqILKeuVuTsK9HTfXE9BQlpBeS2qBWWuxK/QFUQZtbAmiicRaBusJcfPBBr
         nu6nnjw6MfMPfxFw4g1zLPJ+9bbl2vNhMA/ZVYXcr6GwhsJWksOXwUIUtyt5bSxfZIPM
         ROhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749747719; x=1750352519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j029kDeFHGMi64Isb1RXeOmMbM70WI3AWi7tT+8rWYw=;
        b=qg9no6Xq6rC36VJQIj1lg2HRgsSaoQ57Z0VMTJw1KbOb3ORN9ZCAQFZVDjRg0sCTeo
         xD9r5assMPNJt0Tib6/HeaHoQ8u4FYBQ00yb7bKdqY9+QjqC59GgilTn0Jju9l6HyF6U
         vui8eP6jqfKcg7JEsNovOUkmEbX6w1Ic92gncwrhuW0x9skcoVeqHyRwdvdlx/EbkLFF
         BwEFqiV7ke3zgYQSoZpZ7laLO35wgBJI9ocq3+//2MKxtkGqTpAyReUoSvCJxwybrBTg
         6CDpwutlFJ5LeLl8ZJlZGl4p2pTnIqgv2Mv9uiV1GQTS+nvMxrrwnSZCn0cTJmlXku3U
         KjNg==
X-Forwarded-Encrypted: i=1; AJvYcCX2uq88R+O0yGyl/y91ote45S5mO9FtRwQNeC1HJzyQieQN0lVKLghgndzn7duOjFp5RTA8DWhPZAitw6s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9FDRr21Vq6GKLa/mwW4/4SNk/HgQ5YLHwIMY2n5OXinUNgDEi
	vOEefBkbwD30ZGy6tdhV1MUdDrdLQEc6pejQVx5JuAhRk84S0XMWuv5exDb2GJwUNw+dRa6100w
	f8Gd851EvPVxXEbqQLynuabQMHo59XUeFGoSNJtvItg==
X-Gm-Gg: ASbGncvXdToQ+cBjt3/QjqX0LJdPidpafeFkR6q+YZ9n9II0xS2r0cPJ5FjfHyThldt
	aXsDPC8DK7iBN+ML4UF5MDpoYPoILpk1etyGqNrqju8f7aZRY/MVlOSgt0jdny1u9g6E1YMnpsp
	I0RehRCYRVm2njTjL82Ac7LCe9z7I7JtrLx0jidFQ+m38ou1/QtWP26fqWH1/u1ZzFEv1a+WAmH
	eg=
X-Google-Smtp-Source: AGHT+IFWZ1yI879MI9LNRcbcJT5vdbQHxsUV2ymfSBQjSbZZCzPqE9KkPOMXdGCKFrhSR1K4ddmzhU8KMX8Ev6PyACA=
X-Received: by 2002:a05:6902:1109:b0:e81:fc77:abe7 with SMTP id
 3f1490d57ef6-e81fda04c1emr11802525276.10.1749747717864; Thu, 12 Jun 2025
 10:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org> <20250612-csi-bgr-rgb-v1-3-dc8a309118f8@kernel.org>
In-Reply-To: <20250612-csi-bgr-rgb-v1-3-dc8a309118f8@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Jun 2025 18:01:40 +0100
X-Gm-Features: AX0GCFth85n8IiuJGK0v5pSTI5beNdQM6diU1H1GZ00d7VoB5jfKLgcoBALSvtw
Message-ID: <CAPY8ntCYG8ufxpMkgBj1ZpSW-H2HObpcbQNg9tj+EXUM4PGkfQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: tc358743: Fix the RGB MBUS format
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Mats Randgaard <matrandg@cisco.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"

Hi Maxime

On Thu, 12 Jun 2025 at 13:54, Maxime Ripard <mripard@kernel.org> wrote:
>
> The tc358743 is an HDMI to MIPI-CSI2 bridge. It supports two of the
> three HDMI 1.4 video formats: RGB 4:4:4 and YCbCr 422.
>
> RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and listed
> in the driver as MEDIA_BUS_FMT_RGB888_1X24.
>
> Most CSI2 receiver drivers then map MEDIA_BUS_FMT_RGB888_1X24 to
> V4L2_PIX_FMT_RGB24.
>
> However, V4L2_PIX_FMT_RGB24 is defined as having its color components in
> the R, G and B order, from left to right. MIPI-CSI2 however defines the
> RGB888 format with blue first.
>
> This essentially means that the R and B will be swapped compared to what
> V4L2_PIX_FMT_RGB24 defines.
>
> The proper MBUS format would be BGR888, so let's use that.

I know where you're coming from, but this driver has been in the tree
since 2015, so there is a reasonable expectation of users. I've had an
overlay for it in our kernel tree since 4.14 (July 2018), and I know
of at least PiKVM [1] as a product based on it. I don't know if Cisco
are still supporting devices with it in.

Whilst the pixel format may now be considered to be incorrect,
changing it will break userspace applications that have been using it
for those 10 years if they're explicitly looking for
MEDIA_BUS_FMT_RGB888_1X24 or the mapping of it through to
V4L2_PIX_FMT_RGB24.
The kernel docs at [2] quote Linus as saying
"If you break existing user space setups THAT IS A REGRESSION.
It's not ok to say "but we'll fix the user space setup"
Really. NOT OK."

I'm thinking of GStreamer if the format has been specified explicitly
- it'll fail to negotiate due to v4l2src saying it can't handle the
caps.

Yes it sucks as a situation, but I'm not sure what the best solution
is. Potentially accepting both MEDIA_BUS_FMT_RGB888_1X24 and
MEDIA_BUS_FMT_BGR888_1X24 as valid MBUS codes for RGB, alongside
MEDIA_BUS_FMT_UYVY8_1X16 for UYVY?

  Dave

[1] https://pikvm.org/
[2] https://www.kernel.org/doc/html/latest/process/handling-regressions.html#quotes-from-linus-about-regression

> Fixes: d32d98642de6 ("[media] Driver for Toshiba TC358743 HDMI to CSI-2 bridge")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/media/i2c/tc358743.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index ca0b0b9bda1755313f066ba36ab218873b9ae438..a1c164a7716a10b0cb9ff38f88c0513b45f24771 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -688,11 +688,11 @@ static void tc358743_set_csi_color_space(struct v4l2_subdev *sd)
>                 mutex_lock(&state->confctl_mutex);
>                 i2c_wr16_and_or(sd, CONFCTL, ~MASK_YCBCRFMT,
>                                 MASK_YCBCRFMT_422_8_BIT);
>                 mutex_unlock(&state->confctl_mutex);
>                 break;
> -       case MEDIA_BUS_FMT_RGB888_1X24:
> +       case MEDIA_BUS_FMT_BGR888_1X24:
>                 v4l2_dbg(2, debug, sd, "%s: RGB 888 24-bit\n", __func__);
>                 i2c_wr8_and_or(sd, VOUT_SET2,
>                                 ~(MASK_SEL422 | MASK_VOUT_422FIL_100) & 0xff,
>                                 0x00);
>                 i2c_wr8_and_or(sd, VI_REP, ~MASK_VOUT_COLOR_SEL & 0xff,
> @@ -1353,11 +1353,11 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
>                         (i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
>                         "yes" : "no");
>         v4l2_info(sd, "Color space: %s\n",
>                         state->mbus_fmt_code == MEDIA_BUS_FMT_UYVY8_1X16 ?
>                         "YCbCr 422 16-bit" :
> -                       state->mbus_fmt_code == MEDIA_BUS_FMT_RGB888_1X24 ?
> +                       state->mbus_fmt_code == MEDIA_BUS_FMT_BGR888_1X24 ?
>                         "RGB 888 24-bit" : "Unsupported");
>
>         v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
>         v4l2_info(sd, "HDCP encrypted content: %s\n",
>                         hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
> @@ -1691,11 +1691,11 @@ static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
>                 struct v4l2_subdev_state *sd_state,
>                 struct v4l2_subdev_mbus_code_enum *code)
>  {
>         switch (code->index) {
>         case 0:
> -               code->code = MEDIA_BUS_FMT_RGB888_1X24;
> +               code->code = MEDIA_BUS_FMT_BGR888_1X24;
>                 break;
>         case 1:
>                 code->code = MEDIA_BUS_FMT_UYVY8_1X16;
>                 break;
>         default:
> @@ -1753,11 +1753,11 @@ static int tc358743_set_fmt(struct v4l2_subdev *sd,
>
>         if (ret)
>                 return ret;
>
>         switch (code) {
> -       case MEDIA_BUS_FMT_RGB888_1X24:
> +       case MEDIA_BUS_FMT_BGR888_1X24:
>         case MEDIA_BUS_FMT_UYVY8_1X16:
>                 break;
>         default:
>                 return -EINVAL;
>         }
> @@ -2172,11 +2172,11 @@ static int tc358743_probe(struct i2c_client *client)
>         sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>         err = media_entity_pads_init(&sd->entity, 1, &state->pad);
>         if (err < 0)
>                 goto err_hdl;
>
> -       state->mbus_fmt_code = MEDIA_BUS_FMT_RGB888_1X24;
> +       state->mbus_fmt_code = MEDIA_BUS_FMT_BGR888_1X24;
>
>         sd->dev = &client->dev;
>
>         mutex_init(&state->confctl_mutex);
>
>
> --
> 2.49.0
>
