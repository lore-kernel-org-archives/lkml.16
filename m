Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EEA149DE8;
	Wed,  5 Feb 2025 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762676; cv=fail; b=TpdG4FGPGIKA8N/LCw6G9pkxpVrcxAw//uUqIeiNQGKXjj+k2bOQIbzpynHCa7Rb+P+UjrSM31sw7gC3b7AmzLlGsRbDNxERlcJxSCraQ93kV4lu0XFueAbY6b7jd5IElzox5XlUn/ixdm8OB/odwJDDpQaXOiIculuLY8MWjFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762676; c=relaxed/simple;
	bh=FplIE3uTjRmsBh+wf2yZtnSZjA3m2Zev4mlFuUcrcec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pyhWsM7jDmJUQ6HeHmnlKtjXu0QHwQTQd8r0q7cp7LU/Wg8c8mrE3CdyJbIbyi2XkLXuJjHf5X1+bIsB9reNeQJFeyxLxt/ujeo0g1JXYWI/E9XgM+lcsWAk6IFlfLuNcwScqLtcCVo6sk/r7vveJmh7eAjIzHO6UhMtL3eL3aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IWaIPgda; arc=fail smtp.client-ip=40.107.212.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IWaIPgda"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stDKYSZiL04QoLhaed027wN0mzxWnbShfhJLixPBR+dPI98QJFfh7BH59QtfXUsTg5fTpu0VX7OmWLYkoZzlQpCQeB2/C9XV2Jw/MuSxiuyW+54QQ3u+afGlQxLk/diQoQIW3m8gn9NRnUZnvEKkAIfr8Ci3Ewgi0VbAVxU2FR3FVDNzZKldsBlTZkDNyFhvKbH/dD0t91E+FEAYKocvylPTokaFGKWbbGBf3MCkJ0KJ1P92759JaObru9dibk7gp09QyYgnjtwtAenW8TjLIQKhxOoBqY3RG8/LacX02zrOgLKXxB6k86tZPBCBLBvJk3n9v8/coREz9V5Yhpw80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M34D0EJ0AP577sMN+0b5NtGG79EQTRVQmtqxiWmuo0A=;
 b=lxv/zeQohdH+LniT5KJ3u4LHgXUxu5XTpjIa7wW8lLb0b0GY0/WWraVS3Vx0el4t+4YQmH1aD91TdcR5BUcAbFptAHaPEpo//aiGXxHgcsne6ItiRH2qtNRtOCMFWhFYFkhNd/MWteDIFy9UT2Y3Uv/LKwOi9kkkiMm3h9vuuCWBLIC0tJWC8PtWqkffJraWqEcEcYSfRnYowOAo1iw7ES9RelXB1yQYELEPpuFrfRewYnOkxK9aj66FQBcf7fwoK50t5jMWuUlAOMV6XxaLJO2B5Y+dCWmgB6PZYs2gxuW0vlTJbqsLBEXdhvNp5AecEghbhd0JFFQ54xJukvMtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M34D0EJ0AP577sMN+0b5NtGG79EQTRVQmtqxiWmuo0A=;
 b=IWaIPgda2uSI4uygsi+M4BRG3CVnkZ/OtU88isskE0aZX7YUfJx7r6MVlpEd/MrgKFGFSiMU/JAbQTQLXaEiOwF/VViODbTtJaz3bLlXXGJAFMKmT13XtNnDE7+e8YZUzp43LIKNWe/iifkCwdz6vfCw4X1zRBzLlmfSv0RpbdU=
Received: from LV3P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::12)
 by MN0PR12MB6344.namprd12.prod.outlook.com (2603:10b6:208:3d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 13:37:50 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:234:cafe::2a) by LV3P220CA0011.outlook.office365.com
 (2603:10b6:408:234::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Wed,
 5 Feb 2025 13:37:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Wed, 5 Feb 2025 13:37:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 07:37:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 07:37:47 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 07:37:44 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Bernhard Frauendienst
	<kernel@nospam.obeliks.de>
Subject: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Date: Wed, 5 Feb 2025 19:07:30 +0530
Message-ID: <20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|MN0PR12MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 1917a6d5-73cb-441f-5395-08dd45ea48a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g/0y0WMa0ssEXhTqPB8VLC9n08elsR93sYPdCABPTiymIo/2m24/DrnrvH9S?=
 =?us-ascii?Q?nUizKVGEbFYMBc5KJbLlULY6IdtNfToQb8uCekClbzWIQJvrkcrYFygksOJ4?=
 =?us-ascii?Q?Fe/en51WiJKUIt9WPXoVXCP/nTiGiFh9zKQ1rq0c401WDajd9beKKAHfoSek?=
 =?us-ascii?Q?bjZgISzCC/qkqu/U2qD32hCGHTfWdBlPKzDe3EpiHbv5qDn4Glbj9PNSthJ6?=
 =?us-ascii?Q?S/frBVhtbDzpkGNOnuOOZR3lKq/OXQIVSrq3XoV8O6r/rEhHmOJiuz96kNm3?=
 =?us-ascii?Q?Fha9977Xm4VnR6DK/3KEJFeD6L4VZfh5pXqTgZqYl/jmwHdqU1iz8dki8eWf?=
 =?us-ascii?Q?UmQOjjg74OHj7SPTlX38URUP2+SRp4IHgBB71w5ecpJCq9VRnAKELn7T6CUo?=
 =?us-ascii?Q?0rQ5NHgO+NK6vHVbrnGLbe0pl2rPwgPbQ144vn2MI2ZSBynIPThsRJI+1Vhz?=
 =?us-ascii?Q?AtcvIH9dowbgnSWmhBeTvT1zpoKH8l+SkU3pmkH0iioqh4jNudRnHOWk+iWc?=
 =?us-ascii?Q?1G/pk8MnLSf1hv9TtqWrQ2SziXPHyifLOmAfpWTO564V3MfhRxDcQQfUSPjI?=
 =?us-ascii?Q?ne6t9XnJsdZM65PBBHU4lSYDgdyycLQzRq/L0B4+uzdf7EEvMFwHGKlVhEgF?=
 =?us-ascii?Q?I+LHpLiL3ez0iuBSW6Vcaf7dU3ZYst9nt0lbxhia2RzaJmS5s6CGLTlDpXAW?=
 =?us-ascii?Q?6WUIo104OKdG9knhno+bHcZvtNa3izxbtRfAGnM3dYeJtzDPCd+CdhUS28gn?=
 =?us-ascii?Q?6kYjVhg/YEiT0RKqw7KO+YrmuHPRrweQ3M6OZbhsZWgrFO6zJ9pBOXlqThVP?=
 =?us-ascii?Q?5IxS/E7d5MfFp5MOOH2Ly0Z9uBM33bWvMZBzGbutXSffXaPfCOUHF/18mGTu?=
 =?us-ascii?Q?0yQtjgFLuAdPfAt8OaVc57ZTOv7wWU9b3oo/ZnUB8D/Uq4mXfLhka4c2/+d9?=
 =?us-ascii?Q?Zaw4NL0FBJIE3zCibEG41uG8A8FpNOYar6NDQIYkqbe1dhMf8QHi0Rjcitet?=
 =?us-ascii?Q?/Xy42sIpUXnD/qTCkARXJFORvIPLKolj7ZYoNAZlB99PcrhqXFLt8MYH5wYc?=
 =?us-ascii?Q?dJBLri6JxmozE6p/7YXLm6IrAMLrUwehGobBWBKvVNLJ6bP/uShRSNq4b5TU?=
 =?us-ascii?Q?PuLxiyyH+49DaacyclCBhNE4otg7pe8GuFbmg5Nji5XO/GoUta5I0mJ8RI25?=
 =?us-ascii?Q?xzw/qjj6D+nXzRJkmVC490/xO8BwCHd+41Uwg71ggH28ViQeLIoblAmHgv/W?=
 =?us-ascii?Q?JkazCAAnojLpkN2gAWyN/0fDe1ihRSKlYRirnvmA7hSCeYaPCU4E/z8Nkh3U?=
 =?us-ascii?Q?nuVGK+KiZEOqpYepZWaS49HSNq08x0P31MDmQj2w5n5Z/hQOYOd+57Dc7aKm?=
 =?us-ascii?Q?daSlUEfgcHjKsh0w2i6ZYdMjCU35VWUquxg2j9p0uOGp//cwObPDTqS+9gid?=
 =?us-ascii?Q?3v9GvQo2Icz/oypUqfuZ2CKrvkVg4RZjjSDUc4DbuN9arRdI9NlTKpdK7KUg?=
 =?us-ascii?Q?xoq5SbWtlfm8zZE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 13:37:49.9089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1917a6d5-73cb-441f-5395-08dd45ea48a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6344

Introducing CONFIG_VIRT_CONCAT to separate the legacy flow from the new
approach, where individual partitions within a concatenated partition are
not registered, as they are likely not needed by the user.

Solution is focusing on fixed-partitions description only because it
depends on device boundaries.

Suggested-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/Kconfig           |   8 ++
 drivers/mtd/Makefile          |   1 +
 drivers/mtd/mtd_virt_concat.c | 254 ++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c         |   7 +
 drivers/mtd/mtdpart.c         |   6 +
 include/linux/mtd/concat.h    |  24 ++++
 6 files changed, 300 insertions(+)
 create mode 100644 drivers/mtd/mtd_virt_concat.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 796a2eccbef0..3dade7c469df 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -206,6 +206,14 @@ config MTD_PARTITIONED_MASTER
 	  the parent of the partition device be the master device, rather than
 	  what lies behind the master.
 
+config MTD_VIRT_CONCAT
+	tristate "Virtual concatenated MTD devices"
+	help
+	  The driver enables the creation of a virtual MTD device
+	  by concatenating multiple physical MTD devices into a single
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
index 000000000000..3de67305a09b
--- /dev/null
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -0,0 +1,254 @@
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
+#define CONCAT_PROP "part-concat"
+#define MIN_DEV_PER_CONCAT 2
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
+static int mtd_virt_concat_create_item(struct device_node *parts,
+				       unsigned int count)
+{
+	struct mtd_virt_concat_node *item;
+	struct mtd_concat *concat;
+	int i;
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
+	for (i = 0; i < count; i++)
+		item->nodes[i] = of_parse_phandle(parts, CONCAT_PROP, i);
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
+bool mtd_virt_concat_add(struct mtd_info *mtd)
+{
+	struct mtd_virt_concat_node *item;
+	struct mtd_concat *concat;
+	int idx;
+
+	list_for_each_entry(item, &concat_node_list, head) {
+		concat = item->concat;
+		if (item->count == concat->num_subdev)
+			return false;
+
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
+int mtd_virt_concat_node_create(void)
+{
+	struct mtd_concat *concat;
+	struct device_node *parts = NULL;
+	int ret = 0, count;
+
+	if (!list_empty(&concat_node_list))
+		return 0;
+
+	/* List all the concatenations found in DT */
+	do {
+		parts = of_find_node_with_property(parts, CONCAT_PROP);
+		if (!of_device_is_available(parts))
+			continue;
+
+		count = of_count_phandle_with_args(parts, CONCAT_PROP, NULL);
+		if (count < MIN_DEV_PER_CONCAT)
+			continue;
+
+		ret = mtd_virt_concat_create_item(parts, count);
+		if (ret) {
+			of_node_put(parts);
+			goto destroy_items;
+		}
+	} while (parts);
+
+	concat = kzalloc(sizeof(*concat), GFP_KERNEL);
+	if (!concat) {
+		ret = -ENOMEM;
+		of_node_put(parts);
+		goto destroy_items;
+	}
+
+	concat->subdev = kcalloc(count, sizeof(*concat->subdev), GFP_KERNEL);
+	if (!concat->subdev) {
+		kfree(concat);
+		ret = -ENOMEM;
+		of_node_put(parts);
+		goto destroy_items;
+	}
+
+	return count;
+
+destroy_items:
+	mtd_virt_concat_destroy_items();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mtd_virt_concat_node_create);
+
+static int __init mtd_virt_concat_create_join(void)
+{
+	struct mtd_virt_concat_node *item;
+	struct mtd_concat *concat;
+	struct mtd_info *mtd;
+	ssize_t name_sz;
+	char *name;
+	int ret;
+
+	list_for_each_entry(item, &concat_node_list, head) {
+		concat = item->concat;
+		mtd = &concat->mtd;
+		/* Create the virtual device */
+		name_sz = snprintf(NULL, 0, "%s-%s%s-concat",
+				   concat->subdev[0]->name,
+				   concat->subdev[1]->name,
+				   concat->num_subdev > MIN_DEV_PER_CONCAT ?
+				   "-+" : "");
+		name = kmalloc(name_sz + 1, GFP_KERNEL);
+		if (!name) {
+			mtd_virt_concat_put_mtd_devices(concat);
+			return -ENOMEM;
+		}
+
+		sprintf(name, "%s-%s%s-concat",
+			concat->subdev[0]->name,
+			concat->subdev[1]->name,
+			concat->num_subdev > MIN_DEV_PER_CONCAT ?
+			"-+" : "");
+
+		mtd = mtd_concat_create(concat->subdev, concat->num_subdev, name);
+		if (!mtd) {
+			kfree(name);
+			return -ENXIO;
+		}
+
+		/* Arbitrary set the first device as parent */
+		mtd->dev.parent = concat->subdev[0]->dev.parent;
+		mtd->dev = concat->subdev[0]->dev;
+
+		/* Register the platform device */
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret)
+			goto destroy_concat;
+	}
+
+	return 0;
+
+destroy_concat:
+	mtd_concat_destroy(mtd);
+
+	return ret;
+}
+
+late_initcall(mtd_virt_concat_create_join);
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
index 724f917f91ba..2264fe81810f 100644
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
 
+	if (IS_ENABLED(CONFIG_MTD_VIRT_CONCAT)) {
+		ret = mtd_virt_concat_node_create();
+		if (ret < 0)
+			goto out;
+	}
+
 	/* Prefer parsed partitions over driver-provided fallback */
 	ret = parse_mtd_partitions(mtd, types, parser_data);
 	if (ret == -EPROBE_DEFER)
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6811a714349d..4f50e14b96dd 100644
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
 
+		if (IS_ENABLED(CONFIG_MTD_VIRT_CONCAT)) {
+			if (mtd_virt_concat_add(child))
+				continue;
+		}
+
 		mutex_lock(&master->master.partitions_lock);
 		list_add_tail(&child->part.node, &parent->partitions);
 		mutex_unlock(&master->master.partitions_lock);
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index b42d9af87c4e..65c9a18774f6 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -28,5 +28,29 @@ struct mtd_info *mtd_concat_create(
 
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
 #endif
 
-- 
2.34.1

