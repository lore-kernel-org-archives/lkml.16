Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546AE1F4167
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410845; cv=none; b=HL3Gs7oZ1j8TA9EDsT3BfXqfA2I5zmSWh9JkL9y6YOy0HBiYeO19858FqRX2g8fYQDXupcF5uSVhoE1d4MY+BX/AAYH7FTdKaS/8R3cvKPMfA8YUPZLNsmemyanOaktAKL05tUxfwInPdI0iEQvDOZhkhx4tmUPEAAPz3XQ2VHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410845; c=relaxed/simple;
	bh=JWIAObcKDCSS5jaLNcTcz91pENIuWUJrYuOG5yyP5uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxuWn3eCwKaDoPrTyPcZwIa/MG9pYiUCrAK8IzdwtKzXBP1/Za5VviGe71BeEvbDjTOdRNNKSlv1I5v7WxTQKDSyjy5MaGdE6hg/GUSa8oM3n3+zTMTg78KzUYGtkKyMYF26mMYRyOOSSCOTV5FJyrQ88AS00GN5BC+dfFgKcZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=loNoDGht; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="loNoDGht"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30f30200b51so71024081fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745410841; x=1746015641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWIAObcKDCSS5jaLNcTcz91pENIuWUJrYuOG5yyP5uQ=;
        b=loNoDGhtPFDwLtyn6lTEysmHBdvdLLrqHgGNyAVB6bHomhivdQMs4bkrqjHcKuvfpi
         8FrqcxSArQ4hHI0A1wsttMEjR4nbfK8Y2Ayq503riRwPj6lnMaPKU9FTzot9l4LoKCHj
         E0Ma5k+UHYAcj0IJHnnMAoZ9W6D/JTLJLWWlFkHqC48914M6ebbd/ZY1JTRTlyDinAlG
         CiIPRbFQle5xk27Js3BWki9878KnDuOfru2Mew0lqdd6Fu+Y0cR1EF+V8OIZyYlLq7VP
         NJ5MXPgxDJZrDSl/PAn03cjudkNYlhPI00vwFWMqY2fKKA2NAUW404A/hZRdkZ0RJ7Ta
         LxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745410841; x=1746015641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWIAObcKDCSS5jaLNcTcz91pENIuWUJrYuOG5yyP5uQ=;
        b=XIIRMhj9MdodjggtG9QnXpf6wUMNCLS6d56h5Cgg9HWURN+apgllI31spKWNvnXBmh
         dwsKqlzbh2cEE0CoVS1CF0aWItba4qQXPeODWaF1+GoVQjaJJsgu1hRGLIqj4phNUhuY
         xC5ojTb6NfRER2D7tK9Ve86Pp9dKbXdDlBxvmlBwROlleLldcG6o2iOSMvbS4Lq2/hC3
         t6OQa/jN9wiVmacTbd3S9RrJca8FqlM0T/41Xi2r7a72yyWz7Vx0nP12vDhmHjV2UHYj
         cSxNGlxk9+Ir5xi34yNH69WAxmIIJX3o6Cc2mpVqBdlo8nyuQ14V1oZjS1yB1bJ6Uhem
         99oA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3HfoDOoVE4t0nADmeDigIJ/GGooTXOT7r99nj8x9qPbuRNgYfBQH4k2fdNrgvZpQXJiPsHMtwOst4mM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEprI0irTLnXiatMYm92sW+MS/VQSSbJkYx8p5tVtbhmlMJWY
	MG5EImQfboVRyt11rtxEw0PCAGllGwlQVP7+juTGYwC4hNvc0eoK5Qj/PMZ6QykVW0Q3waJmfTE
	4I8dIolrPxxkuD1lhL+B7zRfxESmvJxXtPfIZjQ==
X-Gm-Gg: ASbGnctAXabAb7n+rIvbo9RvkA6AfrjooPkJffioDzhnEC8gxM59TnCHHL2Nk6M1mJo
	3sG+dO7dZ8ucXCVwYIvB/B4HU+TrHbnz3/e9YkxXGlbbAmKyZ2VNLQSPJTBItBx2A2H3EuPO4bK
	lvwnDN62e741tcyYFW71bWQKss8TIVp2tS1mj/2lpytGuwv08wcc+rEG9u5ubw07d3
X-Google-Smtp-Source: AGHT+IHdOy6Vd80a71VsBDq9vq4NcDgqMFfcNVJIb9jbOrQ25R+2kyWaeho7dLvnMD7PoIkydcR5flY29jmHWUrtlnI=
X-Received: by 2002:a2e:a814:0:b0:30b:971c:96e6 with SMTP id
 38308e7fff4ca-31090544994mr65437581fa.26.1745410841172; Wed, 23 Apr 2025
 05:20:41 -0700 (PDT)
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
 <CAMRc=McFBAG9Gi3UBfsdoQ=78fL3sTK+ZMToXWGF=KOw6zwPiQ@mail.gmail.com> <CACRpkdaKBDyd44xPA_kBxR9HVFqfLgcSnd1UDHumyB=m5-B3xQ@mail.gmail.com>
In-Reply-To: <CACRpkdaKBDyd44xPA_kBxR9HVFqfLgcSnd1UDHumyB=m5-B3xQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 14:20:30 +0200
X-Gm-Features: ATxdqUFPfchZIqBJZBy7vOjihOhPD3Ut0RnZdl-eHYA4dR5GVziVhoOlmDg3B_M
Message-ID: <CAMRc=Mc9fMrx0bek1mE2kpoxXVgD7GATaeQWZnL1eDW5oZ-FTQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 2:05=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Apr 17, 2025 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Tue, Apr 15, 2025 at 11:33=E2=80=AFPM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
>
> > > There are precedents for this type of semantic IRQF_SHARED
> > > is used whenever two devices share the same IRQ line,
> > > and that is something the drivers have to specify, i.e. the
> > > driver has to be aware that it may be sharing the IRQ
> > > with other devices, and whenever it gets an IRQ it has
> > > to check "was it for me?" and in case it was, return
> > > IRQ_HANDLED else IRQ_NONE.
> > >
> >
> > First: this flag has existed (as SA_SHIRQ) since before git days and
> > could be considered legacy. But also: it's a bit of a different story
> > as sometimes you get an interrupt and need to read a specific register
> > to check from the status bits whether it concerns you. This never
> > happens with a GPIO so I don't think it's a good argument for this
> > specific case.
>
> But at the same time Mark describes that drivers using a shared
> GPIO cannot really be opaque as to the status changes on the
> GPIO line, as it may or may not need to update register contents
> depending on whether the line has actually been low or not while
> being disabled. Maybe this can be fixed by a per-consumer status
> flag in the descriptor such as bool was_toggled;
>

The few use-cases we have for that use regulator notifiers at the
moment and I think async is the way to go here.

Bart
