Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5501F91C8
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448995; cv=none; b=gwPvDcZHT5NYaaTvaJtkf+PC8I2N1r6Urnq1DEpn3fAKEOAT3AXrGCoFddywlFId612oy640Hfohf/czLXUHNL4SQTLfg56O4q2xqZdkMcBSOBxfvXdC9Pe24uobmuWslR0GaxIfgJFFlQQjxi+WlwHTejT6ZSurZZK1m0wEAQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448995; c=relaxed/simple;
	bh=HYUXz0uTzbs4y12iQ7Hl8w+ODH8OZ50a2Wiu1UFClhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4FbmhWI2i5OJp2Fgn3PtR760fH6NZUTt+dDQnR1BjRZyk8kUXs4xceGxSk8P92PK0ijMUXTwaRsb0lG6KXGGBPRgPcOjMIsB0yKpgcJ22OCviFvZ+EV3Yt49uQaxVNswnniVs2FizAWYH2LK1CfiTtYe3XYEcURvS9jtJSM0/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8JneqtG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8JneqtG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2295d78b433so40927885ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746448993; x=1747053793; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=itsdfpxgqr9T28YDfLuBCV4kCGXrZvdi4BFAEN1n0j4=;
        b=d8JneqtGWk8KqfWzB5QXZvw1PXUqcQ//JGmqJbEn6Hbp3Q1oYN6jfKxFcC1ToKjf0Q
         b5EhzC9qRYqMOaEZqvsiAElHcxJUN0T1qrmTXByygoWV4vMTAaFqu1zb3J1z/32nsq5F
         6mNh0CZblkieXsR45zEvQzsKp8qyOtNNJESP3L6tdiiNAdgCahgAwbVRZMMoI/qr9dJ+
         Wm2TUgrVh+MisrZlxO+/2CQqU0Pfq0fNBlsaARFIiCIsbUgu7JGDnBeLFVkEGo9JFq5m
         v4OuJ+tkMUh4nbYi3YVaCu3HZ3MC5MIrxuv4arnYjneXC8rGAxFsrNAZ1+qGrrbPC/CQ
         CJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448993; x=1747053793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itsdfpxgqr9T28YDfLuBCV4kCGXrZvdi4BFAEN1n0j4=;
        b=KJxsNsCh9lIiIFjzufN5hMdq/P4dkLv8go9x57P/FW1+FglMX9NnarmW6TVuGS2a8H
         kG0bDXK95hVEaUdQl1kmjuoza1aRJS/buZlRfS9paBzvjN+tRZYGERd4G0OIM295mRAS
         o8/s6y7sGBrf/1ieyghOYwcBEDITvs2jz3pONaTI/9zTC0V6H6WxBqHuSjpvXB51989K
         s93EhLHscDwmV9wSuprO4iHFEO1E8NA5eoKXNTJWOkXG90cp9RTjHrunzNPad/3Y5S3/
         0pZs8JuuXwUS0DT7HvEJRGfbg3R5+/FthMHp/5PszvpPilbksDxDWa5aHSyspThuf3/9
         t1zA==
X-Forwarded-Encrypted: i=1; AJvYcCXGlSL1BhERKg+hRF/AX9RMUD5NndkWHaqd2WIp81j3TdcLLuK81TY9FLsN++kmPGuwmhOSRWffqJkSFNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUo8kisXWPsbVyxHpD/sKzvFDecZyAJkwPvmZKkQAzHGGhxlfm
	YhbwauFucTOrIotH3eQAVd7LgUfa8iznuotDkypvVVyivBI/Mz7G
X-Gm-Gg: ASbGnctlJWEAHyiwasryHSoZfv+OLT4byr+1F6UftVpWXVMcTEGhNC0ODE4izAxBla2
	d71/cG3/VLM8orVLRMBwPwwPxc++AQQ0WYdT5mKv+ImUhPIn/JRwFVpfIiLc1AU9VGnhtz9qEG5
	/UhDB8T66EYH2RmGHffxNQasfG7Q6J6Qc3KITDnSRk+i4pCDKAW5h8g0+3F/ZEuHLP5nipWHpf6
	cECATCVtpov622p205+kcv39ANA0evXz8QGbALUBoFODACZSnk4P21ttXV3lBwqx1E1wa5nYepL
	sDUi/iDJ9Td3qexKKOmk8gb+pHo/YC7pSnszxsnpdOFn07/9ftCjQQIOY9pnDxB18d4=
X-Google-Smtp-Source: AGHT+IG2KkrrZuW4JZYAu2SgF1mIQ5x6uKuF20k8DiGK8/U7q4/P+FzZt88l6w+tkDWWksMwAnmVlg==
X-Received: by 2002:a17:903:2f07:b0:21f:45d:21fb with SMTP id d9443c01a7336-22e1e8c1dcemr101041235ad.3.1746448992997;
        Mon, 05 May 2025 05:43:12 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:bd19:74c5:b39c:cda])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e194aa391sm41645485ad.154.2025.05.05.05.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:43:12 -0700 (PDT)
Date: Mon, 5 May 2025 20:43:06 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] drm/meson: Cast mode->clock to unsigned long long
Message-ID: <aBiyWnKKGMpMYnJ1@vaxr-BM6660-BM6360>
References: <20250429190724.330883-1-richard120310@gmail.com>
 <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
 <CAFBinCCL6OQrbQ_UY_nhnbodN2TquuKPk9unhp3YjpR5u=EXag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCCL6OQrbQ_UY_nhnbodN2TquuKPk9unhp3YjpR5u=EXag@mail.gmail.com>

On Sun, May 04, 2025 at 11:06:06PM +0200, Martin Blumenstingl wrote:
> On Tue, Apr 29, 2025 at 11:00 PM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > Le 29/04/2025 à 21:07, I Hsin Cheng a écrit :
> > > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > > integer overflow. Cast the type of "mode->clock" to "unsigned long long"
> > > when utilizing it to avoid potential integer overflow issue.
> > >
> > > Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
> > > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > > ---
> > >   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > > index 7752d8ac85f0..fe3d3ff7c432 100644
> > > --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > > +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > > @@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
> > >       unsigned long long venc_freq;
> > >       unsigned long long hdmi_freq;
> > >
> > > -     vclk_freq = mode->clock * 1000;
> > > +     vclk_freq = (unsigned long long) mode->clock * 1000;
> >
> > Hi,
> >
> > maybe, using 1000ULL instead would do the same, but would be less verbose?
> Agreed, that would make the code more similar to drm_hdmi_compute_mode_clock().
> The goal is to switch to drm_hdmi_compute_mode_clock() mid-term anyways.

Hi,

Thanks for your review and suggestions !
I'll make the corresponding changes and send v2.

Best regards,
I Hsin Cheng

