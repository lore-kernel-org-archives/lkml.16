Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395DE2367A6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814803; cv=none; b=dLKia9yJtCn6dm2Z2e4i7e7f1s2tDU1Ifr8F5CpsAc7v9Q5no/PSu8ZDhSZvJBSXkoNKeC9xondr7aeR2Vl/5tnCz8EN+EIbAZ/uBScVfqHRJJAYaCXnjrfi2iB7k9sGlhD38j7Qr9ajYg/jNSM8OBiX9sZWC3fIPV9TIZ5VWWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814803; c=relaxed/simple;
	bh=vmWq8La8V18v88CVLflvXrgvwKzC+y7QtPzqgryZIak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xc0XiR92SZLwnRpbq19d8oYP/2bfaoayNsf1AgZo4ICIZ8xHaaTFaDUMBf0J4wOVrhMdgIx69xLxwSuIE2NZh9VsyyJ65P3VkiahkinaKxTgatDQUYNjVSVzr5Wc5mvJ0lSS5pnNVPXkd44SKvNLKQ/vTIshfcUoxxnASSf99sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Uth0+NE9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Uth0+NE9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499614d3d2so7974629e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747814800; x=1748419600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmWq8La8V18v88CVLflvXrgvwKzC+y7QtPzqgryZIak=;
        b=Uth0+NE9eBUqwamGju1GgRHr0bzsFpO98qPb/jkTeobFV1HNRfY2jUlLTWZrzRfWRg
         9THlUqB928FoOz2EQlucJUUCrvJPjWW0nTOg+ASPX8pO2i5l/Gl6+SCyT5uzz2rdnekR
         tP/qPW6hmGwNEE4QXqOg9C0skmMAH6gqykibEhvfp54uCYzjYDv0O9b3t8w3mlfvVGJp
         KRlGpoDq2HKxuhS5DE2tlWKEEFXVoeTv+FyQESGOT+inJMk88IXpEzWr5J+HSumSkWLs
         Ky6dSTAz2z2WEe82a0/JRgUt9jyb3aOHt0CiasS8rRMiHooyXhSl6zXI0b0vCN274Aga
         iPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747814800; x=1748419600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmWq8La8V18v88CVLflvXrgvwKzC+y7QtPzqgryZIak=;
        b=KwxlJCjii5s/fovjPB8l7c3S/8mhIOw4R6hQu0PicC/+MOPYur+ju7BSTxRqu4jw05
         4AyEa6KKu0anuo4U1w0tuBHarD6M4tFjVQv9qhskGSP5y/VOF7Dsl2DjScV2W1FQEKhZ
         jyum6/WGRFDwvWb5talOjQt8Pc2J7UIwOEuJr1k8c4NQhJ0PFNk3aYCzW4VyskgtLjBu
         W/R+GYsRPZE4Ex0jBoHU0tvpm0UXdKe9ZBMpk2oIN0W+OneK8YBTZ/9YeZ/OZxOsH/kK
         LnkQLp2Dk4CbKL5fGgRsZgo1x0V8xggi+vqi5eEZWu20l0NF6/D7yJb9McBByV0MxijQ
         1Fhw==
X-Forwarded-Encrypted: i=1; AJvYcCViWBlW2qobgO68V5a2PPTeH1T+MRBvh//iHyLRZMe3pInBUP8XyEktR3/3ZtoRG8x1WFE4WRxtXNbKHkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJhydxYD63CMs9hC3TUp+UY92bORQino5B39AtB7y5pSFRKYQU
	eGJUHm9oVPr6eATzj2c0xscAYYdQj+vqYqQLuB4EHBXDoNdPloX8O10WldS5m0tmWC4zwnQYP8k
	S+/gmjay0aJh9A/voO0389dB6B0Hn20rA07nvocec+A==
X-Gm-Gg: ASbGncsUiRLNupymyWznJ/xnVuC7BHaSQk6m9luaX+twKX4X86UCfIgRGzLQwsmigSy
	16rbLlaGuw5/YV96qUhmKasEzA36dxqf6rVyZZZBAm7BkiFNWAxzAgHBWyPW6utXQvcuxgnGJOl
	DLcvwGE8UduEONIt3Xy5GP/KjCtz4cMU6vStTDiC+MZKXVVFXBJJw90NGPJmJgIvQU
X-Google-Smtp-Source: AGHT+IFzqL2hMQJgymb+obXIB3oV7RaqIxS2CRTsbDvufBjx7VmWWtuVSiEp0oMSdCOjhxMQP3sb8T2eHn6CyskSx20=
X-Received: by 2002:a05:6512:159f:b0:54a:cc11:9cc6 with SMTP id
 2adb3069b0e04-550e71baf85mr6118076e87.19.1747814799693; Wed, 21 May 2025
 01:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521072416.57505-1-brgl@bgdev.pl> <PAXPR04MB8459CE5696113684FF076D12889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459EE334B883AAAE22ACDFB889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459EE334B883AAAE22ACDFB889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 May 2025 10:06:28 +0200
X-Gm-Features: AX0GCFtBYjsig3EQjgstBBWqVBnIgRC3Zxx92K7iKXq3_O7ir0Ae2MdLcCivxy0
Message-ID: <CAMRc=MeqWd0uEM7=mjA0VnPM3VgZU820osTd+r2jGFF1Y8ZVYw@mail.gmail.com>
Subject: Re: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
To: Peng Fan <peng.fan@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:50=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Bartosz,
>
> > Subject: RE: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
> >
> > > Subject: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
> > >
> >
> > > ---
> > > Another one signalled by the build bot. Peng: if you could go through
> > > the other patches you sent and verify their dependencies are
> > > satisfied, that would be awesome.
> >
> > I tried all configs under arch/arm/configs/, no error with this patch
> > applied.
> > I will give a check on other archs.
>
> For other Kconfig entries, would you help add a patch to
> select GPIOLIB_IRQCHIP for them all to avoid potential issue?
>
> GPIO_TIMBERDALE: no configs select this entry
> GPIO_BCM_KONA: multi_v7_defconfig has GPIOLIB_IRQCHIP in .config
> GPIO_LPC18XX: lpc18xx_defconfig has GPIOLIB_IRQCHIP in .config
> GPIO_XGENE: arm64 defconfig has GPIOLIB_IRQCHIP in .config
> GPIO_GRGPIO: no configs select this entry
>

I think all of them need to select GPIOLIB_IRQCHIP. Defconfig is not
enough as a randconfig can still break in this case.

Bart
