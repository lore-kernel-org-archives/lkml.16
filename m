Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDA022D4EF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788170; cv=none; b=KWgchTpH5SpN2LnR1YDhsdBt6I1UXMavaA3TJJd/UznkCO2ZCxWVHhoYukb9dccGA0PUzE7/onpX+SiBje3xOEi05+haEnmYumFsjxy107xlAFIvargxu/I54N3wW4/WabdqdQkW9+kx5D3sEQScLEGn7/MjD27Ow7g7OUrv2Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788170; c=relaxed/simple;
	bh=6tPzTMhBIP4Ztm/pamoA9E7AfPXNf+05fR7f70iwjcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXh5DTrrMDjQAEFXZ90zHxDC+6guGYDot9QITEXDYRsMPXTZUXSydado1+yX/+ufQaCO+kb6heahvDi29SNnhvslYAoh5nbKp0aS3klqJKwjSWaoqWmtWyglhI+HfAX40s8vUUiDVEYNfH6PKUoP2r4XrCahhSyruBauV+p8j+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EdPOO+ei; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EdPOO+ei"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso64935981fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788166; x=1745392966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWD5DtO8Zmjj8hm/jgNeXXYBfzD9O0HKgWcyYm/pe+g=;
        b=EdPOO+ei2bPpqPvFGSAN5GkWEPL5g+w7K0Xg3ZtOd0xDm7VqxWZgXKJC2or7VdY8tY
         S3PSICLGT8C3k7syA6GtNAtVh+xacMzsXIN9Kjl6YKmKTqk020PDS/b+idXA61pmGDT/
         gUfMPPIn/Ohg18u1+R3fJdy3KlKH/SNiXjmBlfT4K4/zpDnBhdsCR8xqsgpI8VcUbZvH
         62Z+pgv4uFDP0ZYnR/FBvxbl1rgPAE6pCxfySCvSWCKpLWAoKDD6Xvo1DMfKzP4L9WN0
         mRnkvpdTfNylZUQU32QFyP3PZl/CzKfcjhQ7yNpTSdv43CWgkkZUUWBccTza4/S7+R/V
         5UKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788166; x=1745392966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWD5DtO8Zmjj8hm/jgNeXXYBfzD9O0HKgWcyYm/pe+g=;
        b=PuGJKocErdbng5449pDAQFV6z4u20jXGXoxo8gmBOze3uwMxvtvKoeScyFyaV7wQl5
         UsN06yafeUj7z+IQJ8SLuutJPKQR1XosXOChtpcxIdGCqOPo56FAbN/tNeEhgqd2+89u
         bP7U+zVx3ID6kwt35w6VUqRMwMOoCd0GX3BIzd/EBSjGLCDqEXcTh4zOsBsqFSeegZC/
         /jxw2SszGFNQFxkqvIPPxLc4CMi8jTWdbC4JoEGeLETXYoJbTO+OuKDMcvMdeApBnPcI
         KnnlAvkJgpvxtN0NANlMlh7H6tBaq7pt6hO577CxgqYhURS0LeqZmTSsrkJ5Y5L15J/s
         0OSg==
X-Forwarded-Encrypted: i=1; AJvYcCVTM/CjCcaDHA1or26V3IKs1QHTd2br1ocUYLO9Ty3CrplDTnpsHt6hy9rPJypvYdJjpmhrQRjxGcYlvoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy1OhxOxYV/XJR9gYpjWQbMChn5irMHN0tiFuzXrV9GzVSxZ1F
	Wdm3SzP3pJOMlgGeTb1gaaNZo3twqfn4IsY+gY/e/szFZaUsf62gDyRwpWsHvbv6QcfwYzGv9zt
	iox91DTZTuLSr8oxnKG2o4NlT6YG/X43WA4LxzQ==
X-Gm-Gg: ASbGncuA6bSJd7xlvoU4huppdi7vy6MfJVfVS1INVhUol7UOG8iA1h3EMiKVV3L+bXH
	mAd4IEB2gmckPLpqhV96feTXd9dM4LvGj2T1XUmhx2nX93AQGt9DiIRAwWzlrZCP7sgoQM41uEY
	qwn8rl3rrZNGtNo0LDEdYDlg==
X-Google-Smtp-Source: AGHT+IFJzy+zttruUfUSE7DAKwZxb0lvHyIXLpWKETv/eqQTmvTOtmlAPv2KPiXrE9yHLzHL0bc/wktEHBwODzsfibQ=
X-Received: by 2002:a05:651c:243:b0:309:2ed:72df with SMTP id
 38308e7fff4ca-3107f6ceca2mr1915221fa.24.1744788166445; Wed, 16 Apr 2025
 00:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:22:35 +0200
X-Gm-Features: ATxdqUGunV3YCOGXGIOJ9QSL-oTOhWVqzDgVFDf8RsYkNrat6ruPMmmT7W9km-0
Message-ID: <CACRpkdYUqHzid4Rnuv4arC9wu9fmpcGR22Jc5JzJhyr7fABMCw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] pinctrl: mediatek: Add pinctrl driver on mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	yong.mao@mediatek.com, Axe.Yang@mediatek.com, Andy-ld.Lu@mediatek.com, 
	Wenbin.Mei@mediatek.com, Jimin.Wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Cathy, this version looks finished!

On Mon, Apr 14, 2025 at 11:03=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

>   dt-bindings: pinctrl: mediatek: Add support for mt8196
>   pinctrl: mediatek: Add pinctrl driver on mt8196

I applied thes two patches to the pinctrl tree.

>   arm64: dts: mediatek: mt8196: Add pinmux macro header file

Please apply this patch to the SoC tree.

Yours,
Linus Walleij
