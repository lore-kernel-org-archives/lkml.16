Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6E323184F;
	Thu, 12 Jun 2025 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722985; cv=none; b=OEK2FhT/e1NIl4Hrn3yrf18ib76V/HZ58qXhiI7nCsvCj9A47+3LOfKByI7aVw0Ok4ImQRnV9x8j1BYE/d1A5q+BSxSrR6ZHQdhOyDGo5HmWSIKzBP3DUsSqlWsa+vLpD8B29zgae5pRGgczgrCJEsj4uDzUOWm2m0hWOYQRt50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722985; c=relaxed/simple;
	bh=KOnbD8uLeaNg2BLlZz7CPRV84R3erZ0KqOVHYqnzYpc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AiHmsaBFA0WuBbE6f17AZ6Iv1EuOFiJBtKyQWYx8ptrV+a8C30zVYJGIYolLrtPiIbbH1g0qvvXFa5Cb7dHFkhvs1/bgTWGGC4AA6ofVe+tAiKp+YvEqSIU+7aEL1cLMAdqfEQHhkxD14cc3DQLJRJvgyq8o5xH+z+W7z8djSo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 12 Jun
 2025 18:09:33 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Jun 2025 18:09:33 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Nishanth Menon <nm@ti.com>,
	<nfraprado@collabora.com>, Taniya Das <quic_tdas@quicinc.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@google.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<soc@lists.linux.dev>, Mo Elbadry <elbadrym@google.com>, Rom Lemarchand
	<romlem@google.com>, William Kennington <wak@google.com>, Yuxiao Zhang
	<yuxiaozhang@google.com>, <wthai@nvidia.com>, <leohu@nvidia.com>,
	<dkodihalli@nvidia.com>, <spuranik@nvidia.com>
Subject: [PATCH v0 0/5] Add initial AST2700 SoC support
Date: Thu, 12 Jun 2025 18:09:28 +0800
Message-ID: <20250612100933.3007673-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series introduces initial support for the Aspeed AST2700 SoC
and the AST2700 Evaluation Board (EVB) to the Linux kernel. The AST2700
is the 7th generation Baseboard Management Controller (BMC) SoC from Aspeed,
featuring improved performance, enhanced security, and expanded I/O
capabilities compared to previous generations.

The patchset includes the following changes:
- Device tree bindings for AST2700 boards.
- Addition of the AST2700 platform to the Kconfig menu.
- Basic device tree for the AST2700 SoC.
- Device tree for the AST2700-EVB.
- Updated defconfig to enable essential options for AST2700.

Ryan Chen (5):
  dt-bindings: arm: aspeed: Add AST2700 board compatible
  arm64: Kconfig: Add Aspeed SoC family (ast2700) platform option
  arm64: dts: aspeed: Add initial AST2700 SoC device tree
  arm64: dts: aspeed: Add AST2700 EVB device tree
  arm64: configs: Update defconfig for AST2700 platform support

 .../bindings/arm/aspeed/aspeed.yaml           |   5 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/aspeed/Makefile           |   4 +
 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi     | 380 ++++++++++++++++++
 arch/arm64/boot/dts/aspeed/ast2700-evb.dts    |  54 +++
 arch/arm64/configs/defconfig                  |   1 +
 7 files changed, 451 insertions(+)
 create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts

-- 
2.34.1

