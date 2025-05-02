Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DF523C517;
	Fri,  2 May 2025 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746181903; cv=none; b=nl7XVX1h9VtRWB0+y5PSproMDcr2j0ECKoyGhEPaVr6MlBNRmA9kt1bDsX1eUKLwjdSj+7lqjLTm/oP5RkAH8oYTL7RvIB8fhDJ14aSEK/c+BoiLs2dz9U/qZvg2VAIzKUx4FjoHLKE9FP22AYG9m/Ccvl1eh3Ew2xBrzpY5bYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746181903; c=relaxed/simple;
	bh=EDqhhxPhN+xWP50M4sF6ht4pLrdMr8hdVrG25WXdqFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRXeSQE90JHQKTT6iyRHZp8R2cMY7612zvuqT1uyYWj7/Z4Rl8jhzcI0WC3CAmHtoS8fyiKA/UtJktf8pZM/l6WSgCTqoxD9L8TsHK2ugvZtWX5f2dZ+vmW11N0lt4MYqlqeCu/mwacld46XH76OhT6TfwAbq3y0OAMNCTkqrgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id ABF04B4C2404;
	Fri,  2 May 2025 12:31:36 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>,
	Hal Feng <hal.feng@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v3 3/4] riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
Date: Fri,  2 May 2025 03:30:43 -0700
Message-ID: <20250502103101.957016-4-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502103101.957016-1-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

StarFive VisionFive2 and similar JH7110 boards have an eeprom compatible
with Atmel 24c04. Add the node so this may be used with the at24 driver.

Signed-off-by: E Shattow <e@freeshell.de>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 5c525686c043..f1dc45b98e1d 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -245,6 +245,12 @@ emmc_vdd: aldo4 {
 			};
 		};
 	};
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
 };
 
 &i2c6 {
-- 
2.49.0

