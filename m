Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A40820E6E7;
	Fri,  2 May 2025 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746182316; cv=none; b=ZYqUXaSJ8LO3vaSy7HXwY+ISekqWKB6zc5BKCyzAhpHQ7cO9X3eMJiWUIkZv5wXDSdZbjK5QZSNO9z5WRf14ocQEQhxGxUo7GPNwxYFK6l6c1Mf0tyoKQ5cUZkhSa7e8rp7mfSQdOAMH2FWhlbxzLPzy0Hssb+jK7mRco85yERw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746182316; c=relaxed/simple;
	bh=BIGwsvQMgicbHiWzr+m5XkPTLfafq2dMG1dLt4C4zZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e56ZT4b7dZwElBpS4h4/rKL+hepYAOsj22OVNmvFQHVMgS0kP8BpjOJCE45tsGUi16p8Kluq4uV0L4XBOD1LtE4cZoz9kkNGqrvHxrMNkkM94me9CSSBybHwbbsn6JeeJPZgsudY7wrs1sgvGNN6YSC5vkp7OcPy3WlJlmvx9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 5128FB4C23F9;
	Fri,  2 May 2025 12:31:24 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 1/4] riscv: dts: starfive: jh7110-common: add CPU BUS PERH QSPI clocks to syscrg
Date: Fri,  2 May 2025 03:30:41 -0700
Message-ID: <20250502103101.957016-2-e@freeshell.de>
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

Add syscrg clock assignments for CPU, BUS, PERH, and QSPI as required by
boot loader before kernel.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index c2f70f5e2918..f1489e9bb83e 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -353,9 +353,17 @@ &spi0 {
 };
 
 &syscrg {
-	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
+	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
+			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
+			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
+			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
+			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
 			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
-	assigned-clock-rates = <500000000>, <1500000000>;
+	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
+				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
+				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
+				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
+	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>, <1500000000>;
 };
 
 &sysgpio {
-- 
2.49.0

