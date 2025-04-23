Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D8281357;
	Wed, 23 Apr 2025 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421601; cv=none; b=HYnhv6ck5Nbr4ij6O5MGgMzCWl25SXPHJ2v+elZVhyaWWSlUlzTBNwnaYO4meAjHr0sWh8fqtXv/7yHXFVNpKCMOEdOsRNF/uVKGMQ3MJrxWEglGwvdXxizH7UnPWzOWlMiUT4wgEzZUnjbrDdwkog4Zw4+GmcR8psm1Lb8g24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421601; c=relaxed/simple;
	bh=tPOHjT1NkHow4VD7/8Appu7QUK/ZbjYVgaBPZCT9gmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t46Pppta2+DfK8CsGMgs40H1aXXAVXMNvMOWYkbPMLrVvtcf8rp0HbWzlH8AXDEVZmEgD9Qgu9GwocvCuLSNTJTpT8U8dzbGgt+mXUfwuNkzs1xy7+HHy2zwUh+Uix94ao+zCqokHfVVUcO+dryzOYbcdly6UadJO6oH6G24gsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHzR0ks9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHzR0ks9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C667C4CEF2;
	Wed, 23 Apr 2025 15:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421601;
	bh=tPOHjT1NkHow4VD7/8Appu7QUK/ZbjYVgaBPZCT9gmc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JHzR0ks9mywL/Gjel+WVjGNaUfXggO7iK4HEKa99gt2Id+opEtlpyAb8UWdlIbd6p
	 U2Tj8WVai1ielF1aDhyeSWaQTWsM3rDfzJguAsYZPeLwkaTv9t6RDw2IEHtfOc7od1
	 k5WdJjh5bAw6PrOqF9uQdGwZ0j0VLleW1tYLSRKvzGD/c1EL5c9cyuMfXflKyibaVU
	 bvGMikvu5P5gagV9/JpBvAWdIRz4+TCJChp7gJiEpAs8GBySeD54viEHq2SwBqq+9Z
	 0+iZ6r9t0+CFj1T2UVjw5jTghN4cyVgjVZfBhmelLA6RHbPMnhMyxoa0UXWSvrdURa
	 uvIaPSzaOF6Kw==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so9910759a12.1;
        Wed, 23 Apr 2025 08:20:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVK7M//RtBAgT4UApfKmJl/+MObA9efN9K9i4tuua/cvfPZsu0HUwYnDIUG7AfS7aiGkj1o+YfjBbjtKzcm@vger.kernel.org, AJvYcCWp1FnFEH8zchYCbM/aU/+2EonOy901DbsBvM7NZD6j3FfCCK+SRjlJvaOeYAMFkUikxpcSNzxp2/it@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1BU9jQ9auh6HY3vKOHak5PoCddlR7A3ugFrM0YH3DX8gLzkHj
	ZfAvfN93haSeQu+ou4hnQ+TvyGYxIx/WRM7nKAoXnHMf3mcfcfyOSFzuZHOE32gCvDyrBbLTS5t
	xMuTtUG1xloQf4JbErzW3mzeHhg==
X-Google-Smtp-Source: AGHT+IEV1CEtPoGDqGEwEZJrzR2YkV4IU/BYo041fFmlJGhMA6AFx/r6j4OVu1OhC2Y/tApvvElXwS4Rby6hFC65/iU=
X-Received: by 2002:a05:6402:4408:b0:5f3:4197:9538 with SMTP id
 4fb4d7f45d1cf-5f628525695mr18336301a12.13.1745421599923; Wed, 23 Apr 2025
 08:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com> <20250422133619.GA1095169-robh@kernel.org>
 <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com> <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com>
In-Reply-To: <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Apr 2025 10:19:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKwASbUtpO=wU-16v=y8S_wLyBxnFUmQqsE8GkzCz0hDg@mail.gmail.com>
X-Gm-Features: ATxdqUFuWyHPWdbMp12KUQQV-d0rnw0lx2tasAZItdh99IKgPe_s_qddlmQl6uk
Message-ID: <CAL_JsqKwASbUtpO=wU-16v=y8S_wLyBxnFUmQqsE8GkzCz0hDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Nick Chan <towinchenmi@gmail.com>
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@svenpeter.dev>, 
	Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 11:59=E2=80=AFPM Nick Chan <towinchenmi@gmail.com> =
wrote:
>
>
> Sasha Finkelstein =E6=96=BC 2025/4/22 =E5=A4=9C=E6=99=9A9:44 =E5=AF=AB=E9=
=81=93:
> > On Tue, 22 Apr 2025 at 15:36, Rob Herring <robh@kernel.org> wrote:
> >>> +title: Generic SPMI NVMEM
> >> What makes this generic?
> >>
> >> A generic driver is great, but "generic" or "simple" bindings are
> >> generally a mistake.
> > There is nothing apple-specific in that driver, just re-exporting
> > several registers as cells. If you think that it is a mistake, I can
> > rename it to apple-pmic, or something similar.

Like I said, a generic *driver* is great! I'm all for them. We should
have more of them! Generic bindings on the other hand are generally a
mistake. The problem is whether a generic driver works for you or not
can evolve in either direction. You add more things like described
below and then a generic driver doesn't work.

> >>> +      - const: spmi-nvmem
> >> What happens when there's some other feature of the PMIC exposed that'=
s
> >> not nvmem?
> > If you have a PMIC that needs more features exposed, then you'd have to
> > use a different driver. Or am i not understanding the question correctl=
y?
> I think the problem is what happens if more functionalities needed to be =
exposed from the M1 SoC's
> PMIC. (right now I do not believe anything else is needed from it)

Yes, and you can add to the binding then, but you are stuck with what
you define now.

> It would be multiple drivers. A simple-mfd-spmi driver (like drivers/mfd/=
simple-mfd-i2c.c
> but SPMI) that exports a regmap and a generic driver that reexports regma=
p (any regmap,
> not necessarily SPMI) as nvmem cells, plus extra drivers that uses the re=
gmap exposed by
> the mfd driver for extra functionalities.
>
> To make this submission more generic and extensible, what would be submit=
ted should be a
> simple-mfd-spmi driver and a generic regmap nvmem driver. For specific ex=
amples, see below:

It is not an MFD currently, so you don't need an MFD driver. As I
said, that can evolve.

Drivers are bus specific, so you can't have a generic regmap driver.
There's only 4 nvmem drivers using regmap anyways. qcom-spmi-sdam is
one of them, and maybe one driver could handle that and Apple.

> The PMICs from dialog semiconductor on older Apple SoCs definitely needs =
such functionalities.
>
> On Apple A11 SoC there is a RTC clock device on the PMIC and the SMC on t=
here does not have
> RTC functionalities. To make the RTC clock work there a driver would read=
 a counter that could
> count a maximum of 194 days from the SPMI PMIC, and then access the PMIC =
nvmem cells that
> held the rest of the time. In this case these drivers are needed:
>
> (1) simple-mfd-spmi (2) rtc driver (3) generic regmap nvmem driver.
>
> On Apple A7-A10X SoC a similar PMIC also exist, but is over I2C instead o=
f SPMI, those devices do not
> have a SMC. To make the rtc clock work there three drivers are needed:
>
> (1) simple-mfd-i2c (already exists) (2) rtc driver (same one as above) (3=
) generic regmap nvmem driver

It all sounds a bit different from what's there on the M series, so
perhaps better not to mix the 2 just because it is all apple. The A
series stuff might have more in common with existing Dialog PMICs.

Rob
