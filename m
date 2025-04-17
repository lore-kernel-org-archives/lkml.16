Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3800714A4C7;
	Thu, 17 Apr 2025 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901430; cv=none; b=ZxoSQRq5QGWS/hD1SEmqASFMSplnbTEHbp5j31k6yP7aGw020Urlg+ctLyiNsWx+9iv4ed+MOSudK3DmDOoRTfAMwgO523VDwffldBzc5YOyMjCoPRocfynzIfFX6KTFlCGynroe/6hoSdcwgng34+pLQGkx+cabgi7o7ur3L0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901430; c=relaxed/simple;
	bh=ydLwQu78BFvyikLXpxEaVTRiTBaEQwxwQL+LQghN1WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4s8cmPcXdL9w5fqQRafRWNINm/PMpSXQ/RJ7oDAWH46KRWvzlJtWsROhv++lPbgt5VyJRrIBUD6QMpZlQWI2PO/3OW3BP8utr5w3lMKIR/JDPzBxY4e0Zyo0WWH80X5+1PQSJvAkKfnxw8e0lR0gRlPXQVnj3kTe/TsikYPbVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6rBNo+2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6rBNo+2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8413DC4CEE4;
	Thu, 17 Apr 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744901429;
	bh=ydLwQu78BFvyikLXpxEaVTRiTBaEQwxwQL+LQghN1WU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6rBNo+21GFbSyFtRSgtRLtdRBEHmGBjkySwyyv8xVXSZB9hXmetX8jJGOr/9lcf7
	 G6088TMvGliHy0mpHsB2NS7yIJtrVHg7067cwIlBMaJNLtbxGhqe/vsNKAktU5NMJT
	 TY28aVCpRZrico48wx8Wy8qERIAQ6XCCkfn+1P8knxStX68c4rSfB8DRArvkGVoRzM
	 h4KSd0FMEkEZvY7dX61dEI8XrzL1Hrd8uw2gSZ0HvZbb+26cdbMgNWys25axYOIxci
	 96r1znetQ1aLdxN0U0pK3PEC1y/O2k9D6vBfQ1h649OFj6KGI9OqrjPgI+gjxJ2BHb
	 la2CzQ+I0BqXA==
Date: Thu, 17 Apr 2025 15:50:23 +0100
From: Srinivas Kandagatla <srini@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
Message-ID: <20250417145023.GA34166@srini-hackbase>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
 <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
 <20250417143053.GD8400@robin.jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417143053.GD8400@robin.jannau.net>

On Thu, Apr 17, 2025 at 04:30:53PM +0200, Janne Grunau wrote:
> On Thu, Apr 17, 2025 at 02:34:37PM +0100, Srinivas Kandagatla wrote:
> > 
> > 
> > On 15/04/2025 22:52, Sasha Finkelstein via B4 Relay wrote:
> > > From: Hector Martin <marcan@marcan.st>
> > > 
> > > This driver exposes a SPMI device as an NVMEM device.
> > > It is intended to be used with e.g. PMUs/PMICs that are used to
> > > hold power management configuration, such as used on Apple Silicon
> > > Macs.
> > > 
> > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> > > ---
> > >   MAINTAINERS                |  1 +
> > >   drivers/nvmem/Kconfig      | 14 +++++++++++
> > >   drivers/nvmem/Makefile     |  2 ++
> > >   drivers/nvmem/spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++
> > >   4 files changed, 79 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index e7b2d0df81b387ba5398957131971588dc7b89dc..63c12f901aed1f3e6de8227d6db34af1bd046fe6 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -2298,6 +2298,7 @@ F:	drivers/iommu/io-pgtable-dart.c
> > >   F:	drivers/irqchip/irq-apple-aic.c
> > >   F:	drivers/nvme/host/apple.c
> > >   F:	drivers/nvmem/apple-efuses.c
> > > +F:	drivers/nvmem/spmi-nvmem.c
> > >   F:	drivers/pinctrl/pinctrl-apple-gpio.c
> > >   F:	drivers/pwm/pwm-apple.c
> > >   F:	drivers/soc/apple/*
> > > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > > index 8671b7c974b933e147154bb40b5d41b5730518d2..9ec907d8aa6ef7df0ea45cc35e92d8239d2705ee 100644
> > > --- a/drivers/nvmem/Kconfig
> > > +++ b/drivers/nvmem/Kconfig
> > > @@ -310,6 +310,20 @@ config NVMEM_SNVS_LPGPR
> > >   	  This driver can also be built as a module. If so, the module
> > >   	  will be called nvmem-snvs-lpgpr.
> > >   
> > > +config NVMEM_SPMI
> > > +	tristate "Generic SPMI NVMEM"
> > > +	default ARCH_APPLE
> > Why default is set to ARCH_APPLE?
> > 
> > This will endup with y in arm64 defconfig, means increasing the size of 
> > kernel.
> > 
> > should it be:
> > 
> > depends on ARCH_APPLE || COMPILE_TEST
> 
> I don't think it should depend on ARCH_APPLE. There is nothing
> ARCH_APPLE specific in the driver or dt-bindings even apple platforms
> are currently only user.

irrespective of this is generic or not none of the drivers should have
default set to y.


> 
> `default m if ARCH_APPLE` might an alternative but in this specific case
> the driver which will uses the nvmem cells should just select it. So I
> would remove the default.

remove the default, and let it be selected in defconfig as m as
required, like any other drivers.

--srini
> 
> Janne
