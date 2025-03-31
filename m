Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7519E7D07D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743460847; cv=none; b=W9iSRWpWMg1dN4njV/FwfwGQ0URqMSm4/lzQYza/OJQ8+4afXc9alSMvOqahBszf8kv8veK1cpzxnuPgu7N4b3YnJ7yTSvCFyrkztzj7cdSR14Lft3Qol6VmGPJ3VGx790goF9W1zow4jxMGE3EThZ+LenA5hz87ustB8/g6pi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743460847; c=relaxed/simple;
	bh=tXqRqXowsU7XunEQdMvzX7NJWL3NtObw53Bzh8tLBDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyZIihViW+AN5n3TtDVReteWjcwiNx2u3Hfkasvtd5i/Tc6r6MvW7HUERveJtVu7Cr8SU4r+XMQmQLVWhoE+aYdlE94LinhjdtAWiZXA/Z7uldy3lcgCo0imx1yXtU+9XgS97pKKdy1YPoKJHvdRXBRuOJAbsdM9d99lKL1G1F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K6byX9oa; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K6byX9oa"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso5599923e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743460841; x=1744065641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLO6XpWwJP6wry6Kl4202qxPqF3pJF3nyfU3KzxEbD0=;
        b=K6byX9oa/tA8pz6SzuY6j0SbAW2GB3AwyL3tRD1Kt5BvOD7WBhTyZioejBiWGjRd6l
         KJ885Tl81wqHXkqp3MszQtuXQXJaGFtdDxT7OdakoJ82g+0FDv9nxEEgvg9FhukhiHm7
         jGruxjo0jB4PPEyKOI5mCRbbquWTlhiKcUHMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743460841; x=1744065641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLO6XpWwJP6wry6Kl4202qxPqF3pJF3nyfU3KzxEbD0=;
        b=rB4sxwkm3hjxkaZyOlzGIlA+1od+gOhThBC240SrXzpVou1rvwQaUsAv88fbm0TTF/
         QeRgb4HMXTtDtrGankWQXc8p/T78RcNfvTVhnFyi6SCeHol4u1iHfr9OxNGsuuWJN4xm
         v5Ih1/8jHrfkcvdcfd5UNWm0y0w6lDRGh9KjV0FGzayep8tVy4eIl3lQkpphlUyL2yr6
         wE4EsO583Oxc0ztUc71bhdf91JSOlsNpT/Qzm4RmCuzdQNss47pn3+PmJxoD+f7D7bF9
         Enrseom1JRQvIZPoqKpJ5sZhziOozUxitaPmB327+wYf2YLb+5lEYgPOv70NgDQzQUZn
         6GNA==
X-Forwarded-Encrypted: i=1; AJvYcCXJL3RDutZ2z363wN2tS1LIvvTrcqM7Z/9VpZvNcYFgQ/uYwQpRax+E2KUrefdx+idccP5S91+ZuZAcW7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFlCVmJ0lKxSFF8a8lbh6AmjSP5wUfr9jzHmmL9S8BMqKk5X9x
	iP4PWDMfVOIguWZ7qucXFmweaLp5TdUYGOnJy8Mivwf3zY5BILzuLBojHAlzEw26iyrVKMiDD/N
	lRw==
X-Gm-Gg: ASbGnct8aKDdiFIi3eKGRDA4EcdLPXxP2ucC6jWxvlCyAAG74sJErBffOOZQ9JEEPO+
	y+0Dlvy4OR9fFnVqvEQziS8QBV2b5g2HjoopoQCphhGCBi6FgPTAr/aGXfqPSqsnUZWe1LcB5Oe
	3kGIDy7aUelUxz7IKBOde7isMDMDSZqlUVAGTYn3QN9ikhwxfzsQPhNyye7OORywuhwSuvBpxyb
	d0ULCcFloFHeBBHZ8qE7UgnUBREApSYlIMhqRm1m0FtBeDVPz+lq0xzUxBf6uKG5yX9Q15D/puQ
	6/POnZiDQKcfUTnmOjoF9X8O3k2kwAzRHg9OonjE8v7P1qv0MJyWCYkRnaUej2ZXYYyklBj2xT0
	yIjBOnq45a39A
X-Google-Smtp-Source: AGHT+IGEx95a6ml2TQgZLv+cIhkKvKwJGhcngAQh85cAJSLF2JhWRV5RIX4UoJVMtbU5wT2+G13T3w==
X-Received: by 2002:a05:6512:224d:b0:549:9078:dd4a with SMTP id 2adb3069b0e04-54b10dc8233mr3002532e87.14.1743460841150;
        Mon, 31 Mar 2025 15:40:41 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a0cc4sm1196176e87.226.2025.03.31.15.40.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 15:40:40 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bf1d48843so42836611fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:40:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWR1VWW+QgqNhY2QQxB2X+GCNA1MUPWIu8sm20c9MTLwIVA3fh6uRWt/tSsQfOu0G2Oe8IGZxZAOwymCiI=@vger.kernel.org
X-Received: by 2002:a2e:b8d2:0:b0:30b:ed8c:b1e7 with SMTP id
 38308e7fff4ca-30de0266e3bmr28654361fa.18.1743460838770; Mon, 31 Mar 2025
 15:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
 <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com> <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
In-Reply-To: <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Mar 2025 15:40:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
X-Gm-Features: AQ5f1JpOrGXDTZ_nS7pJWSblyYvrcC_GXOuMLBACzEl5VhUwUaaZ1leG8b3O40k
Message-ID: <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, quic_jesszhan@quicinc.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	asrivats@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 31, 2025 at 1:28=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Mar 31, 2025 at 08:06:36AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Sun, Mar 30, 2025 at 11:18=E2=80=AFPM Tejas Vipin <tejasvipin76@gmai=
l.com> wrote:
> > >
> > > @@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_pa=
nel *panel)
> > >
> > >         ret =3D boe_bf060y8m_aj0_on(boe);
> > >         if (ret < 0) {
> > > -               dev_err(dev, "Failed to initialize panel: %d\n", ret)=
;
> > >                 gpiod_set_value_cansleep(boe->reset_gpio, 1);
> > >                 return ret;
> >
> > It's not new, but the error handling here looks wrong to me. Instead
> > of just returning after setting the GPIO, this should be turning off
> > the regulators, shouldn't it? That would mean adding a new error label
> > for turning off "BF060Y8M_VREG_VCI" and then jumping to that.
>
> We should not be turning off the regulator in _prepare(), there will be
> an unmatched regulator disable call happening in _unprepare(). Of course
> it can be handled by adding a boolean, etc, but I think keeping them on
> is a saner thing.

Hrmmmm.

The issue is that if we're returning an error from a function the
caller should expect that the function undid anything that it did
partially. It _has_ to work that way, right? Otherwise we've lost the
context of exactly how far we got through the function so we don't
know which things to later undo and which things to later not undo.

...although I think you said that the DRM framework ignores errors
from prepare() and still calls unprepare(). I guess this is in
panel_bridge_atomic_pre_enable() where drm_panel_prepare()'s error
code is ignored? This feels like a bug waiting to happen. Are you
saying that boe_bf060y8m_aj0_unprepare() has to be written such that
it doesn't hit regulator underflows no matter which fail path
boe_bf060y8m_aj0_prepare() hit? That feels wrong.


-Doug
