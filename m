Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8D42E54AE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249670; cv=none; b=S5HoaKG1tE8hV2kcHtp2iyvEQAKR7cVjAj7+/N7p20KvrrXR4yVUysJWQqRZ3p1xEB7o/DnsLzaN33TqolxgDtlo84a+yoPkoC0EUIluQK8N+TQSNwfzQPqRBL1Ak4ubc79lAx6MVj43mPBeujXcYi+fkKvkDji976JIIiWyrLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249670; c=relaxed/simple;
	bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0+xZGF6uC2uuhlExvjcketbc8NW5Cm6ENAIgYeETYxC8uBH/OBmWJq2HgM0N9zPfswh1mTHZSot7rRYeTdh8mFCQwa2NNX4Ve2TI0lS4gWjfBM9nsWgROC3WykxtqiOLJi3W9tvCwce3l4Uima5383GWnK4cPm/OdW1Kl5qTk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q62LiJ4a; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q62LiJ4a"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so4917121fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249666; x=1750854466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=Q62LiJ4anBM9mCtPO1s1wPQafnXMiY44Wb6sed9JH7B+3kqfcj6OlRn0afcRWdxW2T
         GbRcS2/PDp9OME8vCM6aCKmKaSnRlRkd59Vywk+e0f+LJKKgmpr0IkbPHWiFpdeQJTed
         Ki1UZKrjGbTKc3php1hkcjQXclqOj8kH4nvJPUbCkJ64BuXCSjNYt7EpEJ9H8YK6/UAt
         hYlkTo3J5CwzbkEY7LCkAbhwCYvxdwlCVBsecB6OxorgUdahP0dPqdIUTSpYbRS0VW0b
         jmNktZZFxYS4UhcC6SxCXM/VnJgbSDqrjF/aSDVzedYhZLiOR6sWKcwvIHp7m1Ky8hvt
         U3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249666; x=1750854466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=qlNvc4SgXUHGbNO72SLd6OuJ/rTelGnOaGFz6qvC4FMZ0hoU1ZHHMOc5fs8TGUNg4g
         6jnLc8j0pI+CeNcTf9Tjsc3NAJtwOvFwKIPSji/OLT/RQ+5pRUpvCbD3IH03plO73/jR
         qlvF6FCT/IovkeFHgu0wRSr3rl4RAPa1/lKJQ0hwga9t+kMdonxfLrKkdASuUP/THJ33
         7pE1NsmpMczELHGfCOvr9RqGHJ1u/L1XacqIwjltoWJdMQWp4N/4cRKNrUwbKFp8Cjxl
         PcuKVd/riKoydQ/UeLvdny1iFWrsyOcPwxL8Uy63eXkcNP469jE/t3FDEuXiemmMXR+Y
         hOvA==
X-Forwarded-Encrypted: i=1; AJvYcCXtYcxFL62dFvE14aOIkY7FR9hnABmEpKsH3e+VEJgZV9Q5LXMUT17ryuh7MUJrZz1LHk4OOZj/tnkj6Co=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxib+fBN6JnXmIRyDep044o10Q0FJyXXVibtW8MHxsm31CzytCX
	GBC+UkH6+2Va+VSJWmaJ3qJan2zJHFJGqlCHyN49Z+3nyZgIa+rfa/mQjQXlNjwX+8ARl6/Ma7b
	C+S0V8j90ySKQ46jlxeNYwPpRjVz7H4qggcBUzNNUJw==
X-Gm-Gg: ASbGncssRuxkr/GhfwdrJNLSUcHOBU/uoGZi6VDSxDkbyugcgsU3bDVUcKSbertwIpl
	VXTnms01oDAXX+Y7ovMHCk2k5S2UVebWEQfVxNpc3jSNZzl22Ds20nJRmq19naBkntACXz7i/Na
	3SpgfcZht3juo9yeWat0AEvzaDvtuX1WpNJK9aI0igXVA=
X-Google-Smtp-Source: AGHT+IEO41Nyhls6z+tYoLHnOV+DOmxEURxkPhjx4goE9pZdzx8ZYG8pWoqgfu9hnvxH3hdYq4NmpJCLdC/k/NenFbc=
X-Received: by 2002:a05:651c:169c:b0:32b:4441:e1a6 with SMTP id
 38308e7fff4ca-32b7cece005mr6055841fa.1.1750249666214; Wed, 18 Jun 2025
 05:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org> <20250616-gpiochip-set-rv-net-v2-1-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-1-cae0b182a552@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:27:32 +0200
X-Gm-Features: AX0GCFudNOYMyXLJ7vMaeO2dSvhoaQWQJroQG17p-nXTR5Iec4T0QKmapC2D9eA
Message-ID: <CACRpkdYJ9O_y9TGTOw8mzf1=LvaxYCE463MPf12YaXUQCKaLzQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] net: dsa: vsc73xx: use new GPIO line value setter callbacks
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
