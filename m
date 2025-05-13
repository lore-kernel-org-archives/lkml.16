Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344DD2770B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173662; cv=none; b=hu0yMc1ay6fu/FK+FFzmKbzST2YVsINoWdyeNZfcPRexYteppPhnnGKrWUof+rWTCn2yIlw1W3Lts7oeQ1OVnnbKrmzNEr+UaCD+T9povbVbpsU9fLuctthlx1fjQ7lP/gVhD66iJATvPKz4Dg1QEs7Z5X9Oxo9eJGeSQq6KhMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173662; c=relaxed/simple;
	bh=M8KwhjSS1RRu3vcmpn2SJ50X7pXkQM18VTy/pRaCHMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQbc0+Dgh01ogiEB+UV66k+jwqycg9Kq/c6/mOZTwzmSeX8HraHG3TdUgiaOHH/9swxxO46rjlQlgmQcKWyZ70PUnjBJ5udqRuLsZHpyg8d1O+Fr7f2wKfkF/PcOFeERsNQrpHOtMcUpSWdtUhYFTc3oot5GQ2k2vkmaIRqvA9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vo3x8pcQ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vo3x8pcQ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b0d638e86so7107777e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173658; x=1747778458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBfy0IwztkKYuj0G9rqTe8PA4ZbPefuZXYlpy/l1Wu8=;
        b=Vo3x8pcQZ2HFIPHzMA4ouSxGDci88uoAiujFtVopnbPUUOwvAckr+rIqapjT0Zdo/0
         Wigf07pjgHY7g2PW7WKYcwG+xJv1hTw01zFO++o6MfyUNT68ZB4o0aJQNob+cWFm5fga
         JJiQgxAQPeVBHpa+I9Hd4wLn7VXCgVmm25lqsNa2ZRcndZSQyCX7Mv2/DykEziiFuKAd
         Q8VkNWUXIMgyYO+3e0zr+D1YjL9wtM98yAQGIQ6p3S2IufpwLDwFY42VzXTuuO0IE3KR
         xmT+dGMAbtnLdpTJTa39t3EYGX1Qh6sqgCop3FFvQADTbKDMiY+Ho7HJoBNoyltCtOxr
         OWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173658; x=1747778458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBfy0IwztkKYuj0G9rqTe8PA4ZbPefuZXYlpy/l1Wu8=;
        b=EI/r/bvdSnAooOR8U7y7sfyAj6d3lmSHq9+R5rcxvODF2GW7R80te2GRkCpaCfOEc1
         X6+UJF40cRwMzJhIfmZvkHWvZ6TX9uTXXGzrpbGWPoJLAHze1UeqCJ2nHpraMUhQPfx0
         jU5kVYHa5wS43Wg23H8NrFn9kvJn8YY6OJTv9ywojDC3NJYofZ7SRhCtazyN5CzDEiMU
         SAfcPg9TrfP7XIm60lQaXaJHo9An3+fDdQQd8+S2mDv0xGD6y1pcANbwCVja7JotK2tr
         EAkwH9E8FtSzTl6bf3xNCcOOjZWa3Auevbsl0ydxjbfx7hN68ptPH294kpP89obPlFya
         IJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZFcFi3Kt3azZValMEGML83Jc8wjUbdDuNFPrBzZDepcqM+8Tx29OJwkjArnHSEgrHtQuBG86k1odG2ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDADfUCa5up0Q5a27NQFYIEv9tDCNhvGWBHYtXHCRSy+RJ7U/U
	IqXxZybhS8mUoEQ71LK3y2kMv/SYOtKSoyUDKRWSSW7j7yJ6wGJnurqfeWN4mvMUN9ZPecf3wxI
	+h8uAiYCXj6hn8iOZhxid7/M701OSVtpKhUtM5g==
X-Gm-Gg: ASbGncsqIPTgMlalfaYREk6LaTxb/UWRWur5leOFtiCrLubztuDP5DO1pet8OE7RYyb
	z4JU/grfrLsqym3Bj/mEsO1xoXM/oIoR4qjLXa08mpigljnJD6QprB0bdPT76I4oJ3NgshAS+N0
	Was86sAU5DJ+HqoYC8TvbAj+WxSoul5D6Y
X-Google-Smtp-Source: AGHT+IF6oQ8WY4oAI0j38NTw42hro7gIMITGeTqxvpzWEjohz93RMVVPR05oQB98ewc/+Rrp9dNkz0FCv7tTOl0hN8Y=
X-Received: by 2002:a05:6512:3b86:b0:54e:a2f8:73e2 with SMTP id
 2adb3069b0e04-550d5f97caemr383042e87.18.1747173658262; Tue, 13 May 2025
 15:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
 <20250430-max77759-mfd-v9-5-639763e23598@linaro.org> <CACRpkdY15L5PpV9ah_0R3ZPZVMh18OR+Dg2qXiBG=8Kq79-rjA@mail.gmail.com>
 <20250513093414.GE2936510@google.com>
In-Reply-To: <20250513093414.GE2936510@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:00:47 +0200
X-Gm-Features: AX0GCFuY7ZYIvbVu20D__GD0c9z8y0Fmgn47-CA055_0KC3QdyO02dOBRgGKdxc
Message-ID: <CACRpkdZTB2NSZPYU=iMEFuH=rb3HWVu2A=8OY-sq6X00ZPq9wA@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 11:34=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
> On Tue, 13 May 2025, Linus Walleij wrote:
> > On Wed, Apr 30, 2025 at 11:03=E2=80=AFAM Andr=C3=A9 Draszik <andre.dras=
zik@linaro.org> wrote:
> >
> > > The Maxim MAX77759 is a companion PMIC for USB Type-C applications an=
d
> > > includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > > Port Controller (TCPC), NVMEM, and a GPIO expander.
> > >
> > > This driver supports the GPIO functions using the platform device
> > > registered by the core MFD driver.
> > >
> > > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> You're only 2 versions behind mate!  =3D;-)

Yeah I realized ... I'm walking up the backlog and there is occasionally
these double acks...

Linus Walleij
