Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D091EC01F;
	Tue,  1 Apr 2025 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508831; cv=none; b=SaAv0FP0I/WhLNFSdRmzyAJfvx4iomM6+CUCUF3KkpfBNOtleW7Iq55wg0k7PHIOxeEn4yvDaxe35NwoWtGL/B7wbO+p4FzJk3MV10CdHc8HrWbXVjM8PwE7wM/+mxYriVwcEnoVwRpFe76/GMGCoSVwaCkIBQv6LbaNavmLRPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508831; c=relaxed/simple;
	bh=I8dvb9lL/6jU+u8XkzlgOGRv5ZHFgs4L6aRWHau1HJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kRYYBQ1+2PypILTkcfVAEZMiUCcYgFepkN70AXW3a1J2WhJh69G/vPtc/uoHubp1ji6uHie6hPRhmj46IY2ZyrHdYRxxIcBvqUP7Ge/4Wd9D7xihDKfBx13v1uf2MkVAyOL8VwsE5gADzgrQNbG9U14EAdbeu2pGIEyN+du/OZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:430:ae31:3177:4f09:da96])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1053fa3ed;
	Tue, 1 Apr 2025 20:00:23 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Tue,  1 Apr 2025 20:00:18 +0800
Message-Id: <20250401120020.976343-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTENMVh5NSR5PHU4aSRhCGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQU9IS0EaHkhKQUhKTExBTx1LQkEfGkJNWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a95f1395ecd03a2kunm1053fa3ed
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KzI6NRw*EDJIHwoiTDM5MA02
	CTlPCilVSlVKTE9ITktDQ0lPT0xLVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBT0hLQRoeSEpBSEpMTEFPHUtCQR8aQk1ZV1kIAVlBSkxJSTcG

Add pwm nodes for RK3528. Most rk3528 boards use pwm-regulator to
supply to CPU, add node to enable them. The PWM core on RK3528 is
the same as RK3328, but the driver doesn't support interrupts yet.

Note that pwm regulator needs to be initialized in U-Boot:
```
&vdd_arm {
	regulator-init-microvolt = <953000>;
};

&vdd_logic {
	regulator-init-microvolt = <900000>;
};
```

Changes in v3:
  Adjust regulators order of E20C dts nodes
  Use PWM_POLARITY_INVERTED in pwm-regulator

Changes in v2:
  Remove merged bindings patch
  Remove pwm pinctrl in rk3528.dtsi
  Enable pwm regulator for Radxa E20C

Chukun Pan (2):
  arm64: dts: rockchip: Add pwm nodes for RK3528
  arm64: dts: rockchip: Enable regulators for Radxa E20C

 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 73 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 80 +++++++++++++++++++
 2 files changed, 153 insertions(+)

-- 
2.25.1

