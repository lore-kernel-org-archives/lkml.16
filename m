Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6765322370A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828820; cv=none; b=QBiPqACt9vzsGP21i+qWftTe6sTFSq9b5cOprLBGUBLWDGC0OszO8cwaLyEc9YkkqpGrYO8A6VkorL6guQ8DhJNVY66PR3yGmHzR8j1nRdkz3x5v0yKfQ6+D4Vsp3ZvasiTFtMsKSVNG27GZ0wrqdS+izQvzMZlJYUBWbofmqUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828820; c=relaxed/simple;
	bh=I0EC3INMQjYBg9VGIiLtTG4Lcuu/qjJUk/7T+xVwA2c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6DedrR3nqkkG+7BZ3DX7s0k+1N8omtLKxHJJm5Y+Ql0lV369taACabPd5l9K9PoJaZ5A4h/ZJyqY/IkbAjxFOgiT9qz55ciWFUHHGiyLemPcBSIoBUOoPfEwdCtMbQURX2GXj2vvQa2Y6u1hDOiSlfeq/IvSa9W37NFQBfAF7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LD1GMJSQ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LD1GMJSQ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso1043327066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744828815; x=1745433615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hf73Zqm591Z4cwB1QMdZKpjmrpXWTvATJ+WgcmCQVhs=;
        b=LD1GMJSQOrBW+IW3DUebNTOeBoNHlzgNfHC6N+Cy/2/K3acmAfdsvgYhMSVUb2TlVe
         Yk+gUdmx/w/dvO6YltaqRDKqg5FHljjnniE2GorWOmwTLiKVYxj0SVG+NXEpp+JuXkOR
         uOVGcghvdhcGTzCxXN2i0t48Hwwg08Q3ehyBkLhJdfgbzEQzz23z9qTq2NtepnaN7P13
         UpYykxGF+EyY50WwA1Q5Vmf7CoR6Uo8dB7mhZbFjataonD8Bg8fxvMB142n54y6RK5+0
         XTeA/YZbmEfn+3atBwgCnAKmAb7b+veSiNS3H215KE6Yz0R0Nkr+Izd58UCs6N/xNw+3
         fT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744828815; x=1745433615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf73Zqm591Z4cwB1QMdZKpjmrpXWTvATJ+WgcmCQVhs=;
        b=Fr6KDr7ArHScqVoHrx+Hc7Gp60lRKA/RPdqKQOkJNGPexrS3pC0gyuZ12cjPQMHf2a
         aGKZeTIz+woGTblJiFu5ntdaF9EyWV/7QAxF8dZCpp+ofeS+EmnKiklNBOQSa+SMVv0l
         E15RvGgZ4KsNNdIUw27Mh5MqaH5vjwg1dggsj4CELTRdBbe/Mof6G5k+hhir/A5F9gYF
         9R9R8g6V5vrk/xVJX35DqnpSZgVul9G2s/0peyYpqmKO+ysNdRp3BhYARBTW0qeAmODu
         StlSg7k9GP8T5ACNL5S7TKYxg5y4p3jX7wASqtISopBQPi7unupNQWKLRfN7DSUpIaXJ
         8prw==
X-Forwarded-Encrypted: i=1; AJvYcCU8m5ylbF/Z8rjD8HAW9Ped3PnsDf1X5ff6B0S662hkWqondfoUU2k0cBs3UOOUtQosL5fFCJlCOq5IgQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/fntZs5mEUHaeNbKfFVoK3o35N2RtrA77AGGX7rw4EWruc8qA
	CTYLHjdACvUUYqq/q6rHjFUnoYUdUQLr/hd1Zh3E48nxQl7eoiRpeZnF59dHeUw=
X-Gm-Gg: ASbGnct3KY0cIbcD4e+m8gg3o7Sc++5pTcLE8h4/Xhlwz3kCbn5Rlx5jTGRKcJX00AN
	X195YqifslCAP0tmHncmRqV9lGByA8L7wGDvxc2936woTsQhIk38+9QaS6pcBzluTSa47E3S6Un
	QaO1EmqxTkbwAAyKxNKN8H9pjCI8KGp+LgHxCZG+AswDa3BBa0L5fovsYeFm0nDmvVsWPOSjQAQ
	p1X02f12vW2rLf9NErn5HmAGuZzpHms5HGQLiV+nVlQESRQzhJXLhudZJnS4HfJuUjRnrkJP+wn
	MPcdf3MmuZAs0LAMDaT16JIaKA1i/L73zGSfh08FWwbkufPBB1BFKOH/V8uo88zoiEPNeH0=
X-Google-Smtp-Source: AGHT+IHvwwjkQBu7DihmtTvqsvfxr52Defd8zqRFD9EThPH0EkutvTV+muEgyvB55Eg0nTCHnjLeIA==
X-Received: by 2002:a17:906:f5a9:b0:ac2:cf0b:b809 with SMTP id a640c23a62f3a-acb429ed4d2mr324522566b.31.1744828815585;
        Wed, 16 Apr 2025 11:40:15 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d34a5a8sm174672666b.183.2025.04.16.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:40:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 20:41:37 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 11/13] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
Message-ID: <Z__54c628WTjznoG@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <7c26a0b52e00a39930ba02f7552abdd1be4c828c.1742418429.git.andrea.porta@suse.com>
 <45c1a50c-2ecd-4201-85e5-9a0e94f06fa3@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45c1a50c-2ecd-4201-85e5-9a0e94f06fa3@gmx.net>

Hi Stefan,

On 13:55 Mon 14 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> > Add clk_rp1_xosc node to provide that.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> i'm fine with the patch content, but I think this is necessary before
> Patch 9 is applied?

True. Thanks for pointing that out.

Cheers,
Andrea

> > ---
> >   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > index fbc56309660f..1850a575e708 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > @@ -16,6 +16,13 @@ chosen: chosen {
> >   		stdout-path = "serial10:115200n8";
> >   	};
> > 
> > +	clk_rp1_xosc: clock-50000000 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-output-names = "rp1-xosc";
> > +		clock-frequency = <50000000>;
> > +	};
> > +
> >   	/* Will be filled by the bootloader */
> >   	memory@0 {
> >   		device_type = "memory";
> 
