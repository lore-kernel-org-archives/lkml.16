Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F110957;
	Tue, 10 Jun 2025 02:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749522507; cv=none; b=XScjFHAU9ABaXGFsio9GnUfv6F3XbPjkO+1YpYMSxnaEa3JuzAkQdGEd7J8xfbz6+2HJ3rasF6p1vd79JIyTLY4hyVXFawVW0iW+esOgaHpirTdxf/XVMkJV+qo9Z8Jc7yk9DAYj3fRP5qh+32i5zfWtlyoY+Ltf+uEy4y0EHUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749522507; c=relaxed/simple;
	bh=GK9J8C0VA5HJ2j1Xt9TcbtFWo5KlrMTPzf2jI8tU39c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBGjDdJ6WYexDRNBNd0Ilz/kdTA2DPz9Ubph6soPOHMrX/E5zcqzrqKaQ3NpJBLPRAf2W7V1IqSDnFo5ZfRC+eYG3+tiILr+03sJDXFm2FJg5J/i+ir6MW4PuA3rZuANG9PIsW3aZh4Vtc38dKrz0/JjWG5fnDJQxO6Dw36KSwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrDfZen9; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrDfZen9"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d21cecc11fso813992585a.3;
        Mon, 09 Jun 2025 19:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749522503; x=1750127303; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hHVkk904jRd3p8Rs3sg+4bhDmyEClu0AdMZHFrriZZA=;
        b=IrDfZen9k8RXDZBV1PPZSj5C5Wp3ozOdMFnAlpaZAzDnPjBY2SOfUjkniarzrnSjyy
         oUamPX3xcIZKeYP1ziSqfGiPpqnse1wiFMPC0RNChrDgeMq4f/RVqPkPVdAz52uRaClM
         lxeIbB6nL8GVIa9EST8ht0mNCURC2DXoFnRjtrVNF4Ot2pG7XRWdoUYvfpHNVF1kolmv
         VGVbhSd/UQ4Qe1UgONJXxDH5/9tqxVbTs5p6bCopnj1rz1WPzmBAl79f3Ra0Yf87y1+7
         NyQILRleo4V80P6kkH/QHTQtCvJ0jub2asArLdCxaxdZNRBkevp/zsg7E5fzPtNcBQPJ
         9Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749522503; x=1750127303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHVkk904jRd3p8Rs3sg+4bhDmyEClu0AdMZHFrriZZA=;
        b=QrzGzjkicWbrYJsFf1yfLkmcFIRPU4ulX2IzQFNFYC7o+3dhjh4ePTEp4MRRevCLdy
         CcA7Twt3cFhWNrBDSf0kMF6sdB6f2Ka33Dy5zfUZuwwMA1Pp12V5cRyvbde89bQ2l7kP
         W6LU9XyhhdHlrXgDq7KEKb09w07GdTUrv4SCcn1Co0y4DZyjt3a5OL5PFtl4NswFAFk6
         wpmw3HoyvRT1XZcoskhXqu4MLAcQTIUSYqHM7o50WZu+ewzG20sWbeuVMxg/txH/bWaC
         gfY9P0wLenRLn7oukKfNiLhgQAGwsGr8V2pEz4eqRElXwJhux+GiivcYdyNxRQNjyxmm
         QAeA==
X-Forwarded-Encrypted: i=1; AJvYcCUhvvOBCj6ZHTdTv0w0YpuAlMSv+XHacV9XjqB9Ait45Z8uYJ4JJHCFpy7tBANqKFX9WE8dqtNEpfz+XSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUewDtq36URv8gTMW2J8Nvjj2EbrGWBOnq9tkgrS7wDOsC8av
	F7PcFGrGRI8oEZTH74nMWlyZkc92mnufptALoNp2PMXJzgdtqFR3l9tz
X-Gm-Gg: ASbGncucOX/fV/zQrVnecgilTWney42muQHT4Fs5gQtVMk3ufatgrm8FNFg6oObK6P+
	MnhQXUuKOcWWrm3Ur7szRo3uQrFUDc6cSfu0YgadsjWy2c9tc2nHSqjcAgHB80TInLUs4Pi9cOT
	LcXrSQT2Ojxj8sDKRTUs+SdOMPcFm1sbWm3x1d6LTRc6PLGtHBUiNROXJ6EvmwUUcQd7bnav85O
	SkUKqP/xQDbtgIDDJejTmyChycNDjsHmxUTf9ZqVwMJIbNfpq4fxp5inBTaj7dERT5sK9PHEnr0
	E90KEglamOUde9jmpo2kqpE2W8q3r7rju0DHNQ==
X-Google-Smtp-Source: AGHT+IEpLXDyWFpr+QTE1t3BBh1T+C6HjXUfs7iH1u+dmM9n5c1zkotSRoihvMGYroFl6LbrYzLmQw==
X-Received: by 2002:a05:620a:1b8e:b0:7ca:f3ac:9eae with SMTP id af79cd13be357-7d229895a42mr2604428585a.30.1749522503555;
        Mon, 09 Jun 2025 19:28:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a53745esm622860885a.46.2025.06.09.19.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:28:23 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:27:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/4] riscv: dts: sophgo: add reset generator for
 Sophgo CV1800 series SoC
Message-ID: <xyet5vt7nnyx3qtjlcai5zhcpi7vm2dyolpi74ph6jlmeyp2mp@ayqhwsbcblnv>
References: <20250608232214.771855-1-inochiama@gmail.com>
 <20250608232214.771855-4-inochiama@gmail.com>
 <ff7d26c2-47a4-4c39-84a6-f3e554f4009e@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff7d26c2-47a4-4c39-84a6-f3e554f4009e@pigmoral.tech>

On Tue, Jun 10, 2025 at 10:15:29AM +0800, Junhui Liu wrote:
> Hi Inochi,
> 
> On 2025/6/9 07:22, Inochi Amaoto wrote:
> > Add reset generator node for all CV18XX series SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/cv180x.dtsi    |  7 ++
> >   arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
> >   2 files changed, 105 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > index ed06c3609fb2..4c3d16764131 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > @@ -7,6 +7,7 @@
> >   #include <dt-bindings/clock/sophgo,cv1800.h>
> >   #include <dt-bindings/gpio/gpio.h>
> >   #include <dt-bindings/interrupt-controller/irq.h>
> > +#include "cv18xx-reset.h"
> >   / {
> >   	#address-cells = <1>;
> > @@ -24,6 +25,12 @@ soc {
> >   		#size-cells = <1>;
> >   		ranges;
> > +		rst: reset-controller@3003000 {
> > +			compatible = "sophgo,cv1800b-reset";
> > +			reg = <0x3003000 0x1000>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> >   		gpio0: gpio@3020000 {
> >   			compatible = "snps,dw-apb-gpio";
> >   			reg = <0x3020000 0x1000>;
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > new file mode 100644
> > index 000000000000..b9b6dd56a9e2
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
> > +#define RST_AUTOCLEAR_CPUCORE0		256
> > +#define RST_AUTOCLEAR_CPUCORE1		257
> > +#define RST_AUTOCLEAR_CPUCORE2		258
> > +#define RST_AUTOCLEAR_CPUCORE3		259
> > +#define RST_AUTOCLEAR_CPUSYS0		260
> > +#define RST_AUTOCLEAR_CPUSYS1		261
> > +#define RST_AUTOCLEAR_CPUSYS2		262
> > +#define RST_CPUCORE0			268
> 
> 
> Looks like this and the following still doesn't right. Since it’s bit 0
> at offset 0x024, it should be 0x24 * 8 = 0x120 = 288, not 268.
> 

You are right, I add a wrong step.
I will fix this, thanks.

Regards,
Inochi
