Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7444A3C;
	Mon,  9 Jun 2025 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749468735; cv=none; b=ezs52TM9xDb/gaVdObzpNxB9oEu0tBNpAIWkS9HJCjwLZBtTo8WDKiQemgsavGaoVbHnECaqCw4HvNeHn46U8y0pv0nz+XsnwueytwvEAf0c1r/uoTe/KbjB8O/ihMD60YXlxYoHSrw/9DNjbneLsWxU6iEsVH9Sb6BeHriWHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749468735; c=relaxed/simple;
	bh=mRDJbWLmmCHETsb5PuNct2QeQlKbO5aeeo2ZTshg8B0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TBRIVGm0IJSKLz5meT6KQ5JWM3uDObzvnw6vKpaZlIljG0fkClLH/YT2g1yFN+m+qDxDtJ2quSy+ThWkA9lNwInusCulgBJZLpgevBDl1lBQyYfompLYxlNoFDIT71DyC99/Ib6p7xapU5WfXuXq7E+c+ftRQs0ygbzjFi/oFw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: zesmtpgz1t1749468649t03990109
X-QQ-Originating-IP: DgbvBjSokVTQG43IbUieazUxITiBXvTzFEVmAUCGFIk=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Jun 2025 19:30:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9665082274307116488
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
Subject: [RESEND PATCH v5 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon,  9 Jun 2025 19:30:42 +0800
Message-Id: <20250609113044.8846-1-i@chainsx.cn>
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
X-QQ-XMAILINFO: MjlOSqg8Riw0yiHnc7w/miRMh0pW4B5/XCjNIs6r0zyd6XZwtH/XQn3c
	CDfYXtiUiEdlCpE8HXNfMGKVah4VLoosN+3xUsKZKOaK3sYXscneRKNClatFbxe4jF3iPRM
	TdfrtB9HDneMnNFb/roBi4i+LgZL3DEgU0OB5Ugxa3Vw6OPtpetVlz/8ba19KVv2U/rsdcs
	UF7FV+g5+TbuvXjplfDBWBYrH0zkWdYgsVFrfeDXzuksi/4HPaH3PNGHgnn51N0AGx/BwPJ
	+X22OuGLAHg2lAwI19L/B+sV7zq2BBP7zXg0hGphvALug/3hNR8tVtqnoBmJfAykxiUnniU
	qVzHjlHZ5FtJ/6DP2AYpw4KeSjphHWsobN4LnHzGkAjD2aZ7XVTX6yXrECulGXivgV29WZo
	36da4I+ZAF012AsbTMQICDVp19hcr+sfirnf93qJYw+Q14XzObhEYwl4lbqt5aCm+J4jpaL
	Dp9Ei9j96LXokNGWPspYB9koUZhmG1aNXRz9JFfPwkG71A1o6d919BFRQ9gjulnq7ugI4sl
	HaWkGRhMgHOkK0/B/gW0YZXYhEQkuiKfueA3PQZq9cinss4XSH4MiYYZPZAhGYJypTOydDQ
	WPt7vHJ0RBhHzoPMD8J+aFWEGbs4hGc4gI3kCOQpAjRDx/e3cRVBpr3YW4c6zrScOLa9Cvo
	QB9DOwn0NAtEECzpmrLgz173J1oTa/DrC2fJCggKyFWnj9AEKZ9P+w3AQk+YSYH1rCkBP4c
	VAdbPjIMR++Wn3Clrg+yTe5J31gYkeq90s9FhOLAGEbYT3F2MYTCZV0qGYDl0m8f25P9O0q
	tG7xJOXc7b138GL0X0017Fupz7N/C0RAkQ2OoigRQmVT1YpYjnaJls8MGDuhr2JuzVXiPA5
	B6EdS43Hut88qq6oIv8DweRTKPu8cIoa2EtYKhSnNKKN1ArI4tKM+jbU9Hau2mr75zRZPkE
	DFHwv7LBFAi6Ay3DzLTyE5Xu2PLU3kaHIrQiQjVJHAxMRLgMNdapI0OBW5Urxlta5IP8=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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

