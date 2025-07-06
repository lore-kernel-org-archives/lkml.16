Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3662877FF;
	Sun,  6 Jul 2025 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826999; cv=none; b=PnDIlNnWZiorkvpZ9bvubxjPOrwgmKauSd0k3MngrtIIt+g1Yevs0pvv1LDQtgrstwG1HFUIsEGW7wOFzGYmPVHO+yLMA9mAq6ToEVj6P6rTaW+0X9Tgj3TKQqLJZ92tl+GeAq9wQjLc1Pq2RellZ/8QW0oe4RGHM6vCLuoCgSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826999; c=relaxed/simple;
	bh=C5ipsNKqPtcZ9ZqVSlX5kWYRMwAWnRaNKaXRoPqKKus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G5MmEuoo+DhT73kPV3aA5qoyOl8UTLm0ipIFtXE/hpGy2aTkS5jd3TGhKQnkLaSeUekWnTVXCfPBGV6+eO9Ojg3ukY7tHOhVIHqVAAhFnQ3LtPQ0plxD9NJ6w8oWuas27eg9sGa6XdwPy3CyPOcgnFy+REg7XqNwfZXQ4bSsL8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=gvxHfBTx; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="gvxHfBTx"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=xZ7vtuj+s70PG5PkBbRCZDNfe9x5yGSFsFXGi4NYoMk=;
	b=gvxHfBTxIOGSJjVT38nYhLnPEAj67cTiCebwQHAReVeMFmCqZJh5wzyk+SYUb9OPSn4Hm1EsQWT7gjz6Mvfy76AmZEruyYZ8gPiXt51b9D7HpoYJZnUXq9hSo2yVksONtqCpJBwaI5cpdIcAP6+O2W448Tnrv9LU7Tpjk+B47uc=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sun, 6 Jul 2025 20:36:18 +0200
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
Subject: [PATCH v2 1/5] dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier board bindings
Date: Sun,  6 Jul 2025 20:35:54 +0200
Message-Id: <20250706183601.157523-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250706183601.157523-1-lukas.schmid@netcube.li>
References: <20250706183601.157523-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetCube Systems Nagami is an System on Module base on the Allwinner
T113s SoC. It is intended to be used in low cost devices which require
simple layouts and low BOM cost.

The NetCube Systems Nagami Basic Carrier Board is a simple carrier for the
Nagami SoM. It is intended to serve as a simple reference design for a
custom implementation or just evaluating the module with other peripherals

The NetCube Systems Nagami Keypad Carrier is a custom board intended to
fit a standard Ritto Intercom enclosure and provides a Keypad, NFC-Reader
and Status-LED all controllable over Ethernet with PoE support.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7807ea613..50f08d8d2 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -599,6 +599,14 @@ properties:
           - const: netcube,kumquat
           - const: allwinner,sun8i-v3s
 
+      - description: NetCube Systems Nagami SoM based boards
+        items:
+          - enum:
+              - netcube,nagami-basic-carrier
+              - netcube,nagami-keypad-carrier
+          - const: netcube,nagami
+          - const: allwinner,sun8i-t113s
+
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
-- 
2.39.5


