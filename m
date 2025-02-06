Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C9F1D5ADA;
	Thu,  6 Feb 2025 23:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738885929; cv=none; b=W8YCEw+/b9FUCw6OpSw2ji9c4rz66M3fPU1a6EaamHXNzz6KQU8qiRX2I4I/SLptHXRQI57OCDD2vPyLKPwy1tzNLHNOIonElszR/yUjq6hyQPDrH92WNWgNUcxFWJXJSj2h374Fjux1wRWdMFwY1VAsvdLJOhWijD/qO94g6/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738885929; c=relaxed/simple;
	bh=jB66AhGoyyi/8ohiJeD+bOVa+joi/8uwiQvIo2cIVqM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zay95jpoM4NipIfONBkyyPTaCXhDiYLDzuxrD+kiDr1TIw2DykRdC4Mk4vaL5zraMwHT36BWSaKBUYgQ41Fjo3y4Jq+ysp9XbgxIrAZ14xs7yuKFNxB81Ain19HxYPP4P4IGwemcaVADW9dVuwoMUB09iaSOQ5TPADuSRaIXAuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HlCXYgPx; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HlCXYgPx"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516Nq0WK3642635
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 6 Feb 2025 17:52:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738885920;
	bh=PlRxfRf0bZxwIsAStn+hmJUO4JDQr1Up3ix9Iglg87o=;
	h=From:To:CC:Subject:Date;
	b=HlCXYgPxcnko757VNZbBz+xlBWVidjrSlUegxSOWmxe6DtlObQ/ND6rFkgeXvjYmF
	 ttIuui98anQl0h1EEdrRaFoEQGWdUSkaTUXsE/1q7xZSlNaPIPG2mkCFj+J7bl8ZoH
	 KpujcI3lzzLTEbjqg06CidzNf+MVZ4sT+1MGVKJI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516Nq0CI098897;
	Thu, 6 Feb 2025 17:52:00 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 17:52:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 17:51:59 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516Nq0vB021560;
	Thu, 6 Feb 2025 17:52:00 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v4 0/9] Add R5F and C7xv device nodes
Date: Thu, 6 Feb 2025 17:51:50 -0600
Message-ID: <20250206235200.3128163-1-jm@ti.com>
X-Mailer: git-send-email 2.48.0
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

This patch series also includes patches for enabling IPC for am62x,
am62ax, and am62px by reserving memory and binding the mailbox
assignments for each remote core.

Also reserve main_rti4 and main_timer2 for the C7x DSP as per
firmware requirements.

Changes since v3:
- Add SRAM child node for am62p MCU R5 core 0

Links
v3: https://lore.kernel.org/linux-devicetree/20250204011641.1523561-1-jm@ti.com/
v2: https://lore.kernel.org/linux-devicetree/20250131214611.3288742-1-jm@ti.com/
v1: https://lore.kernel.org/linux-devicetree/20250127221631.3974583-1-jm@ti.com/

[0] https://www.ti.com/lit/pdf/spruj16
[1] https://www.ti.com/lit/pdf/spruiv7

Devarsh Thakkar (3):
  arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
  arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors
  arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors

Hari Nagalla (5):
  arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F node
  arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
  arm64: dts: ti: k3-am62x-sk-common: Enable IPC with remote processors
  arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
  arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP

Jai Luthra (1):
  arm64: dts: ti: k3-am62a-main: Add C7xv device node

 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |  25 +++++
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |  12 +++
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      |  38 +++++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |  25 +++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 100 ++++++++++++++++--
 .../dts/ti/k3-am62p-j722s-common-mcu.dtsi     |  13 +++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  50 +++++++--
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  32 +++++-
 8 files changed, 278 insertions(+), 17 deletions(-)


base-commit: 5532b8a9ce0e80514e37a1e082824934663580a3
-- 
2.48.0

