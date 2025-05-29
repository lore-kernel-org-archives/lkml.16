Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990C7229B16;
	Thu, 29 May 2025 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525705; cv=none; b=QIXqQaTKHWAHoFbavTn/SU5MfQgo557IXKVmNnyn3X6lCU7qxfP1MqyFUmrU/SCJ7pgprC+85dRiILnDQVZOch7BpB5NhbziN3eFmgxRY4h/W87kIdHXj8y5+uuji+5EZlQ2M3faxflrCo7CltV1qxsbvrHcHtrZGv54uhpWm8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525705; c=relaxed/simple;
	bh=ZjPypbUo/gbj0R/7ow+Akp8KWWfhLRphMWIMRsbT1hs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QVsSYiDIstNq55eIkfsQ28DT/w4usm0rZiVRNX+Z33D/96ptCnzobD5T3gcovEkSTwG7ALUFTRPCRq+AuCQCSqnNB5M9coI01JCtw8iHZSidICeN3P7Ud8n6gECUNwDdejq93c6UZ7Pp9hVOHXyvuHSNONoaM1c8fkEbpFEizIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EUpmVPhP; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EUpmVPhP"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDYw9x2407053;
	Thu, 29 May 2025 08:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525698;
	bh=R6Ke6TQMJrIPkLJIi5JmxYTaZtcYoSq6WZNd77NEz9U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EUpmVPhPAWYJhpXsg9fRTKgU66ellwSPr/TNmyxzj4LlmWS4BqiEj3UXhhYm896li
	 AmDLE3Kp9mdev2XqANDz5MrioaXTNQAK11HiIXzhJAHZqFsWPUPLoXB1FxsTyz7a+d
	 Nbbltq5ZIlVMGYPA48PtsxUOgVzM7z/+ZnyajPGM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDYwAm063975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:34:58 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:34:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:34:58 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8j1650971;
	Thu, 29 May 2025 08:34:55 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 03/13] arm64: dts: ti: k3-am625-sk: Enable "cpsw3g" in the board file
Date: Thu, 29 May 2025 19:04:33 +0530
Message-ID: <20250529133443.1252293-4-s-vadapalli@ti.com>
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

In preparation for disabling "cpsw3g" device-tree node in the SoC file,
namely "k3-am62-main.dtsi", enable it in the board file. The motivation
for this change is that of following the existing convention of disabling
nodes in the SoC file and only enabling the required ones in the board
file.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index 2fbfa3719345..9c2258dfd08d 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -201,6 +201,7 @@ &sdhci1 {
 };
 
 &cpsw3g {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_rgmii1_pins_default>, <&main_rgmii2_pins_default>;
 };
-- 
2.34.1

