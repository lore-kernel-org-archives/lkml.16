Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B455222F155;
	Thu, 29 May 2025 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525734; cv=none; b=J1bIRyTorUb4gEr0kHOSxuanl99AQlIN1WiJB48duTCqw983d9kbK8qZfpyv1ozgjmtqCHV2PL5zipt4lisBG4FFJzgoEI51d3GbynznSORWMa4fR55kI9ZADt76cdb2HDnmllVSlXQyBWLDFrBSJCfAed94Pt5UlwtmVFp3Bos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525734; c=relaxed/simple;
	bh=hiUmzvR9wd21wMIX4TneN1+10ZETZbFZZPtISiaR700=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=al7cPaW9SWRmBNR6M/SMtc0IKU2xMkqhTU9fyE9Q45H0/sqRo5teUudqZ8mWOwivwcZ0fezvbZB8YX/M2syBVWztpLQ+x/9zU5gmC1CBOmNEL/3RX9D3pJnlvlRKz6ZMLmUzgjyc5wXDbB4RxUNPfrAHtkJbgaQn6412nvwEFs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GAINMXc0; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GAINMXc0"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDZNgP3591405;
	Thu, 29 May 2025 08:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525723;
	bh=pukPZy5VoqX0TJ034jS2scg1gi0D3AIKIU4vdYHqhGg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GAINMXc0q+1mt8MDgvT7FucLD0kEiRwNApx0M8xC//25VS0jUELtoEj7d78tZmnBP
	 oVMsnEXaT+PL2VRjY5y+8DfhGMXZaHOcHnZHYx7otC0RXKHWvkl+k5E47m4Rd5wONV
	 a+nzpy0rAVaTzNUvErbJ3Uy45o0MhJ6mHNwPPwNM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDZNLB2202152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:35:23 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:35:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:35:22 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8q1650971;
	Thu, 29 May 2025 08:35:19 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 10/13] arm64: dts: ti: k3-j721e-common-proc-board: Enable "mcu_cpsw" in board file
Date: Thu, 29 May 2025 19:04:40 +0530
Message-ID: <20250529133443.1252293-11-s-vadapalli@ti.com>
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
namely "k3-j721e-mcu-wakeup.dtsi", enable it in the board file.

The motivation for this change is that of following the existing convention
of disabling nodes in the SoC file and only enabling the required ones in
the board file.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 45311438315f..eda85dafb794 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -767,6 +767,7 @@ exp5: gpio@20 {
 };
 
 &mcu_cpsw {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
 };
-- 
2.34.1

