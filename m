Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFE722B598;
	Thu, 29 May 2025 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525713; cv=none; b=t0SmmfpK1k8577Cj+Z3mrgO4AuN1F+FFyjgJAyGEV52AskpQk2+CRW8bLkLgR24qKla9YrxmsgDfBwYD1MS/nX2zEta3hYhSTi8MYBp95mdw2RbOQO0si84rFkhiewgYtbN+PNXaZw8Gmrv5Q/2i8JEymgSiWM+Ar1MXsVayfgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525713; c=relaxed/simple;
	bh=RRvTbjUwRP6Uuz5fWWBJurVlIdgwZlVYZoshFWTv8hI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=efXXkihQ03gMEIBePV/KlaL+HZmBR7B7Y4GYfNwD6ALmipgibrH0NHcLS9d3ZLmP9uWjhVrjJdDWPgsKhHMG3K5MnnOIP35VklB2vhmb2lAuwxmFwaV5g/taL7SuCVcCzYdKPNxZmH06rMjy5nyJC8pX9rCoq17ajZd662VPhxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IAwV4dj2; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IAwV4dj2"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDZ23C2378554;
	Thu, 29 May 2025 08:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525702;
	bh=xewEuLCylugOmuqUPUKm8Asgw99ethqNbgBBVd0Mu10=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IAwV4dj2Y/dW5pc9XgMSP/rGDtPfDbvuPFgr/d1P8YP9d2oBAtpJgnDN4lrn7VDoK
	 iX+Sf0uOkTpJjLnbAhF41z8UCWtE1JK5EzJ3yJVbxRDzmzervafC0BZd5UnFN9+GBn
	 N88yL6awtS6tz71qrxTqrPJp7y9JjdUypMDk6Jjo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDZ2ev064041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:35:02 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:35:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:35:01 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8k1650971;
	Thu, 29 May 2025 08:34:58 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 04/13] arm64: dts: ti: k3-am62-main: Disable "cpsw3g" in the SoC file
Date: Thu, 29 May 2025 19:04:34 +0530
Message-ID: <20250529133443.1252293-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529133443.1252293-1-s-vadapalli@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Following the existing convention of disabling nodes in the SoC file and
enabling only the required ones in the board file, disable "cpsw3g" node.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 9e0b6eee9ac7..3d8650e7c80b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -724,6 +724,8 @@ cpsw3g: ethernet@8000000 {
 		dma-names = "tx0", "tx1", "tx2", "tx3", "tx4", "tx5", "tx6",
 			    "tx7", "rx";
 
+		status = "disabled";
+
 		ethernet-ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.34.1

