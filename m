Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0008155E69
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 09:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748682380; cv=none; b=BAFKRmUJUnVH7AJAV5pLdQYCyCpF85b7TEmALk/L9DQMDIEuJhTkBMRXDz/waXke7KIBnTPEP8lSOD+52gMlbRwsUmq2biXpZBlkDS5xAZrBzTR9b3a6Io35388FGqK4NJ4cn15Q/DeVUINHtiz/iXpzpHhpBqa8tTl7Chceguk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748682380; c=relaxed/simple;
	bh=WRXGXpztMvNElSTu3kAH+5cnzYFZ4yK6p6+w72tEU24=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=vGEibIhKkKvF0FVVc+biQQA/TmeUObDoQhbNbfT1MWHtqztVtC6TbHVF71nx/8G/jeRKq67+LL/wLD0ZC3WHaaKk8XAR7j77d/3OgYXduqaaViO2GToxMZ28k3HkCNAEv5Cs1GL3sUA+654PPXdbqByln4ux+0FACXDzKlBfVKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SI2Oc7/T; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IcOOOHw8; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SI2Oc7/T";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IcOOOHw8"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 166CB13802B4;
	Sat, 31 May 2025 05:06:14 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 05:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748682374;
	 x=1748768774; bh=uKdbo3WnKQeAfAvhc/ViFElNu4LqcTYPpUpsUOiCxGE=; b=
	SI2Oc7/Ta2ctvFnyZoL2X+rII28RaEjeblJO1/AwELyoMjXnETcXYOch80RLmNRi
	eKvEYPCM+optRHUCPA7uMLUaTSLqaL+L864irUKX54e/8+aKPpe0edSTtlFtSETe
	pWkE8U3tQqToTONubpxSjIoSqHJw1IXpwT0D4UWRzcyxQT1LBJc/Im7hKfuU7pru
	c0RsyZjwGT/7NXSKDPBxVZxkt6UDL+DhO8Tui9ApCt0juMU29UmTA6Tz7K+nBo8U
	QFRDb3zmAKlqCNmLpP77hOMX9w0uAIJbJQSIZyvYwi+J4PC1NFj1/9ESH3Zggqp1
	qFIl/ADO+UBM6EoulZHJZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748682374; x=
	1748768774; bh=uKdbo3WnKQeAfAvhc/ViFElNu4LqcTYPpUpsUOiCxGE=; b=I
	cOOOHw8cEhEskK21Tt5puAbXpCu7suwR57nXt12ChH0mGR6jwvQy1WJ98c8P4lQp
	srCvK2IV8o2y58SknNA/WYHfgHDjmSu2vVpvIGeTB1wieRSYoGMOIggkqrlJcJcM
	MbzxLQfwtOmsiTXh/xyyWIwviBPy3QwacujT0gdIgGTA8UrBABM1b3zs8JCJh4Vr
	Do9FaZT1ZekOQcCBEteC78ZDKK/2zCRtyoCKMJSVVvXjuVUKZWPVzkAqtuDHzHSJ
	yLsHXD9rtQpzC1vubCOqDRQuc2cbWVZUTyGUpY0QsB/mtCpF6GDwpwlTsl0Do5JY
	sVexD7SurEFnM1dmrFdpA==
X-ME-Sender: <xms:hcY6aBtJ3cOgAqMPO0x7a2i-gfSh1XWFWgvYAZoOzWWbycq_397DPw>
    <xme:hcY6aKd-wEsvTL0Z2PSFqCZciqhB2xF4mSlVS-BgZZneXVZXTli_TZhVQm8_47cq8
    Wwy3hWV5C2LS8qhx8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudehtdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeekvdeuhfeitdeu
    ieejvedtieeijeefleevffefleekieetjeffvdekgfetuefhgfenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:hcY6aExPFL7QIEEfZoiffm_Px8gNg00mRBqB6kJts3AVnI8M-jUMdA>
    <xmx:hcY6aIN313SVt04dBpsMKFXfpISSQRRCKHROatgKikf-9pC7FQ6LTA>
    <xmx:hcY6aB9ZJViutMSEYRTQckNRjmTnFfhRbGVRJpij7COhef7LCaLWUA>
    <xmx:hcY6aIVoc6FKwgZWOfWegUQsMNlH_N-VBkHYUHDuriw2vkhi9ru9kA>
    <xmx:hsY6aETUhpbgu6qgAa3-WkO38KZXUeiSJsVlB-LTC9a9dmWy6FkM8BUI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BCBE1700060; Sat, 31 May 2025 05:06:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 31 May 2025 11:05:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <70c2f540-d534-4b17-8daf-4409845f3a5d@app.fastmail.com>
In-Reply-To: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
Subject:  [GIT PULL 3/5] soc: defconfig updates for 6.16
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e2=
59b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
efconfig-6.16

for you to fetch changes up to ae006498a0723e1cbb14fb7c56a1fa4642791897:

  Merge tag 'v6.16-rockchip-defconfig64-1' of https://git.kernel.org/pub=
/scm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig (2025-05-2=
2 13:01:41 +0200)

----------------------------------------------------------------
soc: defconfig updates for 6.16

The usual defconfig updates enable configuration options for drivers
that got added. A few SoC specific options are enabled in Kconfig
files instead, in place of the defconfig files.

----------------------------------------------------------------
Arnd Bergmann (7):
      Merge tag 'renesas-arm-defconfig-for-v6.16-tag2' of https://git.ke=
rnel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'imx-defconfig-6.16' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/shawnguo/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v6.16' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'riscv-config-for-v6.16' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/conor/linux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.16-2' of https://git.kernel.=
org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'mtk-defconfig-for-v6.16' of https://git.kernel.org/pub/=
scm/linux/kernel/git/mediatek/linux into soc/defconfig
      Merge tag 'v6.16-rockchip-defconfig64-1' of https://git.kernel.org=
/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig

Biju Das (1):
      arm64: defconfig: Enable Renesas RZ/G2L GPT config

Dominik Haller (1):
      arm64: defconfig: Enable TMP102 as module

Francesco Dolcini (1):
      arm64: defconfig: Add Toradex Embedded Controller config

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Enable more support for RZN1D-DB/EB

Haylen Chu (1):
      riscv: defconfig: spacemit: enable clock controller driver for Spa=
cemiT K1

Jayesh Choudhary (1):
      arm64: defconfig: Add CDNS_DSI and CDNS_PHY config

Judith Mendez (1):
      arm64: defconfig: Enable hwspinlock and eQEP for K3

Kuninori Morimoto (1):
      arm64: defconfig: Add Renesas MSIOF sound support

Lad Prabhakar (4):
      soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is=
 set
      arm64: defconfig: Remove individual Renesas SoC entries
      arm: shmobile_defconfig: Drop individual Renesas SoC entries
      arm: multi_v7_defconfig: Drop individual Renesas SoC entries

Michal Wilczynski (1):
      riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs

Nicolas Frattaroli (1):
      arm64: defconfig: Enable Rockchip SAI and ES8328

Nishanth Menon (1):
      arm64: defconfig: Enable TPIC2810 GPIO expander

N=C3=ADcolas F. R. A. Prado (1):
      arm64: defconfig: Enable configs for MediaTek Genio EVK boards

Sricharan Ramabadhran (1):
      arm64: defconfig: Enable IPQ5424 RDP466 base configs

Tudor Ambarus (1):
      arm64: defconfig: enable ACPM protocol and Exynos mailbox

Vignesh Raman (1):
      arm64: defconfig: mediatek: enable PHY drivers

Yixun Lan (1):
      riscv: defconfig: spacemit: enable gpio support for K1 SoC

 arch/arm/configs/multi_v7_defconfig | 19 --------------
 arch/arm/configs/shmobile_defconfig | 26 +++++--------------
 arch/arm64/configs/defconfig        | 51 ++++++++++++++++++++----------=
-------
 arch/riscv/Kconfig.socs             |  1 +
 arch/riscv/configs/defconfig        |  3 +++
 drivers/soc/renesas/Kconfig         | 42 ++++++++++++++++++++++++++++++
 6 files changed, 80 insertions(+), 62 deletions(-)
