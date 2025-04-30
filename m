Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7A02DC771;
	Wed, 30 Apr 2025 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006123; cv=none; b=Vrh6imdgcR5UGJpaRGtoozQ2oIf2JBCqhPLe3X80bzc1aGlUeCAoL0sSceHnUq81zSrovQNbWbxGDwym1F8PcDZ+U09qt866EqP0NlMr+EVC60bWGCpI+oyvWm/HnDH0YWQ4KfR5y4c36iRz1RYsc4MRHkYjTDYzx069Gha/9Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006123; c=relaxed/simple;
	bh=fzSvUu61XhKjmnGZmVyO0QUaZR+/121r+Z8tAdHf29Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CsAo1KnYWE4m4nU4+K9lqPIUpBRQEL4OV96cz2lIBEI68Zk3gPt6dEKU7sbO8EjUYOn6lfkr/mRFav5CZU/yhWmSsfQISu6T/dN2++Y1TUdDE36GosvEOecFJ9Gu7BkFsXxU9ZS6OzpWYClciU2jxwVGwZu9NGB1bbin1nAH8LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=GD4bpCiv; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="GD4bpCiv"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A2F231FC2D;
	Wed, 30 Apr 2025 11:41:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006119;
	bh=ntln+YOGpHmhFRt+vk8RW2Ng5oNX6WD2cK51HZdX7ck=; h=From:To:Subject;
	b=GD4bpCivljCnPyud/dxbHRcmv3iRa5N2NOk5X+AZ0/LAgNHPPDTQO0+u/u5ZQAUUj
	 X8ySqMlB7gJWLQ26lFyOWLzSuV/wQFPnOPnYY6E2lXCZiUzW6sThDOHuW8gNIPQ834
	 9Xn5zoRMjnN3EsVcKQO+TjzaYwU+kWQQOao3SFMc11O8DEXjV6EVjKKxn0A66wL9tT
	 ar8JqaN5iaLjuMEoj3sluzqPfwRVa/MHOBL/pc88ekepxGahCOSjmb0KEpAfca2JXI
	 bEO6C2c1SbD+jlOpXmXwzNiA6TE0SxvmrVjloPgcg8ReNSKDvgBNWw2Jombmta9EKu
	 dPyMWUR2EZMsA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
Date: Wed, 30 Apr 2025 11:41:47 +0200
Message-Id: <20250430094151.98079-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
References: <20250430094151.98079-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Configure correctly the FAN pwm output (inverted).

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: add r-b peng
---
 .../boot/dts/freescale/imx8mp-toradex-smarc-dev.dts      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index 581f221323b7..55b8c5c14fb4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -3,6 +3,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/pwm/pwm.h>
+
 #include "imx8mp-toradex-smarc.dtsi"
 
 / {
@@ -205,9 +207,14 @@ &i2c6 {
 	status = "okay";
 
 	/* Fan controller */
-	fan@18 {
+	fan_controller: fan@18 {
 		compatible = "ti,amc6821";
 		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
 	};
 
 	/* Current measurement into module VDD */
-- 
2.39.5

