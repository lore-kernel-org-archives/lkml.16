Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D87D2874FC;
	Tue,  1 Jul 2025 20:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401277; cv=none; b=IRM/KHSoVM1PWAzpZJ2OENTa17mbehRY82LYLLLcEGM57T4sCuUBnsAGFRXp7TA545fP3ze1MtKk/KRyClY/mluPKmx8TL7d8YdcoGIPvc5bgs0JHsk6jUpnNl5LkYw7MAXi7fjgIT1eg2zy2vPewOhQPgvCxMl01Y8cDlKgWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401277; c=relaxed/simple;
	bh=0bgfV5jh3nFou6IZgQTz8Pe4EcFyT55MeKCyz+5Tad8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zgq9jgBe5Q5S/UgS6UBR43V8X4CKyyYfB7GmHKRlSORRGp2RnooY+MVI6xz3Fpqmh6qqFJPMm/3iZ6EbBsJdtXnF2iwrioAtRd+pp5+TqPZgvW8aOWdsnSVHjfYJFiDnuEj5y9ySABUj9PiN8GbMHIqhi3fnU6l497FRUE3mC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 2C02B1F0003D;
	Tue,  1 Jul 2025 20:21:14 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id ABFA6AC96BB; Tue,  1 Jul 2025 20:21:13 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id B7FD1AC9699;
	Tue,  1 Jul 2025 20:15:43 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 1/2] ARM: dts: sun8i: v3s: Add RGB666 LCD PE pins definition
Date: Tue,  1 Jul 2025 22:15:33 +0200
Message-ID: <20250701201534.815513-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V3s (and other packages) supports RGB666 LCD output on PE pins.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index e82cf312da25..fa54510319ac 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -411,6 +411,15 @@ i2c1_pe_pins: i2c1-pe-pins {
 				function = "i2c1";
 			};
 
+			/omit-if-no-ref/
+			lcd_rgb666_pe_pins: lcd-rgb666-pe-pins {
+				pins = "PE0", "PE1", "PE2", "PE3", "PE4", "PE5",
+				       "PE6", "PE7", "PE8", "PE9", "PE10", "PE11",
+				       "PE12", "PE13", "PE14", "PE15", "PE16", "PE17",
+				       "PE18", "PE19", "PE23", "PE24";
+				function = "lcd";
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB8", "PB9";
 				function = "uart0";
-- 
2.49.0

