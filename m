Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158EB208986
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041929; cv=none; b=ks3GknllA7+HvM2cOFht1KD9t+spz6JLGDfPEJWL8yxP3gxxwGOde4E+7rVTlno0JcYxXq3bR5dPgm50Pjo44/kLNk4aCdJSl/X0tU+VKBH6GnTsBqwkpSraCIm6AIK8yjgrXasz/KYyjHWqAqG+DcCOxSS3lC7FjVTEePCZLto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041929; c=relaxed/simple;
	bh=xrTzkc7YdxcC+6FYZPlkBFv3OzxHgu7qRTtdTCjrXOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCRPGyO5/1q+2oKKxKv2qq00Aa2WZOm0SXPTITsVGb5gWixj401EKGecwvkxc2buVFD3euId+xM9VNoOo/zmw4NyT0j2Bh4uGdx7+8oSwAuyZ6v1m3eYtq3NrRAuW6z/SVhAxuF0wsCPTdKVV3TSjIPPhIOvbr/Co3m0dJIhSVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZ2gx/hw; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZ2gx/hw"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ef7c9e9592so43416227b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041927; x=1744646727; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RLRj1sR6XZayxwe9+ZhgcF90lKSx3ALzl5aR/HdVwNQ=;
        b=KZ2gx/hwN3qkD87K+3s8GN7i0MJqAUoMCsVNtAsAr2cXGd8tbSOESlM7+NkebnZQ3A
         fJPhXec0dzcvqXG8KzLCJvQJ99qwpYVZKDtDWn88GmKZ5Zmg7XJA6/O4u3eLYYN5k0+I
         sinTiofuRgWrBCelpBcVDe5yyhIfgNlbO3YH+NSUgRJtg2ImvfM+ItIsAyqN+xMXP7l2
         StgUeOqUxKuEDO0oGQQuLYa8WkU4XvrGq2VmsqJwhTvtbzYJTt2uIkwHyI6KwwTVlp0N
         gZ4WRmqT8G3cXii4QRjyShX1Fw42A93Q40sCAwRWuKR23yyojpdy+uXruZNqAPhkzojU
         emFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041927; x=1744646727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLRj1sR6XZayxwe9+ZhgcF90lKSx3ALzl5aR/HdVwNQ=;
        b=pCCrI8fsDH39hvphmhOPJEwui7PA4FZDko7dEfkz2JG5FHue5jz1lP18L/llyf3nhR
         jL4gpqT5CGC58KgwLHDnCoGsqbfFEey1DbE80c/8AbTl63YjFNIEs6i87yTEFfcI3jvt
         NML15m//qjnadXlRgcCHA3GGn6UgSQ7fLXqMbLrrI2IQsYxC0CxRlzbHff0v5rbCN1+C
         QwliVVssr5+dJZ4qu2AYksf98sH7G3kQNG74iUbaVmz9HLCDi/838wlvbdxsEEFZsEIU
         z1+d+rpdHnrS6WlatdY3g1CWIWungo9QK2DxMqmNG/f2w86FTO6LLHkfeVFPdujg3TwH
         S+FA==
X-Forwarded-Encrypted: i=1; AJvYcCUrMLAehSKXyKa4gqgZmbcd4OtOlcgXOvPHfVe/LIdYNQcVh2jQy5k5TmhIoL+rrXHAcXM+8qNGYJuj1Pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEAC/CSkhotDN20bWowiJ294PHc2WLxorVK9zV54Wwdif5M/9i
	EFWUJAF/bfawXf3sOqzygSMPmv0BJvKtecIomDdYF4eV3pqvWH8JSDI+Ol4hlPEpKrUwf/vB7gr
	xd8IJXX+eU93SwzkBIzdWb5fOyhl9ZTB/xLJNZg==
X-Gm-Gg: ASbGncuZ4utRF2Ss+nk5aWIDG/B+XAvDPzFm+/JVa8gbQ9FuzuHnskaA9vpl8ZMCFUp
	vo1aK1nxPI9StwroE2sP68ML+x3W9DxJTdTd1NdU53B7nv5y2WaixRDmmHEtPC2UDdbigsqW8Wr
	qZ8MmZV8b3N+JFqGk7XTnB+zu9988=
X-Google-Smtp-Source: AGHT+IGs9MJHAtcyu6zJo6IuqlKW0/r4nwiirsWiWEsDSZ9AYWO1k7oxhb6Zl8qgsQIsxC3tDiFhKxf9oSk0D+xMkuA=
X-Received: by 2002:a05:690c:6707:b0:6f9:7d7d:a725 with SMTP id
 00721157ae682-703e162980fmr230644897b3.33.1744041927155; Mon, 07 Apr 2025
 09:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329164145.3194284-1-arnd@kernel.org>
In-Reply-To: <20250329164145.3194284-1-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:04:51 +0200
X-Gm-Features: ATxdqUEcQlE855_cKO5w4MhJh52G9cKHEC6Ko0duh0ZSHBzqQdxU_lvLAM7zM0g
Message-ID: <CAPDyKFqgL28W+u2OCnaLSdOakkyH6sn-a_qkf0jmuU9NXGb1cA@mail.gmail.com>
Subject: Re: [PATCH] [v2] mmc: renesas_sdhi: add regulator dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Mar 2025 at 17:41, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The driver started using the regulator subsystem and fails to build without
> a dependeny on CONFIG_REGULATOR:
>
> ERROR: modpost: "rdev_get_drvdata" [drivers/mmc/host/renesas_sdhi_core.ko] undefined!
> ERROR: modpost: "devm_regulator_register" [drivers/mmc/host/renesas_sdhi_core.ko] undefined!
>
> The 'select RESET_CONTROLLER' needs to either go away or get changed to a dependency
> in order to avoid Kconfig dependency loops here. It also turns out the the superh
> version needs neither RESET_CONTROLLER nor REGULATOR, and this works because
> CONFIG_OF is not set there.
>
> Change both to a 'depends on', but add '|| OF' for the superh case.
>
> Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied for fixes and by fixing the typo pointed out by Geert, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index c3a9e856053b..c9e067b5ba94 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -694,8 +694,8 @@ config MMC_TMIO_CORE
>  config MMC_SDHI
>         tristate "Renesas SDHI SD/SDIO controller support"
>         depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
> +       depends on (RESET_CONTROLLER && REGULATOR) || !OF
>         select MMC_TMIO_CORE
> -       select RESET_CONTROLLER if ARCH_RENESAS
>         help
>           This provides support for the SDHI SD/SDIO controller found in
>           Renesas SuperH, ARM and ARM64 based SoCs
> --
> 2.39.5
>
