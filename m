Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C273199BC
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748804187; cv=none; b=I9X8GYQ31FKl/kNxHcb9F2xCv64D+pxl29Hjiqg9KirIa2v0xYmp7t3rGEQvhTNtiJzeiDEvjL2KC6I7Y40qm+RWmUNETZI1pXxxp8ExvDhtAwMTnwmYiSk1q0pN9PMpxMfVdi5xIvxC8aCbgJ7dgL8omY4JW2QSS9dPOkf+feg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748804187; c=relaxed/simple;
	bh=yKnYzLcAwbSM+H0DAr4L+rSEPNniOcTWOxLYiYmCBtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8iEkM0wqMrCUCLAITLUOYYeddWLFnyNuojHjQ5DE4IpZmZ8/ERggn0/qB6dAQ5rCL1vncE/8ZA2QGt32Dj50Pz3rKHIMcfiCcrT6xxPSC4cDlOftC3XQXZeEUqNs+M9G9/THIjQTEg2m4t7g4QRPLuDKNqg9Z7k7ROWZGXUw/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KHmRVDnE; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KHmRVDnE"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32918fe5334so36026711fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 11:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748804184; x=1749408984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKnYzLcAwbSM+H0DAr4L+rSEPNniOcTWOxLYiYmCBtw=;
        b=KHmRVDnE5BFNv6flLMNgKKB2PfKVdpnBOFP4NbIHyu0KPRCtrUIHHfvGX0shCoJ/ke
         UflGVBH/T8rPJpFK8OQVp9lVz2bbhSeNlI6Sr74SgPOjSv5tCNtiMUoE9It7eAf7ZjVu
         cIm633vgQkiOR8B0Qf0cN/YSb4+FCulV4JFJx5eGaMPiPI4dfcqBg9/qM1u551wtnwfI
         /fZxBeQeuDvJ4vS3pvYAPVxXbDJTr19TVhBe3PZGZRAAreLiwIAXRw8njdWMo7VNMJgu
         gylEKz/4B3Ei9OMztM6GafDf3ZSwfVO0XaUWRoaZ6O3wDarmKmo5B/I7R/UEzzaMO93a
         4aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748804184; x=1749408984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKnYzLcAwbSM+H0DAr4L+rSEPNniOcTWOxLYiYmCBtw=;
        b=Lb+EPsbeUFwcDJ2s8AJkL9FvRF8YrdZEFZxbjYcFoWbDVWr0ABc35kMFT6AwM00ZNO
         1j+0TRC4FC4RakQBDJjzLRe9Em2ZWK5RVGnoFYEXCZs8aQbJ+HmaWhyGunYT1lraAOp3
         DMP3BQJL4badzLNhuW8+8Rkshqmps76p3AEiY+OzQRCE209HEFfscmIzmhDh3O2PA8Aw
         7kPuuW8COlSGH9RxPSOHcza12F++Nn2QJpRjYER3AyyUXm4GZIPiwHnMFKGXYu9FH5QL
         u1gFJwpB6IsMEVuSZsBsYgzjbE1avd6s4wUZ5i7R5GLsX4LavdlTUHTBhYB3rx6OqnbH
         Q/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW9sP02ALOh3uOCvT+res5Jl5A4jvZwjpO9ISTGPO6WBHpZuQf1HC7np5ZAFwWEKuJTsDTqJADZ8HoKJDs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Zc9NdsGko1BhuUbcAqY58OYuAMW0S9f3d2gKw18DsD8dRRPv
	Bv9MYuMInHtdhCe+3xID3mOXxaxKtuYGezS3VaBNm+Ha23rfXYpaxN6EFytmsm3qFW6zdr5JAd5
	yKBOTILQiJMLw57tUgMIrLtxBeKd8r1QF+JQY98ovtA==
X-Gm-Gg: ASbGncu7tZTpMKpM4dor8vYIbL3r9HeR3YV/0nR1kK21lo4ngQ5ztj9RpdFvBbTnf4n
	hDRAxBGTv4UX11DXQLFE2ylDooBtzI5JrR0yQvg+h13XvmNB2GjWYrvClNfJ34C0vvo/vcDNIig
	Tnofo7FBeX95rGNkSJcQD0L/WarNUUWqEr
X-Google-Smtp-Source: AGHT+IHWugAFf+Ripj3VUOZJLnmt498bht889QVB6ArTYpEoG3QYd+TfDIDQfLIYoH9of2fvyyRVVS47ydzCrnVNivA=
X-Received: by 2002:a05:651c:1441:b0:32a:8591:66a0 with SMTP id
 38308e7fff4ca-32a8cd2ea22mr42333001fa.1.1748804183642; Sun, 01 Jun 2025
 11:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527111353.71540-1-brgl@bgdev.pl>
In-Reply-To: <20250527111353.71540-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 Jun 2025 20:56:12 +0200
X-Gm-Features: AX0GCFsnhGQ89VhgXgySprlvtnrpAVgiC01-8pycRScH7HJ4gi-FEvnTKbvX_3k
Message-ID: <CACRpkda5UOqav7Ew-UJ4zPH6xpmrDNg4GmHawKfNr8Cf2rJANA@mail.gmail.com>
Subject: Re: [PATCH] gpio: TODO: add a task for removing MMIO-specific fields
 from gpio_chip
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 1:14=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Currently for CONFIG_GPIO_GENERIC=3Dy each struct gpio_chip object
> contains the fields relevant only for gpio-mmio users. It's not an
> insignificant number either as it's several pointers and integers.
>
> It makes sense to remove these fields from struct gpio_chip into a
> dedicated structure but this is not trivial due to how the bgpio_init()
> function is implemented.
>
> Add a task for tracking this rework.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

That's a good TODO.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
