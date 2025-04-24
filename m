Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC96B188CCA;
	Thu, 24 Apr 2025 06:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745474798; cv=pass; b=tLu6TvRcPHFqO1FzTbmJQC5c+Gd2nDO96HX0uPuRJqdjdO65sBHz8uJcGYWC0bvM9TYIE7xccNf0hDL0SYQO6YPFziVd2vemZUQN4UJAqZMkGxpovFGXU9lXNhiDUbh0yxIK+TvqqxbEG0W6QGLT6xUKLzGhKpmlJWu6XxnB9ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745474798; c=relaxed/simple;
	bh=RDBl8Eso7VZJ5p6yF/4/C9RsSsHeGXWjIet4QinhUWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IK4VShElyuaTLtU6J71SbdpKWkl/K4u57fHgkm6W43JDaxNdmWal9sP/4ZkQczPIkJDTsbLNHMUVLRX7LuoCCcgVZHKplUzwKoE5Awwg0MakKyHO1W5ySZ7BSRM7OXNYcmLQi3duztOLCoLI24hd7ClNZaYgze777rDxJgqFTSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=g76/UJ27; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="g76/UJ27"
ARC-Seal: i=1; a=rsa-sha256; t=1745474783; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iHwLhqCIKTsbFBMHt8WQhB9xzazFvx/+zbVNfPsl08dwSzbuFFd/tljjsYebEwE9w71rBIP9Qzs3rVt/TF/uZKSbwV8L713XpMd6gnmHYf0KcmhXWSZImwCC7grDLkcL6nz7WbhcCtTTmlfhLC8+pdAesv3KoCqvXItIgyUgmj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745474783; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ix1Q4sGKAg9a8w65SPXpLATi5/wlpy8wAjzQzuX0MDc=; 
	b=e111KMAzfGCF+86Qn1ywIPwyU153D7k8U25bq62JpQoUZJwqkH72P5JvUTcKtnbmLbWCxYUDN5bJQAAxE+yT6eAV9nhLAxvwgaKQ2t6TQfr1rbfAj+EBUfc1ODcMmtbZR3iOcUU9b+cOcrkryX47sekrhPPPA8DfL2Bz4GEH8fk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745474783;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ix1Q4sGKAg9a8w65SPXpLATi5/wlpy8wAjzQzuX0MDc=;
	b=g76/UJ27I76sdVUUsUdwNX33SvRjtR6SzLjaG+iOL2ym7hQZyNSzbTimUIn4q1IZ
	RzP3oKOh0RL6AA9whACWA9hI1pJPoKMI+FiT6TuO5gG8DTG8P6Z4T/fzs05+m+QIaQl
	CByTUX57VqKqbc7bnOHOzRDPEydxzsc0E206NouPSVedl9ZntDov8X9GrlJ4fHsIOtr
	KgnzCowrjxtsn03b1EQrDvnxgkVOP7deCAQVEg6ndQAPshQ92K8VJEo5GSLV1NQs3dr
	TyfeXgIWCVrB0rO0GrmjIC32MtvrO/pef3NoC3ngGfl3z8SQ531MI+o3rK/EJt1mts6
	uqdlNymSyA==
Received: by mx.zohomail.com with SMTPS id 1745474779881209.53571103315892;
	Wed, 23 Apr 2025 23:06:19 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] riscv: dts: starfive: jh7110-common: use macros for MMC0 pins
Date: Thu, 24 Apr 2025 14:06:05 +0800
Message-ID: <20250424060605.638678-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The pin names of MMC0 pinmux is defined in the pinctrl dt binding header
associated with starfive,jh7110-pinctrl .

Include the header file and use these names instead of raw numbers for
defining MMC0 pinmux.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
This is only a prettying commit. The resulting DTB files have the same
content with or without this patch (verified by doing sha256sum on
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb).

 .../boot/dts/starfive/jh7110-common.dtsi      | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index c2f70f5e2918f..a2c72b385a905 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -8,6 +8,7 @@
 #include "jh7110.dtsi"
 #include "jh7110-pinfunc.h"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
 
 / {
 	aliases {
@@ -428,16 +429,16 @@ GPOEN_ENABLE,
 		};
 
 		mmc-pins {
-			pinmux = <PINMUX(64, 0)>,
-				 <PINMUX(65, 0)>,
-				 <PINMUX(66, 0)>,
-				 <PINMUX(67, 0)>,
-				 <PINMUX(68, 0)>,
-				 <PINMUX(69, 0)>,
-				 <PINMUX(70, 0)>,
-				 <PINMUX(71, 0)>,
-				 <PINMUX(72, 0)>,
-				 <PINMUX(73, 0)>;
+			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
+				 <PINMUX(PAD_SD0_CMD, 0)>,
+				 <PINMUX(PAD_SD0_DATA0, 0)>,
+				 <PINMUX(PAD_SD0_DATA1, 0)>,
+				 <PINMUX(PAD_SD0_DATA2, 0)>,
+				 <PINMUX(PAD_SD0_DATA3, 0)>,
+				 <PINMUX(PAD_SD0_DATA4, 0)>,
+				 <PINMUX(PAD_SD0_DATA5, 0)>,
+				 <PINMUX(PAD_SD0_DATA6, 0)>,
+				 <PINMUX(PAD_SD0_DATA7, 0)>;
 			bias-pull-up;
 			drive-strength = <12>;
 			input-enable;
-- 
2.49.0

