Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769829E11B;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827630; cv=none; b=ZMaqpEeI/Hvnm/w3p8f+z/pj/o46rBpkAFnvoivKWpxS4vP/aRoqnAP/NACp2iYNf81nDjt9SYaOUmow0bw2KswwRTV9TcgGtz5vDbnTYboe7QAv67ycCWRPlpR1Y38ExNHHsAbQhFjjLBiEoyCSkfYhIGBy0HU0mBzDqHrKhvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827630; c=relaxed/simple;
	bh=vvTSyVb1DLt2Kq3tMOfCIFV8bVMc9KjylSFYYgyQ9E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNpw3SxXCT33gHTN9vVzebHkTzu27QZ3UCflzPGGh3ycZUmV5gBwqyEq3Cj8tIAWOIoGFe857fDMIphVl6J6B2WgOvVXaWocf1FGojBqcApUVMcUiZJTEVQ5n7QwNygEwEIHPmd8Y9K+cF8i6wtnreIIYz5XsebNXCDARncMfCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mq797Msb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mq797Msb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34969C16AAE;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=vvTSyVb1DLt2Kq3tMOfCIFV8bVMc9KjylSFYYgyQ9E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mq797MsbomJIgPzIThYzILSa0RhmJvJW6M7DSBtQV0oVDCIEYhVvO9DQCaWzeLoZk
	 jUEZ4315QFBhGGM4r6CV7Izi0GLfeda+G61NHhyFHGD7QKoi9by3El5aMJHf2KfVAk
	 uzQBUv6XcqqIA2ATvZczkWTns8DZX+DgfJOCV0RL0Zju9IClNF7Syv66dXVymoXofR
	 9t1wxvZVMzkursPhY5D+nGIIdc1HfaRBy8k+EWjmWX5fIkZ5YVsjX9K09tI72yF/q7
	 RZp/2qS8NeSFeULrROLmUCe2L3cPMVB5XdYqMvGWjBhWgyLQXCU0vDXemmI/MvRBnx
	 NbWtO5yS0zVMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB1AC83F03;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:05 -0400
Subject: [PATCH 09/11] ARM: dts: lpc4357-myd-lpc4357: change node name
 mdio0 to mdio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-9-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=1000;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=VS6QxcZGgSn5HvNmNyuuSrNEq64C8Es5AmiMzl1zdLo=;
 b=4rX0XHMxOOfRXW4fpgytGVAkbcqD5zWSdAnSlBa6GhhPIEbPyK3TmaGo+4MtCAtwpa72qi5hm
 nQRBAf7Om1tA5f86QTzU1qEk1SqEmJRMBi1Lc2dwFA3IoQzH/bfWwN3
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Change node name mdio0 to mdio to fix below CHECK_DTB warning:
arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: ethernet@40010000 (nxp,lpc1850-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
        from schema $id: http://devicetree.org/schemas/net/nxp,lpc1850-dwmac.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
index ca91bb8f6ada6c4c3e74d4d76a2382f667bd2649..d18f2b2caf687f58fc330d6049e0dc6f3c393f4e 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
@@ -544,7 +544,7 @@ &mac {
 	pinctrl-0 = <&enet_rmii_pins>;
 	phy-handle = <&phy1>;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";

-- 
2.34.1


