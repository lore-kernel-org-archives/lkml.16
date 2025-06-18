Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E7A2EA726
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249693; cv=none; b=Q5WJ+DpI/ZhaL55FG92aFCt/bOA0eSQqMOXc+bfcPI4Ydxnk7AcCbyoyOvexaXyBLZtQRMf+EbqlXRzZZlZ5QQAwwW6cosaOJDN101ePXWUTIZNtLno8TYZaEoJgSKQeobjPRHJN5vX++LlaKV9XJ8EfVX8xvOi4X6rrnqdCLW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249693; c=relaxed/simple;
	bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VaOgj8n3kdJ+QH4tKmHglxEKtjhKAFF5KjbEAB+WA4nQa+V6IiY170LBI4xbRv0tYqSRV79WNV49e3J0YU4H3sKJZwT95qDE57u9133WuUIU7kCP+Dpc4EhfLheLfWEP9FzLSIiJrCPYU6eI4kaNRs/dHpZmHPcnQYG7dox+ryk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dYakY6J5; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dYakY6J5"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553644b8f56so7049322e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249687; x=1750854487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=dYakY6J5RcYzb6omLmKYYIz3TI3xl/KZHg1mfJgQ/ArkezRGWpHZALVwx2Ssm3uIux
         dwfgA8QHt1H6TGPmDx/nQ1Co8QKFzoAB0r4PhB6A+8q4CzbNhzMkxycx8MiiFOHXfy0F
         Y0P9YQL21+lWZD/v4hB1eQXMmPF9TgEyik/eH3A98lbfmNu2CGv/GNLhylgIkeLugSHZ
         ffxHVk2Zxp1mK6kUOo6pA4ZwGh0Ov0nLJXiaJ2GSXuLCJ7gruSeeKZZOAGDm7+WZhQBA
         TbPig0qdgIAQ+bC+XSuiSJ+ihuc/wDfQK4MHfw34BPC2uit/IjfFuxSShOvjqYxTuLAs
         eXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249687; x=1750854487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=qeyIwFL32qZ4WsxaUU03Hf2z/J0XCvUG4r/GE/Xbp2HB9bU/dlgJojoWseR6Llgryi
         CNsGp2VNJTqNbgjY1q4hdwDUBhc7uG6+F3uRiGQPBGPA2yMRekBWiZUpIzpG2Pyra+Es
         dTO7reRBkHj+HeJKZ6Y/NVabU+4Qbovx3TMzqwLGx5khyOdytnQGVcmIQI/73hcIQiRa
         9sgCo6KdT2ylVy4LPQjJWIogQau4L4WIHnWppSVVuhWymfHXrJUtUL67EolJvTyBHPa5
         N+YA5Q/vrJXXTzHdWGQaCu2TKPdVJufFpmr2hIXBWVDiLoR+cXy7tH+nb0KJrEJBze9+
         Pvyw==
X-Forwarded-Encrypted: i=1; AJvYcCWmI34E0Gs4MjZoxOOA/M2Z95W2a1m21JRWFyCaC1xyrXhvC6m7ByptQawyWZeW/DJwympD/1rOXsr+F0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5GQ6NfatDOAb+VrQdCLRZsBBK6SbEkoUCiKjqPiEY98hAHEeQ
	ZJaJk6zsIW1ugNM+FbtTjQ6il0GMLfW2FLf1G79aam9tcNRcN7GydlrrRRt3obIXnkmNsPN6rKD
	XlnyE/2aOWR6c1rmM0Z/s1KcswdQKTIgmtfBFRFbMEQ==
X-Gm-Gg: ASbGncvayHDU4UkOfYYfbx7ubvQJvJUxX82oNtO/A5G3RwnoQtik95Ik2j7mxTkuxGJ
	KJ4xp9XdzQGrdVsXnDy0H0I8E4n7q+vakqHlRBW0LDoPH1uoo2lel2cZNE6mM/7zXakrYAyHaNq
	MajqFblg7DrfKbbYIIAgtOffAbDpyFrfsb9ImjFlRyjqA=
X-Google-Smtp-Source: AGHT+IEqcYdJwMh4FSJGyni6X0wxHGpPoUz/ob8ESveA1VpUKphDYobFyqmST5aw3MNHLgS47EAGeONWHSlMXxk934Q=
X-Received: by 2002:a05:6512:2315:b0:553:adf2:38bb with SMTP id
 2adb3069b0e04-553b6f42459mr4514077e87.46.1750249687261; Wed, 18 Jun 2025
 05:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org> <20250616-gpiochip-set-rv-net-v2-2-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-2-cae0b182a552@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:27:53 +0200
X-Gm-Features: AX0GCFtOmBUtsD4jP5iXZmqQJNmNp3Xkluag7JKU4cjSCOXhD78FpOnWyAbPHYM
Message-ID: <CACRpkdYi0oVa3uek7zcb2Jy_YPded6jfEKoXUp=BL01V5XX1MQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] net: dsa: mt7530: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 9:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
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
