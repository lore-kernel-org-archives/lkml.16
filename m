Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7412853F8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744306804; cv=none; b=ugdqEstsJpfm46/jmk/bH/QkIJzHo1di2hW6fmmDco0OOEJJrA/tzj/PI/Ndd0PRzwr23EWbePXr+2yb+xHUhxnHTkWJMb4Q6wwPFfZJ1NSio/fvri6pe1EXJo4jd783Dy+o/CflNIMvGcqbBOl72fsUGDeAmahI0cgan7PIScs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744306804; c=relaxed/simple;
	bh=6bNtF5vJ2uJgLhlEOjuPzQXyX37Ht0WxFkzoLXDAlkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LbXAm+3GSuYaEqXSj9HajSNmVbjH3zQq+CK6ITpXOTTxDg17fn8g6mCoSO3fWlCU4ZvIn3fQXuY02qOMnYQiSA3OzzbeylcEapSjnunuk9IlHhogfpMOwsyDGHIhidYmL+LyYMfLZ8nmLRtGuty0flwuHl9PkJIs8yTfPOHy5Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IGhsGsnS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IGhsGsnS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22580c9ee0aso12306235ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744306800; x=1744911600; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nTvseCu5Y4+NkTlxcDynRuQS/oR2DBlDyk6ebU6Tevk=;
        b=IGhsGsnSahF2jw12ocv+7MHF24i25JFK7+gEozUTmgsrkAc93Tlxle76OKUkHqvPoI
         xv9cIRswWp5rACWJRjxbTYba5/eqLzD8B2p6i3yufiWtD8AfOiSRQ1Zmb6h3examZ/l7
         jpiyOcXkDuv9iaXguDz1XLZBNYwX5Eik2xQTVPLxmzmp8W1hoHRUkbcCYiIG4/iigh1S
         vfE29rVcsk15HTIADMiMOBbAU0bBg/ZQpCJ5iRaoD1fuKLUFr93lZjHPen1pMWFaUHjj
         BTMVoWV1SAfCHkxiTA4wzpCGic7cLWX6A6pJfFdd8GQ3z8fu0oRuaeudIkzww1nG1u14
         V1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744306800; x=1744911600;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTvseCu5Y4+NkTlxcDynRuQS/oR2DBlDyk6ebU6Tevk=;
        b=jXagYMre3THlEZq75qkud5Z3503MiJuranH+R++CdohR11RJWPsIpjWv0lAJMr2RhH
         UbaRSaSnbkbFWjBjxtgpOM9isuTonDCzGEt5cQeU8f+9pUY0Q1lCEUPKmEz53wRaBcaN
         zBkNfKMpdqZZ+eYFjSs4N75nSBG+lDDtyZCMuoNG7OyIdNKX2WO0wy6JpADkgZHIkd0S
         0PFYFnSoOKoJnjk5Q/82JSaZfli9wsdZixosu6MBXd6s0Bj63oidI8b+NSgJ8cnrF00S
         u8jlgsTh8Gi8pcSWl2SOldH818KJFD5e/QMJcsQB2q0zoYahz4FfeCt6E+gYekdSHNuQ
         LsLg==
X-Forwarded-Encrypted: i=1; AJvYcCUwQVOr0iHSDhqC9KFX6aojHpIBK+E5VnBAlfmlUugrj2+MFK7R40ATP2R8BXoMiuG9HGYb59vPQTlq9kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMLDYYaC1MOlZQU8hUXa6LS7qYtsCVXhm8cIl7nebCuGAkxhNt
	rwWlPnO96DfL4ZyxMf3x7QDNEbtoFWeJmmp62TD16hiiLBQmeaedCwo3gAB0lKU=
X-Gm-Gg: ASbGnctUCsGEIkULFLQ1EJuiBx8GhkR+fHCLPe4SgHAC2O0r0TOhbO7N/gOyQYG79rP
	91AmeU9cazxgvS37Av1CcVCzacEzjI6LyrGSaxYLr97JJADIXR0uVjdTN6Wfj1ZGf5ppNRgPqtu
	XGYNUZ2x9q3vHBuC+uP+XQCnTOA1qH8apgypO74H8G/N+KJQjaN1xOwCg4F9PLM41wa0rJVDAgy
	450PMwAlXavFrRq9c8UiKfbu3kae+8qdEQ1MLJ/nwSP3xAF06ZO0XVZe1ENc+rsCfAvoYj5Qph8
	z83+CV5Rmpu8q629RSuSmpegXXrKexWqXcCpPXY=
X-Google-Smtp-Source: AGHT+IHPfzURAnzfAMGxCCl37cmsKEnkpUse8ZSC5EBwCpxFB/QZiBylmm9e1vIS1cQ7UWzNE4ihkg==
X-Received: by 2002:a17:903:2343:b0:224:826:279e with SMTP id d9443c01a7336-22be03af567mr46159525ad.50.1744306799674;
        Thu, 10 Apr 2025 10:39:59 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca1bsm33775545ad.255.2025.04.10.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 10:39:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Russell King
 <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: David Lechner <dlechner@baylibre.com>, Arnd Bergmann <arnd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] ARM: davinci: remove support for da830
In-Reply-To: <20250407-davinci-remove-da830-v1-1-39f803dd5a14@linaro.org>
References: <20250407-davinci-remove-da830-v1-1-39f803dd5a14@linaro.org>
Date: Thu, 10 Apr 2025 10:39:58 -0700
Message-ID: <7hplhjgbkh.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We no longer support any boards with the da830 SoC in mainline linux.
> Let's remove all bits and pieces related to it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

I still have a da830-evm in my lab, and it's still able to boot what's
on the SD card[1], but indeed it's been awhile since it booted anything
recent.

So, farewell DA830,  It was fun while it lasted.

Kevin

[1] 
U-Boot 1.3.3 (Jun 28 2012 - 13:59:37)
Linux version 2.6.18_pro500-da830_omapl137_evm-arm_v5t_le (x0029463@aspbuild11) (gcc version 4.2.0 (MontaVista 4.2.0-16.0.32.0801914 2008-08-30)) #1 PREEMPT Thu Apr 23 17:41:16 IST 2009

> ---
>  arch/arm/configs/davinci_all_defconfig |   1 -
>  arch/arm/configs/multi_v5_defconfig    |   1 -
>  arch/arm/mach-davinci/Kconfig          |   7 -
>  arch/arm/mach-davinci/Makefile         |   1 -
>  arch/arm/mach-davinci/cputype.h        |   1 -
>  arch/arm/mach-davinci/da830.c          | 506 ---------------------------------
>  arch/arm/mach-davinci/da850.c          |   1 -
>  arch/arm/mach-davinci/da8xx.h          |   2 -
>  arch/arm/mach-davinci/devices-da8xx.c  |   1 -
>  arch/arm/mach-davinci/irqs.h           |  27 --
>  arch/arm/mach-davinci/mux.h            | 404 --------------------------
>  arch/arm/mach-davinci/psc.h            |   3 -
>  12 files changed, 955 deletions(-)
>
> diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
> index 3474e475373a..5e972a1c14e9 100644
> --- a/arch/arm/configs/davinci_all_defconfig
> +++ b/arch/arm/configs/davinci_all_defconfig
> @@ -14,7 +14,6 @@ CONFIG_ARCH_MULTIPLATFORM=y
>  CONFIG_ARCH_MULTI_V5=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_DAVINCI=y
> -CONFIG_ARCH_DAVINCI_DA830=y
>  CONFIG_ARCH_DAVINCI_DA850=y
>  CONFIG_DAVINCI_MUX_DEBUG=y
>  CONFIG_DAVINCI_MUX_WARNINGS=y
> diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
> index db81862bdb93..d1352773b58f 100644
> --- a/arch/arm/configs/multi_v5_defconfig
> +++ b/arch/arm/configs/multi_v5_defconfig
> @@ -12,7 +12,6 @@ CONFIG_MACH_ASPEED_G4=y
>  CONFIG_ARCH_AT91=y
>  CONFIG_SOC_AT91SAM9=y
>  CONFIG_ARCH_DAVINCI=y
> -CONFIG_ARCH_DAVINCI_DA830=y
>  CONFIG_ARCH_DAVINCI_DA850=y
>  CONFIG_ARCH_MXC=y
>  CONFIG_SOC_IMX25=y
> diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfig
> index 8f66de0405d9..6cd6d29a2c9d 100644
> --- a/arch/arm/mach-davinci/Kconfig
> +++ b/arch/arm/mach-davinci/Kconfig
> @@ -19,13 +19,6 @@ if ARCH_DAVINCI
>  
>  comment "DaVinci Core Type"
>  
> -config ARCH_DAVINCI_DA830
> -	bool "DA830/OMAP-L137/AM17x based system"
> -	select ARCH_DAVINCI_DA8XX
> -	# needed on silicon revs 1.0, 1.1:
> -	select CPU_DCACHE_WRITETHROUGH if !CPU_DCACHE_DISABLE
> -	select DAVINCI_CP_INTC
> -
>  config ARCH_DAVINCI_DA850
>  	bool "DA850/OMAP-L138/AM18x based system"
>  	select ARCH_DAVINCI_DA8XX
> diff --git a/arch/arm/mach-davinci/Makefile b/arch/arm/mach-davinci/Makefile
> index 31d22a5d8e1e..7a210db669f4 100644
> --- a/arch/arm/mach-davinci/Makefile
> +++ b/arch/arm/mach-davinci/Makefile
> @@ -10,7 +10,6 @@ obj-y 					:= common.o sram.o devices-da8xx.o
>  obj-$(CONFIG_DAVINCI_MUX)		+= mux.o
>  
>  # Chip specific
> -obj-$(CONFIG_ARCH_DAVINCI_DA830)	+= da830.o
>  obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= da850.o pdata-quirks.o
>  
>  obj-y					+= da8xx-dt.o
> diff --git a/arch/arm/mach-davinci/cputype.h b/arch/arm/mach-davinci/cputype.h
> index 148a738391dc..a8f5330aaad1 100644
> --- a/arch/arm/mach-davinci/cputype.h
> +++ b/arch/arm/mach-davinci/cputype.h
> @@ -25,7 +25,6 @@ struct davinci_id {
>  };
>  
>  /* Can use lower 16 bits of cpu id  for a variant when required */
> -#define	DAVINCI_CPU_ID_DA830		0x08300000
>  #define	DAVINCI_CPU_ID_DA850		0x08500000
>  
>  #endif
> diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da830.c
> deleted file mode 100644
> index a044ea5cb4f1..000000000000
> --- a/arch/arm/mach-davinci/da830.c
> +++ /dev/null
> @@ -1,506 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * TI DA830/OMAP L137 chip specific setup
> - *
> - * Author: Mark A. Greer <mgreer@mvista.com>
> - *
> - * 2009 (c) MontaVista Software, Inc.
> - */
> -#include <linux/clk-provider.h>
> -#include <linux/clk/davinci.h>
> -#include <linux/gpio.h>
> -#include <linux/init.h>
> -#include <linux/io.h>
> -
> -#include <clocksource/timer-davinci.h>
> -
> -#include <asm/mach/map.h>
> -
> -#include "common.h"
> -#include "cputype.h"
> -#include "da8xx.h"
> -#include "irqs.h"
> -#include "mux.h"
> -
> -/* Offsets of the 8 compare registers on the da830 */
> -#define DA830_CMP12_0		0x60
> -#define DA830_CMP12_1		0x64
> -#define DA830_CMP12_2		0x68
> -#define DA830_CMP12_3		0x6c
> -#define DA830_CMP12_4		0x70
> -#define DA830_CMP12_5		0x74
> -#define DA830_CMP12_6		0x78
> -#define DA830_CMP12_7		0x7c
> -
> -#define DA830_REF_FREQ		24000000
> -
> -/*
> - * Device specific mux setup
> - *
> - *	     soc      description	mux    mode    mode   mux	dbg
> - *					reg   offset   mask   mode
> - */
> -static const struct mux_config da830_pins[] = {
> -#ifdef CONFIG_DAVINCI_MUX
> -	MUX_CFG(DA830, GPIO7_14,	0,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, RTCK,		0,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_15,	0,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMU_0,		0,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, EMB_SDCKE,	0,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_CLK_GLUE,	0,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_CLK,		0,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, NEMB_CS_0,	0,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMB_CAS,	0,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMB_RAS,	0,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMB_WE,		0,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_BA_1,	1,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_BA_0,	1,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_0,		1,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_1,		1,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_2,		1,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_3,		1,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_4,		1,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_5,		1,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, GPIO7_0,		1,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_1,		1,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_2,		1,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_3,		1,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_4,		1,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_5,		1,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_6,		1,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_7,		1,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, EMB_A_6,		2,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_7,		2,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_8,		2,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_9,		2,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_10,	2,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_11,	2,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_A_12,	2,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_31,	2,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, GPIO7_8,		2,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_9,		2,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_10,	2,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_11,	2,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_12,	2,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO7_13,	2,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_13,	2,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, EMB_D_30,	3,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_29,	3,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_28,	3,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_27,	3,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_26,	3,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_25,	3,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_24,	3,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_23,	3,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_22,	4,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_21,	4,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_20,	4,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_19,	4,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_18,	4,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_17,	4,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_16,	4,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMB_WE_DQM_3,	4,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMB_WE_DQM_2,	5,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_0,		5,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_1,		5,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_2,		5,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_3,		5,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_4,		5,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_5,		5,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_6,		5,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, GPIO6_0,		5,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_1,		5,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_2,		5,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_3,		5,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_4,		5,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_5,		5,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_6,		5,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, EMB_D_7,		6,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_8,		6,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_9,		6,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_10,	6,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_11,	6,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_12,	6,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_13,	6,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMB_D_14,	6,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, GPIO6_7,		6,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_8,		6,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_9,		6,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_10,	6,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_11,	6,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_12,	6,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_13,	6,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO6_14,	6,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, EMB_D_15,	7,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMB_WE_DQM_1,	7,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMB_WE_DQM_0,	7,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, SPI0_SOMI_0,	7,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, SPI0_SIMO_0,	7,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, SPI0_CLK,	7,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, NSPI0_ENA,	7,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, NSPI0_SCS_0,	7,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, EQEP0I,		7,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, EQEP0S,		7,	16,	0xf,	2,	false)
> -	MUX_CFG(DA830, EQEP1I,		7,	20,	0xf,	2,	false)
> -	MUX_CFG(DA830, NUART0_CTS,	7,	24,	0xf,	2,	false)
> -	MUX_CFG(DA830, NUART0_RTS,	7,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, EQEP0A,		7,	24,	0xf,	4,	false)
> -	MUX_CFG(DA830, EQEP0B,		7,	28,	0xf,	4,	false)
> -	MUX_CFG(DA830, GPIO6_15,	7,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_14,	7,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_15,	7,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_0,		7,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_1,		7,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_2,		7,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_3,		7,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_4,		7,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, SPI1_SOMI_0,	8,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, SPI1_SIMO_0,	8,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, SPI1_CLK,	8,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, UART0_RXD,	8,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, UART0_TXD,	8,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_10,		8,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_11,		8,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, NSPI1_ENA,	8,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, I2C1_SCL,	8,	0,	0xf,	2,	false)
> -	MUX_CFG(DA830, I2C1_SDA,	8,	4,	0xf,	2,	false)
> -	MUX_CFG(DA830, EQEP1S,		8,	8,	0xf,	2,	false)
> -	MUX_CFG(DA830, I2C0_SDA,	8,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, I2C0_SCL,	8,	16,	0xf,	2,	false)
> -	MUX_CFG(DA830, UART2_RXD,	8,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, TM64P0_IN12,	8,	12,	0xf,	4,	false)
> -	MUX_CFG(DA830, TM64P0_OUT12,	8,	16,	0xf,	4,	false)
> -	MUX_CFG(DA830, GPIO5_5,		8,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_6,		8,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_7,		8,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_8,		8,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_9,		8,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_10,	8,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_11,	8,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO5_12,	8,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, NSPI1_SCS_0,	9,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, USB0_DRVVBUS,	9,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, AHCLKX0,		9,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, ACLKX0,		9,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, AFSX0,		9,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, AHCLKR0,		9,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, ACLKR0,		9,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, AFSR0,		9,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, UART2_TXD,	9,	0,	0xf,	2,	false)
> -	MUX_CFG(DA830, AHCLKX2,		9,	8,	0xf,	2,	false)
> -	MUX_CFG(DA830, ECAP0_APWM0,	9,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, RMII_MHZ_50_CLK,	9,	20,	0xf,	2,	false)
> -	MUX_CFG(DA830, ECAP1_APWM1,	9,	24,	0xf,	2,	false)
> -	MUX_CFG(DA830, USB_REFCLKIN,	9,	8,	0xf,	4,	false)
> -	MUX_CFG(DA830, GPIO5_13,	9,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_15,	9,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_11,	9,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_12,	9,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_13,	9,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_14,	9,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_15,	9,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_12,	9,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, AMUTE0,		10,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR0_0,		10,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR0_1,		10,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR0_2,		10,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR0_3,		10,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR0_4,		10,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR0_5,		10,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR0_6,		10,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, RMII_TXD_0,	10,	4,	0xf,	2,	false)
> -	MUX_CFG(DA830, RMII_TXD_1,	10,	8,	0xf,	2,	false)
> -	MUX_CFG(DA830, RMII_TXEN,	10,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, RMII_CRS_DV,	10,	16,	0xf,	2,	false)
> -	MUX_CFG(DA830, RMII_RXD_0,	10,	20,	0xf,	2,	false)
> -	MUX_CFG(DA830, RMII_RXD_1,	10,	24,	0xf,	2,	false)
> -	MUX_CFG(DA830, RMII_RXER,	10,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, AFSR2,		10,	4,	0xf,	4,	false)
> -	MUX_CFG(DA830, ACLKX2,		10,	8,	0xf,	4,	false)
> -	MUX_CFG(DA830, AXR2_3,		10,	12,	0xf,	4,	false)
> -	MUX_CFG(DA830, AXR2_2,		10,	16,	0xf,	4,	false)
> -	MUX_CFG(DA830, AXR2_1,		10,	20,	0xf,	4,	false)
> -	MUX_CFG(DA830, AFSX2,		10,	24,	0xf,	4,	false)
> -	MUX_CFG(DA830, ACLKR2,		10,	28,	0xf,	4,	false)
> -	MUX_CFG(DA830, NRESETOUT,	10,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_0,		10,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_1,		10,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_2,		10,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_3,		10,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_4,		10,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_5,		10,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_6,		10,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, AXR0_7,		11,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR0_8,		11,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, UART1_RXD,	11,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, UART1_TXD,	11,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR0_11,		11,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, AHCLKX1,		11,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, ACLKX1,		11,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, AFSX1,		11,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, MDIO_CLK,	11,	0,	0xf,	2,	false)
> -	MUX_CFG(DA830, MDIO_D,		11,	4,	0xf,	2,	false)
> -	MUX_CFG(DA830, AXR0_9,		11,	8,	0xf,	2,	false)
> -	MUX_CFG(DA830, AXR0_10,		11,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, EPWM0B,		11,	20,	0xf,	2,	false)
> -	MUX_CFG(DA830, EPWM0A,		11,	24,	0xf,	2,	false)
> -	MUX_CFG(DA830, EPWMSYNCI,	11,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, AXR2_0,		11,	16,	0xf,	4,	false)
> -	MUX_CFG(DA830, EPWMSYNC0,	11,	28,	0xf,	4,	false)
> -	MUX_CFG(DA830, GPIO3_7,		11,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_8,		11,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_9,		11,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_10,	11,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_11,	11,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_14,	11,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO3_15,	11,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_10,	11,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, AHCLKR1,		12,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, ACLKR1,		12,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, AFSR1,		12,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, AMUTE1,		12,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_0,		12,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_1,		12,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_2,		12,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_3,		12,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, ECAP2_APWM2,	12,	4,	0xf,	2,	false)
> -	MUX_CFG(DA830, EHRPWMGLUETZ,	12,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, EQEP1A,		12,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, GPIO4_11,	12,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_12,	12,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_13,	12,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_14,	12,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_0,		12,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_1,		12,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_2,		12,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_3,		12,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, AXR1_4,		13,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_5,		13,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_6,		13,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_7,		13,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_8,		13,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, AXR1_9,		13,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_0,		13,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_1,		13,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, EQEP1B,		13,	0,	0xf,	2,	false)
> -	MUX_CFG(DA830, EPWM2B,		13,	4,	0xf,	2,	false)
> -	MUX_CFG(DA830, EPWM2A,		13,	8,	0xf,	2,	false)
> -	MUX_CFG(DA830, EPWM1B,		13,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, EPWM1A,		13,	16,	0xf,	2,	false)
> -	MUX_CFG(DA830, MMCSD_DAT_0,	13,	24,	0xf,	2,	false)
> -	MUX_CFG(DA830, MMCSD_DAT_1,	13,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HD_0,	13,	24,	0xf,	4,	false)
> -	MUX_CFG(DA830, UHPI_HD_1,	13,	28,	0xf,	4,	false)
> -	MUX_CFG(DA830, GPIO4_4,		13,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_5,		13,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_6,		13,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_7,		13,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_8,		13,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO4_9,		13,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_0,		13,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_1,		13,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, EMA_D_2,		14,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_3,		14,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_4,		14,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_5,		14,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_6,		14,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_7,		14,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_8,		14,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_9,		14,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, MMCSD_DAT_2,	14,	0,	0xf,	2,	false)
> -	MUX_CFG(DA830, MMCSD_DAT_3,	14,	4,	0xf,	2,	false)
> -	MUX_CFG(DA830, MMCSD_DAT_4,	14,	8,	0xf,	2,	false)
> -	MUX_CFG(DA830, MMCSD_DAT_5,	14,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, MMCSD_DAT_6,	14,	16,	0xf,	2,	false)
> -	MUX_CFG(DA830, MMCSD_DAT_7,	14,	20,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HD_8,	14,	24,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HD_9,	14,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HD_2,	14,	0,	0xf,	4,	false)
> -	MUX_CFG(DA830, UHPI_HD_3,	14,	4,	0xf,	4,	false)
> -	MUX_CFG(DA830, UHPI_HD_4,	14,	8,	0xf,	4,	false)
> -	MUX_CFG(DA830, UHPI_HD_5,	14,	12,	0xf,	4,	false)
> -	MUX_CFG(DA830, UHPI_HD_6,	14,	16,	0xf,	4,	false)
> -	MUX_CFG(DA830, UHPI_HD_7,	14,	20,	0xf,	4,	false)
> -	MUX_CFG(DA830, LCD_D_8,		14,	24,	0xf,	4,	false)
> -	MUX_CFG(DA830, LCD_D_9,		14,	28,	0xf,	4,	false)
> -	MUX_CFG(DA830, GPIO0_2,		14,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_3,		14,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_4,		14,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_5,		14,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_6,		14,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_7,		14,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_8,		14,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_9,		14,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, EMA_D_10,	15,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_11,	15,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_12,	15,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_13,	15,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_14,	15,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_D_15,	15,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_0,		15,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_1,		15,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, UHPI_HD_10,	15,	0,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HD_11,	15,	4,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HD_12,	15,	8,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HD_13,	15,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HD_14,	15,	16,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HD_15,	15,	20,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_D_7,		15,	24,	0xf,	2,	false)
> -	MUX_CFG(DA830, MMCSD_CLK,	15,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_D_10,	15,	0,	0xf,	4,	false)
> -	MUX_CFG(DA830, LCD_D_11,	15,	4,	0xf,	4,	false)
> -	MUX_CFG(DA830, LCD_D_12,	15,	8,	0xf,	4,	false)
> -	MUX_CFG(DA830, LCD_D_13,	15,	12,	0xf,	4,	false)
> -	MUX_CFG(DA830, LCD_D_14,	15,	16,	0xf,	4,	false)
> -	MUX_CFG(DA830, LCD_D_15,	15,	20,	0xf,	4,	false)
> -	MUX_CFG(DA830, UHPI_HCNTL0,	15,	28,	0xf,	4,	false)
> -	MUX_CFG(DA830, GPIO0_10,	15,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_11,	15,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_12,	15,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_13,	15,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_14,	15,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO0_15,	15,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_0,		15,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_1,		15,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, EMA_A_2,		16,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_3,		16,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_4,		16,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_5,		16,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_6,		16,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_7,		16,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_8,		16,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_9,		16,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, MMCSD_CMD,	16,	0,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_D_6,		16,	4,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_D_3,		16,	8,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_D_2,		16,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_D_1,		16,	16,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_D_0,		16,	20,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_PCLK,	16,	24,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_HSYNC,	16,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HCNTL1,	16,	0,	0xf,	4,	false)
> -	MUX_CFG(DA830, GPIO1_2,		16,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_3,		16,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_4,		16,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_5,		16,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_6,		16,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_7,		16,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_8,		16,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_9,		16,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, EMA_A_10,	17,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_11,	17,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_A_12,	17,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_BA_1,	17,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_BA_0,	17,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_CLK,		17,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, EMA_SDCKE,	17,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMA_CAS,	17,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, LCD_VSYNC,	17,	0,	0xf,	2,	false)
> -	MUX_CFG(DA830, NLCD_AC_ENB_CS,	17,	4,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_MCLK,	17,	8,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_D_5,		17,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, LCD_D_4,		17,	16,	0xf,	2,	false)
> -	MUX_CFG(DA830, OBSCLK,		17,	20,	0xf,	2,	false)
> -	MUX_CFG(DA830, NEMA_CS_4,	17,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HHWIL,	17,	12,	0xf,	4,	false)
> -	MUX_CFG(DA830, AHCLKR2,		17,	20,	0xf,	4,	false)
> -	MUX_CFG(DA830, GPIO1_10,	17,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_11,	17,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_12,	17,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_13,	17,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_14,	17,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO1_15,	17,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_0,		17,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_1,		17,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, NEMA_RAS,	18,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMA_WE,		18,	4,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMA_CS_0,	18,	8,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMA_CS_2,	18,	12,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMA_CS_3,	18,	16,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMA_OE,		18,	20,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMA_WE_DQM_1,	18,	24,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMA_WE_DQM_0,	18,	28,	0xf,	1,	false)
> -	MUX_CFG(DA830, NEMA_CS_5,	18,	0,	0xf,	2,	false)
> -	MUX_CFG(DA830, UHPI_HRNW,	18,	4,	0xf,	2,	false)
> -	MUX_CFG(DA830, NUHPI_HAS,	18,	8,	0xf,	2,	false)
> -	MUX_CFG(DA830, NUHPI_HCS,	18,	12,	0xf,	2,	false)
> -	MUX_CFG(DA830, NUHPI_HDS1,	18,	20,	0xf,	2,	false)
> -	MUX_CFG(DA830, NUHPI_HDS2,	18,	24,	0xf,	2,	false)
> -	MUX_CFG(DA830, NUHPI_HINT,	18,	28,	0xf,	2,	false)
> -	MUX_CFG(DA830, AXR0_12,		18,	4,	0xf,	4,	false)
> -	MUX_CFG(DA830, AMUTE2,		18,	16,	0xf,	4,	false)
> -	MUX_CFG(DA830, AXR0_13,		18,	20,	0xf,	4,	false)
> -	MUX_CFG(DA830, AXR0_14,		18,	24,	0xf,	4,	false)
> -	MUX_CFG(DA830, AXR0_15,		18,	28,	0xf,	4,	false)
> -	MUX_CFG(DA830, GPIO2_2,		18,	0,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_3,		18,	4,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_4,		18,	8,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_5,		18,	12,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_6,		18,	16,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_7,		18,	20,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_8,		18,	24,	0xf,	8,	false)
> -	MUX_CFG(DA830, GPIO2_9,		18,	28,	0xf,	8,	false)
> -	MUX_CFG(DA830, EMA_WAIT_0,	19,	0,	0xf,	1,	false)
> -	MUX_CFG(DA830, NUHPI_HRDY,	19,	0,	0xf,	2,	false)
> -	MUX_CFG(DA830, GPIO2_10,	19,	0,	0xf,	8,	false)
> -#endif
> -};
> -
> -static struct map_desc da830_io_desc[] = {
> -	{
> -		.virtual	= IO_VIRT,
> -		.pfn		= __phys_to_pfn(IO_PHYS),
> -		.length		= IO_SIZE,
> -		.type		= MT_DEVICE
> -	},
> -	{
> -		.virtual	= DA8XX_CP_INTC_VIRT,
> -		.pfn		= __phys_to_pfn(DA8XX_CP_INTC_BASE),
> -		.length		= DA8XX_CP_INTC_SIZE,
> -		.type		= MT_DEVICE
> -	},
> -};
> -
> -/* Contents of JTAG ID register used to identify exact cpu type */
> -static struct davinci_id da830_ids[] = {
> -	{
> -		.variant	= 0x0,
> -		.part_no	= 0xb7df,
> -		.manufacturer	= 0x017,	/* 0x02f >> 1 */
> -		.cpu_id		= DAVINCI_CPU_ID_DA830,
> -		.name		= "da830/omap-l137 rev1.0",
> -	},
> -	{
> -		.variant	= 0x8,
> -		.part_no	= 0xb7df,
> -		.manufacturer	= 0x017,
> -		.cpu_id		= DAVINCI_CPU_ID_DA830,
> -		.name		= "da830/omap-l137 rev1.1",
> -	},
> -	{
> -		.variant	= 0x9,
> -		.part_no	= 0xb7df,
> -		.manufacturer	= 0x017,
> -		.cpu_id		= DAVINCI_CPU_ID_DA830,
> -		.name		= "da830/omap-l137 rev2.0",
> -	},
> -};
> -
> -static const struct davinci_soc_info davinci_soc_info_da830 = {
> -	.io_desc		= da830_io_desc,
> -	.io_desc_num		= ARRAY_SIZE(da830_io_desc),
> -	.jtag_id_reg		= DA8XX_SYSCFG0_BASE + DA8XX_JTAG_ID_REG,
> -	.ids			= da830_ids,
> -	.ids_num		= ARRAY_SIZE(da830_ids),
> -	.pinmux_base		= DA8XX_SYSCFG0_BASE + 0x120,
> -	.pinmux_pins		= da830_pins,
> -	.pinmux_pins_num	= ARRAY_SIZE(da830_pins),
> -};
> -
> -void __init da830_init(void)
> -{
> -	davinci_common_init(&davinci_soc_info_da830);
> -
> -	da8xx_syscfg0_base = ioremap(DA8XX_SYSCFG0_BASE, SZ_4K);
> -	WARN(!da8xx_syscfg0_base, "Unable to map syscfg0 module");
> -}
> diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
> index 287dd987908e..706f8241b5e7 100644
> --- a/arch/arm/mach-davinci/da850.c
> +++ b/arch/arm/mach-davinci/da850.c
> @@ -4,7 +4,6 @@
>   *
>   * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
>   *
> - * Derived from: arch/arm/mach-davinci/da830.c
>   * Original Copyrights follow:
>   *
>   * 2009 (c) MontaVista Software, Inc.
> diff --git a/arch/arm/mach-davinci/da8xx.h b/arch/arm/mach-davinci/da8xx.h
> index 54a255b8d8d8..70d14f7f3520 100644
> --- a/arch/arm/mach-davinci/da8xx.h
> +++ b/arch/arm/mach-davinci/da8xx.h
> @@ -68,8 +68,6 @@ extern void __iomem *da8xx_syscfg1_base;
>  #define DA8XX_SHARED_RAM_BASE	0x80000000
>  #define DA8XX_ARM_RAM_BASE	0xffff0000
>  
> -void da830_init(void);
> -
>  void da850_init(void);
>  
>  int da850_register_vpif_display
> diff --git a/arch/arm/mach-davinci/devices-da8xx.c b/arch/arm/mach-davinci/devices-da8xx.c
> index 5e73a725d5da..4e9ac55ae92d 100644
> --- a/arch/arm/mach-davinci/devices-da8xx.c
> +++ b/arch/arm/mach-davinci/devices-da8xx.c
> @@ -33,7 +33,6 @@
>  #define DA8XX_PRUSS_MEM_BASE		0x01c30000
>  #define DA8XX_MMCSD0_BASE		0x01c40000
>  #define DA8XX_SPI0_BASE			0x01c41000
> -#define DA830_SPI1_BASE			0x01e12000
>  #define DA8XX_LCD_CNTRL_BASE		0x01e13000
>  #define DA850_SATA_BASE			0x01e18000
>  #define DA850_MMCSD1_BASE		0x01e1b000
> diff --git a/arch/arm/mach-davinci/irqs.h b/arch/arm/mach-davinci/irqs.h
> index b1ceed81e9fa..23e8da5025ab 100644
> --- a/arch/arm/mach-davinci/irqs.h
> +++ b/arch/arm/mach-davinci/irqs.h
> @@ -101,33 +101,6 @@
>  #define IRQ_DA8XX_ECAP2			71
>  #define IRQ_DA8XX_ARMCLKSTOPREQ		90
>  
> -/* DA830 specific interrupts */
> -#define IRQ_DA830_MPUERR		27
> -#define IRQ_DA830_IOPUERR		27
> -#define IRQ_DA830_BOOTCFGERR		27
> -#define IRQ_DA830_EHRPWM2		67
> -#define IRQ_DA830_EHRPWM2TZ		68
> -#define IRQ_DA830_EQEP0			72
> -#define IRQ_DA830_EQEP1			73
> -#define IRQ_DA830_T12CMPINT0_0		74
> -#define IRQ_DA830_T12CMPINT1_0		75
> -#define IRQ_DA830_T12CMPINT2_0		76
> -#define IRQ_DA830_T12CMPINT3_0		77
> -#define IRQ_DA830_T12CMPINT4_0		78
> -#define IRQ_DA830_T12CMPINT5_0		79
> -#define IRQ_DA830_T12CMPINT6_0		80
> -#define IRQ_DA830_T12CMPINT7_0		81
> -#define IRQ_DA830_T12CMPINT0_1		82
> -#define IRQ_DA830_T12CMPINT1_1		83
> -#define IRQ_DA830_T12CMPINT2_1		84
> -#define IRQ_DA830_T12CMPINT3_1		85
> -#define IRQ_DA830_T12CMPINT4_1		86
> -#define IRQ_DA830_T12CMPINT5_1		87
> -#define IRQ_DA830_T12CMPINT6_1		88
> -#define IRQ_DA830_T12CMPINT7_1		89
> -
> -#define DA830_N_CP_INTC_IRQ		96
> -
>  /* DA850 speicific interrupts */
>  #define IRQ_DA850_MPUADDRERR0		27
>  #define IRQ_DA850_MPUPROTERR0		27
> diff --git a/arch/arm/mach-davinci/mux.h b/arch/arm/mach-davinci/mux.h
> index 05fd3902df65..6325ea5a2730 100644
> --- a/arch/arm/mach-davinci/mux.h
> +++ b/arch/arm/mach-davinci/mux.h
> @@ -21,410 +21,6 @@ struct mux_config {
>  	bool debug;
>  };
>  
> -enum da830_index {
> -	DA830_GPIO7_14,
> -	DA830_RTCK,
> -	DA830_GPIO7_15,
> -	DA830_EMU_0,
> -	DA830_EMB_SDCKE,
> -	DA830_EMB_CLK_GLUE,
> -	DA830_EMB_CLK,
> -	DA830_NEMB_CS_0,
> -	DA830_NEMB_CAS,
> -	DA830_NEMB_RAS,
> -	DA830_NEMB_WE,
> -	DA830_EMB_BA_1,
> -	DA830_EMB_BA_0,
> -	DA830_EMB_A_0,
> -	DA830_EMB_A_1,
> -	DA830_EMB_A_2,
> -	DA830_EMB_A_3,
> -	DA830_EMB_A_4,
> -	DA830_EMB_A_5,
> -	DA830_GPIO7_0,
> -	DA830_GPIO7_1,
> -	DA830_GPIO7_2,
> -	DA830_GPIO7_3,
> -	DA830_GPIO7_4,
> -	DA830_GPIO7_5,
> -	DA830_GPIO7_6,
> -	DA830_GPIO7_7,
> -	DA830_EMB_A_6,
> -	DA830_EMB_A_7,
> -	DA830_EMB_A_8,
> -	DA830_EMB_A_9,
> -	DA830_EMB_A_10,
> -	DA830_EMB_A_11,
> -	DA830_EMB_A_12,
> -	DA830_EMB_D_31,
> -	DA830_GPIO7_8,
> -	DA830_GPIO7_9,
> -	DA830_GPIO7_10,
> -	DA830_GPIO7_11,
> -	DA830_GPIO7_12,
> -	DA830_GPIO7_13,
> -	DA830_GPIO3_13,
> -	DA830_EMB_D_30,
> -	DA830_EMB_D_29,
> -	DA830_EMB_D_28,
> -	DA830_EMB_D_27,
> -	DA830_EMB_D_26,
> -	DA830_EMB_D_25,
> -	DA830_EMB_D_24,
> -	DA830_EMB_D_23,
> -	DA830_EMB_D_22,
> -	DA830_EMB_D_21,
> -	DA830_EMB_D_20,
> -	DA830_EMB_D_19,
> -	DA830_EMB_D_18,
> -	DA830_EMB_D_17,
> -	DA830_EMB_D_16,
> -	DA830_NEMB_WE_DQM_3,
> -	DA830_NEMB_WE_DQM_2,
> -	DA830_EMB_D_0,
> -	DA830_EMB_D_1,
> -	DA830_EMB_D_2,
> -	DA830_EMB_D_3,
> -	DA830_EMB_D_4,
> -	DA830_EMB_D_5,
> -	DA830_EMB_D_6,
> -	DA830_GPIO6_0,
> -	DA830_GPIO6_1,
> -	DA830_GPIO6_2,
> -	DA830_GPIO6_3,
> -	DA830_GPIO6_4,
> -	DA830_GPIO6_5,
> -	DA830_GPIO6_6,
> -	DA830_EMB_D_7,
> -	DA830_EMB_D_8,
> -	DA830_EMB_D_9,
> -	DA830_EMB_D_10,
> -	DA830_EMB_D_11,
> -	DA830_EMB_D_12,
> -	DA830_EMB_D_13,
> -	DA830_EMB_D_14,
> -	DA830_GPIO6_7,
> -	DA830_GPIO6_8,
> -	DA830_GPIO6_9,
> -	DA830_GPIO6_10,
> -	DA830_GPIO6_11,
> -	DA830_GPIO6_12,
> -	DA830_GPIO6_13,
> -	DA830_GPIO6_14,
> -	DA830_EMB_D_15,
> -	DA830_NEMB_WE_DQM_1,
> -	DA830_NEMB_WE_DQM_0,
> -	DA830_SPI0_SOMI_0,
> -	DA830_SPI0_SIMO_0,
> -	DA830_SPI0_CLK,
> -	DA830_NSPI0_ENA,
> -	DA830_NSPI0_SCS_0,
> -	DA830_EQEP0I,
> -	DA830_EQEP0S,
> -	DA830_EQEP1I,
> -	DA830_NUART0_CTS,
> -	DA830_NUART0_RTS,
> -	DA830_EQEP0A,
> -	DA830_EQEP0B,
> -	DA830_GPIO6_15,
> -	DA830_GPIO5_14,
> -	DA830_GPIO5_15,
> -	DA830_GPIO5_0,
> -	DA830_GPIO5_1,
> -	DA830_GPIO5_2,
> -	DA830_GPIO5_3,
> -	DA830_GPIO5_4,
> -	DA830_SPI1_SOMI_0,
> -	DA830_SPI1_SIMO_0,
> -	DA830_SPI1_CLK,
> -	DA830_UART0_RXD,
> -	DA830_UART0_TXD,
> -	DA830_AXR1_10,
> -	DA830_AXR1_11,
> -	DA830_NSPI1_ENA,
> -	DA830_I2C1_SCL,
> -	DA830_I2C1_SDA,
> -	DA830_EQEP1S,
> -	DA830_I2C0_SDA,
> -	DA830_I2C0_SCL,
> -	DA830_UART2_RXD,
> -	DA830_TM64P0_IN12,
> -	DA830_TM64P0_OUT12,
> -	DA830_GPIO5_5,
> -	DA830_GPIO5_6,
> -	DA830_GPIO5_7,
> -	DA830_GPIO5_8,
> -	DA830_GPIO5_9,
> -	DA830_GPIO5_10,
> -	DA830_GPIO5_11,
> -	DA830_GPIO5_12,
> -	DA830_NSPI1_SCS_0,
> -	DA830_USB0_DRVVBUS,
> -	DA830_AHCLKX0,
> -	DA830_ACLKX0,
> -	DA830_AFSX0,
> -	DA830_AHCLKR0,
> -	DA830_ACLKR0,
> -	DA830_AFSR0,
> -	DA830_UART2_TXD,
> -	DA830_AHCLKX2,
> -	DA830_ECAP0_APWM0,
> -	DA830_RMII_MHZ_50_CLK,
> -	DA830_ECAP1_APWM1,
> -	DA830_USB_REFCLKIN,
> -	DA830_GPIO5_13,
> -	DA830_GPIO4_15,
> -	DA830_GPIO2_11,
> -	DA830_GPIO2_12,
> -	DA830_GPIO2_13,
> -	DA830_GPIO2_14,
> -	DA830_GPIO2_15,
> -	DA830_GPIO3_12,
> -	DA830_AMUTE0,
> -	DA830_AXR0_0,
> -	DA830_AXR0_1,
> -	DA830_AXR0_2,
> -	DA830_AXR0_3,
> -	DA830_AXR0_4,
> -	DA830_AXR0_5,
> -	DA830_AXR0_6,
> -	DA830_RMII_TXD_0,
> -	DA830_RMII_TXD_1,
> -	DA830_RMII_TXEN,
> -	DA830_RMII_CRS_DV,
> -	DA830_RMII_RXD_0,
> -	DA830_RMII_RXD_1,
> -	DA830_RMII_RXER,
> -	DA830_AFSR2,
> -	DA830_ACLKX2,
> -	DA830_AXR2_3,
> -	DA830_AXR2_2,
> -	DA830_AXR2_1,
> -	DA830_AFSX2,
> -	DA830_ACLKR2,
> -	DA830_NRESETOUT,
> -	DA830_GPIO3_0,
> -	DA830_GPIO3_1,
> -	DA830_GPIO3_2,
> -	DA830_GPIO3_3,
> -	DA830_GPIO3_4,
> -	DA830_GPIO3_5,
> -	DA830_GPIO3_6,
> -	DA830_AXR0_7,
> -	DA830_AXR0_8,
> -	DA830_UART1_RXD,
> -	DA830_UART1_TXD,
> -	DA830_AXR0_11,
> -	DA830_AHCLKX1,
> -	DA830_ACLKX1,
> -	DA830_AFSX1,
> -	DA830_MDIO_CLK,
> -	DA830_MDIO_D,
> -	DA830_AXR0_9,
> -	DA830_AXR0_10,
> -	DA830_EPWM0B,
> -	DA830_EPWM0A,
> -	DA830_EPWMSYNCI,
> -	DA830_AXR2_0,
> -	DA830_EPWMSYNC0,
> -	DA830_GPIO3_7,
> -	DA830_GPIO3_8,
> -	DA830_GPIO3_9,
> -	DA830_GPIO3_10,
> -	DA830_GPIO3_11,
> -	DA830_GPIO3_14,
> -	DA830_GPIO3_15,
> -	DA830_GPIO4_10,
> -	DA830_AHCLKR1,
> -	DA830_ACLKR1,
> -	DA830_AFSR1,
> -	DA830_AMUTE1,
> -	DA830_AXR1_0,
> -	DA830_AXR1_1,
> -	DA830_AXR1_2,
> -	DA830_AXR1_3,
> -	DA830_ECAP2_APWM2,
> -	DA830_EHRPWMGLUETZ,
> -	DA830_EQEP1A,
> -	DA830_GPIO4_11,
> -	DA830_GPIO4_12,
> -	DA830_GPIO4_13,
> -	DA830_GPIO4_14,
> -	DA830_GPIO4_0,
> -	DA830_GPIO4_1,
> -	DA830_GPIO4_2,
> -	DA830_GPIO4_3,
> -	DA830_AXR1_4,
> -	DA830_AXR1_5,
> -	DA830_AXR1_6,
> -	DA830_AXR1_7,
> -	DA830_AXR1_8,
> -	DA830_AXR1_9,
> -	DA830_EMA_D_0,
> -	DA830_EMA_D_1,
> -	DA830_EQEP1B,
> -	DA830_EPWM2B,
> -	DA830_EPWM2A,
> -	DA830_EPWM1B,
> -	DA830_EPWM1A,
> -	DA830_MMCSD_DAT_0,
> -	DA830_MMCSD_DAT_1,
> -	DA830_UHPI_HD_0,
> -	DA830_UHPI_HD_1,
> -	DA830_GPIO4_4,
> -	DA830_GPIO4_5,
> -	DA830_GPIO4_6,
> -	DA830_GPIO4_7,
> -	DA830_GPIO4_8,
> -	DA830_GPIO4_9,
> -	DA830_GPIO0_0,
> -	DA830_GPIO0_1,
> -	DA830_EMA_D_2,
> -	DA830_EMA_D_3,
> -	DA830_EMA_D_4,
> -	DA830_EMA_D_5,
> -	DA830_EMA_D_6,
> -	DA830_EMA_D_7,
> -	DA830_EMA_D_8,
> -	DA830_EMA_D_9,
> -	DA830_MMCSD_DAT_2,
> -	DA830_MMCSD_DAT_3,
> -	DA830_MMCSD_DAT_4,
> -	DA830_MMCSD_DAT_5,
> -	DA830_MMCSD_DAT_6,
> -	DA830_MMCSD_DAT_7,
> -	DA830_UHPI_HD_8,
> -	DA830_UHPI_HD_9,
> -	DA830_UHPI_HD_2,
> -	DA830_UHPI_HD_3,
> -	DA830_UHPI_HD_4,
> -	DA830_UHPI_HD_5,
> -	DA830_UHPI_HD_6,
> -	DA830_UHPI_HD_7,
> -	DA830_LCD_D_8,
> -	DA830_LCD_D_9,
> -	DA830_GPIO0_2,
> -	DA830_GPIO0_3,
> -	DA830_GPIO0_4,
> -	DA830_GPIO0_5,
> -	DA830_GPIO0_6,
> -	DA830_GPIO0_7,
> -	DA830_GPIO0_8,
> -	DA830_GPIO0_9,
> -	DA830_EMA_D_10,
> -	DA830_EMA_D_11,
> -	DA830_EMA_D_12,
> -	DA830_EMA_D_13,
> -	DA830_EMA_D_14,
> -	DA830_EMA_D_15,
> -	DA830_EMA_A_0,
> -	DA830_EMA_A_1,
> -	DA830_UHPI_HD_10,
> -	DA830_UHPI_HD_11,
> -	DA830_UHPI_HD_12,
> -	DA830_UHPI_HD_13,
> -	DA830_UHPI_HD_14,
> -	DA830_UHPI_HD_15,
> -	DA830_LCD_D_7,
> -	DA830_MMCSD_CLK,
> -	DA830_LCD_D_10,
> -	DA830_LCD_D_11,
> -	DA830_LCD_D_12,
> -	DA830_LCD_D_13,
> -	DA830_LCD_D_14,
> -	DA830_LCD_D_15,
> -	DA830_UHPI_HCNTL0,
> -	DA830_GPIO0_10,
> -	DA830_GPIO0_11,
> -	DA830_GPIO0_12,
> -	DA830_GPIO0_13,
> -	DA830_GPIO0_14,
> -	DA830_GPIO0_15,
> -	DA830_GPIO1_0,
> -	DA830_GPIO1_1,
> -	DA830_EMA_A_2,
> -	DA830_EMA_A_3,
> -	DA830_EMA_A_4,
> -	DA830_EMA_A_5,
> -	DA830_EMA_A_6,
> -	DA830_EMA_A_7,
> -	DA830_EMA_A_8,
> -	DA830_EMA_A_9,
> -	DA830_MMCSD_CMD,
> -	DA830_LCD_D_6,
> -	DA830_LCD_D_3,
> -	DA830_LCD_D_2,
> -	DA830_LCD_D_1,
> -	DA830_LCD_D_0,
> -	DA830_LCD_PCLK,
> -	DA830_LCD_HSYNC,
> -	DA830_UHPI_HCNTL1,
> -	DA830_GPIO1_2,
> -	DA830_GPIO1_3,
> -	DA830_GPIO1_4,
> -	DA830_GPIO1_5,
> -	DA830_GPIO1_6,
> -	DA830_GPIO1_7,
> -	DA830_GPIO1_8,
> -	DA830_GPIO1_9,
> -	DA830_EMA_A_10,
> -	DA830_EMA_A_11,
> -	DA830_EMA_A_12,
> -	DA830_EMA_BA_1,
> -	DA830_EMA_BA_0,
> -	DA830_EMA_CLK,
> -	DA830_EMA_SDCKE,
> -	DA830_NEMA_CAS,
> -	DA830_LCD_VSYNC,
> -	DA830_NLCD_AC_ENB_CS,
> -	DA830_LCD_MCLK,
> -	DA830_LCD_D_5,
> -	DA830_LCD_D_4,
> -	DA830_OBSCLK,
> -	DA830_NEMA_CS_4,
> -	DA830_UHPI_HHWIL,
> -	DA830_AHCLKR2,
> -	DA830_GPIO1_10,
> -	DA830_GPIO1_11,
> -	DA830_GPIO1_12,
> -	DA830_GPIO1_13,
> -	DA830_GPIO1_14,
> -	DA830_GPIO1_15,
> -	DA830_GPIO2_0,
> -	DA830_GPIO2_1,
> -	DA830_NEMA_RAS,
> -	DA830_NEMA_WE,
> -	DA830_NEMA_CS_0,
> -	DA830_NEMA_CS_2,
> -	DA830_NEMA_CS_3,
> -	DA830_NEMA_OE,
> -	DA830_NEMA_WE_DQM_1,
> -	DA830_NEMA_WE_DQM_0,
> -	DA830_NEMA_CS_5,
> -	DA830_UHPI_HRNW,
> -	DA830_NUHPI_HAS,
> -	DA830_NUHPI_HCS,
> -	DA830_NUHPI_HDS1,
> -	DA830_NUHPI_HDS2,
> -	DA830_NUHPI_HINT,
> -	DA830_AXR0_12,
> -	DA830_AMUTE2,
> -	DA830_AXR0_13,
> -	DA830_AXR0_14,
> -	DA830_AXR0_15,
> -	DA830_GPIO2_2,
> -	DA830_GPIO2_3,
> -	DA830_GPIO2_4,
> -	DA830_GPIO2_5,
> -	DA830_GPIO2_6,
> -	DA830_GPIO2_7,
> -	DA830_GPIO2_8,
> -	DA830_GPIO2_9,
> -	DA830_EMA_WAIT_0,
> -	DA830_NUHPI_HRDY,
> -	DA830_GPIO2_10,
> -};
> -
>  enum davinci_da850_index {
>  	/* UART0 function */
>  	DA850_NUART0_CTS,
> diff --git a/arch/arm/mach-davinci/psc.h b/arch/arm/mach-davinci/psc.h
> index acfef063295f..6c365a2e87fe 100644
> --- a/arch/arm/mach-davinci/psc.h
> +++ b/arch/arm/mach-davinci/psc.h
> @@ -97,9 +97,7 @@
>  #define DA8XX_LPSC1_CPGMAC		5
>  #define DA8XX_LPSC1_EMIF3C		6
>  #define DA8XX_LPSC1_McASP0		7
> -#define DA830_LPSC1_McASP1		8
>  #define DA850_LPSC1_SATA		8
> -#define DA830_LPSC1_McASP2		9
>  #define DA850_LPSC1_VPIF		9
>  #define DA8XX_LPSC1_SPI1		10
>  #define DA8XX_LPSC1_I2C			11
> @@ -111,7 +109,6 @@
>  #define DA8XX_LPSC1_PWM			17
>  #define DA850_LPSC1_MMC_SD1		18
>  #define DA8XX_LPSC1_ECAP		20
> -#define DA830_LPSC1_EQEP		21
>  #define DA850_LPSC1_TPTC2		21
>  #define DA8XX_LPSC1_SCR_P0_SS		24
>  #define DA8XX_LPSC1_SCR_P1_SS		25
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250327-davinci-remove-da830-26a560fafe38
>
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
