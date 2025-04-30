Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEA6214223;
	Wed, 30 Apr 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001148; cv=none; b=acYY4sHtB3HnQZ3zmEjdz5SpP1Qt7JsZe2G9R1TofWZ/S6INKEFYxsSPxnEZs1vymVJHWAzf1AQLCe8ovn/GL92yqFexLqy8g0IuNVZRJrEip+PuVkNBaQdIYofK1TPHB9GNRDhWcYvpzOcvVxcgpHnT2sBOcWGP/LubMX//jew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001148; c=relaxed/simple;
	bh=sTjbLQMlvsQU8MCU4Zm2+0SCHO2CLBc/KryUeqrfJGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VEjuAUn94BfCdLBDVK1qW7ixFlktA27peItSVCiz5YkZbDIS1m43VvcVgsHd6Urm3/MAsrInqe0OgLtTRqXe+zw4SQ91xqvmLZY45D1FyNf7jSso6deelZbnfU4hyMN0OZrJTs8TZohnDaM/Ys9MsARGnCTtN1Rp+tl9LvXRX9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=aIIKwMKt; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=O8XjPnyO reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="aIIKwMKt";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="O8XjPnyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746001144; x=1777537144;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mbemR3oRuGkOlc8+6KEUCkxK1UqOaYyGU6dV0XOH8fg=;
  b=aIIKwMKt4WinFKsIlfedXMUThqd9vCRKsHJHnaDVvDaOarQlPen/BGcX
   pxWZJtaD19TFWygEQShx8VKIvoCughsJCfgcTl0XjsG61r4QIMlpA9LbK
   Xv4Vb3XCocyh6nHj4iYSq9btUkdR6YgTsWBRJOUubMIJO55wPzjHXV9d7
   FyOZYPjcd/6o+7vGFsO8hWzER7j9ScMAjX1fEUsB0lQD4MjhX8/ID1cwO
   jNEDMTvoNbzFtdkXqMjS2UISR+Q00wlO8fH30gQiMtYoT8JTi/V5goZsa
   oqGD++erVRg0zfzJRc1L5Vpq3xpBjZlbT3e9u/MIfyUEL7ayI5hkRj0qv
   g==;
X-CSE-ConnectionGUID: 6qH8UY+5Sy2M7Jco+pwx5g==
X-CSE-MsgGUID: a+PXonWyRzK3RnDABjbb0A==
X-IronPort-AV: E=Sophos;i="6.15,251,1739833200"; 
   d="scan'208";a="43802161"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Apr 2025 10:19:01 +0200
X-CheckPoint: {6811DCF5-1B-45F3AE15-E90F7DFA}
X-MAIL-CPID: 31B617226BF72FB254ACD175EC0ED1A2_5
X-Control-Analysis: str=0001.0A006397.6811DCF5.008E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABBED16B2E9;
	Wed, 30 Apr 2025 10:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746001137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mbemR3oRuGkOlc8+6KEUCkxK1UqOaYyGU6dV0XOH8fg=;
	b=O8XjPnyOZz8llZYysGi4ehzwo8TryFjKtx9AElVXO+m2gx/EDndaMOcEgt5ZCIKFEiim4D
	9lsPUmhfUL4Yx+lW7yvt0bmsh0KehJpCkuA+1mEJ2+nSfeDlgkARuRKjyiKux3e8RQIULT
	4XFdxgHOxlljC+uKWBm7lM9gPPmlRb3TliVctEJe+Qa4+N/w9KbM9JcNgSXw4c13ndAN0U
	8gOMUlLo1mJ9GQa8dXUIPDDoZ9zPOr+TgkF7tg/+sDiCgUP1NkbImNNxVb937dr8uTYmln
	Ke8Ynht3QJhsVDg6LyFAetj7bQJXLmuWNk3j5VzPmr2nN9v4Ig/gGx3Ta6c92g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: imx93-tqma9352-mba91xxca: disable Open Drain for MDIO
Date: Wed, 30 Apr 2025 10:18:48 +0200
Message-ID: <20250430081849.1827688-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Using the MDIO pins with Open Drain causes spec violations of the
signals. Revert the changes.
This is similar to commit 14e66e4b13221 ("Revert "arm64: dts:
imx93-tqma9352-mba93xxca: enable Open Drain for MDIO"")

Fixes: e5bc07026f94 ("arm64: add initial device tree for TQMa93xx/MBa91xxCA")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
index 7b78faa4bfd09..9dbf41cf394bf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
@@ -571,7 +571,7 @@ pinctrl_eqos: eqosgrp {
 		fsl,pins = /* PD | FSEL_2 | DSE X4 */
 			   <MX93_PAD_ENET1_MDC__ENET_QOS_MDC				0x51e>,
 			   /* SION | HYS | ODE | FSEL_2 | DSE X4 */
-			   <MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO				0x4000191e>,
+			   <MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO				0x4000111e>,
 			   /* HYS | FSEL_0 | DSE no drive */
 			   <MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1000>,
 			   <MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1000>,
@@ -599,7 +599,7 @@ pinctrl_fec: fecgrp {
 		fsl,pins = /* PD | FSEL_2 | DSE X4 */
 			   <MX93_PAD_ENET2_MDC__ENET1_MDC			0x51e>,
 			   /* SION | HYS | ODE | FSEL_2 | DSE X4 */
-			   <MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000191e>,
+			   <MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000111e>,
 			   /* HYS | FSEL_0 | DSE no drive */
 			   <MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0			0x1000>,
 			   <MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1			0x1000>,
-- 
2.43.0

