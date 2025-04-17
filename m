Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44A9252298;
	Thu, 17 Apr 2025 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900259; cv=none; b=JTgoWILl6IvfsxrYgTyUWHLoLv1Yg68oIC7ANr3BiJ4UEk2SkCEEgZqwadnBGY0zF1KSZFEPXxFFkrn/MoB0TqYv/X6Uh08T9InifsMuwwkFUlrEh23ANRKy43nf4nyVmQhnWLc6YNHC/mG7QhEn7OqpgMOSbdx7k85WZQonC9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900259; c=relaxed/simple;
	bh=1ltn3613f7HEMi5ZWjZisneXP6W/zCl1thCIl/3UhVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohT/EwHO2pcM6TE1p3Intixnia//dU0toQpICSv4Zu7OO7lxUfBYCkkcUHwKjsFTJVeRONjJgcg+5ZhepZuTHpuVJljd8Zkxs7i5P/W3W4VtR6AzXDuK3cHoXQqW7YamcFvCMuewHMpQlx2MKKZH635UmQL6d5H0Drj4i7iSb5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=hi4+4DiJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PLcu5gbJ; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="hi4+4DiJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PLcu5gbJ"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A42032540281;
	Thu, 17 Apr 2025 10:30:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 17 Apr 2025 10:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1744900256; x=1744986656; bh=Y9UlWkrYrc
	CSocQlqR1lz6nZLSVUBMh9qLl6PcNgpsI=; b=hi4+4DiJRcQdlfIcSoGdIlTUr4
	r0B3bcJadKJ/Et3IE7kFcQiTBg4ihJX9Q/oAKawJKgJ2FC8TJF4B2YgkNzyVjIhN
	1mUJZ4YQxF9jkoDK1yWTll8KZ22PMVdLy5QuCL5a3duoZ3u0AQ52fWOqOOzVIek+
	MRB6T3pNvr18Kb5tF59a40n4pD3LqSVvrnAf3wTx2My7108l+2dwZHyDdQXJvZZg
	9WF5Vc17M5avo4Eh70Wp7vaq9iCGSUp3As/5FBHetU1MlwnG4Gedpx8Ul/ZJaU57
	FuCHyxw7+afB1jezZLKFjuOLS3+S1+x6qnpRqd1XqtR5ABKGvNsSIJNS+7Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744900256; x=1744986656; bh=Y9UlWkrYrcCSocQlqR1lz6nZLSVUBMh9qLl
	6PcNgpsI=; b=PLcu5gbJoV/5Np/VkgmPz4MSk5drfQ6BMLjlddB6xTEE7wsnR3j
	3AUo6mMQ8wqCKP/3gp42U6yZcgv8bCcoICmRtR6A/Akigvdz1+ZLoTFXunUvXQag
	QnprGD0gbd3xu0D0k5mHkj4W8346Ms9rm7SzLlPNzk/UNkUO7rM6kXAuSoIPUVR/
	Sg+oyS7w9kIBwnhe+9rWGyjcqeeMwo3G6srMTtsQ5kP7oVaetnNtgTLab50esieu
	PcwKEJQonKYptwyWHFwNDDvxQ1Roiw6bT9D47QTV3RAKnEN380pZwtju2kLrwyoF
	3gago81rtLmKSEcdNmjMEP32vc+c3uzBcEg==
X-ME-Sender: <xms:nxABaKR_eXYOIWQS1iJ9lsqAsoSQlwnRP_EQJzRZBBscAGABtFWsyQ>
    <xme:nxABaPzMjsXEVDX9g2qvdTGjNNrXvvrAopE3HbVnYahIeL6TbpRpLGEIDrAtMB_TW
    wCIHBaj5CmJ5A8HwoI>
X-ME-Received: <xmr:nxABaH0HqOEU8oqsbdMp_mENT4UGl1ZhfAU02DhkOMWR_E91wl7O_IPpvlZjfez1sJJDOiCY08IgzIqIw234yvr-0XiEYHh9bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    jeenucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqe
    enucggtffrrghtthgvrhhnpefgvdffveelgedujeeffeehheekheelheefgfejffeftedu
    geethfeuudefheefteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepudefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehsrhhinhhisehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    shhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhrtghpthhtoheprghlhihsshgrsehroh
    hsvghniiifvghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhr
    tghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:nxABaGDqZJ30XV5JbHhh688GI4-8scwlx1lGHRsFhjTomCsCrvb2xg>
    <xmx:nxABaDjPTTvGkctdQcNF_lk7oa8iM0qsD9Gd_FXJfRTG6nrip_0nbQ>
    <xmx:nxABaCon1EDu-8B7H_pzMDyClPXSRTqWk1z7o-UiWwAFlkBCao7x3Q>
    <xmx:nxABaGj62S79UIwKrzAs9ykvSo2pnWv7inU3-BtA7ha2RQj-zjt3PQ>
    <xmx:oBABaDB0oWczrFrZYoUcGcyoenlO7_Z1PVBVb-6U5K3HLW-ZXAkb4Q2i>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Apr 2025 10:30:54 -0400 (EDT)
Date: Thu, 17 Apr 2025 16:30:53 +0200
From: Janne Grunau <j@jannau.net>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
Message-ID: <20250417143053.GD8400@robin.jannau.net>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
 <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>

On Thu, Apr 17, 2025 at 02:34:37PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 15/04/2025 22:52, Sasha Finkelstein via B4 Relay wrote:
> > From: Hector Martin <marcan@marcan.st>
> > 
> > This driver exposes a SPMI device as an NVMEM device.
> > It is intended to be used with e.g. PMUs/PMICs that are used to
> > hold power management configuration, such as used on Apple Silicon
> > Macs.
> > 
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> > ---
> >   MAINTAINERS                |  1 +
> >   drivers/nvmem/Kconfig      | 14 +++++++++++
> >   drivers/nvmem/Makefile     |  2 ++
> >   drivers/nvmem/spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++
> >   4 files changed, 79 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e7b2d0df81b387ba5398957131971588dc7b89dc..63c12f901aed1f3e6de8227d6db34af1bd046fe6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2298,6 +2298,7 @@ F:	drivers/iommu/io-pgtable-dart.c
> >   F:	drivers/irqchip/irq-apple-aic.c
> >   F:	drivers/nvme/host/apple.c
> >   F:	drivers/nvmem/apple-efuses.c
> > +F:	drivers/nvmem/spmi-nvmem.c
> >   F:	drivers/pinctrl/pinctrl-apple-gpio.c
> >   F:	drivers/pwm/pwm-apple.c
> >   F:	drivers/soc/apple/*
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index 8671b7c974b933e147154bb40b5d41b5730518d2..9ec907d8aa6ef7df0ea45cc35e92d8239d2705ee 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -310,6 +310,20 @@ config NVMEM_SNVS_LPGPR
> >   	  This driver can also be built as a module. If so, the module
> >   	  will be called nvmem-snvs-lpgpr.
> >   
> > +config NVMEM_SPMI
> > +	tristate "Generic SPMI NVMEM"
> > +	default ARCH_APPLE
> Why default is set to ARCH_APPLE?
> 
> This will endup with y in arm64 defconfig, means increasing the size of 
> kernel.
> 
> should it be:
> 
> depends on ARCH_APPLE || COMPILE_TEST

I don't think it should depend on ARCH_APPLE. There is nothing
ARCH_APPLE specific in the driver or dt-bindings even apple platforms
are currently only user.

`default m if ARCH_APPLE` might an alternative but in this specific case
the driver which will uses the nvmem cells should just select it. So I
would remove the default.

Janne
