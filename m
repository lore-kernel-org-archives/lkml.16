Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE012E3AE1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545194; cv=none; b=i+5Nev34j+ehxaMVdwfW/HoYBemrDitgvmUPde/GxS13VcOYuj5XwkgWegEZ38kx2cGaLRRs2DuVGXiXoj4scBp5ysgZuoWPCiDZ5lgsQ/xMrDx0VHpFO06l3lOz/FthGc6n8WDHIxZeCZ4ptnFuE10WCCWO5w5k+00nLOJ/tB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545194; c=relaxed/simple;
	bh=TMekI+ePGLb2dVGIQvd4eMWoX3DAqPDpxNlAHJXJ7ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gcp4jDfoIj+Oku88T5gmiBvX7/cX3w3K+e0Ew1GHzBInmcPx93O3k3B/BUSg9f1dZI8wG+MYxukAypEdlzTUbdr5saTurkMWXE65ASuybJvQl6tnbqibeRbV3tK5BQawEIUHGFvnOjUcMQ59IYXz+m5YknAQasLdyWV8veD2Nzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FsFG6m01; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FsFG6m01"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-713fba639f3so78351617b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751545192; x=1752149992; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qTC597t48bncltdn47anMKlxgf1mIXgbQUWYTJlSUZI=;
        b=FsFG6m01aZ51iejphuFwUpt31/T+xR9uKywCpw7cm9ywNpd/LLHUjszKwZk5zye1B+
         t7bSgTzx00+un7s3RYZxjTOoYSxGB40D/zJ5bam2G/MtEH1eAMtHItdeFaVfrEpYt/4O
         6yTBRO2CPWGXi2W9VfvDEOTsi4ylB9QmH2g+MBaWF3h8/fB+P55CX2VCaivTyIc91xeX
         xjf+pTYigO5mru1+M0D+0zq8TRkV0O7cT5wJi9It0DHiAGwcvBbvEOg++3jvGJsNcDs+
         ObazsHRB5pHCOARh3IzqbaKTzVnllYMTFZLhycZAN2YqvEWqhk6VMFDKhm01xcsL50XD
         ZQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545192; x=1752149992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTC597t48bncltdn47anMKlxgf1mIXgbQUWYTJlSUZI=;
        b=izUVHZEEIiTMMweJxpCn3nsREtA+NR7xORlgwfoTGjJrYx9WxNQRbMlQsP911CgRQ4
         HiqgZGvmudNDi+OQiGEegDgQqnVnUkhWR4YDeYt7nOOtTP0JApfo3gYyrwUuOhe73p9k
         iY2MPSMUa5u5aU4/IVrYpkFkEf8cYyonpxH+uryOhvHEkT6+vYzZ1HPklQpVho2mM/RZ
         ta/RagVLa+EE2hlETJq0Dyakp9aocVFEgVVuKdv75Ue8PgUVv779Ky6A4c3J3I0DYjqN
         2LrBxFEMJ4rDjFv2LGTSN8hJNfIw0DDHeQKqkqNU5r/kJBX7a5RDblGY0Pw8aTNcfhlQ
         C3Rg==
X-Forwarded-Encrypted: i=1; AJvYcCULQ3Abz1QpTCPEHdN+/SxiIlIoZa4HZGZPwIgMU9N7kcbTfciRYJuFTdkkguwwGzIDDICDo/M4rXeQg3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl25QBpaHJ3UNw/NGcFXaVAw3r3Shpuein4rFYBy8DbQtgexuG
	grIxIhyozbuYaw54yQClHHMjlbXxIKQ9pTk/bIWGK7BzehCKfDpqVadmolMyFQDQ40L9vcdN6Q2
	2I2WWuGtl0LH2oDc13p6s9IWJ3P5NIIjVcBCJLmv+5g==
X-Gm-Gg: ASbGncthQLYNTiKv1UDHpBGN5Tm1uDmfyEebP4IeOVcKnCPK4hRnd3RdbuzeSFkesIx
	TzraPFMO8vWU6YUxxQfOllH5rgLylfgztahNFtJ4uDZ866MoN3RkEndVOUSkc2Z2lvr0XvHGm3U
	IBHX0tTJfjc5ToPYFd9/IJlimTQ7CXC4sYlg5eusMl4pFU
X-Google-Smtp-Source: AGHT+IEwi+jGBSSdoJm9iL9oKLTvyrTQHOBeWUAEM9l7fKOqqBksvPOst1zV7M7DzNv8oipsKvDD/lmQ+H+HLHXKg+Q=
X-Received: by 2002:a05:690c:61ca:b0:710:edf9:d940 with SMTP id
 00721157ae682-7164d5755b7mr87945397b3.36.1751545191877; Thu, 03 Jul 2025
 05:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620043517.172705-1-lidong@vivo.com>
In-Reply-To: <20250620043517.172705-1-lidong@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 14:19:15 +0200
X-Gm-Features: Ac12FXzM1OH6jEp4Aj99iKPDBaVLgh5QaSjxOO1gOJ_img1HJBSw-vdI_UPPTnc
Message-ID: <CAPDyKFp+w5UvpGKPtehqUrZHsAJ+tivLKtBcn8vJgOm1ZxWJrQ@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: Convert ternary operator to str_true_false() helper
To: Li Dong <lidong@vivo.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, opensource.kernel@vivo.com, 
	rongqianfeng@vivo.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jun 2025 at 06:35, Li Dong <lidong@vivo.com> wrote:
>
> Replace direct ternary condition check with existing helper function
> str_true_false() to improve code readability and maintain consistency.
>
> Signed-off-by: Li Dong <lidong@vivo.com>

Applied for next, thanks!

Note that I am applying this since $subject patch takes care of *all*
possible conversions (it just happens to one in this case) to
str_true_false() for the mmc subsystem.

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 0e0666c0bb6e..1f11626c8f47 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -38,6 +38,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/io.h>
>  #include <linux/unaligned.h>
> +#include <linux/string_choices.h>
>
>  #define ATMCI_MAX_NR_SLOTS     2
>
> @@ -2264,7 +2265,7 @@ static int atmci_init_slot(struct atmel_mci *host,
>                 "slot[%u]: bus_width=%u, detect_pin=%d, "
>                 "detect_is_active_high=%s, wp_pin=%d\n",
>                 id, slot_data->bus_width, desc_to_gpio(slot_data->detect_pin),
> -               !gpiod_is_active_low(slot_data->detect_pin) ? "true" : "false",
> +               str_true_false(!gpiod_is_active_low(slot_data->detect_pin)),
>                 desc_to_gpio(slot_data->wp_pin));
>
>         mmc->ops = &atmci_ops;
> --
> 2.34.1
>
