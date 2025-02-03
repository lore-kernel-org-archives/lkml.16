Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022361FBCB4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574162; cv=none; b=U//Bb88bq+p5Hy38ML6vHi7gcd9lFnTOJ2V/m4ejZkep2Jh/WI6oOeC504pUqhlCBdhEnqaZj7UacnqBoYXJsWA5j7NjoVPEMKUd2c3XAM+E+oMVO79Var2fYfDMEWCfA1E6IXgcoepaulaKi9WBGGoc4Frr5WH3WPGrKVqZQyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574162; c=relaxed/simple;
	bh=xswKRni51SsEyKv9zwB5pKsjneGd3ae8Tzow2Ypm4jE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFozW/B9KQxiWrtbjs61LGdhpXl3eM2FBbkgzAxvbAKCt2lkcEyW540bnSJyK6/TrQ4zenfGKxu43yennCfYTyitCX+dkm9BCi5wdGo+Y9+wQhs9fLp0G5vVeulOZ4r1z9NVJg9a3Yjh6urQhcoxTQtvM3W+qkfIWaWUIM6xqH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=MnNTZ48F; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="MnNTZ48F"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738574143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LAvNIFwT6eJl2TJJB5CO7XsRCIXELrpv+C++Li8Acbs=;
	b=MnNTZ48FVxUSvN/Uj/sac/5spztCo+eWbmyhtSirbuGJw/Lt03SaC+fTLazSW1GRhpuTgO
	iOc6h8V+nVCTpxMgxArJvuYXcf+N0LafpMbAw7WZpMmb1cGSX9OSSdGCZlSXlebSrTKUqC
	2mtnnNRW/GY3ymDmoDbMwnb9KAXeGAZBQrFtYWJLdDVX8MCPFz1/P4C9fGw6sSDZhwqhWi
	vP4qtVAYpx+TVDRPIOCxce9WQ55bj7z/Svlq209E2AanPsY4CzQWGMvDoRIEtJ/o3f8FC9
	yC8o8cKIpaMPdoTfkRAtsHG5O9nVxacKMjoxSRY2qxSJVMOfC47EUe5kZDwKzA==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>,
	Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v3 0/2] Add support for Xiaomi Mi TV Stick
Date: Mon,  3 Feb 2025 09:14:51 +0000
Message-ID: <20250203091453.15751-1-funderscore@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This patch series aims to add initial support for the Xiaomi Mi TV
Stick.

Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in 
2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
u-boot, ...)
Its specifications are as follows:
 * Amlogic S805Y SoC (believed to be mostly identical to S805X)
 * 8 GB eMMC
 * 1 GB of RAM
 * Android TV 9, upgradable to Android TV 10

There are multiple variants:
 * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully 
   labeled on the board)
 * 2. Blue PCB, not much documentation about it, presumably manufactured
   between 2021 and 2023
 * 3. Green PCB, manufactured in 2023, known UART pinout, some layout
   changes compared to the 2020 variant

Among these variants, there are many boards using multiple different
Wi-Fi chips.  Supporting all of them is out of scope for this patch
series.

As of the time of writing this has only been tested on the 3rd variant.
It is believed that software-wise all three work mostly the same (if we 
don't count Wi-Fi), but testing on the other variants would still be
appreciated.

The devicetree is based on the Amlogic P241 DTS.

Changes since v2 [1]:
 * fix SoB/From mismatch

Changes since v1 [2]:
 * remove useless nodes: cvbs-connector, ethmac, internal_phy, ir
 * add `amlogic,s805y` DT binding section
 * add S805Y dtsi: meson-gxl-s805y.dtsi
 * adjust DT `model` to "Xiaomi Mi TV Stick (Aquaman)"
 * explain the changes being done a bit more in the commit message for
   the DT patch
 * drop `clocks` and `clock-names` from pwm_ef (background: [3])
 * change sound `model` to "XIAOMI-AQUAMAN"

[1]: https://lore.kernel.org/all/20250201193044.28856-1-funderscore@postmarketos.org/
[2]: https://lore.kernel.org/all/20250131200319.19996-1-funderscore@postmarketos.org/
[3]: https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/

Ferass El Hafidi (2):
  dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
  arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../meson-gxl-s805y-xiaomi-aquaman.dts        | 288 ++++++++++++++++++
 .../boot/dts/amlogic/meson-gxl-s805y.dtsi     |  10 +
 4 files changed, 306 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi

-- 
2.47.1

