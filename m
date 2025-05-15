Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DA9198A08
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330956; cv=none; b=iWFQS0JVzz6gpERuzKhOpxMM/7pnoprlkA4yVUORsB6S6LdcpJDhaGJSgWwLLKhqQORIID4eQiq1cS8VWEYzb1ZmX1dNArg/VNjE8sENvJj50RNzmtX7n0jea7yllRd8sfhZYL4DFQVrZcgftPqhLEgEjwogLYEssviQxLOzc90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330956; c=relaxed/simple;
	bh=6Efq2j6TisofbNrnauKeVT0+gmyAcoW/Ixe4Er3oz20=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euJKSfsuR9vrEUMY7ilzaoO3IXR+kImFhHsm+aezohGKhn2w32lMbbar5uJ0xiElYqDalaBka0bhQgAu/Y4hwy1bWIGp+4FT29LodlHBxkL7cqx4od3m2Piz+ud1lrzFHuIRvLWoivtJeAq1Rl5CIk9iVUmU6GvXMewHyjOenhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=vL2cIm0q; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="vL2cIm0q"
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E10DE3F7FE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747330950;
	bh=So1CFTxNLLyhmef/KyhBYu0LuKyl9nOCmDgIo++41wk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=vL2cIm0q5H2SHZn2hxJ71bFfGAoXibms+Z1luCokxVfS78/XrgbI4ynN4FNoBEzrn
	 s/yqTrgq3FWDqvB0O/e6kdkaPBOvzoBIqiSlLKyzGun/ajiC3OG9X3o/oxHlfOHsZH
	 y/gyRyTUssP5f2tTrZ5obOx6GMtIMoL68PsfNq2lVUexqdp4FKwujBMOMy+uAlYZaa
	 jqhlb83CXhrZmsTi5epcqHmn1PD3gAnJlbaYXEROyNRjTORiJ++CsIQZJ1FJENFy7o
	 ogWLxyuOV/tuKpJgO3coMEg472S/VgbnG9Jc316iLwv3GoFbWPKZwAkMVoZfPvLEwU
	 SmpMe8RzLyEBQ==
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-60602f86d59so536666eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747330949; x=1747935749;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=So1CFTxNLLyhmef/KyhBYu0LuKyl9nOCmDgIo++41wk=;
        b=bmNSvJnmYBakwAwlITfO/KHUOsobu8PgfRAq0PUy2lK4BcuhAg7Q0hmMj1SM4SjeyR
         N+dtf8ps3Eh1SFUhfH1yghHJoGzNPEEPZXyLpT7Iqm8JcXoT0It3eBzHEbGMdPQgZdQ8
         ZPKcxgAhJS3W/z0dCnrPtSWHIoqxvERs8DFJDym71UUBWrgl/+tdCkqwA8htgdJ4QY6C
         loSbH/+OQhCIa+KewJEtzbzOWQGg6ixZRJbECSGfE7mRQxVoK5rqVZh+FNyXTZiqfpne
         6B3tKvMZj7zO0gpP0JB5k9dM9Fw2y65F49rzuFDZ1rl93xkBXe7YxY3EQpKZX+Ww9KNW
         4PSg==
X-Forwarded-Encrypted: i=1; AJvYcCVxMcPyYRqJ9dySEZZ6yrxggDeKxSzj2o0b2qliK/p2PuJuHF0NrAkVFvdgFJp1pGzzSI0AJkh+KiugH7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhbEdVyX3CZrmLDRoIJU2ebNwO757JvM/9WQEmE+AoQSTqHiP8
	kFjjETp6P5UBdncXu8i6QQ8gWwTTRYAvimmSg7YFOMZ7a6u9tSZX5Q5YmKRBJdLsTfejakMk2d4
	vkMbQg3xMBT7EjbfNToNI69t4rN4ElIjEa+JNfQy5bL8c7tr/Ap8iCBkkO76NEtmS00oYogbTzW
	JBxYpgr9mCaatsL0sDKomV+LIqB1c/ek5lRDB/YKMpdaizhEopN7dQkXYV
X-Gm-Gg: ASbGncvj4jdP/Md/e2c3uFchNOi9UkEJKM49GJuPs1beOGWxEz7UM+4o3ecTJEAtiPW
	IXnzlSsmrb/CGrI8Iabx3r7fezXxH4VLQXfzKojrUkzsx7mkBA0sTauqKuJgY/SppAE04Yw==
X-Received: by 2002:a05:6871:4001:b0:2cc:3d66:b6ea with SMTP id 586e51a60fabf-2e3c1fb2766mr261855fac.34.1747330948662;
        Thu, 15 May 2025 10:42:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/OAz819UIHR7o2qpAdFNcz3GjooPhXbSZIsnIvoJM8E3oMutbyhPZIRnkN9DpFMjxtLmZ0O/4DGUc5r1eDrE=
X-Received: by 2002:a05:6871:4001:b0:2cc:3d66:b6ea with SMTP id
 586e51a60fabf-2e3c1fb2766mr261840fac.34.1747330948238; Thu, 15 May 2025
 10:42:28 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:42:26 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:42:26 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250424060605.638678-1-uwu@icenowy.me>
References: <20250424060605.638678-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:42:26 -0700
X-Gm-Features: AX0GCFsKao7zo32U6hevQ8RxcB-ZJSuK65r6ZvSZhpxa-_wyIbzD26PrLzWWrI4
Message-ID: <CAJM55Z_OZ6PSn3YQrrc2bz-PqKvfm76b3+dOjmuJrqGr+HZnQg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: use macros for MMC0 pins
To: Icenowy Zheng <uwu@icenowy.me>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Icenowy Zheng wrote:
> The pin names of MMC0 pinmux is defined in the pinctrl dt binding header
> associated with starfive,jh7110-pinctrl .
>
> Include the header file and use these names instead of raw numbers for
> defining MMC0 pinmux.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

This looks good to me:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Looking at this doesn't the contents of
arch/riscv/boot/dts/starfive/jh7110-pinfunc.h also belong in
include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
or am I missing something?

/Emil
> ---
> This is only a prettying commit. The resulting DTB files have the same
> content with or without this patch (verified by doing sha256sum on
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb).
>
>  .../boot/dts/starfive/jh7110-common.dtsi      | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index c2f70f5e2918f..a2c72b385a905 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -8,6 +8,7 @@
>  #include "jh7110.dtsi"
>  #include "jh7110-pinfunc.h"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
>
>  / {
>  	aliases {
> @@ -428,16 +429,16 @@ GPOEN_ENABLE,
>  		};
>
>  		mmc-pins {
> -			pinmux = <PINMUX(64, 0)>,
> -				 <PINMUX(65, 0)>,
> -				 <PINMUX(66, 0)>,
> -				 <PINMUX(67, 0)>,
> -				 <PINMUX(68, 0)>,
> -				 <PINMUX(69, 0)>,
> -				 <PINMUX(70, 0)>,
> -				 <PINMUX(71, 0)>,
> -				 <PINMUX(72, 0)>,
> -				 <PINMUX(73, 0)>;
> +			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
> +				 <PINMUX(PAD_SD0_CMD, 0)>,
> +				 <PINMUX(PAD_SD0_DATA0, 0)>,
> +				 <PINMUX(PAD_SD0_DATA1, 0)>,
> +				 <PINMUX(PAD_SD0_DATA2, 0)>,
> +				 <PINMUX(PAD_SD0_DATA3, 0)>,
> +				 <PINMUX(PAD_SD0_DATA4, 0)>,
> +				 <PINMUX(PAD_SD0_DATA5, 0)>,
> +				 <PINMUX(PAD_SD0_DATA6, 0)>,
> +				 <PINMUX(PAD_SD0_DATA7, 0)>;
>  			bias-pull-up;
>  			drive-strength = <12>;
>  			input-enable;
> --
> 2.49.0
>
