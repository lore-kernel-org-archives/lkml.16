Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023140.outbound.protection.outlook.com [52.101.127.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2EE2741B2;
	Tue,  6 May 2025 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522480; cv=fail; b=oQ7itfrV9hNeMDSqdAFikdFs/vkGXH+vK9OodxsYCc6Z6eEGZZWSGlfh3RBYtrniJDD4zNG/ioBYAtD71Z/7avMwtKRpSGOrGb6rqu/iRbBtyEOA3HSBcblpLA8++hr7Npby2ktc2yxRY3vUEo9qcHS2Z57NkCMci4D6RjBDPuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522480; c=relaxed/simple;
	bh=wDXRbzFkkmHLKI+X5+I8vTWtK2MIATjWCqomVnEsMHE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=BToCwGCidPkVUEmQgWXb0Q1eb19RxE/i87FXz9PJvoHIBtGQQYv4xVvp/lpmDczrQRaTLBR9su3/D+uRWbJ/1tC+Qz82llwttDkEkIvtKhmuTCvUQowGy8WAUBv1YoQonjV1o/HwdU6WuJVOsQqfZenZibp0GEBjwosTqE3OGqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+5QcFZQFjRymT/Xis6b75CjF4dnHYBvZu3D4ggMMcKkYnQAevKeG5opxwfauVJFZFXEKdmXXz4NuNjqo6BEkkwVaZmCpAEo5Fqj0Q+AmBAZ9eIKCbbXw4MwnYOCKuTv62UKiad6yZEFqjiQHn53dCmUlCboI32nelZguuYV0x18kLrqzv7pyk+0BRE0SuCtXOAOPhLwOjIhMibsivk+BIfudKHYz8q1OFt7z+gKAHpvKYK9JvQswCcVSJXB2q6194R1qOvumiwi++5zsOByy7ZrdmyV+8AN3IxwX4LZ8N48z7fhHsQrKSvdqalDgVuaJDjVayAz+S710hlm3c3Tsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efxSTTnSmUEMP2pEqMRS9bR+QQ+9pjnjM9QZYHVEHDk=;
 b=tj/nKcozeCWqTQWrQsoOv1218Pfz/WTMvMU0rAiJC6fkbb9HFwB2Tgafl3Up35zzpey5CA5z87hZu9ifkmVfSIOaJFHxl5x3eiZaq4XEtKg5BVB0XNIbQGmDvs+h0QQuVDeTXXWrOQ1Ak0opFs+zkXMnFNDZrU+mF/u9TmwbOFCspw+h95IFzdP8XonnWppxRv4n4U4owWrvHbBgUyR+ao7mhRWeQ1kvnQBVVU1U4kQgqmU9exFYQHYFAqiyQdAqbAj8p25w9jmsLuOasEgAaxrZfohih5LMtvxtHP7p73kuwcE+8Bvlo5oNi0bkM9x8E7WaEsuByJy6Y+P34E/1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYAPR01CA0105.jpnprd01.prod.outlook.com (2603:1096:404:2a::21)
 by TYZPR06MB7093.apcprd06.prod.outlook.com (2603:1096:405:ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.29; Tue, 6 May
 2025 09:07:53 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:404:2a:cafe::29) by TYAPR01CA0105.outlook.office365.com
 (2603:1096:404:2a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Tue,
 6 May 2025 09:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 09:07:53 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2A3014160CA0;
	Tue,  6 May 2025 17:07:52 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	sudeep.holla@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v7 0/9] arm64: Introduce CIX P1 (SKY1) SoC
Date: Tue,  6 May 2025 17:07:43 +0800
Message-Id: <20250506090752.3695666-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TYZPR06MB7093:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: da7fbdaf-95e1-45b2-263d-08dd8c7d7bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pd/GHLkP0/n1wxM5o/yna7rRNn6F0d4AwwVJOb4503fD5F37R+nzBw0XI197?=
 =?us-ascii?Q?sFgeIMbz5Ki7bwAIOZag5Qp8qmCRuvrzFZCDRTH2Y5Rp9fWN+EXAlP8scwxS?=
 =?us-ascii?Q?Yelltus51Fx0euWOP1jvANTfnyszcbH1uUYMl2vAje1PsjARd98cLeji9NwT?=
 =?us-ascii?Q?al2410h2VmqVjHPagvLFg4NoNpcrWIqBdnrbde5i8dQ/k9qlmRU9K7JoCZI2?=
 =?us-ascii?Q?qT8batqLmvCrDTG1nb9gsb1+HTCfUcuvD3/aGHwyH4RZrC2BHHtUNQ6HKhpQ?=
 =?us-ascii?Q?JgQdi4njLMQNBzFpa+tw70tMd+WNT1jycBxAb8tjm8/8zDcYr/fAQOSBUoAA?=
 =?us-ascii?Q?H8qxjonNAUonsIUOBXs8nhBEQZjvlk/Sj9LaCsVfp6SNRuG22Kei8TIThHeS?=
 =?us-ascii?Q?2eOtyaQeUcqbiRAy6M5UXdo/mChkbPUN99y5do0nPTomEDmtJ2S1nAuyL2lM?=
 =?us-ascii?Q?+0aUjRFbKFCFxnyq77DlQgylKAnts5FF5BEa+Bnc/XHAVwJn6bfjhiXODA1+?=
 =?us-ascii?Q?NjTjt1k3Lvga6vNyMZbVcyXIXUhyAktEUPI/8qBxandZMsHQi2EXsOc31IyL?=
 =?us-ascii?Q?V0BoPCyQSC/9yzRW1/LptKEGmS02ehIsWU5F1B3jFaeCuvR0xoptvzyDS8fI?=
 =?us-ascii?Q?hhJGJeg19faoHLjPoYP5PKkld4AST/IUe4Vdr30Lp5DqQfnO1ffcj9vYHLuG?=
 =?us-ascii?Q?e0gVJPhLAI2+hsuM8oNOqbq0a8reqb1s2NokKUk0hn0MZ6T25dBsR95HIpp6?=
 =?us-ascii?Q?mOH9QIivoN7J3mlYYL5hpM1hhocrX8OItuvZFrykYfCn/TfqltA0ypkoYmrz?=
 =?us-ascii?Q?Psd1+9+GarR7AkARY8bC2rnr+ijAr8a5LxXDvoaPPGvWE6WzyktMs6J1/SzA?=
 =?us-ascii?Q?NUBzpHfPH+ZAmgiTTHLjrwoVtu4pY9VW5FXQDehhF9YRfzqIikobSaPYe3si?=
 =?us-ascii?Q?uHVDPYbTTouetJwMuEoOsjaryw860mVQZl81p219IGTLvsjdrjzWg6/FtfoG?=
 =?us-ascii?Q?zNRUx8oVEcHLl4xrK67DT7Me+00StDkzNjnw5e7J9WmjBQwOUbgAoBbt7Yfs?=
 =?us-ascii?Q?0NuqC74fjdmFEL/hDpc4uLUYZJK02WAJgkLBEU63y/yVYPVsxo2/4vQOEv5l?=
 =?us-ascii?Q?dk1JT/tJZtuH924lf8KtH/VmFMsotmohbBa7Q9Poqx1jMVeAVkA6kkyqW9+4?=
 =?us-ascii?Q?3orZCyeJPCijtMKLWBbrQhyn3b1h1uz6rF5RYdFNAj7lu1uGzwc3f7sNy5E2?=
 =?us-ascii?Q?5Uft5omdN5Tw/WPWNDOD6C252TVBAgkjXObz+OBDecSKt2o1BGT3U3CxH16T?=
 =?us-ascii?Q?Rqmm22u8iCW/KFIU5pQNfype8IcYQwfTyWIxwBGX8YwGHXPB2dXs3QDtj+eq?=
 =?us-ascii?Q?Pu0r1KTfO1ZxwNKwgsBzqlAlF8dLK10xxchhTXDn6hN5VJ24+m8CGFuwVzoZ?=
 =?us-ascii?Q?gGYnKrqnxg5D2J40cvVYyJgJl5Y3+r4UqhWPGzPLkiyeyPjojyPsuw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:07:53.1037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da7fbdaf-95e1-45b2-263d-08dd8c7d7bdf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7093

Cixtech P1 (internal name sky1) is high performance generic Armv9 SoC.
Orion O6 is the Arm V9 Motherboard built by Radxa. You could find brief
introduction for SoC and related boards at:
https://radxa.com/products/orion/o6#overview

In this series, we add initial SoC and board support for Kernel building.
Patch 1-2: add dt-binding doc for CIX and its sky1 SoC
Patch 3: add Arm64 build support
Patch 4-5: add CIX mailbox driver which needs to support SCMI clock protocol.
Patch 6: add Arm64 defconfig support
Patch 7-8: add initial dts support for SoC and Orion O6 board
Patch 9: add MAINTAINERS entry

Currently, to run upstream kernel at Orion O6 board, you need to
use BIOS released by Radxa, and add "clk_ignore_unused=1" at bootargs.
https://docs.radxa.com/en/orion/o6/bios/install-bios

Changes for v7:
- Patch 8:
	- Refine *_scmi_mem nodes for their properties ordering
	- Delete Krzysztof Kozlowski and Fugang Duan's tag due to substantial changes
	- Add two Tested-by tags from Enric Balletbo i Serra and Kajetan Puchalski
- Patch 4: Add Krzysztof Kozlowski's Reviewed-by tag
- Squash two patches as one for arm64 defconfig
- Rename clock binding file from sky1-clk.h to cix,sky1.h
- Some of my Sob are missing, add them

Changes for v6:
- Rebase to v6.15-rc2
- Add mailbox driver
- Add device tree description for uart, mailbox and scmi firmware (for clock).

Changes for v5:
- Patch 5: Delete pmu-spe node which need to refine, and add it in future
- Patch 6: Refine MAINTAINERS for all CIX SoC and adding code tree location

Changes for v4:
- Move add MAINTAINERS entry patch to the last, and add two dts files entry in it. 
- Add three Krzysztof Kozlowski's Reviewed-by Tags
- For sky1.dtsi, makes below changes:
	- Add ppi-partition entry for gic-v3 node, and let pmu-a520 and pmu-a720's interrupt entry
	get its handle
	- Remove gic-v3's #redistributor-regions and redistributor-stride properties
	- Change gic-v3's #interrupt-cells as 4, and change all interrupt specifiers accordingly
	- Remove "arm,no-tick-in-suspend" for timer due to global counter is at always-on power domain
	- Remove timer's clock frequency due to firmware has already set it

Changes for v3:
- Patch 1: Add Krzysztof Kozlowski's Acked-by Tag
- Patch 2: Add Krzysztof Kozlowski's Reviewed-by Tag
- Patch 6: Fix two dts coding sytle issues

Changes for v2:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=vendor-prefixes.yaml
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=arm/cix.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- Re-order the patch set, and move vendor-perfixes to the 1st patch.
- Patch 4: Ordered Kconfig config entry by alpha-numerically
- Patch 5: Corrects the Ack tag's name
- Patch 6: see below.
1) Corrects the SoF tag's name
2) Fix several coding sytle issues
3) move linux,cma node to dts file
4) delete memory node, memory size is passed by firmware
5) delete uart2 node which will be added in future patches
6) Improve for pmu and cpu node to stands for more specific cpu model
7) Improve the timer node and add hypervisor virtual timer irq

Fugang Duan (1):
  arm64: Kconfig: add ARCH_CIX for cix silicons

Gary Yang (1):
  dt-bindings: clock: cix: Add CIX sky1 scmi clock id

Guomin Chen (2):
  dt-bindings: mailbox: add cix,sky1-mbox
  mailbox: add CIX mailbox driver

Peter Chen (5):
  dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
  dt-bindings: arm: add CIX P1 (SKY1) SoC
  arm64: defconfig: Enable CIX SoC
  arm64: dts: cix: Add sky1 base dts initial support
  MAINTAINERS: Add CIX SoC maintainer entry

 .../devicetree/bindings/arm/cix.yaml          |  26 +
 .../bindings/mailbox/cix,sky1-mbox.yaml       |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  11 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cix/Makefile              |   2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  39 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 331 +++++++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/cix-mailbox.c                 | 632 ++++++++++++++++++
 include/dt-bindings/clock/cix,sky1.h          | 279 ++++++++
 14 files changed, 1414 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 create mode 100644 arch/arm64/boot/dts/cix/Makefile
 create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
 create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi
 create mode 100644 drivers/mailbox/cix-mailbox.c
 create mode 100644 include/dt-bindings/clock/cix,sky1.h

-- 
2.25.1

