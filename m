Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021090.outbound.protection.outlook.com [52.101.129.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE07127990F;
	Tue, 15 Apr 2025 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702053; cv=fail; b=gLeQKzyGG+PB0/uIET+NmOHBRPo8yiyw+f582TG7u3QNP6Eocv9u6AEfOgyKFAfhAGBHUj5bFwA7hIDRRBXdt2HzNE4RFbtCDWC1B65TNCGyjxbGrsS1WGUUttczYOunm/P8zW9N4yGgWqg2+tK8mnmVYL8+aJkKjnMHOOMo77s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702053; c=relaxed/simple;
	bh=LJdvN5dKziBR+S+jI4p5mWBtfvg06+Acx+iSXXlFl50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=PYgwiXM9hubRt1CjHzYcCDg1GLqccnEr/8riNyVIeFeNhZftsj43dmLv9a3E211Sj7B0sMGOlolCsCv2CZYllh0fv2XLjoIIUTxTx+PvGiJJZAOtcGdAxuTF0byuc4hRIiLLVtoVJVWNs8hDt0sTVzFJwUFtYXulrTz/EBjRs9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.129.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UF6CaPNqwUdPjW+IzXS1ej5KRPtXgQbLZvY2I0dV9F+cYClC/6O2/9d2unYnXpZYrKM7uFNS+B8JaAl16Tq+FDlAthlzT4rffiZSDLJqcrS22Y15UHuUF6v2bigMqkdcgYUdLTNEWKma7kPvERXlb1b9h5RC33MNc+fOTdqywL91XovZCVp3nmtDMTSvL4+1QTDxRrV4+hIJ/73hM+dTvtNfvDhjmj29pDro/LEX/KEyRMxjfZabVI35xNeCN8PCR8EdzfeKK6mWb3rhgjHap6WR6iIJ2Xn+q/Voym6yFb6kZ1gWPABTfPteSuU8HKfQp2xmh0ubeHYHy6Sr3+nR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETv+vsW4HNn1gYubKB12W7wNR2HZKo3rMtxj77MUZpM=;
 b=cWKEKNgSf1lXWMmXEtxiAb2c9kC1l/tX1i70p0a7rExYglywOR+iuUru8M3ECS5OC3//ayMzAxxmM2MLDd+K+1U8OsARh4ubSHHUb+Z3f5tDcH5WlCWa/lE2rbGKojGC/ueoVjvsY70t+aAt1bgFKlsstUkBcvuLk4R6VJGcsE4YpOKQVvP0znuZ/FaxoMzshfhgLL9MIEKQpC7hw44wENHY90FcIDzYbXNLxU+8AgK41dyhJRxXgu10MfoGbvGD2ksyn6grvNu7FgzLhuHxzJn2zs9H2DCF+DMxFt6HslO1ya3tkEQtwCJzdoTRNml6nRR4OIDnhrW1bYVyFb6/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PSBPR02CA0008.apcprd02.prod.outlook.com (2603:1096:301::18) by
 TYSPR06MB7067.apcprd06.prod.outlook.com (2603:1096:400:46d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.29; Tue, 15 Apr 2025 07:27:26 +0000
Received: from HK2PEPF00006FAE.apcprd02.prod.outlook.com
 (2603:1096:301:0:cafe::e1) by PSBPR02CA0008.outlook.office365.com
 (2603:1096:301::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Tue,
 15 Apr 2025 07:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK2PEPF00006FAE.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 07:27:25 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6A6304160CA1;
	Tue, 15 Apr 2025 15:27:24 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
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
	kajetan.puchalski@arm.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v6 00/10] arm64: Introduce CIX P1 (SKY1) SoC
Date: Tue, 15 Apr 2025 15:27:14 +0800
Message-Id: <20250415072724.3565533-1-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAE:EE_|TYSPR06MB7067:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c4426524-6c57-4474-ffd7-08dd7beef863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tuhVfjI9C/QgODfrdx7MTk1vwqvsPGKb4aXV4QtI/3lDandBSDCVMm8zdTaA?=
 =?us-ascii?Q?j/s3lrbLKBV2y9RSlLOHv23G+o5SS9b5FXYvJxA8S7PBg9vsA+sjG5S448mL?=
 =?us-ascii?Q?xsVnRqgOY/2ojFlDfA/HpkUoYyr0CDa8QqD4x+0z7E/FwXICAlDWfXqduXX7?=
 =?us-ascii?Q?vwgfKDq5b0TF5NgFwjmvsyZr/hhmocKQZNdD4EVrLogaU5kuQlFLk+fDsTrP?=
 =?us-ascii?Q?XDBi7HS/6CY7azyWytdaZG5rrP/g4Dn1uf2LHfNsJ8aVi5eFLphTz3uYLrMX?=
 =?us-ascii?Q?DoTJrAgy2u5AMeRuUewlehy/l8fqukJnletceoesB2liajlHkKZddHCtAl8K?=
 =?us-ascii?Q?vCtb/KKVxSfjNd1xdyZRfvMjd7jO73TxnX6Mv6W80fumPxHGG1D+USJMLH2U?=
 =?us-ascii?Q?Xf//UdCI3xcZud29jZDVhFcgiWbOmEamlLDM9EfLdjdHcZk3gXohfckXt+LR?=
 =?us-ascii?Q?GHQLStn3ycDavgB2Y6ixtcqys8mE88CDAzISMR6RSjeNZ9beYSjfF8F7IYdC?=
 =?us-ascii?Q?Fyed7as5RgAyxCepRZ2Ru5nzLWe+MnyFjJL9X2M8HWqoI06fQF6GHa4R+fTD?=
 =?us-ascii?Q?auG9Kqf3x3+mCvopx0LF5MvjCAlaQluzOEqCF7UwU18NxtW7AfxN8UF5seKO?=
 =?us-ascii?Q?VeoCc3vESE75cbMghVyMU5a950CkGgmdhjVPUXjIsHrSxup/HOkHRLt2O/1Q?=
 =?us-ascii?Q?Qd70LBeRE3M1MPUc26k8jNqbhWv0cai5EUvJTHrWsq7S0F6eB8corQ5lT1bZ?=
 =?us-ascii?Q?/J81p/WWiJo6xAH5K2bqkhaQR3aUGWTpKzOEpQtCHK+8qLyF4Tq7fmnlKC4F?=
 =?us-ascii?Q?T3wh/MIW1ZlJ378sYW8zw+ZBCTpKXfW+QwAUAnJrb4YGudr/gF++IST+VDTX?=
 =?us-ascii?Q?h8FKLLVUDQxJbNuMKQ+xKvAqMt7DOM8QNpJ3FjCYrthufh8t5UidWoJxEFwC?=
 =?us-ascii?Q?MTM3bIe/UHiOkd1zaa7ftQu7lNszTwCIVQ7excynuu+t36SCPpBw7ZiZu/2f?=
 =?us-ascii?Q?0mxie38aNOS5CBFpt8fk0Po9huNdmbcym6yTDZzSbLkOagsG8npAErDpBHzE?=
 =?us-ascii?Q?OVDtu7meqXqmJHhmNtKiLrCKVwRJNFON7gJsRRQb0cytQTfIvIv8nmTjLXUt?=
 =?us-ascii?Q?AWp7/+J6+7Z0bMj63WV4gPGXhzeN5qSH2tnYwEwqigTiUeLxW5Qx53Dd7XBI?=
 =?us-ascii?Q?gq8tR5XQQjWi+GEG8Hsq0RLJuIPVI3PinObk73t6uj2CNxG55gk3VKEv2eXX?=
 =?us-ascii?Q?zTrlXx2Z9IRlIeS+aOQcf7eeZa15ge3qmiaunE5Zvb92QF17SZsq+Xjm9F8+?=
 =?us-ascii?Q?XPYJ0NKMbd/6LYNDiRdZtEjnC6avX/AZVjdQY33QjBODKDEh/SeFg7N4Pl/y?=
 =?us-ascii?Q?gTV3Riqr1d7NLTlh26Cp/m5JnTo6121pD3K31XN2cIpNnWUqOFzAKmlVPT70?=
 =?us-ascii?Q?bZFxmgMq5YbGiPt4miwgXIzNqDbfBHUqS8lolNC0TmsGEEZTPNZPtQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:27:25.3714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4426524-6c57-4474-ffd7-08dd7beef863
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FAE.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7067

Cixtech P1 (internal name sky1) is high performance generic Armv9 SoC.
Orion O6 is the Arm V9 Motherboard built by Radxa. You could find brief
introduction for SoC and related boards at:
https://radxa.com/products/orion/o6#overview

In this series, we add initial SoC and board support for Kernel building.
Patch 1-2: add dt-binding doc for CIX and its sky1 SoC
Patch 3-4: add Arm64 build support
Patch 5-7: add CIX mailbox driver which needs to support SCMI clock protocol.
Patch 8-9: add initial dts support for SoC and Orion O6 board
Patch 10: add MAINTAINERS entry

Currently, to run upstream kernel at Orion O6 board, you need to
use BIOS released by Radxa, and add "clk_ignore_unused=1" at bootargs.
https://docs.radxa.com/en/orion/o6/bios/install-bios

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

Peter Chen (6):
  dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
  dt-bindings: arm: add CIX P1 (SKY1) SoC
  arm64: defconfig: Enable CIX SoC
  arm64: defconfig: enable CIX mailbox
  arm64: dts: cix: add initial CIX P1(SKY1) dts support
  MAINTAINERS: Add CIX SoC maintainer entry

 .../devicetree/bindings/arm/cix.yaml          |  26 +
 .../bindings/mailbox/cix,sky1-mbox.yaml       |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  11 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cix/Makefile              |   2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  39 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 335 ++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/cix-mailbox.c                 | 632 ++++++++++++++++++
 include/dt-bindings/clock/sky1-clk.h          | 279 ++++++++
 14 files changed, 1418 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 create mode 100644 arch/arm64/boot/dts/cix/Makefile
 create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
 create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi
 create mode 100644 drivers/mailbox/cix-mailbox.c
 create mode 100644 include/dt-bindings/clock/sky1-clk.h

-- 
2.25.1

