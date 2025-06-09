Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCC521D587;
	Mon,  9 Jun 2025 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749506248; cv=none; b=EvtQQCALaU7DoDVZU7bTxfBCltz9gTTr56wVx9bMWTg8EG8UywTKex9XMryb5f1QkVPXOXW9B9ssJCl+I5195M9LHZc8MGKbG4LimEK9Qrs9ZTcHOKMSqkU0H3JovULpvwMwPOj4GQluJgmutEm9vmtJ7caQNsrxbWJ7/0AIQU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749506248; c=relaxed/simple;
	bh=H0LP7W2hYltTeFPZPNeKYE1C/owB9QWsDiUoyqTMeno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAAYEr8nviI99sj3SFdu0HlZ4K8kmr0XA6woH74BZbP3GMrlWHOJUUy4SNl2RERYSKTY6FUPEGNVaC4NdZfso3kT6cHJpEjSt2NI4UC9swX0npCZ/hHpzzZW9lnzyxgtA7Gs5Y9jstfKTUXeVtnKAhJMKeamuOuXCxxFEFvBpD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+/LzdOS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+/LzdOS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C4DC4CEEB;
	Mon,  9 Jun 2025 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749506247;
	bh=H0LP7W2hYltTeFPZPNeKYE1C/owB9QWsDiUoyqTMeno=;
	h=From:To:Cc:Subject:Date:From;
	b=k+/LzdOSCuz/NfiUkLCeYAN157XpIljEmZJMc4MojulOsbb9Z6Yy2qIyrGLsLfHa6
	 kwR4H4RZl6/5qh/pJiyth5rb0lHZC66iPFL6gStDnSPnOTEY3Hio8aZ8CAWmYv3Y6S
	 YrZE1eQizI81oJ0GUvAWlpFwOvsd4mvMHuT9sq9PbyL9acWjp9BgKPp0zhrGA+j0Bj
	 4nU1msgJVli/iAeEYnXr11GB5Xq1YEjjzH+VKm0g5GZtHBjFoiF0R2E6myKzAEiTR5
	 Q1sCftrRnO7k9BxlTqkvth3LqL7FLVb1ku8N8r7O81I8X4QN9e4vUu+DxAdMa1/8Fp
	 UEysR4v5H1lJw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Robert Richter <rric@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: cavium: thunder2: Add missing PL011 "uartclk"
Date: Mon,  9 Jun 2025 16:57:06 -0500
Message-ID: <20250609215706.3009692-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PL011 IP has 2 clock inputs for UART core/baud and APB bus. The
Thunder2 SoC is missing the core "uartclk". In this case, the Linux
driver uses single clock for both clock inputs. Let's assume that's how
the h/w is wired and make the DT reflect that.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, Please apply directly.

 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
index 6dfe78a7d4ab..966fb57280f3 100644
--- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
+++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
@@ -136,8 +136,8 @@ uart0: serial@402020000 {
 			reg = <0x04 0x02020000 0x0 0x1000>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk125mhz>;
-			clock-names = "apb_pclk";
+			clocks = <&clk125mhz>, <&clk125mhz>;
+			clock-names = "uartclk", "apb_pclk";
 		};
 	};
 
-- 
2.47.2

