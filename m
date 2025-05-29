Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F4F2110;
	Thu, 29 May 2025 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525701; cv=none; b=oVZTc+k0O2cqh7xMBc5/gbOb9CQlLo0UCFtNw4nxMqbKFjmjj2dgltmdZhYA09NXKXWWPqQIQ3V3teqQykUWMkQ7HopDNv6vjdHBFNqoy6tyvveXO+0uifiG1i/igcYoXaTzkx2bcFkbURuPLIylisDE/4tZaOIaYNkypqkxJNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525701; c=relaxed/simple;
	bh=oLAYltQ5k4BGZSmpZFs+aEaNdsULyCL4N3ciy4MA5q8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dMNUGvU124FKtt67UREj25i5gNib5LDJ/kcFskjcfQWBoVabCF/IDDX2jq96QqJG3B12BiPxk1KRBx1svVyXec6jhY7jcdZvfIVhB+uEmMwz/+enmxiGDXnHhTmVA2tmH7a1lO16C69c8O0Mu+tI82L7ndsLmq+KX/38O6qwLgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Qf1R6XDE; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Qf1R6XDE"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDYtae2407049;
	Thu, 29 May 2025 08:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525695;
	bh=V8qlacFfGBNxkk5act1sUfB5rBAj+y20pwNN9ewBtqg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Qf1R6XDE2/1E7jMA5s7kqZlFrubC5LReE2QWofmtHvl80QEH6A0tvmUPD8QFN/nxf
	 xgM+vXHI5vgtCaZUOFmUXKr2IwphODqmqiYPSunvJdHqh14WFo6+3S32gDE1DpnRMT
	 iIQRF+4DfqSiD1Uga16JyuQ7l1zUBEZkruStYxbc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDYtS9180005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:34:55 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:34:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:34:54 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8i1650971;
	Thu, 29 May 2025 08:34:51 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 02/13] arm64: dts: ti: k3-am62-lp-sk: Enable "cpsw3g" in the board file
Date: Thu, 29 May 2025 19:04:32 +0530
Message-ID: <20250529133443.1252293-3-s-vadapalli@ti.com>
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
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index aafdb90c0eb7..cec77fba24e6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -149,6 +149,10 @@ &sdhci1 {
 	vqmmc-supply = <&vddshv_sdio>;
 };
 
+&cpsw3g {
+	status = "okay";
+};
+
 &cpsw_port2 {
 	status = "disabled";
 };
-- 
2.34.1

