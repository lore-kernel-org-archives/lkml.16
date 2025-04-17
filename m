Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226F523AD;
	Thu, 17 Apr 2025 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877742; cv=none; b=M8r9WYdtkDLH++DyaxnRVcy5I46tY2BfLwljuOVH9JVKQMkTfBgZ6/tyxChYmRbIsbGj7KRBnAdYQP8IFXoNY7Q84waBsceFNXTyt8OqgRBPB71IPJxpqouzJjhi0yfFl0FvsISjblwfe5W9SmfLmWtqVAt3jL+4ZhIgXHaDUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877742; c=relaxed/simple;
	bh=bn7qdLHjpjUpxFpYyWM5B5ZbrSKSWf2Plz00LtQaGdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHIWjLl6vkru7xnXVgtJpFkIuqZ5D5J4RsyEih0PMGpQszLbnwxyPo6N5IhlErOm00pru9lflxX3wpfyWnlHyjUYtZAXjJynuzjXDgw+gUV+QRf9HiVjOvZzZSGfhLBoaUBcP1icQm+y6G9rKoQq+2NaYfWFAf9nsqyW7xiQtuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=NH1Zpqg2; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=HeF5QlDw reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="NH1Zpqg2";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HeF5QlDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744877738; x=1776413738;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OUfdnwQK75xEOyLEAX2T30UB5/q9/2vSMT4xlE66UAY=;
  b=NH1Zpqg22IWgyCzTHWoJUIM9zApygv+BUP39C3P5Pwwbl4wBEtmJWvoM
   XED0ZdWliu63DuOcxaKwoYIBTw4ZFYRjSL8KusYAtvJM4V6kdXM09ZGzL
   GXwCxvcB6DZTruLNyjFJ4rtVB7y/uhM+36lXBZsVPvjV25Tm3wMtHYos4
   /oPC2bv4bIk8lNOT7rJ9FD/3nTiXaHW9eOYEIVj0CHuuzAXDWfPqOzo8P
   VyPZQf9RXuz+3LlOnRUUmZjqpfoD7txVnSubp9G6FctiWM9e/gU8O4GKK
   tj64WG8/39M2HP9D3+VU2LFCz3nZ4aTIrOHHeUqcRY364kDonZvS7/vhC
   Q==;
X-CSE-ConnectionGUID: XLCD0ENZRx6bO9HNeywYxg==
X-CSE-MsgGUID: zxdC4JQvQT+UyZB3RB/1oA==
X-IronPort-AV: E=Sophos;i="6.15,218,1739833200"; 
   d="scan'208";a="43587413"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Apr 2025 10:15:35 +0200
X-CheckPoint: {6800B8A7-10-903EAEAC-E04C76C8}
X-MAIL-CPID: EE051AB59F033E25D47D34B959E4ACC2_5
X-Control-Analysis: str=0001.0A006377.6800B8A2.00B1,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5177616CEA0;
	Thu, 17 Apr 2025 10:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744877731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OUfdnwQK75xEOyLEAX2T30UB5/q9/2vSMT4xlE66UAY=;
	b=HeF5QlDwg56iwpNFx3JZmcmovkaABpbjxwOmRGPbJrM6ifMbepCmrDe/PffvC/tx2kPINi
	6sR4pbhBVtnUldBrJ8uai6rcU+745Mo0rn4DO4jul4dxiprZqxTdF8DYcdWs2jXgG7Nc1h
	LfXXgN9JO4YsPdEquktyiOkg0fLK1Neo3/tfEnH+2IYY/NsJWXtYgYLN4ii7Iffdv3VJQx
	WLxFekE38EG4d8UAXwp/tqxlgdGxXnEmQCT8LvTqpLNrCnGvmJrD4u2pqLOCwvnPECaWuD
	rMVwFVTX4MSDhmju2prPgSnjcIs0/Il4ciGcI8WSUXuwvriJqXefdbdMceXrFA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] Revert "arm64: dts: imx93-tqma9352-mba93xxca: enable Open Drain for MDIO"
Date: Thu, 17 Apr 2025 10:15:19 +0200
Message-ID: <20250417081522.1145586-1-alexander.stein@ew.tq-group.com>
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

This reverts commit 9015397c2f2d9d327c0cf88d74e39c4858cb4912.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 1ff2754255fa7..994be4e649343 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -649,8 +649,8 @@ pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			/* PD | FSEL_2 | DSE X4 */
 			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x51e
-			/* SION | HYS | ODE | FSEL_2 | DSE X4 */
-			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x4000191e
+			/* SION | HYS | FSEL_2 | DSE X4 */
+			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x4000111e
 			/* HYS | FSEL_0 | DSE no drive */
 			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1000
 			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1000
@@ -681,8 +681,8 @@ pinctrl_fec: fecgrp {
 		fsl,pins = <
 			/* PD | FSEL_2 | DSE X4 */
 			MX93_PAD_ENET2_MDC__ENET1_MDC			0x51e
-			/* SION | HYS | ODE | FSEL_2 | DSE X4 */
-			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000191e
+			/* SION | HYS | FSEL_2 | DSE X4 */
+			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000111e
 			/* HYS | FSEL_0 | DSE no drive */
 			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x1000
 			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x1000
-- 
2.43.0

