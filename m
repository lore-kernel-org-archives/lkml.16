Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD4522259C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128390; cv=none; b=pmA7x6OdoJ7zjcV/5Qzmn7fMexj7DdAvqzx7EvVABl/0u9ka7O0K1qBkPKFElXF5hK8XapX5YiYuMMNSz0BnSvoSC6mIO07UQLfmIcJGk3As1BzZlRbImvvy3vG320TIVs5tuq/5GLwsn4/scUIxojnt7qnDWBO4GEG2OzgPrg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128390; c=relaxed/simple;
	bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nc5V0M5ZS7q/YFKaZtBUFJUEnnaBc47smzTCUTa/giq/0TIXzPAhZFe1x7f8unLLM8YI9mdQa+yjFWwtf8uozDdMpKOlZodCMIeFN8dnSG/1Lpjf/kdcKHQXtZ2VUzgQHkNLSqQ0g+kfnc37bRt2Modq2AfDkP5+x6btkwuKRks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xoHrauFL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xoHrauFL"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d98aa5981so1258187e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128385; x=1749733185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=;
        b=xoHrauFLBS2MyIsJrZf+9KN1Vlyu7/Yo5+H9evtq4tkyDncnLN+moqHZ1UaEaFULhZ
         4fGlt8P6Cr7SbxOItRI+VZjAPlLjQKwHa997plGQFDMAJHlmw5A2kdE5uGaDI3pAOeDy
         nhxLcs8Ry/3n7UsasEui1uQ4XuQnzCiHKXUhXy3u+KKYTYTxkXRQ2gX/q1tkDF4u+6A3
         XyRwLiAha9CGadFprSQE9MDPLdXj8m1at+FXoWOzy9I/iWlDDgzxPkBYgFVbSerpzpoF
         JEe0W0YgP/eVYTzBtagB4RvXr3/ziWEP2O2g1i9QrwF0wggaqHU1q/N242oVAhoFFR81
         XafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128385; x=1749733185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=;
        b=w5trIGvoVFMo0u4LKhAE6HDWwsl2pTM+mZcev3rdCyEldtreRwEKboIC4QOdsM3CnI
         KdzOqXewLj0Fv5ypfKgwiAXyokI2O1MYYp4LK2Pa77jQN8jKzcmcBeJ5IABtgDtW3MP2
         fxB0x2IGGZll/1G/rr+BasTygakHSsRj6XeF5+r6XCR+t4Ybl/h3CFq3neQbmI0PxS4/
         NWXzRJWsDt+rVOVhNyrDne303CGCCYhSLT+/S4Npwh4wU+ppraNHP2DBhhTmq609hFX6
         jhvLWdeVaPdT9PLIJVFZSqqBNxhrIkNRun9hyoVrQZ3pu1dNoCPg/5L9gqmpMCzaUzlU
         /8sg==
X-Forwarded-Encrypted: i=1; AJvYcCVQiFoX+moQCst6bl1hc3VEmLw0ch6iCoGuwxYpvrWhHPj1KimNTqVuldNBh8gKlvDqHOpsCibBE0r7QrU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7/m9fsd1YhWVpgJ1sJnRDxRCx8ZhAaJYs/k9ZT7bkUSv+wO1S
	igS7Vqp/TPiV0k73sm2QHbCRhd7KOA4xGsZzQ+vXKQARAlaQ/SESv6DL0XwYMTH5yaaaqq9oQgW
	TG0TPk267/c4uYHNFaIg3iuv+0e5YpXuGbHAQgu5T1g==
X-Gm-Gg: ASbGncvrO3uJkPZ6PU4HrXKfQvazxkJopvYqDwv8P9eyctF840RiW6ubvSKmXbux0eM
	XZjqesZkzJHQgO3qqWPId7pa54FW4a0HpPkCMV//nCk/y3a+lCQ/3dPUbzieXYJinKp3E3h/RLX
	LTwpbQq7wb7tyXe2Gp7F55f15utwNVwClng410Peqq/bA=
X-Google-Smtp-Source: AGHT+IFCavHF9adGcVmqAC/SJ2B/xxLRQCctMY8xdnqc9im25wwFXVUPSZMsCxZi+sqtxi8x7B4+E8N2egCUTx7o6NA=
X-Received: by 2002:a05:6512:2399:b0:553:3028:75bd with SMTP id
 2adb3069b0e04-55356df25f4mr1863539e87.49.1749128385410; Thu, 05 Jun 2025
 05:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com> <20250528-hdp-upstream-v4-1-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-1-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:59:34 +0200
X-Gm-Features: AX0GCFu6YXXSfinnPxm6al8Hk87Fy7463uSEHIJGoc535sekNRVPuuiSEP4FOgU
Message-ID: <CACRpkdYfU0xGAWwjJVaDLS_QjT2jjVZouQ4bVU8gqMkfEc05Bg@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> When using bgpio_init with a gpiochip acting as a GPO (output only), the
> gpiochip ops `direction_input` was set to `bgpio_simple_dir_in` by
> default but we have no input ability.
>
> Adding this flag allows to set a valid ops for the `direction_output`
> ops without setting a valid ops for `direction_input` by default.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
