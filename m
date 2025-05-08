Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021F424E4AD;
	Thu,  8 May 2025 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692705; cv=none; b=ToF4ErM88h4L4QKl0yYIdf7jmR7OHMZJuHHhB50w7P99JKgmTh2c/ZyY+E63/RcEs6lq2oJ6KbEoUe/sIdqW6g8WIPc7hKkMYMSGFNfih0oZ2nl/vVpyyGm0RWkAijD2bU/w66Io9FLCppjmYxypeobqHOVzcXLN9hyKXjBXckc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692705; c=relaxed/simple;
	bh=S3MwescSxZa6+qZIjhvT+wXpq74A4dumep68eA2m3pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JROlJ03QZWy9wdQRI9i5JlGhLRcG6y193lSeXp1khZH/esbD+S4MYEg2Vrz3wLv2pK1eblLdiI8ud4jt3fUgg/hBW1LaD4uazMz7vxgKd/xtyP+cIDZbAMkupmml+nuS2exkwz9VPde1xwIf6sUb2APrvMr+jJJSGRwm7vNJPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuniF+NQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuniF+NQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac339f53df9so118318066b.1;
        Thu, 08 May 2025 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746692702; x=1747297502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/VZe1/Vs9df0KRAk3DjKWjsF3dPnM34RI9z9rdQPgU=;
        b=DuniF+NQDJ0o1ScS4Hndwi1i26yF2nvkmHVdmnzIIrgIqVcfJChVm7ED6BQwMg8vtG
         vxrzqdkW9Qy/7UdJk/CbYLuMfHjbFao5ufBHY62Xu7xzY65xIKsjFKQwNNrgeloOt1Vl
         QEu6ee3AayNbOFgIf+erYnMpUErjT5rMzSL575br7nsKrdMnNDYu0Kaa/NMn7qRU77TS
         +yvLRZFiNYhL5OcXUepgUuLGugLTWmrqsJI1C6NtaJtvBG+EuJXlBhcNGnkQNp2ka9Oj
         6LtmG3ggE+h/aX08sXen0D2opjBMbpU2U+jaENSuT6Sa7MqEcUao8tPoof85ifroF5y/
         Z8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692702; x=1747297502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/VZe1/Vs9df0KRAk3DjKWjsF3dPnM34RI9z9rdQPgU=;
        b=Xj0UoN7v811I2KbJ079bvDFNq704raTGZjbXw+ayXzWYYLnj6Q8ZtuQVwEpq2yDlHI
         EQ3PmNP2trs38rjh+5aO/JgiU4JPGrPauZzjKzIvS9atUcfmg3zU1nOrjRXvDsa7mQ1g
         5+HGNtwAW3y579KiPqUnYl5XaHGhCIvNo/rvsuIGbJIfZQeMxQ59IemzYlRjcxhaYFH/
         28wpPu8j1cyi7/v2ca46AkRqqAysoMbwA4xRaRkLmQjHY3XwWWfBDFctfqTKzsD1AlEy
         nTFGZhk/aobGbnD3msR3DHtWsVA2Z2aFZU5i5M5hmolhgLHGpwxSih5a/VlVeBWr5zIY
         w8rg==
X-Forwarded-Encrypted: i=1; AJvYcCUdH4ppvuq2qBQ4resKbbvLjAj9J6Z6sS6d0lzVpWkoiZIxSD5GiqYeMlTeA8nTgWokG+6KlIb6aN6t@vger.kernel.org, AJvYcCV5DR65JCTZwUYlm2exkJ1xpfH5+UoQlSByNv92Jv2XYAD85TjZJzj12zCxm77E/TksoroRj+mP9R7wOD9e@vger.kernel.org, AJvYcCXpk11wSa16d6KhV85Bb44ax3jh9MrXS9PfqH/dqlyyh6rggkbc6ZImf8ytib+JyPI480PIw7dnNNWu@vger.kernel.org
X-Gm-Message-State: AOJu0YxLp4Uf1qu9aIP80t/lGJiqBrIAQEXt4rdTALoUYcR1JuU3KMh3
	zmXi97s9wREfML+wKyNLUYcEwuiXSQ7cfX3rm9xNzz7ENgRtBrs4qlmjBYgrOtlWQ8dA84tzQ6D
	+bf+lFSEHvYYYd3XCP8sIfZXvLck=
X-Gm-Gg: ASbGnctsBnnV8GRII8Hw1FchK6hP2apKH+j/a9ONOdELSdL/CRwhVNE+1ol5IEfIL6K
	qc3LHocYTL3L8wMx3qgNF/TjcG7aV0vJqUNYhSY58THFioT2nqpAcRCzu74lUEzI7+AE9jeZtC/
	D7d1zP53qhJjeWjExrJXVkdg==
X-Google-Smtp-Source: AGHT+IHwGMRcQLUDAqsmMU26u5DhOM2YTtzvThxyZ+rgbVdUJgzYB6yoguHQmu+X3sFn89zGRaz0RDjcWnop9JbvZfo=
X-Received: by 2002:a17:907:9814:b0:ac7:391b:e688 with SMTP id
 a640c23a62f3a-ad1e8d08543mr701795566b.58.1746692701962; Thu, 08 May 2025
 01:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHp75VcVmTwS-zw=o5=m1-x0XC67BKBVWae2mMKZQH=qLCxZwg@mail.gmail.com>
 <20250507164219.10083-1-trannamatk@gmail.com>
In-Reply-To: <20250507164219.10083-1-trannamatk@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 11:24:25 +0300
X-Gm-Features: ATxdqUH7vjwoyrUt6a0OgSJkXwTvjGyp-fL_PAaQ_hH-HiCBVj3EHH4LiW0KdPU
Message-ID: <CAHp75VcNuXouL25ZRiym97AjR9249=ENMPFDQ7imZ_ZoeKc3Ng@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>
Cc: andy@kernel.org, geert@linux-m68k.org, pavel@ucw.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, 
	corbet@lwn.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

First of all, I just noticed that you excluded Lee from the
distribution list. Don't do that as he is a stakeholder here as well
since it has not been decided yet where to go with your stuff.

On Wed, May 7, 2025 at 7:42=E2=80=AFPM Nam Tran <trannamatk@gmail.com> wrot=
e:
> On Tue, 29 Apr 2025 Andy Shevchenko wrote:
> > On Tue, Apr 29, 2025 at 8:02=E2=80=AFPM Nam Tran <trannamatk@gmail.com>=
 wrote:
> > > On Mon, 28 Apr 2025 Pavel Machek wrote:
> > > > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > > >
> > > > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/l=
eds/.
> > > > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > > > >   and update the title and $id to match new path.
> > > > > > > > > - No functional changes to the binding itself (keep Revie=
wed-by).
> > > > > > > > > - Update commit messages and patch titles to reflect the =
move.
> > > > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422=
190121.46839-1-trannamatk@gmail.com/
> > > > > > > >
> > > > > > > > Out of sudden without discussing with auxdisplay maintainer=
s/reviewers?
> > > > > > > > Thanks, no.
> > > > > > > > Please, put into the cover letter the meaningful summary of=
 what's
> > > > > > > > going on and why this becomes an auxdisplay issue. Brief re=
view of the
> > > > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > > > >
> > > > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I d=
on't
> > > > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM o=
utputs,
> > > > > > > but...
> > > > > >
> > > > > > Is it intended to be used as a 4x3 matrix, or is this just an i=
nternal
> > > > > > wiring detail, and should it be exposed as 12 individual LEDs i=
nstead?
> > > > >
> > > > > The 4=C3=973 matrix is a real and fundamental aspect of the LP581=
2=E2=80=99s operation.
> > > > > It is not just an internal wiring detail.
> > > > > The device adopts a Time-Cross-Multiplexing (TCM) structure, wher=
e 4 output
> > > > > pins control 12 LED dots individually through scanning. Each pin =
includes
> > > > > both high-side and low-side drive circuits, meaning matrix multip=
lexing is
> > > > > required for proper operation =E2=80=94 it cannot be treated as 1=
2 completely
> > > > > independent LEDs.
> > > >
> > > > Scanning is really a detail.
> > > >
> > > > If this is used as rectangular 4x3 display, then it goes to auxdisp=
lay.
> > > >
> > > > If this is used as a power LED, SD activity LED, capslock and numlo=
ck
> > > > ... placed randomly all around the device, then it goes LED subsyst=
em.
> > >
> > > The LP5812 is used for LED status indication in devices like smart sp=
eakers,
> > > wearables, and routers, not as a structured rectangular display.
> > >
> > > Given that, it seems to match the LED subsystem better than auxdispla=
y, doesn't it?
> >
> > I have mixed feelings about all this. As per hardware organisation it
> > sounds more like a matrix (for example. keyboard), where all entities
> > are accessed on a scanline, but at the same time each of the entities
> > may have orthogonal functions to each other. Have you checked with DRM
> > for the sake of completeness?
> > Personally I lean more to the something special, which doesn't fit
> > existing subsystems. Auxdisplay subsystem more or less about special
> > alphanumeric displays (with the exception of some FB kinda devices,
> > that were even discussed to have drivers be removed). Also maybe FB
> > might have something suitable, but in any case it looks quite
> > non-standard...
>
> I understand your mixed feelings about where the LP5812 fits within
> the existing subsystems.
>
> While the LP5812 uses a matrix-based structure for controlling LEDs,
> it is not intended for displaying structured text or graphics. Instead,
> it controls up to 4 RGB LEDs for status indication, where each RGB LED
> consists of 3 individual color LEDs: red, green, and blue. Based on this,

So, you probably should have started with this. As I read above that
this has to reside in drivers/leds/rgb for colour ones which seems to
me closest to your case. On top you might add an upper level
management to prevent users from using patterns whenever the LEDs are
requested individually. So, this driver should represent 4 RGB leds
and, possibly, the upper layer with those fancy stuff like breathing.

At least, based on the above it's my formal NAK from an auxdisplay perspect=
ive.

> I think it aligns more closely with the LED subsystem rather than DRM or =
FB.

Right.

--=20
With Best Regards,
Andy Shevchenko
