Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022087.outbound.protection.outlook.com [40.107.75.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06231137C2A;
	Tue, 13 May 2025 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101818; cv=fail; b=l1QkeqZ2keP8SrIwj0hdH1B8OxQzL4eCsYEi2BPxb9vFj1YCqv4ebnF77z8g/hAdbewt8Q8v4PATiY7vVCYWE+wWybwy4pH3fpfg8OVVDex6XssFJr81kWT0Di1CtPD3aJBAB7yzlSwzUsh2CO3/+mt+UW77pRBGuvRw46Nig0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101818; c=relaxed/simple;
	bh=xp9ffP8/zFuMrAD3qHjXyU2ZTO+HevE8QHqfXCB0Foo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Jf8SBXk/6cis6OKGkxk6TK+6s/TL45kpUQx/PidYzfWF4Jk03CQD3fYgQo2q+1iXESduHfhPAcwkcOvyyxEwm85dExpyt20SrTImmiqNYGNJtlwWsdz+r+G4ImR+oI/r2K68Z/po0m25WpBXSe5nr/fjvyo59UWksH9wBSU783U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=as5vpLiGnEXEFf8RArxAwf3kpU/9KacQ5kM+7PGzpMZcqMwBRfW4NAubhfkoNptmwFTjAWdNym7w0887eo/QjcKusCczwIoWaRvAMNgLFC4C/AUdwjPnXekqeDf/qMKG5I6jhZ9fbxxNfPY0px9aICQ8RXf4kWdb5o+BcZS1LiAGbItfES/HhSUEO3btzpBJ9mJigwnrYAXQGR7AzQo6o9nvi8yxNKIyL0RVOrAt6iEf+vBD8mT6gLCYJoIWpJEWEozxgSDPUXFpqT8m0qk0OCsX681vCRVwUsAwCcPqR0Ve56X4wqhYkVUx+qNpRdhoXiG7SNlIq2iQiJXEGw30ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0N5yTL2sG/4Ad+L1UGFRYyeVZKdPB5hjMPVywOCjW8Q=;
 b=iMwuFU7X2Uy4GA6GuxegttT0T7fmNqSTlTy7YdZJVTdzeAX83Td5J5wJvQICLuz5rA8RJaUSTWoRCecTDvXKVJhzViVq4prYz4T5EZ8UoUzOFfUjEMhW1RsF/APuD6A/2iqDiKMefuZfi6YRZ1IWOFZSsMbi6KDoJTgl9+SiFu9sfq+Ht0Xiby6oMU2sNpE9N2wymeQWCqU3lKwmBxFYJ9j9AYatsIUX9Bm7iwgHPWaxSeUikqDXHid3X3v5WGftKFlNRCpeOAVtjrZZ0QqgCo30QFJRTJO4wOaT8XAyYJQfl43wCKVym7dJaaYFReJhZLNJruM9OI2FG0sZN/Yluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0048.apcprd02.prod.outlook.com (2603:1096:4:196::23)
 by TYUPR06MB6269.apcprd06.prod.outlook.com (2603:1096:400:351::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 02:03:29 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::19) by SI2PR02CA0048.outlook.office365.com
 (2603:1096:4:196::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:27 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2714640A5BFB;
	Tue, 13 May 2025 10:03:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v8 0/9] arm64: Introduce CIX P1 (SKY1) SoC
Date: Tue, 13 May 2025 10:03:18 +0800
Message-Id: <20250513020327.414017-1-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|TYUPR06MB6269:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ae6de770-75a5-48e4-9dc0-08dd91c25a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UlwqZnKO5A7jV9VOnkTa35P/grnDe7pVizYpWoXNXEw13q86J6vJ+rvzJOBB?=
 =?us-ascii?Q?92I6z93cRGoeAKH6z5CjV/cwkcZYqt6z8+Pdggo5XN2NNMixUy3zAJcQCl0W?=
 =?us-ascii?Q?ED1V29qTQdB7MQdL6zSV7Ok9QJNdNEEL5ikctqHVK+/0VK/YUITnOT3xpcWW?=
 =?us-ascii?Q?0LzAi3G4T7VkTUl8HoQCbHsldrM9Ck32tRsrlPLOD7WDonq+H5sA4mnlrOau?=
 =?us-ascii?Q?o6YKT6N0gPKSyXMVCwj7zAhITYYSQgRS5TVljZws+jkoJIWqGnpxkKUi55Fz?=
 =?us-ascii?Q?iiq39Fiu+qXNMO0ntCfWjNWE93rECEXpfEufS5M/MwoZwiFx2feq1QQh2UYh?=
 =?us-ascii?Q?bkygCDYF5Fl+wQNnqxMco6hkRiCRtqE6w/E1jnaZHMGLY247Dp3eNfHJJ3M7?=
 =?us-ascii?Q?JZviE6+db0K6Ao4CgNUmDmsAerh6ZPemoTJ+WITG/UXzdLo2FZHPUIzwfMSC?=
 =?us-ascii?Q?HUQUv/vdu4/46mgdQeO6y16hrxvy2GD5eTM7VrFxPmpYwCRnJEuA/D2komn7?=
 =?us-ascii?Q?tpfcevUhQ3f80n6COcfeXZrPB9GNVx8/tS+mz8oZ+SsnOFDMmoXvkWziYIXb?=
 =?us-ascii?Q?RO6gmZg1f9SemOKW66RMpBmgIdr9YT0VNoQdcBT0jXwwYVxZCeHkFw/PvNtr?=
 =?us-ascii?Q?z9T/4Es8I83s8ZxAwmbvWjYNG01Rdqk8huU3nq/zTQbsyJk532j+6/+KoicJ?=
 =?us-ascii?Q?LF+Ae3tJ2GC1/CeG/FhGqKQ94k37OD1mH0hdA/VvZ6IhVCNJZFeNjKdK/ugx?=
 =?us-ascii?Q?gDeHUV/0S3DCP9pKCEOJZ8/Zy990caaND7Pgzcce/QfJTTye60BhizdkATrL?=
 =?us-ascii?Q?1NlKLb9TveNeQiMrPOfHNQpqXU9v5/xw6smWPFWYU8rI1+cjDtxfTQYreiCJ?=
 =?us-ascii?Q?GRVsnEV2DjTQ1v/iqxi/wjX0TuagoS/qWboNquKnEXGQZM8ZAHk7DQ5W7kwe?=
 =?us-ascii?Q?H02sCMLG/Ere82G/vSGHdV5mNjqw/a9CfFiKt8L6W30mIGBi5PIsytbAby6/?=
 =?us-ascii?Q?I1Fo1igBWzzMCUh+3sPiDJ9Axyx0DxthMXhPwLSTAfP0+hjWGlYySe+7Tw9t?=
 =?us-ascii?Q?oACtGjgjygAut5P4CS4CUTEAdFk2hr4muYpO+FtZwMWR5jvamb02ory0nRp2?=
 =?us-ascii?Q?uhknyV6V6j/VgHYrAVoJV5C1f9qaG4FaVGaUVxN+tTwueg5UbXFvXeG4Wp+n?=
 =?us-ascii?Q?tuTWzwlxsvoW96DhZghXTqzoq31zgNH51UuVxCEGfUUiKvqSPu2MM1vK2NqD?=
 =?us-ascii?Q?tEomgnfge9ChJRHzSplqYtFcJyQqcFcCuw1NCTdL3ZxGkzWSBHCNME0VODve?=
 =?us-ascii?Q?6r7c+VV6QH1Ooc65aTvmYIQJFVphlxoGDtwX94l3GMOTsPdnMKB5x0SJlkjA?=
 =?us-ascii?Q?1dQh2KSACG4C7itzKTrSKeGHNQly+tQdBvKb5v/3cqU+bPQzIvYIHTbsF3xe?=
 =?us-ascii?Q?nKCNs5/H5YrBcw0Rx3hhPv0w54aeX/a6GPME64xYUIjVQCuTDIfaPQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:27.7597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6de770-75a5-48e4-9dc0-08dd91c25a31
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6269

Cixtech P1 (internal name sky1) is high performance generic Armv9 SoC.
Orion O6 is the Arm V9 Motherboard built by Radxa. You could find brief
introduction for SoC and related boards at:
https://radxa.com/products/orion/o6#overview

Currently, to run upstream kernel at Orion O6 board, you need to
use BIOS released by Radxa, and add "clk_ignore_unused=1" at bootargs.
https://docs.radxa.com/en/orion/o6/bios/install-bios

In this series, we add initial SoC and board support for Kernel building.
Since mailbox is used for SCMI clock communication, mailbox driver is added
in this series for the minimum SoC support.

Patch 1-2: add dt-binding doc for CIX and its sky1 SoC
Patch 3: add Arm64 build support
Patch 4-5: add CIX mailbox driver which needs to support SCMI clock protocol.
Patch 6: add Arm64 defconfig support
Patch 7-8: add initial dts support for SoC and Orion O6 board
Patch 9: add MAINTAINERS entry

Below are the review status:
Patch 1-4: received public Reviewed-by or Acked-by tags
Patch 6-7: received public Reviewed-by or Acked-by tags
Patch 8: received public Tested-by tags

Changes for v8:
- Patch 6: add Krzysztof Kozlowski's Reviewed-by tag
- Patch 7: add Krzysztof Kozlowski's Acked-by tag

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

