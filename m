Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B7622AE76;
	Mon, 19 May 2025 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645025; cv=none; b=lm94QQnoMTWUNk6Nb2PS0qZdO8rys/7sAqQPAaHk/9Y1mdzQToyiOa3WB0L/E0KSQLDIr9FGSFS9JPskd/+mrVFitJl97ohkz/1SjxVmrLRz6Dz6H8a5HFu4rgLJgelLubaEoMdhb4Cz4dZb/B7fKUqTDOguz663uQ2Wxfzfu40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645025; c=relaxed/simple;
	bh=BlqDOx8J3OPisCxOutpqocwvMympNWhpNLrhoQdWNeA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nFQrxbgJrJMimdbUiuN841w0H+ZIDbfYyYNRkeAYkv+zC6TN3PFxOCtCASzWeosF5OdwgaXP8J57IaV9TZxhhTPwIlVQG3zyHsxqGz2WaGq2N1xTbItEfr9ff4HocyqK6KGV/DxpOs+jwrUZVxl+NRa8bHIRaEKikNLWlPHkRCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpsz19t1747644978tb41e14ad
X-QQ-Originating-IP: eDuQ10kV/w2x2ssHfOTwlUZRzAh8CxixkPLa9o2Ye5M=
Received: from localhost.localdomain ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 16:56:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4209043980013137046
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for Sakura Pi RK3308B
Date: Mon, 19 May 2025 16:56:11 +0800
Message-Id: <20250519085614.2245892-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NRLj+a+1JRyJwAcdLQLhLRHUgoSxhXpjish0FvCJYAt3oabgW+b4ekcD
	3F581BJiliV2j+okYFX3LI5LdnLEe5iktfqATml1nbjhIIMB4R17mrksKdiAQftVRU5kwK8
	Zbzd5olG84Rb/c1u7EXBiwciUFKhmww24C9WaghW/ZYXqy1MHuGHC3SPNw32jgbV/HrZkty
	LnH6/0WP/GdHeSt74FOecS9hf91KXRnfVfTAC0ZWja7WoyrOs6QOF+N3k1OyriqVnaDL2y1
	GProgtmPk2z1VhJ1vv7l46MLDCatJPCSChiASbLIUMEiGFvGhPOg4JSI6U1Vvvd586fo3s4
	BcnfaEoithSSffdAFPZLgCS+nShRyCaT0prafQMX9eFIuRbBa3ICCyPGGnMTeEjvHgBDBsV
	37B4u638//7JB7crP+Ko4p6oJlhhWvuyBY6Egw7K98suepQsDlIUkb2PHeL88tRF4nmyr0i
	0rxv3utGS+OEwVj9lmPwEbzj/fNQ2njVS9KybZPrkhHGzp4VDKGByZreq1XLSCpf1wvsiap
	ZhjuyZceaIhwDzNZky30rBXRgIMAxyQ+zH3znQtgM/9WcmxwVKjUA9E5nr4OgaA0RRcPG0t
	gIWa46d/1T2lCJQEIBAwzFU8NGJpPl2cAu5CWEC81tMJwv0YGCXsdqs6L8mFg4MVAIyolFj
	07K7YZOKlJOEvyEFJHpudIRrSTiNWRHnfbX1p3Vipp8O1s40ZNqLnHVtZSnEwES+JHDI7Sr
	0b+OVEgsrnm2F6Ss4DTlZG7eI4FWT/UbsaRm21uZkl0tS2hM7aUe+alqjQlMm9hd0xSQmqm
	KGcNGZpuUYQ7lKO4seSme3v/DZy9QFVdifA/sUxpmTmcTDT8DOlsfD93cOKnvlI7Xqjr4zG
	D6JFEbQnxgM4T2NXbTB53NDIyCMrBwpAZwPtTapuha6fKx2WrLqA+JvjVZuFqmZKU7LxDmv
	gScVYyd8QBPkij/8hLvgjLSZOFIKZxhh9989QA25CRCa/QKcFeOXJPDaP/kfZUPdgRPkAS+
	keFxCxj6pnWSHnOjxi
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

This series add support for Sakura Pi RK3308B.

Info of device can be found at:
https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Changes in v3:
- Remove empty i2c controller (Heiko Stuebner, v1)
- Remove unused spi nodes (Heiko Stuebner, v1)
- Sort nodes alphabetically (Heiko Stuebner, v1)
- Put status as last property (Heiko Stuebner, v1)

Changes in v2:
- Update the names of the regulators (Heiko Stuebner, v1)

Changes in v1:
- Add support for Sakura Pi RK3308B
- Patch 2: Acked-by: Conor Dooley <conor.dooley@microchip.com>

Hsun Lai (3):
  dt-bindings: vendor-prefixes: Add SakuraPi prefix
  dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
  arm64: dts: rockchip: add DTs for Sakura Pi RK3308B

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3308-sakurapi-rk3308b.dts  | 274 ++++++++++++++++++
 4 files changed, 282 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts

-- 
2.34.1

