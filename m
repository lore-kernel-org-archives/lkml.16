Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E3725F978;
	Tue, 29 Apr 2025 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956082; cv=none; b=P6Yq874zoWjmBjYXK9FM+QwTTlGxktMqyV+FD1uDLeTOQ4pGwZwCIdKOXIV4BsXkedeuqZew+yS09oTOL2aXNimqgK17hA97QPVtJEzC7mQU5OjUjzr5xrA0nJ5kiIRvBrmQ/AzqZJZ1HQTgZPkFLbnkza887H17Nsnl0aU/ozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956082; c=relaxed/simple;
	bh=5sF17zBSWsEu1wpW4T/aKuh7B90BT+uOCbFZt5HIb/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pf5D5By8FQTpD0+R4wSxF6FBqkMIrQy1AaTNoeDDmjZLBCR7EKGEzKMdw7Z0EUHU0CEIkYeB2RdTa0/dGizarVFzNc7MRtKKXJ/6WZgZ+N754Oa6eXUWnd2MYdBUxSonPRms1dP/Saiu2QIRUUMDPKnDpXRnh+5D7Nsg8MRGKQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHj8wW34; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHj8wW34"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac7bd86f637so36609366b.1;
        Tue, 29 Apr 2025 12:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745956079; x=1746560879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31hHt99eQ7ecxAQBYo10uCFCGHQn8F86JxoMvBp/XTs=;
        b=WHj8wW340mrXuwj0f3NAIPIvy19wrpRXOU0c+RIQ9zlE/tCq1BmYpCx0AREwpTCG2U
         hsJpIayXJz5zk3oM2LZT00YmSmKg/Vvfe9C+OoehCQPQ3OWGfseDuEJZJL0zH4qM0oeh
         Ox/WAnH8rhuQCGOTvf3GzN+d1ydq5V3ftzRFQ5+qVBZLaljykoiHNevHNnaUOaqARhxd
         AEVV8Ml4p1Q4jkuvZIkHABZbr8wb7mnKPmItsqfWAwgU+jzhCUwZzOTzGgmpdaiRk51g
         xrmXa4215VQh/00UwmqyYuEJv+HCM0eS3XvmDr7ZKSKvCabO8B1Yb64vuTbW5IZWt2ik
         ohog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745956079; x=1746560879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31hHt99eQ7ecxAQBYo10uCFCGHQn8F86JxoMvBp/XTs=;
        b=PPukRNKcBf5kdL+40GkNZLimw48LLoS9o+PltCwpzE9ve4OJZT5NIftsaN+0Tsl7IW
         Q+qXfMxCSHlWUvhh+yvjk56lbMZmaQnl7S7ROpbJ8w7C4Zk1NCQBK7AGry4XAFForBoJ
         qRk10+TQOugr3r6Y0FYY32cW2XFOTawYlZYzqQWDyzuNvqMSDRifpWMQ5n5qSIrf//vX
         MzMdh/K4YcW/FFVxAVCyPcPOyAHqlhOYKoYAzIUXz2tC2xLAGLy4+qd4XOSh6gJcYuS6
         AaI1D7di8Q/wa9x1VEN78dd6SrVNMWiUX6IRcwdNKVOAeDS6bJQFjaoKhqvWO91F9GwP
         oiNg==
X-Forwarded-Encrypted: i=1; AJvYcCU8mcuR4QYY8E5n/rmtDUhZgz4s50P+IZUh17PGgzhhrtOueVouiHx/9KLoBila43d8WHhaGS5yqQsO@vger.kernel.org, AJvYcCV3VotOoRca+oFtQJLtjPI2sPd7j4J6bNn4x1N+cUEdbO/67OX09Zx8F7+En4MGn/T4jUBcV9QplhX/Mswf@vger.kernel.org, AJvYcCXhyMsblXjBRWymoOPzhliH6gMkCOdDaOWwueyC53wu3g22PPo15bF2vFtJkm6sDCNDF2fpAMDBvu/O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5V+gOAsEaIIrdYBnafYK2fw5TCGth03pl0Q+MxMyajTpD0vZq
	1t6v0rrSINiyLxoJdQLluZmlL4z0Ju63wV+wU0wlWVNG5/7WrrVmcAU8tMAUOwVNrZsn0emsLnO
	IxsWOJhMm3fatgaEcinMer3WPLzs=
X-Gm-Gg: ASbGncvNduOQXtEfat45RheJik3xAQfe4ty/EjO8entOxlTB1dnz9ECzcPZsrlfwuNs
	9EyYD+V2UeNC6R4dUj9dUJWTU9ZlKK8zDpfdBErKp1ZYNhn70kNwUKLMoRHdCv8/mT8Ja1EpU+i
	ogxq8+YUBKM3LsnH3sqXn8sA==
X-Google-Smtp-Source: AGHT+IG053NtJm0hR+FwHICAyS7gp+M4t3UZk6wbhjh4+xpcE871md/xia3GNq0/H3rfYdZZf6GCNx2EKnYMhYJ4isw=
X-Received: by 2002:a17:907:7ba8:b0:aca:d276:fa5 with SMTP id
 a640c23a62f3a-acedf349707mr18697166b.0.1745956078998; Tue, 29 Apr 2025
 12:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aA/ineUBAM5IU79J@duo.ucw.cz> <20250429170220.8145-1-trannamatk@gmail.com>
In-Reply-To: <20250429170220.8145-1-trannamatk@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 22:47:22 +0300
X-Gm-Features: ATxdqUHg7vLAt0poth2caA_g2wxqIwhzv8QInVAHWSoWODRta2Iw45WeEjT2sDc
Message-ID: <CAHp75VcVmTwS-zw=o5=m1-x0XC67BKBVWae2mMKZQH=qLCxZwg@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@ucw.cz, andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, 
	corbet@lwn.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:02=E2=80=AFPM Nam Tran <trannamatk@gmail.com> wro=
te:
> On Mon, 28 Apr 2025 Pavel Machek wrote:
> > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> >
> > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/=
.
> > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > >   and update the title and $id to match new path.
> > > > > > > - No functional changes to the binding itself (keep Reviewed-=
by).
> > > > > > > - Update commit messages and patch titles to reflect the move=
.
> > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/202504221901=
21.46839-1-trannamatk@gmail.com/
> > > > > >
> > > > > > Out of sudden without discussing with auxdisplay maintainers/re=
viewers?
> > > > > > Thanks, no.
> > > > > > Please, put into the cover letter the meaningful summary of wha=
t's
> > > > > > going on and why this becomes an auxdisplay issue. Brief review=
 of the
> > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > >
> > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outpu=
ts,
> > > > > but...
> > > >
> > > > Is it intended to be used as a 4x3 matrix, or is this just an inter=
nal
> > > > wiring detail, and should it be exposed as 12 individual LEDs inste=
ad?
> > >
> > > The 4=C3=973 matrix is a real and fundamental aspect of the LP5812=E2=
=80=99s operation.
> > > It is not just an internal wiring detail.
> > > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 =
output
> > > pins control 12 LED dots individually through scanning. Each pin incl=
udes
> > > both high-side and low-side drive circuits, meaning matrix multiplexi=
ng is
> > > required for proper operation =E2=80=94 it cannot be treated as 12 co=
mpletely
> > > independent LEDs.
> >
> > Scanning is really a detail.
> >
> > If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> >
> > If this is used as a power LED, SD activity LED, capslock and numlock
> > ... placed randomly all around the device, then it goes LED subsystem.
>
> The LP5812 is used for LED status indication in devices like smart speake=
rs,
> wearables, and routers, not as a structured rectangular display.
>
> Given that, it seems to match the LED subsystem better than auxdisplay, d=
oesn't it?

I have mixed feelings about all this. As per hardware organisation it
sounds more like a matrix (for example. keyboard), where all entities
are accessed on a scanline, but at the same time each of the entities
may have orthogonal functions to each other. Have you checked with DRM
for the sake of completeness?
Personally I lean more to the something special, which doesn't fit
existing subsystems. Auxdisplay subsystem more or less about special
alphanumeric displays (with the exception of some FB kinda devices,
that were even discussed to have drivers be removed). Also maybe FB
might have something suitable, but in any case it looks quite
non-standard...


--=20
With Best Regards,
Andy Shevchenko
