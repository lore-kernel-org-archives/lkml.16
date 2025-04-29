Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A948B2BEC56;
	Tue, 29 Apr 2025 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926299; cv=none; b=ruI/dsuuV9WTkSgtPmc/qWGGo6EjeDl55EGCWa3YfNqi6km6p2Ap/JePhA7xkaK+MbG35AroUVx3yc2op6793VwI+va7trdQrJXqAAi3u/vVrse66UZpNfDrpObmiej7CbynNZdTv/11yWNzRXn9gVF5amZQKOFA94mn0UIovrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926299; c=relaxed/simple;
	bh=oaJ7TjpgRNuSgf+4VawYb0Jg3+12Ifv5bgeoTX7QoNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VysIMEuPFv0sI0pDV10pFMhjELLxkZ2eqQ2KqeUo97JexPlcDUi7d8fuym952ubFRDyNBHpEZ3bpq8pUmXpG8ol9g6vFZyV9+5rhqljGYLZYYplYbHckZAJwt1jrC1SIqOpPQft/HbWEVie3PYHhmuH9eAysMBqSKUqSq9iG7uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=WfF4t72M; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="WfF4t72M"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4946E1F980;
	Tue, 29 Apr 2025 13:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745926288;
	bh=PokJSTOG5zd/anxcd7uUPUPOQ4Vx+sK8YVmDh339/pY=; h=From:To:Subject;
	b=WfF4t72MyB0RQPREbaMmZFNQZfzj8tZA3cxe/ZJIFfmGU+/sALtXegLHgSTFGvjEy
	 bdt0k+2FVdhUV+vv8xLzzxWRS+9JsNJV1eL1/gLORKCMwxRAQz2LBboGH4WTk8tTlq
	 nESJ99jgT8Er6u3L0uutpjfaQofOR3WzK37hLNG9p3FvsbJmZV4laE8jDIj9khNcg4
	 iMViZfj7I5SLBTq1Rasi/b53ptQ0LOMRKe7qnUa3oRBG73zui2TwBdDZmOifDam3q6
	 fsqxonpsl5EZqPu+Yl0M9ElaeJH7pYoX7EQVHvyImWtLHBZHFc2cn67ClyUJCEPl5d
	 hWMBae0VEmL4A==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
Date: Tue, 29 Apr 2025 13:31:16 +0200
Message-Id: <20250429113119.124427-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429113119.124427-1-francesco@dolcini.it>
References: <20250429113119.124427-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Configure correctly the FAN pwm output (inverted).

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
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

