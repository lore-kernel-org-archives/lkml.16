Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDC428640E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593336; cv=none; b=LU0u0GkWWtOq73nxKsli5GCnFe3EF7jQFhaHWQV7oECf9Hn6vQIFu3AeUoYU8tONfvMIC5FCnTIf7iWVFHw2/IEMtWsAwIOcyCvF7TFLNJP7K/Wp8JuIcfo8tV8a2Gvmc594Xppe1d0ake1SDp3w7U++IYu3PygWVUKnGURxfg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593336; c=relaxed/simple;
	bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsWPhPtXP999q9XwjvcTU5phZIM8aDWtG3xUS40S/iQuIqLQk1szBD6qD6uNIs2NhreQzbTsTcwdyAn3RTlHomtLjMmu6xMn+yhwjeAO+/iso1HqROM9zSN0Oih+a1OLt+Xd8G2wUoxyzikrLdoFgShgPC5LIJbiB4RYGZLmHU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HNuDHYPl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HNuDHYPl"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55365c63fa5so5158865e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593332; x=1750198132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
        b=HNuDHYPl+K2Zm5Mnxn2A5pYoDofWUVMI9eny4zxnJqj9L+tNaq3dT9srblTB9Cl+Yo
         cMdG/rtMGo02HzGBe2TU3voDdHpHg5Eb9cK1o/VLXS0Ng2MjiKY9lrmh0Un6XNL643eq
         cEhhRXkcoMAEZTdH0eBxGpsluQHJJtox9sdfAuS5hd0vRva4vdtsTOXF8ChPGfVsOLvR
         KLOza4yaAa/VOROLBFy9QhzupDz0JVGzXkYMKwwFLmjR/rdX2++MX6ESNmNZQOceaQuJ
         oAFBK9EKp6EK0rChdUA5oZfrJ35zRnxZtJmqJqVbcocgfahNKuCTtVGupI6Y82qhuSh8
         qcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593332; x=1750198132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
        b=eYlb0+E8hnJ86EXx/lvp3DYEGGds0kSIbdSTqLoXB3xQ6HeWTLh1bMoMtCDVXLjLnc
         qO9oyj+vOduM5gujs8eJkSdxUE50eAQIAGOkw7hJVA6z49pxpS8EOAxOPApU2OpXI/en
         k864metJjCDxoNOpfU+LmEMfxTvRxW90PB8PsBxyfwo9G7Pg7RoGMsKrHzk20EXhG1A6
         nPpyeTGWZNgIvRRUj7mqmMg/jOQJOkF3gMOWGAf36Ln1Vv1JFh2a9tuO9jPuLz3mPrVi
         P3mNer8cDYa40R68Pn+SpWNn/qYtVTbJPvSpdAIkmy/cJWVBPc1WVBzoJvejs5W23XaI
         gy4w==
X-Forwarded-Encrypted: i=1; AJvYcCUYcs40vv1nloxVkDXF8xHQQkxinJBgeBHEmdr1x0VKBlVZg5YjSuYFyfU+O7Y+s/OTnwUnW4D+BUixKfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Uqoh7ILosc/7ou9JI+oNNrAaFx5G7u6nK/pMqdzDf1V4Jb3O
	fwhjn44gYmIBVWND9mzQLATDXObrwpY5YtKW4Gb8v/E5h2Zl8D/CI2ILXD42HfHz6r9bSvWB2jG
	PET8W+972X3KkiMDea4iyxP4xFf3bqhexNbx4i5bP9A==
X-Gm-Gg: ASbGncuwtDPmYBAXc7DmjuGZjWvUqps7rI7Ec/ZtdZqRZD9a/ERIIkCt0xuHhlykr5b
	q2ciUHEYtIc6xpV1BqkcWls/wmYtBMZgl65fcATMNGDQKriVGi3P02r+lclpQGBOSs0qrvjbML9
	sMHaRIjBVPnTL8spLtLjHQK41JJKGAcodvZeHEZnzH38w=
X-Google-Smtp-Source: AGHT+IH8MetiTltiLxVsoQdcqnz9SyKbfeIivBe6BgaYPax7FqypUr47bqpDDYKrtQHdmKVxRlIZT6Fr1Q1yswx0lfM=
X-Received: by 2002:a05:6512:3b96:b0:553:202e:a405 with SMTP id
 2adb3069b0e04-5539d327776mr135286e87.0.1749593331540; Tue, 10 Jun 2025
 15:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org> <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:08:40 +0200
X-Gm-Features: AX0GCFvL7R8uIhwfFeu8Zy5wwVjWQCtUtnOLFaGyd-WVGbMxfXjNiZWqOaZW5QQ
Message-ID: <CACRpkdb+1uYy92975JbFUgvO0GWZBru1A8gOsF_VY-opzxopSQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] net: dsa: vsc73xx: use new GPIO line value setter callbacks
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

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
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
