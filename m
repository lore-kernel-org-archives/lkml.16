Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2426A09A;
	Thu, 22 May 2025 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903161; cv=none; b=QvgIOEKb2AyPUbGYy/FNROWq/zIsRFWM+pDPNFXQ0i1oYnjygN7CT8P7ad3WSMOWV8aheeJtat6dUor3YYWz+xTZ4/n7r3HA24NmGmgVmgOKlkBxzETZ6n5AgcY3EP0rGsk9IB614tuRll8YUhOQoyknFk6BJm+qdAUky0Ejktg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903161; c=relaxed/simple;
	bh=drGghC6fyZWPfYsXy/tIQNNs2+hKaFh+d1O1GD2VR5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AVBXfDiN0Lt72/qKcIT8rsmpU3VViThbhT0PyXyaPZkb/P4HGFqXo0Y3T9YDyzh6Q2KDyczcCy9zxNh+AmsmHS8vsJIMm5MJCES6RtGOkO1OAdbX0fBqfAH1IgBu3eDJJyZtNqFs5ZTf75aBkoTkDdy/qLmMXnrtrjZtmj6As50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=UgGNWeZA; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="UgGNWeZA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=y1tumSsdxB5rVlaLhQ3GtnGPbyT38MnzhSRbONBT5I0=; b=UgGNWeZAbrXKx832upDTd3kGsK
	tYqgud2bWULbhrUskJAUwwjI191ut1X/EWmTXglWi0B9brije3+dkvFzFzjnsvmNSeBnq5N5Rostv
	DoP4NF8rPsh3r3zY95QzIgUcK/zaTLv57SkhUdgI6SI9zD5gbYDkLJoS30RudJvNUYlTrC75RI6gp
	ew1cadwR7IsVnprnhGp3kCrcsWg1ke4brhjWRP/n93PhwrUb9ZTOdZd3VWXzwJ1L1Sm4Seuqd7I0f
	rhiUf/EiwuLpV4vuR3n8Rkg6/KGd3US/87oE9Y3ELppTGPO8Vr9lgwA6FZCbPLU+MwOrg5vwH8SVJ
	Kvw0eXcQ==;
Received: from [89.212.21.243] (port=51574 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uI1SI-002sBQ-1B;
	Thu, 22 May 2025 10:39:09 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/2] arm64: dts: freescale: imx93-phycore-som: Move ethernet0 alias to SoM
Date: Thu, 22 May 2025 10:39:08 +0200
Message-Id: <20250522083909.533567-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Move alias for ethernet0 interface to the phyCORE-i.MX93 SoM include
file. The reason behind it is that the physical location of the PHY chip
connected to FEC interface is on the SoM itself and alias thus belongs
into the SoM device-tree. Consequently, it can be used by all boards
based on the phyCORE-i.MX93 SoM (phyBOARD-Segin and phyBOARD-Nash).

This also enables us to mark FEC interface as the primary / first for
networking in the bootloader and systemd (predictable interface names).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts | 1 -
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi  | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index 7e9d031a2f0e..e1c9aa77c000 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -18,7 +18,6 @@ / {
 		     "fsl,imx93";
 
 	aliases {
-		ethernet0 = &fec;
 		ethernet1 = &eqos;
 		rtc0 = &i2c_rtc;
 		rtc1 = &bbnsm_rtc;
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 22dbcc89e311..0ea61841e591 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -16,6 +16,10 @@ /{
 	model = "PHYTEC phyCORE-i.MX93";
 	compatible = "phytec,imx93-phycore-som", "fsl,imx93";
 
+	aliases {
+		ethernet0 = &fec;
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;
-- 
2.34.1

