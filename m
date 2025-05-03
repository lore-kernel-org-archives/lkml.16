Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A6184FAD;
	Sat,  3 May 2025 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303332; cv=none; b=SysO5H2CbpIZgIoaB/hUzfgygxf3bIUQAhQJ7dsjNe8MZ07QxPJDZjBqgvU9rMzzPog19j/+qGNTpSv3nvNM8WT8NqDmBoZdEtefPQW0KDdjD+G1tYCpoVE2fREudK5btM8qT6aIFYOOMIbq4v3RzNrc03B3f3vPD9/Yh1SlrbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303332; c=relaxed/simple;
	bh=wO/8PHMyeFxjqoTKdYfQg4nZgQAr06rUlL2GbGN/mns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/YQDm1HLRntUnxjHbVIVJ3mcPhqmSQX3zH/AImlDVvGRhyd2EYeh6YRk1I5f6NggUQDygVS9mKY9Db80W7669xNaV6K6zYkovm4tWYXASS5lDpbayr0ZaliF7TICbatflWZl7vO3Y24K5nXgiCW9/H2pWJBcdCEqCVZVJt008g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=MtlBx+Yk; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="MtlBx+Yk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=gH2+1VtxfEdmAeyQLvI3/wPTQrCH5G9W+C09NAWMwXs=; b=MtlBx+YkkbvsT9O8zXz8IANIRY
	F6Br6B61gGkNBzEHdeqhYmVYnc2Q8e6ZuHhq/4vbyETfkuYU7wm0QFex7wMJPrl4/yEQtaW1VXasN
	qSAkpQvjdXh4Q+N3428yzMIQhGqSaJRZvZaECxyLJ14t2EkLBlbDynmsBnukq0n3sFBx9EPeP28aX
	A3XYnwNxqg7re6L4dvqlMRrQTblqNA7PvtMMe5A6ybDclzkJBcGZjGoTqQpSTaq4tssNV8oDZOchO
	GaZNIT8C6Q65Ugynm/gQKUKEDYBK//okjNCIHXJ9+K4hFl1g2YygLQMEbZ0MpNx/KlmQ91PXlNDGi
	NO4/mdgA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJGg-0001hY-Va; Sat, 03 May 2025 22:15:27 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb-phy support for the old rk3036 soc
Date: Sat,  3 May 2025 22:15:09 +0200
Message-ID: <20250503201512.991277-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While trying to resurrect the rk3036 board in my boardfarm, I also
implemented the up to now missing usb2phy support.

The implementation is quite similar to the rk3128, except the not-
supported charger-detection, so its addition was quite simple.


Heiko Stuebner (3):
  dt-bindings: phy: rockchip,inno-usb2phy: add rk3036 compatible
  phy: rockchip: inno-usb2: add phy definition for rk3036
  ARM: dts: rockchip: add rk3036 usb2phy nodes and enable them on kylin

 .../bindings/phy/rockchip,inno-usb2phy.yaml   |  2 ++
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts   | 12 +++++++
 arch/arm/boot/dts/rockchip/rk3036.dtsi        | 35 +++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 32 +++++++++++++++++
 4 files changed, 81 insertions(+)

-- 
2.47.2

