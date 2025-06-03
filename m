Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFD421CC59;
	Tue,  3 Jun 2025 19:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748979752; cv=fail; b=VxZO7OJUdeRgvdNRjeLCBj2EOHyvON/QDByfWuZA/evix73NAVl4AkgUIr25wqnqPl1qzATusMqbsAXifnNuGuv1NKqbuVo8YZpgVcVwgcAaxY8IX2ffxvMi0Un5jYhVe/zNnbHbC1JF6ydTR1Bz7UaTj3B3ZnMOJXkx5u4zUcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748979752; c=relaxed/simple;
	bh=KlQkwx47aYObMV7YetiZZkJkZnVxKtfIVgJleP+NPA8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJKqAM4BurTRi5pFDcHBwWPy43pjtPf5rTpKuhfPA28Bd9LWxYiujRGSyGrezdoZZronecQwOV+hV9StYQXtUrKlZkzDwFWWRLXWrIlhPqJ9QkAufZBdO75LZJ+KVD1sxXkEHqX/zjOdtq7nu8/Dq9Roo5QkoTHcana17QygX0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aV1uElfO; arc=fail smtp.client-ip=40.107.243.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aV1uElfO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtoKJEMfsftbN5sptmvvNo7qBjMS6fNLPrhfNO1Q5nqX+l6O9/vezJw2SuPh2Oq/CSq25lA0gxk6KbFameD6kKj2/jOH+tQ0SdcAZk9oxalX/3pZ+U085v5dthTTGOKgu9ni0E9p93X5p3PhUVZyRErjYA4gHhrvPLY/iz6v+WBhwzo39JQipef8tCyLs3RHEG07sTTjsCaI47rmiC9V9omzubl9kPK04X0NaceIWad2TFIP7UuP5Uk1LxXC6aNANBjQANDWdbbAXX5+UsxCZMSzipQsOxWsPFXihppk9zPBVU7V/Lz0MZhB1jBcdHLG7z+CNnWEqMnKUxvqPu18tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4Fe+aB6buZBVW9OZo9/zAQVrdxQA40CRaCKK3ml7LA=;
 b=IhxPfBjIOOzx+0CmZOjnT82aR+X/CEgDG0f9nO6im26yU21iU7KROz8hHRALPziP5IuL2Mic2YzevXpzZNcukCoiNLCFstE3MtOUmy1GvwDq/GAHMzsGrt0EsXilplg7pDi6EBxJTeQwAOymnmfGfAyh0Wwsl8khM3zds+dPJmyG+zSKXGQTsZlV1R+2pFlTH5IaBcaYcCWUCEqYIaXEnirppNTYBMlBC5FhGrTYrwdQZDZOVi67WlVCgT1kGGZBMR6boJKDzHX7dpWVQbOt1QecrlhOQ8KMrNDZSNzPfk8u7L5M6lZ/zb6K04JRBEZaYH7RboS4U1bFO+m/YfHsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4Fe+aB6buZBVW9OZo9/zAQVrdxQA40CRaCKK3ml7LA=;
 b=aV1uElfOiZjeI83iBUIhn6JJ7l9BKaVbzcs4/rhMTa/PHAyiBbBb0ICrYJ4LTskYdWMR7IUuZwRKYY7ReAje6knV3FvaNljD/Tz7phqc6NQGqVS0ZBdIgI4CCsv1Ra4oi5gojPv2nw9yReuVmjwQU0v+MHh+VuBO98aFlmWzSW0=
Received: from BL6PEPF00013DFF.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1e) by IA1PR12MB8467.namprd12.prod.outlook.com
 (2603:10b6:208:448::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 19:42:28 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2a01:111:f403:f901::8) by BL6PEPF00013DFF.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 3 Jun 2025 19:42:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 19:42:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:42:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:42:25 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 14:42:22 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Bernhard Frauendienst
	<kernel@nospam.obeliks.de>
Subject: [PATCH v13 3/3] mtd: Add driver for concatenating devices
Date: Wed, 4 Jun 2025 01:12:09 +0530
Message-ID: <20250603194209.1341374-4-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
References: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: amit.kumar-mahapatra@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|IA1PR12MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: a8eb98e8-f856-4f62-901e-08dda2d6c555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dH4xNivwJhVUGnaFD2jrIEy7ieTGICEZ3/MgJvrYnPiSPt4qvGnCcDhjh7sP?=
 =?us-ascii?Q?tXfWdYuEyFNiRGkI63JJlgyOdfX+9vh9lLOrNf9qdb1QGnx9kNMcMI9y+te/?=
 =?us-ascii?Q?+TRHPcnrqVXmxYL3cY+xN/+T7yf9GP3gTnmQCKOQ7nBUl5i8TnXgY12Ja6sP?=
 =?us-ascii?Q?1i3sJ1VY1AXgHHs4ntEebB6MlOkYVYg0p2wRKOLd8o5uyPRiwhCOd1+BihbR?=
 =?us-ascii?Q?SSUoklysE1Oj0cBtxvlBwCAt0nteTNqyOPhXalr86P8ZaXuqqVDTdwXik3Ko?=
 =?us-ascii?Q?/5caswWMleD3NmZWKPeiQNgt31L5tizhH3mX+27L6cPCNG/EhtjYwZCSBdzh?=
 =?us-ascii?Q?u1HRAylgWu9SJG7q1cKG2427ECX3f776QVV3Hw8YVUFDBjyLkvH1rDsHjMPz?=
 =?us-ascii?Q?KZVmyWqDXxqgHpUTmRVDhC2dp1jmB/CPAqZD7RFjCwkoFPeGqjrkHBT0aHTJ?=
 =?us-ascii?Q?yR3F4RNXHqMScLPwNHhcgfFMnDCH/2wGnGSa2lGBerGDr8m4IgWju47FUOnS?=
 =?us-ascii?Q?Cyb71MInPvrfbJVvdGiqQO1v+T6+ipYL5pu/ymTXoPmvLgELO9VIZN2vO5uV?=
 =?us-ascii?Q?BqLen5V9V2555nIpgiKs2Yisl0LCDQcU9hnxksMQ4W/5vLeQA3yPhBS01RLL?=
 =?us-ascii?Q?drfer5RCAg/FZNG1+fRVwfoQeNqFVi6DCYnP5X3nNk/NN/oI2BOqCtGLP5Hi?=
 =?us-ascii?Q?ZCJtqRRcKYn7P7NifyytSdp6hzZzUgB2pvuFZYJtKZWtxGMo+quJ34qv2gUa?=
 =?us-ascii?Q?s0SXOfUE9zr5UnPAS6sMYhmKmB2uY7qnHh/Moyokygbzx1FSb5ofGVEhSg1z?=
 =?us-ascii?Q?f0fIf/EKiBgX0Q8UXmQxvWVYqruQbPm5QM6aQEX90R5bRg3ifoxgK5LFn7/j?=
 =?us-ascii?Q?bERPomP/xS8O3eweDXytEodzoJkIdposdtr3Qd/RZ7312u9dAFA/L7jW067o?=
 =?us-ascii?Q?SZpHc8AuECIB7/LlpAHHKJarOxKzn5p2eM97viSXA2zFwYocGp30pOELu9Wj?=
 =?us-ascii?Q?n3feL2n8YOiYarL+k0OJ/Df6L9U3yqm+nMmy3CCwjsk/zUBMFtp7kvuHSIaM?=
 =?us-ascii?Q?yctnL33IEfesP9YpRwEfYCU4NNQYhPDAuNtDnztG2VkdW8J39wv00QLfKH8l?=
 =?us-ascii?Q?ee2wY7OTPuUXQbHcvPYQ78iPaNDGbvq7ZK9zKY3iIDig0w8cLn1BArJk/bTD?=
 =?us-ascii?Q?ytHtam/fzwa3ndUH0R/iSqQtxSquXNX1rav43cDsvFRSWZwKAWNOI0o58/9z?=
 =?us-ascii?Q?kIHLZ9Zf/3pd4FsQM6UtkQnhhB1xgN3QL9Abs66jNn+E9FPvhu5YzdEsgppl?=
 =?us-ascii?Q?x9vxPElURwgGjIUFh36zk9R/5WcfmxRWqnprg6gOwQ7oSz1zwooDGzBlAwDf?=
 =?us-ascii?Q?hLTTKKRMCd3qV3OdrqTx6k2sh+91uNVJziAqPJKgejYeAd8HcQP1CM2yV6Dy?=
 =?us-ascii?Q?ULce4iyo6kObF6/QCBTIxCv2t4Jta9z8Mffm5u78FT1WqMKklg4zkbCfgJ7Z?=
 =?us-ascii?Q?R9nBmXwABLaBqd9+LQACgZmJvtZbHlpk2Ab6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:42:27.3446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8eb98e8-f856-4f62-901e-08dda2d6c555
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8467

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
Tested the virtual concat driver on the AMD-Xilinx ZynqMP board by building 
the ZynqMP GQSPI driver as a module and loading it post kernel boot.
---
 drivers/mtd/Kconfig           |  10 ++
 drivers/mtd/Makefile          |   1 +
 drivers/mtd/mtd_virt_concat.c | 313 ++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c         |  12 ++
 drivers/mtd/mtdpart.c         |   6 +
 include/linux/mtd/concat.h    |  32 ++++
 6 files changed, 374 insertions(+)
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
index 000000000000..8c618c676a51
--- /dev/null
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -0,0 +1,313 @@
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
index 724f917f91ba..255062a1ab3d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -34,6 +34,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/concat.h>
 
 #include "mtdcore.h"
 
@@ -1067,6 +1068,12 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
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
@@ -1084,6 +1091,11 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
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
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6811a714349d..2392623646d0 100644
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
index b42d9af87c4e..5b0b88d0ba44 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -28,5 +28,37 @@ struct mtd_info *mtd_concat_create(
 
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
+ * Returns on succes, or a negative error code.
+ *
+ * Creates and registers the concatenated MTD device
+ */
+int mtd_virt_concat_create_join(void);
 #endif
 
-- 
2.34.1

