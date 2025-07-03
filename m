Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF532E3AE0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751548090; cv=none; b=Z5xDE1HVYNF8EdvE80J/Av7QpSBJ4PGrBiQho1Wq5gp9RS4Q3ht9wWDjW2d93MOtdvxz97ts9Lchahyxuw4IjL4xy0s98Mmy6J+AB+X7aBdHpGifNMFh/zqHyyj/limGbSigpY4F51WGlQ1LFhh29Blhhf21UcVCCxtPjoMY8w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751548090; c=relaxed/simple;
	bh=JanBi7K9weyr7XmGzKurXsUQYBOqj7Q+2l2ycsuOc8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKLSzBCXwe8h0P67MFXRfM31rCFxAOnK6FGE2imJFYPf74F8P/atkhG+BWgwgAFo0F7N+uOlRdjDMEPH4H1Fz9kw+QQcgoZxsXpxV9IsuijnpJ42UqtAC2uF1t/rmNEWBm7nvScQUXlaR7t2dzcKk5axEczxBtryWt69xNl4XP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PWeSYD5S; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PWeSYD5S"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b553e33e6so48496171fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 06:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751548087; x=1752152887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK4OKlfFeC5d0xwGKjxMnVvoaWzs29QyrzbuIGizZlk=;
        b=PWeSYD5SWBijTvkMp8+pdC3F42Wvc8bShMdaIarmiNHYsfTwGUu4cjj66QiRndUosu
         owYgOcbIkhR3gAczs4Wc61L7kXgHXAkbNx+2O7PQ4Jd0S2zLips/ZViGXmjNeKmAZGKS
         rrq+z3SXmEVtRJP1OxYEOUT6BJWmxY1+eXsG6dzjvgkUUxWf9vmZKo+ve2WNZAl2Z/BZ
         NUSuo6z1V0JvVQx2/3NAvvHb6PVNzeU9z1kjWePYgPwLXb2nmbqreGls7ths9z3tsxbF
         mIRhzI8KqTZk4Oe8R+h2alG3xMQeaJszZcNmjbxtIhva6mPUFiKPH6pPaHT8SUbtyVG0
         FezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751548087; x=1752152887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GK4OKlfFeC5d0xwGKjxMnVvoaWzs29QyrzbuIGizZlk=;
        b=Sr32Pqwd0MI/3Poujtg7Uwf2dncyfsxdbkzmALK6jXwDprxdC/ru8/PovY8Evgoavb
         XlmPSUt0WK47NNI+xGDLTChpBfGBYo+M8o0WTfPVyuJxGRdrsBE1hXNz48Ms1jXSKbxK
         VeSTuwDnDYAjOqm0egrpu7VO3NtqYlDUeQl029SvrKFbX+TyF1LUqwMix/TeKgF8WCFb
         hdDj+VtPlVRB/gmVmk8vAto3D3xRBD0ZvfEC7ihAAzzX+wQcHcx7N1zvhHJdpZO/ALWN
         +On77Hyp7Hi2de4l2SKsb36owVfTaQStGUitVA0/ni0pkpdI2EmK7FaS9sCxwqybaRYR
         ziFA==
X-Forwarded-Encrypted: i=1; AJvYcCW3b1aiNN2Yhw95eoN+26Ks493WqEBvovJ+4slHJ3r3tylWM3sBGYMgJ7qi+gcKI/nfQ4gSpUJrVS5zD+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzshUBW78ymVCSbf9kJoaT4qYNAtbXGSEsjdZ1svCQpfBiCYrq/
	D948OQl7Yd4UZ0Yhoe0lnujH5XZoQJF0QMvrM70ERdCm7tawNqxMZTfpa8vVx8tJ/6XflmiCn42
	jTKHyWnFXGxU2eW7HsQM7AnKtpB6td1nE1YzrkxXABg==
X-Gm-Gg: ASbGncuy9UQnL7aolJWIxpRmMeW0ao5AVMQQtWezh31m4nvBPV7srj3ZUpiFH0rF2gl
	rWMq6mjJkH2Rqv2rIL7OEbybnQW5wAUIfa87OgamY6mxZxcFC/uiRXGz0CuS2dljy6alk/hdt4W
	sJzXov7R2afVfi7TMHT1nEiECl7ea8wvkTLtq0f1zf/jjOkSjPykwHKrhZBHD9HOaLY/fG61Z4V
	Q==
X-Google-Smtp-Source: AGHT+IFBpm7cQyJ+Bp1kO1gYZd6KKdHwC5WEoxgmE5pWV9k610l17z8/GvmnTu9RQrdixKBfL2RDfjtMmjSVA+fh0hc=
X-Received: by 2002:a05:6512:68d:b0:553:2375:c6d9 with SMTP id
 2adb3069b0e04-5562838b7c6mr2703310e87.55.1751548087045; Thu, 03 Jul 2025
 06:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617204402.33656-1-mariagarcia7293@gmail.com>
 <20250617204402.33656-3-mariagarcia7293@gmail.com> <CAMRc=Mftput7DO+nmOA0yMcB0SvtsDf5U25ukkMVuOnV4XfX=g@mail.gmail.com>
In-Reply-To: <CAMRc=Mftput7DO+nmOA0yMcB0SvtsDf5U25ukkMVuOnV4XfX=g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Jul 2025 15:07:56 +0200
X-Gm-Features: Ac12FXy6w3XoUynazt1SiD5Ofkz80TXW3KXY7DW_5eZ5Fql3aGlbenMkOR_6Sy8
Message-ID: <CAMRc=MeEj574YPgX17S8z5Z0miaksWw-2NQMhpwsjNL0z8FT-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: pca953x: Add support for TI TCA6418
To: Maria Garcia <mariagarcia7293@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maria Garcia <mgarcia@qblox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 1:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> >
> > +static u8 tca6418_recalc_addr(struct pca953x_chip *chip, int reg_base,=
 int offset)
> > +{
> > +       /* reg_base will be TCA6418_INPUT, TCA6418_OUTPUT, or TCA6418_D=
IRECTION
> > +        * offset is the global GPIO line offset (0-17)
> > +        * BANK_SZ is 8 for TCA6418 (8 bits per register bank)
> > +        */
>
> Please use regular kernel comments, not the networking style.
>

I asked for this under version 1. It's still not fixed in version 3.

Bart
