Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F091D8DFB
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746432215; cv=none; b=izBAHMcHbzTY04n9OEhNwSqMh4hLj1oPqESSt5pgxwai5gV7o3ypwgktffNW+uAz2mAYMcUylD2pDsLdpDYsERlqC6l8FZlVYGAzRgYoK8kLB0D5Y4mIHoAAP9YT21wqZgurbbtKyHoJBBdhPszZZKRoLRIlPZJBVRAQKyg1STE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746432215; c=relaxed/simple;
	bh=Sos2AnAItqRrbPjNaTr+ezuNIMT7xXdaV4EYtzNBCvo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=pzYRD8Q0sroMbY19sfJaqS9va2JMeHGmGG96vEl/lOzq1hNW7DdZe29O8ZvQSVqqpw/OuHjdJJ11LWKMLoTAOFI2Tf0zjxtiedsz9xunjhSi3h5iaiDRRZIVqmbWy1iigQ0OALsZsOcqdbZS9ZsV9A4LeF4gGW3cX176Sdq5SRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Iq9755XJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ot+ID1JJ; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Iq9755XJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ot+ID1JJ"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 2D10713801A0;
	Mon,  5 May 2025 04:03:31 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Mon, 05 May 2025 04:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1746432211; x=1746518611; bh=Ru
	i5mVOszWTl9nD8tHKJPtp+GnylKLvgNMk68Qak7tE=; b=Iq9755XJ9slZfwpsZp
	6mhzBEikF59TI9nci47XG9RDz7u77pelDBVhoTGtmVPL/gBcEgl08GMwfV8Yt+tc
	8U5h5xwq0TZd82rgv/hPXnOvffw9a5ZpGeOJgaYPwmpkVz2W63TIzh6kaNDW3GWp
	4aoy9VYiysthp39DVN0Kv9j4qrP0A7p+RZ6DWfyOScKRdBYiyItoJIwE9Nt29s/m
	Q70dxKPFdM7mHYnhpQfo8wCG3sP32e+FZujLlkWsmxzn3Rhi/uUogZGg7CiYH39h
	ijTJaSpdaBlK/5KyLdKumvzhZueOzpQsk6+RMCLGhSrY3DKy9jI0lVPp1lsCfeIi
	yIlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1746432211; x=1746518611; bh=Rui5mVOszWTl9nD8tHKJPtp+Gnyl
	KLvgNMk68Qak7tE=; b=ot+ID1JJWQoB88mzxHWIXGSIfIvrWJslB3TPaBtKtMhk
	l1c6YlOWiF9h3nt/DJlffCyUxhiPIUNWGdDMJ5OZVGC197SGakvjCSazAjk64zDY
	BJxW3Jt6aCwqDzmwwXBFu4hxrm3k2BRgkeVlFw4hNhAZHp4Xi6pJBIKks+ydeXb8
	aCJ8BHxaBoNPyJexoiP8PWTNy1VZhSTN0OfvqpiBqFJ1uuPOKYZGBKmx955uIirj
	NL0qZVE885Ct/95CQceR5uapJgd+4xlu0Lev+PmbId+Q/CzqQ/uredWmfjlAVWiQ
	rXSf+F8hUCLIkF0eR4Cnaii8/35EOPtQAliUqmrWsQ==
X-ME-Sender: <xms:0nAYaEBKioN405oYGv-9UsVC-pqZylewYNn6HmEQf8mitrunopBxGg>
    <xme:0nAYaGg5jXvEU9juFVf_yLrqLGs6k5CGJ9y6q0He18ySm_78jKcA8LPaSIOAJ5lLz
    DSS01MjnrEDK9AaMU8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdeigeeghffhhffguedvvdelvdfftdfgvdfftddv
    gfeggefhkedtfeeutddvuefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:0nAYaHk59Y-qAk-cg5luwpsN-Mk6KGapJqkO4yTGmQR81xsvroE34A>
    <xmx:0nAYaKyae8s6GxJrDoadQbyLuvuIxwhnZbT4Ot60cYcPBtnOL_26Ng>
    <xmx:0nAYaJQna6uP1EaLOvXP0-u_P7SnlOjp5AFAfUsNOwY_rACcJY2toA>
    <xmx:0nAYaFZuhZck2d1jNSH6tNRDElImuNnq4YIGF1eSVV-trZujUIl7Tw>
    <xmx:03AYaEbE-r-MT_Y0f8qo0gmivHXuCJyBuYDpcNmXeZqX6pFGg0JCF0ry>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9BE1B1C20068; Mon,  5 May 2025 04:03:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 05 May 2025 10:03:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <a080c802-52fb-4601-8178-990494c87e5c@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.14
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e2=
59b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-f=
ixes-6.15

for you to fetch changes up to 2ef5c66cba6171feab05e62e1b22df970b238544:

  arm64: dts: st: Use 128kB size for aliased GIC400 register access on s=
tm32mp23 SoCs (2025-04-29 18:16:28 +0200)

----------------------------------------------------------------
soc: fixes for 6.14

The main changes are once more for the NXP i.MX platform, addressing
multiple regressions in recent devicetree updates for the i.MX8MM
and i.MX6ULL SoCs, a PCIe fix for i.MX9 and a MAINTAINERS file update
to disambiguate NXP i.MX SoCs from Sony IMX image sensors.

The stm32 platform devicetree files get some compatibility fixes
for the interrupt controller node.

Another compatibility fix is done for the Arm Morello platform's
cache controller node.

The code changes are all for firmware drivers, fixing kernel-side
bugs on the Arm FF-A and SCMI drivers.

----------------------------------------------------------------
Ahmad Fatoum (1):
      arm64: dts: imx8mp: configure GPU and NPU clocks in nominal DTSI

Arnd Bergmann (4):
      Merge tag 'scmi-fixes-6.15' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'ffa-fix-6.15' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'juno-fix-6.15' of https://git.kernel.org/pub/scm/linux/=
kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'imx-fixes-6.15' of https://git.kernel.org/pub/scm/linux=
/kernel/git/shawnguo/linux into arm/fixes

Christian Bruel (6):
      arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
      arm64: dts: st: Use 128kB size for aliased GIC400 register access =
on stm32mp25 SoCs
      arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs
      arm64: dts: st: Use 128kB size for aliased GIC400 register access =
on stm32mp21 SoCs
      arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
      arm64: dts: st: Use 128kB size for aliased GIC400 register access =
on stm32mp23 SoCs

Cristian Marussi (2):
      firmware: arm_scmi: Balance device refcount when destroying devices
      firmware: arm_scmi: Fix timeout checks on polling path

Michael Riesch (1):
      MAINTAINERS: add exclude for dt-bindings to imx entry

Richard Zhu (1):
      arm64: dts: imx95: Correct the range of PCIe app-reg region

Rob Herring (Arm) (1):
      arm64: dts: morello: Fix-up cache nodes

Sudeep Holla (1):
      firmware: arm_ffa: Skip Rx buffer ownership release if not acquired

S=C3=A9bastien Szymanski (1):
      ARM: dts: opos6ul: add ksz8081 phy properties

Wojciech Dubowik (1):
      arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2

 MAINTAINERS                                        |  1 +
 .../boot/dts/nxp/imx/imx6ul-imx6ull-opos6ul.dtsi   |  3 +++
 arch/arm64/boot/dts/arm/morello.dtsi               | 22 +++++++++------=
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   | 25 +++++++++++++++=
+-----
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  | 26 +++++++++++++++=
+++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  8 +++----
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |  8 +++----
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |  9 ++++----
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  9 ++++----
 drivers/firmware/arm_ffa/driver.c                  |  3 ++-
 drivers/firmware/arm_scmi/bus.c                    |  3 +++
 drivers/firmware/arm_scmi/driver.c                 | 13 ++++++-----
 12 files changed, 90 insertions(+), 40 deletions(-)
