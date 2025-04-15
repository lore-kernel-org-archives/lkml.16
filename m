Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BA82BCF6B;
	Tue, 15 Apr 2025 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731129; cv=none; b=rHH/rzko5riuvW5V/xpw//h5OqkjjbkS8R6cwI7QRUHETxLFilQxRVHtI6Z0IaEhrOe6dReONm5YHzhZTa0Kgt6r9O8pFAatGtthc4KjH7t0mHELYB+7eYTSzZZ5rh7a1xdJ9EHx0fAUSF3y6Z7ktlihYQHZ2+KUieq2ULfQ1Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731129; c=relaxed/simple;
	bh=pR+2be8KjUpoEIGKLrGHrHSH8M+uMTDpPZLmH0ZkC0Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ElNZwSY4+EJnJ9aFyHzqg8Pp4FyAWnvF+EhgmfS/3po6W2RAO870V32K4BbPwaN/NPwbEBrMWq/j+7hSN4EVnI+EqlSlBl71AprQs+SgauGc7Qnr4XbF80ikh/hxjvw1pEr2elcwOWQcAF9XrdRcJ5voQszTZKIkTtp/6G/KEbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O3/NUCpt; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O3/NUCpt"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFVmJ02394443
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 10:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744731108;
	bh=/O1xD+HqXmJLec8GsMhbvUyB/KEUfoAfhy8hElpuE1I=;
	h=From:To:CC:Subject:Date;
	b=O3/NUCpthye8NpfW5dBKyKfQTup4eTndAS4hqAzxfn1kQxRMOQ8VCOmUfEuaHVWnJ
	 zL22x5DKP/rgreJtjhl5bRXCxebywBvuNZOHtyN7mE4y0ebfR0NpO+haxA0b7wS4Ts
	 7G7E7rj1HokTvmQWKKF7TBCl6dVRsO8vfZGTOALw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFVmji040442
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 10:31:48 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 10:31:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 10:31:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FFVlZq109804;
	Tue, 15 Apr 2025 10:31:47 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>, Andrew Davis <afd@ti.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
Subject: [PATCH v7 00/11] Add R5F and C7xv device nodes
Date: Tue, 15 Apr 2025 10:31:36 -0500
Message-ID: <20250415153147.1844076-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

For am62x and am62ax devices, this patch series adds device nodes
for the R5F subsystem and C7xv DSP subsystem found in their
respective voltage domain, based on the device TRMs [0][1].

This patch series also includes patches for enabling IPC for am62x SK,
am62ax SK, and am62px SK by reserving memory and binding the mailbox
assignments for each remote core.

Also reserve timers used by C7x DSP for am62ax SK board and timers used
by MCU FW for AM642 SK and EVM boards as per firmware requirements.

Changes since v6:
- Fix comments in patch 11/11 (no functional change)
- Pick up review tags

Links
v6: https://lore.kernel.org/linux-devicetree/20250405001518.1315273-1-jm@ti.com/
v5: https://lore.kernel.org/linux-devicetree/20250210221530.1234009-1-jm@ti.com/
v4: https://lore.kernel.org/linux-devicetree/20250206235200.3128163-1-jm@ti.com/
v3: https://lore.kernel.org/linux-devicetree/20250204011641.1523561-1-jm@ti.com/
v2: https://lore.kernel.org/linux-devicetree/20250131214611.3288742-1-jm@ti.com/
v1: https://lore.kernel.org/linux-devicetree/20250127221631.3974583-1-jm@ti.com/

[0] https://www.ti.com/lit/pdf/spruj16
[1] https://www.ti.com/lit/pdf/spruiv7
[2] https://lore.kernel.org/linux-devicetree/04e77daf-e775-44fa-82bf-8b6ebf73bcef@ti.com/
[3] https://lore.kernel.org/linux-devicetree/4740c3f8-5051-4e25-af91-b45735ffef31@ti.com/

Devarsh Thakkar (3):
  arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
  arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors
  arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors

Hari Nagalla (6):
  arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F node
  arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
  arm64: dts: ti: k3-am62x-sk-common: Enable IPC with remote processors
  arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
  arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP
  arm64: dts: ti: k3-am64: Reserve timers used by MCU FW

Jai Luthra (1):
  arm64: dts: ti: k3-am62a-main: Add C7xv device node

Judith Mendez (1):
  arm64: dts: ti: k3-am62: Add ATCM and BTCM cbass ranges

 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |  25 +++++
 arch/arm64/boot/dts/ti/k3-am62.dtsi           |   8 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |  12 ++
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      |  25 +++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |  25 +++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 106 +++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  50 ++++++++-
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  34 +++++-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts       |  20 ++++
 arch/arm64/boot/dts/ti/k3-am642-sk.dts        |  20 ++++
 10 files changed, 306 insertions(+), 19 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.49.0

