Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D82527713
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076842; cv=none; b=Fb1r0+3efv7G1WCM1al11d7gImmMIymsfvIa10ZvQmAniLEjSjiy1XR9qaIKFL/NJwZ+F61PmtKtCBcnxiSXyOYNC0LwoZsobTVRRYPupOqvPz04keXHXy0JMspjYVSP6mJpRtGwRyXq5h5M4/J1MoLdJUHA/gVoGHQxw/7MKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076842; c=relaxed/simple;
	bh=2ZSVW7xdVqkJzk/JnmXPdnxEo5mO1cTfeEV5hSa3zGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpG3uqpCV1pcvLLGkF65LiFr8SLl9slIXTKelg3NeAdDEx1zKIaYlxswvgkFhGGUDxuvzbwmV3lm2+qRXFMnfraX8fd/rZQnw9TOqHVmezwC3fC0t4ZC4MRwYXzo8rWHoVkSBMSgEzaRrCRV9OcdwW3QM2AJoUZ/iNGY/bZa9CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w/0ai9F/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w/0ai9F/"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553bcf41440so1461390e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750076837; x=1750681637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZSVW7xdVqkJzk/JnmXPdnxEo5mO1cTfeEV5hSa3zGU=;
        b=w/0ai9F/1ouue8aP8TbGJVQbjyB2UDqm2QeFWXvQRbul16AkNaYo+7MQQk0QJ48nOD
         jp4FCyxgzY1wWV50R6bhFJERRtTvIaeHZGB+Cy/CTO6CvgPT4FwXvCO/7+FrNPkD63vD
         RT1I9KtQkDK8ZEDwjU/VooLFcH8FHHZEoekdkdBR1r/eeYW4f/hCZR6SS4wlKec6Y1cr
         x2BktdqszWovKUhXeUOjt+UyyR0iy/oCO/5pIsN1Ud/F+T3h3kd/F0UFRyXk/p4o8x9/
         NoaxA6mEVnnINHi1YBj4HaUTIFMPs7r/SLRFYv3nplxYQ9fmtY62hcOR7cOhsyD4aaQo
         5QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750076837; x=1750681637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZSVW7xdVqkJzk/JnmXPdnxEo5mO1cTfeEV5hSa3zGU=;
        b=lY48shamvkj+AUutfhKTUHKr/7i6A8yAAFtgkvnw0IH3OI57MmhrIgGT8HDySa9tGL
         ukyQ6Sj6vSbbEbECdqCFXbFS9oyAijWM2eJRmzBCZAw5795IYO+jxBJQWZumcjIw2epb
         Ui/sU3kI/3Tc3Bg+Cdkb7J2qB2FqUZk/E2EZ86hhzspuTmLVFvEd35KhiorJpePBmjMv
         2zSDNP4iq23hhIaNv+DnF9bw2CWPKmeR0i97oAciwjFOlU4XXzaAj4EJ+qXbs4upToy1
         OI17NUYNGTkeO8eFwaEdKh3cCH2TtS/rnKPRrD8f+qqgbHNzDls8Yi+sA30Kws94sOsk
         h7zA==
X-Forwarded-Encrypted: i=1; AJvYcCVVEqgW4Z//aMCpfTfhgCmDAv/luCeTvwynJQUoh3Un59/DNKQIi7Qvt9EG4q9KCJ5el9awknud77TBzkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY5+ib2+y1Ok+hcb2miclBIrjstbAKlLbLIrhkytlOqNNLZt8v
	onfAwpVD9TKWmNV8QOBQjmAZs6HnpK5Y49/nOpNRyGZUgBXbwwHm48atbY1KtRqRfkmhwaQse+N
	W1ensVzuDk9VfgV5oBEPyd8zWoePHOnAiJxyllS1bRQ==
X-Gm-Gg: ASbGncu9q/2KOwB3crgVcMsgIGednr6OQcr1v7QHvoJv0UgZiPMD00qeGRp1eIMSx+g
	5/riI8xAc/QYBQxlP3B5wfOxKKZRKqnYl3IT9jRbgVschwzSVflZc80MXZeSMO9RxZ7/i6CRHLA
	GFnWjL4Lbqcua3h6LIg0ylR7ahE+/9GeQpqGKD3yQlQOPNbcgN2QZ0eN+inpO6A2UMeoTrZixxJ
	1Y=
X-Google-Smtp-Source: AGHT+IESdzbSr0hyb5ZTrddk2EekSKVqWpeLC69vtkyeTgrO9IfOok5XJzSK6MtFLNImcFxcWud6sO3MLnOLklka9Vc=
X-Received: by 2002:a05:6512:1192:b0:553:addb:ef51 with SMTP id
 2adb3069b0e04-553b6e8c2f5mr2040920e87.18.1750076837237; Mon, 16 Jun 2025
 05:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <CAMuHMdXca=EnNDE2doqUvu3dm7+aaWrG1nUYs3b08JCFqrKEvg@mail.gmail.com>
In-Reply-To: <CAMuHMdXca=EnNDE2doqUvu3dm7+aaWrG1nUYs3b08JCFqrKEvg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 14:27:06 +0200
X-Gm-Features: AX0GCFvBiJSrqsy2NmICkTOhhNTaArcZZ0rZD9G4yrtV8RBEldgTv4LBOcVAA00
Message-ID: <CAMRc=MdbYesiRDfvwSchZZ5jOnSRffS3JzUzQh++J1JZLwm1Wg@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 00/15] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:02=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Tue, 10 Jun 2025 at 16:38, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > Following our discussion[1], here's a proposal for extending the sysfs
> > interface with attributes not referring to GPIO lines by their global
> > numbers in a backward compatible way.
> >
> > Long story short: there is now a new class device for each GPIO chip.
> > It's called chipX where X is the ID of the device as per the driver
> > model and it lives next to the old gpiochipABC where ABC is the GPIO
> > base. Each new chip class device has a pair of export/unexport
> > attributes which work similarly to the global ones under /sys/class/gpi=
o
> > but take hardware offsets within the chip as input, instead of the
> > global numbers. Finally, each exported line appears at the same time as
> > the global /sys/class/gpio/gpioABC as well as per-chip
> > /sys/class/gpio/chipX/gpioY sysfs group.
> >
> > First, there are some documentation updates, followed by a set of
> > updates to the sysfs code that's useful even without the new
> > functionality. Then the actual implementation of a parallel GPIO chip
> > entry not containing the base GPIO number in the name and the
> > corresponding sysfs attribute group for each exported line that lives
> > under the new chip class device. Finally: also allow to compile out the
> > legacy parts leaving only the new elements of the sysfs ABI.
> >
> > This series passes the compatibility tests I wrote while working on the
> > user-space compatibility layer for sysfs[2].
> >
> > [1] https://lore.kernel.org/all/CAMRc=3DMcUCeZcU6co1aN54rTudo+JfPjjForu=
4iKQ5npwXk6GXA@mail.gmail.com/
> > [2] https://github.com/brgl/gpio-sysfs-compat-tests
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Thanks for your series!
>
> I gave it a quick try, and it seems to work as expected, great!
>
> Given the /sys/class/gpio/chip* numbering is volatile, I expect
> script writers should use topological path names instead, .e.g.
> /sys/devices/platform/soc/e6052000.gpio/gpio/chip*/export and
> sys/devices/platform/soc/e6052000.gpio/gpio/chip*/gpio19
> (note the wildcards).
>

Or they can use the chip label like what they would do with the
character device. The relevant attribute is still there.

Bartosz
