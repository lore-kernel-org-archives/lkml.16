Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26BA2820B8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749590198; cv=none; b=Y8Uj92JtmITB/eZdMLVN9KmDaLCDdSteuC9+FrnxO8bevCKwhcLEVSNACjmVcgOqqqNhwNjjdwsOpUhF2LIb5gcpGoVGycGqvJ8gOXeOBgjLJlE812UeYTcKfeDq8QNSKgiM/DcZDlmpaKBmR9vCxflAEuG3gkkj6GZoWzyjjFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749590198; c=relaxed/simple;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DImRkbgMhn+CbTyjpsbbFFwjcP4HMz3ML0FkAiPu/x/fpO86ExV7GWnRCo4OGA1URxbQw1AF9H8ZifdFjr9XuahlQ7lTvqbGilYIEiZXWR2Z04PWnpPv/C3hhFPTQQZqzUdR8Uzt3YBokv8NdJE2UuTEhPz1eqhNGh6HfuAKo0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcuNSzi6; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcuNSzi6"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32934448e8bso51538621fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749590195; x=1750194995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=KcuNSzi69ZpOD8lZJ2yIzQp234bfXMoUtF3ot9GhBj4YEsJPC3CB496eGqhb5qOAPk
         +5mq3WO5eQCzubFwtTPTO3JBxEhQ/z7oe+idkT3KkLUPrB+5PuufICXMVl2qugjLTADD
         hvReDhMGy6Cw+6P+JuETfN5+RHUFpbCUVMSTPAc7avuGu8b8A4VQ8Wry9Lhre2oE1yf2
         qJKeoyryLFA40MHZ9epKWId8zSPQsUGwpUC2ZV0cuegLRnpu3GhW176Wp7yMS1Kc/tm0
         jvLtEZ4IfSOD8lGUsKZeFqDzs3mp8I+t7dZy9GoHxShmg7U1iCsiTneVNZndN0vSxVOd
         0pXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590195; x=1750194995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=uxhl50TX+S2Sv2Ryi9rYigbP5h9TDH2cSv2qjr4ataiOTiA8POBDONZg/VIjcy6NkQ
         OhSztqvVVeFpqW29aPnhLzAFhkm+OEXfvCagGxibQVR+zeA8fMum6M2aQA45OXmBbb0e
         hafnJX3RwoGUrbeTV38qi4ECCNvFsEQQHCXzbbT0AwkgnS0F4Q5TFVLWyoG1EHiYskFZ
         qGcD2GsSL4d6bTnU7LaI81DPO59w7saJZwRArR55nnRN88BHmmeJjYeGCiEEUHf1pXIe
         rbkXmmHeH0DVPGhg3I3ASrTKie9N19CLQPB6di7OuXFQRKv129d9hjSdeF5ZtLIzMlea
         J7Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWu+Jv71NT2ftr50rdG3nIVt1GRznIxnFy/HxFV09kYoIubA06QmbqygZyIP9r9y5m3LJmvpD6Z7KIJqac=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWnr57oP/xxcQuGd2Ra/WBEsSVmeQPMHDR/mkMPCdCnOVSq8rl
	CnJc27CO/FhgGVpKiQ8+SGqGoJ7+2b9awKtus27CZrvBGuN5Blc+VIZnieFyuGzMc2Et92BVd8E
	M+/xHkj9sauMjfXDPhhyMbxNtEERXMQKu21V5zey6Xg==
X-Gm-Gg: ASbGncsWyeh++2jJjddk54bqZh0x4nj9K9jDnsXXUxq1/HA5d6QwtgWsAupN91cS1pd
	c+T0DRwDNMdL+y8dAmb8pJE4bL6smyDg1sBVyoMl+yRljp8A3Y4LnbPAQjLnCo9fEUhRKCFPHjN
	e+z/9NerVC+NeDA9j7S5uzq+YpFMJx1+Dwl+l/tm5H0AY=
X-Google-Smtp-Source: AGHT+IFjB38ga64es1q/x9Xln0eJ4c1gLnvGRBRN0i0PTR13a813fBLuiycDGURGtRbChXkECB+ZBVHqj34ThqQMqbk=
X-Received: by 2002:a05:651c:1a0a:b0:32a:6aa0:217c with SMTP id
 38308e7fff4ca-32b21e99d3bmr1744231fa.34.1749590194721; Tue, 10 Jun 2025
 14:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 23:16:23 +0200
X-Gm-Features: AX0GCFuXsSEbKJPPrZYl0t_vGXohg5ZS4zY2cQAKwzq1fVBy4N3FSGLwpMM1OkY
Message-ID: <CACRpkdYrnmi2a8iL0tA7zNDfhMRN3F-NEfTntxXgC54t-LZA4w@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
