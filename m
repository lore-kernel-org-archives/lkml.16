Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0E21A00E7;
	Wed,  7 May 2025 05:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596832; cv=none; b=V2Ro0dOp8FS2aDxwsWixhssGIhSriHZvrVE0cHhuypArqd5MjJN2xat10yQuctA4c59dCmBXIMsgqhZOAkl94kcZWSmE3H8PJ1W/qUK5cNlRiQ5m8d5KmmUGqs1c7U/9e1W4f6XtiEsXkIbFy7ZS+tii42rV6WnOzlXcc8wKhaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596832; c=relaxed/simple;
	bh=O3d7vwCPdLbhv5EPV1ky2qGUrqEyeP/U/PqjnMu36Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMunRWKqPGZEFnFrqeQ+N/V3B8ioqUX9ZCyZi8XG2iWKQwgJQemzD8X5X7d9zPVfK81z9t4a+JKChYJ3liFPpYhFEWPkQ6Kknq3Ivlti6Xen8zeHWZpV9fVYgptn6vhd5tKiglGoQKLW5j8Pf7oFkIJNnhFGyfhikRZu/EkhvFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUHhDQwM; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUHhDQwM"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecf0e07954so101632336d6.1;
        Tue, 06 May 2025 22:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746596829; x=1747201629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sr/EBTQG4/UwFZx/KYi2kLPC/6miYByKQl01Eq8yNq0=;
        b=AUHhDQwMdy351X3lE2Evr7TFTttGh42VfhNsOXHyzK9vILeH7C6s+YFQ46hHivOb1m
         sI2etstyRczyArkyfxDv3u2WwgjC2/WUjIrHOI0UCcJsWhpu7+RHdgvGjY90XgPZNRyH
         1wmYJwd4zvcvMN9aUuqlNP4qWNXXAh7ahL3AGDofNRSlWWg126QfHbKkfTJ2kMyQapYA
         vFzsJ7j5k4pfz1LpUX4621fCcnjcWC/ZW0WMekwWBSaWbUlq6KnujOfuqZc0TUZxails
         /28ZSwvUpLKsStge9z4LSvlWJ/T4N/QEXY0gUGCIxeLj/uZpZk/S0dcb7GiEIcdCLBTw
         2FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746596829; x=1747201629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sr/EBTQG4/UwFZx/KYi2kLPC/6miYByKQl01Eq8yNq0=;
        b=dDqBRK67JGYKRXiojpK6+aLnE+mki07v/+JOqIUslYeNW1jQGC/Pj+1km+KuflFnEh
         M57ZsS6wNhhXDBcQDrf37z4p8xC2BFK1nUYviyd2R+luHoAJPyFYtAKEPEhcIodhEvqJ
         ulg434CewTtZv53ej5BQI1JKOdU7ZRmljBHrw/y+19T14Zw3IMhFxNuLqY4/gmilIr9L
         P/TZ5PMxxHmdxKLSX0orDx+P9Y+tqm66Z6SeGfXqXNbJGZ8GG6AYXQ4okgjc32tCEnym
         3dbrA+pFJCcHKELSCYmQ8JZnj8s6xedQjPjrSwAXzWFjWjgdRCv2Po39Fxmma8XLo0vq
         qPzA==
X-Forwarded-Encrypted: i=1; AJvYcCVOvfJPgxeurZSrYt1d/SnY7dBD+xMPAa9qy7V5bw625WzamWos+4N+D/tFJyiMWcdkOXnr2qI3bw7P@vger.kernel.org, AJvYcCXAJSbMdjnZk6qFWgDkYNwdJZG+YcTDpNqHM1MgIsS0zANXju46EcSi1zRrXU99zcie/ej7pnK7d715p3J9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2dQB6l3RZhZoWaFF6vCPPbTH2Je7qnZHsXYFUikcNst04y/3s
	0xVh4Hrbgjv/OK3GeKyOQjtOhdVd67GXUUiCeVn77bfR/eFCEYaNJAn8IRl6H6Q1xmJAlirMDK9
	bAeK517a/08cn0z9e2VmzzIoVd5QfD39DgkRTfw==
X-Gm-Gg: ASbGnctfhzyjQvg8UghfrxLm9ozlq2QYWt+phjLVVfD+NOLjDAIRvbd9PrErf32CSX4
	jl8OJlzUniLIKJ7xDyfHKcEMqUv570J7n9NQEanFDKCXg3Msb0r4bzKMptANMuw9LbplWpFk4lf
	tCJdLr/5zkp+XiEYiil2cK2h2duq7Lbi0=
X-Google-Smtp-Source: AGHT+IH+l73WkllP0u4r7uaSDidXOWDrfnL+BIbC9V9jeSezy4B7RZaNnCkLw7jvUCpMubvtnuETSM/JFB2R3NarJkU=
X-Received: by 2002:a05:622a:410f:b0:48d:8053:df56 with SMTP id
 d75a77b69052e-4922795ddb7mr32129241cf.48.1746596817909; Tue, 06 May 2025
 22:46:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
 <20250507-vt8500-timer-updates-v1-2-6b76f7f340a6@gmail.com> <e05151a1-2112-497b-affa-d0e95c71b627@kernel.org>
In-Reply-To: <e05151a1-2112-497b-affa-d0e95c71b627@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 7 May 2025 09:46:47 +0400
X-Gm-Features: ATxdqUH29QtBVUIdEBGgpphpU7Cm3yGDAmRazAqGvFsGpNIyRjeSFbKTUq_yrS0
Message-ID: <CABjd4YzmbQj2eDKS1YvdZFzwzP0v=2dwPsPUqZqL9=Gc6zatFw@mail.gmail.com>
Subject: Re: [PATCH 2/3] clocksource/drivers/timer-vt8500: Add watchdog functionality
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 8:33=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/05/2025 22:06, Alexey Charkov wrote:
> > VIA/WonderMedia system timer IP can generate a watchdog reset when its
> > clocksource counter matches the value in the match register 0 and
> > watchdog function is enabled. For this to work, obvously the clock even=
t
> > device must use a different match register (1~3) and respective interru=
pt.
> >
> > Check if at least two interrupts are provided by the device tree, then =
use
> > match register 1 for system clock events and match register 0 for watch=
dog
> > respectively.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  drivers/clocksource/Kconfig        |  6 +++-
> >  drivers/clocksource/timer-vt8500.c | 58 ++++++++++++++++++++++++++++++=
++++----
> >  2 files changed, 58 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index 487c8525996724fbf9c6e9726dabb478d86513b9..e4f9aade058af1adc279274=
c6c711658f9f4cd0a 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -177,9 +177,13 @@ config TEGRA186_TIMER
> >
> >  config VT8500_TIMER
> >       bool "VT8500 timer driver" if COMPILE_TEST
> > +     depends on ARCH_VT8500 || COMPILE_TEST
>
> Does not look related to this patch.

Will drop in v2.

> >       depends on HAS_IOMEM
> > +     select WATCHDOG
>
> Drivers are not supposed to select user-visible symbols.

Fair enough, thanks. Will add a separate nested user selectable option
for the watchdog function and make it depend on both the driver itself
and the watchdog core.

Best regards,
Alexey
