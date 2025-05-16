Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FC621ABBF;
	Fri, 16 May 2025 01:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747358735; cv=none; b=iW5OH6HuzRAWsM9LhDjPLPB3sMUz5iKZiyizoXYGDBiJVjepqJbYqybVxFBMYjRcJKMsNXZ1AT+8vZCOVXgeHsI+jWG+X76DwzFOCEDq51fOWw0fUWz9KUrJtUcsZxCEt6/52xHZx/nzduAzo/Waze3Xozogx2rZueztvZvwJj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747358735; c=relaxed/simple;
	bh=7C9IfIXQ3/wnWWj/u0gMztpGC1fxTn1gqlnhGYscBvY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gPaJugaZAtVpfkp/U03M/IKi4msCqcQgky1h/cuZ/RtMeSVM8rWmhf0Is8zG1SF/Vm2L3ZjWi1hT69G8648NYIg+2+y9s2vQEPRLSOwLvEAOdJmqq5lx/LQN1k+yVduKJjTwO5r9TVNUvST53H65QfvN3dvDzLERb8/+RTTyS48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: zesmtpgz7t1747358646tf895317c
X-QQ-Originating-IP: S86Fui8y2624yiQ2yyHngT1PUpbtPOcRCOPIdeWMnsE=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 16 May 2025 09:24:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14660113273428683281
EX-QQ-RecipientCnt: 10
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org
Cc: i@chainsx.cn,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Fri, 16 May 2025 09:24:00 +0800
Message-Id: <20250516012402.580468-1-i@chainsx.cn>
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
X-QQ-XMAILINFO: Mutteg8H72qDPCJ40a+mwzdvrN+3IMOubGL6Ovp/EmyTyl4iTm8gdc40
	TdZ5qiL5fGUKkLxRgNvpXv5rKx4XdREZHslc37vMVk0YTWmj06bCRDRPFaSoNHAlhaLM2ZP
	hKpUrBQjCXg3rfdob4srIvYUoRtIELfSQS+nY4R5c/AGiu8xLnEzJ82LZ+T+0b0HTh3Wom7
	tRgBh3uPAe0o3TTpnnUeIoYY+E18X1oghe2pc53GaJTJNXdCEzhMMzaSef5b/ajacdrI5df
	ZbsWNyN1mK4zA3jqwqwI29cGpGxrSp4pLj0LeCM6RScX00YjW4WngLXEl0zEeA3M09DdH2x
	xyaLoEzMzb1ijfdAxLtXfGBIBF6KDDR8StU+WRSKjprTsh+EQIgzzTiI5n0VfYOkp7EYiPH
	j5joo5k6l2hPwbigBhSUgJiUErbpzssSyK7RzMNbdORINmiTum35Q8MlclyO/HGXOEKSt4O
	YZw3xLUiMVrVO03lzFGiC1JsQT2851qjw0PiU0ZTfwksxLzHlRmKXGwlakZ2JprjlVdErpg
	lQ8UB9X8eGikO0rTW8j2lExUAOFb+PbFZPxs1ym+PFuksLP5VyoxJbFMsmZV/1Zz/1ZSAX8
	EWUm9OnWlL69jtZlBYV2pOvouKIBu37so3XHQ8PR0qs1tpcSLqwTw/8sNKQwIsOtumR9skD
	ZePggG7u90W/YfzyqfqRwvwrVxozU5NOCvUWepVB8afMMudJc6Zry4kQEEwNdeZN/lq6Bo2
	Qgz4NxlBn710hEPHLUlLN+kq5zv6kMArYrdwIKyTasdy7dVVcv2SCZ6Vty+pt4yM48Rdk6a
	Drwlv4+8+D7x/c5HdFdQ8AkhSdYvKhw+ysesTtzJZrN8NvCyaTSVTIBqKf+SFp6Zb7estGm
	xvU+49RZtbBZsHBxCr81S4bw/djY/5B6v3lqIVl/b7GpjmCPnk2aPHXl9KPEVeVrOAL5X84
	Uvz8O4GGu+uGJ1QtRvXF3Gvka53uJ68HCv8NSMlYZShtxFgXiHJgvORmjW7nOu9hKRg8=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v3:
- Update the name of leds
- Add more cpu nodes
- Update mdio compatible
- Fix the order in the node
- Add the default serial port(uart2)

Changes in v2:
- Fix rgmii delays

Changes in v1:
- Add support for Firefly ROC-RK3588S-PC

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 926 ++++++++++++++++++
 3 files changed, 932 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1

