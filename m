Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28A61C5D44;
	Mon, 19 May 2025 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641360; cv=none; b=LVO1gGkc176x9Rd7PIuOtWcsY4Eq520IGuw5gedoT9Zcy1h/S1rDuFzNVwtsWSHjuDnFgjJpAULSwDlDHILLS976nu9fIsQBrLBxs1DAdIgRdUvfsVeQCUVKYSLyr3JzaejLoPN7HntK46b1Qzxh/6Yc9ixLFVzmsbwE9d9PZFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641360; c=relaxed/simple;
	bh=dcP6KNmJf6cj8lnbCPvdHzndolRhpUSV3fzP/vOPUCc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=na1C5uuiRMla2JIFLmCYEB5YNjmSbYuG3M+09OI/n5qRrAiMpIJ+KwUg0g7LT/7RTzwkT1lb3128YIz5H4UHO2Dxu5tO4qhhPfkUwZs+SSpz2bIkC/aODjoKYVAZWm4D7rQ/wIUWzd7XInKa3ZTGC8lZq1lFtC0nZVU5YUYRmUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpsz16t1747641302t978062b3
X-QQ-Originating-IP: Y5+0uhBMb6O+WTaaSJz5+Fz6iYdOQsJ1GOUrFSOcmmk=
Received: from localhost.localdomain ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 15:54:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12531447371105096942
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
Subject: [PATCH v4 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon, 19 May 2025 15:54:30 +0800
Message-Id: <20250519075432.2239713-1-i@chainsx.cn>
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
X-QQ-XMAILINFO: MjA5tsjrlPcvo1VRqp4hQ176Hre5v7/hVw1eD48NjQvkcT0lbMMbBG1t
	LI/aOJNENlHwd9iPl/SxuPcRYZPxYRcoMk/NBCs3BcPLFfAgs3rBk3TgSQ6hNGhD3KUyzhJ
	IxPNW1KdgA6jkVdxIYyJhwZgipus2GO6m3q/LHKW/t4rJXxZrUY6ZzvnJ1Xtz+Mjl94hxcB
	MmwkSp0+rbnKOiX1JmdFMZqz5j7EHrQa1NrTKIc9UrCRG2uMGNsYcSUS5KybBykkojmZnF3
	wq0tBhCUErM8FzDmYO7N1S/lK78qerfI/0J8sUEWiwcL0e5yEUc/UpCvNvpXZsSWPHILGgE
	lFNH6dUQ2zlCCsAOh+TKlwLxsVv+HqvZtZeZQb5Pk5G6KI8g9R6LyKfwYQa91m7HELY+PtW
	HCu5yGJOf9XGETT0k8zY7fhh2cgnqW8oJLCXIFJ0AvL6+EOKDbRYLAcRWqlz2RVkiqojzIf
	gw2TOL3qyADFmhWKJpkWBJ9sUiuo90vIs1fuNqrWfJn8FF9eQExXL4vjx3C8G5d3Dw/auSV
	pF1PdP8wjKAQs7K9IO86dr//7Fb3ngSfSi4JLzc51RWbl0odiz4VZ+UmmQsE489NgPQT1Om
	5PXcc3r4y38RU35Vf7bv9zA07JuueZcQLCJNTeRbWqyG1T/RpuRl7RndY9WCbGYloem5dhd
	gKrwMi5hit3b8k6U0umBgTGDihe3GD49lgFYDLQD9mlG4ya+ol7cVgKp7mnlzR6E866b67F
	/pB4wFfrd/Usek0LGKPU5hXnOs9M2IdW8ao2159XmUIA6Exz3j7x3DpRashzT0P2wSzqtlx
	4ClQL/3wF6dHqMERJN5SCm3N9P6/rgwPUZEj2pwkfDcMnAMlI+/sxjN1T4X2iM9cGgmnhi+
	4FIs6vzGoZ9DV5K+6/8+IWZ4zxQGapRRiylZPXiTq759srrP/zcFn7SIWwQG3158jGsLgxS
	a4k9Vaw21IjgbiOB1vxvMO+cW73nB1qgk61jeflMyHoPH4A==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v4:
- Update the name of the regulator
- Remove the i2s5_8ch node

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
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 922 ++++++++++++++++++
 3 files changed, 928 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1

