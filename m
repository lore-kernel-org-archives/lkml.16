Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2BC27BF9B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323505; cv=none; b=pbgNskxgEaTS6FVe7yxjJjIWXfeW1xadcyHrZP9irZqA+9CCkU40sygQJwo//HGizO9d1ESlaWgsDHgQ/aeADdjJ60Kg9gq5EGrznt0biGjb4r7OHbHB22ceV/QrVoQdAYEoHNLxoL5IXyriBLhY3H/Ttss4eBRPUmuSRuRmTMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323505; c=relaxed/simple;
	bh=uMQRw7xKMs8KQeCWyqYOOMm4p/Ip2l9um7whf1MJYzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSyYBjqncnmlwdra8Jy6HOr+0DThOnZmcaKSZw/e31powoCkKYeXgKAA/hnYkm0oOsq58JtIucr0TagiMUBUIMTCwnpx30b7OLcSbnIJx8RUEmJKvWfSqNAazjjrLfu1+wTooqQHewb0zWPfF0enjNixtEoonEudQtlcamuNE24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gk8cqi2j; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gk8cqi2j"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so44725281fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745323501; x=1745928301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMQRw7xKMs8KQeCWyqYOOMm4p/Ip2l9um7whf1MJYzU=;
        b=Gk8cqi2j/M4kEmshJs8Z2W/H/ut/ZMRvy33Y7BvSq5MWKtLTfDXu+9W0vhsPp2s3yC
         30ntB087YmxwHVtrvA+HEz3eubcfmW9u6KvMwwnCBQ5EIjI1wjVKg+ALZGQvcHN6CjJC
         v+8q45MVHXdqQnU9Ug+7Ek34+X/nfxsmvq6fTFfkbQVjrlEGgLXLPsMpo+lGpGO2QIHQ
         yLEZK2Q21tHnJPOxixcNPhVgsXOU8WYwGuzo2UlDUwNFaCGtrn/QQoHZ4X5dCLV0Xl72
         IbAKTAbrPU8wa7tYXBjVIq/Iq/zlqL5nTrDqYRyleIlGfFur/plaS21HOJGe31qnQHQ5
         LGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745323501; x=1745928301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMQRw7xKMs8KQeCWyqYOOMm4p/Ip2l9um7whf1MJYzU=;
        b=rIl8BdDgx+WQlpEI6c3IF9Ku+aMabCfeEmG2E3FJ4Z8QomfYdFDPKj+2iBy22smnzX
         P8JC23vVy1iFpOy8tfWwMl7y2+jwRogVIGyAeKrZUSBtR+AvXpcfwRFevmaxMbSRLJhq
         toSvxaTbfUd8mfO285BQ8IkuaLWBs8h0bATfbjmPkbz3gkTNNtmLJv7tmMLUz50QDSX8
         85wSxVG3lDZdNLlYYRD/Hq3PL0Tv4ct/x0VTpKgr8TzeOyWQTEl41kMsds1+F2vAbB2B
         ZZV0vlOGB058qnRcbmwLY4rbeIEfVVrkYFQISQ8bX6T1BUm8K5dLvhyCbkEb0OGhHKyf
         OZdg==
X-Forwarded-Encrypted: i=1; AJvYcCUDuS56UC0rWDtCDhC1wCwNGaUoo7gJioXaA0v9vuzYgqG6yA9nAMTLqTH1xENSfVbXPRdvpIslH3DTX5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoc2Sa9s/TYSirrX8iHSMpDJsbgLtDY5PaZuecJrIF5X1A3PDd
	XsrJP3cl8oLpm3/u3bN7z3l2Vczj8tbNBXJeEI0kCZ85zepWpc5yUkQOyXyLlkTqwS4h4yBsxDV
	CfPyD+Q2JORVrsXWg9AowibKW7BcnaW7XZoQQPGs8+I8Kfo6h
X-Gm-Gg: ASbGnctzyZbkZ7lkxctdcYohBZET8UJm9S799t/ZWdPWRkRSzxujdTPkxIF00/NLd8T
	mJdRO4RQTE3Xalgh/dCtF/MBI9VXg1wHhRAEwd7u5LpuK8rUZMt5KLpFIUSBmz7dze6bMNZBeW3
	NyYDhCIHAbQTtgz+ZpiWtEdLJUqN+t0XSN
X-Google-Smtp-Source: AGHT+IHPemK22DPFUms0mXXumZBMh52fGsTWqcUIGVBNnn0m+3sy8nwfSvHGhSNlw69psauekkZ+b6kCc0AjA49RJXs=
X-Received: by 2002:a05:651c:1581:b0:30c:2dbc:6e1c with SMTP id
 38308e7fff4ca-31090553fc2mr46951441fa.31.1745323501235; Tue, 22 Apr 2025
 05:05:01 -0700 (PDT)
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
 <CACRpkdaBNVyXUwErHTtGBnUjh4+6Ojb6fu9M4E7LnRCu_Oovpg@mail.gmail.com> <CAMRc=McFBAG9Gi3UBfsdoQ=78fL3sTK+ZMToXWGF=KOw6zwPiQ@mail.gmail.com>
In-Reply-To: <CAMRc=McFBAG9Gi3UBfsdoQ=78fL3sTK+ZMToXWGF=KOw6zwPiQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Apr 2025 14:04:49 +0200
X-Gm-Features: ATxdqUHDZZ_pSamUXFaenCh_Qh4IQISeUuWIAJhxw_2OOQLqEYUntZ7bYYx1dL0
Message-ID: <CACRpkdaKBDyd44xPA_kBxR9HVFqfLgcSnd1UDHumyB=m5-B3xQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Tue, Apr 15, 2025 at 11:33=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:

> > There are precedents for this type of semantic IRQF_SHARED
> > is used whenever two devices share the same IRQ line,
> > and that is something the drivers have to specify, i.e. the
> > driver has to be aware that it may be sharing the IRQ
> > with other devices, and whenever it gets an IRQ it has
> > to check "was it for me?" and in case it was, return
> > IRQ_HANDLED else IRQ_NONE.
> >
>
> First: this flag has existed (as SA_SHIRQ) since before git days and
> could be considered legacy. But also: it's a bit of a different story
> as sometimes you get an interrupt and need to read a specific register
> to check from the status bits whether it concerns you. This never
> happens with a GPIO so I don't think it's a good argument for this
> specific case.

But at the same time Mark describes that drivers using a shared
GPIO cannot really be opaque as to the status changes on the
GPIO line, as it may or may not need to update register contents
depending on whether the line has actually been low or not while
being disabled. Maybe this can be fixed by a per-consumer status
flag in the descriptor such as bool was_toggled;

Yours,
Linus Walleij
