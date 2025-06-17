Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E12980AF;
	Tue, 17 Jun 2025 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155788; cv=fail; b=FCAickg8rs/a4njIxJMngUmGq/YjvXPsP9OeGQHYXEjWU1i3hpl2zDBaR94CVUZAl74I6aMVTH+PzACjc4qSCsyCPIacqKMqiXjjrKi3ehAAuUfw1OgmBQZT+kmzzkg9LpICysvLe/q9jIh+AOAPpX5PPuAW2tLMOlPaG5ZBVjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155788; c=relaxed/simple;
	bh=rpX7c+jKGy9q4Uy+DZUAfE0srIEMnth7uFM6JGaKyeI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LIgpk5MDCF0DzqVheyQ7K6SSZAi+D7UToIiovGTNpfPPYLBrPhkbMWU9B/MKuxIxs4sVj0AmJLdAjHfvAFFoM9bafUlACUW/HcAQtGFvkGrSOcGnanyx1cjb2baSK0JTp+BFEY5EtVSiGzfxgzmB0ySz91wRua/mC1kLhyFVpKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kj7hcplr; arc=fail smtp.client-ip=52.101.70.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kj7hcplr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDudQOTnKlvG3h6UVQtQj/tO6N1H/O+r0IJOi01mYXU4L5yS3DDdCoYt2Xzxw8riUaUQUdkSZzQ9aIDd7EB+Fy7GoIHxybFOAK7N7kEaiuNV4hbJT776Sz9prNRUOHUouvjPLuI3zlOFE5qF5nd9Qg4vkJ8yvrV5uzsOLxRNFT7WY1Hkf+g9Ap93gPIA4ubORBd0X+HGeaYdb8QEoUbzVLF8fZGITyOvElaDGVWKgFLeZ1e0eXsYOF1xR6QCvfSf/Y4bBkv2G1kxj2fo5k7BWa0BKV/J2/xNURP2vNrvVFQsfsfhDeTomfMOJVRsOiqnLGoQcaxn6286EWQ2vebnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSEgVD9P8iKcFw/leh9MNMD34O+e3lW04Cr21uD0kxs=;
 b=xc3bpuhwHHzO9HZ0sfc/aZCBGcy7xAbyJ4xBgM95M2OVGEY2duTM4qydFBkiq0T+QFGQE8Ag/tvevCwAt7QUZXHJyKtwWLKcV6TsCZTS8RUMdcqwbpWhMcESZiFToK1fTVJxwP2T/0X7hMI1N4gJOL42d09UaTfZospUiuUwnNsMxQAJ8b0GYgTxtq7V7ldbQAmItYwLVaymIaMZwcVASKBjOoyqUy/PM0wCcXH+7Mu0qQfR5Sr/OKF4FpfHmAZ0+hhvxczDo7ec7R3HfQI7ResVFLNAkz1fCZVsIrxA4dYeIbzkCC1hMohWSJxcKzVE9rUQvCYx5JkXOn/2ELvcUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSEgVD9P8iKcFw/leh9MNMD34O+e3lW04Cr21uD0kxs=;
 b=Kj7hcplrxlwSSOG/HC3KEGbrv9TSHR5DXbSf+alldWSA6ZgswZHPVGhDTZV6l5To3RB+20KmL6TdvjOKtQxq9/lqb+VWdaNnBbvB5iyDR2VIobxWAb8cHunbushgM99xP2u/li5Yz90gK+kQPF08teVdy8defIoVoyUPwyr0UCUtHPytcqf8LWA9O1JIoO6lWAQMliZFhAddvBgNR6fHnygODdozeZATcffXgHIZUcFEOYkiHrnOdhe2/7r43jcueuOkoj/7Bt2fFBjapMwsX6wpLXIuj5Pr8yrHVpDxfDISFx0Z+KZpD5G0MIsqLOQwf+4xzAeYz40M2fcSMXcNgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by DU2PR04MB9131.eurprd04.prod.outlook.com (2603:10a6:10:2f6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 10:23:01 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 10:23:01 +0000
From: Joy Zou <joy.zou@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	frank.li@nxp.com,
	ye.li@nxp.com,
	ping.bai@nxp.com,
	aisheng.dong@nxp.com
Subject: [PATCH v1 2/2] regulator: pf0900: Add PMIC PF0900 support
Date: Tue, 17 Jun 2025 18:20:25 +0800
Message-Id: <20250617102025.3455544-3-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250617102025.3455544-1-joy.zou@nxp.com>
References: <20250617102025.3455544-1-joy.zou@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|DU2PR04MB9131:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d90cac6-2094-46fa-7791-08ddad88efec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VCWYsWksFLB0yD/ya0VPrJexjG+7rSdQrDUEE9N0vzmQATUohEyzKvtlsc3z?=
 =?us-ascii?Q?SgEdGBh/AXCisIbBOMu8LlsrohU/CMU03OirxcHrntqc45Ik1fViwPdUzBer?=
 =?us-ascii?Q?LneIeKfwm5D//x4e29FB35rihagElDmE28sOPwEN/YmGHJIn/p4cLNKXBEig?=
 =?us-ascii?Q?Gn+0rLR9ye6q/zwthLuk4yB4Fu9dQfVT3NUdVRJzqPVk8WN3BUZ6MY/TEftO?=
 =?us-ascii?Q?d/pZbyNUJkXpz5wnynXFTZAJ+IqW11nobBpwvBtmAkrvU/B/joepNHxMs9t5?=
 =?us-ascii?Q?Fz3gKuHrzbbLp2Q8fh7NlSSUNB4UsxVovWsU6ntl+4KjF00Gr4ptCm1GgdbA?=
 =?us-ascii?Q?rlPy64Iqyomndqpc/WyeJ2ugAPxEWZeWfXlRF9+0wmcvlDijP3l8JmKan5Gc?=
 =?us-ascii?Q?G+FRNPqtwUnGbPAA0f5TzfWLVxo4XexKPYs2c4nIUjp689RraZldxt8itOmR?=
 =?us-ascii?Q?yW9lwXJkUgnDjFkUErq+Xw0eTych0megvq+eisMIUuxzK+TFAZbofJ3foRia?=
 =?us-ascii?Q?iCbZ4haiihKSq505nKtYA/L4gfJBHsZifsaII5+6jQ7Ru9Y/2K1Imm7DOKRw?=
 =?us-ascii?Q?q/Xx59k8EPkVSQd+1P/W2kKSQBlFLfgY51qB3PK171hHdo4TbX6LtJz4s6BZ?=
 =?us-ascii?Q?Z9Vhj+Hi+zyt3tFYorEftfxizD3mshajn9bTiHWqa1vMAuv33r7LeiyC7pdA?=
 =?us-ascii?Q?eSVQcvBRH5O/djoKzWik04wMzLNvWsePy1aeSkEsJj6ksanmt5iu3C+Ml8qj?=
 =?us-ascii?Q?kNOSPQIBNnbMqjEbH8QH8gVCIoacFjs2s/7Fyzur8YzW11cVqw8L6QH1jX7F?=
 =?us-ascii?Q?zfabdylGRVY8yM73VVbk+9VxPhq/e61SLQNinYo/XmV5fPOOIJYD9zcyxg4C?=
 =?us-ascii?Q?P47FOqH5ka+N2CW3MgNEfPK3apbBtKV0F5SSTayNLrpLRKwLTx77S0i0USfv?=
 =?us-ascii?Q?8FYd4XgZABPoLcwsWOVo8aAP6yrIksrLCI0xf2YqIloo7qApH1s6OFD5hIlQ?=
 =?us-ascii?Q?Li/gv01pfFyF9Ejz/EaQl2DUlp/J0zu7SBkWJepXHcxihBGMxSrifZhTjCVU?=
 =?us-ascii?Q?agYTU6bkGxfZ8SS7sctzbtz6pA950FeNRSChv5+DcYf+IKfRCJros16zjJdw?=
 =?us-ascii?Q?uMSGuwd7WJdNbEu6q1sQSb8kKqVGRH6YtasJcye3JRU5g5MWb90aYJGpTSOj?=
 =?us-ascii?Q?LEi/fM/7QazAymjMFTjYeMDl2ME/E0ZWbA3CTr+QZRUvpdMFOuMiFyHlVdIY?=
 =?us-ascii?Q?YfVhfaRrdj0ure28IFtSS1dnS9zeTwRWYXDz2GELW5szFFxmiqvHRuwoTTI5?=
 =?us-ascii?Q?pGhHVuu9G9/S5MoiB8J/FYojf4cjEDwm99xEhPr4UbqTbaa+OFuZhTdNgpgo?=
 =?us-ascii?Q?dA5B82kLuFTd2SJoyN60FIUHu282M+Fb8YndVwqbwtTdLuiVDYQWS/uSCTPd?=
 =?us-ascii?Q?c/mS9Tn4Wq7O1B/A0lGa+ziURy0i3vSlWzvzWPI64uJovL814BCH1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+sPekmQ46dKWd/Z7yFbHJqHQivcEtx0XcbQzMQk6XPenCj4+y7bN7/E78pqt?=
 =?us-ascii?Q?QF1JZztvFZbZELoXTse9m2N2OTfgmRowyBGnHNr/qMDn4IXJ1OW5OBWNOrVU?=
 =?us-ascii?Q?BG7hWuJq/AW3mL4rK3F8LAtvCagFhFisjJJtM96M4oCYzNU5SqMubQPvsC1D?=
 =?us-ascii?Q?Bn2Zm5o0mmQfl0KoOPryK6gNOBfFnKm1aWFiGpEzN1yRfD8fNxDON6tRNndN?=
 =?us-ascii?Q?RcYdJ75jTCULwUi+r+SXRKPDOtrRap+Lxf6WHH6+p6Ih+kRhxpBlH5oWudai?=
 =?us-ascii?Q?XSrROSYkmglbvSM0D2HeWALtzPsKFIaUf/j9dptq93e3h1mmKR0MMYCTYpM5?=
 =?us-ascii?Q?vxbzs7NXpKIj5GJ5GBht+RDs56k6Mi86To7kMg9zfHzvhd5xW5NTx9SK/peV?=
 =?us-ascii?Q?gxCWSFSNU/EE0qjXj2Xj2C2p4vTwqLsu8MabUg3YJ9ZsQmLbBc3JorhUQiJ5?=
 =?us-ascii?Q?fOqmKFaBTgqZ2dEM/WCKfgWnW2mn3QPC7xtSa1XUkj5BOaKmf+9TXl86obzH?=
 =?us-ascii?Q?HN7bqwiHWPNi2JKiO6WuyTWahKLpPICK104pWhcFoohBTaV9QualZG2evegg?=
 =?us-ascii?Q?lryFRVhjRcML9pvljfqGNAev+L4VibRPeuhu3GvZBICFEcXgc+7r0iiGwvzD?=
 =?us-ascii?Q?UpU4Jo/gVJRCEmO0cS6jjAhGJGbzvmdq7fhI+qH3+GURH1Vr4eihWslu55M5?=
 =?us-ascii?Q?nW2ZJPjSft4Cm7xZoHI1/AAatad4vudW7FIodXoykxOevq6Ba+1yKLih+EPd?=
 =?us-ascii?Q?0fqgtCxYpYMjthlZA1s6aEW0mOIJWMLpCt7HrVTZZIzYuqANgxq/4ebFSasu?=
 =?us-ascii?Q?7ueiIqKF/4cTcSlXG3vkF46NqAaPc7tmLxx1O2ErilJ9FMed+bq1AkLVkotH?=
 =?us-ascii?Q?xxbVL08cOtYdOxLzaEKTd9JMiswr0+9bfH3qCfPsm34n54qjekConSDC/Tp6?=
 =?us-ascii?Q?I1lwE2uRlgthfR5ctRjG4L3/Z/f/iKHW8rqwfvCh5acKzi8P4Wafa8JddEj4?=
 =?us-ascii?Q?cGYLLRzLTBpNo34uaOgXEUXd7ouRTQ37B8Mt1vqv8DKVlqrjudmcG70r6z27?=
 =?us-ascii?Q?SqGpOKH2IkS5lQMxnurEYzbdzf4ex6YZpIPDI2+oz5INYjs2u9KZI3eN8euq?=
 =?us-ascii?Q?ssKfISzWLBJdynERpvS/OQ9xLFhT2wj8c9lYZ3Nu2tROpfvWJHZIZmI8VHap?=
 =?us-ascii?Q?k97/mo1LJrgm2+o3eRD8/mWDRhbaUJAd/KeFu+sxTrKFKyGoc1+sOU/J8asQ?=
 =?us-ascii?Q?gg/41NAErO4xjbnR0QfFUvGsscA+Ytm8mfOHGCv11wcoVpI9uoNgLOuutbsq?=
 =?us-ascii?Q?Z0yxosvAh1I7vKgAXrKUCsBcRrSOl/pCWMmCqBj/lfMZnMC9lr+/5wQ4vfi1?=
 =?us-ascii?Q?kaeKhS4AIfkUhGASXCg+q0ZeT8bf3zo7nrlGjg8cAvMSQxWyO7sY2jDj316v?=
 =?us-ascii?Q?pi6HtS5bdth1brq8NQ5bFVOhqsX4kA1FX3vPGEA7vwXpWQIN31Rz/sRPQnDg?=
 =?us-ascii?Q?RTJWj6hPUIRYpKJ9CarHg+Pvf6vv96hJs0MiAGIv4OcKAHrTN/WnXfJ9NynU?=
 =?us-ascii?Q?zhiDgaUpS+7lbdJzinj/YUggTdmU1a2HABmEqowG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d90cac6-2094-46fa-7791-08ddad88efec
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:23:01.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02zUgM0Vju78fT5BvxXRXUT8YefAX3k+B3v6sCOX9YPcYUpKg+ZEQdXYd0mm5EHo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9131

The PF0900 is a power management integrated circuit (PMIC) optimized
for high performance i.MX9x based applications. It features five high
efficiency buck converters, three linear and one vaon regulators.
It provides low quiescent current in Standby and low power off Modes.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 drivers/regulator/Kconfig            |    8 +
 drivers/regulator/Makefile           |    1 +
 drivers/regulator/pf0900-regulator.c | 1033 ++++++++++++++++++++++++++
 include/linux/regulator/pf0900.h     |  264 +++++++
 4 files changed, 1306 insertions(+)
 create mode 100644 drivers/regulator/pf0900-regulator.c
 create mode 100644 include/linux/regulator/pf0900.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6d8988387da4..02f549a06777 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1006,6 +1006,14 @@ config REGULATOR_PCAP
 	 This driver provides support for the voltage regulators of the
 	 PCAP2 PMIC.
 
+config REGULATOR_PF0900
+	tristate "NXP PF0900/PF0901/PF09XX regulator driver"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	Say y here to support the NXP PF0900/PF0901/PF09XX PMIC
+	regulator driver.
+
 config REGULATOR_PF8X00
 	tristate "NXP PF8100/PF8121A/PF8200 regulator driver"
 	depends on I2C && OF
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index c0bc7a0f4e67..cac5b346ca90 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_REGULATOR_QCOM_SPMI) += qcom_spmi-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_USB_VBUS) += qcom_usb_vbus-regulator.o
 obj-$(CONFIG_REGULATOR_PALMAS) += palmas-regulator.o
 obj-$(CONFIG_REGULATOR_PCA9450) += pca9450-regulator.o
+obj-$(CONFIG_REGULATOR_PF0900) += pf0900-regulator.o
 obj-$(CONFIG_REGULATOR_PF9453) += pf9453-regulator.o
 obj-$(CONFIG_REGULATOR_PF8X00) += pf8x00-regulator.o
 obj-$(CONFIG_REGULATOR_PFUZE100) += pfuze100-regulator.o
diff --git a/drivers/regulator/pf0900-regulator.c b/drivers/regulator/pf0900-regulator.c
new file mode 100644
index 000000000000..4ef94d8e1e23
--- /dev/null
+++ b/drivers/regulator/pf0900-regulator.c
@@ -0,0 +1,1033 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP.
+ * NXP PF0900 pmic driver
+ */
+
+#include <linux/crc8.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/regulator/pf0900.h>
+
+struct pf0900_dvs_config {
+	unsigned int run_reg;
+	unsigned int run_mask;
+	unsigned int standby_reg;
+	unsigned int standby_mask;
+};
+
+struct pf0900_regulator_desc {
+	struct regulator_desc desc;
+	const struct pf0900_dvs_config dvs;
+};
+
+struct pf0900_drvdata {
+	const struct pf0900_regulator_desc *desc;
+	enum pf0900_chip_type type;
+	unsigned int rcnt;
+};
+
+struct pf0900 {
+	struct device *dev;
+	struct regmap *regmap;
+	const struct pf0900_drvdata *drvdata;
+	int irq;
+	unsigned short addr;
+	bool crc_en;
+};
+
+static const struct regmap_range pf0900_range = {
+	.range_min = PF0900_REG_DEV_ID,
+	.range_max = PF0900_REG_SYS_DIAG,
+};
+
+static const struct regmap_access_table pf0900_volatile_regs = {
+	.yes_ranges = &pf0900_range,
+	.n_yes_ranges = 1,
+};
+
+static const struct regmap_config pf0900_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.volatile_table = &pf0900_volatile_regs,
+	.max_register = PF0900_MAX_REGISTER - 1,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static uint8_t crc8_j1850(unsigned short addr, unsigned int reg,
+			  unsigned int val)
+{
+	uint8_t crcBuf[3];
+	uint8_t t_crc;
+	uint8_t i, j;
+
+	crcBuf[0] = addr;
+	crcBuf[1] = reg;
+	crcBuf[2] = val;
+	t_crc = 0xFF;
+
+	/*
+	 * The CRC calculation is based on the standard CRC-8-SAE as
+	 * defined in the SAE-J1850 specification with the following
+	 * characteristics.
+	 * Polynomial = 0x1D
+	 * Initial Value = 0xFF
+	 * The CRC byte is calculated by shifting 24-bit data through
+	 * the CRC polynomial.The 24-bits package is built as follows:
+	 * DEVICE_ADDR[b8] + REGISTER_ADDR [b8] +DATA[b8]
+	 * The DEVICE_ADDR is calculated as the 7-bit slave address
+	 * shifted left one space plus the corresponding read/write bit.
+	 * (7Bit Address [b7] << 1 ) + R/W = DEVICE_ADDR[b8]
+	 */
+	for (i = 0; i < sizeof(crcBuf); i++) {
+		t_crc ^= crcBuf[i];
+		for (j = 0; j < 8; j++) {
+			if ((t_crc & 0x80) != 0) {
+				t_crc <<= 1;
+				t_crc ^= 0x1D;
+			} else {
+				t_crc <<= 1;
+			}
+		}
+	}
+	return t_crc;
+}
+
+static int pf0900_pmic_read(struct pf0900 *pf0900, unsigned int reg,
+			    unsigned int *val)
+{
+	u8 data[2], crc;
+	int ret;
+
+	if (!pf0900 || !pf0900->dev)
+		return -EINVAL;
+
+	if (reg >= PF0900_MAX_REGISTER) {
+		dev_err(pf0900->dev, "Invalid register address: 0x%x\n", reg);
+		return -EINVAL;
+	}
+
+	ret = regmap_raw_read(pf0900->regmap, reg, data,
+			      pf0900->crc_en ? 2 : 1);
+	if (ret) {
+		dev_err(pf0900->dev, "Read reg=0x%x error!\n", reg);
+		return ret;
+	}
+	*val = data[0];
+	if (pf0900->crc_en) {
+		/* Get CRC */
+		crc = crc8_j1850(pf0900->addr << 1 | 0x1, reg, data[0]);
+		if (crc != data[1])
+			return -EINVAL;
+	}
+	return 0;
+}
+
+static int pf0900_pmic_write(struct pf0900 *pf0900, unsigned int reg,
+			     unsigned int val, uint8_t mask)
+{
+	unsigned int rxBuf;
+	uint8_t data[2];
+	int ret;
+
+	if (!pf0900 || !pf0900->dev)
+		return -EINVAL;
+
+	if (reg >= PF0900_MAX_REGISTER) {
+		dev_err(pf0900->dev, "Invalid register address: 0x%x\n", reg);
+		return -EINVAL;
+	}
+
+	/* If not updating entire register, perform a read-mod-write */
+	data[0] = val;
+
+	if (mask != 0xFF) {
+		/* Read data */
+		ret = pf0900_pmic_read(pf0900, reg, &rxBuf);
+		if (ret) {
+			dev_err(pf0900->dev, "Read reg=0x%x error!\n", reg);
+			return ret;
+		}
+		data[0] = (val & mask) | (rxBuf & (~mask));
+	}
+
+	if (pf0900->crc_en)
+		/* Get CRC */
+		data[1] = crc8_j1850(pf0900->addr << 1, reg, data[0]);
+
+	/* Write data */
+	ret = regmap_raw_write(pf0900->regmap, reg, data,
+			       pf0900->crc_en ? 2 : 1);
+	if (ret) {
+		dev_err(pf0900->dev, "Write reg=0x%x error!\n", reg);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * pf0900_regulator_enable_regmap for regmap users
+ *
+ * @rdev: regulator to operate on
+ *
+ * Regulators that use regmap for their register I/O can set the
+ * enable_reg and enable_mask fields in their descriptor and then use
+ * this as their enable() operation, saving some code.
+ */
+static int pf0900_regulator_enable_regmap(struct regulator_dev *rdev)
+{
+	struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
+	unsigned int val;
+
+	if (rdev->desc->enable_is_inverted) {
+		val = rdev->desc->disable_val;
+	} else {
+		val = rdev->desc->enable_val;
+		if (!val)
+			val = rdev->desc->enable_mask;
+	}
+
+	return pf0900_pmic_write(pf0900, rdev->desc->enable_reg, val,
+				 rdev->desc->enable_mask);
+}
+
+/**
+ * pf0900_regulator_disable_regmap for regmap users
+ *
+ * @rdev: regulator to operate on
+ *
+ * Regulators that use regmap for their register I/O can set the
+ * enable_reg and enable_mask fields in their descriptor and then use
+ * this as their disable() operation, saving some code.
+ */
+static int pf0900_regulator_disable_regmap(struct regulator_dev *rdev)
+{
+	struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
+	unsigned int val;
+
+	if (rdev->desc->enable_is_inverted) {
+		val = rdev->desc->enable_val;
+		if (!val)
+			val = rdev->desc->enable_mask;
+	} else {
+		val = rdev->desc->disable_val;
+	}
+
+	return pf0900_pmic_write(pf0900, rdev->desc->enable_reg, val,
+				 rdev->desc->enable_mask);
+}
+
+/**
+ * pf0900_regulator_is_enabled_regmap for regmap users
+ *
+ * @rdev: regulator to operate on
+ *
+ * Regulators that use regmap for their register I/O can set the
+ * enable_reg and enable_mask fields in their descriptor and then use
+ * this as their is_enabled operation, saving some code.
+ */
+static int pf0900_regulator_is_enabled_regmap(struct regulator_dev *rdev)
+{
+	struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
+	unsigned int val;
+	int ret;
+
+	ret = pf0900_pmic_read(pf0900, rdev->desc->enable_reg, &val);
+	if (ret != 0)
+		return ret;
+
+	val &= rdev->desc->enable_mask;
+
+	if (rdev->desc->enable_is_inverted) {
+		if (rdev->desc->enable_val)
+			return val != rdev->desc->enable_val;
+		return val == 0;
+	} else {
+		if (rdev->desc->enable_val)
+			return val == rdev->desc->enable_val;
+		return val != 0;
+	}
+}
+
+/**
+ * pf0900_regulator_set_voltage_sel_regmap for regmap users
+ *
+ * @rdev: regulator to operate on
+ * @sel: Selector to set
+ *
+ * Regulators that use regmap for their register I/O can set the
+ * vsel_reg and vsel_mask fields in their descriptor and then use this
+ * as their set_voltage_vsel operation, saving some code.
+ */
+static int pf0900_regulator_set_voltage_sel_regmap(struct regulator_dev *rdev,
+					    unsigned int sel)
+{
+	struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
+	int ret;
+
+	sel <<= ffs(rdev->desc->vsel_mask) - 1;
+	ret = pf0900_pmic_write(pf0900, rdev->desc->vsel_reg, sel,
+				rdev->desc->vsel_mask);
+	if (ret)
+		return ret;
+
+	if (rdev->desc->apply_bit)
+		ret = pf0900_pmic_write(pf0900, rdev->desc->apply_reg,
+					rdev->desc->apply_bit,
+					rdev->desc->apply_bit);
+	return ret;
+}
+
+static int find_closest_bigger(unsigned int target, const unsigned int *table,
+			       unsigned int num_sel, unsigned int *sel)
+{
+	unsigned int s, tmp, max, maxsel = 0;
+	bool found = false;
+
+	max = table[0];
+
+	for (s = 0; s < num_sel; s++) {
+		if (table[s] > max) {
+			max = table[s];
+			maxsel = s;
+		}
+		if (table[s] >= target) {
+			if (!found || table[s] - target < tmp - target) {
+				tmp = table[s];
+				*sel = s;
+				found = true;
+				if (tmp == target)
+					break;
+			}
+		}
+	}
+
+	if (!found) {
+		*sel = maxsel;
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * pf0900_regulator_set_ramp_delay_regmap
+ *
+ * @rdev: regulator to operate on
+ * @ramp_delay: desired ramp delay value in microseconds
+ *
+ * Regulators that use regmap for their register I/O can set the ramp_reg
+ * and ramp_mask fields in their descriptor and then use this as their
+ * set_ramp_delay operation, saving some code.
+ */
+static int pf0900_regulator_set_ramp_delay_regmap(struct regulator_dev *rdev,
+					   int ramp_delay)
+{
+	struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
+	unsigned int sel;
+	int ret;
+
+	if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_delay_table))
+		return -EINVAL;
+
+	ret = find_closest_bigger(ramp_delay, rdev->desc->ramp_delay_table,
+				  rdev->desc->n_ramp_values, &sel);
+
+	if (ret) {
+		dev_warn(rdev_get_dev(rdev),
+			 "Can't set ramp-delay %u, setting %u\n", ramp_delay,
+			 rdev->desc->ramp_delay_table[sel]);
+	}
+
+	sel <<= ffs(rdev->desc->ramp_mask) - 1;
+
+	return pf0900_pmic_write(pf0900, rdev->desc->ramp_reg, sel,
+				 rdev->desc->ramp_mask);
+}
+
+/**
+ * pf0900_regulator_get_voltage_sel_regmap for regmap users
+ *
+ * @rdev: regulator to operate on
+ *
+ * Regulators that use regmap for their register I/O can set the
+ * vsel_reg and vsel_mask fields in their descriptor and then use this
+ * as their get_voltage_vsel operation, saving some code.
+ */
+static int pf0900_regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
+{
+	struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
+	unsigned int val;
+	int ret;
+
+	ret = pf0900_pmic_read(pf0900, rdev->desc->vsel_reg, &val);
+	if (ret != 0)
+		return ret;
+
+	val &= rdev->desc->vsel_mask;
+	val >>= ffs(rdev->desc->vsel_mask) - 1;
+
+	return val;
+}
+
+static const struct regulator_ops pf0900_avon_regulator_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.set_voltage_sel = pf0900_regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = pf0900_regulator_get_voltage_sel_regmap,
+};
+
+static const struct regulator_ops pf0900_dvs_sw_regulator_ops = {
+	.enable = pf0900_regulator_enable_regmap,
+	.disable = pf0900_regulator_disable_regmap,
+	.is_enabled = pf0900_regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.set_voltage_sel = pf0900_regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = pf0900_regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.set_ramp_delay	= pf0900_regulator_set_ramp_delay_regmap,
+};
+
+static const struct regulator_ops pf0900_ldo_regulator_ops = {
+	.enable = pf0900_regulator_enable_regmap,
+	.disable = pf0900_regulator_disable_regmap,
+	.is_enabled = pf0900_regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.set_voltage_sel = pf0900_regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = pf0900_regulator_get_voltage_sel_regmap,
+};
+
+/*
+ * SW1/2/3/4/5
+ * SW1_DVS[1:0] SW1 DVS ramp rate setting
+ * 00: 15.6mV/8usec
+ * 01: 15.6mV/4usec
+ * 10: 15.6mV/2usec
+ * 11: 15.6mV/1usec
+ */
+static const unsigned int pf0900_dvs_sw_ramp_table[] = {
+	1950, 3900, 7800, 15600
+};
+
+/* VAON 1.8V, 3.0V, or 3.3V */
+static const int pf0900_vaon_voltages[] = {
+	0, 1800000, 3000000, 3300000,
+};
+
+/*
+ * SW1 0.5V to 3.3V
+ * 0.5V to 1.35V (6.25mV step)
+ * 1.8V to 2.5V (125mV step)
+ * 2.8V to 3.3V (250mV step)
+ */
+static const struct linear_range pf0900_dvs_sw1_volts[] = {
+	REGULATOR_LINEAR_RANGE(0,        0x00, 0x08, 0),
+	REGULATOR_LINEAR_RANGE(500000,   0x09, 0x91, 6250),
+	REGULATOR_LINEAR_RANGE(0,        0x92, 0x9E, 0),
+	REGULATOR_LINEAR_RANGE(1500000,  0x9F, 0x9F, 0),
+	REGULATOR_LINEAR_RANGE(1800000,  0xA0, 0xD8, 12500),
+	REGULATOR_LINEAR_RANGE(0,        0xD9, 0xDF, 0),
+	REGULATOR_LINEAR_RANGE(2800000,  0xE0, 0xF4, 25000),
+	REGULATOR_LINEAR_RANGE(0,        0xF5, 0xFF, 0),
+};
+
+/*
+ * SW2/3/4/5 0.3V to 3.3V
+ * 0.45V to 1.35V (6.25mV step)
+ * 1.8V to 2.5V (125mV step)
+ * 2.8V to 3.3V (250mV step)
+ */
+static const struct linear_range pf0900_dvs_sw2345_volts[] = {
+	REGULATOR_LINEAR_RANGE(300000,   0x00, 0x00, 0),
+	REGULATOR_LINEAR_RANGE(450000,   0x01, 0x91, 6250),
+	REGULATOR_LINEAR_RANGE(0,        0x92, 0x9E, 0),
+	REGULATOR_LINEAR_RANGE(1500000,  0x9F, 0x9F, 0),
+	REGULATOR_LINEAR_RANGE(1800000,  0xA0, 0xD8, 12500),
+	REGULATOR_LINEAR_RANGE(0,        0xD9, 0xDF, 0),
+	REGULATOR_LINEAR_RANGE(2800000,  0xE0, 0xF4, 25000),
+	REGULATOR_LINEAR_RANGE(0,        0xF5, 0xFF, 0),
+};
+
+/*
+ * LDO1
+ * 0.75V to 3.3V
+ */
+static const struct linear_range pf0900_ldo1_volts[] = {
+	REGULATOR_LINEAR_RANGE(750000,   0x00, 0x0F, 50000),
+	REGULATOR_LINEAR_RANGE(1800000,  0x10, 0x1F, 100000),
+};
+
+/*
+ * LDO2/3
+ * 0.65V to 3.3V (50mV step)
+ */
+static const struct linear_range pf0900_ldo23_volts[] = {
+	REGULATOR_LINEAR_RANGE(650000,   0x00, 0x0D, 50000),
+	REGULATOR_LINEAR_RANGE(1400000,  0x0E, 0x0F, 100000),
+	REGULATOR_LINEAR_RANGE(1800000,  0x10, 0x1F, 100000),
+};
+
+/* SW1 dvs 0.5v to 1.35v
+ * SW2-5 dvs 0.3v to 1.35v
+ */
+static int sw_set_dvs(const struct regulator_desc *desc, struct pf0900 *pf0900,
+		      struct device_node *np, char *prop, unsigned int reg,
+		      unsigned int mask)
+{
+	uint32_t uv;
+	int ret, i;
+
+	if (!desc || !pf0900 || !np || !prop)
+		return -EINVAL;
+
+	ret = of_property_read_u32(np, prop, &uv);
+	if (ret == -EINVAL) {
+		dev_dbg(pf0900->dev, "Property %s not found!\n", prop);
+		return 0;
+	} else if (ret) {
+		dev_err(pf0900->dev, "Failed to read property %s: %d\n", prop, ret);
+		return ret;
+	}
+
+	for (i = 0; i < desc->n_voltages; i++) {
+		ret = regulator_desc_list_voltage_linear_range(desc, i);
+		if (ret < 0)
+			continue;
+		if (ret == uv) {
+			i <<= ffs(desc->vsel_mask) - 1;
+			ret = pf0900_pmic_write(pf0900, reg, i, mask);
+			if (ret) {
+				dev_err(pf0900->dev, "Failed to write voltage to register 0x%x: %d\n",
+					reg, ret);
+				return ret;
+			}
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int pf0900_set_dvs_levels(struct device_node *np,
+				 const struct regulator_desc *desc,
+				 struct regulator_config *cfg)
+{
+	struct pf0900_regulator_desc *data = container_of(desc,
+					struct pf0900_regulator_desc, desc);
+	struct pf0900 *pf0900 = dev_get_drvdata(cfg->dev);
+	const struct pf0900_dvs_config *dvs = &data->dvs;
+	unsigned int reg, mask;
+	int i, ret = 0;
+	char *prop;
+
+	for (i = 0; i < PF0900_DVS_LEVEL_MAX; i++) {
+		switch (i) {
+		case PF0900_DVS_LEVEL_RUN:
+			prop = "nxp,dvs-run-microvolt";
+			reg = dvs->run_reg;
+			mask = dvs->run_mask;
+			break;
+		case PF0900_DVS_LEVEL_STANDBY:
+			prop = "nxp,dvs-standby-microvolt";
+			reg = dvs->standby_reg;
+			mask = dvs->standby_mask;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		ret = sw_set_dvs(desc, pf0900, np, prop, reg, mask);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static const struct pf0900_regulator_desc pf0900_regulators[] = {
+	{
+		.desc = {
+			.name = "vaon",
+			.of_match = of_match_ptr("VAON"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = PF0900_VAON,
+			.ops = &pf0900_avon_regulator_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = PF0900_VAON_VOLTAGE_NUM,
+			.volt_table = pf0900_vaon_voltages,
+			.enable_reg = PF0900_REG_VAON_CFG1,
+			.enable_mask = VAON_MASK,
+			.enable_val = VAON_1P8V,
+			.vsel_reg = PF0900_REG_VAON_CFG1,
+			.vsel_mask = VAON_MASK,
+			.owner = THIS_MODULE,
+		},
+	},
+	{
+		.desc = {
+			.name = "sw1",
+			.of_match = of_match_ptr("SW1"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = PF0900_SW1,
+			.ops = &pf0900_dvs_sw_regulator_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = PF0900_SW1_VOLTAGE_NUM,
+			.linear_ranges = pf0900_dvs_sw1_volts,
+			.n_linear_ranges = ARRAY_SIZE(pf0900_dvs_sw1_volts),
+			.vsel_reg = PF0900_REG_SW1_VRUN,
+			.vsel_mask = SW_VRUN_MASK,
+			.enable_reg = PF0900_REG_SW1_MODE,
+			.enable_mask = SW_RUN_MODE_MASK,
+			.enable_val = SW_RUN_MODE_PWM,
+			.ramp_reg = PF0900_REG_SW1_CFG1,
+			.ramp_mask = SW_RAMP_MASK,
+			.ramp_delay_table = pf0900_dvs_sw_ramp_table,
+			.n_ramp_values = ARRAY_SIZE(pf0900_dvs_sw_ramp_table),
+			.owner = THIS_MODULE,
+			.of_parse_cb = pf0900_set_dvs_levels,
+		},
+		.dvs = {
+			.run_reg = PF0900_REG_SW1_VRUN,
+			.run_mask = SW_VRUN_MASK,
+			.standby_reg = PF0900_REG_SW1_VSTBY,
+			.standby_mask = SW_STBY_MASK,
+		},
+	},
+	{
+		.desc = {
+			.name = "sw2",
+			.of_match = of_match_ptr("SW2"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = PF0900_SW2,
+			.ops = &pf0900_dvs_sw_regulator_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = PF0900_SW2_VOLTAGE_NUM,
+			.linear_ranges = pf0900_dvs_sw2345_volts,
+			.n_linear_ranges = ARRAY_SIZE(pf0900_dvs_sw2345_volts),
+			.vsel_reg = PF0900_REG_SW2_VRUN,
+			.vsel_mask = SW_VRUN_MASK,
+			.enable_reg = PF0900_REG_SW2_MODE,
+			.enable_mask = SW_RUN_MODE_MASK,
+			.enable_val = SW_RUN_MODE_PWM,
+			.ramp_reg = PF0900_REG_SW2_CFG1,
+			.ramp_mask = SW_RAMP_MASK,
+			.ramp_delay_table = pf0900_dvs_sw_ramp_table,
+			.n_ramp_values = ARRAY_SIZE(pf0900_dvs_sw_ramp_table),
+			.owner = THIS_MODULE,
+			.of_parse_cb = pf0900_set_dvs_levels,
+		},
+		.dvs = {
+			.run_reg = PF0900_REG_SW2_VRUN,
+			.run_mask = SW_VRUN_MASK,
+			.standby_reg = PF0900_REG_SW2_VSTBY,
+			.standby_mask = SW_STBY_MASK,
+		},
+	},
+	{
+		.desc = {
+			.name = "sw3",
+			.of_match = of_match_ptr("SW3"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = PF0900_SW3,
+			.ops = &pf0900_dvs_sw_regulator_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = PF0900_SW3_VOLTAGE_NUM,
+			.linear_ranges = pf0900_dvs_sw2345_volts,
+			.n_linear_ranges = ARRAY_SIZE(pf0900_dvs_sw2345_volts),
+			.vsel_reg = PF0900_REG_SW3_VRUN,
+			.vsel_mask = SW_VRUN_MASK,
+			.enable_reg = PF0900_REG_SW3_MODE,
+			.enable_mask = SW_RUN_MODE_MASK,
+			.enable_val = SW_RUN_MODE_PWM,
+			.ramp_reg = PF0900_REG_SW3_CFG1,
+			.ramp_mask = SW_RAMP_MASK,
+			.ramp_delay_table = pf0900_dvs_sw_ramp_table,
+			.n_ramp_values = ARRAY_SIZE(pf0900_dvs_sw_ramp_table),
+			.owner = THIS_MODULE,
+			.of_parse_cb = pf0900_set_dvs_levels,
+		},
+		.dvs = {
+			.run_reg = PF0900_REG_SW3_VRUN,
+			.run_mask = SW_VRUN_MASK,
+			.standby_reg = PF0900_REG_SW3_VSTBY,
+			.standby_mask = SW_STBY_MASK,
+		},
+	},
+	{
+		.desc = {
+			.name = "sw4",
+			.of_match = of_match_ptr("SW4"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = PF0900_SW5,
+			.ops = &pf0900_dvs_sw_regulator_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = PF0900_SW4_VOLTAGE_NUM,
+			.linear_ranges = pf0900_dvs_sw2345_volts,
+			.n_linear_ranges = ARRAY_SIZE(pf0900_dvs_sw2345_volts),
+			.vsel_reg = PF0900_REG_SW4_VRUN,
+			.vsel_mask = SW_VRUN_MASK,
+			.enable_reg = PF0900_REG_SW4_MODE,
+			.enable_mask = SW_RUN_MODE_MASK,
+			.enable_val = SW_RUN_MODE_PWM,
+			.ramp_reg = PF0900_REG_SW4_CFG1,
+			.ramp_mask = SW_RAMP_MASK,
+			.ramp_delay_table = pf0900_dvs_sw_ramp_table,
+			.n_ramp_values = ARRAY_SIZE(pf0900_dvs_sw_ramp_table),
+			.owner = THIS_MODULE,
+			.of_parse_cb = pf0900_set_dvs_levels,
+		},
+		.dvs = {
+			.run_reg = PF0900_REG_SW4_VRUN,
+			.run_mask = SW_VRUN_MASK,
+			.standby_reg = PF0900_REG_SW4_VSTBY,
+			.standby_mask = SW_STBY_MASK,
+		},
+	},
+	{
+		.desc = {
+			.name = "sw5",
+			.of_match = of_match_ptr("SW5"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = PF0900_SW5,
+			.ops = &pf0900_dvs_sw_regulator_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = PF0900_SW5_VOLTAGE_NUM,
+			.linear_ranges = pf0900_dvs_sw2345_volts,
+			.n_linear_ranges = ARRAY_SIZE(pf0900_dvs_sw2345_volts),
+			.vsel_reg = PF0900_REG_SW5_VRUN,
+			.vsel_mask = SW_VRUN_MASK,
+			.enable_reg = PF0900_REG_SW5_MODE,
+			.enable_mask = SW_RUN_MODE_MASK,
+			.enable_val = SW_RUN_MODE_PWM,
+			.ramp_reg = PF0900_REG_SW5_CFG1,
+			.ramp_mask = SW_RAMP_MASK,
+			.ramp_delay_table = pf0900_dvs_sw_ramp_table,
+			.n_ramp_values = ARRAY_SIZE(pf0900_dvs_sw_ramp_table),
+			.owner = THIS_MODULE,
+			.of_parse_cb = pf0900_set_dvs_levels,
+		},
+		.dvs = {
+			.run_reg = PF0900_REG_SW5_VRUN,
+			.run_mask = SW_VRUN_MASK,
+			.standby_reg = PF0900_REG_SW5_VSTBY,
+			.standby_mask = SW_STBY_MASK,
+		},
+	},
+	{
+		.desc = {
+			.name = "ldo1",
+			.of_match = of_match_ptr("LDO1"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = PF0900_LDO1,
+			.ops = &pf0900_ldo_regulator_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = PF0900_LDO1_VOLTAGE_NUM,
+			.linear_ranges = pf0900_ldo1_volts,
+			.n_linear_ranges = ARRAY_SIZE(pf0900_ldo1_volts),
+			.vsel_reg = PF0900_REG_LDO1_RUN,
+			.vsel_mask = VLDO1_RUN_MASK,
+			.enable_reg = PF0900_REG_LDO1_RUN,
+			.enable_mask = LDO1_RUN_EN_MASK,
+			.owner = THIS_MODULE,
+		},
+	},
+	{
+		.desc = {
+			.name = "ldo2",
+			.of_match = of_match_ptr("LDO2"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = PF0900_LDO2,
+			.ops = &pf0900_ldo_regulator_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = PF0900_LDO2_VOLTAGE_NUM,
+			.linear_ranges = pf0900_ldo23_volts,
+			.n_linear_ranges = ARRAY_SIZE(pf0900_ldo23_volts),
+			.vsel_reg = PF0900_REG_LDO2_RUN,
+			.vsel_mask = VLDO2_RUN_MASK,
+			.enable_reg = PF0900_REG_LDO2_RUN,
+			.enable_mask = LDO2_RUN_EN_MASK,
+			.owner = THIS_MODULE,
+		},
+	},
+	{
+		.desc = {
+			.name = "ldo3",
+			.of_match = of_match_ptr("LDO3"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = PF0900_LDO3,
+			.ops = &pf0900_ldo_regulator_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = PF0900_LDO3_VOLTAGE_NUM,
+			.linear_ranges = pf0900_ldo23_volts,
+			.n_linear_ranges = ARRAY_SIZE(pf0900_ldo23_volts),
+			.vsel_reg = PF0900_REG_LDO3_RUN,
+			.vsel_mask = VLDO3_RUN_MASK,
+			.enable_reg = PF0900_REG_LDO3_RUN,
+			.enable_mask = LDO3_RUN_EN_MASK,
+			.owner = THIS_MODULE,
+		},
+	},
+};
+
+static irqreturn_t pf0900_irq_handler(int irq, void *data)
+{
+	unsigned int system, status1, status2, status3;
+	struct pf0900 *pf0900 = data;
+	int ret;
+
+	ret = pf0900_pmic_read(pf0900, PF0900_REG_SYSTEM_INT, &system);
+	if (ret < 0) {
+		dev_err(pf0900->dev, "Failed to read SYSTEM_INT(%d)\n", ret);
+		return IRQ_NONE;
+	}
+
+	ret = pf0900_pmic_read(pf0900, PF0900_REG_STATUS1_INT, &status1);
+	if (ret < 0) {
+		dev_err(pf0900->dev, "Failed to read STATUS1_INT(%d)\n", ret);
+		return IRQ_NONE;
+	}
+
+	ret = pf0900_pmic_write(pf0900, PF0900_REG_STATUS1_INT, status1, status1);
+	if (ret < 0) {
+		dev_err(pf0900->dev, "Failed to write STATUS1_INT(%d)\n", ret);
+		return IRQ_NONE;
+	}
+
+	ret = pf0900_pmic_read(pf0900, PF0900_REG_STATUS2_INT, &status2);
+	if (ret < 0) {
+		dev_err(pf0900->dev, "Failed to read STATUS2_INT(%d)\n", ret);
+		return IRQ_NONE;
+	}
+
+	ret = pf0900_pmic_write(pf0900, PF0900_REG_STATUS2_INT, status2, status2);
+	if (ret < 0) {
+		dev_err(pf0900->dev, "Failed to write STATUS2_INT(%d)\n", ret);
+		return IRQ_NONE;
+	}
+
+	ret = pf0900_pmic_read(pf0900, PF0900_REG_STATUS3_INT, &status3);
+	if (ret < 0) {
+		dev_err(pf0900->dev, "Failed to read STATUS3_INT(%d)\n", ret);
+		return IRQ_NONE;
+	}
+
+	ret = pf0900_pmic_write(pf0900, PF0900_REG_STATUS3_INT, status3, status3);
+	if (ret < 0) {
+		dev_err(pf0900->dev, "Failed to write STATUS3_INT(%d)\n", ret);
+		return IRQ_NONE;
+	}
+
+	if (system & IRQ_EWARN)
+		dev_warn(pf0900->dev, "EWARN interrupt.\n");
+
+	if (system & IRQ_GPIO)
+		dev_warn(pf0900->dev, "GPIO interrupt.\n");
+
+	if (system & IRQ_OV)
+		dev_warn(pf0900->dev, "OV interrupt.\n");
+
+	if (system & IRQ_UV)
+		dev_warn(pf0900->dev, "UV interrupt.\n");
+
+	if (system & IRQ_ILIM)
+		dev_warn(pf0900->dev, "ILIM interrupt.\n");
+
+	if (system & IRQ_MODE)
+		dev_warn(pf0900->dev, "IRQ_MODE interrupt.\n");
+
+	if (system & status1 & IRQ_SDWN)
+		dev_warn(pf0900->dev, "IRQ_SDWN interrupt.\n");
+
+	if (system & status1 & IRQ_FREQ_RDY)
+		dev_warn(pf0900->dev, "IRQ_FREQ_RDY interrupt.\n");
+
+	if (system & status1 & IRQ_DCRC)
+		dev_warn(pf0900->dev, "IRQ_DCRC interrupt.\n");
+
+	if (system & status1 & IRQ_I2C_CRC)
+		dev_warn(pf0900->dev, "IRQ_I2C_CRC interrupt.\n");
+
+	if (system & status1 & IRQ_PWRDN)
+		dev_warn(pf0900->dev, "IRQ_PWRDN interrupt.\n");
+
+	if (system & status1 & IRQ_FSYNC_FLT)
+		dev_warn(pf0900->dev, "IRQ_FSYNC_FLT interrupt.\n");
+
+	if (system & status1 & IRQ_VIN_OV)
+		dev_warn(pf0900->dev, "IRQ_VIN_OV interrupt.\n");
+
+	if (system & status2 & IRQ_VANA_OV)
+		dev_warn(pf0900->dev, "IRQ_VANA_OV interrupt.\n");
+
+	if (system & status2 & IRQ_VDIG_OV)
+		dev_warn(pf0900->dev, "IRQ_VDIG_OV interrupt.\n");
+
+	if (system & status2 & IRQ_THERM_155)
+		dev_warn(pf0900->dev, "IRQ_THERM_155 interrupt.\n");
+
+	if (system & status2 & IRQ_THERM_140)
+		dev_warn(pf0900->dev, "IRQ_THERM_140 interrupt.\n");
+
+	if (system & status2 & IRQ_THERM_125)
+		dev_warn(pf0900->dev, "IRQ_THERM_125 interrupt.\n");
+
+	if (system & status2 & IRQ_THERM_110)
+		dev_warn(pf0900->dev, "IRQ_THERM_110 interrupt.\n");
+
+	if (system & status3 & IRQ_BAD_CMD)
+		dev_warn(pf0900->dev, "IRQ_BAD_CMD interrupt.\n");
+
+	if (system & status3 & IRQ_LBIST_DONE)
+		dev_warn(pf0900->dev, "IRQ_LBIST_DONE interrupt.\n");
+
+	if (system & status3 & IRQ_SHS)
+		dev_warn(pf0900->dev, "IRQ_SHS interrupt.\n");
+
+	return IRQ_HANDLED;
+}
+
+static int pf0900_i2c_probe(struct i2c_client *i2c)
+{
+	const struct pf0900_regulator_desc *regulator_desc;
+	const struct pf0900_drvdata *drvdata = NULL;
+	struct device_node *np = i2c->dev.of_node;
+	unsigned int device_id, device_fam, i;
+	struct regulator_config config = { };
+	struct pf0900 *pf0900;
+	int ret;
+
+	if (!i2c->irq)
+		return dev_err_probe(&i2c->dev, -EINVAL, "No IRQ configured?\n");
+
+	pf0900 = devm_kzalloc(&i2c->dev, sizeof(struct pf0900), GFP_KERNEL);
+	if (!pf0900)
+		return -ENOMEM;
+
+	drvdata = device_get_match_data(&i2c->dev);
+	if (!drvdata)
+		return dev_err_probe(&i2c->dev, -EINVAL, "unable to find driver data\n");
+
+	regulator_desc = drvdata->desc;
+	pf0900->drvdata = drvdata;
+	pf0900->crc_en = of_property_read_bool(np, "nxp,i2c-crc-enable");
+	pf0900->irq = i2c->irq;
+	pf0900->dev = &i2c->dev;
+	pf0900->addr = i2c->addr;
+
+	dev_set_drvdata(&i2c->dev, pf0900);
+
+	pf0900->regmap = devm_regmap_init_i2c(i2c,
+					       &pf0900_regmap_config);
+	if (IS_ERR(pf0900->regmap))
+		return dev_err_probe(&i2c->dev, PTR_ERR(pf0900->regmap),
+				     "regmap initialization failed\n");
+
+	ret = pf0900_pmic_read(pf0900, PF0900_REG_DEV_ID, &device_id);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Read device id error\n");
+
+	ret = pf0900_pmic_read(pf0900, PF0900_REG_DEV_FAM, &device_fam);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Read device fam error\n");
+
+	/* Check your board and dts for match the right pmic */
+	if (device_fam == 0x09 && (device_id & 0x1F) != 0x0 &&
+	    drvdata->type == PF0900_TYPE_PF0900)
+		return dev_err_probe(&i2c->dev, -EINVAL, "Device id(%x) mismatched\n",
+			device_id >> 4);
+
+	for (i = 0; i < drvdata->rcnt; i++) {
+		const struct regulator_desc *desc;
+		struct regulator_dev *rdev;
+		const struct pf0900_regulator_desc *r;
+
+		r = &regulator_desc[i];
+		desc = &r->desc;
+		config.regmap = pf0900->regmap;
+		config.dev = pf0900->dev;
+
+		rdev = devm_regulator_register(pf0900->dev, desc, &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(pf0900->dev, PTR_ERR(rdev),
+					     "Failed to register regulator(%s)\n", desc->name);
+	}
+
+	ret = devm_request_threaded_irq(pf0900->dev, pf0900->irq, NULL,
+					pf0900_irq_handler,
+					(IRQF_TRIGGER_FALLING | IRQF_ONESHOT),
+					"pf0900-irq", pf0900);
+
+	if (ret != 0)
+		return dev_err_probe(pf0900->dev, ret, "Failed to request IRQ: %d\n",
+				     pf0900->irq);
+	/*
+	 * The PWRUP_M is unmasked by default. When the device enter in RUN state,
+	 * it will assert the PWRUP_I interrupt and assert the INTB pin to inform
+	 * the MCU that it has finished the power up sequence properly.
+	 */
+	ret = pf0900_pmic_write(pf0900, PF0900_REG_STATUS1_INT, IRQ_PWRUP, IRQ_PWRUP);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Clean PWRUP_I error\n");
+
+	/* Unmask all interrupt except PWRUP */
+	ret = pf0900_pmic_write(pf0900, PF0900_REG_STATUS1_MSK, IRQ_PWRUP,
+				IRQ_SDWN | IRQ_FREQ_RDY | IRQ_DCRC |
+				IRQ_I2C_CRC | IRQ_PWRUP | IRQ_PWRDN |
+				IRQ_FSYNC_FLT | IRQ_VIN_OV);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
+
+	/* Unmask all interrupt except BGMON/CLKMON */
+	ret = pf0900_pmic_write(pf0900, PF0900_REG_STATUS2_MSK, IRQ_BGMON | IRQ_CLKMON,
+				IRQ_VANA_OV | IRQ_VDIG_OV | IRQ_THERM_155 |
+				IRQ_THERM_140 | IRQ_THERM_125 | IRQ_THERM_110);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
+
+	ret = pf0900_pmic_write(pf0900, PF0900_REG_STATUS3_MSK, 0,
+				IRQ_BAD_CMD | IRQ_LBIST_DONE | IRQ_SHS);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
+
+	dev_info(&i2c->dev, "%s probed.\n", drvdata->type == PF0900_TYPE_PF0900 ?
+		 "pf0900" : "unknown pmic");
+
+	return 0;
+}
+
+static struct pf0900_drvdata pf0900_drvdata = {
+	.desc = pf0900_regulators,
+	.type = PF0900_TYPE_PF0900,
+	.rcnt = ARRAY_SIZE(pf0900_regulators),
+};
+
+static const struct of_device_id pf0900_of_match[] = {
+	{ .compatible = "nxp,pf0900", .data = &pf0900_drvdata},
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, pf0900_of_match);
+
+static struct i2c_driver pf0900_i2c_driver = {
+	.driver = {
+		.name = "nxp-pf0900",
+		.of_match_table = pf0900_of_match,
+	},
+	.probe = pf0900_i2c_probe,
+};
+
+module_i2c_driver(pf0900_i2c_driver);
+
+MODULE_AUTHOR("Joy Zou <joy.zou@nxp.com>");
+MODULE_DESCRIPTION("NXP PF0900 Power Management IC driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/regulator/pf0900.h b/include/linux/regulator/pf0900.h
new file mode 100644
index 000000000000..359a236ed2f1
--- /dev/null
+++ b/include/linux/regulator/pf0900.h
@@ -0,0 +1,264 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright 2025 NXP. */
+
+#ifndef __LINUX_REG_PF0900_H__
+#define __LINUX_REG_PF0900_H__
+
+#include <linux/regmap.h>
+
+enum pf0900_chip_type {
+	PF0900_TYPE_PF0900 = 0,
+	PF0900_TYPE_AMOUNT,
+};
+
+enum {
+	PF0900_SW1 = 0,
+	PF0900_SW2,
+	PF0900_SW3,
+	PF0900_SW4,
+	PF0900_SW5,
+	PF0900_LDO1,
+	PF0900_LDO2,
+	PF0900_LDO3,
+	PF0900_VAON,
+	PF0900_REGULATOR_CNT,
+};
+
+enum {
+	PF0900_DVS_LEVEL_RUN = 0,
+	PF0900_DVS_LEVEL_STANDBY,
+	PF0900_DVS_LEVEL_MAX,
+};
+
+
+#define PF0900_VAON_VOLTAGE_NUM 0x03
+
+#define PF0900_SW1_VOLTAGE_NUM	0x100
+#define PF0900_SW2_VOLTAGE_NUM	0x100
+#define PF0900_SW3_VOLTAGE_NUM	0x100
+#define PF0900_SW4_VOLTAGE_NUM	0x100
+#define PF0900_SW5_VOLTAGE_NUM	0x100
+
+#define PF0900_LDO1_VOLTAGE_NUM	0x20
+#define PF0900_LDO2_VOLTAGE_NUM	0x20
+#define PF0900_LDO3_VOLTAGE_NUM	0x20
+
+enum {
+	PF0900_REG_DEV_ID	    = 0x00,
+	PF0900_REG_DEV_FAM	    = 0x01,
+	PF0900_REG_REV_ID	    = 0x02,
+	PF0900_REG_PROG_ID1	    = 0x03,
+	PF0900_REG_PROG_ID2	    = 0x04,
+	PF0900_REG_SYSTEM_INT	    = 0x05,
+	PF0900_REG_STATUS1_INT	    = 0x06,
+	PF0900_REG_STATUS1_MSK      = 0x07,
+	PF0900_REG_STATUS1_SNS	    = 0x08,
+	PF0900_REG_STATUS2_INT      = 0x09,
+	PF0900_REG_STATUS2_MSK      = 0x0A,
+	PF0900_REG_STATUS2_SNS	    = 0x0B,
+	PF0900_REG_STATUS3_INT      = 0x0C,
+	PF0900_REG_STATUS3_MSK      = 0x0D,
+	PF0900_REG_SW_MODE_INT      = 0x0E,
+	PF0900_REG_SW_MODE_MSK      = 0x0F,
+	PF0900_REG_SW_ILIM_INT      = 0x10,
+	PF0900_REG_SW_ILIM_MSK      = 0x11,
+	PF0900_REG_SW_ILIM_SNS      = 0x12,
+	PF0900_REG_LDO_ILIM_INT     = 0x13,
+	PF0900_REG_LDO_ILIM_MSK     = 0x14,
+	PF0900_REG_LDO_ILIM_SNS     = 0x15,
+	PF0900_REG_SW_UV_INT        = 0x16,
+	PF0900_REG_SW_UV_MSK        = 0x17,
+	PF0900_REG_SW_UV_SNS        = 0x18,
+	PF0900_REG_SW_OV_INT        = 0x19,
+	PF0900_REG_SW_OV_MSK        = 0x1A,
+	PF0900_REG_SW_OV_SNS        = 0x1B,
+	PF0900_REG_LDO_UV_INT       = 0x1C,
+	PF0900_REG_LDO_UV_MSK       = 0x1D,
+	PF0900_REG_LDO_UV_SNS       = 0x1E,
+	PF0900_REG_LDO_OV_INT       = 0x1F,
+	PF0900_REG_LDO_OV_MSK       = 0x20,
+	PF0900_REG_LDO_OV_SNS       = 0x21,
+	PF0900_REG_PWRON_INT        = 0x22,
+	PF0900_REG_IO_INT           = 0x24,
+	PF0900_REG_IO_MSK           = 0x25,
+	PF0900_REG_IO_SNS           = 0x26,
+	PF0900_REG_IOSHORT_SNS      = 0x27,
+	PF0900_REG_ABIST_OV1        = 0x28,
+	PF0900_REG_ABIST_OV2        = 0x29,
+	PF0900_REG_ABIST_UV1        = 0x2A,
+	PF0900_REG_ABIST_UV2        = 0x2B,
+	PF0900_REG_ABIST_IO         = 0x2C,
+	PF0900_REG_TEST_FLAGS       = 0x2D,
+	PF0900_REG_HFAULT_FLAGS     = 0x2E,
+	PF0900_REG_FAULT_FLAGS      = 0x2F,
+	PF0900_REG_FS0B_CFG         = 0x30,
+	PF0900_REG_FCCU_CFG         = 0x31,
+	PF0900_REG_RSTB_CFG1        = 0x32,
+	PF0900_REG_SYSTEM_CMD       = 0x33,
+	PF0900_REG_FS0B_CMD         = 0x34,
+	PF0900_REG_SECURE_WR1       = 0x35,
+	PF0900_REG_SECURE_WR2       = 0x36,
+	PF0900_REG_VMON_CFG1        = 0x37,
+	PF0900_REG_SYS_CFG1         = 0x38,
+	PF0900_REG_GPO_CFG          = 0x39,
+	PF0900_REG_GPO_CTRL         = 0x3A,
+	PF0900_REG_PWRUP_CFG        = 0x3B,
+	PF0900_REG_RSTB_PWRUP       = 0x3C,
+	PF0900_REG_GPIO1_PWRUP      = 0x3D,
+	PF0900_REG_GPIO2_PWRUP      = 0x3E,
+	PF0900_REG_GPIO3_PWRUP      = 0x3F,
+	PF0900_REG_GPIO4_PWRUP      = 0x40,
+	PF0900_REG_VMON1_PWRUP      = 0x41,
+	PF0900_REG_VMON2_PWRUP      = 0x42,
+	PF0900_REG_SW1_PWRUP        = 0x43,
+	PF0900_REG_SW2_PWRUP        = 0x44,
+	PF0900_REG_SW3_PWRUP        = 0x45,
+	PF0900_REG_SW4_PWRUP        = 0x46,
+	PF0900_REG_SW5_PWRUP        = 0x47,
+	PF0900_REG_LDO1_PWRUP       = 0x48,
+	PF0900_REG_LDO2_PWRUP       = 0x49,
+	PF0900_REG_LDO3_PWRUP       = 0x4A,
+	PF0900_REG_VAON_PWRUP       = 0x4B,
+	PF0900_REG_FREQ_CTRL        = 0x4C,
+	PF0900_REG_PWRON_CFG        = 0x4D,
+	PF0900_REG_WD_CTRL1         = 0x4E,
+	PF0900_REG_WD_CTRL2         = 0x4F,
+	PF0900_REG_WD_CFG1          = 0x50,
+	PF0900_REG_WD_CFG2          = 0x51,
+	PF0900_REG_WD_CNT1          = 0x52,
+	PF0900_REG_WD_CNT2          = 0x53,
+	PF0900_REG_FAULT_CFG        = 0x54,
+	PF0900_REG_FAULT_CNT        = 0x55,
+	PF0900_REG_DFS_CNT          = 0x56,
+	PF0900_REG_AMUX_CFG         = 0x57,
+	PF0900_REG_VMON1_RUN_CFG    = 0x58,
+	PF0900_REG_VMON1_STBY_CFG   = 0x59,
+	PF0900_REG_VMON1_CTRL       = 0x5A,
+	PF0900_REG_VMON2_RUN_CFG    = 0x5B,
+	PF0900_REG_VMON2_STBY_CFG   = 0x5C,
+	PF0900_REG_VMON2_CTRL       = 0x5D,
+	PF0900_REG_SW1_VRUN         = 0x5E,
+	PF0900_REG_SW1_VSTBY        = 0x5F,
+	PF0900_REG_SW1_MODE         = 0x60,
+	PF0900_REG_SW1_CFG1         = 0x61,
+	PF0900_REG_SW1_CFG2         = 0x62,
+	PF0900_REG_SW2_VRUN         = 0x63,
+	PF0900_REG_SW2_VSTBY        = 0x64,
+	PF0900_REG_SW2_MODE         = 0x65,
+	PF0900_REG_SW2_CFG1         = 0x66,
+	PF0900_REG_SW2_CFG2         = 0x67,
+	PF0900_REG_SW3_VRUN         = 0x68,
+	PF0900_REG_SW3_VSTBY        = 0x69,
+	PF0900_REG_SW3_MODE         = 0x6A,
+	PF0900_REG_SW3_CFG1         = 0x6B,
+	PF0900_REG_SW3_CFG2         = 0x6C,
+	PF0900_REG_SW4_VRUN         = 0x6D,
+	PF0900_REG_SW4_VSTBY        = 0x6E,
+	PF0900_REG_SW4_MODE         = 0x6F,
+	PF0900_REG_SW4_CFG1         = 0x70,
+	PF0900_REG_SW4_CFG2         = 0x71,
+	PF0900_REG_SW5_VRUN         = 0x72,
+	PF0900_REG_SW5_VSTBY        = 0x73,
+	PF0900_REG_SW5_MODE         = 0x74,
+	PF0900_REG_SW5_CFG1         = 0x75,
+	PF0900_REG_SW5_CFG2         = 0x76,
+	PF0900_REG_LDO1_RUN         = 0x77,
+	PF0900_REG_LDO1_STBY        = 0x78,
+	PF0900_REG_LDO1_CFG2        = 0x79,
+	PF0900_REG_LDO2_RUN         = 0x7A,
+	PF0900_REG_LDO2_STBY        = 0x7B,
+	PF0900_REG_LDO2_CFG2        = 0x7C,
+	PF0900_REG_LDO3_RUN         = 0x7D,
+	PF0900_REG_LDO3_STBY        = 0x7E,
+	PF0900_REG_LDO3_CFG2        = 0x7F,
+	PF0900_REG_VAON_CFG1        = 0x80,
+	PF0900_REG_VAON_CFG2        = 0x81,
+	PF0900_REG_SYS_DIAG         = 0x82,
+	PF0900_MAX_REGISTER,
+};
+
+/* PF0900 SW MODE */
+#define SW_RUN_MODE_OFF                 0x00
+#define SW_RUN_MODE_PWM                 0x01
+#define SW_RUN_MODE_PFM                 0x02
+#define SW_STBY_MODE_OFF                0x00
+#define SW_STBY_MODE_PWM                0x04
+#define SW_STBY_MODE_PFM                0x08
+
+/* PF0900 SW MODE MASK */
+#define SW_RUN_MODE_MASK		0x03
+#define SW_STBY_MODE_MASK		0x0c
+
+/* PF0900 SW VRUN MASK */
+#define SW_VRUN_MASK			0xFF
+#define SW_STBY_MASK			0xFF
+
+/* PF0900_REG_VAON_CFG1 bits */
+#define VAON_MASK			0x03
+#define VAON_1P8V			0x01
+
+/* PF0900_REG_SWX_CFG1 MASK */
+#define SW_RAMP_MASK			0x18
+
+/* PF0900_REG_LDO1_RUN MASK */
+#define VLDO1_RUN_MASK			0x1F
+#define LDO1_RUN_EN_MASK		0x20
+#define LDO1_STBY_EN_MASK		0x20
+
+/* PF0900_REG_LDO2_RUN MASK */
+#define VLDO2_RUN_MASK			0x1F
+#define LDO2_RUN_EN_MASK		0x20
+#define LDO2_STBY_EN_MASK		0x20
+
+/* PF0900_REG_LDO3_RUN MASK */
+#define VLDO3_RUN_MASK			0x1F
+#define LDO3_RUN_EN_MASK		0x20
+#define LDO3_STBY_EN_MASK		0x20
+
+/* PF0900_REG_GPO_CTRL MASK */
+#define GPO1_RUN_MASK			0x1
+#define GPO2_RUN_MASK			0x2
+#define GPO3_RUN_MASK			0x4
+#define GPO4_RUN_MASK			0x8
+#define GPO1_STBY_MASK			0x10
+#define GPO2_STBY_MASK			0x20
+#define GPO3_STBY_MASK			0x40
+#define GPO4_STBY_MASK			0x80
+
+
+/* PF0900_REG_STSTEM_INT bits */
+#define IRQ_EWARN			0x80
+#define IRQ_GPIO			0x40
+#define IRQ_OV				0x20
+#define IRQ_UV				0x10
+#define IRQ_ILIM			0x08
+#define IRQ_MODE			0x04
+#define IRQ_STATUS2			0x02
+#define IRQ_STATUS1			0x01
+
+/* PF0900_REG_STATUS1_INT bits */
+#define IRQ_SDWN			0x80
+#define IRQ_FREQ_RDY			0x40
+#define IRQ_DCRC			0x20
+#define IRQ_I2C_CRC			0x10
+#define IRQ_PWRUP			0x08
+#define IRQ_PWRDN			0x04
+#define IRQ_FSYNC_FLT			0x02
+#define IRQ_VIN_OV			0x01
+
+/* PF0900_REG_STATUS2_INT bits */
+#define IRQ_VANA_OV			0x80
+#define IRQ_VDIG_OV			0x40
+#define IRQ_BGMON			0x20
+#define IRQ_CLKMON			0x10
+#define IRQ_THERM_155			0x08
+#define IRQ_THERM_140			0x04
+#define IRQ_THERM_125			0x02
+#define IRQ_THERM_110			0x01
+
+/* PF0900_REG_STATUS3_INT bits */
+#define IRQ_BAD_CMD                     0x04
+#define IRQ_LBIST_DONE                  0x02
+#define IRQ_SHS                         0x01
+
+#endif /* __LINUX_REG_PF0900_H__ */
-- 
2.37.1

