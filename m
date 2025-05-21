Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1162343C9
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812589; cv=none; b=djv3qnbwNcm3gXkvp4qE+4mOq0I1KvkOM8XIcsPuJaLQkDcqtmGUcXBceN/TqTIourS4/nc3HZPV/cWuFpCFHWqlJKhBZKtcA9DD0WmM7J5IvxHjbnkEM4vEjsBW7kY1jsWV5wi9aQrS+4xlJUEPR3nH4fAMfa8KBn7OO7LpWhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812589; c=relaxed/simple;
	bh=5QOEFujNAU224Hj3QqjjAu8F3cWlAhTNz/g3jWicV+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRrGCvL73rHLnRt+jvapGFsLXLdIPQntuKVMwksoCgWrZY5U2hhprpPkERB9K+zDjjMGneMgis21AT7vLEPV0gjrb8GZeQKE0GzMKEc30SVOmUfuVgCYRcPkY2MqK28HQuK1Sz46FuoLwdbp3gO+zgpJct6sgC0mka6MuC17IcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ew0hBRMw; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ew0hBRMw"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54298ec925bso9978061e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747812586; x=1748417386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PH6FcCTvcCsGA3pEC6MGqn/kU/j9G10vtPXCblGsYM=;
        b=ew0hBRMwWqQfrWBtC+6CDjFA4CU5xUx2DgehQ0p8CYG+buN8XvYpW1fj0l4k1DDWS5
         r20rxGmpooM+p16oRF5zY+wMNiW1ear0FL4bcocNSXvl6/fdxQV8J5SYa5lw13iHmuHN
         kTKfebRVmOoGhQAgEGJMIcIodqSEvryZzcGRiQ04yYaKinC+ERH8wZMSCej37VpzLc+y
         VyH13dJhCHZHFazy7xs/NGsupNjwv8vT9vm69P/hvR4rVYylbOSdhmPoKyNw/g79jJCp
         DMKdOTOHvpzdHAtcL8/+GrRwbIK9uQKh3FwKNHg3ywrZB/3fCDANbmOMFNFnYE4NAPSN
         dosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747812586; x=1748417386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PH6FcCTvcCsGA3pEC6MGqn/kU/j9G10vtPXCblGsYM=;
        b=Mgrc/afd9kophOW5GcnI0BFP8b0eT0DZ0R+cvEbmjt3Au2XPbGomdto+resjf9SOTM
         WfDqVjaTgwPWlHoN9nRw1aEalkRNDwfPkZiExGOH72mvuwePPPJP6AQ9yfHegJK8VDw+
         Q4zjj7D+KmWkqudi7azxvvRNX4BnZEFvT00lUaFqyF5u/xNX5kafcexe06gHXIduheF4
         uE/tVsl6IlkbtHvYs3Va/z7JAklRmZWlxMuTiGi0ktLYqTpdjQ6nVu/sz2XK5bXq3/De
         F/qIasOv33jEYy5U7HVsawRHmJoBSRV9wMByVqvTHHwis0qZkqwrf90Cpa/drV4NRe1w
         adJg==
X-Forwarded-Encrypted: i=1; AJvYcCWakf3zSclyfEUqF2mfZMSnFklDEFptw+RH2k/ocvvpXwNcDi8mnsoICe3YoKkdZm16OMmMkfv1tyDOSbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpXPwbMVorKgshC/F7IEXp5NCOJ7r23M4BDlSAD7qgWRblmocr
	aC38kXzTL1tVTMEvS8WXu67mftB0pFKetZMZWvHmtFro8GjpHvUNWDdkFNFHqXnjlesUpNqEI2a
	88FjSef73brFf+7PmzUNJIB/SfORLNvvOQ4I2bJuAJQ==
X-Gm-Gg: ASbGncs9F7a9OcIOYfGpfPaUn/1SRjW5Xtk+tpsG0REkucpcFz90kqxfYQNGbHWJWMZ
	cURxUgVFICxmqhosYvyQAzTIxsDo4/gvMLV6uRznwIm8GxWOLQNWSLv0c6tEHtwetBQ34Mo+M1f
	OIyfTCpvcUPihd/Xzopcws7DG8YAm675oM59CpH9WzyFgdxNCzpG3lwvxGtN5TEjG7
X-Google-Smtp-Source: AGHT+IGi+hlDlFryu83MUl58HnzanyHhkItUmquYyNR0YbZhFjMMynLVndB6XnoFry/M/qE8qsetk+tJQInM0Vftoe0=
X-Received: by 2002:a05:6512:6c5:b0:549:b0f3:439b with SMTP id
 2adb3069b0e04-550e71bfaffmr7680730e87.16.1747812585795; Wed, 21 May 2025
 00:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 May 2025 09:29:33 +0200
X-Gm-Features: AX0GCFuARv8NTEaBZbmAi5mo_wX4qtDCQAqZq8myL7yOFqeC3xBU1D2u36DDp2U
Message-ID: <CAMRc=MfbQMebHDa4_=79ZaFRf_0V47wQHh8bP+MQh1Qj=wjOyA@mail.gmail.com>
Subject: Re: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:22=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
> are only built with GPIOLIB_IRQCHIP=3Dy. Add the missing Kconfig select.
>
> Fixes: 3f50bb3124d7 ("gpio: davinci: Make irq_chip immutable")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505210606.PudPm5pC-lkp@i=
ntel.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> Hi Bartosz,
>
>  I follow same approach as you did.
>  My last build using multi defconfig was not enough.
>  I tried build all arch/arm/configs/*, no errors with this patch applied.
>
> Thanks,
> Peng
>
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a559d5bb8249..c3465fd82b08 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -253,6 +253,7 @@ config GPIO_DAVINCI
>         tristate "TI Davinci/Keystone GPIO support"
>         default y if ARCH_DAVINCI
>         depends on ((ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || A=
RCH_K3)) || COMPILE_TEST
> +       select GPIOLIB_IRQCHIP
>         help
>           Say yes here to enable GPIO support for TI Davinci/Keystone SoC=
s.
>
> --
> 2.37.1
>

Ah, you beat me to it by 2 minutes.

Bart
