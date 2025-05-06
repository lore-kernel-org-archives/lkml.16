Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A04713790B;
	Tue,  6 May 2025 03:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746503136; cv=none; b=Ndp9qM5uM6C9G4nSKjNx8OOGHN8ZDrpyMxBiUHg6ctmsE2QIgJ++hkUu6M2PNN17SjBpBhuKtmYvqcH+DgU9n0qJqOCw5ruHiMy45rDOyGi+x9358/TSURUyfwn15lOHTRbNA10eliCSZzeH+USjRgbQSSIat9VG3aGwpKeyxpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746503136; c=relaxed/simple;
	bh=5xu0R5wjOr05JzgWrL+0QHFaBquoW+foZZqkitjX8Rs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=jBGEnJzetPOg24waoGc2iI8xQbD0dCgcRbKnv76bcgrj28vlMIf/1/+nb10h0iB+LVoFhYCrL4iSS6NKGtPjO8xf07utfEAKiMDm1/KtRGgSAIQQwMwaCd9Si3dS68cifKsvaFsEL0UCbJkfaskMj4Lb1RwNE1JDT/2ENYmHtlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=EXLmGtfN; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="EXLmGtfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746503056;
	bh=iSV9zPyI4IkPrEBlHh8/lsdjGfzW/kI3YQ0bFTr6LNk=;
	h=From:To:Subject:Date:Message-Id;
	b=EXLmGtfNhOrQ4/ebNCpXlF49e3nE2sMEC2dKgDNToEMI3/nW2HW6fcI/asVg6uWus
	 9d2bkge0hi9Kwp3N0XBsr/3wtvV1gM74DUE+EDb5Gi/XGM8Bc969qKJYDUfCaLGsUK
	 Pa2xv3j+N3wjlt0KPkOb5YA8BmgdDNhyLsH9OQPk=
X-QQ-mid: esmtpgz12t1746503047t1a967a6c
X-QQ-Originating-IP: JFOkyO3w+3+6x0M55PWmhESZ37RR/YYYMEb/KXeiPrQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 May 2025 11:44:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5505055036827260230
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
Subject: [PATCH v3 0/2] Add support for rk3399 industry evaluation board
Date: Tue,  6 May 2025 11:43:45 +0800
Message-Id: <20250506034347.57-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NSEFX6u+4l+KtlGV1F31MMgTIaGm4RVavQGZLMVgjdA2EIvBeC5k1ycy
	DkPNX6zs8ImkUXOUnlAHHl0+e0ErdQRgi9fBN8xcFUaNBNNMhTucxQWOXgycgLkAs4PXJ0V
	fcs55EYqiKED3Sk5mwd7yXuQXG8wvwugG9MP1Ik0WHoNmI4LGA7DiBfive8aoVdHSaKJvDg
	U8kSlFUJ8n424uXjAjLo0MedUz0RSsx3W2vWOQEJDXBWMx8J1jniLZJTAMT7OKeETSyxYjK
	ww2h3m+AYfZE6OKN4/fYGjz2Jy8llXDqwb53aUqNSVZQEqqsWQEBHWZcKRDkiko9WFjPGTW
	cZfOVTGVDKQttioB9AKZ3i9abuMIpe9lXpGKrU6G3EHiXFmgkwRC2vhQxHvWSnTZqLCW1ea
	d7FohT6vNU09cl24cIRK5jukdYy7xWT0+weeye2u+awc9yjhGrwcbPZDqgyzu8q6JdDx175
	hWvWJ4CTAyKSoZFiq1/kjboYbXVxmu3F2rkO2WOnVjdOfIvFzUiTl2kMVWPS1aBzd7JqkWE
	cdcDKwdnDZi9lQvrc+Kd629zKXir4mxqWWKlpyursFIpy+YhjuPk+ttGu351SV1x6Q5ItYn
	WLj4wRKalR83dh/FUtSj3hsvfxtHLzgoUfM7GxI5QmnGNK+PQYi1qKpfq2pMcuSS18m/5WG
	+iYywRm7EZ3FFn2Yd83UN4KYBrtbyKLWNx8RAw1+LbxIJq4phLy21+GC4djooSEF5JpTf66
	ju50A4muaAnFun4HpVJl/vpvmv//lB9GCE9wTA+WCqg0Dv/92X7arI0JsPcZuthhDh+uW3s
	J1IovLkXT/KxBTBdGIgk46GYX3CxXMlpO3ePhisdu9F4qprCmpIon5rGqCElYi+GicPKK15
	OmVIe9fUNwaNxTuxBN/HM8OgNEMuozzX0XOE1/aSoVNa9drroDVpWdp/i36FILyR0UAUYtZ
	mVox8hfImqBx9vHYKtOnuOC8cA0ICatJ/oNWFxT9oY2QfaHc9t/Xyyzri2Tie9gfvu0Y=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250430074848.539-1-kernel@airkyi.com/
- Add i2s
- Add tsadc
- Fix devicetree coding style

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
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 496 ++++++++++++++++++
 3 files changed, 502 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts

--
2.49.0

