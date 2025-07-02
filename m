Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D6E243964;
	Wed,  2 Jul 2025 23:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751497787; cv=none; b=Psi7rVl+yeNeMpplOatMxTdWeQowSdut/fQjvM0Q+kGLAL38bDX7ox2CQ+qIaeH8zJR/+WrXwRWzCcNR3Bf0WfzFTh29fY7zBDWMYclGLUeUGJ1PUDuKcadc5HSAB3cqSHddM9PGeVyCD3EllFeNeUSVWgqKVPxEN08zg6Sy2Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751497787; c=relaxed/simple;
	bh=MhO+pwJmoll1p+yzF93yS9d1MkkzU6Tx+rIh+F8aVg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fcs93UT5Rd76tNylGxYUoEs2q4RBRkztJ8fa1V6TQNT58SAzY8mR4Han6JsRb4cBR227ggTprPQv2yeOyC7eahw4R4te1bHMfTQLs2tuYpqWcCTCscyDG5m0eB2UGX1eCvQ0Eofa+T9HFdR5cG/Xi9wpz9sg6CHYJJpA3VANAFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw2E8w9d; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw2E8w9d"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234b440afa7so74810285ad.0;
        Wed, 02 Jul 2025 16:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751497785; x=1752102585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XeivJRV1NlwEM68DYnpxYNj/SFkkK7NrLDkX6W6GBRM=;
        b=hw2E8w9dJnzqHd+Y+vypjVmsCnko1G46gLjMZ9E3NWow3FfDCHs3g/YRYvlKZVWNSj
         BKw12QCGNzSm6lWnY1r5oqWvhJV7tshnaNzIhf4n6yT5Q3ouSdxkdYzGSZ7CoZmA6nEZ
         tqKyFcTKgkVKzZrWJ15G9AGRj5yVSRLXl91h00JY9TLgw621rcZASXdWQ0Ds8qdes5ph
         oxax5xB/B4T7zpRNR+BGlHjOiuqQdlPvATw1kiFKGQLna5T54txE2f2ZiuJWgzsMepm5
         mID6riMT6Z/SkircN7sdjh8Pi450DvcDX+6QhSZkSSLU+rEInJ8meYlcudRbIR/MFNxq
         pvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751497785; x=1752102585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeivJRV1NlwEM68DYnpxYNj/SFkkK7NrLDkX6W6GBRM=;
        b=YhOpJoxKBfs6L1lTgtMOePle0KHZ9qiisfFAF6TnrIdUqlkeTxpD6p2MSlfsiusXCr
         t1SVDwNobG9HyUaCXGVleSKGW+o52EfcuVu1cjTgZ6+FewRuAlCR6R0982bdB9MtGhpA
         FZ1jiwYqIyxNNuPBrwxTa5onzSPmffmTNRU7XtbnMzkxOURXrB4brBFtR7uhrFWePyVo
         AOmn9RbI0KVRx2j0+c4jIkhHVqEJOZlBLywcUDjWT5rKO+5dJQkwI68Wem92dzd2LnWV
         WZPPL0DCambF0vRObZr72go/0+rvYUSdhcsprKyLh6ZKQE/8s2vEGhT/I/tSPV2cb3cf
         x+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa0U/cKqJ1mTfnrjfyBXBRFm5hTpccCMcY+HInfA3/m6BLUcT/kXzBq8hgqU2v/04FfgOoeMV1eMi5@vger.kernel.org, AJvYcCWBMh3ROUwnXeYHc//dvM+FYcNYA5huO+/Siz6EC9Y6sxjmnJrYdek8vJ8W1645GabYNoqEqe7KmDYC7j3u@vger.kernel.org
X-Gm-Message-State: AOJu0YxncNucH1z1bw2MsdPoPCBcwhGC2bCqVcHONGDBH+Zjt8ghkpiT
	MwUAYsBGt731DFIs3RqC22eu6cA0pzn09Y9TE+BQaBqnDoqkx5qPdvne
X-Gm-Gg: ASbGncum0qveftpexNXOFUONvUwTpgHqivnTEhejGlUpOfzT6WMuAQoD7WpFp3ZahgA
	e+y3lOx9PB0HXni1WOWGLXeXYpt9zK1c8layK83zTnJol3NjqKj91fs5u+zGNwx3YQLQbFjl/lU
	AEXAvbJYv3Bi8cpGoaA3HytE7W6+hLrb3FnufZC/jlUfTAVdgNggou3EBrOiJy27D04X1U8HCRX
	4JV6ceDfeGdvvYx4OVF6SoNbBKdUTlBGacpX67UzxA5qQObLAZ6cgYdHeqCy8kJLj5mvkEZzldF
	UpLPZ2TSmYp/AobIk2VgpEXFKGtlvH8vqLAi7LYVaw7n00lUAxBox1yZIziPjARoNF1B0aDg0fn
	QOkU/iVNy3e5AUP9mOCfbBVDH3iJP4SOvlZXd09I=
X-Google-Smtp-Source: AGHT+IEVdT1zTpOAW82Mu/cKqzXbhhazsjZMaKYPAm5vkqC5kKsvAAVyqV0n0+btI2SrjFS8l0lO5Q==
X-Received: by 2002:a17:903:1ac4:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-23c6e593323mr74668905ad.31.1751497785135;
        Wed, 02 Jul 2025 16:09:45 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e244fsm142696605ad.12.2025.07.02.16.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 16:09:44 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:09:42 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>

On Wed, Jul 02, 2025 at 09:40:40AM +0200, Andrew Lunn wrote:
> On Tue, Jul 01, 2025 at 10:04:16PM -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add initial device tree for the Meta (Facebook) Darwin AST2600 BMC.
> > 
> > Darwin is Meta's rack switch platform with an AST2600 BMC integrated for
> > health monitoring purpose.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile             |  1 +
> >  .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 92 +++++++++++++++++++
> >  2 files changed, 93 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> > 
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> > index 2e5f4833a073..debbfc0151f8 100644
> > --- a/arch/arm/boot/dts/aspeed/Makefile
> > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > @@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >  	aspeed-bmc-facebook-bletchley.dtb \
> >  	aspeed-bmc-facebook-catalina.dtb \
> >  	aspeed-bmc-facebook-cmm.dtb \
> > +	aspeed-bmc-facebook-darwin.dtb \
> >  	aspeed-bmc-facebook-elbert.dtb \
> >  	aspeed-bmc-facebook-fuji.dtb \
> >  	aspeed-bmc-facebook-galaxy100.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> > new file mode 100644
> > index 000000000000..f902230dada3
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> > @@ -0,0 +1,92 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +// Copyright (c) 2021 Facebook Inc.
> > +
> > +/dts-v1/;
> > +
> > +#include "ast2600-facebook-netbmc-common.dtsi"
> > +
> > +/ {
> > +	model = "Facebook Darwin BMC";
> > +	compatible = "facebook,darwin-bmc", "aspeed,ast2600";
> > +
> > +	aliases {
> > +		serial0 = &uart5;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = &uart5;
> > +	};
> > +
> > +	iio-hwmon {
> > +		compatible = "iio-hwmon";
> > +		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> > +			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> > +			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> > +			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> > +	};
> > +
> > +	spi_gpio: spi {
> > +		num-chipselects = <1>;
> > +		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
> > +	};
> > +};
> > +
> > +/*
> > + * BMC's "mac3" controller is connected to BCM53134P's IMP_RGMII port
> > + * directly (fixed link, no PHY in between).
> > + * Note: BMC's "mdio0" controller is connected to BCM53134P's MDIO
> > + * interface, and the MDIO channel will be enabled in dts later (when
> > + * "bcm53xx" driver's probe failure is solved on the platform).
> > + */
> > +&mac3 {
> > +	status = "okay";
> > +	phy-mode = "rgmii";
> 
> How do RGMII delays work? Connections to switches have to be handled
> different to PHYs, to avoid double delays. But is there extra long
> clock lines? Or are you expecting the switch to add the delays?
> 
>       Andrew

Hi Andrew,

The delays are introduced in BMC MAC by setting SCU control registers in
u-boot. The delays on the switch side are disabled.

I will add some comments for the delays in v2 (after addressing the dts
schema warnings). Is that okay?


Thanks,

Tao
