Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33C31F3B9E
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739051662; cv=none; b=XBHy1T6FU3Q37Vu8LoZFxipXBPxXSDx6nZWLNgbyqKzt0EpF2MuuAFZFB9UuPC16Zg8ijc62fV7qDBdZmY1FVaJq9+N/yH8eOeIP/VzAw80kGcurNhj7ZEgBIbFrCa3DdQa19yy4SUlyY6Im0FfOgoHW5vpbZMNdMsNCWPV4B8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739051662; c=relaxed/simple;
	bh=F6UnkgC5BQCWkm4444vfgxVxjy3GxcxvEs9Mpg2IQcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUq5kNSCgjf0m9b/8ekXKsPri7cuuXyaFqw/OkZrVjDn6EUGWCALuUBSJ3IzycNPiil/n0GJ78eMymbRVsY4etEMcA/fx2zFdstW5l+p/fBTaC9L1p4L06+lIhHDymnHYMvL/pxnF0HYoMm2oBGj43FIqTwthZf7gfd8qgnV/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tWPxsbxr; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tWPxsbxr"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30761be8fa7so29157181fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 13:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739051659; x=1739656459; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+IUlttlBGiwOKNWSHl5RMZ560JvRYW645eqTcaf0c80=;
        b=tWPxsbxr9HSy5BMXiGN+4bdquizkQ48IfazidZxueAzgJP01HuaTCfWxwAha/FYqyy
         Hgui5ocPFeMtKNwf8OUwQCC4ETF9ZOIN1gd6KPvE8jhBaaleX4ojYza96r6I8xE/zRmc
         kVhgcgprVnkbGC5pleqrL35nTD2Gaet0F4BzacYiNwdFzrttFm/Zsj6/is/LfAVhWIAd
         KGpkRA5rVjIFvuHHh4OswFHy9OnlM/SKJMoeFgtnlfwYIkOLk04RZRiChJHLP8hzYdfa
         UcGau/fARe/xZ6mSOv1V/Gz1HzHsLdz6N7ffY+lT7IMjgkhU0v69zVY8PxpHHlulNe2J
         zD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739051659; x=1739656459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IUlttlBGiwOKNWSHl5RMZ560JvRYW645eqTcaf0c80=;
        b=pvlujx4Wsl034VVyeaBvYhjWQN1hlTX5msUZW/qMhhYF3F7CR6+4vk2b5RUW2pata4
         jF1POiTQJlSFmwxeoSzhY+hfumRNersH0ncA3F7HC08Yqe8qJVJfnSrtKbHyUYwXqQb1
         LbaxaFQKxnDrqLjivI9QQrnRq6NOqk7frXUw4wJYXDfvR/wGBdqu0qz16fG9MqyqSntc
         1qz5iG9XIdVnVgCcW3JO0oc2lefDItXZzFJnlhCButQLzTHJBcHioUID60mdiTa/JrWr
         l+s9Cv9mG5B9gvOtVrQcdeYWw6yah7rsgDnFBrn8ADRYX4/GstuqyZy5LQqb2UsGaHoc
         RaMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO2eIh2+Hs4xIZM7Cs+INSzEtZp/cLg9umj7jVajrc88NLLnDfZsmABqWmy3tvA9Rp9bNkSu4whsaAS50=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDGDzMB6VKDJ5S+sb22+glNuVi26fx6btIV5IhkuOrHPFvNOC9
	avzYyWjO72/ZHm3bac5uWqgq/Tw4kKhW3FWNCgpyAHBonHrOayxtFBHJWu/fDgs=
X-Gm-Gg: ASbGnct5cQDJgrPzhyTTeYujRqpcMJs26hTbpRW1pCO6mppjLZtcnyJlKI+JjJuXnuz
	7VuyJMaUQQQbdyHjJJl0K7LoVZVEj/JYQG9pYcMFe0jn5wCl9KF7m2uFY+A7sZK0ioYsji9hqEY
	qaBt3YDzRWD8x04POtHs6e7T7ihyw+tkZ9jAd2/Ab8x59j/OmYuNEU0UykGNJiZhJCa7240vlqf
	ArVVHK+SyPGkfY/6c7McGJY0Eu4HYl5pO+C8rrRa7hKa03srePDLSgb0kf8Y5Xp3HiemyD/Sh2D
	pXpuIyFDPiBdj0h61ywaQXelVjS3P1vqJPrxSr9HM/VxsCMVh153bVDeWQAp8SVr8XxjToE=
X-Google-Smtp-Source: AGHT+IHJfBJuM+yjPz1NXD1IyLdQIvQdw0Uqz8vdJkManVm1y5kWHyb3iHB1vHQ9kc9WY6rbefjp7g==
X-Received: by 2002:a05:651c:241:b0:302:2598:dec2 with SMTP id 38308e7fff4ca-307e57fedf9mr29532621fa.14.1739051658561;
        Sat, 08 Feb 2025 13:54:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308dea6ab59sm3127321fa.24.2025.02.08.13.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 13:54:17 -0800 (PST)
Date: Sat, 8 Feb 2025 23:54:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: visionox-r66451: transition to mipi_dsi
 wrapped functions
Message-ID: <j2uxa226jpttxlzycqpxya2zh34k5uvr2zyy7dhj3xjpouiybk@td6k2ebx5ji6>
References: <20250208051541.176667-1-tejasvipin76@gmail.com>
 <CAD=FV=WmOhHq4qQ5neDjfBy71za3AguvtQ9hFnwf0hwtwSmiqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WmOhHq4qQ5neDjfBy71za3AguvtQ9hFnwf0hwtwSmiqw@mail.gmail.com>

On Sat, Feb 08, 2025 at 12:18:47PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Feb 7, 2025 at 9:16 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> >
> > Change the visionox-r66451 panel to use multi style functions for
> > improved error handling.
> >
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-visionox-r66451.c | 179 ++++++++----------
> >  1 file changed, 76 insertions(+), 103 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> > index 493f2a6076f8..81d615e1937a 100644
> > --- a/drivers/gpu/drm/panel/panel-visionox-r66451.c
> > +++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> > @@ -42,85 +42,84 @@ static void visionox_r66451_reset(struct visionox_r66451 *ctx)
> >  static int visionox_r66451_on(struct visionox_r66451 *ctx)
> >  {
> >         struct mipi_dsi_device *dsi = ctx->dsi;
> > +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> >
> >         dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> >
> > -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
> > -       mipi_dsi_dcs_write_seq(dsi, 0xc2,
> > -                              0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00,
> > -                              0x09, 0x3c);

[...]

> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x19);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x42);
> > +       mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> > +       mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, 1080 - 1);
> > +       mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, 2340 - 1);
> >
> >         dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> 
> I think that to match the old behavior the most correctly, you'd only
> want to clear MIPI_DSI_MODE_LPM if there were no errors, right? All of
> the old mipi_dsi_dcs_write_seq() calls would have returned early in
> the case of an error because of that non-obvious control flow.
> 
> I'm not a total expert on MIPI_DSI_MODE_LPM, but I suspect your new
> behavior is actually more correct, but it might not hurt to at least
> point out this change in behavior in the commit message.

Yes, I think new behaviour is more correct. We should drop LPM flag
after sending init sequence.


-- 
With best wishes
Dmitry
