Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6963259CAF;
	Tue, 24 Jun 2025 08:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753595; cv=none; b=YAZp4d/ShsZ92icAT3Wteoxy5+qKxdWlSw9ui5vZ69hXltFWrKR+6vaN3t5weQynvWvH8Z3Etwi57jaoGh1sSyiwPHW9vC48TOxN4oaGwih8UaVwQ1BSJY7kCs2LEwbB8MulkQohY3fiohBKTUqXS/5rZ7w1WE4R7V975qHQW6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753595; c=relaxed/simple;
	bh=jgZAhUSx8y5cTFpsiS+GhqAlW4UX9GKkQXtPv2sMV/c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z7cAn+82lGtB+ZYaJAFUWCEA5wv+o+lYv950Z+/iHPeZMx9pdEXh+sjdb/pAlncFatLZ/zKJ51m/GpANCRmU4p8eK40jQHXKE8sJ50ra184CUxtFZxx6hqeuikJkv8hh5h2q56VOxqoSYG9EgCeeGa3IcoURpoIvAOaS/6thB8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vv7MpFFN; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vv7MpFFN"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O8QLRQ1822851;
	Tue, 24 Jun 2025 03:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750753581;
	bh=tTEfa5CiUFMxvJTh/oXI/dpTy+Tx2rapb6r8r3On4qM=;
	h=From:To:CC:Subject:Date;
	b=Vv7MpFFN5uEQ4kwl0UlDxyRPm1j88RNbNNoJfOYPO0hP/1tfqnfvx12pmnctBgTPF
	 NcRrbcT5D2JtKZuqRupnZVE3PzInM6KaRccVxfe2HHBAqT/D7/G6RsBihIBFi6ywvp
	 jO+GRsdbMLzQgUkW2vR76uAnrTXfZ4Tvze48SxRs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O8QL7J1551231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 03:26:21 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 03:26:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 03:26:20 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O8QKGA1183522;
	Tue, 24 Jun 2025 03:26:20 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 0/7] Add DSI display support for TI's Jacinto platforms
Date: Tue, 24 Jun 2025 13:56:12 +0530
Message-ID: <20250624082619.324851-1-j-choudhary@ti.com>
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

Hello All,

This series adds the dts support to enable DSI on 3 platforms for TI SoCs:
- J784S4-EVM
- J721S2-EVM
- AM68-SK

Relevant driver fixes, CDNS-DSI fixes[0] and SN65DSI86 detect fix[1]
are Reviewed and Tested.

[0]: https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com/
[1]: https://lore.kernel.org/all/20250624044835.165708-1-j-choudhary@ti.com/

I have locally tested using kmstest utility on all 3 platforms.

Changelog v1->v2:
- [4/7]: Add gpio-line-names
- [6/7]: Remove unnecessary clocks from TIDSS

v1 patch link:
https://lore.kernel.org/all/02f1912f-0a05-4446-923a-7935ed305cb3@ti.com/

Jayesh Choudhary (5):
  arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable DisplayPort-1
  arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
  arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
  arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0

Rahul T R (2):
  arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
  arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP

 .../boot/dts/ti/k3-am68-sk-base-board.dts     |  96 ++++++++++++++
 .../dts/ti/k3-j721s2-common-proc-board.dts    | 113 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  37 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  |  52 ++++++++
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 117 +++++++++++++++++-
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  37 ++++++
 6 files changed, 451 insertions(+), 1 deletion(-)

-- 
2.34.1

