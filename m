Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4811C3F36;
	Thu, 29 May 2025 13:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525700; cv=none; b=mSfXBg2caYJze8CqAuUrQXNRt8EfroBf6UJo9oqU24XYol6Ue3UItaXxQ/yxEntTypiPZ0NHSj2P3hRTR/1MaOg7jv96tgpYkav+nTcDquwSJclKgXJg49iZU52FO0KGgR7A4f8RK9cO4oH6/hL5wiTmYjH2AFMED2xs7aFpq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525700; c=relaxed/simple;
	bh=vaOZMCvLCmBp6mhm9kcgj12R05vDdhdjK/O0apb5kVI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B771snGtrGOeYWkSDBB4NgLWNR3A3e6gAxhH5HGMLDDeZFAshdPLcuTaT6MV771BmtMLsWof/h6eQAqL9XrDumefCIK35Tr1a0KgWWNRpiP6qGqgd/td7YnD9r9Bkq/1N3WyCFQy/6fKpflejhaE2xNqtQ17Nw3WObmLWgojYss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fMK3zD1I; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fMK3zD1I"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDYpYQ2407009;
	Thu, 29 May 2025 08:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525691;
	bh=CMupLjWd2gTIRNUkkhAjmLP4EX857cqSjwQTFVZ2qhI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fMK3zD1IP7KzaJX1n0elp8xIOHfHYe5nBrUhElxCirsCpcf7ffTUQbG1MmyrfIxyt
	 luD3/B5pD3U6svw3wZiVvCaX+FPNwB/69bnbYOzMUUulP6NIgN3ecMK5eyC4iNgNPn
	 lkUCfC/qDyHsXblCd2KL9yp4dCxXx93IPB7HA2H0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDYpj7063926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:34:51 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:34:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:34:51 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8h1650971;
	Thu, 29 May 2025 08:34:48 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 01/13] arm64: dts: ti: k3-am625-beagleplay: Enable "cpsw3g" in the board file
Date: Thu, 29 May 2025 19:04:31 +0530
Message-ID: <20250529133443.1252293-2-s-vadapalli@ti.com>
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
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 72b09f9c69d8..999f5baaba1a 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -585,6 +585,7 @@ &usb1 {
 };
 
 &cpsw3g {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii1_pins_default>, <&spe_pins_default>,
 		    <&gbe_pmx_obsclk>;
-- 
2.34.1

