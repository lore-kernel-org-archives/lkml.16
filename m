Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788D719DF5F;
	Fri, 30 May 2025 03:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748574727; cv=none; b=By52ca2fNk0HCArQcJ8Fjw+3ORqcyfWkx3Hed7zbWteHX/Nuldvw3e7GwC5hzM1Is0dDzYaou3GQRk1NM/X4b1YiMokTMrxA1OZfC8x25wDHELq5lTm2jJYL7aQPNSAkh5AXSU/QPlfJR3anV3hOkbz+EsKQ4GOg7+KTMUy+eEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748574727; c=relaxed/simple;
	bh=mRDJbWLmmCHETsb5PuNct2QeQlKbO5aeeo2ZTshg8B0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bBITttXvG1XPjgZWGAs0v6xLJgURjTbzm3uS5CXFu0Q62hL4AJF4izE9b/JCtgMlvIHbPKtsblNQR12xa/Fn+zqAZZEIgfLgWu0yB5g4We8AdZp1ynxMQHRwSqrpgRJoz2/EZ+94P1K4J5sNwRhfD07/BClLLwpXUuCOHPxDNlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: zesmtpgz3t1748574651t1f688200
X-QQ-Originating-IP: 5OdztFYpI2CQ6CtR9zM4QisGTIm1CN/fzpZK7SrLLX8=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 May 2025 11:10:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5599866305784924053
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
Subject: [PATCH v5 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Fri, 30 May 2025 11:10:44 +0800
Message-Id: <20250530031046.166202-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NkkRVlbtkC301Tdt/mvciw6xJWmZKN5WZP9uzHl6Vvverl8wNllYu39C
	xPYAk9B3yzAXmSVx9VnGSDi48IgwYQhNpOrnB7GD70n06FqImPT2I8oia3zKbxWp/4Aw7Hh
	nW4md6ugNS2bSQMP0585rpxAoA5yN7FdCyuyx3uf+rzOkfjmOAcqn+YwMiBwsdSagRMb62U
	e8v+trAAZ6a1K++gSShnK7kmglAvpkU9h0wVH2V31aLv6BFxWBftqYWu/WPPjxUxXQrnYSu
	YUO4WJJHnmgK0HauGh2LrGVa39xCNvLALgHrGsWQZ2xk0L/CLxtBFd3NcaQt8yXx6f/xgOi
	2e82Vz7I93z/uDt9NkjeEAyF9Q+BKbVZiPJjt+NSHsDApMGsV9oRYQnwFIloM023SpJoI1W
	QnHal33ediQjDS9wdtNM587YYyN9pHahKYE0DEOJwnBjQAMtg18YnGWNKTGZv32VKSaTHj2
	5jPljO0XrdTYyH98KQF/aioq+jWO9qCezPvBJGLvRFOgF0Iq2o8AMVB5wo1e7EJsuuQ/ISv
	LXMvHUnKDO20Ri8SerSGN0kNtYMI0hMlV883wb29CDu2xdV5dw65LzXGs3iFlroyDuC9e4H
	miX50BUBVhB9XoM/INrcYe/T1HLP1EqBTf1ZtoKnKIFcwi7+KCxPV3aYWREoF2CQF9k/xo8
	L1L4mQVvwOJQOXvE8n9eDwH/GpQAAvTsAHsqHOd+hhlHopN+3uOR1FxKRpuWhk2fYdRpwui
	qRSfTXjoz8RomBcDDHjHjN8KHuWQrc/T4knQ5SLqDvKvejiyddTQabW0G0iYgAIpopVZJc7
	oXL3uDrlb4mTAUQQm8/if/ZbfvdU4NIkJrQwzfRG9z9yrF448qmInmWP1IzClos/PnYhWLr
	lqw8CJmp0kT5IJ1/7OBlHIFX4fRcTcgmhQiR7H3KWhJhMF9rr6txYKGSdGsHKB/Z98Fzt+p
	zq6G5NnE43NDDuzOpqL4Jm5oEn8ZjcvzmBgptsMsKJ3qn26ahs3VFEpeW30Tery1Bt2+G+i
	LYaJyHrA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v5:
- Make led-1 off by default (Chukun Pan, v4)
- Add color settings for led (Chukun Pan, v4)
- Remove vcc5v0_usbdcin
- Put enable/gpio before regulator (Chukun Pan, v4)
- Remove always-on and boot-on from vcc5v0_host (Chukun Pan, v4)
- Update the name of vbus_typec (Chukun Pan, v4)
- Remove always-on and boot-on from vbus5v0_typec (Chukun Pan, v4)
- Put pinctrl-names before pinctrl-0 (Chukun Pan, v4)
- Remove usb_con node
- Remove extra blank lines (Chukun Pan, v4)
- Add phy-supply for u2phy3_host (Chukun Pan, v4)

Changes in v4:
- Update the name of the regulator
- Remove the i2s5_8ch node

Changes in v3:
- Update the name of leds
- Add more cpu nodes
- Update mdio compatible
- Fix the order in the node
- Add the default serial port(uart2)
- Patch 1: Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Changes in v2:
- Fix rgmii delays

Changes in v1:
- Add support for Firefly ROC-RK3588S-PC

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 838 ++++++++++++++++++
 3 files changed, 844 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1

