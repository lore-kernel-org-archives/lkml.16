Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AFF1CD1F
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 06:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746252479; cv=none; b=Xp+qo1VBNhblT8xEkDoycstBndDj+uqtCKlXTcrRE+VCDu1tG7MDYDMuoKGWU2rBh5fv7o7xaudXyR1KFESX11nuaSKSvLgXI9FwTjlQL2Z/wv6uKsjvwaEHxbk4B5KQ1dDpwnybsXlg1uhDS04vBVOICwFhUNsjyZQyISEhCak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746252479; c=relaxed/simple;
	bh=+QJDZovpUnvGuA0g95PSNOh5yPbLbymlNmM9lorXB08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrYw8+/E0HfoQpzQo+JJMw21v8aXwhTT4Nb7gtZrb61hePzmjeUzMVJ0bDUtS3TxJ7Uju3AAnlmFYfGazhY1YVH6G/lKyAbkA8JI/B/0Gdqi4IEsWGVtnpFUsIHgBbfn4krG3zjy1sF6EifVTEP/w09pVrvfLJ7NGr9uE+hhi9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyUpL00S; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyUpL00S"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a064a3e143so1110478f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 23:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746252476; x=1746857276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBu6Bcz2Ojmi3w8/SnHEMrKjOSo3bxFvG0VHHv8d4I0=;
        b=LyUpL00Sz9L0U/taWvBBbj5rBIOUB9WJrPiG93h9d68pRfgghIGeE8HTTIPHwWp6MH
         xjVvEbHbRoxz6kg14CzS/g2x9xdcEzKVTtrNoAl86X18PIDxqaLZOXYEOkgtZgDAfzXZ
         yCSWzbpjXg2/ieEDnEk2j9/XcvPqdgh96ssnPDqF6e38GlkrzjbWd+k3aBbONZ9XCG3p
         GbeuhNcn65L0FIDDiqKJHbwTgFjHAgMI+OmNPdakFkwcmK+ncZ5mO1Kj+8WPeTWsfGRd
         TdoGRxiVBovdXSSH57xdfIHVTsntDhELZLdQXzo2HaW8ed86JU2JB3j0y0VkVJjG7flf
         mSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746252476; x=1746857276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBu6Bcz2Ojmi3w8/SnHEMrKjOSo3bxFvG0VHHv8d4I0=;
        b=U5PrAh4d4FfFrEd5VvoJ2+yxvMd3IBolqG435K6bO+YXLO4q/rVAWpUxwyaYzM/3VO
         PHhJAd+NplVjlrCUNT3XuWva4k6PjQ3utMae7Z73rgoag+SbQX5+b4t2vhHaJFHYKYiD
         wWl4FRToXZAsm+8oJ10Yw0h+neuYHccYqo9bhKkz24nNSmWIkLKsOnhwYidaQUVYpjzY
         vczGSGaTwFL2XxGGqj3KYDroj2o0drWHQrFwoOfcBs6loA7OHUn+fhK49CB5XO33/RfD
         PC66ld3hj1jUoGnDNq+CcZjwamUmsqFg4OIROVx31l17iN5OkxXlL8ebluqxfaEd/A7h
         /Oow==
X-Gm-Message-State: AOJu0YzDCOI9VyYoTNezjjmr9yMlVgxkld6/epKdhFS6lzIwQgp7S2Da
	TGCrVeIr/Vo0WJDK7z9b24rumiGr4EWzVT2/LcJIK0ZE6znoUFIwtnENOL4IqlkPiCQ0Zeui87W
	79t7oKT+Tr5UetIl6zGdhyNcJ40B2Uda2
X-Gm-Gg: ASbGncsPj6tZPuaCdMqRKWnCmC0b5GSrjqqvQOwiDQmG42zm+oHFvnlfP65ntVNuEMW
	LZVVlZuUZyQ8Q8pXP0ovGRrlqF37qigmlO6WtgrgB0V4MgPn5NpwkVBZ4f/IAk96My+Y2dDp24t
	Gomw8rOu6ETJYTgOcXBBCPFR5ARvqlR0LrVA==
X-Google-Smtp-Source: AGHT+IG5QTC8MFzSFIWGvx68IkSJ4fzLRiLgfMdy/Ps0A1c2l/JtJ1jA+zT7QGAMk+Ll7H0j0cQwrfjrBiZtJyw1S/E=
X-Received: by 2002:a05:6000:144b:b0:39c:310a:f87e with SMTP id
 ffacd0b85a97d-3a09fd731aemr29288f8f.16.1746252476180; Fri, 02 May 2025
 23:07:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430055114.11469-1-clamor95@gmail.com> <20250430055114.11469-3-clamor95@gmail.com>
In-Reply-To: <20250430055114.11469-3-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 3 May 2025 09:07:45 +0300
X-Gm-Features: ATxdqUH1dFVwpoCberGyQEzgLueDe07JSzuP9-P691XmMzb-smYM6An0NgV1Ypc
Message-ID: <CAPVz0n2dHmAF+x1txDXE40XkRpg-nAsMgqgZAGOPWgkAZ6wfVA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] power: supply: Add support for Maxim MAX8971 charger
To: Sebastian Reichel <sre@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=BA=D0=B2=D1=96=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 08:5=
1 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> The MAX8971 is a compact, high-frequency, high-efficiency switch-mode
> charger for a one-cell lithium-ion (Li+) battery.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/ABI/testing/sysfs-class-power |  43 ++
>  drivers/power/supply/Kconfig                |  14 +
>  drivers/power/supply/Makefile               |   1 +
>  drivers/power/supply/max8971_charger.c      | 752 ++++++++++++++++++++
>  4 files changed, 810 insertions(+)
>  create mode 100644 drivers/power/supply/max8971_charger.c
>

...

> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 8dbd39afa43c..09fb123efe4f 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -595,6 +595,20 @@ config CHARGER_MAX77976
>           This driver can also be built as a module. If so, the module wi=
ll be
>           called max77976_charger.
>
> +config CHARGER_MAX8971
> +       tristate "Maxim MAX8971 battery charger driver"
> +       depends on I2C

Greetings, Sebastian!

Kernel test robot caught an issue regards dependencies of this driver.
Although, it was made in way that extcon is optional, unfortunately
extcon framework is not. Extcon header does not provide inline
versions of functions used here hence undefined references pop up. I
suppose proper fix would be by adding depends on EXTCON. Would you
amend this commit or should I send a v7?

Thank you for all your efforts and sorry for inconvenience.

Best regards,
Svyatoslav R.

> +       select REGMAP_I2C
> +       help
> +         The MAX8971 is a compact, high-frequency, high-efficiency switc=
h-mode
> +         charger for a one-cell lithium-ion (Li+) battery. It delivers u=
p to
> +         1.55A of current to the battery from inputs up to 7.5V and with=
stands
> +         transient inputs up to 22V.
> +
> +         Say Y to enable support for the Maxim MAX8971 battery charger.
> +         This driver can also be built as a module. If so, the module wi=
ll be
> +         called max8971_charger.
> +
>  config CHARGER_MAX8997
>         tristate "Maxim MAX8997/MAX8966 PMIC battery charger driver"
>         depends on MFD_MAX8997 && REGULATOR_MAX8997
...
