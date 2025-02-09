Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F8833987;
	Sun,  9 Feb 2025 08:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739089082; cv=none; b=sVMS3BGZ6uS5C4D6u8tSnthq6XsBDSCjt1JAIVIYVjwrSEbDeV3rDh4vsO+OFDb0hIx2AqvI/rEIhoHsjgozF9FJPi/n2SukyUFtMcPRyCLap/beuesT0ut0SK/QBXsT7DaeESYY4sfBJIK3z49dGOI6HWKCEGLR2HR6ej6dB08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739089082; c=relaxed/simple;
	bh=zDii9JnOY6drzP/ik5ujsV1h46bP+EmqqJW0uf2LR4o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E0zpfrt0lOTdOYlpDE3a0BLIPNpXmZB1grHH7ADtU+vbWQve7T3/vTuW79WPjduJfdAJoJ3iHZamDCK3ZypvWufKL49GqampvRHkxMpj9eNSyZlATJpq77Z2qOt5DJJHdUx5J3Yv4lgz13wJTY6LU75aOsm2iKyu/WBmhdEenOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eA4RvMBf; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eA4RvMBf"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5198Hoon3211703
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Feb 2025 02:17:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739089070;
	bh=YTpHK6EocecJt+2gPnCi/fOd1SBr1RBHfu2IhB1fT5Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eA4RvMBf3RxTEYGo8DtdMdPkb2rSI6mHnlz1CS6Zv+ZIb122emzRQXgyZ9Z0xuzPb
	 nBGr1oaFGfktzBN9uVS5jK53ZfEfuqa6rAWvu/e3C7zJhlhwsAisQ2TMS6O1XdpxbP
	 5boEx8ZFBDs29CQCJx2alIIHJ/Oh+fazYV8vl8ks=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5198HoL8045818
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 9 Feb 2025 02:17:50 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 9
 Feb 2025 02:17:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 9 Feb 2025 02:17:49 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5198HciU083866;
	Sun, 9 Feb 2025 02:17:46 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-j721e-sk: Add boot phase tag to SERDES3
Date: Sun, 9 Feb 2025 13:47:33 +0530
Message-ID: <20250209081738.1874749-3-s-vadapalli@ti.com>
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
Since the USB Type-C interface on the J721E-SK is connected to USB0 via
SERDES3, supporting USB DFU boot requires SERDES3 link associated with
USB0 to be functional at all stages of the USB DFU boot process. Thus,
add the "bootph-all" boot phase tag to "serdes3_usb_link" device-tree node.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 69b3d1ed8a21..440ef57be294 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -1040,6 +1040,7 @@ serdes3_usb_link: phy@0 {
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
 		resets = <&serdes_wiz3 1>, <&serdes_wiz3 2>;
+		bootph-all;
 	};
 };
 
-- 
2.43.0

