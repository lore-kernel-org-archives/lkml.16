Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22454278E41;
	Fri, 11 Apr 2025 10:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368728; cv=none; b=kqv9uOYXE2Gjz3A3UbIhtb4ctDIzvay3PhRzD6PsysY70ghsTJYacImFjWHvY2fnWAlXBAUowokvjI0CwFD/9cW0qnPWxv4sItBA+BF+4xzLtzZ260VDO5hrGI20bYw3SNwndgvY3WVJXqnda0Wem2EPuaUEOOfOpr08tNCg8AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368728; c=relaxed/simple;
	bh=96btQmYImZfAOI+fu8dFlxT8V0oTt4TvrBS2WM70IP8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pix20dSXmKGjuGlowAwd8YlqiMm5r9k3WPiRvlkRY54tUFZp61udb1AYPVO/p/dWTV6McXxvv4ZKZKYWIbEFJNpSpqCEQCh8fZ7crk0+gJWil5k5U/jExH6K+qS9wkwIsgGJiCD1WqYmG3yg6d5zKOJ9aslG2DnQl7a89QUC8q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kNUCJnx4; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kNUCJnx4"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BApvvK2104737
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744368717;
	bh=ufBPzefqQfv5obE5Pv0KCKQtrt8Mm1vDWW/7ZeaZFxY=;
	h=From:To:CC:Subject:Date;
	b=kNUCJnx4JfICJMR5w4JvRK9nedhjnW+I4ofOvhrTD8CQt+x+v9Bu28ZLXhWFUlG+L
	 FPAC+snIyKZQQmp/22AXkeHoIXPeAfWvBOOPQLJ1q5kFlmlgKxRsQzvDwwgVIc/Q2S
	 cS7EVWvp4mHp/3K1JQaSJiwGiZxI+3HKAofWCN04=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BApv45075026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 05:51:57 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 05:51:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 05:51:56 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BApts9029842;
	Fri, 11 Apr 2025 05:51:56 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 0/7] Add DSI display support for TI's Jacinto platforms
Date: Fri, 11 Apr 2025 16:21:48 +0530
Message-ID: <20250411105155.303657-1-j-choudhary@ti.com>
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

This series *depends* upon a couple of driver series[0][1]and a config
patch[2] that enables CDNS_DSI and CDNS_DPHY.

[0]: <https://lore.kernel.org/all/20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com/>
This series adds cdns-dsi-core fixes

[1]: <https://lore.kernel.org/all/20250411092307.238398-1-j-choudhary@ti.com/>
This patch adds the necessary DSI flags that are used in cdns-dsi-core
driver which are propagated from sn65dsi86 bridge.

[2]: <https://lore.kernel.org/all/20250411095043.272488-1-j-choudhary@ti.com/>
This patch enables the required configs for DSI.

I have locally tested using kmstest utility on all 3 platforms.

NOTE: For higher resolutions, we need bigger CMA region.
But for validation, the default value is enough.
I am posting another series to add CMA region to Jacinto platforms
similar to Sitara family soon:
<https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/>

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
 .../dts/ti/k3-j721s2-common-proc-board.dts    | 116 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  37 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  |  52 ++++++++
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 117 +++++++++++++++++-
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  37 ++++++
 6 files changed, 454 insertions(+), 1 deletion(-)

-- 
2.34.1

