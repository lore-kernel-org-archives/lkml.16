Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F403C1E8837
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738253081; cv=none; b=hXfA1UQq7maczqMEFHV9IPIhlkKdxCxo6dqURO+3dKxVVjG3vKZG2+8oZyjxJnYEEAsL+l5r21tbIxTAWoj0yTXVhU9MQanqVI+gTAp3Yi3spCspob7vTb0hJOd4+eHgqbulsIN6rrkQaEkezlKJ/+BpHJ/WYjhSu6RZih4KTEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738253081; c=relaxed/simple;
	bh=1RV6NlImWMNVSEpClVD7MX8BT7kXytBO1h9bFukv/3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYdAT0FvswPx9dE0XrhNwKW3RkqGIDZEmtwVmPzPieBS5jPcSnI2JA84Cq1Wf259uRLDU4Oi04DA0V1X+f/IYHv0Supw6EYhgSctsS1+6620fONf6ulTpVi40iFk0DmDy9shpgzW5MYQuweCz796oF9a6QSOoOOR62dZUKmCQMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=hwmZHeAp; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="hwmZHeAp"
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2FF4C3F43B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738253071;
	bh=DdStTEajIelfR7AL4b2VtQBKKCsYPbVQwJ/gEBmQAGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=hwmZHeApQuf/hsKxrF69TYHYMTdmmI0KLVPohdQ3ttVTr984gC/t3WZXjMFeK6e4C
	 OvvGBJqE6uXt94cAEvatyyq4UM40R1LGEntNVGx4mMXwQr33k/dgeq/+okENut8daH
	 XH+nl3a0pN1oCfaWPIFIEq3t2QeP7Yl7keWZmBuKyVwmwBfTPtXdNPBKR3mxGcTq2C
	 feZeqwJ2XO4kTnI1HQNOU9cosDj+zXhxSDV7qmwPizYbLT7Yp/q4crXbL3AYaqDZcs
	 W9HPXbHQoHjSZKwD6ryBWTKmR+t3e1l9KJlDKLRFlGDZ5aQL4WKSFNB88NyKZET+iC
	 UEswFxCB9GyiQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so1860739a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738253068; x=1738857868;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DdStTEajIelfR7AL4b2VtQBKKCsYPbVQwJ/gEBmQAGE=;
        b=k3VFNzS4d3ieJ5NNN2Pz2qVbepIexwzOdgdcI1JXFzebAgOV36Q3FyTU4UNGLVcjob
         QgzGYi5cRC3y36t0klnYc1k+yU5GOPBalnda7sxvbk1ewbMgR1J3Gn0dxrCWbZ5NXhfG
         MlLE3IAXC0USECwVsl/16Gp8pTUFdSc6LVOBGKwqQrZjdnxJsHVp0bhVdS3amVv2eryL
         k+CiRLGg52g9WgRDQyftnBLypxHKRL39iC/m/2yR0sq56pOuyHbJxY4UDJpZ30U3PlpN
         6nlE5k/TANhy0emrWwUvWrNJTB0CC4iwKY6/iD1N9C2cp8eqa8FLNFsh6zym8DZHbcBH
         AaMg==
X-Forwarded-Encrypted: i=1; AJvYcCUW57U1GvQSU1KMROjt8u67LJG3lKrJiFrkunp3XaIjYvEICxkcGSgkiiFJDBOt2QN0MkEXN9dNc7B9fKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUD+wh+4WUlZiGvadPk9r/8pXjOLJm7zbmmCb7ZvwwhomUwuy7
	vbzbrv0FNySGKvb1ZW7wGv/tRx+dd/ioxsTnATZdfs4rm1P7s4RvAStIlDHjGIDyyOl/8NAwS5B
	MAlY+p+TrbgXxoKybvlTAG10jxMXPslXa+zQBIPmZaR3lVmt6eyuPmQhSn4vbw9UU+oJqwXIkB+
	Aa2ejmxdJpFw==
X-Gm-Gg: ASbGncv+IplF1ytM+/v5HILiVnD0TnRCewcYev7ZhVjrYPkFhUJvt09f83Cs2igfz51
	xScG5Rq0XTGAB+LUEsgK2+9eDAPfV5NBQROFxEWmstlSdJD/bXT05eoaHUzjjAZ4rUCNsgrYwJy
	Eh/PYp+fvmyJM9ON/tuoWJe50p+9xp8V6TVHUR+1eVqKnkiTqDUVsyPtGrKISG43Frs8cC9HQ/p
	SvVF3T/q0oeiIjKg85jsXXrDSiVXaUvF4R65ux02R6sq4PgD2VxyEGe7jB5Vo2gM0jfs9Ag/Zcq
	Q8muJP8=
X-Received: by 2002:a05:6a00:2d1b:b0:727:64c8:2c44 with SMTP id d2e1a72fcca58-72fd0c67aa6mr10535777b3a.19.1738253066609;
        Thu, 30 Jan 2025 08:04:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/bczYSaqBe4gXfLSbdQfEUz5lhItOwc8MfpIsCWFahaGB/80iN04rCDIpbMBqoYSLzekpbw==
X-Received: by 2002:a05:6a00:2d1b:b0:727:64c8:2c44 with SMTP id d2e1a72fcca58-72fd0c67aa6mr10535700b3a.19.1738253065779;
        Thu, 30 Jan 2025 08:04:25 -0800 (PST)
Received: from localhost ([240f:74:7be:1:997b:dcb6:3fe7:2ab1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cdda2sm1614914b3a.128.2025.01.30.08.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:04:25 -0800 (PST)
Date: Fri, 31 Jan 2025 01:04:23 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>

On Thu, Jan 30, 2025 at 11:30:59AM GMT, Bartosz Golaszewski wrote:
> On Wed, Jan 29, 2025 at 4:56 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > This RFC patch series proposes adding a configfs-based interface to
> > gpio-aggregator to address limitations in the existing 'new_device'
> > interface.
> >
> > The existing 'new_device' interface has several limitations:
> >
> >   #1. No way to determine when GPIO aggregator creation is complete.
> >   #2. No way to retrieve errors when creating a GPIO aggregator.
> >   #3. No way to trace a GPIO line of an aggregator back to its
> >       corresponding physical device.
> >   #4. The 'new_device' echo does not indicate which virtual gpiochip.<N>
> >       was created.
> >   #5. No way to assign names to GPIO lines exported through an aggregator.
> >
> > Although issues #1 to #3 could technically be resolved easily without
> > configfs, using configfs offers a streamlined, modern, and extensible
> > approach, especially since gpio-sim and gpio-virtuser already utilize
> > configfs.
> >
> > This RFC patch series includes two commits:
> >
> > * [PATCH 1/2] implements the configfs interface and resolves the above
> >   issues:
> >   - #1, Wait for probe completion using a platform bus notifier,
> >         in the same manner as gpio-virtuser.
> >   - #2, Introduce a 'live' attribute (like gpio-virtuser/gpio-sim),
> >         returning -ENXIO when probe fails.
> >   - #3, Structure configfs directories to clearly map virtual lines to
> >         physical ones.
> >   - #4, Add a read-only 'dev_name' attribute exposing the platform bus
> >         device name.
> >   - #5, Allow users to set custom line names via a 'name' attribute.
> >
> > * [PATCH 2/2] provides documentation on using the new interface.
> >
> >
> > Koichiro Den (2):
> >   gpio: aggregator: Introduce configfs interface
> >   Documentation: gpio: document configfs interface for gpio-aggregator
> >
> >  .../admin-guide/gpio/gpio-aggregator.rst      |  86 +++
> >  drivers/gpio/gpio-aggregator.c                | 673 +++++++++++++++++-
> >  2 files changed, 757 insertions(+), 2 deletions(-)
> >
> > --
> > 2.45.2
> >
> 
> Hi!

Hi, thank you for reviewing.

> 
> I love the idea! In fact I think I floated it in a discussion with
> Geert some time ago but never got around to working on it.
> 
> I just glanced at the code and it looks nice and clean. I'd love to
> see some more improvements like using a common prefix for all internal
> symbols but it can be addressed in a separate series.
> 
> I played a bit with the module and this is where I noticed some issues:
> 
> 1. The sysfs interface must keep on working. The same command that
> works with mainline, fails for me with your patch. There's no error
> propagated to user-space, write() returns success and I only see:
> 
> gpio-aggregator.0: probe with driver gpio-aggregator failed with error -12

It looks like the issue is caused by gpiochip_fwd_line_names(). I'll fix it.

> 
> in the kernel log.
> 
> 2. I couldn't verify that it's not the case already but the code does
> not suggest it: IMO devices created with sysfs should appear in
> configfs.

That makes sense, I'll add the implementation.

> 
> 3. I don't think the user should need to specify the number of lines
> to aggregate. That information should be automatically inferred from
> the number of lineX attributes they created instead. [...]

I agree that it's essentially unnecessary, but considering the current
state of gpio-sim's configfs, having the user set num_lines doesn't seem
too unnatural to me. What do you think?

> [...] Also: if I create
> a line attribute without setting num_lines, the driver just crashes.
> In fact it seems any discrepancy between the number of lines specified
> and the naming convention of the line attribute causes a crash.

My bad.. thanks for pointing it out.

> 
> 4. Writing 1 to live, when no lines to aggregate were specified, should fail.

Agreed, I'll address this.

> 
> There's probably more but I haven't had a lot of time.
> 
> In short: I'm very much in favor of adding this but it will require some work.
> 
> Thanks,
> Bartosz

I'd appreciate a response to one question above. I'll prepare v2 after.

Thanks again!

-Koichiro
