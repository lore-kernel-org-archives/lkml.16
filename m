Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1812846F;
	Thu, 22 May 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899295; cv=none; b=eIV9QhBApBMkfMGumn3majMLF3jlYLsmLJGZrMN85cy7Dk5U7ddbgqIeAWakM6i+KFUOF7xp1v8jj7SSWcv6JUly4bCdnIaiWfF+hrRhsmonRw+rJwrF7EnC817AsQ21lZA0drKy8r0fTj/CPxb0UFjYPkqpJvdYcBfqEpQY9xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899295; c=relaxed/simple;
	bh=uCxxpmpOq0LMjqG7YxyJqUQ0LDMv5i0J/BI+DW74wT4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D7jb6nmCNc8F8OPpQTBPwsequEYBUoK3iT6cUYIUpeAYMoD4srm2yQ2TiHnozGIwzfjfFQ9qi7gsoAiwX5onZhJXKAEccuBZvC7VUFpFHzQUhIzo4YJeCCM9y61fACGMiYWgkp29ZDTZAxupl+AatXScCAp7wogCXgfBlb/J+KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yd9smL89; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yd9smL89"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54M7YWLn578074;
	Thu, 22 May 2025 02:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747899272;
	bh=dO0psC/NIw3wHa+zq1XlVVL/kT7HGD38RRa4TmOgHQ0=;
	h=From:To:CC:Subject:Date;
	b=yd9smL89Av3gxXabukerU0VWyJGlXDWwHpXjEII7RKJ8O+76UXdE2m8Mz16Q2E8D3
	 tDL77hi2mchsqjOQ/dg8ePWWN4UqcGhiZi8dz9vuU+2J0JUp3+QYs8t4SY8JJa3SNi
	 LHeI6Whmb1epDlZZn4Whid14wpcozPOoEY6PHu8I=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54M7YWcU3319907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 22 May 2025 02:34:32 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 May 2025 02:34:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 May 2025 02:34:31 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54M7YQ4m475080;
	Thu, 22 May 2025 02:34:27 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/2] TI: K3: Switch MCU R5F cluster into Split mode
Date: Thu, 22 May 2025 13:04:24 +0530
Message-ID: <20250522073426.329344-1-b-padhi@ti.com>
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

Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
R5F cluster in the MCU domain which is configured for LockStep mode at
the moment. Switch this R5F cluster to Split mode by default in all
corresponding board level DTs to maximize the number of R5F cores.

Corresponding support to shutdown MCU R5F core 1 on SoC power on have
been posted in U-Boot:
https://lore.kernel.org/all/20250522071828.285462-1-b-padhi@ti.com/

While at it, correct the firmware-name property for MCU R5F cores of
J742S2 SoC in [PATCH 1/2].

Testing Done:
1. Tested that each patch does not generate any new warnings/errors.
2. Build test on all existing TI K3 platforms.
3. Tested U-Boot and Linux load of MCU R5F core in split mode on all
applicable boards (AM68-SK, AM69-SK, J7200-EVM, J721E-EVM, J721S2-EVM,
J784S4-evm, J742S2-EVM)

Test logs:
https://gist.github.com/3V3RYONE/ee8e3cb9aa5f4c5c00b059b9c14bfa98

Thanks,
Beleswar

Beleswar Padhi (2):
  arm64: dts: ti: k3-j742s2-mcu-wakeup: Override firmware-name for MCU
    R5F cores
  arm64: dts: ti: k3: Switch MCU R5F cluster to Split-mode

 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi      |  4 ++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts           |  4 ++++
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi     |  4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts          |  4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi     |  4 ++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi    |  4 ++++
 .../arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j742s2.dtsi           |  1 +
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi     |  4 ++++
 9 files changed, 46 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi

-- 
2.34.1

