Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F21C267722;
	Mon, 14 Apr 2025 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625576; cv=none; b=I26KbkNEWJWfl54aT0fvlOcb9IyGbmTVmG6SX6pKEc2FY/vqGUOXZsFHrP6iZXFeOb7BQ73wpzn8mpn+SCgBAX7tIzWBO/3Ca7IrWFN3FPl3aBMsQ8LKfywrLcYmIa43cekLl/17nguuEvbm6X/VZsgknr69HyhvRcdKu+Y8/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625576; c=relaxed/simple;
	bh=h91kvtbHybCRq0mtV86D3bylhFUe+/Vc/2PFX8biaKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVu6dO0JuKoIk1mKU7KvZdu9oJA0SSL5sF/39R0ihOkl2olopaN4adCotNRdeKushpduNrUhOIo5/FVGU6eULEvVA22FKXuaADXJELkuYQ7uWbV9USHb+ChFPc0pR6ZvIt/RFQTzRlW6mBr1XrRlwYuYLGwpEli4gMTRcK04XY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfijaWJT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfijaWJT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BE96C4CEEF;
	Mon, 14 Apr 2025 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744625576;
	bh=h91kvtbHybCRq0mtV86D3bylhFUe+/Vc/2PFX8biaKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BfijaWJTU4q0BV4MwPkaPrZm82mtAYyUa7UyRcxO0p03GMJOMgnzEBJ67BB2+aXiN
	 wJDo2di/IEL1InRahYszkLgeyin1GZV9p+7ZTe/vWF6mdRa2guIPtjxcpTCHKqmXOe
	 K6iH5uSzqwjcJ9PAV6ysa3YSmQqs3WqyYzqpG/aWgRDFGW5PYY8oX1osQ1VPDTJFEw
	 rN04Pr8aE3NcfqXWA497XLhpbwDjceE3kp9DFjED59BlOu1lZxpaapLDV1GmofWyLp
	 HbiXohTwn0Io6a/nq+3+rFGEWTxFLkx0XnwaLxSgmuC5KsMeUB+MuU/RXED2+wLceU
	 HMcTESji78Azg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC774C369B8;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 18:12:33 +0800
Subject: [PATCH v2 6/7] arm64: dts: amlogic: C3: Add clk-measure controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-clk-measure-v2-6-65077690053a@amlogic.com>
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
In-Reply-To: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744625573; l=777;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=RawVLe8oduTQK4vrDANIUMhpJtp0oGlCVlxkPVdHe1c=;
 b=3xweDT1QpTKyZLFyATVKjOvY8gWyeBw2Icep1hGvtVtfCGF6p50LPTNw3y7UlQbbexbA9u9GP
 ILoTEzuk94sAmzqn2xZU5w1seUpKGYz7UvEXkXOzYlpnZr968zz1ZXg
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for C3 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index fd0e557eba06..cb9ea3ca6ee0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -760,6 +760,11 @@ internal_ephy: ethernet_phy@8 {
 				};
 			};
 
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,c3-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			spicc0: spi@50000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x50000 0x0 0x44>;

-- 
2.42.0


