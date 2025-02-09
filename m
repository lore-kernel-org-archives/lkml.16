Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3DA13AD05;
	Sun,  9 Feb 2025 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739089080; cv=none; b=h+WykPhZpmmZ2cwyUeY1sofLKF4e3VBDz5gpOLunZAwFG+oD4QHi/phzFPQBrqh5jBEK03MGaxBjM9xapxrlvfTlTcn6AyXku5BRdpyuoGEPPjKdwZ2l/Iq52aLqxjJN3tPVbTYSxHPiHoucsi69fraApkTBhL6Si47/tSO6luo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739089080; c=relaxed/simple;
	bh=W/Jp0eVvXA6vF19uRVLVMz4J0BGcbUz3285Kgg8Tcr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ncbs/uZlIjsxXczjkUmAHXb/1WgW8Fm0lhKC9t8IdrDcqxPcyQNiYYsDZG3UMuaALPnQ0oNZ8uFDOKQ9jVpsi++iL672OW3Xng+Pt2fpQGZUhgFXmXPrJgjo4F+jR0fQuuDYi56jnMCOv7s2+EG/dU7OP0JqjcrwDMMfvkeA88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WnWqrAqr; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WnWqrAqr"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5198Hk3K3211691
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Feb 2025 02:17:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739089066;
	bh=euXuTkju0OPAsAr+EKUqdoMAYnLddo63qQiyM5gI5Go=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WnWqrAqrow1oXRUd6ILiAKBjWOCkqzLOPtqdFY5nv8Gu3qIF2hYa7w43bDQZWmCBo
	 wDKLanSOFERFJrlgdsAniSaj+USH/PI6ztqp4pRfc4pn46vBsdaplNoC3qdWpC1zko
	 MAkQpoUCwCCGg4ejf1NRrse5pOOWMwVosY5nV47A=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5198HkU8024725
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 9 Feb 2025 02:17:46 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 9
 Feb 2025 02:17:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 9 Feb 2025 02:17:46 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5198HciT083866;
	Sun, 9 Feb 2025 02:17:43 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-j721e-common-proc-board: Add boot phase tag to SERDES3
Date: Sun, 9 Feb 2025 13:47:32 +0530
Message-ID: <20250209081738.1874749-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209081738.1874749-1-s-vadapalli@ti.com>
References: <20250209081738.1874749-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The USB0 instance of USB on J721E SoC can be used for USB DFU boot.
Since the USB Type-C interface on the J721E-EVM is connected to USB0 via
SERDES3, supporting USB DFU boot requires SERDES3 link associated with
USB0 to be functional at all stages of the USB DFU boot process. Thus,
add the "bootph-all" boot phase tag to "serdes3_usb_link" device-tree node.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 4c1e02a4e7a2..4421852161dd 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -540,6 +540,7 @@ serdes3_usb_link: phy@0 {
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
 		resets = <&serdes_wiz3 1>, <&serdes_wiz3 2>;
+		bootph-all;
 	};
 };
 
-- 
2.43.0

