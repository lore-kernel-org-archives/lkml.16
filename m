Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BF41E3787;
	Fri,  6 Jun 2025 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215071; cv=none; b=KkFb2lIjQ9n0wojPix2vfkeEx5I1fO1c0bTUZL59fWar969SG/E42QyXpviWPwBHnp0snlHyzoOeGL9nBxpWbySeo+Zz+EYJHY4toAGGqmYo4GGC/l/8QcdGsWzAZeJlDsQT1E+jZCJ91OYav90XW4oCrVms75RyzXlhhQ9jAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215071; c=relaxed/simple;
	bh=qdo417o10JodKd/lScCqNLCBp2CwkQFotTyj/nq4oHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cLLtLrFjQGj7OWIhWB4aRhg2yuyoAcOmVFKT8jc8RwsnWa2fF78oNNJqLVDSrCC1KN3EXAU7H0MFmn62LjdLI69WEXSesr24KTckvRNrj4AZK+C8gxXXTCLVFX1/aBdk9PlGibx0AN8Qmv/G1dNb3JBjJTdsKkrB+uzo/2IFTBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id DB8AAB4C4438;
	Fri,  6 Jun 2025 15:04:24 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: E Shattow <e@freeshell.de>
Subject: [PATCH v1 2/3] riscv: dts: starfive: jh7110: add memory controller node
Date: Fri,  6 Jun 2025 06:02:37 -0700
Message-ID: <20250606130253.1105273-3-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606130253.1105273-1-e@freeshell.de>
References: <20250606130253.1105273-1-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add memory controller node used downstream by U-Boot boot loader.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0ba74ef04679..6fdeac3e0aff 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -372,6 +372,19 @@ ccache: cache-controller@2010000 {
 			cache-unified;
 		};
 
+		memory-controller@15700000 {
+			compatible = "starfive,jh7110-dmc";
+			reg = <0x0 0x15700000 0x0 0x10000>,
+			      <0x0 0x13000000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
+			clock-names = "pll1_out";
+			clock-frequency = <2133>;
+			resets = <&syscrg JH7110_SYSRST_DDR_AXI>,
+				 <&syscrg JH7110_SYSRST_DDR_OSC>,
+				 <&syscrg JH7110_SYSRST_DDR_APB>;
+			reset-names = "axi", "osc", "apb";
+		};
+
 		plic: interrupt-controller@c000000 {
 			compatible = "starfive,jh7110-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
-- 
2.49.0

