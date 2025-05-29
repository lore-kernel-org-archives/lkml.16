Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A48C22F395;
	Thu, 29 May 2025 13:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525735; cv=none; b=K6XQ1b3ZO1MNiaiv1Ns9e8cgf4f058wKtyzv45eX1DUD1mwQxT1R/iPNVbAvWIRgT4eSyGbXxRs5yfPDUfjBT2svrxxywhLYO2iP4QJHrq2tB78bwjJH1lwMBoOuyi9lQmRO92WZr7OhiPRPFvJD4axpzH/9lrt8IcSO7PRbG80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525735; c=relaxed/simple;
	bh=Jl8jKgyvmUwie2oJ+xaaceBpOSdi6hsNCsuZP3TDpVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNy64ztD1S62Bsrp5TnXUahVonSgT5sVFUbXFnrVcR68GEpUknEUADTQVEqHZpYRPiIFkECk6xGaPBLnpyxl9OONoAIeHqL5Ivcx+i0gGxYKLp5bjuyqs3P1JoLP7AfB+nxpWJ2flHifDhQy6VNTTIpeG7IvjniwUBQhO15uGtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RrlRSEJ+; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RrlRSEJ+"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDZUem3591417;
	Thu, 29 May 2025 08:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525730;
	bh=Hcaf0i1yzSnlXG0VMMe4a71gA+Cd90Mc4SySd7/rJBY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RrlRSEJ+s1PlrKUjakvJMGsJ0wRfuBt72A3wyQ/9l7LxSGD4EIqH3YD5Ej44wXzSy
	 TdahktdyAs8Ir8ro1QD1VMxglsvKZCo4BUOTM65zYRy21yoFrpsJ3vOqYsF67zuGJc
	 4tFtfZBjDkCTD38hRvaYx3QWyKfiVHDqWeuSmLb4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDZUnm180349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:35:30 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:35:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:35:29 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8s1650971;
	Thu, 29 May 2025 08:35:26 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 12/13] arm64: dts: ti: k3-j721s2-common-proc-board: Enable "mcu_cpsw" in board file
Date: Thu, 29 May 2025 19:04:42 +0530
Message-ID: <20250529133443.1252293-13-s-vadapalli@ti.com>
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

In preparation for disabling "mcu_cpsw" device-tree node in the SoC file,
namely "k3-j721s2-mcu-wakeup.dtsi", enable it in the board file.

The motivation for this change is that of following the existing convention
of disabling nodes in the SoC file and only enabling the required ones in
the board file.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index e2fc1288ed07..a482b3ad5095 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -409,6 +409,7 @@ &main_sdhci1 {
 };
 
 &mcu_cpsw {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
 };
-- 
2.34.1

