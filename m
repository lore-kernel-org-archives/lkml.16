Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9448126E71F;
	Wed, 11 Jun 2025 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642238; cv=none; b=gFh3PeMSO9PIYO5MNKy0Yip3dZJJPmf6uFQNU5xzODleQAiLcAFnXc3ygE3ljwfPNXmNzKSMWMa7eoqIkpTDv4u7oia2yw7SUnEs/AkJuS2XTeMpVS+APlhxfCxExi3hhbZoIknt5s6Uv8PKNxTnJrEOt/rcHawsJTTJvMENrg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642238; c=relaxed/simple;
	bh=EUDu8TltkVzmlSsqvBf6PtZwCwPONPRlxD0OJ6MBcGM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rib4hBh0Co+LJmPZD9aGSsQHTllF/4TB8uNU8E/jsALUa53Q7MJAscT9EmgNyjKoFOU6wfsSBl4cD9BNat9/O7Gofo5hrQnSn4unjkJg/GiWFnmq1Y/7mx6o7R/8/BhM1yYY9cXqXTSwMJRMcMbjpfHpZReIrLSVDcCh0mdL1RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jpB9O4Oy; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jpB9O4Oy"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BBhf2r1352854;
	Wed, 11 Jun 2025 06:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749642221;
	bh=GENAPiyGrW4RKf+sxnTjivjp6lL9fZ26yd1QrBL2owM=;
	h=From:To:CC:Subject:Date;
	b=jpB9O4OyhOJC5o8S6Tq03/2nfD0Ni/Fkj5eVPABhXfssfe7wLPuE71Uxe0M9Sb20M
	 l3xXFI1AlWS3XoBDHlMXDvh0YKHk4xFVz0BmYGlxKDJw6jTDXtTFRPLZI0iUon+0Mg
	 9nRjCF67IcDhnbBpIpR25uW/CiI7vrSKQI6T9gRQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BBheZj986075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 06:43:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 06:43:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 06:43:40 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BBhavD270460;
	Wed, 11 Jun 2025 06:43:37 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 0/5] TI-K3-DTS: Cleanup CPSW DT Nodes
Date: Wed, 11 Jun 2025 17:13:31 +0530
Message-ID: <20250611114336.2392320-1-s-vadapalli@ti.com>
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

Hello,

This series cleans up the CPSW Device-tree nodes by updating the SoC and
board files to keep CPSW disabled in the SoC files and enable it only in
the board files.

The following is a summary of the SoCs, CPSW instance and the Boards that
this series affects:

-----    -------    ----------------  --------------------------------------------
S.No.      SoC        CPSW Instance                    Board(s)
-----    -------    ----------------  --------------------------------------------
  1.       AM62          CPSW3G           AM625-Beagleplay, AM62-LP-SK, AM625-SK
  2.       AM65        MCU CPSW2G         AM654-Base-Board, IOT-2050 Based Boards
  3.       J7200       MCU CPSW2G         J7200-Common-Processor-Board
  4.       J721E       MCU CPSW2G         J721E-Common-Processor-Board
  5.       J721S2      MCU CPSW2G         AM68-SK-Base-Board, J721S2-Common-Processor-Board

Series is based on linux-next tagged next-20250611.

v1 of this series is at:
https://lore.kernel.org/r/20250529133443.1252293-1-s-vadapalli@ti.com/
Changes since v1:
- Based on Krzysztof's feedback on the v1 series, patches have been
  squashed with SoC and Board changes combined into a single patch.
- "mcu_cpsw2g" has been enabled in the board file
  "k3-am68-sk-base-board.dts" since AM68-SK-Base Board uses the SoC file
  for J721S2.

Logs:
1. AM625-SK:
https://gist.github.com/Siddharth-Vadapalli-at-TI/b82ecd46b0116211ff8bf2ca7bfd1b9f
2. AM654-Base-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/91d5ed19429d9758b152d98fb61a41f0
3. AM68-SK-Base-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/e1f28b4ef6e1e864a76235fa74949daf
4. J7200-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/f11bcc3d79ec8cd9577e2d44ba6a7182
5. J721E-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/9bbe7832ad153a65c5978dc6e0113a1c
6. J721S2-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/684f100cda6f8e1d672f61136b2f8fb5

Regards,
Siddharth.

Siddharth Vadapalli (5):
  arm64: dts: ti: k3-am62: disable "cpsw3g" in SoC file and enable in
    board files
  arm64: dts: ti: k3-am65: disable "mcu_cpsw" in SoC file and enable in
    board files
  arm64: dts: ti: k3-j7200: disable "mcu_cpsw" in SoC file and enable in
    board file
  arm64: dts: ti: k3-j721e: disable "mcu_cpsw" in SoC file and enable it
    in board file
  arm64: dts: ti: k3-j721s2: disable "mcu_cpsw" in SoC file and enable
    in board files

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts               | 4 ++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 ++
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-am625-sk.dts                 | 1 +
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi     | 4 ----
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi                | 2 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 2 ++
 14 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.34.1

