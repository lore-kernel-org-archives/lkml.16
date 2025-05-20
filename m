Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198B24EAAA
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778267; cv=none; b=n+4GOJxlr+hRuFHxNcTrZ4cY1VyAuEShpJbK4jH9AWnmDl8XN8XM8uG35MfWtJF7NpbjdDDai6ClvmGNrwSIHWL8qiqET2FOE5H8e9+xcd2Q7qrhuMmvJUMn1JqBhU/8gqNSGuqKLCZxSu+K48/syhk6sOroEHc+uWzUeLzWQoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778267; c=relaxed/simple;
	bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIQHvB39Spja3CdxhGK1u66iUBJzl9kPef9WDIUUyq+IgVt07TWNQKRLYyuv6stDaFBuVKIXLQ6nhth00IC1Y6ho13ArUxNSYhMlH2WEsGnDpznlIv7hccUNq4uh/y42o/31t1WRu8j1gu0HPvzUHgh/iajNMNL0dZtJ1JSFKzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKTORxvI; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKTORxvI"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32805a565e6so60124121fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778263; x=1748383063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
        b=XKTORxvIwDcLLfX+7R94X7uuTL8r+zFux/DwH7e2SdzbFWzRiZmRdbfCF7COc0o1jv
         tRISnZLImzoSKiHxBbvW40hryXpw4sjys7uHLHYrWqN/pQHhJZ746mE4c1h4B8GH8oml
         tWQGGbVC3gHKR+nCoBVx2z6on8DIn1KOMfwyMlyMD6+nZCmW41Ek3Vff/+YakYOxDwBD
         v/4B20LaTSY0mp+UBAR1xiObjIHTdwcnxL4rrkFtNrU4ADsPAKk8p7O8ORpNMcNFQmca
         FiCbuLnxTJjjszaI9S9szY392c12uUCI3ROtfaUXg7A3oCabI/Nrpj4x6dr9BUGWtm4t
         Klmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778263; x=1748383063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
        b=cmCOpL3vYoCtuSVB4GfWLq5trykJyTgOYavLPmOtDswjTxd2eLlZSj442w5cAcKMkp
         3utRraJIR0GQWROKhlFR/LiQL7o1YQ0dKMeoINO96gzsDW8RWoRNjrzytCEZLWfbE8xk
         gMUThzn4uBtOvYkU0x+3cszolqYZtP23c32A4nOFnx7jxaA231y2BpV4AQJA96n1TYSa
         8fU6S8EIF9mg67mlRhAM2ptQb0df+lztLcScAoioRup1haM71k4aMno+Md/cHVd9B2Fi
         zszDROmsDh6aK++H2YmkMPVUnQjPicNopjoC3vcxbU00mfCuHrtpyBJelaPtQIHftJkR
         YASA==
X-Forwarded-Encrypted: i=1; AJvYcCXWsyNrrIRLZTgC8ry8BPR1fbXL4T8sa2LA3Qf/f1z0wZEiBZWJMPw2FtBRRvqNrTev7XE82BIBrKSpSo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2W4Tvd0hExvmTzb9l3nOH3UVVFHUh/qCtCycfFHJxjycLgxkF
	4duSMub25AnQK+QDc0RF1YReMMXwXIOzGxG4CdJUiP4BcK8t2c3spIwHpPlp16JguIEnCHEtK4P
	FKsgBsE8GLHCaj0ZwRtQAyZjfXkhkyegUtvgEDgUecQ==
X-Gm-Gg: ASbGncv5AfSjMflnSdl6FVJ/PxH3rCvyckL+FrtQJfql9JxdAnAvtY3XkMqd0InR2pM
	o8S7KK6If4FuMVZry1z7rLEfnbSG+tMh77wX81oxwKV8nyv8zkZy0wk3bgkB9uwnxw3XVEDoPUp
	J6RWI6yFJSj3uE/xOaJgHVLK6yUTjosz3+
X-Google-Smtp-Source: AGHT+IFzz0NXs8cF08Snmi4Ha7S7U5h0KKvjptJb+slPp5Gi4FWC7Nsw049EmovcMdDEvihhptYlSs6FgkwmCbzFvc0=
X-Received: by 2002:a05:651c:54b:b0:329:1550:1446 with SMTP id
 38308e7fff4ca-329155015ccmr33138651fa.0.1747778263381; Tue, 20 May 2025
 14:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
In-Reply-To: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:57:32 +0200
X-Gm-Features: AX0GCFvwSq-oMiFu75DMDv5s_mCNJqSxwG-LnpvLIXP8m8Y6ivyc6Hrx1bC20zQ
Message-ID: <CACRpkdb4OeD_yaUsGJ9Ugz3LZTCMdz1hbH-cX__ixEPr3Snd_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add 'ngpios' and 'gpio-reserved-ranges' for
 vf610-gpio driver
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 8:01=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:

> Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
> the number. This can save some memory when alloc bitmap for GPIO,
> besides GPIO tools like gpioinfo will show the correct information.
>
> Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
> IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
