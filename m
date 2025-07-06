Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29301C5D77;
	Sun,  6 Jul 2025 18:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826980; cv=none; b=cdt3aiT91llqCFsTQjXcPjrTTXUao5zpAAfHyyIFl+v3dl9g1/7WR6fS9COcDyIpYnmWnb+lrwF3dPvCqUajLKEv1byxxff0sgGpj/n1D4rvX/w4f3xvVeFUE45NAbNFJi259twP2EBWdYHeoboioTTCBgVhjnfLLdqFaSYR6WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826980; c=relaxed/simple;
	bh=xO9P6sTkdgv1ksgmrMwKNOq6Vvq9pyjH91+AOwv65Co=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oCswDW+bZ0/W2js2AVNmI0shY6ZXaUiqQ2t9axO24mXA76HTthBgquY0HkG8uuEXVIkxSA/QXPTEeLoEN0iqhGlKjGYibsHOfxnYjexnyYjtvkoB1vsGKtJzL2LQq2FfgVGvgIkKLedrALWebC8lhU0MlW4qUvVJ0p3Nhe7Xr3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=H0V8+hih; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="H0V8+hih"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=8W+qMrtYNnZcx+EJzfAd8UOWFZ0ESxaf0QC+aaxPdLc=;
	b=H0V8+hihvGTw3plf+Csl99c4Y9hG7Q1bVz9KDEXvesm4isirwp98UB832PtCxJ6uOIwlt2juW/wN2c4T/iTTVuqGqkS7aE2MXZctfZ1x5guYgOOFyDZUneq/yZh+ngAvjt9WHouE64qsobF1jH7IGLEUmush5Kkg587rmFJI+jU=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sun, 6 Jul 2025 20:36:15 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/5] Add support for NetCube Systems Nagami SoM and its carrier boards
Date: Sun,  6 Jul 2025 20:35:53 +0200
Message-Id: <20250706183601.157523-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the NetCube Systems Nagami SoM and its
associated carrier boards, the Nagami Basic Carrier and the Nagami Keypad
Carrier.

Changes in v2:
 - Squash the binding patches into one patch
 - Fix formatting of the phy node in the SoM dtsi
 - Add description on where the phy is located in the SoM dtsi
 - Fix the phy address in the SoM dtsi
 - Move the carrier bindings into the same description as enums

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (5):
  dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier
    board bindings
  riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube
    Systems Nagami SoM
  ARM: dts: sunxi: add support for NetCube Systems Nagami SoM
  ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
  ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier

 .../devicetree/bindings/arm/sunxi.yaml        |  17 ++
 arch/arm/boot/dts/allwinner/Makefile          |   3 +
 ...n8i-t113s-netcube-nagami-basic-carrier.dts |  63 +++++
 ...8i-t113s-netcube-nagami-keypad-carrier.dts | 165 +++++++++++++
 .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 227 ++++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  36 +++
 6 files changed, 511 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi

-- 
2.39.5


