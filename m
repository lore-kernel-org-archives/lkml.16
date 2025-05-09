Received: from out198-6.us.a.mail.aliyun.com (out198-6.us.a.mail.aliyun.com [47.90.198.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C26028ECCD;
	Fri,  9 May 2025 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785680; cv=none; b=UI/xdMI/TM1zAkJf+ORIykEGfAxSNHSHgTLl4rEXhoyQhr5RzFzzX0qHekh1RQeQlC2S5sHmaDwOwO++PakUlkx+mI+1IdBA1j9g7Pz9N4Sjy4OtME+iIWxv/8nZyIvSqclEXGkvL0tVSEtJOrzn5abnN4ahP9AHBdZIiZS9MAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785680; c=relaxed/simple;
	bh=ugJI5Tobb2IXuI2j4WeUxK3aOe1/tApJ5jT3clQjReQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AdlaJSaeS+sYvtJmlf2AnhIj2IlWMv89IRAyIZALs54SgdV5RpIM7jYGsm0D6A9+KRBUrn/VFLsIFwRPWntrEHOeznpBZywt671L4zATg461KkqT++X8OTYz460EK3swLoaMCUQ/+PwFNzHN+ymjmWO5ONnEMD5msjbZrvnw7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn; spf=pass smtp.mailfrom=coolkit.cn; dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b=gpDzv7f9; arc=none smtp.client-ip=47.90.198.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b="gpDzv7f9"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1746785662; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Gs19F+1WIkB6GNDNJjv2vHXESzCcZJhcfuVCqnf0BsQ=;
	b=gpDzv7f9K0KAcUODF93NqLjdg13eD2UZhpaRar4598DP24YA5DhZ959ox6kec5KYHa4VrrDw1F6w5O+YWhMoVes7M7Up8uX1wa0N929mR+q+FPy5w4TJduPP/W+bxNAfhIOx5C5MWfLvPxiMQ48ndTiurT7AVugEH+jlSa6N38w=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cjsv3WY_1746785661 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 18:14:22 +0800
From: Hao Zhang <hao.zhang@coolkit.cn>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tim@feathertop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hao Zhang <hao.zhang@coolkit.cn>
Subject: [PATCH v2 0/2] arm: dts: rockchip: Adapt to IO domain and SDIO for Sonoff iHost
Date: Fri,  9 May 2025 18:14:17 +0800
Message-Id: <20250509101419.460473-1-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
- Use full name 'Hao Zhang' instead of login in From and Signed-off-by

This patch series makes two corrections for the RV1126-based 
Sonoff iHost board:

- Patch 1 adjusts the SDIO max-frequency to improve WiFi stability.
- Patch 2 updates the IO domain voltages to match the board schematics.

The voltage fix is based on verified schematics and helps avoid potential
hardware instability due to mismatched IO levels. 

Tested on multiple units with improved long-term WiFi operation.

Tim Lunn is Cc'd as the original board support contributor.

*** BLURB HERE ***

Hao Zhang (2):
  ARM: dts: rockchip: Sonoff-iHost: adjust SDIO for stability
  ARM: dts: rockchip: Sonoff-iHost: correct IO domain voltages

 .../arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

-- 
2.34.1

