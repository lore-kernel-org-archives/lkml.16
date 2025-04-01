Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8672204F66
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518575; cv=none; b=aO3Fz02C5CxIVR4El09z5F7yE4wJeUop4eXkQ7s5NR0AbzZ2B3PMGGLDEVU8epkQ2EJriA8LlksuAsX4WYHSEth1G/wSpoRi9D7H1CKmbrMvvZemxMSqrQw2OeRQQ3iBFumLTTjVuvlpoqmkEZ9h03mqP4A5kdQSBmRNyQWpCrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518575; c=relaxed/simple;
	bh=WaAmYeGlXVLIMGYtadgDzWol5UWcmx6qZyJV86g3FLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsMoojJi2D57AWhMN/RE/OG+jeH42KN3xNdBrPjb6lWntLF6XlvFm9nqpO+wLbUrEVK9Yp+GIG27kbP9ZaPdz4c36GT0JrSwfoul5tlxsU1qLcwJddRLB+wwnYED4WOxWEy2MHgtRgM7k76NxynhCqvDb9mbo5BpOC459aT7KCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fjCrmTkR; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fjCrmTkR"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so590105e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743518572; x=1744123372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoKh3xRlz5mCw5TurAZL1ObVidlP7k9BL/bfJaoO1EA=;
        b=fjCrmTkR225EelhmGO7Hekaqxx7jrEsM0yLl7Kdl1PzZ8RltUcTyoxm9unNdTVU6qu
         Td1A4WbZnIAs/I/xjg1b317gJC0GJFKCL/UCUknTLVBJgWYxoo55AWNZfsdyt0a7C4+E
         fwXlEnQ4j8FKxAWaFM9F6XVRmMCpYK7UzfuVbKBf7hL/rZfYWun2YkLiAYX16GQmHTdL
         edgFdgMEQTom+ZILnxxu1GyFZYZ3V2NigfOoUfxVGfciKV0fy+X0iwgGNgSLWAHJhUNg
         Jj+Dwezhai6htH/J6/EszwZ/Jv59oAfW6xs4OXTEv2LFk4RVg5i5yOI4vvJ28rEbmpvd
         8+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518572; x=1744123372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoKh3xRlz5mCw5TurAZL1ObVidlP7k9BL/bfJaoO1EA=;
        b=APMQF8rPYoa7NKHxRPLFw50/vsjNFFBXwBM5GgVIugWOOv8VV95PSjkwRJ+fw8NEZ3
         Gz1uR8UyK1OxCvk+jlS6DJvHoy4A0Y9pjBbX9s2KU8ucBha17dP81Ev13QBa3LM3e4ws
         kXMulvRFRXaQGRugrOwRivy2wyVq3RrxGFw+Uj6ndTewC6EyZ8vee7er0XSbNi5VQO/Q
         Eic0J9i05gicxmuXIyCYP0lqdktVrxiQLtyXERdkREWW3wyGzSUJAL/0RT1pG6H5QwLN
         jPril9oi2MiFlmACRsJ1CwXZaslHkWvjEPYCyxGIJI4tUSm2aSSQCek0Ak29rH6PgPfo
         ex1w==
X-Forwarded-Encrypted: i=1; AJvYcCVJxdp9pOyFQvNbO5X6qVD3bkXTzhYZrE3B7ebISpPZRid34rGYshBhpPwEWuxPQ2NB4OenkqKaidxmY6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YySauywDHhixgZKCoV+yfFLD1PVzcuPr2irEIQwe7WThtC0MMxM
	L1NjhvgDz5NZ7HiwwnhBI+jHOVmDfzMGtryYIZlF44iV4+zVCMnQoxN7OWq7us6iE2TcX1n5+Wk
	ednxSu+wHcPKSmjvNe5qsG7qkMqScyCxmv9qS9A==
X-Gm-Gg: ASbGncsbLS4peyNv7TG8gHxxOYX3UNnyo+v+A5ZCHxwi4t2ObGPr+0Y+OwlooviIeLt
	J5PafPpWPWfVC+Ic/NqO49C+CN24LjbcktWMQivUfqe7VFe9Avf4DpD8i1F9HnNy9DiyPGIr1i7
	X2kOY8Hgbknk8vtKPSjLvxogeKD4hmQRxMJmtqlwvHV/ozDG5nLIccOsiP
X-Google-Smtp-Source: AGHT+IEfmhNL17r5nidNNv0tEQJKHtPF37KT698U/Xyea3ScXmWlnAbRZJLN1MOgu7vZBJKVLkZB3XPWxHnOGzPHiy4=
X-Received: by 2002:a05:6512:12c6:b0:549:9143:4ce1 with SMTP id
 2adb3069b0e04-54c0a4b5a19mr1146779e87.3.1743518572001; Tue, 01 Apr 2025
 07:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk>
In-Reply-To: <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 1 Apr 2025 16:42:40 +0200
X-Gm-Features: AQ5f1JpjeDYSzEVGoQc1OoMcPQRfFfdR7yZhH4_uZk30TzdP2JDK8Wf9AT6IIJ4
Message-ID: <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 3:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Apr 01, 2025 at 02:46:41PM +0200, Bartosz Golaszewski wrote:
>
> > Let's deprecate both symbols officially, add them to the MAINTAINERS
> > keywords so that it pops up on our radars when used again, add a task t=
o
> > track it and I plan to use the power sequencing subsystem to handle the
> > cases where non-exclusive access to GPIOs is required.
>
> What exactly is the plan here?  The regulator (and reset) usage seems
> like a reasonable one TBH - the real problem is having an API from the
> GPIO subsystem to discover sharing, at the minute you can't resolve a
> binding enough to find out if there's sharing without actually
> requesting the GPIO.

Hard disagree on the reasonable usage. Let's consider the following:

You have two users and one goes gpiod_set_value(desc, 0), the other:
gpiod_set_value(desc, 1). Who is right? Depending on the timing the
resulting value may be either.

For it to make sense, you'd have to add new interfaces:
gpiod_enable(desc) and gpiod_disable(), that would keep track of the
enable count. However you can't remove the hundreds of existing users
of gpiod_set_value() so the problem doesn't go away. But even if you
did introduce these new routines, what about
gpiod_direction_input/output()? My point is: the GPIO consumer API is
designed with exclusive usage in mind and it makes no sense to try to
ram shared GPIOs into the GPIO core.

Also: there are no non-exclusive GPIO usars under drivers/reset/.

What I want to propose is the following:

1. Audit all users of GPIOD_FLAGS_BIT_NONEXCLUSIVE

Outside of drivers/regulator/ it seems that there are several users
who don't really needs this (especially under sound/) and where using
this flag is just a result of a copy-paste.

2. Fix the actual problem with buggy DSDT

Some GPIOs are requested by GPIOLIB ACPI code even though platform
drivers also want them. Those drivers just used the non-exclusive flag
with gpiod_get() but we should instead fix it with an ACPI request
quirk in GPIO core.

3. Use pwrseq where drivers really need non-exclusive GPIOs.

The power sequencing subsystem seems like a good candidate to fix the
issue. I imagine a faux_bus pwrseq driver that would plug into the
right places and provide pwrseq handles which the affected drivers
could either call directly via the pwrseq_get(), pwrseq_power_on/off()
interfaces, or we could have this pwrseq provider register as a GPIO
chip through which the gpiod_ calls from these consumers would go and
the sharing mediated by pwrseq.

Bartosz
