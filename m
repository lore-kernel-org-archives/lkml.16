Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A452BCF53;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827630; cv=none; b=A9JVUwFRSTEPO+qL0klLsgrrk4QFuzfudCx7jkeVanmf7gd+vdrE41O2HYJnTFJ9qVYtTxCgp7a8NepTBmDbojFNORFvQtp8CixeKekSxVZGmp1KnDqOY2kDjMPZLQirlkC3wIQhLBBmN6My/4exM8AfaisK++QWwWXO30PdLwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827630; c=relaxed/simple;
	bh=LN8cjqpOaDyXpoTx+s5nUNQjpmBh4i1aA8aGRGhdhXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBhwJKC8grsAqVUy35d8087nkoNCkqRXNj+icvTw1eCgIKYZ59yJOjAmdwnD9F4ygBMIJot84R3FX01d4HcTJrCbkT27/X3FMuXZliWDipL0QEqQtJo8nOC9dOdhID/NqnH22hveSWHClkpv5jTx/qmD5R3w2lh1FJZ59NwcQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sl8F1XFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sl8F1XFt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D1B8C19424;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=LN8cjqpOaDyXpoTx+s5nUNQjpmBh4i1aA8aGRGhdhXI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sl8F1XFtbV8pFkHo74C59Qcmll87xLeRbijKhVGuzfTXwSHTT4zT4G/rfYzR5sO5z
	 2nk6RN/zvMnKyt9Yo94q+dnHQEZoQwaNaphOeCCXVoNcHPizwnkMoReZW02Axxme2i
	 6GugLwdVfxFupMHcYN8vH5p7K6iE5JTL910bMguPKHFiL2IkhS5Va++Z2R6bxHh/LJ
	 73wPhG0f/gtIy06sPVC+8und3UZ9sS6iOvosfjK8Tjwqn9xdwhOrdHizz55mnCvygl
	 Ve5J2CBZrAehSyRn2L1Rv4Mwx1FRZ1rzqHL4/jeqhaLy5weZApovAdWPidZXYiz2vV
	 fZ11Pvm0h9e3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B6BC83F0C;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:06 -0400
Subject: [PATCH 10/11] ARM: dts: lpc18xx: add #address-cell and #szie-cell
 for spi flash controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-10-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=1223;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=WCpBHug6OhCx+F6FwrsLIok14DKpKGEdTCJ2N0cYh2o=;
 b=OJ8NeXc+Sqhu96qL4Qg1+6+w1CRKspkU6ekemGGOFTsHZJWrnMsc2VVMLiLLFD9RhIBJO5ANF
 uSNdZPA0Gv6DTsKnqjNyxLoTmXMYnhG7xuWJ9r0IOSAaXekfJ+jDZLR
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Add #address-cells and #szie-cells for spi flash controller to fix below
CHECK_DTB warning:
arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi:103.23-112.5: Warning (spi_bus_bridge): /soc/spi@40003000: incorrect #address-cells for SPI bus
  also defined at arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts:452.8-479.3
arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi:103.23-112.5: Warning (spi_bus_bridge): /soc/spi@40003000: incorrect #size-cells for SPI bus
  also defined at arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts:452.8-479.3

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
index 0be2486f07173c47bdc9d298a11ac9347f81cf02..d212ca252b06dc97a0cdbe5ecff42780b51a02dd 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
@@ -107,6 +107,8 @@ spifi: spi@40003000 {
 			interrupts = <30>;
 			clocks = <&ccu1 CLK_SPIFI>, <&ccu1 CLK_CPU_SPIFI>;
 			clock-names = "spifi", "reg";
+			#address-cells = <1>;
+			#size-cells = <0>;
 			resets = <&rgu 53>;
 			status = "disabled";
 		};

-- 
2.34.1


