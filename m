Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44786C2E0;
	Fri, 23 May 2025 05:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747979286; cv=none; b=C4XqiaO8kqZ+Zk8I9SGdUx4lPGifeHMo8ANeDQEbwppf8BUbdKXNOifZqrsw6U/IERb+oQxrby3oXW9LCXwWyhPeeEjvYXI1swg2J29+wOK9vlNxaY7M5LvtJD2b8RqJDYwlQJ6ejXnITWa8N4m4KqPx5IL638/mopu6lu06muw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747979286; c=relaxed/simple;
	bh=67PCc2KvQZuBBifJRqh9MvISUwg88lsQLwyEJD+kYwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyF0lvmBR5WfVOVhdiwQD1XdIumFh84GxnmG0dPU49BgV7alxNvPZWU+PWmqWbvK81tg0qOEZ52Rl9O0m+rjSTW84inrV/Lqtm6IReUyZXWg+gdhEzH0RhbQXEMmvvd9pQTUxqjljMJfOwjhvyV3HnrF100iWcXrqBflNh10XFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+NvFlha; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+NvFlha"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c59e7039eeso1316470485a.2;
        Thu, 22 May 2025 22:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747979284; x=1748584084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=caYsdWfqVwz/d2kN5MK7ULtNmcCIM+sT/9v7bBJrmKE=;
        b=K+NvFlhasLwDM/d+ebCvHEBGN8fcQzS0xpLMapHUS/6pFXsyc3hyZdLoaMA01CTopz
         vtMqdZReONn7ykIU+g5Lht5FVuJAFfqqTvfDtoeKTN9wzNQjKgdEGTZx/FffjRKqsVGw
         47nfRk5stIlQjLhwOucgHnsoOZicz6L18cZ9WsqJnI0NrRSmGu8+AxoJMZYCKzPpcUPQ
         TUnWRqzBiQJv6VfqC7UZuAn8pUmDuyf+GefYDBnG9KxMxeFSuTKcsz7mne7a32sqrNnQ
         5vMb6E2luMKTGiVXIVj2a2DTKf0pVdIZniQ2RArrOR3NgJ0zQzo52HLlG0rUbOMJskE8
         BVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747979284; x=1748584084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caYsdWfqVwz/d2kN5MK7ULtNmcCIM+sT/9v7bBJrmKE=;
        b=Bthwq1qtZmiEWeSIfAjkv7j562y1xXYbNt5Z19YOlmSTJKUyvV4sOFWpxIKnLlB8Ko
         w6wW6J/r23cnm+TX3wrZx769jtRiS0XOlPtDmCcMaTizj7fHhbXzitqqiekkkm5QeS1H
         4OqA9yjYfjvk6iu/dh0woukRldX6b4otfGe1KsV+7d2CEUYpOxG/mJTmGm9DSz6/PUph
         EL3XFyQ7DpaP8r8g6yUrHDNwS8eHYho2yT6SKGgaabg9H8sxiJkJcKO+tky52J7p59Fu
         26jM/nuq5Z5rYUP62J14nPHxYI65zqjfj52szceUU59PGuoII+T8N70Gx0ZD48DKwuZS
         JY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfnbIAH0ENk45zQoeh4+9nlB6UEbv11vhQ/teMq4G8o3mTqrQh1HrcFr5akaIKGaBlNRTlL7tddOwPKmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqvGqLhIIAcxegcrxpCY6s1ZSU9zDASPrYTXX72Dlwn34njZaf
	VrpDZfodzRZMG0JgWgB38k+it1WYwypzYumkgajk7eSe25AqywSK3nG6
X-Gm-Gg: ASbGnctlAmaOaqgIJxEvv1PqMKHeFCGNhzpb3OoPUcSRzDcLE3rrQV50e1GS98MJ46w
	4VPaTqDlHy6UEOt/KYt4mrAzlsHcS+DEM83emtZUXupV9SgGsEhByzeOJ3RnySdI/SN898xNLca
	c7bcrEI/MqexlCpP+hAjDr2E9t6bN3LZJODLQxGrHUnDgalq855eZhKXGuPt2XYyCnTLWIVh+GR
	rPEyPcXLWe0xi0yG3E5K0wwpWeU43LkokznkV2qzf8I6SxG8u9HnBZJ/p72U+pTJUwBCsuajIvI
	VHP/CE9+R3GEdCbcXmASnQCB7Nc=
X-Google-Smtp-Source: AGHT+IFq2e9T1OWjT740aexMVA+sf73Duioa1NgYUy32jH1p104IrQgopYSeyPKtQHmouG7DP/siYA==
X-Received: by 2002:a05:620a:410c:b0:7ce:bd97:f879 with SMTP id af79cd13be357-7cebd97f884mr2418187985a.19.1747979284003;
        Thu, 22 May 2025 22:48:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-494ae3f9891sm110032001cf.21.2025.05.22.22.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:48:03 -0700 (PDT)
Date: Fri, 23 May 2025 13:47:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
Message-ID: <7zugafwxrt6jvzv4qr5ipyf7alwyjmuwfj6lfekjfjzbfjl5eg@z5q3mknw4bgo>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-4-inochiama@gmail.com>
 <4750f2c6-221f-4b2e-ab9c-31d707404a4e@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4750f2c6-221f-4b2e-ab9c-31d707404a4e@pigmoral.tech>

On Fri, May 23, 2025 at 01:20:00PM +0800, Junhui Liu wrote:
> Hi Inochi,
> 
> Thanks for your patch. While testing remoteproc with it, I noticed some
> issues that need correction:
> 
> On 2025/2/9 20:29, Inochi Amaoto wrote:
> > Add reset generator node for all CV18XX series SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
> >   arch/riscv/boot/dts/sophgo/cv18xx.dtsi    |  7 ++
> >   2 files changed, 105 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > new file mode 100644
> > index 000000000000..3d9aa9ec7e90
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#ifndef _SOPHGO_CV18XX_RESET
> > +#define _SOPHGO_CV18XX_RESET
> > +
> > +#define RST_DDR				2
> > +#define RST_H264C			3
> > +#define RST_JPEG			4
> > +#define RST_H265C			5
> > +#define RST_VIPSYS			6
> > +#define RST_TDMA			7
> > +#define RST_TPU				8
> > +#define RST_TPUSYS			9
> > +#define RST_USB				11
> > +#define RST_ETH0			12
> > +#define RST_ETH1			13
> > +#define RST_NAND			14
> > +#define RST_EMMC			15
> > +#define RST_SD0				16
> > +#define RST_SDMA			18
> > +#define RST_I2S0			19
> > +#define RST_I2S1			20
> > +#define RST_I2S2			21
> > +#define RST_I2S3			22
> > +#define RST_UART0			23
> > +#define RST_UART1			24
> > +#define RST_UART2			25
> > +#define RST_UART3			26
> > +#define RST_I2C0			27
> > +#define RST_I2C1			28
> > +#define RST_I2C2			29
> > +#define RST_I2C3			30
> > +#define RST_I2C4			31
> > +#define RST_PWM0			32
> > +#define RST_PWM1			33
> > +#define RST_PWM2			34
> > +#define RST_PWM3			35
> > +#define RST_SPI0			40
> > +#define RST_SPI1			41
> > +#define RST_SPI2			42
> > +#define RST_SPI3			43
> > +#define RST_GPIO0			44
> > +#define RST_GPIO1			45
> > +#define RST_GPIO2			46
> > +#define RST_EFUSE			47
> > +#define RST_WDT				48
> > +#define RST_AHB_ROM			49
> > +#define RST_SPIC			50
> > +#define RST_TEMPSEN			51
> > +#define RST_SARADC			52
> > +#define RST_COMBO_PHY0			58
> > +#define RST_SPI_NAND			61
> > +#define RST_SE				62
> > +#define RST_UART4			74
> > +#define RST_GPIO3			75
> > +#define RST_SYSTEM			76
> > +#define RST_TIMER			77
> > +#define RST_TIMER0			78
> > +#define RST_TIMER1			79
> > +#define RST_TIMER2			80
> > +#define RST_TIMER3			81
> > +#define RST_TIMER4			82
> > +#define RST_TIMER5			83
> > +#define RST_TIMER6			84
> > +#define RST_TIMER7			85
> > +#define RST_WGN0			86
> > +#define RST_WGN1			87
> > +#define RST_WGN2			88
> > +#define RST_KEYSCAN			89
> > +#define RST_AUDDAC			91
> > +#define RST_AUDDAC_APB			92
> > +#define RST_AUDADC			93
> > +#define RST_VCSYS			95
> > +#define RST_ETHPHY			96
> > +#define RST_ETHPHY_APB			97
> > +#define RST_AUDSRC			98
> > +#define RST_VIP_CAM0			99
> > +#define RST_WDT1			100
> > +#define RST_WDT2			101
> > +#define RST_AUTOCLEAR_CPUCORE0		128
> 
> 
> I think here should start from 256.
> 
> > +#define RST_AUTOCLEAR_CPUCORE1		129
> > +#define RST_AUTOCLEAR_CPUCORE2		130
> > +#define RST_AUTOCLEAR_CPUCORE3		131
> > +#define RST_AUTOCLEAR_CPUSYS0		132
> > +#define RST_AUTOCLEAR_CPUSYS1		133
> > +#define RST_AUTOCLEAR_CPUSYS2		134
> > +#define RST_CPUCORE0			160
> 
> And here should start from 288.
> 
> > +#define RST_CPUCORE1			161
> > +#define RST_CPUCORE2			162
> > +#define RST_CPUCORE3			163
> > +#define RST_CPUSYS0			164
> > +#define RST_CPUSYS1			165
> > +#define RST_CPUSYS2			166
> > +

You are right, I will update this patch in the next rc1.
Thanks for testing.

Regards,
Inochi
