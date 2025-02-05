Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E0C1FDE1E;
	Wed,  5 Feb 2025 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774114; cv=none; b=H4t4S7Ly0MWOYo/KQjOXzxw+paUgw+LF/6R0Tbj+e6ubIUOF6uWhKdzPYreWcaxCrcy0ZVQ3/++HPSoVRz/mDnhfWE4UvgPOtAs9ru3k4QhnjZwC/GIOVOjCzTBE0LKH4psbM6o9dDvs7fah6Iu0b34Fx7TEOJ2oCaEAVYJsMCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774114; c=relaxed/simple;
	bh=DiSxPYZaNdGjbVa7+HmMznS7TO3HVmhhVq4q8g3TJFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a3Df0qvz5X0kLklWhn2ZxLb/yRqDrUFfqCZ5Q30+bEk+IbC8ui7B+AOlLfITJlIU9aAMr/3q16azInexkEK7cacdLUrEAeIEHfIZQjvvubcdav4iCFSfg+Rpp8X7VyRjvApp4ARncnIvnWETW5QpfSpsL1qWL3YW0m5WBqna0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=E466toiG; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="E466toiG"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=pIRYa9YQsz8w9c0y2kwbYds3kXa55MTpz/4qO0nMzV4=;
	b=E466toiGSMo5cCsel4l5r/BpNf//jdMTUgi5ROD4EYbs/MBdt2oCPcZu0v2S66IUCq9EbYrCsaTZbjPDMRmOOR1G49e7AjRxFcPq8cAG7/B005bu/CrV9ufC+4i+X+5osoGGI3coh42NdsxbyFcgTGLl4i8HKevToCbey9jUMFo=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Wed, 5 Feb 2025 17:48:03 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/4] Add support for NetCube Systems Kumquat
Date: Wed,  5 Feb 2025 17:47:09 +0100
Message-Id: <20250205164716.2509650-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds dt-bindings and dt's for the NetCube Systems Kumquat board

Changes in v2:
  - Fix the devicetrees according to the "dt-schema" and 
    "make dtbs_check W=1"
  - Fix the License of the devicetree as requested
  - Create a cover letter for the patch series

Changes in v3:
  - Disable rtc inside the SoC again, as the rtc does not work on the board
  - Add the gpio-reserved-ranges property to the pinctrl bindings
  - Reorder the nodes in the devicetree to match the order of the nodes in 
    the sun8i-v3s.dtsi file

Changes in v4:
  - Moved the dtsi change into a sperate patch
  - Update commit messages to include better descriptions
  - Add descriptions to the uarts and mmc nodes in the dts file
  - Add missing newline at the end of the dts file
  - Removed the gpio-reserved-ranges property from the dts and from the
    pinctrl bindings
  - Remove the rtc status property from the dts file

Changes in v5:
  - Remove the unused lradc node and it's regualtor, as they are not used
    on the board
  - Add another alias for the SoC's rtc as 'rtc1'

Changes in v6:
  - Add reason why DS3232+ is preferred over internal rtc
  - Remove redundant pinctrls from mmc0, mmc1 and i2c0
  - Reordered eeprom0 and spi0/flash@0 properties
  - Reordered nodes by their node name alias+

Changes in v7:
  - Disable the external 32kHz crystal oscillator, as it does not work on
    the board

Changes in v8:
  - Update the commit messages and cover letter according to the Linux
    coding style

Changes in v9:
  - Change interrupts to interrupts-extended for tusb320 and can
  - Rebased patches on latest master

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (4):
  dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
  dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
  ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
  ARM: dts: sunxi: add support for NetCube Systems Kumquat

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 276 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
 5 files changed, 291 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts

-- 
2.39.5


