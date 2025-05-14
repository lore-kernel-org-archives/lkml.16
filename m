Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821E1206F2A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210122; cv=none; b=R8vJ1EpwY1zSu1a5pnjIRV5Y0n6A1sNJvIO6iMBbzshoDvosvIHNfgu5+N4qR6d0NnotrSun4NyHjOM/74Y2c03twK4ez5xK203dqBSa8evgIFnMq5kqNXIJNgecCjthJi+Y3ubs9KshzhEXvYAcTwj14gxzCs0WVr/MsUK+L9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210122; c=relaxed/simple;
	bh=3iw0vx7AIT2wlzPokwDnRY5c+iOCJC9NuNU2SCSpKxs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=AM3iHPvjSwVwtPceR0Qq3NXhJ5fxPn6vmUK9v/nZam0KU9a0SBEC8n6iaroMyLKee8Ph8el1Bsc2hFZEZXzdk/LVUurI5z/6sDgeqxUOfeVDEm9ZxfS9RQk6/m+0SywDYz6r1pMS6A+4XEbfYgQ9exMTj6VcLvRPGq0Z94kVQzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=j8lRNJgD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a7lnlvvB; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="j8lRNJgD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a7lnlvvB"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 5588113801E0;
	Wed, 14 May 2025 04:08:38 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 14 May 2025 04:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1747210118; x=1747296518; bh=8k
	HsaoCbnmz2MgVuxSTzK+1NmqxlS+HUS7BsLkQjvdo=; b=j8lRNJgDrN6R1Q14nZ
	EVc593KlChl0krY9iCnvyayMu8QEFJyBiKo4h4DEGdOQHCs7I7W6fRMUHYaAnPtw
	6TJALqVmKaNgsx8UXbOWvYlwgLfX179vpGHp+Wu6SthRruaFoE7oiqtv4PuGm2sc
	D05w96tfxjL6c4XcDjbXXiiSJbfuYNjsORI6OKEd94Ahdy/ArvW5l+4eHBJudV7X
	nX01GlOoQpvfK82Zw///vhIFV9jIp4V9MvVaF1xx4CmLOkpPiBe7MK3FfpcXVPzX
	+OS30VRa+9sLwe/Oou4A7RhF7L3VNvbE1WbAofHi5gGCu+2n2fxuoUNJdeqsSLUQ
	5m8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1747210118; x=1747296518; bh=8kHsaoCbnmz2MgVuxSTzK+1Nmqxl
	S+HUS7BsLkQjvdo=; b=a7lnlvvBAMzsWQ/9vZx+QqCKA150lWqlZOWwwQ2gfauz
	RJMDo67lksD4cuEgAE/os45cUDk4gmwIPihQzBu2ZDYgbJ8Ptmsbk598ucc1T5I1
	kzkmEXeQvZo8g1YwwJMmfLOIthfmqF6pNv5lde8n42UBeprmJ5vCnvhQVCFxEzdL
	x0kr4tYTZ4pET0vlRVnTTCG1lEhVPEg25jXUgmoUin7UC0p4iohN/KLmcR/zygW6
	XL42cpCw1JVQVtkkV2XuAjDUr2842ybrSM/mXZp3yn7xuD055/GvBR5pUsCAc2br
	xVuwhnecVHViPq/XtbXKWWS/+YJa1IkxX/gbqEYY2g==
X-ME-Sender: <xms:hU8kaNtOZaBO3FOFNuYklBiVq28n3MTZUiaLV-m9OkB4vKxjV3W9jA>
    <xme:hU8kaGdx1TMerLYngZFPBNdsYDk8gohM_5T90xnS4OIJdZTJ5cu87t2UdDB4ndFuB
    ZiU7kejN72rNhFjh9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeigeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepjefhgfeugfdvvdegffeifefgleefkeehjeefteei
    ieelvdelgeelkefhtdehtdehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhith
    hhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:hk8kaAwrGKqL2Q85bsl2nnDya_gNM7BUYD6iFTzSMPb-ImFqWsbQ_Q>
    <xmx:hk8kaEOI6n7Hx_5g0gsa21Bo5rycuyTb7z6gzsVtcSVJy31QV1UjIA>
    <xmx:hk8kaN_6T7RfTlhJb45vbVBsEcZiCxoIEXtQMZG9neCZeVZxPkRpQA>
    <xmx:hk8kaEXH7MnZEMY4hdO1bsM28qq6nOZdX38u_U5hMBXXFz5PfZtDlA>
    <xmx:hk8kaMelvn8oBydj7daLjhraacgjohhERTLNI79EPyS2ZvlcqZQnRvxb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E42701C20068; Wed, 14 May 2025 04:08:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 May 2025 10:07:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <660e30e8-7ae7-4a55-a136-9b0aa4e5ad0b@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.15, part 2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 2ef5c66cba6171feab05e62e1b22df970b238=
544:

  arm64: dts: st: Use 128kB size for aliased GIC400 register access on s=
tm32mp23 SoCs (2025-04-29 18:16:28 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-f=
ixes-6.15-2

for you to fetch changes up to 15eaaa71e8ef142b122942b35653d513cfb90050:

  Merge tag 'imx-fixes-6.15-2' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/shawnguo/linux into arm/fixes (2025-05-10 11:10:38 +0200)

----------------------------------------------------------------
soc: fixes for 6.15, part 2

These all address issues in devicetree files:

- The Rockchip rk3588j are now limited the same way as the vendor
  kernel, to allow room for the industrial-grade temperature
  ranges.

- Seven more Rockchip fixes address minor issues with
  specific boards

- Invalid clk controller references in multiple amlogic
  chips, plus one accidentally disabled audio on clock

- Two devicetree fixes for i.MX8MP boards, both for incorrect
  regulator settings

- A power domain change for apple laptop touchbar, fixing
  suspend/resume problems

- An incorrect DMA controller setting for sophgo cv18xx
  chips

----------------------------------------------------------------
Ahmad Fatoum (1):
      arm64: dts: imx8mp: use 800MHz NoC OPP for nominal drive mode

Arnd Bergmann (5):
      Merge tag 'v6.15-rockchip-dtsfixes1' of https://git.kernel.org/pub=
/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes
      Merge tag 'amlogic-fixes-for-v6.15' of https://git.kernel.org/pub/=
scm/linux/kernel/git/amlogic/linux into arm/fixes
      Merge tag 'riscv-sophgo-dt-fixes-for-v6.15-rc1' of https://github.=
com/sophgo/linux into arm/fixes
      Merge tag 'asahi-soc-fixes-6.15' of https://github.com/AsahiLinux/=
linux into arm/fixes
      Merge tag 'imx-fixes-6.15-2' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/shawnguo/linux into arm/fixes

Asahi Lina (1):
      mailmap: Update email for Asahi Lina

Christian Hewitt (1):
      arm64: dts: amlogic: dreambox: fix missing clkc_audio node

Dragan Simic (1):
      arm64: dts: rockchip: Remove overdrive-mode OPPs from RK3588J SoC =
dtsi

Himanshu Bhavani (1):
      arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card time=
out

Janne Grunau (1):
      arm64: dts: apple: touchbar: Mark ps_dispdfr_be as always-on

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Align wifi node name with bindings in CB2

Martin Blumenstingl (4):
      ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM c=
lock
      ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM =
clock
      arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clo=
ck
      arm64: dts: amlogic: g12: fix reference to unknown/untested PWM cl=
ock

Nicolas Frattaroli (1):
      arm64: dts: rockchip: fix Sige5 RTC interrupt pin

Rob Herring (Arm) (3):
      arm64: dts: rockchip: Use "regulator-fixed" for btreg on px30-engi=
cam for vcc3v3-btreg
      arm64: dts: rockchip: Fix mmc-pwrseq clock name on rock-pi-4
      arm64: dts: amazon: Fix simple-bus node name schema warnings

Sam Edwards (1):
      arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down

Tom Vincent (1):
      arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyel=
ec-cm3588

Uwe Kleine-K=C3=B6nig (1):
      arm64: dts: rockchip: Add pinmuxing for eMMC on QNAP TS433

Wolfram Sang (1):
      MAINTAINERS: delete email for Shiraz Hashim

Ze Huang (1):
      riscv: dts: sophgo: fix DMA data-width configuration for CV18xx

 .mailmap                                           |  1 +
 MAINTAINERS                                        |  1 -
 arch/arm/boot/dts/amlogic/meson8.dtsi              |  6 +--
 arch/arm/boot/dts/amlogic/meson8b.dtsi             |  6 +--
 arch/arm64/boot/dts/amazon/alpine-v2.dtsi          |  2 +-
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi          |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  6 +--
 .../boot/dts/amlogic/meson-g12b-dreambox.dtsi      |  4 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  6 +--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  6 +--
 arch/arm64/boot/dts/apple/t8103-j293.dts           | 10 ++++
 arch/arm64/boot/dts/apple/t8112-j493.dts           | 10 ++++
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  |  2 +
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi  | 12 ++++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  6 +++
 .../boot/dts/rockchip/px30-engicam-common.dtsi     |  3 +-
 .../boot/dts/rockchip/px30-engicam-ctouch2.dtsi    |  2 +-
 .../rockchip/px30-engicam-px30-core-edimm2.2.dts   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  2 +-
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |  2 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  2 +-
 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   |  4 ++
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  2 +
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi          | 53 +++++++--------=
-------
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi             |  2 +-
 26 files changed, 93 insertions(+), 63 deletions(-)
