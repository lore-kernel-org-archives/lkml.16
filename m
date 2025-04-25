Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A55514830A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573191; cv=none; b=KRxMmz9P/7IXlMjfEFtLuW5JRpicOmz0WiNt2GRYDQPqZ/g0P9V4iTFZplRee9CSVp9Tl0uAD5dowvPIbbVVuqwPkqyXTOvEdEedfQc7Woh6MZYM2xIlbPg8WpiPEXHf3mngkFeSWwmimk2Yo40OoNsT3vKrZlJR1oFrb+JA0UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573191; c=relaxed/simple;
	bh=NKsOygsDFjk/xYVp4zbBgAEBu/WNssPzm1S5Aq8AM8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KD8Xudu/3vXJS1CFdAFFawsTUxgjhfC4MzWDQCxMvq6r63AUCZWNLadImWvHofX3hXiD6xpB4h9RbclSaa/oZDCqLHtQWXTMh5H+o8yZVFVG/MxUlAsi4N8ZDasXxHJLc6HVU6/0z5UXzOYwVYysilki6AUpLmHDAzBddyaKqxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=oWIYJ4sP; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="oWIYJ4sP"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1745573181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qtgU1WOXpOKgLGgZrNJLTIThCMPkblkediAeOcnKwxc=;
	b=oWIYJ4sP2DQejiriCy+X853nBC07WvAU2/mW0mAkccyyiFTMK0Ndk3bYoDowxudxe+82kJ
	uHu9QtMrjKt6Pg97/+BA4FIpd6XL2T2nJRr0J3jCUBuSzKUMhBj9vHKwkFoZ/ubpXSTJ9/
	/20qn/eHopqpOOZdXID7eaWapvAEfjdX8qNu67Vh5likLF3e2ITcz/7CKqe3eKi775kIbX
	TiNgnVHZB5fHfs4KY/VM6Juk1lF6jLIZG9anh3imLgQNbG8FIWUWXZuBizvvXDgYjiTSxB
	UZtPPuMDNUr1TWP4SoiTtRhd+KdwiioNP62GrRkBp6b2nv6zyOCKOfFZO2EBLg==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Dang Huynh <danct12@riseup.net>,
	Johan Jonker <jbx6244@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 0/4] Add vcc-supply to SPI flash on Pine64 devices + Rock 5B
Date: Fri, 25 Apr 2025 10:44:40 +0200
Message-ID: <20250425092601.56549-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The vcc-supply property was added to "jedec,spi-nor" binding in commit:
e7f4e924f46d ("dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply")

which resulted in the following warning:
  spi-nor spiN.0: supply vcc not found, using dummy regulator

Fix that by specifying the vcc-supply property.

Diederik de Haas (4):
  arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3328-rock64
  arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-rockpro64
  arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-pinetab2
  arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3588-rock-5b

 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    | 1 +
 4 files changed, 4 insertions(+)

-- 
2.49.0

