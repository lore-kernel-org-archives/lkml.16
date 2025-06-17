Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72E7483
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750119294; cv=none; b=WC9fkLlN++VOjTaE4NnGWi4vrt1RgrxrC0yaxXZTLepc8FKvj1R9XEBuPxdVUWuPvVBKHD4T/uZr3oHEICHIM1MTe+hB9cQU+5Ee/fLv41DYCCYxPP0C6If9iMoKs4mg9ijYQqGr4S1h2+708QV7rMSGw6evhFupJZe4UEloPIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750119294; c=relaxed/simple;
	bh=7SrDLj6XmjtU4+fVEKPUOsrQn1rKnLtSHwFF1cUDvb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YksEYxTYqNJtuyz4Qmu4BO1DYA2WgG9kdgpYlhvUFivXU08oCry5SCJyeoX+Tiyrxl42x0HoME5YlhLuDGRO+/PXIEJngaP7/If6q0gvbGUO3ucXf5F+ugq0ebLCWZ1alAGXrSVe4PXgoszBr1DwolEf8aBjWzB4jxDEuf1JIrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gi6TGVAC; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gi6TGVAC"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7485bcb8b7cso4040537b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750119290; x=1750724090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tdpbl3k/YSmDDGdsuwN+GlqcV59+7D5igTv++Q9dI5Q=;
        b=Gi6TGVAC/fRL/FwSQ15jpKLnr81MYZSf9FRIYtmij5TrQt8VfPEd0kSkZGrQr9j9zs
         ccwzZFIwteA+/rJASPYGV6u0u6Ya42FMYZkXCIVJLlc8BW5Os4mznTsZrPkR/Zgwu4PF
         v//BCfdxh5upo6+/HndhjU5Lt8ko34v2fojjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119290; x=1750724090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tdpbl3k/YSmDDGdsuwN+GlqcV59+7D5igTv++Q9dI5Q=;
        b=kz+mg2mttDD9UWZxyshIJdSZyhBB6MM+9vaPJnqXO3nSXkqO1SeZYWJml65QJqQRpg
         JWQ3wlj1hwK/SacWHjvdoqX9BUttxAsFLts6qTQ3pDFSA4v/DOdheGJ2V51bj9EV/7pV
         1L7l7LXIne2DB/MbtexToif2kLfJtTbw+3t0+q5HPIbJLhy0VdBU4GjHLhaPGYOM/Nq8
         gqv0PJXL3LK9Ymqa1ZNl00wbKTfE1jWoagQ/3uX/0gsNEVssFfQR2O/GkTmSkCKiHWxJ
         zqr5s36w6KiR/tYrwt62JREULX34uJvc+C3kE/E45+ttJgltQUuxb3qA+IvHCoW+6xWC
         iynw==
X-Forwarded-Encrypted: i=1; AJvYcCUZDmPHEkygdwlBUDor7wJlCk0RytqcSxdSq1zducu4C2SIKDjNxisPKK28VXu4xaOeOcZkDy/e7ONSYNI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3w593ciTCQEUl6rxy5cQRxy0l0HA0jlU8zB2AOBzEnCKtq/5T
	+hsatmd5Vfx1Ele9fpiVmtpV5zjX86LKlI8xMqDQP0YYh5si6kam/mckLMGjRSsMEgAMFPvgpDl
	JNaM=
X-Gm-Gg: ASbGncuioOxOvQQakDO4/8IZFoEFt6rwMR0Rbg+RQTRwLICEXlSeIfjia2+K65rqGcj
	Npv8NbZwqUTiixsSIrnKnbyr09xAWoMwvSFn6LOrTFOZ6tZdGk4wKK+uJ4AzA2w4HgKJMHrezpE
	8ARlwzOor2g/JleW6f4XYIfhS3j/BZ2K4W+EQV7dGkx2ViUPQrvEi3AdmUkddlq2aNddD/Q/js2
	LMXFzKI1w/Yl0KOb4e9vOOShbpfOQG0Fw+BROuSTTEBozMqngxGaZbR910KUfrpthDySSbb+TzH
	/DXj9wfvGswBTxyG4LW9WkYr6tAxymBhsFDggs44BUT9VzqAB2EEZgKZ74cLodN31Ihr+XDey/O
	xvd3xjt3SAsZgZNbImhr+GTo/TdA8UMxi1E3e/KBe
X-Google-Smtp-Source: AGHT+IFg2YAw95gC7mWTFsJz6FFH4gE4PLpaY2hhoU56QGhy5xdk4qWLv9gB/6qk73Y8U/jVLSBi8Q==
X-Received: by 2002:a05:6a00:99c:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-7489d02e3bfmr15971076b3a.18.1750119289558;
        Mon, 16 Jun 2025 17:14:49 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com. [209.85.215.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489000749csm7774425b3a.68.2025.06.16.17.14.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 17:14:44 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso3445448a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:14:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULdUTaGKQVq8ZqFwz2HKF/0/9q80e9ayTNkMeNN2zlQ5Qv+Umf1ZewJIiZL8kYJE6ytkKaGy/TTKL5XRM=@vger.kernel.org
X-Received: by 2002:a17:90b:5104:b0:311:ad7f:329c with SMTP id
 98e67ed59e1d1-313f1ce5cacmr19759622a91.18.1750119283755; Mon, 16 Jun 2025
 17:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org> <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 17:14:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXCkqWmKT-bA5wqtbUy0nFRkewyApAkAx_1OCGAXV9Eg@mail.gmail.com>
X-Gm-Features: AX0GCFuDw-NZx-6lsELE9bQYvQioo6Vrln5eCE046cB2GyvGfvnR5APAhOiGf30
Message-ID: <CAD=FV=XXCkqWmKT-bA5wqtbUy0nFRkewyApAkAx_1OCGAXV9Eg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 10, 2025 at 9:27=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Jun 10, 2025 at 5:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> > values") added new line setter callbacks to struct gpio_chip. They allo=
w
> > to indicate failures to callers. We're in the process of converting all
> > GPIO controllers to using them before removing the old ones.
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Looks like this should be fine to go through drm-misc. I'll plan to
> apply it next week unless I get overly distracted.

Pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: use new GPIO line value setter callbacks
      commit: 98df1626ae036c1ba8c844c9fd995ab8f23bbe37
