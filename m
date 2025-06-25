Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04319288C23
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841130; cv=none; b=FZuliswUZudwxENZ+cdJPBTYWXXfDFhMYrg0yjP8mjed64II7xoem5FTbuV6h1+aLrqMYDu4ocdMDSLISuaTEi6HItW4r5oGVsgMHYf2hsCmaM0WqbgrgcTxBSJzNQZdv7i7guMrJF3i7TpBZbQdek/bKTifDjs5l3SllSh1UuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841130; c=relaxed/simple;
	bh=4CWyVOg1ySsSGm3tCccXgrCtfZcjTGRY536tD9B4aXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEOhe8YQ1M3cipBqkWoGo6c3CvPWSJQAGZmvtJOX/S2qecMzp+qXisw5F7s5gb4t+B8HA4LzS4mkhVaVUYFH0BfOacpoBv+ka52bEEi1j3N2VOA4HVlAqO4FafFNnvatbqu+poRIoRsyqOhpVaVF34Gjb702G4t7/2A+h6P685E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwbAQ1Cr; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwbAQ1Cr"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32add56e9ddso51976911fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750841127; x=1751445927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CWyVOg1ySsSGm3tCccXgrCtfZcjTGRY536tD9B4aXc=;
        b=LwbAQ1Cr3YZihFgPa5aK9bUmn44ivPfF5qkBM8w6l/uw+BGgxyzRFFDannqOEjx/gX
         aEAc1T+yPBUSAdiG2JCq0B6E0+1sWJekOFyCwpg4qbTAMUc5iTIsqyNbO4ifOIZrBXBf
         GRtlQKXAPk2dxGqlv7WDWt/42F/TdnxWe/05eLVL4iDJ7iW5/AbCaQyl/qgqOWSoW+QI
         cQptVJGDMMS7hXIK9qUicyEmM0RVLlilpu4h3tSBTy94ehG8IysLPlyXksaUyD1QFIih
         DYyoiOQI6Vfwr3R4As1c0LSjYYvso/oycxykAAg4S98+/RyfAfEzPdDE2SVE89IJNrnP
         9KqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841127; x=1751445927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CWyVOg1ySsSGm3tCccXgrCtfZcjTGRY536tD9B4aXc=;
        b=de99tx1h2m9ahnbmGCpT2voqcFkVJshd/nlxDwT3La7DYc19G2LY1fT8WNeEZIpUcZ
         4uXfLJGMEvMcGjsP3krS3xK5ZcAJO5xpHtqeWPbkVXm53SaqNWmgKPbOAP7i2tlrKN9o
         XqrT2jh4Z7ghQHCjX6/CR9CBuSue1AhivfLA7ge+4FR10vVt/rhxTeQz3o5DO4+UbUyu
         nRV9GnpCvDeXWeEUOLmkaCLp7ueNXM/0gEjymgNHVbvewQHqJIB9upXmfWsxKT72ObRP
         0tC2G9aXmcX7mu+m3em1NfGvh84b082AlKjxyUNyrwMtk+TWMZskQH3GnCVHW3M0dXGp
         aDYA==
X-Forwarded-Encrypted: i=1; AJvYcCU0EPaeUD9ql4L3mlXwpaJXUxlNBCxbUQfU/bEfSmkJv0FAEPrhxB/Gpzo6FD2K05GkSOKvqPMS3BQqUdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKs7QzZn5gmAyOEUkSiQot5Lu/wicZW0JXc5rU+urgBjmEB8kh
	0bWGCd21whAVngSemH0cvW0fp0jstGUS8GCmm7xyEq9OrZG4hCzhcXNGJHvHQtTu+jIyZmd5WK/
	sXwoPT66P2/F7Cxa0N6YFsNZn7/CqHRBwjhyRqjAXLA==
X-Gm-Gg: ASbGncu6w84UFuzcHNv68aR9nlPU5+2k5iW5ZxwAN2hb+xG4ZADz/fpsYegvqJWjr/i
	s/CaFJ8whVZiVt3BJLrTdx2Kxqpus1r+CjSuWFc4Zcs7R44uP7Fqpc/6MUUZK2Li0QmkdBxIwOf
	+IEZtCbbCaFEAeDlYFf2PfDb5PZGjunUMimIn1NOwJ/UI=
X-Google-Smtp-Source: AGHT+IE+JyenPgPvT+Svvv9s+V0VraZ6su8hbOajVsCqvqbMTxCrk4fBzjbCyvVMQ0l2eId9Zjx6ak0ozUYWm+PwBYY=
X-Received: by 2002:a05:651c:4201:b0:32b:533a:ef76 with SMTP id
 38308e7fff4ca-32cc6490c2cmr5605931fa.13.1750841127084; Wed, 25 Jun 2025
 01:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8c282b89b1aa8b9e3c00f6bd3980332c47d82df7.1750778806.git.andrea.porta@suse.com>
 <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
In-Reply-To: <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jun 2025 10:45:15 +0200
X-Gm-Features: AX0GCFs5reLO3eAptejwJU5aIb8qpce34Nq1CQTt9TXYf2HTB17zcNXvrt_8Yc4
Message-ID: <CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com>
Subject: Re: [PATCH stblinux/next] pinctrl: rp1: Implement RaspberryPi RP1
 pinmux/pinconf support
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Herve Codina <herve.codina@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 11:11=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 6/24/25 08:36, Andrea della Porta wrote:
> > The current implementation for the pin controller peripheral
> > on the RP1 chipset supports gpio functionality and just the
> > basic configuration of pin hw capabilities.
> >
> > Add support for selecting the pin alternate function (pinmux)
> > and full configuration of the pin (pinconf).
> >
> > Related pins are also gathered into groups.
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>
> Linus, can I get an ack or reviewed by tag from you and take that in the
> next few days to go with the Broadcom ARM SoC pull requests? Thanks!

I was just very confused by the "stblinux/next" thing in the
subject ... what is that even. I thought the patch was for some
outoftree stuff.

But go ahead!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
