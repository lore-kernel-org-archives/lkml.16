Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFACA2040B6;
	Wed, 14 May 2025 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207279; cv=none; b=uRXcPmwcAEVHfVE3K7oR7C5fgpaenbL2GfgU9wTMVBFF8dqNjt3TOucUavACEvrVjD0LEv58xdPt5+N+DW7+ULH/RxXgbqCEehJqCKUIFp1GjI3J/tchESkUd59Q2K9KEW0afgaV+W0GZ91PRhOvEKBW3eW4KNRuyMebf5W4NyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207279; c=relaxed/simple;
	bh=XnwDsrdVNYEt+ZsctXYW9795MccpcpJXkul+uuNSVaw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HkKfwvznU2YYJK6HJJY735/3MQyO2PndCXAhSmug80eExkrgOSlqwLkcXWkWEMi5Vee6QAJKqPNJKZaRzkAinsWRH7H/thHTQD8wwBE+BtYO/fNrHen0ARXfLHfSsrsd/AmHYx3uoCaQYrsoYKW3eX2s64Mo/DeugfYIoQ9AVfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=b/vGbHjL; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="b/vGbHjL"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54E7L1ej3339611;
	Wed, 14 May 2025 02:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747207261;
	bh=D4vLM2rqy7MbY5k/R0/Jz5Vtcif1+JSjf/9lkPla+Os=;
	h=From:To:CC:Subject:Date;
	b=b/vGbHjLaifLjssf1CaXSBzuAoTLIKme5YH+tfjm1WBBjCNZDv0dC9aARfFvKlMJd
	 kKBylWmqLdoeelvtt1btuX7hdXppaOyU57Hws1bQw6dku2L0dtDjBieRSHoHBLkev3
	 +7EF3TjGm6oA4HwW4Dfd7NdZyeJSBGFREAuXkpTY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54E7L17g2101535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 14 May 2025 02:21:01 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 02:21:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 02:21:00 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54E7KueZ082928;
	Wed, 14 May 2025 02:20:57 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v3 0/2] Add support for K3 BIST
Date: Wed, 14 May 2025 12:50:54 +0530
Message-ID: <20250514072056.639346-1-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

BIST (Built-In Self Test) is an IP responsible for triggering hardware
circuitry tests on both logic as well as memory blocks. This driver is
currently being upstreamed in U-Boot [1] and triggers these tests on
cores. This patch series adds the dt-binding as well as a node for BIST
on J784S4.

Changes since v2:
https://lore.kernel.org/all/20250328111439.374748-1-n-francis@ti.com/
- Krzysztof
	- use existing common definition (ti,sci-dev-id) for grabbing
	  the device ID instead of redefining properties

Changes since v1:
https://lore.kernel.org/all/20241128140825.263216-1-n-francis@ti.com/
- Krzysztof
	- move from misc/ to soc/ti/
	- minor property changes
	- drop ti,bist-instance and instead opt for ti,bist-under-test
	- correct example dt

[1] https://lore.kernel.org/all/20250204123147.939917-1-n-francis@ti.com/

Neha Malcom Francis (2):
  dt-bindings: soc: ti: bist: Add BIST for K3 devices
  arm64: dts: ti: k3-j784s4-main: Add PBIST_14 node

 .../bindings/soc/ti/ti,j784s4-bist.yaml       | 63 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    | 11 ++++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml

-- 
2.34.1

