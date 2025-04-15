Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE37019F133;
	Tue, 15 Apr 2025 01:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.65.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744682140; cv=none; b=LanjK9NLIXOHk9pdw1IJbSF6HCgtFqbWoBzKFW1yn0/6b9VYJe56ZFPkTbzicpq/1R42p/7Pumfe+5Z0+oT4NA4sJlt8xl88MWnuMic1yNJF4P4Kdse7EfKLqgLpcnRsB4I8U2tDbxs5SCMEY1kGSelm9nKU5VxGbH41LbkCo6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744682140; c=relaxed/simple;
	bh=mmlFdSrZIvUW02iX5eikNG9SIqXXY+rcuo4Mu16wSY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/Y5xNmmhV8yErzFfDdBM/oO1A1n7eB7NHmEO8+xWB0gPOUMtas7spfJgfxCcAqygHfp/u1xPOGR5NzWlx9WIQ/vskQtj44RfqKiFQVOU6FtUntAG6AaOVNUIRsFStBZ6GbYEXFWKgJGBKoJ3ER6+yTWRg1oPNKFnxDQN6xX498=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=pvpKKiLn; arc=none smtp.client-ip=43.155.65.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="pvpKKiLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1744682090;
	bh=wnkPaXEk6qnYCo+vvtWUioDSPxFUMrg19yw3XdC2wC4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pvpKKiLnzxT2FnGg12YQopnGAxFS6dDaf45OAClNaQ+2LqcdaeSQUmZnQ4PU74Usi
	 kg2nCVJZHqp9/lmbfx44wFbD5vv9eh/4MQeyFSojUpk0xwRvCZKQKNb3JqFM2rhDVI
	 fPthn3g6EnW6fXKlTGG2dvZ53SetVcRhfdXc2g7Q=
X-QQ-mid: izesmtp87t1744682086tba17c408
X-QQ-Originating-IP: fKMTSp+kc+w90RdYckDRM+y8DxFPMNasfY7wqVQrQR0=
Received: from localhost.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Apr 2025 09:54:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17149853333597941837
EX-QQ-RecipientCnt: 20
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
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
Subject: [PATCH 0/2] Add support for RK3588 EVB2 board
Date: Tue, 15 Apr 2025 01:54:39 +0000
Message-ID: <3B59B383C82BCCCA+20250415015441.371214-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OCFGt05vYz7YvWpe1uePm5eULD9aSIb3h30C2kLwI6I8RuW9oQyu/npC
	P10Yi0xxJzADchGsRXCTk7XYog1tUQJVmgeMReY45F2X3ZcCEzFHERJBwERZGZiy8H7qMNv
	GoOyB+xWO70+LwoZ98Dk0Bv1YK5rioJ9/X1sLbIBNUiplTfOkjYKSrKjm5pomDdUb/V2Eb2
	lrM2EcRYQu3r1WIvpDiUij2U+7XhXfXjNKuNtZruvm2mc3J/1D3cb6G5/RmzaIf3BLhV/a7
	UqihwMHe1ZEcK9TfQRstJ5Bk9oatQ1q16B/WH99YWYHgkKfB1mhKSUpE3xrfCCCNStIl3Xd
	rJ/VucsF7cXflqBiOiQPKHTKkvI3zc5ic1Dfa4bOOK+l6am0rrEL6uAjgYFPsikJPwCGjZk
	5LrJiezijk5cz5zLP+josrXYf1J3O+6c1nbQU9kH8lVXyVSj4wYcDNY9klQtyl6pmBLGj9e
	vdp6G7s1MfFKaJWOGWK3rYC2y27CwoHKUHVh4Z4PnGPbYXsyxs1EgaRzntIG4vnYPBKq5Ef
	jF7FDwQe0t8FDyhb3ORT0s0LKpsNlrInkhzu7YQwhWcx6uH158GgJDU70jJaZaPnB4A5nv0
	OjjYMEag52v6hOnZv46Njoph+qQvQMWGFHWZmyIzskkMCNNVnBriulHWQ1S3QADeiPghMfG
	2ddmYa7UKDmZHZ4MCSlQ85i8j1B7EIxPsaW+Wn0QCr7KGVmhjhJ6yUYQ+9Ns7zQQtuF5lYx
	Tco81aa10T/u+Pff/FM1UqHU0WO1sp+nFMKbQWsUWCN20qLDENnFJxB9Fcmz7lIBrzwtgAG
	i0p4dS9Xok/gJyB4ES9Qc//mr5UBVX1KTjwEBGaVxR4d69nl5z8Vt0WN7kAKyEhpA9z6U3y
	+ofewRHTbSS1rh98mDIzssfmBjt/OsmqbsPPA4yFnYmTPWmXvki8lHjJ//2MhY6mw3KjJWQ
	aLkfbguE+SmNhv29MI2SWQzMd0/4qq3vbxsMjrvytk9wptklcEzDh3+4P
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

General features for rk3588 evb2 board:
- Rockchip RK3588
- LPDDR4/4X
- eMMC5.1
- RK806-2x2pcs + DiscretePower
- 1x HDMI2.1 TX / HDMI2.0 RX
- 1x full size DisplayPort
- 3x USB3.0 Host
- 1x USB2.0 Host
- WIFI/BT

Chaoyi Chen (2):
  dt-bindings: arm: rockchip: Add rk3588 evb2 board
  arm64: dts: rockchip: Add rk3588 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   4 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588-evb2-v10.dts     | 931 ++++++++++++++++++
 3 files changed, 935 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts

--
2.49.0

