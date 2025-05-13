Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0F021FF22
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128428; cv=none; b=cG8/2T19Bae5qPZ1YHQBJMbQK6mrRet23WZjIxY2e4cskCNfTO4IXMipxvWvSqE1mm68SXxqlIy+Y8kBGWHOgHZD/HJxEGOfw7gQP0xv5wqmD5Cqq9B+wuawzA5M/sIs8Z0MUVSWJXoxP4RbzVgZECLdVwxSVHfFiOItOp+sMIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128428; c=relaxed/simple;
	bh=dBHjeKALgKb8PK7SZY/p8ey0dlC17faEy13K5JvMwtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuFNmSsMJT8H2oaR6q6SGYULg6huL9wZCk6RIm3H/9raY8Qhdrr2PfLj/vMMLcP0KhqBLxLLq9dY39FeMZUiC+EEUPjorJPnqTJPNRl8wWnhm845bed04iKjd+e1q2ILT+Zx2/hvzjo1RefDRLsa9azj83fSKB9GUN5Br7r62N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQCXBuIA; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQCXBuIA"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54fcc593466so4084341e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128424; x=1747733224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRI51hopg7WgPcKQ0KhMvn+lW2eJu7995NqNQ16hkew=;
        b=EQCXBuIAzkrJ0YcaH2GFD2Kn7IIkRf3EfASYuN9gmZmKU011yTL9ljYuZqcyDQgEjX
         DatySf72ZK7SO/csXBc9SsEQOhbG95HVAcWAnDdAk4rFptHFzcKZG7tsYxDbmvu0SOdj
         fYlQBpROD2x9mrbHBbHMsJ0G+mh9VHbn9HJ9FSCkrJKm48dfLbsFW6r6kVlsT2OilRG1
         moLllsokiYKYf/vq5+zzSFrPLAI6rdDF/q35GLKOKFTmBPJouZFE62KQE1UXe+xmGifh
         PNSwzVEGFN63bOlK8RoAokLHfdzXfA75TN4LXq11A9uq3/oimB9vsZKHIdBuHYEufTKX
         t14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128424; x=1747733224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRI51hopg7WgPcKQ0KhMvn+lW2eJu7995NqNQ16hkew=;
        b=aj5E+3rUzNR1NeGJpE52dN7ALDbhpeNesE13AhVN9xQsDqfeQDycIRw3okc/yiprUT
         K4/0E2oUQKmHY4yNILSUrhXBdLxjQmCRhsKwAf3ESS9JJElJexhYZLcZGDCnMn9vsfub
         vagfr7JmF/q7K2JeuUO+a95cCp726sTDPkon/LeeJpB7qMlDgs9g1TPc3p0T43yWVwow
         CJOzh5AxAFLKCM6huqVBUpWCNzIqVzFt7giHgRA06Iw/jBGM+hi1tvVGYthscBZ6buys
         cv/PqWKiLmDK1Oq1mKBIsmrxqlGShNNqVbGjdzkqgp1QPr/f9zhL8zxClgrRl5+iMvTv
         Zupw==
X-Forwarded-Encrypted: i=1; AJvYcCVE66h5nI9+2zX5Vx7Aj6q8f1ievQv0oJtACwRS2W+BZitZOkXquduO4Pu3/WIYm9MRHVglk9OI0RcmN08=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYWIrFcj4SS6fZMW/QxNb8YM43PUXVo13aMj5UIEtPkfdjnz2K
	wiS94uPQAN+ZzVOewWIr9zZ6ZzTB/YiMdUlpeSIXmGQGP8Lr7i37sGgaq2hsZ6qWwtPtF55Ec83
	/Cd3cI+Afz1sG1yQDCiG3VoylmJ3kt7lQODH50A==
X-Gm-Gg: ASbGnctf3e2oneB8UuXABr76xPpgYFc33P+2ZNaIA4dTE7PxG6mfVndggTWIXt+Shu4
	TSoRjcosklRlFHQQ91fHNuv72WW37PW55ZownVaMdFmc4Gjw2fUBjUccB3mfUNrJb24y0D8QkqC
	Ue2/6HYpY2yUzMe3I6+9v+C1wwNo3DSjHr
X-Google-Smtp-Source: AGHT+IG9aZSpEQxvWlu8ce2CXwCkeQw4aEsqx0A7UdazXuZrCCQu4J181mxHBoFbawXCJgTrKHYOmXCDjY2BLlsEQTo=
X-Received: by 2002:a05:6512:6408:b0:545:2950:5360 with SMTP id
 2adb3069b0e04-54fc67c2233mr4949153e87.22.1747128424591; Tue, 13 May 2025
 02:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com> <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com>
In-Reply-To: <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:26:52 +0200
X-Gm-Features: AX0GCFs-_g09qTgH6m_jk6ylbKM6K0LWLr1kjRESYHMTO1WN6HIA2pdGmO-YFt0
Message-ID: <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Doug Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

thanks for your patch!

On Tue, May 6, 2025 at 7:28=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
> On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:

> > +       /*
> > +        * hog pins are requested before registering GPIO chip, don't c=
rash in
> > +        * gpiochip_line_is_valid().
> > +        */
> > +       if (!chip->gpiodev)
> > +               return 0;
> > +
>
> I really dislike you dereferencing gpiodev here which is (implicitly,
> I know...) very much a private structure for GPIOLIB. Can we move this
> into gpiochip_line_is_valid() itself?

I agree with Bartosz. Patch gpiochip_line_is_valid() so everyone
can benefit from the extended check.

Thanks!
Linus Walleij
