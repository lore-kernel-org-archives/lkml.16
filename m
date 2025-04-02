Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D10F238166
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593803; cv=none; b=ETLPAphk+/GZ3/we6cmoFXpM5K5t2lrXeb+VoGoK9lslMBs+Xx3qKvoR5YvLMTJ9fr5ohWKfKFvGITZSA5EiG3tFGgLnYnt4HrGnBYNDGk+TGWPipMAO4z3sD+eULtXDEUmVhBOuxHc/vvHTRbSi5G+k998tZoJG5jjFdrNM4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593803; c=relaxed/simple;
	bh=K/IxOeoGpLWd0tF2MZP/yWzEs17gKVZtkgJ6ev+aWm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTfljn2dHnIN99haPajZ8vkQDvcv0TPZ3dbLQLqn0y66LsyK2QNbFov+bh6rtsdt6VsPNPvJ/RhikGu9SxHJo0K7X/SPEw5LKIcx4Wa8PgB25Jdy4eE8gRD2G559A/EwxIePTfIv03zcZMpjrGJMLT7aUSQCuwZFn1dQg+V2r6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JonVyCoC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JonVyCoC"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10594812so5274187e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743593799; x=1744198599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AKdoyoCSvRsoZGSSFw8MoqljRP5EvFB4ozAvbpb1Ao=;
        b=JonVyCoCFPknaBmca8mds5pzV52jmq9pZraFiiG37Kvyhh8kh62yPeTNV3ssO0rLyY
         tg/wyZRs/DS6SgaztXxx+spduB0gl0i7F0VQ0ja2bj5NRw9HArG8pw2LDMBGeFvtcYhI
         QfwN/WG68XOqKH7scQ0sOU6SGRc9/iguusQjINdIhfGvgV6E12yebXHMNt6R5ihulGO3
         AH2aHTLCBbCYjeS1enhuTkrG5wZsNvMIMvorgn7hqdigPOHJTqb1An2HbVQ7BpnOXq4a
         w2UxjgksjVb2LkPuDFmvHjiYr8W6guJj5zOUMALbUm+s7TGUFbN6IDTlmqSa/AdqVoE9
         2AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593799; x=1744198599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AKdoyoCSvRsoZGSSFw8MoqljRP5EvFB4ozAvbpb1Ao=;
        b=u96kYGoABJqlTbVtNi3u0i9PJDD6/WZGjGUvpKEF3kazKjiuYn+H4H4pu+DlE7Nfep
         sCSA5YRt2PifRmVTJ1do4cR5qpPBs4KG6iEUPi/Z7xzflB+Ix6jilEIIK0qezkV90yXL
         e9Umw21GuoP+XiSuoc78IQT1bjR2msfngjvMOCXFOuB8OaDykhelXHoEtR2h2qVU9hXY
         l4HyOyvRwLlgcwjWo9CiawRpzYXEaQnnFj9B0jul22POC2+0vHwnY6TKQY8m26pvmug0
         Fk5khDP5MabykDUMcqlGZWeoZSwpetcbPi7rmSECa8JEW/3AU6nadm3rZM9zN5usRcP+
         1bGA==
X-Gm-Message-State: AOJu0Ywnz7mSSXEJ2n8B0a3DVPzZMJYD3UBOwCT5kMUqfpnEzz7juHq5
	6vi2od42rBF/i45XCeYjeQVAv59xKWZp6ej3yyLl5p7VJCQdmldSaWHV1lsZsJoAgYyOdYWoEC1
	V4CRCXziiHTYDpxRxASwSf30EwP/LNLLG9dzTww==
X-Gm-Gg: ASbGnctt7z3kWzTHgbpAh8dhHFn0/XjdXrT0iEhRuVWQUB16B56tZ/XOW7mE5/aK7gs
	WY+fHzNSQeGcv/xiob3gaEQ0PtD7YTpmVrQJsqXpphkpXQ7RZ6kxVvLfSnAN5GY3Y+bg42VMrYH
	yNp/QuDpq7wZJi+i+dOm5nwS8P8AysuW26qysrFDLroJDm2c4PHHWzYyOT/g==
X-Google-Smtp-Source: AGHT+IGsnbfXwvFZVuoC9UDDv3Npd3hZvi9h1Pp8wvqwNQjg5U9HC70EwnrQvmAWsGN56Cs2yZSGmu1+vFuYnT3C5tg=
X-Received: by 2002:a05:6512:334f:b0:54b:117c:118a with SMTP id
 2adb3069b0e04-54b117c1200mr3694523e87.55.1743593799153; Wed, 02 Apr 2025
 04:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401224238.2854256-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250401224238.2854256-1-florian.fainelli@broadcom.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Apr 2025 13:36:28 +0200
X-Gm-Features: AQ5f1JrJhtH8_ur3V9au8mD0Q0X31nTvcx7xt8ybgxveuCtP18Bl-AMF_VqywNs
Message-ID: <CAMRc=Mefks5RMDkO-w-WT1279rKKyz8Up9UbuNdcF+WpsOxioA@mail.gmail.com>
Subject: Re: [PATCH] spi: bcm2835: Do not call gpiod_put() on invalid descriptor
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 12:43=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> If we are unable to lookup the chip-select GPIO, the error path will
> call bcm2835_spi_cleanup() which unconditionally calls gpiod_put() on
> the cs->gpio variable which we just determined was invalid.
>
> Fixes: 21f252cd29f0 ("spi: bcm2835: reduce the abuse of the GPIO API")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/spi/spi-bcm2835.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
> index e1b9b1235787..a5d621b94d5e 100644
> --- a/drivers/spi/spi-bcm2835.c
> +++ b/drivers/spi/spi-bcm2835.c
> @@ -1162,7 +1162,8 @@ static void bcm2835_spi_cleanup(struct spi_device *=
spi)
>                                  sizeof(u32),
>                                  DMA_TO_DEVICE);
>
> -       gpiod_put(bs->cs_gpio);
> +       if (!IS_ERR(bs->cs_gpio))
> +               gpiod_put(bs->cs_gpio);
>         spi_set_csgpiod(spi, 0, NULL);
>
>         kfree(target);
> --
> 2.34.1
>
>

We could also just set it to NULL on error in bcm2835_spi_setup() but
I'm fine either way.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
