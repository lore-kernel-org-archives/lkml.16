Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E24225B693;
	Sat,  5 Jul 2025 21:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751751619; cv=none; b=P8dETqd9JyId85gq+CGFL3h5VzDXeb3m1iFrRwCjH/FtYC8R4H2atyhJsI52ceouz9MLBO6HsGJizL237GBAsjf7a2oL4NtCXnZz9lD7SJ96TWgM2ULUpVY8Pi2mY7JJDVIFoZ4ucbg0lqInhvIMq/Qw+UcWqvVJAxF6SLuRIDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751751619; c=relaxed/simple;
	bh=S1SbxIXsGKCqyWEpzapBmPg5WH5ZMM5x1PFkIGlWsQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G4wUxSErQZCAmrpK6AnxB3/P9LWJ/nRF713/9jAOjQU3jWjGHyRcBstxliJaA4r5tFaGb3bL2tbwkwy+qnbQbQOlVpTSw27wCUf2wwO3tc+liS44pAuzULS72s4kbBY+xjTlb+HPzk7OZKWlLSi8a7IZ4kj8JQwT4NKJPEkkl6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=duBT6fFa; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="duBT6fFa"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=OF9j3V3Vyi4SgSh1FVLBT13zIeJ9KlZP/ukjomymbIk=;
	b=duBT6fFaCILMt0LbO3DTnyHuHB3RavvnXBa9ArTaeAfJBbTsfXx2wy/30YR4GfmWLRxNWy71NbAirk5s0tAeWmaPzEm+8c2wTfG1DTLOu4kWRTfezgFakdquFzEMAxLDdi291izokgtQQ8XKu2tle7syuTQtBzdNtjOtqsbkUmQ=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sat, 5 Jul 2025 23:39:39 +0200
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
Subject: [PATCH v1 0/7] Add support for NetCube Systems Nagami SoM and its carrier boards
Date: Sat,  5 Jul 2025 23:38:51 +0200
Message-Id: <20250705213900.3614963-1-lukas.schmid@netcube.li>
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

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (7):
  dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM
  dt-bindings: arm: sunxi: Add NetCube Systems Nagami Basic Carrier
    Board
  dt-bindings: arm: sunxi: Add NetCube Systems Nagami Keypad Carrier
    Board
  riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube
    Systems Nagami SoM
  ARM: dts: sunxi: add support for NetCube Systems Nagami SoM
  ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
  ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier

 .../devicetree/bindings/arm/sunxi.yaml        |  17 ++
 arch/arm/boot/dts/allwinner/Makefile          |   3 +
 ...n8i-t113s-netcube-nagami-basic-carrier.dts |  84 +++++++
 ...8i-t113s-netcube-nagami-keypad-carrier.dts | 165 +++++++++++++
 .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 227 ++++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  36 +++
 6 files changed, 532 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi

-- 
2.39.5


