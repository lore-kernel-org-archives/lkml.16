Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DFC279794
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462347; cv=none; b=s0Pi/8vuLwW1+vsoec3RlW09uBjednEl0Gew9Ig5Pvjy2Dj+7rh3F6/Nqs2Kp5+Jl2GljPeacdCXk6mKJceHJCnzDWaOu6FCmUndGlLmoVUCmg2ItY88kS8PdarxnkogeRqXr3TP8smr8cSYb79BUY44TG81Lu0u57XDI1nMsF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462347; c=relaxed/simple;
	bh=L8owLmtFzaaJZIxGw+Pv1FUP1IEjAz3P9wKS03iNN3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9C9A3Tl0per41n3b8VgEPFmFkMTqZo3V0DeknTypQPSECi2A8yZnDDV39Ng9zef4DLioyZEiQuh+PraNaYTZpNGyq4U+4cSI8C5SIURTafJYXSyNA19ee5le8I/qEfzxRLq7iyh+afPAugIP2UNs8Gdmcq5lqhnQWTeJEd3W7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kI4pN1N+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kI4pN1N+"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553cf020383so7578176e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751462343; x=1752067143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvqohbDI2GAmHMqzaTXORDEqROTHuWUKuOqQymQYwFg=;
        b=kI4pN1N+nNaJjH+4xfqOUYgmxt901xFhCC1tS/wCT+VUdFHod18HMxIRZCZ8Xx/T2o
         0Sahn3ZT6OObMcRnjh9qlfsH1eCOqSgozCyyLTN3MKZkGBPjmmaRJkC/Big49ySrGtJA
         65XeYUeuw2TGU6c4c4Gngg71Vi4u2T/EOs3dn8B4bTcC8CK4+cjIuS4wSr1eJYCt9RxF
         nbFzVQTVAT+tgKgvsm5z387DfOZbSzQ+AsLiFkKLLRA1VWyKC6IHZoftvwNV31OazpMR
         Ut18Uhzc5ZbcV9VUSSmZuyASZwEyhDmW0RONvkDyePRy9YndYknkPgOzLJoAmRNX1LjX
         I1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462343; x=1752067143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvqohbDI2GAmHMqzaTXORDEqROTHuWUKuOqQymQYwFg=;
        b=aXue8aG22HjaY1/c+Wk4+pX/pwDAb4IbaNF7AcKiVE862pe9JhoYr7q4nQY3owuTKG
         L2zXybY4ECP/sht6uElNhOyBpB4yba1YEIvUozz4TYhBKytYfqBIYFADWFBlWBpX4nUv
         OV0TFDoBBaIah423shGuosJY8DbVGHTTrxFrpRzScrxZysJ6pDM5QDggkuQHswZJBBga
         1u6L0Ar80MUpfHbxxwwCOIFKtrZPfA8a0tlKUGI55QWySp0/cnGRyS/Q5uHaNtqDFUQa
         sAEhyIV8JF2D6fJ3MGH7+7gNme3sBrjIbAOU4eR6ooJBk0uGPblfpXwwossvqH+0JA+e
         StBA==
X-Forwarded-Encrypted: i=1; AJvYcCXotGVo89ajI1YLWHs7GcSSTGRx/3VUihypQPJTniVILT9UKe3QwGX4NokH6EgOM7hUm4LhZ7qOKM7kcUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaDXJvSOrgoNeTTwzXGA8mkMf56Ewy6hadoXZXnzw4mhtrxaya
	SMKKauCZacQGwHF74YjXYgsSHcTXMzM9lL4kf7ICqyu7+T6DfWqdmr3u7I5rhr3nn65DDtfjnv9
	RJ0xDpZMtTtfFcUBJxsQIOZg75UnlOVLkmmqfEab1jA==
X-Gm-Gg: ASbGncuAs6nPMB0UF/aQg7+NqaJXvigJUb8IwLbTjhpfElHXGvBxioxWFTGlKodwI4p
	CWYgLWVyac/fu7t1srkKFDO8nxH1kSm3T2NoYqtN/JW2JlcSwp7vR2aahBHQAUQiPvdxmf/lauI
	UKItJJc7VJE3rZ31LKkPW9P1XtqlYcri5d6EpUeAP0F+zaqncFinrsDca+DCbI6De4C5NjMUIo
X-Google-Smtp-Source: AGHT+IGo+t57UliEc2HwQ13eyq0sY0QeAbqdOoDWjWbCox3B3fh2R/GjloOBxDDYSfcQ+CEbIeiSIdHamp/sunKThtQ=
X-Received: by 2002:a05:6512:15a1:b0:553:addb:ef51 with SMTP id
 2adb3069b0e04-5562824ee0amr1135537e87.18.1751462342357; Wed, 02 Jul 2025
 06:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com> <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com> <aGUeRczCNJLg-KON@smile.fi.intel.com>
In-Reply-To: <aGUeRczCNJLg-KON@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Jul 2025 15:18:50 +0200
X-Gm-Features: Ac12FXyIstglX0Pn7fB6SNZb0RFuwEcN1DnpF2Rd1MaiGH2nMKkaE1WvFTqfGBk
Message-ID: <CAMRc=MexjmozQ+vkLz1L4_Vfb+aqqwNSxKtNVA7zb-=r5eCMQw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kent Gibson <warthog618@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 1:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Jul 02, 2025 at 11:45:02AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Jul 2, 2025 at 5:54=E2=80=AFAM Kent Gibson <warthog618@gmail.co=
m> wrote:
> > > On Tue, Jul 01, 2025 at 05:05:10PM +0300, Andy Shevchenko wrote:
> > > > It seems I never expressed my overall opinion about this. I think t=
he poking
> > > > sysfs and making it working with a new schema won't solve the issue=
s that
> > > > character device was developed to target. If so, doing this just br=
ings yet
> > > > another broken interface. I would be happy to be mistaken!
> > > >
> > > > If I am mistaken, I would like to see a summary here that explains =
that clearly
> > > > that the new sysfs approach does not inherit design flaws of the or=
iginal
> > > > implementation.
> >
> > You cut out the link to the discussion that preceded this series where
> > a good summary is in the very first email. Anyway: the gist is: people
> > need to do some basic GPIO fiddling early on from initramfs that may
> > not have any tools other than basic shell utils from busybox. This
> > series is not about improving or extending the sysfs interface - it's
> > about removing its reliance on global GPIO numbers. And that's about
> > it. We don't add any new features really, just move the GPIO line
> > groups into their respective chip directories and make exporting use
> > the hardware offsets, not global numbers.
>
> I see it differently. This adds the second variant of how sysfs can be ha=
ndled
> and it needs to be rotten in the same way as the original sysfs. I really=
 don't
> see a point to prolonging the life of the broken interface in such a way.=
 If somebody
> wants to check the GPIO without accessing character device interface, the=
y probably
> are simply lazy to think of how to do that on early stages properly. The =
desire
> sounds like a workaround against proper thinking.
>

Whatever your opinion on this is - if user-space wants to keep the
interface, then we need to support it. We can only propose
alternatives and hope the users will switch. Please read the
discussion, it explains why people want to keep using the simple sysfs
ABI and why those specific users will most likely never switch to the
character device. At this point a bigger concern to me is the global
GPIO numberspace, not the existence of the sysfs class as such.

We have three alternatives:

1. Do nothing. Keep the sysfs as is and hope we'll drop it eventually
but this will most likely never happen.
2. Add an entirely new "simple" interface next to the existing sysfs
AND character device. It seems to be what you're proposing but this is
the worst of two worlds. I don't want to be in charge of maintaining
three separate interfaces. Four if you count cdev v1.
3. Modify the existing sysfs in a backward compatible way but make it
possible to export lines by their HW offset within their parent chip,
not by global numbers. This is what this series does and what people
having interest in using sysfs confirmed would work for them.
Eventually we could drop the bits that use the global numberspace
which seems more palatable for user-space than entirely removing the
sysfs GPIO class.

> > > Indeed.  I've already expressed my reservations about supporting the =
whole
> > > of the existing sysfs capabilties, but I've otherwise tried to remain=
 out
> > > of the discussion.
> > >
> > > To reiterate my position:
> > > While I am all for maintaining sysfs in some form to cater for those
> > > rare cases where cdev is too heavyweight, IMHO it is a mistake to
> > > support the existing sysfs capabilities in toto.  Take the opportunit=
y to
> > > remove the parts of the sysfs interface that don't work well.
> >
> > Doesn't the last patch do it? We cannot remove it without giving
> > user-space some time to switch.
>
> Famous Last Words. How many years the sysfs is being rotten?! This just m=
akes
> it a Frankenstein.
>

I'm doing it BECAUSE sysfs hasn't gone anywhere despite several years
of efforts. I cannot force user-space to stop using it, I can only
propose alternatives and it seems that cdev has not been enough.

Bart
