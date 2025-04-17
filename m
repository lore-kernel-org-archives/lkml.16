Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D91257432
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916259; cv=none; b=tkZhIiptmpDY+BoPuE0VpnLLs5J26V/SVgORoYSyjDi6zXf2WaNFUJxZzREKCJ9Wb+OE4lS6Q0d4dl7uv31479aHctjFTbW0HRJk5opSTZ3xxmMZjsGJ1hSBrMGMFtPbr6GiTIuFAY0nbGVqB+qRRsI4ntT9Cr0aMJVUl7IFJ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916259; c=relaxed/simple;
	bh=t7kXMWDKZwfq3mZ55GHgTwyiy8JS88zhCJ5ZzCZBfX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kd9cmZTj7eIUFPG3WeeiaKBbZKgRhZlvthER0+pdZnMC/Tgaz65+CQNUf3ecRF/Uj873iSgVyNURodcmQ1LJW+Isl46gZSmnI8S9zrekZOSBnuGaZLID5m/xvzJgVR3WsVIARzuJlPugMqn9fPk/d2yx52omiS9NXYa15uKZkRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3G1WCeSD; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3G1WCeSD"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so24439691fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744916256; x=1745521056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7kXMWDKZwfq3mZ55GHgTwyiy8JS88zhCJ5ZzCZBfX0=;
        b=3G1WCeSDT9jUNnIrECM3f4L4pQUSaeKNGDlUJKFhCvOIt06g6Izf5iwq7P186/y/Vk
         6MXf7yVd2hJbGW/ccJi/uGrkozMBaI08G9NVkcfeqx3jI2BiyDyNKJcNta2cRbZR4YzM
         RsqqorMH13dhFLMRjLwlQblQShm+PX2z4IccnqOqOM1+tu6l39XtQToCorhCe36HxdQD
         mP3+rjWJhUtmLfEOPSoGSsxM9IT24V0W78YQppAoteEY51pD4UDJ65jo8UWfXNnJj9m2
         ovmWAYa06npQAWMIfXOEil4x41kJGiIdxKv9yZCQMWNwMRlmUryR1ZTRilqVN54zA9Xu
         Z1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744916256; x=1745521056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7kXMWDKZwfq3mZ55GHgTwyiy8JS88zhCJ5ZzCZBfX0=;
        b=i5SpDJxBo8gQ4/AbbdMGbwtBquLK8AtXDu/dw/YuMX4oOesFs1ZfxFDhMyFTuT0vn9
         sW9sX2eLrlfWVXGpEB64rSce8wX8XNQj9SK6+RJkl+MWUhKwEUtWl1UHEjeDcB9FIZdV
         ififYshILBcKoZwKPmRPCl4xgDkl7cXbBonEc1S0Fj9/4rxI44xHDxo7mxBUAHUkZbb/
         XtwSXsE2NZCqp07QWSHZlD50EtvKrbolAnFuL7QfCl6VtAawxrqXk0wCf6NoIXcfAZxF
         4CDp3io0f3hp00oPt5gJ2lQ43KagJw8btlGQHSALjN5gDZPyRpqS22O7Ic+DLb5S8FTz
         qqJA==
X-Forwarded-Encrypted: i=1; AJvYcCWOW6oMCxjWOOriHtRlRXARLCxB8LZrqCaQ80d/hMMqxCxnEUs2nd0OO7keM4BGNRvVjmuylgUymN9I2E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlOZVETTdEuY8hVQtjmuk1tNiMOlMPtLUKo/aoop2hEK8LXUu
	xooNZO+f5DzSbPw7bHzUwVtwvGGDY9qTkq0tVy4JdYYal7aD7QHY5JndNpFajWHHyTsr+QesGRR
	4QEtFbD7rxibALJSpxvD5oyd9l6vxr4Y2lMXoIw==
X-Gm-Gg: ASbGncvTp55yZ2YcWcLfTHlwnwWXBIriggzUm2SweL6vvkB2OQwA5i/d5wL8tf78kqc
	H4iDBvJJgWG8PgMvT/EwDhkWIfOTMu0Ca8d87tyWA3hxxQrqmijJnkO7w0WmI5x0b7py9dpVwPH
	/oRRLNpR3x5MzPg5GMZQ1qcAG+w6mHmS8xevixmGl8w4Wv9LJiX0BXNnA=
X-Google-Smtp-Source: AGHT+IETGSl1uxRRGha8frlIqsblK4r0WHTu9TdM47HpMpf5Ho/Nb4xRr21zs0tQQbaFZkPqBaK3ooec8pUWDP2zoKk=
X-Received: by 2002:a05:6512:1151:b0:54b:f99:776c with SMTP id
 2adb3069b0e04-54d6dc055ebmr334374e87.24.1744916255653; Thu, 17 Apr 2025
 11:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk> <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk> <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk> <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
 <CACRpkdaBNVyXUwErHTtGBnUjh4+6Ojb6fu9M4E7LnRCu_Oovpg@mail.gmail.com>
In-Reply-To: <CACRpkdaBNVyXUwErHTtGBnUjh4+6Ojb6fu9M4E7LnRCu_Oovpg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Apr 2025 20:57:24 +0200
X-Gm-Features: ATxdqUGcQlRT-2l2du6IEq8CPJq-yhYNzC5ncqkeIscW_F55DHxr0702vBChsyI
Message-ID: <CAMRc=McFBAG9Gi3UBfsdoQ=78fL3sTK+ZMToXWGF=KOw6zwPiQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 11:33=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> Hi Bartosz,
>
> this caused me to think about a thing:
>
> On Wed, Apr 2, 2025 at 12:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > This is bothering me. This is the abstraction reversal I'm talking
> > about. Should the regulator drivers even be concerned about whether
> > they share resources or not?
> (...)
> > The part where "the higher level users want to understand that there
> > is GPIO sharing going on" does not sound correct.
>
> There are precedents for this type of semantic IRQF_SHARED
> is used whenever two devices share the same IRQ line,
> and that is something the drivers have to specify, i.e. the
> driver has to be aware that it may be sharing the IRQ
> with other devices, and whenever it gets an IRQ it has
> to check "was it for me?" and in case it was, return
> IRQ_HANDLED else IRQ_NONE.
>

First: this flag has existed (as SA_SHIRQ) since before git days and
could be considered legacy. But also: it's a bit of a different story
as sometimes you get an interrupt and need to read a specific register
to check from the status bits whether it concerns you. This never
happens with a GPIO so I don't think it's a good argument for this
specific case.

Bartosz
