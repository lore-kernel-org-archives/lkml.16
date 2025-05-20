Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8601D25EF98
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778025; cv=none; b=QkDTMrA6UCiL+GtRKkLIh34jnwYQ5tdt0X1FWyBm7Dbs9vVeqIW5IZWEbYaEQQhjT4S2HMcr0sFMqJDpfbcLiNSoWnJDb3HAwngUko0cs0JgDsJ9hSH7PfoGyRQBHUZ/cQCWjAKbZ+CmxiZCNsMg+5DWzglGS8Jqln3NcX/635A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778025; c=relaxed/simple;
	bh=BuzhlNqyJc6n1p51Wy6w2ws8ML+CaNuBHjlDaIn4jws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEYNGlc5gWxuLyewYh9PRWkO6YPz4yrKdPXAwVmX5BkeJ9UKkCDYVLwOUNM+/lHCjRuKXhh0K/pm0l0r6wjaEvIBvNwTkkJY7dcJEFMpSzA1j4p4NNf20g24t9iQNRqzPJgPnavtEh7QdW4m9Ug8CJEJzQ25F+eCZfGOijSe46U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nutWqD7g; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nutWqD7g"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7041119e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778022; x=1748382822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuzhlNqyJc6n1p51Wy6w2ws8ML+CaNuBHjlDaIn4jws=;
        b=nutWqD7glZEgkaSZ/RoQGFc/OqvDGl1RAgADhvC3VXtdMFoCPkxzEjWH296NLtl1sf
         +kMZns6iB7XOCdGlfhvAdbNZKvFZVf8WHY7B2FdKTK+xOMei5ZOveRub8lnEha/NSWMc
         em460iPvguqfAdXkdEf7TuRuIQd92UhgaiuQmorKOiWpOWUymlLtikACQqJHOrHLsT/N
         Xll8UmAw3MunwXCe1HId099MhFhvUqjpoQZZhjROnVDB7i3/GBM7txz7Sf1MCpc0Xfqu
         yLKgdU5mlKUP15NL/scDj0xakDheW90qZ05H+xY2t+0vALlQCMK7qxYAqZxl4uTwr79K
         /6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778022; x=1748382822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuzhlNqyJc6n1p51Wy6w2ws8ML+CaNuBHjlDaIn4jws=;
        b=NdrWbPzu+23QOrDC4FZyOoDtZqE54xmHzRHVmiM6Cs8T0wrDxLN5q0Q/Ns2ANeyLGP
         iXPIZe9r0scd/E0hvdOuxUkYjVdkZtZdHzUkP6UyAdCsi8sH3sVW6gd8Ch9sw2coNmRd
         XHpfJdomMOQaNL/9fAwOp7zxg7XxywZR3qcs3lMIy821/noVxoGP2FW8WvrApSo2JHq6
         vi/96TWyT3UgwUMWRa2J5iMm6p5T35zCEtDj6cRX71grhcKaNDfwPsqNkxvaVKh6Z86e
         oyojmWw8paoKGBz2hx/s+aiXSYMc3WOF6rHFIUKxG2PoZYGzrSeT9gKaKyXk+i95foAC
         K+eA==
X-Forwarded-Encrypted: i=1; AJvYcCU9y1YHvrkK0/a7h7vSocJHpa9aClhIekXPeDOBJ1mMI9XXl5XHnXDbYISDIYOQENki3T2SKmAlHBnfRu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHB4JlmXtNa483Ycg9olHaiB8+tGznmh/qCc8FRT1Reb9Fcd8p
	p1JnZIXEtCTzxrkV9Bk3l7kf2Q+66g9tW2amJ7aLYcfI5opb88pwlZlgaD/To5LEBHVxVe5VOsA
	hMKShcoZdNGL3+AIxgO+sPqEpsrY45MylGM3HC9fwVA==
X-Gm-Gg: ASbGnct9VsW7PA7IvaRU+VdXJo35XYZSvVpTRlkLWhJWmUF9BhebbeQs4V01MNgW7Lv
	1azPXXlAcNb9Ywzste5QfIcOtJ/TCZWFzN5s++WvoQTykEdG2rIiKrkn0RYL5o5tTnisOEnFo/P
	ilh441aGH7kWNiVuVzOh5jbSWZLloFPsc/
X-Google-Smtp-Source: AGHT+IFDmcGo1axArvFCz2dx6uFyFqkML6kJ22pcoHKMMAfAxgp0/2ysMJ6m5JO5I5AyQlwSQbgeg4ij02FeQU7FSkQ=
X-Received: by 2002:a05:6512:6317:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-550e71b4e43mr5955773e87.16.1747778021614; Tue, 20 May 2025
 14:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
In-Reply-To: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:53:30 +0200
X-Gm-Features: AX0GCFsoSIZvC7lGTFU51O8wPs6RsCUHG2kDfSqZhe8h4hkLrUFi0bw--0irOtg
Message-ID: <CACRpkdZRdFLyGJrgAf32V8snnYW1gPvbtxSPQaSBFSMkt+y08w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: add ngpios for vf610 compatible gpio controllers
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Haibo,

On Fri, May 16, 2025 at 12:57=E2=80=AFPM Haibo Chen <haibo.chen@nxp.com> wr=
ote:

> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"), vf610
> gpio driver no more use the static number 32 for gc->ngpio, user has a
> chance to config it through device tree for each port.
>
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
>
> Besides, some gpio controllers have hole in the gpio ranges, so use
> 'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
> correct result.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

the patch looks (very) good, but it seems the .yaml DT bindings need
to be updated with ngpios as well.

Yours,
Linus Walleij
