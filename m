Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9959725E455;
	Fri, 18 Apr 2025 01:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940969; cv=none; b=gVz1qBulJ54aWYQhEKOU6RkgaFwFdd2aWwiFakIahyHOtxcGTS14qA3B/IDhCZgyacfx3x9ln0RlXrDXzcghHnZryc4xcgoYWZ4RZG2/7+VYRAIyLzd9BydBlsdcA90u3M6fWP7db5733SYcjTbZS+1GjQ+jb7Ku/Ypw6Rshhtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940969; c=relaxed/simple;
	bh=B/85nIAgaufDDrEWIOlC0tWiCnzSQtFEMAoQLqN8pwI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=gbNQEIwNk5oRGT/sOCU6Hv7ePTO1tiFIDyxlkCiKD5q/czen1peFVmU1QxEzhDiamp8eEkwjRHEqxGX5juU4Nq7oKexdvki2dJTLxE9ACFTEKpBXg2CvZRaRZNiKGoZR2Z32OwiIlP4tulsq/1bCBHjytWQ/CrWWvWaMgre5XGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=airkyi.com; spf=none smtp.mailfrom=airkyi.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=airkyi.com
X-QQ-mid: izesmtp80t1744940890t33e52999
X-QQ-Originating-IP: xxYq8I7Tn0LYbD/zhGkQUHqaOq+30P2WCr1qDmsQs4c=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 18 Apr 2025 09:48:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12449981161467156277
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
Subject: [PATCH v2 0/2] Add support for RK3588 EVB2 board
Date: Fri, 18 Apr 2025 09:47:55 +0800
Message-Id: <20250418014757.336-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N7MSp95pYuqVdt5Ada0qswa5Q85vZDVGKwMX0tgjkJInZHvrW3t2kIpT
	OabEc/IShIOWW3qSfCsOgAEefqUTTq/dAPi02SD1iVVe+rS2fdmg/5CYwuKVHzMCW4eCdsn
	4036/i/hYgy9bNJHpSrFvj0mqUUtdn2YXPbxLrGzBhB+OMbORGxv+KL4vvlEPInj9Wolx4B
	kFj7Tng+HkPScXFqjTmLtPpyv2i15aAGK/097QUG2k9sPQKStbu6mvmfDviP7/zSWpwYosy
	ylzNndWfRELk8wFjC6833Yn8whG1OFYfz9Ty9GgAwihNFukwpQjOvLw5nhGMQ+2tYp59EhB
	G/Zrm8AsxXs+t1NgKX9WATZH+GA0Qc+1kkcpHuV+BwIA25xTKpKEt65UNySiY4CEmp9vpmf
	MjjzqvYAgDJuP0ZMQ3xlxd4cQSp+8uzZwBfSltgFhf3RxKh+7qRCbvBfIXQYyY1jz3nMLvL
	Kb2b44Xlbt6l2KJ+4bmcI8YI7CkE0yZSRtez1D8j9/hv2qg5+vmu6asg1iNBSVwBR4y4JN+
	a1i0XNvmYAM2luKuwzAPpPxQL8JA/JDBHQfukP6YG+mz6mb74XJLpWSHSH5+JsSGCIfhB8y
	tLlNnpvpyVDdXDlrp5Tje6D6HItrtPV25zOpXWRnateo7J+oKXoPKKwGz5T9DElh7zSNBUJ
	ZifqHDfVPZl0IdW1W/S/t/LnK6bo+vpWJUKYj7cx53Bu33VLYCPNfUSbspZx/nUE5nnN0xs
	dVIhhoLwiK4YMiZYdsi+jlhq6HsaG9otNhlLJQBMt8lrVoIeWtJE0yGFR+9g05xytoWVi2y
	aROrv2f/3c3qH9e9PBDCszgiU34dTtGEabd8Ln3rMTlJMBbaMgfrrlNUBJFm45raCY3zkl1
	9u6mE0qLHjnKM+/N9YOPQsmuqO6hyQlamx+4J+N7OlDwlGT+oaN6YSvWfiWFjevg+4DzeTc
	TOgdlpI37bx+B9ShpZV1LS6d9+Xc4u4o8B0bVlkHtczBoi9vrLSQ40AKrJ9MQwUp+wmm+Pc
	ujswug52tnXc06RgCOnSTRM0ZM7L/xuWgMXUol7A==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

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

v2:
- Fix wrong indentation in dt bindings

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

