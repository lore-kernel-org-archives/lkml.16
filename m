Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26323C4F1;
	Mon, 23 Jun 2025 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676129; cv=fail; b=b4qaH15b+x6yuBbGVUnIZ40KEKEsc9Dp1PTYdaX1xOdkOWuVneY0WI2248f8ubLiws65cpmdEEikju5dOtM0rY25ul8SA9HYFgr1wucBQAE4PThPPoKG7ZHiCJGobSkjic8XKi7aTGTEO/43q4BPQA+TqUXY66M3PVxFQ/VMdNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676129; c=relaxed/simple;
	bh=jKyjknt1xaYt49FBT8NjabwJLF2OKrqEAv6juW8GH6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzUOwZPyjGWpY8Z0Gl5QjkPfiug5UhNHgi9kNGzxDfLUgtshNenj7th0L5FRVmSr6DkCNCtJq7396BWtMGVss+EWNO3hEVj19Cmd9u7d4xfN7cPB8jN95OPKG97xl0CdOkcsTtVu9eVLvXjIfVc86KjhbJB+G20db94IVPtOJLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NWzrCCl8; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NWzrCCl8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6NAssyom7xPqSwfJnxItIM1HQsWMpsNbceTXaPzBVF1PD6e9XyQDxec097Z0HAsH4OpKZAV77epG0SgrMJZ4XoFweGI7J6FThhjUdTie6X4MBrd4OvdHg74fAfZwb2KrB2zvoQbXV+7EJUe5TKbyaSz4PFL7oMWwHRRMTZf2Spf5lSYcVOf/fBSUrtcir2I1V1we1Fwu/WJ01NY9fanGRHWjTNGabBsbyB8h6a5JSIYKuJTsFg7DujpLx1g/2PRzRMwE+lvFP5sY3bj54nKA8eZdaa58Idb6t+Z+dNP+F4hpQ+OgnGc0NWxp0Gu+z4+iWBv+fZvJeYf5hPIcuYsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QscXTedR6K7qQyn5qxxQGUMHcOo8IRnJo3VvZ6LVBHQ=;
 b=d/x8PBnFS0VwWyVxjGuYdQOoGz1j9aX9SkWuV8lkqOnYHskYpa/5FL3lkgwwnMD6Yke/EJrmWx+RE+q6D38Pf3B8EtF4LpKTOuGCx1d2A/TXb0J0Nido0UkE6HzUDO7d9kdSfcnGUlKlKGebYsY9gPzudcvyMtGATfz6Uc9XkSUcQze4z2iGHegCv4wLrSi8+FsQg2/XPXKU5cPw6DwsK5izTholYHnyE1qp1PB3UzRvfrTleZtRZHUbW4NEWHsl6q/nG61/cb9VhYoWgq02Z7i3/wlBv8tZnQ45WaSjxht+nhzYSPXO0zT/OOeeiNLznsYLIkJK8/1LGGHRpuaoNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QscXTedR6K7qQyn5qxxQGUMHcOo8IRnJo3VvZ6LVBHQ=;
 b=NWzrCCl8T2ge1syD7TXlvTL1r3G+Erd+9G+uJM5vzSJDz/7sKVnir4i4cR7Ouxgs/oLx9ue0O+49KFpOfPbs3Fu6P1WXZVZpxNJLYfzFCZGDf4JLwqkbraP3h1vtaM0IHIcDRyidqtwCN23tcuIotzoUQqHd7c5g/kMvecgcjw4=
Received: from MW4PR03CA0096.namprd03.prod.outlook.com (2603:10b6:303:b7::11)
 by CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Mon, 23 Jun
 2025 10:55:19 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:303:b7:cafe::79) by MW4PR03CA0096.outlook.office365.com
 (2603:10b6:303:b7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Mon,
 23 Jun 2025 10:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 10:55:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 05:55:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 05:55:01 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Jun 2025 05:54:58 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Bernhard Frauendienst
	<kernel@nospam.obeliks.de>
Subject: [PATCH v14 3/3] mtd: Add driver for concatenating devices
Date: Mon, 23 Jun 2025 16:24:45 +0530
Message-ID: <20250623105445.2394825-4-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
References: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0fe83a-04f5-42e8-7ace-08ddb24471b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?guWjSTL/FZ+5MzNEnwB9vj6l1cci1RNxj853DbOcBAcR0rlvGEsElJa/pvzI?=
 =?us-ascii?Q?HFTAz+tVp4F0KmpOF3hHnp34W7JDkOGC8KtfkU/LzS7j9M8lFKLItsjXJGFt?=
 =?us-ascii?Q?LnCvF/gQC1jjs2nfo8Sa/Mz3KCZXzL6KriSfnuvSR1t7MTB8PC29MOxP+H/T?=
 =?us-ascii?Q?MdkUmCKqevj6mcPLEi0aOwVEKFM68WWBWVS+/DR1nX4uxbHP3zr7q9fXL0q4?=
 =?us-ascii?Q?edpdVuMidXf3qEJiZZO3hyOUj/fuSofZVICvSK/thoIwXffIOjHju4+e6WER?=
 =?us-ascii?Q?VsoSiBp0wh/13HSIrrhDQZKr0vcuCOrfTOyiPpPPMMFiXbFomhWGxkwPkZZb?=
 =?us-ascii?Q?trNBlEh4Wb5Dr7Zb4Ya6iI7+HIsP023j6isRbjmcCr1jrS6aOLpfXbbTUidJ?=
 =?us-ascii?Q?wgOy0F0IPEmdp8/czRsE7KNBjYf3aPc6Nea5oDwQ1M3bBMaLJNI1SX4/Rw/H?=
 =?us-ascii?Q?FteKQ6KkVGDgvvtTjmgKvKvlE3bFGg2oA1c86VaDPBaMp23MjDdOBhGU85uk?=
 =?us-ascii?Q?BCxkvZ6VTch52tTFzchAgaTqZEQ4CVSVBK0afD2wKx/dJtOAU7dDYyxHoPpQ?=
 =?us-ascii?Q?KHmP6eGy6sv272KesJDEI3035cDeE39tTozH0T4O3GS8Rn2nVh+VklULAR7y?=
 =?us-ascii?Q?xpjN/NwMOG7gj5Fhb1mh6AgmNl/l+uoTjdrjt7gAvT7xmR4gGGRijruS1J5x?=
 =?us-ascii?Q?3GvN/kdoa3dKDQN+IJeKV1jqe9DWNC/NplNmlwbvn7ZRNAvIoJcqeZvDGsie?=
 =?us-ascii?Q?zlp2zlqEoZaky+P6bktGTJwJVYD2FN1ITgrTEduwNbOBOHWig/0ei0hbP/P7?=
 =?us-ascii?Q?cG3aS09EGUtNx483IQETFtFGhHbsFTV8Jv2jZ7eYw/UixqyThOEQ3nWJm3t3?=
 =?us-ascii?Q?+BuEPhLTU68kvkb1HIK02TsQPKFDmbzPjQgDRdgKhe+f6k44/ZiC3QbfV5EU?=
 =?us-ascii?Q?svvSOdAhmZCi8S2ShORetpy80jw14Ckkcr3mksitxkuf7XHK7RgivWcpnqNa?=
 =?us-ascii?Q?OcSLIq0dztTzVl7r6Se4p3amThX9aVFhY589vNABbQqmu8CiyjERbhhW9MIT?=
 =?us-ascii?Q?YFfoOpJ8GUfgA7vIhdz4NZP/tceU0hXOZM0qP780mhR94GO4RuXs/lR5nvHO?=
 =?us-ascii?Q?uqVN0KK5EgaToL9qz7jJmrZ0uN2sH6CtUqTm7g0i5lYEaSosZ3uqeJOkVLVT?=
 =?us-ascii?Q?yNZJU4FPT+mb7gLfTZSYDtvLfUDzcwYq28SSQBMqvgmqw5A2r9+MkH9Up1FG?=
 =?us-ascii?Q?pnDJ91pkkOq8ALguf+Z9wBRzml+/G9nT7iRxo4Bup5VAWTESeMB06yCNxmvn?=
 =?us-ascii?Q?W3hsSZlIYpOjyWIkFyZ12sx86HVgkBl8d/SNSdOSohQ9tWNLWTiR0gOicD6E?=
 =?us-ascii?Q?X711/327uT3nTBnGolxQ6VaOaAOUn5EKs/GCpx5ueD6hmjPFyGGvkTsrm5/i?=
 =?us-ascii?Q?ggKMw+7jsyPNzc6J7fGtTGMDGYjDNfgAr/MFoemRfJOd6ITeBuIp12t2U7ZY?=
 =?us-ascii?Q?ShuI26tg3F8Icw3YrcYd+9Bb9kq94TyISnWq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:55:19.0624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0fe83a-04f5-42e8-7ace-08ddb24471b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194

Introducing CONFIG_MTD_VIRT_CONCAT to separate the legacy flow from the new
approach, where only the concatenated partition is registered as an MTD
device, while the individual partitions that form it are not registered
independently, as they are typically not required by the user.
CONFIG_MTD_VIRT_CONCAT is a boolean configuration option that depends on
CONFIG_MTD_PARTITIONED_MASTER. When enabled, it allows flash nodes to be
exposed as individual MTD devices along with the other partitions.

The solution focuses on fixed-partitions description only as it depends on
device boundaries. It supports multiple sets of concatenated devices, each
comprising two or more partitions.

    flash@0 {
            reg = <0>;
            partitions {
                    compatible = "fixed-partitions";

                    part0@0 {
                            part-concat-next = <&flash0_part1>;
                            label = "part0_0";
                            reg = <0x0 0x800000>;
                    };

                    flash0_part1: part1@800000 {
                            label = "part0_1";
                            reg = <800000 0x800000>;
                    };

                    part2@1000000 {
                            part-concat-next = <&flash1_part0>;
                            label = "part0_2";
                            reg = <0x800000 0x800000>;
                    };
            };
    };

    flash@1 {
            reg = <1>;
            partitions {
                    compatible = "fixed-partitions";

                    flash1_part0: part1@0 {
                            label = "part1_0";
                            reg = <0x0 0x800000>;
                    };

                    part1@800000 {
                            label = "part1_1";
                            reg = <0x800000 0x800000>;
                    };
            };
    };

The partitions that gets created are

flash@0
part0_0-part0_1-concat
flash@1
part1_1
part0_2-part1_0-concat

Suggested-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/Kconfig           |  10 +
 drivers/mtd/Makefile          |   1 +
 drivers/mtd/mtd_virt_concat.c | 380 ++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c         |  17 ++
 drivers/mtd/mtdpart.c         |   6 +
 include/linux/mtd/concat.h    |  47 +++++
 6 files changed, 461 insertions(+)
 create mode 100644 drivers/mtd/mtd_virt_concat.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 796a2eccbef0..b91c3026ac7c 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -206,6 +206,16 @@ config MTD_PARTITIONED_MASTER
 	  the parent of the partition device be the master device, rather than
 	  what lies behind the master.
 
+config MTD_VIRT_CONCAT
+	bool "Virtual concatenated MTD devices"
+	default n
+	depends on MTD_PARTITIONED_MASTER
+	help
+	  The driver enables the creation of virtual MTD device by
+	  concatenating multiple physical MTD devices into a single
+	  entity. This allows for the creation of partitions larger than
+	  the individual physical chips, extending across chip boundaries.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 593d0593a038..d1d577f89a22 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_SM_FTL)		+= sm_ftl.o
 obj-$(CONFIG_MTD_OOPS)		+= mtdoops.o
 obj-$(CONFIG_MTD_PSTORE)	+= mtdpstore.o
 obj-$(CONFIG_MTD_SWAP)		+= mtdswap.o
+obj-$(CONFIG_MTD_VIRT_CONCAT)	+= mtd_virt_concat.o
 
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
new file mode 100644
index 000000000000..f6e8e17390a8
--- /dev/null
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Virtual concat MTD device driver
+ *
+ * Copyright (C) 2018 Bernhard Frauendienst
+ * Author: Bernhard Frauendienst <kernel@nospam.obeliks.de>
+ */
+
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/mtd/mtd.h>
+#include "mtdcore.h"
+#include <linux/mtd/partitions.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+#include <linux/mtd/concat.h>
+
+#define CONCAT_PROP "part-concat-next"
+#define CONCAT_POSTFIX "concat"
+#define MIN_DEV_PER_CONCAT 1
+
+static LIST_HEAD(concat_node_list);
+
+/**
+ * struct mtd_virt_concat_node - components of a concatenation
+ * @head: List handle
+ * @count: Number of nodes
+ * @nodes: Pointer to the nodes (partitions) to concatenate
+ * @concat: Concatenation container
+ */
+struct mtd_virt_concat_node {
+	struct list_head head;
+	unsigned int count;
+	struct device_node **nodes;
+	struct mtd_concat *concat;
+};
+
+/**
+ * mtd_is_part_concat - Check if the device is already part
+ *                       of a concatenated device
+ * @dev:        pointer to 'device_node'
+ *
+ * Return: true if the device is already part of a concatenation,
+ *         false otherwise.
+ */
+static bool mtd_is_part_concat(struct device_node *dev)
+{
+	struct mtd_virt_concat_node *item;
+	int idx;
+
+	list_for_each_entry(item, &concat_node_list, head) {
+		for (idx = 0; idx < item->count; idx++) {
+			if (item->nodes[idx] == dev)
+				return true;
+		}
+	}
+	return false;
+}
+
+static void mtd_virt_concat_put_mtd_devices(struct mtd_concat *concat)
+{
+	int i;
+
+	for (i = 0; i < concat->num_subdev; i++)
+		put_mtd_device(concat->subdev[i]);
+}
+
+static void mtd_virt_concat_destroy_joins(void)
+{
+	struct mtd_virt_concat_node *item, *tmp;
+	struct mtd_info *mtd;
+
+	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
+		mtd = &item->concat->mtd;
+		if (item->concat) {
+			mtd_device_unregister(mtd);
+			kfree(mtd->name);
+			mtd_concat_destroy(mtd);
+			mtd_virt_concat_put_mtd_devices(item->concat);
+		}
+	}
+}
+
+/**
+ * mtd_virt_concat_destroy - Destroy the concat that includes the mtd object
+ * @mtd:        pointer to 'mtd_info'
+ *
+ * Return: 0 on success, -error otherwise.
+ */
+int mtd_virt_concat_destroy(struct mtd_info *mtd)
+{
+	struct mtd_info *child, *master = mtd_get_master(mtd);
+	struct mtd_virt_concat_node *item, *tmp;
+	struct mtd_concat *concat;
+	int idx, ret = 0;
+	bool is_mtd_found;
+
+	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
+		is_mtd_found = false;
+
+		/* Find the concat item that hold the mtd device */
+		for (idx = 0; idx < item->count; idx++) {
+			if (item->nodes[idx] == mtd->dev.of_node) {
+				is_mtd_found = true;
+				break;
+			}
+		}
+		if (!is_mtd_found)
+			continue;
+		concat = item->concat;
+
+		/*
+		 * Since this concatenated device is being removed, retrieve
+		 * all MTD devices that are part of it and register them
+		 * individually.
+		 */
+		for (idx = 0; idx < concat->num_subdev; idx++) {
+			child = concat->subdev[idx];
+			if (child->dev.of_node != mtd->dev.of_node) {
+				ret = add_mtd_device(child);
+				if (ret)
+					goto out;
+			}
+		}
+		/* Destroy the concat */
+		if (concat->mtd.name) {
+			del_mtd_device(&concat->mtd);
+			kfree(concat->mtd.name);
+			mtd_concat_destroy(&concat->mtd);
+			mtd_virt_concat_put_mtd_devices(item->concat);
+		}
+
+		for (idx = 0; idx < item->count; idx++)
+			of_node_put(item->nodes[idx]);
+
+		kfree(item->nodes);
+		kfree(item);
+	}
+	return 0;
+out:
+	mutex_lock(&master->master.partitions_lock);
+	list_del(&child->part.node);
+	mutex_unlock(&master->master.partitions_lock);
+	kfree(mtd->name);
+	kfree(mtd);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mtd_virt_concat_destroy);
+
+/**
+ * mtd_virt_concat_create_item - Create a concat item
+ * @parts:        pointer to 'device_node'
+ * @count:        number of mtd devices that make up
+ *                the concatenated device.
+ *
+ * Return: 0 on success, -error otherwise.
+ */
+static int mtd_virt_concat_create_item(struct device_node *parts,
+				       unsigned int count)
+{
+	struct mtd_virt_concat_node *item;
+	struct mtd_concat *concat;
+	int i;
+
+	for (i = 0; i < (count - 1); i++) {
+		if (mtd_is_part_concat(of_parse_phandle(parts, CONCAT_PROP, i)))
+			return 0;
+	}
+
+	item = kzalloc(sizeof(*item), GFP_KERNEL);
+	if (!item)
+		return -ENOMEM;
+
+	item->count = count;
+	item->nodes = kcalloc(count, sizeof(*item->nodes), GFP_KERNEL);
+	if (!item->nodes) {
+		kfree(item);
+		return -ENOMEM;
+	}
+
+	/*
+	 * The partition in which "part-concat-next" property
+	 * is defined is the first device in the list of concat
+	 * devices.
+	 */
+	item->nodes[0] = parts;
+
+	for (i = 1; i < count; i++)
+		item->nodes[i] = of_parse_phandle(parts, CONCAT_PROP, (i - 1));
+
+	concat = kzalloc(sizeof(*concat), GFP_KERNEL);
+	if (!concat) {
+		kfree(item);
+		return -ENOMEM;
+	}
+
+	concat->subdev = kcalloc(count, sizeof(*concat->subdev), GFP_KERNEL);
+	if (!concat->subdev) {
+		kfree(item);
+		kfree(concat);
+		return -ENOMEM;
+	}
+	item->concat = concat;
+
+	list_add_tail(&item->head, &concat_node_list);
+
+	return 0;
+}
+
+static void mtd_virt_concat_destroy_items(void)
+{
+	struct mtd_virt_concat_node *item, *temp;
+	int i;
+
+	list_for_each_entry_safe(item, temp, &concat_node_list, head) {
+		for (i = 0; i < item->count; i++)
+			of_node_put(item->nodes[i]);
+
+		kfree(item->nodes);
+		kfree(item);
+	}
+}
+
+/**
+ * mtd_virt_concat_create_add - Add a mtd device to the concat list
+ * @mtd:        pointer to 'mtd_info'
+ *
+ * Return: true on success, false otherwise.
+ */
+bool mtd_virt_concat_add(struct mtd_info *mtd)
+{
+	struct mtd_virt_concat_node *item;
+	struct mtd_concat *concat;
+	int idx;
+
+	list_for_each_entry(item, &concat_node_list, head) {
+		concat = item->concat;
+		for (idx = 0; idx < item->count; idx++) {
+			if (item->nodes[idx] == mtd->dev.of_node) {
+				concat->subdev[concat->num_subdev++] = mtd;
+				return true;
+			}
+		}
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(mtd_virt_concat_add);
+
+/**
+ * mtd_virt_concat_node_create - List all the concatenations found in DT
+ *
+ * Return: 0 on success, -error otherwise.
+ */
+int mtd_virt_concat_node_create(void)
+{
+	struct device_node *parts = NULL;
+	int ret = 0, count = 0;
+
+	/* List all the concatenations found in DT */
+	do {
+		parts = of_find_node_with_property(parts, CONCAT_PROP);
+		if (!of_device_is_available(parts))
+			continue;
+
+		if (mtd_is_part_concat(parts))
+			continue;
+
+		count = of_count_phandle_with_args(parts, CONCAT_PROP, NULL);
+		if (count < MIN_DEV_PER_CONCAT)
+			continue;
+
+		/*
+		 * The partition in which "part-concat-next" property is defined
+		 * is also part of the concat device, so increament count by 1.
+		 */
+		count++;
+
+		ret = mtd_virt_concat_create_item(parts, count);
+		if (ret) {
+			of_node_put(parts);
+			goto destroy_items;
+		}
+	} while (parts);
+
+	return ret;
+
+destroy_items:
+	mtd_virt_concat_destroy_items();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mtd_virt_concat_node_create);
+
+/**
+ * mtd_virt_concat_create_join - Create and register the concatenated
+ *                                 MTD device.
+ *
+ * Return: 0 on success, -error otherwise.
+ */
+int mtd_virt_concat_create_join(void)
+{
+	struct mtd_virt_concat_node *item;
+	struct mtd_concat *concat;
+	struct mtd_info *mtd;
+	ssize_t name_sz;
+	int ret, idx;
+	char *name;
+
+	list_for_each_entry(item, &concat_node_list, head) {
+		concat = item->concat;
+		/*
+		 * Check if item->count != concat->num_subdev, it indicates
+		 * that the MTD information for all devices included in the
+		 * concatenation are not handy, concat MTD device can't be
+		 * created hence switch to next concat device.
+		 */
+		if (item->count != concat->num_subdev) {
+			continue;
+		} else {
+			/* Calculate the legth of the name of the virtual device */
+			for (idx = 0, name_sz = 0; idx < concat->num_subdev; idx++)
+				name_sz += (strlen(concat->subdev[idx]->name) + 1);
+			name_sz += strlen(CONCAT_POSTFIX);
+			name = kmalloc(name_sz + 1, GFP_KERNEL);
+			if (!name) {
+				mtd_virt_concat_put_mtd_devices(concat);
+				return -ENOMEM;
+			}
+
+			ret = 0;
+			for (idx = 0; idx < concat->num_subdev; idx++) {
+				ret += sprintf((name + ret), "%s-",
+					       concat->subdev[idx]->name);
+			}
+			sprintf((name + ret), CONCAT_POSTFIX);
+
+			if (concat->mtd.name) {
+				ret = memcmp(concat->mtd.name, name, name_sz);
+				if (ret == 0)
+					continue;
+			}
+			mtd = mtd_concat_create(concat->subdev, concat->num_subdev, name);
+			if (!mtd) {
+				kfree(name);
+				return -ENXIO;
+			}
+			concat->mtd = *mtd;
+			/* Arbitrary set the first device as parent */
+			concat->mtd.dev.parent = concat->subdev[0]->dev.parent;
+			concat->mtd.dev = concat->subdev[0]->dev;
+
+			/* Add the mtd device */
+			ret = add_mtd_device(&concat->mtd);
+			if (ret)
+				goto destroy_concat;
+		}
+	}
+
+	return 0;
+
+destroy_concat:
+	mtd_concat_destroy(mtd);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mtd_virt_concat_create_join);
+
+static void __exit mtd_virt_concat_exit(void)
+{
+	mtd_virt_concat_destroy_joins();
+	mtd_virt_concat_destroy_items();
+}
+module_exit(mtd_virt_concat_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Bernhard Frauendienst <kernel@nospam.obeliks.de>");
+MODULE_AUTHOR("Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>");
+MODULE_DESCRIPTION("Virtual concat MTD device driver");
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5ba9a741f5ac..bd7b496a3b3c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -34,6 +34,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/concat.h>
 
 #include "mtdcore.h"
 
@@ -1070,6 +1071,12 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			goto out;
 	}
 
+	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
+		ret = mtd_virt_concat_node_create();
+		if (ret < 0)
+			goto out;
+	}
+
 	/* Prefer parsed partitions over driver-provided fallback */
 	ret = parse_mtd_partitions(mtd, types, parser_data);
 	if (ret == -EPROBE_DEFER)
@@ -1087,6 +1094,11 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	if (ret)
 		goto out;
 
+	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
+		ret = mtd_virt_concat_create_join();
+		if (ret < 0)
+			goto out;
+	}
 	/*
 	 * FIXME: some drivers unfortunately call this function more than once.
 	 * So we have to check if we've already assigned the reboot notifier.
@@ -1136,6 +1148,11 @@ int mtd_device_unregister(struct mtd_info *master)
 	nvmem_unregister(master->otp_user_nvmem);
 	nvmem_unregister(master->otp_factory_nvmem);
 
+	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
+		err = mtd_virt_concat_destroy(master);
+		if (err)
+			return err;
+	}
 	err = del_mtd_partitions(master);
 	if (err)
 		return err;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 994e8c51e674..f4381d906167 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/mtd/concat.h>
 
 #include "mtdcore.h"
 
@@ -409,6 +410,11 @@ int add_mtd_partitions(struct mtd_info *parent,
 			goto err_del_partitions;
 		}
 
+		if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
+			if (mtd_virt_concat_add(child))
+				continue;
+		}
+
 		mutex_lock(&master->master.partitions_lock);
 		list_add_tail(&child->part.node, &parent->partitions);
 		mutex_unlock(&master->master.partitions_lock);
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index b42d9af87c4e..81d7d75fb762 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -28,5 +28,52 @@ struct mtd_info *mtd_concat_create(
 
 void mtd_concat_destroy(struct mtd_info *mtd);
 
+/**
+ * mtd_virt_concat_node_create - Create a component for concatenation
+ *
+ * Returns a positive number representing the no. of devices found for
+ * concatenation, or a negative error code.
+ *
+ * List all the devices for concatenations found in DT and create a
+ * component for concatenation.
+ */
+int mtd_virt_concat_node_create(void);
+
+/**
+ * mtd_virt_concat_add - add mtd_info object to the list of subdevices for concatenation
+ * @mtd: pointer to new MTD device info structure
+ *
+ * Returns true if the mtd_info object is added successfully else returns false.
+ *
+ * The mtd_info object is added to the list of subdevices for concatenation.
+ * It returns true if a match is found, and false if all subdevices have
+ * already been added or if the mtd_info object does not match any of the
+ * intended MTD devices.
+ */
+bool mtd_virt_concat_add(struct mtd_info *mtd);
+
+/**
+ * mtd_virt_concat_create_join - Create and register the concatenated MTD device
+ *
+ * Returns 0 on succes, or a negative error code.
+ *
+ * Creates and registers the concatenated MTD device
+ */
+int mtd_virt_concat_create_join(void);
+
+/**
+ * mtd_virt_concat_destroy - Remove the concat that includes a specific mtd device
+ *                           as one of its components.
+ * @mtd: pointer to MTD device info structure.
+ *
+ * Returns 0 on succes, or a negative error code.
+ *
+ * If the mtd_info object is part of a concatenated device, all other MTD devices
+ * within that concat are registered individually. The concatenated device is then
+ * removed, along with its concatenation component.
+ *
+ */
+int mtd_virt_concat_destroy(struct mtd_info *mtd);
+
 #endif
 
-- 
2.34.1

