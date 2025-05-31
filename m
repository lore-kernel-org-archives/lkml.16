Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE41211460
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748682194; cv=none; b=pAI6uAanuQQav5xDD4uXzogzGtfjtqYddqNrzDnMMvV+ZYJi07+wb6Ot4JcAq+f28FkAzaFZwmVf7JQ3OwXU2Z8BeD+AhOLKxCL3hIcUCJwNwia4TnJR9ijj/WPex/Wp/gP4QLhiIwdho8U2tPYkhbU793MMVKbUHlPHwUH10B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748682194; c=relaxed/simple;
	bh=gRfKPo99FxReVq87mOejFbww2m+Tchc2HeHyofuwyuM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZgGY49PaxkIwNZsMxBJZpsRkfflx7uBuDSWF+GYHj0D+O+tS6pV/nuIEdVlEGPH5Hiis3Db0IPdJz1flW+NeBcarhplwnrBvwkBBI25zwKwwj7tOWYgtrast6zTdIIiLPWbif/bIWhyFzVqu5WyXfqbEEcPG5ODATIYmZElj/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=JBhdNhgf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j8f7sEAe; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="JBhdNhgf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j8f7sEAe"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C5ED11140133;
	Sat, 31 May 2025 05:03:10 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 05:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748682190;
	 x=1748768590; bh=0oMwDLq+Cc90r6I5PN83nBy5IIQ6yNR0ch7EQ/+SVKM=; b=
	JBhdNhgf8/rqlznPjQmw1B1AtFplc1x60MmWpuDszV3M6wWQlL9EKDiTANNFxDlh
	ZSwEQv5LyKrElXYUyhUGJIeXCpYNFYoqsq1T67heTiKt4W3Gq0F2Gr9vrx0TLuNT
	WwNonM+wBLa2MqIdT/++T2MzBNuCApxtFg1EDFuyl3BVkYPMiNIrEIbncqhnUeZv
	idZv5JlJy5Y5COLh9Rjyg5gn9T8TEpgBq0nov1yv9FZ7fiJuuZZCRCOnFD2ofUGF
	LbJKcRF6lfUtRh3lSzgbm71R5HHSYEF2gtwLc9stL2ZqCQ84rmo9/nTUEHowhpsE
	ur4fnS0g2TeNL9MBZxaI2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748682190; x=
	1748768590; bh=0oMwDLq+Cc90r6I5PN83nBy5IIQ6yNR0ch7EQ/+SVKM=; b=j
	8f7sEAeFQsY2sOwAyhU3Qazqt2jRYYZxkpqt7XXiX+hggthnAWZI0RTWHCjPaa75
	XdvwnuDT9mI0VNQrXt1z6+1me9DBRQGXZD5v/XJiazlnv/l02NiFMdRAjvf1b8iu
	qGl2AGAtiR3UiRewCha8m0JGn5gkEW/kistOA76VFlOC86aP5lAmc1yf0KwDJA/y
	nUYUmT6Lazf/hOSLGDBKSiIPD0ue5lJQKl3742RhcLl9NMIByQVO8b2aZDRZh6k7
	M1iAj6CEQg2hZYxEZGlyHIOvRu2/dzPByVf68fVZ98t5Ir2Oivn9fIouePKXNYwu
	50RUP1aGun/fHY0Rok+1g==
X-ME-Sender: <xms:zsU6aANjTEAlnGiHWtWCffrNu8VWlhCKVGjtCGIP4yGsnEJduXgNmQ>
    <xme:zsU6aG_2NCq5nvOkkDIDe-p8yai_bZjqVVMx05KZ5IXz2CSgrXN2hUXtu7WiSSo63
    f6qp19o0laggI2dAps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudegleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeefffelleduheeh
    leejtdfhheegtdffhedtffeileehkeetffevtdegheduhfeiudenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprh
    gtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgu
    sheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zsU6aHT_qPXIUat_cLmSbpwaeb0D0wbCwQ7nxDwVbhofMGZnpRnOng>
    <xmx:zsU6aItoSsqYYiK6UlEw6MrfpMLePlQxgoR7MyKdg-6ws_8LKb4wDg>
    <xmx:zsU6aIcpAyJwZrruElvN7x1ZmovPlSnCwb5Ljb1OfoHRcF-0LJFWoA>
    <xmx:zsU6aM2UAi4m79AYAseT8yT1kLjhRgyqMsQlDbLD5ypYNHupsHyBJg>
    <xmx:zsU6aNWpeym9QRoqb47kTH_xF-0NpyUDVBkvmFDaFalDZWN9uYSFE9Mk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 71D26700060; Sat, 31 May 2025 05:03:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T97262eb0f1793ba4
Date: Sat, 31 May 2025 11:02:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <0744995a-856f-431f-b694-6919ca161c65@app.fastmail.com>
In-Reply-To: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
Subject: [GIT PULL 2/5] ARM: soc updates for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.16

for you to fetch changes up to 16066e29d3f5a45cd1ced62dacfce45c9560be1d:

  Merge tag 'arm-soc/for-6.16/maintainers' of https://github.com/Broadcom/stblinux into soc/arm (2025-05-22 13:06:28 +0200)

----------------------------------------------------------------
ARM: soc updates for 6.16

The main update in size is the removal of the TI DaVinci DA830 SoC
support. DA830 is similar to DA850, which remain supported, but
only the reference board was ever supported, and we removed that
one 3 years ago as it had never been converted to devicetree.

There are some other cleanups for OMAP4 and a few boards using
old GPIO interfaces.

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: davinci: da850-evm: Increase fifo threshold

Andreas Kemnade (2):
      ARM: omap2plus_defconfig: enable I2C devices of GTA04
      ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4

Andy Shevchenko (1):
      ARM: s3c: stop including gpio.h

Arnd Bergmann (4):
      Merge tag 'arm-gpio-set-conversion-for-v6.16-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into soc/arm
      Merge tag 'omap-for-v6.16/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm
      Merge tag 'davinci-updates-for-v6.16-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into soc/arm
      Merge tag 'arm-soc/for-6.16/maintainers' of https://github.com/Broadcom/stblinux into soc/arm

Bartosz Golaszewski (5):
      ARM: orion/gpio: use new line value setter callbacks
      ARM: sa1100/gpio: use new line value setter callbacks
      ARM: scoop/gpio: use new line value setter callbacks
      ARM: s3c/gpio: use new line value setter callbacks
      ARM: davinci: remove support for da830

Krzysztof Kozlowski (1):
      ARM: broadcom: MAINTAINERS: Cover bcm2712 files

Parvathi Pudi (1):
      bus: ti-sysc: PRUSS OCP configuration

Sukrut Bellary (1):
      ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY

 MAINTAINERS                                 |   1 +
 arch/arm/boot/dts/ti/davinci/da850-evm.dts  |   2 +-
 arch/arm/common/sa1111.c                    |   6 +-
 arch/arm/common/scoop.c                     |   7 +-
 arch/arm/configs/davinci_all_defconfig      |   1 -
 arch/arm/configs/multi_v5_defconfig         |   1 -
 arch/arm/configs/omap2plus_defconfig        |   8 +
 arch/arm/mach-davinci/Kconfig               |   7 -
 arch/arm/mach-davinci/Makefile              |   1 -
 arch/arm/mach-davinci/cputype.h             |   1 -
 arch/arm/mach-davinci/da830.c               | 506 ----------------------------
 arch/arm/mach-davinci/da850.c               |   1 -
 arch/arm/mach-davinci/da8xx.h               |   2 -
 arch/arm/mach-davinci/devices-da8xx.c       |   1 -
 arch/arm/mach-davinci/irqs.h                |  27 --
 arch/arm/mach-davinci/mux.h                 | 404 ----------------------
 arch/arm/mach-davinci/psc.h                 |   3 -
 arch/arm/mach-omap2/clockdomain.h           |   1 +
 arch/arm/mach-omap2/clockdomains33xx_data.c |   2 +-
 arch/arm/mach-omap2/cm33xx.c                |  14 +-
 arch/arm/mach-omap2/pmic-cpcap.c            |   6 +-
 arch/arm/mach-s3c/gpio-samsung.c            |  10 +-
 arch/arm/plat-orion/gpio.c                  |   6 +-
 drivers/bus/ti-sysc.c                       |  19 +-
 24 files changed, 67 insertions(+), 970 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/da830.c
