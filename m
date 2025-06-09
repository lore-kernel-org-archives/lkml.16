Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7320A2248AB;
	Mon,  9 Jun 2025 21:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749506109; cv=none; b=B0fQfxkEzZCnpnAq/Rb6yPqitHTjw5W1ie9PXgbqe40O5sDi9Zg2hQbSa/4POTRF9gUU9SoFimkj/lKfnYqZ3rZIhiyW+FIVEP3DCYJy9BS+ex48CH0T9UqswmEkEYNqT3hOfuRHT4JMYdYmuIPbm1ubwP4eeiDjKkC6AS3+YL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749506109; c=relaxed/simple;
	bh=sFe34T4JjO0tAEnsFjcwuygXkVXQNdWJSnqO77GzWWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRg4h8057onc1P0GJd48Os2BVxFj+692roDaUksaiSHwR2AqvEfTtHvetI0ZmS/R7HqvFy/3gkrjoAYNxNxghAOvxpV4GZhyxJgESiQG0MWZV/r0Z+ae5El0sr7+gI2WPeZj1n6uvG7a82G+OJMyFQSCXJUQZYgc97liDpBdFuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/rAG/5i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/rAG/5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0CEC4CEED;
	Mon,  9 Jun 2025 21:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749506109;
	bh=sFe34T4JjO0tAEnsFjcwuygXkVXQNdWJSnqO77GzWWo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o/rAG/5i/F3cxZt7Ep2Dw3ZU885oM6P0+eYjhhqobJan1bcBdUfzydkKF78XoKu3S
	 rRn15rGPhLyornEE1hbZFu+2W3N3DwYmUlrocFEndjiOGWiCrHfpRwC01nfgcxaUt7
	 t/6FK0s0yv8nTh2Mf6JuIGyHTD28r0SQZu78xY8RNXFxfyfC6QWOst0Iu9PkiyVnfZ
	 1nkxDIpSz5Yytb9WuhpiZrQbQELFLnCt/Fq9C/81T5T1lePxTRZtREVzzymRN3lfZA
	 2gW1CTCCx6E3HLiy4luWd3TZoh6EveLRlGuNOr/kl8j8EdFWsoxumRzwbDhewe1lmR
	 9eeUM4tZ59a1A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 09 Jun 2025 16:54:57 -0500
Subject: [PATCH 2/2] arm64: dts: lg: Add missing PL011 "uartclk"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-dt-lg-fixes-v1-2-e210e797c2d7@kernel.org>
References: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
In-Reply-To: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
To: soc@kernel.org, Chanho Min <chanho.min@lge.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

The PL011 IP has 2 clock inputs for UART core/baud and APB bus. The
LG131x SoCs are missing the core "uartclk". In this case, the Linux
driver uses single clock for both clock inputs. Let's assume that's how
the h/w is wired and make the DT reflect that.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/lg/lg131x.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/lg/lg131x.dtsi b/arch/arm64/boot/dts/lg/lg131x.dtsi
index dc4229bd9ebb..4cb1e4510897 100644
--- a/arch/arm64/boot/dts/lg/lg131x.dtsi
+++ b/arch/arm64/boot/dts/lg/lg131x.dtsi
@@ -128,24 +128,24 @@ uart0: serial@fe000000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xfe000000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
 		uart1: serial@fe100000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xfe100000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
 		uart2: serial@fe200000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xfe200000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_bus>;
-			clock-names = "apb_pclk";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
 		spi0: spi@fe800000 {

-- 
2.47.2

