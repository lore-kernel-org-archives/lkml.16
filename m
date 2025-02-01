Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35836C2F2;
	Sat,  1 Feb 2025 04:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738384677; cv=none; b=YY1reSbOiqegR03lry+zJsEeDUCW2XyWTcffhrAbbeFYZrOk6eN1apUJN6XbxREBs+wDhu7Y8uka9YjaMsrHypOc3qUlHpRACsISmn4zHsIgXg9mNemac+jWne8qCxaX9TeCWa6jO1U3nLbmIQ1ZD9JLE01BTnqX00CbPDLHOdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738384677; c=relaxed/simple;
	bh=uGRk8WEnP2dxQpPeQLUz+KOsuJ2PkeHqrxzk1MCM5HA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oI33DFhdJY6daTIXsg0/uQFgfaKjSE0ZMIkmaEr/oMp7UjfcngAOy2sgA/V9FnotKWo/+ShfokfasD8LmvIItQrt8edoGKmi4jMUbU4CqY2/JiIaCFCfnQ3XiRSeUU+g0ZUVV2COGmVnTm3VTvlLZzYavntsMM6w+wuIN4OD2g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1te5GP-0000000076H-0inf;
	Sat, 01 Feb 2025 04:37:49 +0000
Date: Sat, 1 Feb 2025 04:37:43 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND] arm64: dts: mediatek: mt7622: readd syscon to pciesys
 node
Message-ID: <98bc223d174c7f544e8f6c4f0caa8fa144f2f4dc.1738384400.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Christian Marangi <ansuelsmth@gmail.com>

The sata node references the pciesys with the property
mediatek,phy-mode and that is used as a syscon to access the pciesys
registers.

Readd the syscon compatible to pciesys node to restore correct
functionality of the SATA interface.

Cc: stable@vger.kernel.org
Co-developed-by: Frank Wunderlich <frank-w@public-files.de>
Fixes: 3ba5a6159434 ("arm64: dts: mediatek: mt7622: fix clock controllers")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Note that the dt-bindings part of the original series has already been
applied with commit 9f7809c6a882 ("dt-bindings: clock: mediatek: add
syscon compatible for mt7622 pciesys").

 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index e3421fd2c0ef..0710b8959ae8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -790,7 +790,7 @@ u2port1: usb-phy@1a0c5000 {
 	};
 
 	pciesys: clock-controller@1a100800 {
-		compatible = "mediatek,mt7622-pciesys";
+		compatible = "mediatek,mt7622-pciesys", "syscon";
 		reg = <0 0x1a100800 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
-- 
2.48.1

