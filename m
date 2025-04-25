Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC31DED49;
	Fri, 25 Apr 2025 05:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745557873; cv=none; b=kTxy0lJQl17bpew1oKVNRjGEahtIEX15AwBh/NdtCHPjqCFOtW+7jl51I0eRhk+wp5I2KqXVT4aCQzgER3LkTWbfKetHFZjeGvOuGFrEjVIYEV7m4oMFQHoYKLMCmAwVXEYHqWVSNd8e4+cOhl0JnLe7tN571H1roGKjstU4K+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745557873; c=relaxed/simple;
	bh=EHZtvNHy0yCm5W1KW4xVDe8CACqntU015Q29SWEyd5M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A02Ya7N7RMUpC1ighUzkOvNgfeAd+73YBX6r8j5qzZivBNopKqvM+Cpe66uudI/S9V+7G8se3UKEG92TIHd/FNYq8+dUUkKpIvagrfDnvRIOfUfTHTVzPPGhO9IVaqurg/kFeeAqlOpqtx2woHUc1VXPZyQa8xjicSzgaSwPcSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sBGA/y+n; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sBGA/y+n"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53P5Awn12839322
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 00:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745557858;
	bh=JhpzXDVwSy3f4gqHWufQhBYgL8KVWO79EB4j5tIS4UI=;
	h=From:To:CC:Subject:Date;
	b=sBGA/y+nXe44Uo6+kXYmQbOmviDHqsx62kUnLUDh6B8+e2oolPC4grZIsZRAVHtbN
	 q1h/oKR2V6uCM8vq3eEfUyiK5NcawPhFA4uGgLy3PNSZqX2u8d/GbHN2g24709cwvc
	 RP/ZH1wdWHpK8ONQBbC4WxZg7H7sNyl2xklTooVs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53P5Aw4V005736
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 00:10:58 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 00:10:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 00:10:58 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53P5Avtl011185;
	Fri, 25 Apr 2025 00:10:57 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <srk@ti.com>, <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <c-vankar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/2] Add bootph-all property to necessary nodes to enable ethernet boot for AM68-SK, J722s and AM62p-SK
Date: Fri, 25 Apr 2025 10:40:53 +0530
Message-ID: <20250425051055.2393301-1-c-vankar@ti.com>
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

This series adds bootph-all property to necessary nodes to enable
ethernet boot support for AM68-SK, J722s and AM62p-SK.

This series is based on linux-next tagged next-20250424.

Link to v2:
https://lore.kernel.org/r/20250302153502.181832-1-c-vankar@ti.com/

Changes from v2 to v3:
- Removed "bootph-all" property from "mcu_cpsw" node as suggested by
  Vignesh since child node already has that.
- Collected "Reviewed-by" tag from Siddharth Vadapalli.

Chintan Vankar (2):
  arm64: dts: ti: k3-am68-sk/k3-j721s2-mcu: Add bootph-all property to
    enable Ethernet boot
  arm64: dts: ti: k3-am62p*/k3-j722s: Add bootph-all property to enable
    Ethernet boot

 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 +++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                | 2 ++
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       | 3 +++
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 3 +++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts                | 3 +++
 5 files changed, 14 insertions(+)

-- 
2.34.1

