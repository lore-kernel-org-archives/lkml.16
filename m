Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24C920B7F9;
	Wed, 30 Apr 2025 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999437; cv=none; b=E4hTtziK0fBkZUoATwWAGd0JVcjbUMPO+FW2SGLlTf3Ds5m2hLswrmePv3etTTkryWcAkoaHaUwfoP673/0Vs0a00oSM1NsS7I6n30wRAQbE7z5IDlHMjyl/wvLTSvjcYZ4/okcO4r68ushcNrIEkJvZ4BncMsDnDvfku26dVqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999437; c=relaxed/simple;
	bh=zN81kdNFjhshtLPEJtFgbCGCrJxy++EDabuyrefH0MA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=eDVWx5eOav72L23ariiR0vlFQlsICq2OwFsDEvkMDaXM4ieQaumx4Vc00TYkkSsP54FgbBXVuSYfKMelQw2GESlj54OzcYc34ZMFEvgn0NDw2q+ibKPkSt8FyvqEWMzMNGPtBFNP0hVsTFez9LOHYp/L8c9lqJUQiggWBzaohZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=H4yNWKKk; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="H4yNWKKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1745999348;
	bh=+d4fR6VsE8K98b06ZfGfVcJfkmPTj4iC/ITe2QUEp3Q=;
	h=From:To:Subject:Date:Message-Id;
	b=H4yNWKKkDtGTGnKGR41qxy9uTc7jCermVCX71QTWbyeQvrIFOMZU4fGDvOn06Syhw
	 pCMbSyCImXYBjlZC6WyK+7uXebxg2HVIbAUWXE/A9BfEBoOKhFH/knZ70nh5tlzSeu
	 WAE6wZTx50+DO9dT2eb/q+edZbwZZCAWjExwWxa8=
X-QQ-mid: zesmtpsz5t1745999341tb79c6fed
X-QQ-Originating-IP: 3hVTGwwMeynXOkLvnusX0Aj+/TdHKKnbUh4MGuOPP5c=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Apr 2025 15:48:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4290321111533396376
EX-QQ-RecipientCnt: 21
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for rk3399 industry evaluation board
Date: Wed, 30 Apr 2025 15:48:46 +0800
Message-Id: <20250430074848.539-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NBPcaZsd6bGOBaoPj5rbOz1NA1QE3vISWNkMI1OuQCe4T5kDl4Yv/H1I
	VpeGKZvftgU4TTqQ/cpvODrOWbaYFGgm7/bKVxKUPfBmFu41PJkY/N65HVbCmLrjNrMmNNg
	sN5O4d7XQPnQ4Q5SUH49Keqduqt9AiC/a4CmKmDP0nsK/TxM5jsHjdn7nhbgDfqefZpRC90
	8Kp+VP/F6E92kcWZMstpU1eWYCMf9aKz1G8qTveLISM9s+fOSsJsuzt2iV6Gefhes9KFr4O
	2LXMTD8cVtyxZ2XhTzxxCxcmFrahvfU/VCSXNItjVZfxrxWoHuuaSfhyggrJMZ+L8LoAtdq
	Wun7GGomb19X3JC3OIduQPt2vOwo/PGFJ6K42HoBsIJg5k9rFe1v2rXcBJIjGmgAdT4410m
	K6pmldt4KGCB8uw7XJhWMhY90kKtvWFRzpk/mStolxFBgs4GfkZPcbUA0/YApljqidoMtdl
	xL7I9Hw71MTJMzKgeJfy4wbVu92oaJ/XE4sq2qnKkJ3dvNHCxjncotMaLQpqS6kNeVe6dkx
	GahDLWsK5hISoPMYcEed8bDJoEWDPgES0H2sS/AAejfJkLMb3nq0w7GpFIqd6JiZc7D39Vw
	kcNwbCBh6MquXjGa2mTEHpMf9qzauUQPTGapI6vGEjNtUETNRlFpc+h8S5SAY2JnCRKV0ve
	QBXHXwwkBE0a7vkDa6nPdStmOoXSmuACXGKVUw5l2oBx7uGjyxHraElUmIfowMbNuvB/WVL
	r3A3XoHMkNJ3qO4/m0x+PterXUMDUZh/VJ+PTA4JQFKIePgtgPn6a2YAqcMpKOtodJ0PAe9
	+m+gT+rG4xavOj//Icn7frmGGaUqn5KBYI3j/YK6YCKzmRkXVDvtEsGWaS/5uUqt5FuELuB
	j/zlooaIcUAJuQoo5HUn0RuDVDvaczrNnlBl+dNzlB2RcDym+ViuaIEii8CfBJ4+K0vegiS
	Do/2TO/dRhA3j/neLbKUg+6B6YNfc2uCHwEc/TjTLhmphtRhIR56OMYmIsaUyydP+gZElN+
	R/gE7k6DkCsoBDtBJfx3yHe9V+FM4H/hreI5JI4oEXqhcP8qXkxlS7NIXk6EYq3Ph0OjeLK
	5p5JtItkej2qZ6bmiViKvY=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

General feature for rk3399 industry evaluation board:
- Rockchip RK3399
- 4GB LPDDR4
- emmc5.1
- SDIO3.0 compatible TF card
- 1x HDMI2.0a TX
- 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
- 1x type-c DisplayPort
- 3x USB3.0 Host
- 1x USB2.0 Host
- 1x Ethernet / USB3.0 to Ethernet

Tested with HDMI/GPU/USB2.0/USB3.0/TF card/emmc.

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250427094211.246-1-kernel@airkyi.com/
- Remove gmac
- Add rk809 PMIC
- Add CPU supply
- Fix io-domain for sdmmc
- Enable vopl

Chaoyi Chen (2):
  dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
  arm64: dts: rockchip: Add rk3399-evb-ind board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 466 ++++++++++++++++++
 3 files changed, 472 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts

--
2.49.0

