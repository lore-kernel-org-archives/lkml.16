Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA711F9F73
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207330; cv=none; b=mvP33rIv61IyC9mPgbeUjCA/KUMueSTmylyMrmiu+S+87rfJOBdvEGUOJhaLeqfTTvTwjG5KmcMLfBlGpRmAVGAL4K4Aw3qQIuQrXE8cV5f4BRe08oQwXZ1R07wccHFHANFS4ySpcpapRZPdWhijn/MP2D2dC0LFnK/RVfEJtDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207330; c=relaxed/simple;
	bh=xsIXzxcogPEj7WI1OQx1l9ITv7ODZeAyB0f4aMhmg0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q0D4ZltuL4+1nKI1d8V2IT4QMJB7J7K21m4KgM3Y4m+U60mEXJytSPD7J7PaEg/8plR/EO+uCaY/otjiBGexCnQ9q43OgOnNd7xNH8Mn4mkX37dpHcgxyLsXHjhY/GYs7NJf+qTLrgaKWNMw0O1Q+lTcnQlmgvt9cZAhFFRwJFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=OJBazy+c; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="OJBazy+c"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad23db02350so712746866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747207327; x=1747812127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcbw5sLrHE1qbiw4ucHwavhVf9qACz67c1w54poiYio=;
        b=OJBazy+c3+gEW5HW4kB/WltiOBKafN68yV1O4L8vwACBYd26ud99VGXZPIxIQcocKt
         /Ex5DKanYGbYSrqz+G3NYcdm1SS94pkXfrj57y8WflSHslm5V3oiHYtkdKVx2ikuTNiI
         Hwo7DhqTkVTS8i6VURaZWKuBGEW8kYfVqLa7UQ+BpqQXYnLzObqTWaOK5wRsRiaNtwIK
         dqEf/7OjGLlgxQEyZW7GKkKnz3o91LsJg0aBylI3ijscxPW3GtmRUhEiPjroNO8au4It
         MwxIP82yFosa4fGK3MAJ48iB6sx8oN492j29U3J64RHwqQSOMSAaH1NVyokLeM9/DWZk
         uXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747207327; x=1747812127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcbw5sLrHE1qbiw4ucHwavhVf9qACz67c1w54poiYio=;
        b=tCMemn5DyrWdNWAQ8acer7RfI9wvuWYefn0JKFa1GaCuupn6fLk46xem7Yal7Z9O+o
         387P4A6ggGLc4/GaUjh2DPXfREmRRRjw1AK0hX40K/CuN9wbEbZi2Rbir/w5HIy4qASk
         yNDpRRlh74pkqn9P3AwMDrYjiYzV32/5jh3Fmw9h16XmQISD+BuvzNY+ltjmBJR355lw
         hV7nTABzaLxenCSKBSU//qnSpEKXHsUjxq4PIjBu4PjPJ6WTgHCPxBiov48+cffEe5e/
         YIUpt6hPKiF5VMoxrKeEbhtyw/LnOi31yx6XEK5vnBAjqfNulWyeknyJM2GagXn4Q/On
         +NeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM5Bv+3AiG1+cysai0B7HLvRGryiBaE/5qlypLG2XgpIyhivquBDflGhJmm8AUGEDp5kE95ru3dsehguY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+NKnh/YAYdch0/M8NNO6nejuEfLafPpsHB+U9qxjgZf/E4Ra
	cqT159mDqXjHZTcuzYvUC+GdmCWslESjrjXBBk/ZzkNTmY2jwqCNri2Io0IPbTGp41/gIdDUKij
	bFy6LxDY3TLMIr5nogvNdnyw5DsxkHKOU80eN+g==
X-Gm-Gg: ASbGncsELoKxC988GVRYwsmZbuNOn635ZQQBqvI8Sybk9ov06jQk7aYrYdFeiQwfa+z
	OQ98BPGKmezoEL6EXSl0Zcpf5CvAZq3xAastC3Z7K7LDwxsYu1Y/WNbfLpLmnBwqOZZqKkmT0n5
	H/DBWSaqXpmGCg/a34tXGLhJjRSyN1fqk=
X-Google-Smtp-Source: AGHT+IHqsMqx3BaDCWn45qMLaOEYvPW7XUqjv7SdJvzZ3hWp+AKyoxb4KrcmHMVJwGZocnpesHw3un4CM8pfyBJnatc=
X-Received: by 2002:a17:907:7f94:b0:acb:b1be:4873 with SMTP id
 a640c23a62f3a-ad4f70f6129mr261521866b.2.1747207326486; Wed, 14 May 2025
 00:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com>
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 14 May 2025 15:21:53 +0800
X-Gm-Features: AX0GCFscwF3i-VATg9tXixD2-TDlOGgy-oyXk_jgaiYVherKFdQgiFo0yj7WIAw
Message-ID: <CAH1PCMai91WjooaF8HzY=rJWpFT4Drnx7fcs4+NCsLT4pGEKUA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, conor+dt@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, alex@ghiti.fr, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, drew@pdp7.com, Inochi Amaoto <inochiama@gmail.com>, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	heikki.krogerus@linux.intel.com
Cc: Alex Elder <elder@riscstar.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, All

On Tue, Apr 29, 2025 at 4:51=E2=80=AFPM Guodong Xu <guodong@riscstar.com> w=
rote:
>
> This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA driver
> and updates related device tree bindings. The changes enable PWM
> functionality on the K1 platform through driver enhancements,
> configuration updates, and device tree additions.
>

Gentle ping, any comments or concerns on this patchset?
Any feedback would be greatly appreciated.

Thanks in advance!
Best regards,
Guodong

> Functionality has been verified on the Banana Pi BPI-F3 board using PWM14=
,
> configured as a pwm-backlight. Per community feedback, the actual
> pwm-backlight node is not included in this patchset but can be found in
> patch 7 of the v1 series, with modification of pwms property to 4-cell
> format to match updated binding (#pwm-cells =3D <3>) since v3.
>
> +               pwms =3D <&pwm14 0 2000 0>;
>
> This patchset is based on [spacemit/for-next]
>   base: https://github.com/spacemit-com/linux for-next
>
> Plus the following dependencies:
> 1. Clock controller driver, posted by Heylen Chu (v8), with most of it ha=
s
>    been accepted:
> https://lore.kernel.org/all/20250416135406.16284-1-heylenay@4d2.org/
> 2. Reset controller driver, posted by Alex Elder (v5):
> https://lore.kernel.org/all/20250418145401.2603648-1-elder@riscstar.com/
>
> Major differences between v3 and v2:
>  - Patch 1:
>     - Added: Reviewed-by: Rob Herring (Arm) <robh@kernel.org> # v2.
>     - When compatible string contains "spacemit,k1-pwm",
>       #pwm-cells must be 3.
>  - Patch 2:
>     - Dropped the addition of a reset_control field to struct pxa_pwm_chi=
p.
>     - Using a local variable in pwm_probe() instead.
>  - Patch 3:
>     - In k1.dtsi, changed #pwm-cells =3D <1> to <3>.
>
> Major differences between v2 and v1:
>  - Dropped the addition of spacemit,k1-pwm as a compatible string in the
>    PWM_PXA driver; instead, it now falls back to marvell,pxa910-pwm.
>  - Removed pinctrl settings for all PWM nodes (pwm0-pwm14); only the
>    pwm14_1 configuration is included in this version.
>  - Changed PWM_PXA from built-in to a loadable module (=3Dm) in the
>    riscv defconfig.
>
> v2 consists of the following patches:
> Patch 1: Add spacemit,k1-pwm compatible string (with fallback to
>            marvell,pxa910-pwm) and support optional resets property.
> Patch 2: Add reset controller support to the PWM_PXA driver.
> Patch 3: Add device tree nodes for all 20 PWM instances on K1.
> Patch 4: Add pinctrl settings for PWM14.
> Patch 5: Add ARCH_SPACEMIT dependency to the PWM_PXA Kconfig entry.
> Patch 6: Enable PWM and PWM_PXA in riscv defconfig for SpacemiT K1.
>
> v2:
> https://lore.kernel.org/all/20250420070251.378950-1-guodong@riscstar.com/
>
> v1:
> https://lore.kernel.org/all/20250411131423.3802611-1-guodong@riscstar.com=
/
>
> Best regards,
> Guodong Xu
>
> Guodong Xu (6):
>   dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
>   pwm: pxa: add optional reset control
>   riscv: dts: spacemit: add PWM support for K1 SoC
>   riscv: dts: spacemit: add pwm14_1 pinctrl setting
>   pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
>   riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
>
>  .../bindings/pwm/marvell,pxa-pwm.yaml         |  35 +++-
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
>  arch/riscv/boot/dts/spacemit/k1.dtsi          | 180 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |   2 +
>  drivers/pwm/Kconfig                           |   2 +-
>  drivers/pwm/pwm-pxa.c                         |   7 +
>  6 files changed, 225 insertions(+), 8 deletions(-)
>
>
> base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
> prerequisite-patch-id: a5d2fb43fd88525fa6c8ee767c31adfee87f1012
> prerequisite-patch-id: 8a8d0eefd0b4423d87f3c093b451a0fa60622ec4
> prerequisite-patch-id: 30f92f93e5b3577bde61424303f21c709a715ec5
> prerequisite-patch-id: d774b8281b5c6a822445365ee94925e1ab6c7a93
> prerequisite-patch-id: 54a4f5d065eb9f212fd99efec6e7e06abbb9bad8
> prerequisite-patch-id: 93962be60d1b58a98d947edf51b4af9edf513785
> prerequisite-patch-id: 5f53f8bf16fb067628092daebc4831293261aa01
> --
> 2.43.0
>
