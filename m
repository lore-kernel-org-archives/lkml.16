Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162DC1D959B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705861; cv=none; b=mCQwWdt3dPPA6GsfIsI6MK7yMC3ryabFJTpsP82AFJHOwDN4yXx44wgPVouKhDH6jILEKJD0fZbMaBTrPbcgW/sryIwWIrjgR9keDUU1rAncBmNqLM04oZsAg6+STMW5mRo+Gn50j2Nj/oecbhnNwUtt7Ed7XllJ1JG4J9HOnqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705861; c=relaxed/simple;
	bh=7FMR4vK7CkGM3l4LtzpFaWNe/WG6upyNAAMbvvMmdJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WroeIDwqsIklxpOhsYfUQzTEHYE4MS9oKoOYWP5qlx+NoDQK9niYIzcacAVQlF5nN3oaz65/kBUMHmu+ZO61mJSGqWk6HkHNrUW1PNVlQC2AYWIIX7MwqAhK0x0pbWsN0gcWy8POkflBG8Vx5EZS0JihwNOhmYXEdXwh/g63MGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DVB4REjZ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DVB4REjZ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b166fa41bso6172384e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705858; x=1745310658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FMR4vK7CkGM3l4LtzpFaWNe/WG6upyNAAMbvvMmdJU=;
        b=DVB4REjZhro4kEG4VqMryl27liadrsNjzwAcPgzkM860OmRDlOxd+nHLAsVUT5gT+G
         te/t5aLLPUPwIRmdNkiOd1lZL38YPQui9kk7jMfuMu/iBvIhrHZKrI1sFjDjy5/DsXil
         TL5uH1KiFPXKOS7cFBZX9MXCbmGkM31L32gVrUPCwDoyiysmfYzVGG9Xh8a2twujwt/p
         qZU1ATkcil24bV5Vl1U/3fExjNB3cLDV2gw7d+9HRk8MgdjN8IPDNnsuO1xMszfHaufK
         HIIo2wdLPlHw1vD+51uGlR1TETW0QHDyVO+ZMr1Dvj+vCNf51UzxLuDYN2FIBWlt+PE8
         21vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705858; x=1745310658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FMR4vK7CkGM3l4LtzpFaWNe/WG6upyNAAMbvvMmdJU=;
        b=pEEf6YBf0A2uin7xTKJagycUzvX8WZF+hxorcPZkXFFjsnQ58LklJnmxWrQgtUUrw+
         xzxRGNZskKAvB3FrM/zTYXr5S5ODEFyBdrKLT5aTgUKbSMVToI7Mo2Tmbz60NSAcOSI9
         VYVmGPQn7ojPXHPdQ99i8RiloEuiVkxoJ0Nj4JJLEkw2yTkBeTqrb1Kpdyy4JFu8d9QG
         BGd9OnrKyolccQ7vihBqlyGXykUsbqgnQafSDIJcubOfkfVyPVotRceA3IitSLLiHbn7
         OelpzFSNMXj7RlKg5T4hJmQh+sC0bNnRclWcC01wB3ohKmg5KzoATflHOBZiJX8uAfdJ
         8UKw==
X-Forwarded-Encrypted: i=1; AJvYcCUOi/OfvPP5EaimOXQ4Gg1l/J5uYI/ms+32QREZsb/Xvv/jq5XJLKSKEHJ7TXmFaSk3QTLMEtYUcHSBZI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh/vSpEy3ikN78XsKnV+zsqbyIFB7Ok3H4CoIyvtoRh4+49H0m
	ejSh2uqIuDUjsExLy8ba51yJdSQzPWw29PFlh83Uuz/sV7wdkxEBrBKjQRG5mytUh/tIx6pzbE+
	fTl5Nn4HuI/VhrvmmYAmhrY/REftHHnhxZS/9ZQ==
X-Gm-Gg: ASbGncuPRC5w2LrpHvUqz1+nJzPjz9r5dpnJAJQMIvnM2rxFyJyU+0rDkNnzhJ9YeiC
	LHb/j0kWoU0bGiE30pPTNMogvGhL/T6dzs+OgvyIs4+XH3RR4jk+vbUxA0avHUyXhd1abkIjsKr
	Tme+ZpLIBGElEITiPw81XJqA==
X-Google-Smtp-Source: AGHT+IGnEYdC/tbXp6zUzoQmRqryQKEflVM5MqJd7M1yWtqEwMnlg/Eex3aKuiEz7JOwodkSWTklDUqq0ZZR8bJmqxg=
X-Received: by 2002:a2e:a545:0:b0:30b:a92e:8b42 with SMTP id
 38308e7fff4ca-31049a930d6mr47194111fa.26.1744705858086; Tue, 15 Apr 2025
 01:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org> <20250407-gpiochip-set-rv-gpio-part1-v1-11-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-11-78399683ca38@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:30:47 +0200
X-Gm-Features: ATxdqUGWGRkCpITOv-VvtHky0F7dBdnGGWgz8_h-UuiVgFohkRnQE4Ctw9GFm-8
Message-ID: <CACRpkdZKH6SaW3LEjTXgkoewH=E+Y0O9x0mJ9sVutb7QjyTS5Q@mail.gmail.com>
Subject: Re: [PATCH 11/12] gpio: ich: enable building with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Extend the build coverage by allowing to build the module with
> COMPILE_TEST enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
