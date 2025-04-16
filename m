Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5ED43ADA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818699; cv=none; b=Cvnnul3mzIt5TIOx1GOUO6Mc2/B+gKoOiXjPY8j4rGe1TR5ElvxYw6dhWlbMSrENdqhxd3gKUTFvCPaHdFvYmGzxXlIurQAeC7/DvJEV4mLnsQzThpPKcA8rQ8Uc+IsJ4n1T0sQXsIOSwcw+1vdmudczGawgh+3rU8NV6YB0apA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818699; c=relaxed/simple;
	bh=SXcGhAs+b3v9Y233MrSAopuLgFSZM3Rj8bpgVplYCiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qR5rJp7ZcfQKU8X65GI6tCbKspVHY4No0K+GVyIQKUjkkMZRM7YBD/haeZzoB5m3LFB8CjjzCytwkYH7RBh71YMalhu76vXy1rJLr9YSyuv9kg+Hndsp44i6YYPkxcWdHTzfc14391t0CtGFBvoL+5rSevpPgHWVW/iT35m07uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wRY5L8Iz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wRY5L8Iz"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54954fa61c9so8428355e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818694; x=1745423494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZQFkTG+TE9XyLSvBWPzBX545sfzGUulEWKqLFKYrkU=;
        b=wRY5L8IzP5EeCq8SvKBALDHi7fk6iL6+meK6UWbzP34WY8cphCLk6hSSkbGEifhIR6
         cadAFZTT/Tal2vIC3ZQHVe3xdUjGMLV1jl7IWKio4rygFk4bc901UZUaVqEOiVhmnQbq
         swOA8u63LouhCAaXW99KZUuy/88SstIFZrvm3OiJPnHcW4ZCdjtbYFNs1pc57cDtcjf/
         f6fCj6IrCMTEz4Tb/oqINYxDZoFl6ID1+JbE+P2VDGgCKBDFHvTUHvXapEhAlHs+/5ul
         FpgvXO4rOH3lE1DjGKjF8K7uMi+89bGysfUeY01zwJa/MTgrDbQB32gT/751KI/cZyb/
         IRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818694; x=1745423494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZQFkTG+TE9XyLSvBWPzBX545sfzGUulEWKqLFKYrkU=;
        b=T9lsPcPeku3kVe5xfElT/Fj5xO0+BBnpjLXy+tmHf9+//mzE1lNgDFGNwJJHSoZ2Mu
         MCH9T9pTguqJP0u9y7sc3QXUTD3MFwImHdpI01ojPXFgCwUd5c9VrNZNF/3GcsYeGCWD
         ID3Xoh889sIf83Or5HVurFca9nMYWM3BaD1flUPOzvqSG2gXtNgW6UFlU4nGxSy/jB5y
         AOg0/lwul9IGuEOuFID4Y7MP/ldZM3/+FY9ArIPzdINmVyWwp2JGXOzjuY02i0YQqVwx
         A2IuM5l79WE8DLeLynGRYUEbzC3SPncSnXfPIAZicvif6qIQ2VyCi+bgLRSI6bh4G/oH
         5fSA==
X-Forwarded-Encrypted: i=1; AJvYcCV8C5noKJk5KvlqyHMBzwZJyMWNW7rQdFPOQqDC9RzNXKyr1fOHqE4UvctexiKFr8ZNecferYbFQWOnlJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5l7hK0xLFdvBpqD8+PqvE2R1+90AO7JvqZTVyOtZ/SROrceY
	SGBqIy9OvofulWJ9lcnrpClG8DiobsRSb4DIJzZmktLT5IegNOa1LH8TD1pJLv+4odo9d2jm0F0
	GvEtyia9q+Sjzp/8LJixmpIyXenyhBhf/4yOL6A==
X-Gm-Gg: ASbGncs4p936gMVLlI9SRyC3erOAQlt94ss61hKbQgIkT8o/SKkv31zc7A4VukK4ALQ
	lqqSYuEoU2UWXPiVOTCVGZ4aI7q8IweD9RmdM0kdc4GiztZAycVZN5kuYKHlYWhq6ouFyEOoCeI
	0E/jQszoc4Tb3CFD23ZN7ZnbPo+2h/VcJjEipJ/uOt6knKMDY3qQtbNFU=
X-Google-Smtp-Source: AGHT+IEOA9pETzEiwUlfAn6Sgi+fzg/ihyH1PJsUp8cWH2CmtJSYAu8VpLrjwtghIihEu2y05c8/xl7tyUGx2qaGSuU=
X-Received: by 2002:a05:6512:304f:b0:546:2fde:d2d9 with SMTP id
 2adb3069b0e04-54d64aa9f74mr849955e87.28.1744818694067; Wed, 16 Apr 2025
 08:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
 <20250407-gpiochip-set-rv-arm-v1-4-9e4a914c7fd4@linaro.org> <075b347d-dac4-4b75-9c97-f2578bbfd279@kernel.org>
In-Reply-To: <075b347d-dac4-4b75-9c97-f2578bbfd279@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Apr 2025 17:51:21 +0200
X-Gm-Features: ATxdqUFAaEqfpWy-Gz1MlrWfTBrFjpknqD-4vV0rj7YLmXL5PjV9ze05bHY7Jgw
Message-ID: <CAMRc=McFDhTRV9Zgdu80u+O30pADNRTQEsM79XOPndyGEk6GOw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: s3c/gpio: use new line value setter callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Linus Walleij <linus.walleij@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 8:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 07/04/2025 09:09, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm/mach-s3c/gpio-samsung.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> This was applied a week ago, but it is not in the next (next-20250414).
> Are you sure you feed linux-next with all your patches?
>
> Best regards,
> Krzysztof

Hi!

This is a bit of an exception for me. As discussed with Arnd[1] I
picked the patches up into a new branch and sent out a PR to
arm-soc[2]. Once Arnd merges the PR, the patches will appear in next,
I don't have any ARM branch to feed into linux-next.

Bartosz

[1] https://lore.kernel.org/all/18d59ff1-a357-413c-bde2-961ae0c9b5f2@app.fa=
stmail.com/
[2] https://lore.kernel.org/all/20250409083513.21115-1-brgl@bgdev.pl/
