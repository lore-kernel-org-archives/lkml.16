Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08D3DF58;
	Sun,  2 Feb 2025 09:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738489024; cv=none; b=GtQsO57vD+QY3G6wkyx9Izz+jVaYwI9CyOpDlUV+F+t2xk9buzaCzNxykiV88slUMb/lDDc+LUdU8t6d48tVPRcuYbd2Hh8D0B0TUr6gDpAahCyN9xnuwjI542DBdH5QdJCnrypDTldhsWfEhCyQUgem5+Z0oFTe/JHwBU30K4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738489024; c=relaxed/simple;
	bh=r8qDlZazWmAQroRqURiucWOsMUSLcG8921NyHtmMhAA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cw2UQXWKA+5NG/xm5pyEwwgl3EIfMVlPP+QbQn4G+oZ6haHLjsEeU7l2KFWwo++WpD0GZ/pri8eNOnVJX62MbMBvc/KI1jcTXihndbYrILrR+M+dTVU6iyYc9+dTe1/9XTYNx0cXyG9SQj+nGiytvgptVgj0q6NmVfgXx2j0gsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yUPBb7l/; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yUPBb7l/"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5129afQt2003141
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Feb 2025 03:36:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738489001;
	bh=yUw7ymLELkI5+jt5wh+PAwXmQ5X5tURqWHNh4UxI+ho=;
	h=From:To:CC:Subject:Date;
	b=yUPBb7l/21BYt6k+mTtnylBFjaUzKXbZRxpb2Ry63IzCf9ax+uxu+tFoX9WypRPJw
	 olGssMfOgaIxcLFZ2XRDaVu5jyS1q1y15AP/MUq0PljW2H0vUHxNTX4JZpjwzomH5Y
	 Ib9ncayEEft/EjOJbx2RR9fRn6zgFzYXNLoQprNQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5129afin059250
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Feb 2025 03:36:41 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Feb 2025 03:36:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Feb 2025 03:36:40 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5129abbi119794;
	Sun, 2 Feb 2025 03:36:37 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/3] PCIe NTB and USB Overlays for J721E, J742S2 and J784S4
Date: Sun, 2 Feb 2025 15:06:27 +0530
Message-ID: <20250202093636.2699064-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello,

This series adds the device-tree overlays for PCIe NTB (Non-Transparent-
Bridge) functionality on J721E, J742S2 and J784S4 SoCs which have
at-least two instances of PCIe that are required for NTB.

The device-tree overlay for switching from Type-C USB interface to Type-A
USB interface on J742S2-EVM and J784S4-EVM is also included in this series.

Series is based on linux-next tagged next-20250131.

Due to Makefile dependencies, the USB Overlay at:
https://patch.msgid.link/20250124124150.2024963-1-s-vadapalli@ti.com/
has been merged into this series. No changes have been made to the USB
Overlay patch when compared to its v1 patch.

Regards,
Siddharth.

Siddharth Vadapalli (3):
  arm64: dts: ti: k3-j721e-evm: Add overlay for PCIe NTB functionality
  arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay for PCIe NTB
  arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to enable USB0
    Type-A

 arch/arm64/boot/dts/ti/Makefile               | 20 +++-
 .../boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso    | 91 ++++++++++++++++++
 .../dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso | 92 +++++++++++++++++++
 .../ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso  | 29 ++++++
 4 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso

-- 
2.43.0

