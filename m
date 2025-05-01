Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568792DC799
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746122853; cv=none; b=OyNYgCA1uUYxUxdIaJ2XZYzefhIPWBzVKrzgkyJznLRK5XvdYH+BrPD/NN3tecBJvfk4I5zCzLbg9IhM58Li4hWktsB/ZJ4fq1TsKb2aPXPBpW4kH1MU8k6z3VSW25JA4MsQeZrgJDFrkFMpCGcxjo6AM1affpBsRjFePkP37Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746122853; c=relaxed/simple;
	bh=cfD/RG1nqonp5HSq706CfKo53addIQONk/XfzDpalKc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AtIZRdVr8Ic7QFx3EZyF17ygQC6+cnyBz59a2cY/2LG7JST1GGNxqfP6pL+4qqaw7+ykOsgKOpBSBQRqBZlMrof4c1F4E5JaJXTPnbTlFOzCbOI2+iYGbG+YRLN8FfJ3Qk6G3qrEBVvddSPf6IldkiTztT3GRffkme0Jvup2lmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IrVvNX/k; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IrVvNX/k"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736b98acaadso1299355b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746122850; x=1746727650; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MA9IB0TgXwBIg6iQoygkPiM8CyTsS1AiD4wjEUMTnE0=;
        b=IrVvNX/k4VMt+S7bQbCytJDnhsymxH1XK3VHRtv7H8gW5sKGX55FdhRAUgAfSummYX
         FHWF3NB9DmKVXD7G3OtZd6rRjGZmqgwYsWJqKBKsT41j2on26wzi0wzAFBRJtIh950Op
         iKEOayquoqF95j8uK/tzzwzIbJkph1Zv+FOitG6oXkXAnBG99sgkU1CE8QHDHuQpcTgG
         Rziee7P456zaSTB06ypoy6fGSBEx+ontv33Nm8VaxRJtx/GG4CEdc+9KkqwoQ2N+roqO
         wIrrk57/1sIgvj6gw9yjunhStRXVb5dYWrMrOrn4uCEhCva6OPwudjyYZ3Fye3R04o58
         t0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746122850; x=1746727650;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MA9IB0TgXwBIg6iQoygkPiM8CyTsS1AiD4wjEUMTnE0=;
        b=FNvU6eLSe/ZzcxzV4u9ttgZTuUZR9Ciwc2KdxJH4ltKUkSqkOTsGiG7svMrsWfamvH
         rm8Z6rWl/zrAKhjvRf+RYKP7kSsZ7u7+d4QrD+JKmY3C44oGL1mjeKTrt8k+FbZIvVUs
         +ij2bJiGBNVjnHvacOHme0UIT+GCDUOuFzHpFC2Ph22y5CYH2kCAlX3+GABLfx7bLnF+
         ojjmjYCJK8uBfZ3JcP4ay2zAopCTzTeOQaFS6YEQL69zrBxzcYkhiIB2wSIlMmp/Xl2K
         48AH8u6SFJ6yKx9Cvugi9h+XRqNGZolktH4gL8Q6+VGXMX4coTNgEal8Q8c/ciRQrMui
         phLg==
X-Forwarded-Encrypted: i=1; AJvYcCVP4xECzAHI1SKHl8JvVl6FgRVE7s2bqGAK0zba70Y1/XFkQd3EJ4tuwOtcRxuI76dsWUunhY/dRDU9xmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcmPm1xkedLzPc3XQQbWoHoFovaVAnpNBLJ9TM/uPBanNFeRkh
	cyHSCC+YF615Wb0qJH4iVyYskVAXyDnz0dQH73baeiiZ4F4NRncSfTDB/3qGRps=
X-Gm-Gg: ASbGncvzbEzQX3N8VpFdo8Ntj+xRT3qs2mDiCz9hhU9TfZlsc6g3hDlQnH3JoCGR6jn
	Oy0MWyZZvIWmUzyheVEVZnmJKgLg4bJLh/zdKbNouhcW8hEu44PYZcWaaL0wYQsE9m/lrgxMTPs
	3EamusiV+b+jiP9DdlxcBkP9BAVpdRr31+Y3KBZbj+A4xKjbJbb3WhpMp7Y/aABwnD9Dt7sqg6o
	LZYVls+0Vr5J8GDj5i64ak1fmRetHDrywmw6vlfl+mAL2BbixfiL211OpwfqGdVjlOqhlRLWrY1
	N3xH5nL8Ehi6+uJCH6a0zuNq1GhUdSWfuei1DbcRbyNiOi1j+Q==
X-Google-Smtp-Source: AGHT+IHP4cHxVsLGhMBQWQI4lFpjX8iI45HyU66E1+y7kzhkuzVfTblbiAA4NX5wfFQPCcaacvAndg==
X-Received: by 2002:a05:6a20:158f:b0:1f5:8a1d:38f3 with SMTP id adf61e73a8af0-20a87642f60mr11619964637.2.1746122850604;
        Thu, 01 May 2025 11:07:30 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f9d642d45sm1025512a12.62.2025.05.01.11.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 11:07:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Parvathi Pudi <parvathi@couthit.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, rogerq@kernel.org, tony@atomide.com
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, nm@ti.com,
 pratheesh@ti.com, prajith@ti.com, vigneshr@ti.com, danishanwar@ti.com,
 praneeth@ti.com, srk@ti.com, rogerq@ti.com, afd@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com,
 parvathi@couthit.com, basharath@couthit.com
Subject: Re: [PATCH v1 1/1] bus: ti-sysc: PRUSS OCP configuration
In-Reply-To: <20250407072134.1044797-2-parvathi@couthit.com>
References: <20250407072134.1044797-1-parvathi@couthit.com>
 <20250407072134.1044797-2-parvathi@couthit.com>
Date: Thu, 01 May 2025 11:07:29 -0700
Message-ID: <7htt64urvi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Parvathi Pudi <parvathi@couthit.com> writes:

> Updates OCP master port configuration to enable memory access outside
> of the PRU-ICSS subsystem.
>
> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit to enable
> the OCP master ports during resume sequence and disables the OCP master
> ports during suspend sequence (applicable only on SoCs using OCP
> interconnect like the OMAP family).
>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> ---
>  drivers/bus/ti-sysc.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index f67b927ae4ca..51caae611acf 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -2036,6 +2036,19 @@ static void sysc_module_disable_quirk_pruss(struct sysc *ddata)
>  	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
>  }
>  
> +static void sysc_module_enable_quirk_pruss(struct sysc *ddata)
> +{
> +	u32 reg;
> +
> +	reg = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
> +	/* Clearing the SYSC_PRUSS_STANDBY_INIT bit - Updates OCP master
> +	 * port configuration to enable memory access outside of the
> +	 * PRU-ICSS subsystem.
> +	 */

minor nit: incorrect multi-line comment style (first /* should be on
line of its own)

But I fixed this up locally before applying.

Kevin
