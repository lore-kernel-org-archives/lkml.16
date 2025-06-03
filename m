Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D061F869F;
	Tue,  3 Jun 2025 18:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976833; cv=fail; b=AeZj8iGgm4V4I6xn1sy+dQ3uyBAj8xIg6xMHZRjGkqIEMlyW56284eGEzfjAXSRxpkqYbBztfY9iLau1hnycIbYIF+V+DYVezArOM3eC7I0sh23/ijPcX8pilgLlvd89F8Rs1Ka49qSU+AopLP+4TBA5istySElAvnpBh1p8Ueo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976833; c=relaxed/simple;
	bh=aZW3rRJnD8oAc/aCPI9FXzoO42waD58wT9vjISiRbQs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E+2Sc47LyaJVF+RUd8JkRVztLOvSKZSe6vYTPFcrSe7qDVTLs0xcCXU8t5bhhVS9doZweZ/kAcMSWemX2YQpPR/MYBimTB0ZxnKuhDpIMSiHf4y98lMs9i3VZ2C+hU2SsKczsUfR7TDcIMkmUROjrRMPjsPx7AVP/qptudXi/wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G4mEDlEv; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G4mEDlEv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqxnhuV0TgSSYT+Q/XO4oXa+aCAFRz93s9BUM2bHCEHLsvb85gIWaLxaAinK0BqSnNKtbRKsJtYrElHDwXGbYOyOPv4fNuok8DJsVl62jGKego5GhEGbJcl1CkK5yKPBFZwE6ub77doQWo353tDoOT1c9x1p+PqiVZ0l8MzZB+ESEVqnCoI43Z7S24/1SMCVWgSHQwC0EETpvkbn/wEQo5tg6m3g209bdTSvGoK8+/TltUNNTPKwKBiNWlXNRY7wCAgEr2lv0m7ePbCA6t3Hxmct1mXwVP0nADq0L+/m/d2JNWl2fe2TVWQq5y8EP78DHRFtMxLN/h6ZPKZqt8CcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkUtT8yMVVF+M1ULz7w5gHKt7CwG5iCYbscJkDRHXPQ=;
 b=B/O7kwwFuOEW648CQHV5pSGJBciGfl55GXWcuaM5WETmK1FUWBPfYGKhkp3LeovhpYPR1k8/B8GX9oBecZw6m/VE7paA7T1tMXB3piNzKuW9kTeF3o0OIwhxiH2Tjv6jb6YfpgA3Hr/SblYXJmUGiyB79IykGdotpQhiN1m6JOmg4n7q7izPTCcLU7ykTYIYKowAoTXo4HGl5Wx3tCY4datyLju6WJAjdkkj2s4YiVcDEnUoPBjp1+qoSiGIz3uL5w6gVnZi0GN5/C/N18dMmHDNieWpLLnl/N5/ey0ETzx7oUNzbykNO9sxtrXqT+CDrJzp06Ao7ymcfS6zMN3uVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkUtT8yMVVF+M1ULz7w5gHKt7CwG5iCYbscJkDRHXPQ=;
 b=G4mEDlEvf4bqbSUKP/RgKYRdxCurC0VW3kdN5zZOLYVDWooP1ZS0/47sNJfPRKXUJfZxvTuwME4k55fZs8g+Q9noeunrFMHPn8LH9N9rgbbRzDi4o8YUf8We6Jrc0DuX6ahpOmva2VnZAGTyh8ZVrHx2RTF6sm79oryLnN++KcQ=
Received: from MW4PR04CA0307.namprd04.prod.outlook.com (2603:10b6:303:82::12)
 by SA1PR12MB7368.namprd12.prod.outlook.com (2603:10b6:806:2b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 18:53:47 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::b6) by MW4PR04CA0307.outlook.office365.com
 (2603:10b6:303:82::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.23 via Frontend Transport; Tue,
 3 Jun 2025 18:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 18:53:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 13:53:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 13:53:44 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 13:53:42 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH] usb: dwc3: xilinx: set coherency mode for AMD versal adaptive platform
Date: Wed, 4 Jun 2025 00:23:38 +0530
Message-ID: <1748976818-710088-1-git-send-email-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.1.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|SA1PR12MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4000d5-3875-45d7-996e-08dda2cff891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rdHMIXeOZB9CQcErAaCg9n+yAQ0wLh6UyxcVX5oXUuoMcON0PrqWN4zElFey?=
 =?us-ascii?Q?tZvjHgVEf48IQNJ8CRqutN+ImRxpL8xvKImclD7A3lWdTW6Os180YwXM8K5D?=
 =?us-ascii?Q?ZfnV/nJo5Uxov8k5/6fxMhuX7BWlMAn+0b3L27PpRUvxviNE9WjhHXmdtUlI?=
 =?us-ascii?Q?/CAEWdZ5h+4JH1ISEoIMG5h6F+cbwGAqzILTb41H1RiE0QxUXGAO5C0Ss9Z7?=
 =?us-ascii?Q?de5ydniMLNdO4M0yMs1ptftr8yzYQaLo+PRErSf3NeGdgDyQ3eaYpXh7d4X6?=
 =?us-ascii?Q?TcSWmMCvRufueMpmyemcc6YLQdwG+iPpZ5R4VwJzcc5DDYq6aJRlE/KKQ07J?=
 =?us-ascii?Q?k7RjcHq489n7mLKSJTSBY/2GyHoItJeRWZXDLrq7aGBcaa8GE+OuQAEk4NnZ?=
 =?us-ascii?Q?QTZQCN1CwjDTF0SnzbMlNIF1fwQ7mQlS3c4jD0+cfuVKs7Kic2H9jwcQITib?=
 =?us-ascii?Q?or0171gxdUCg07Tcjrz1z6HABnTI4p4W30ec16TkfW3+BVsDlyc8xtDPvr8D?=
 =?us-ascii?Q?NSw1pAEAXglg3NmUShrNAU5yoG+Xf06NSQ7Or3ko/HrWcG2YuNGHBPNN0U5K?=
 =?us-ascii?Q?LREbqpAaOfh8KCFN7dzvkgxUzDNhg9oXdbh78IPMi/8aEJO3evk16o/dfUiB?=
 =?us-ascii?Q?eMyH4vCd4/oUof9Kyiu1MoObItLArOgALZtk2Nx3z8xqvY6h32tzJyNWA+sF?=
 =?us-ascii?Q?LGvYy6lL9IqDJ9qJJNvUs1LvwkvhvveAO1RtDaZCYz8JH33LnvdERO3nkKA5?=
 =?us-ascii?Q?vBNmSxTiLarC7yJ66S1xGuC6PVvxha/zwass3xIGc2EtVuaJtA1HRWTzOhZZ?=
 =?us-ascii?Q?HCgUsvlFxYxgceT8EHKqDnW14o5od8CNgGVTIy9PHfws3x5IxNCqECGD64V4?=
 =?us-ascii?Q?xBU6x70WZvjsFLWX9y3JX5d8UvI+lFsibaLgVGPktekvZhlZZzl7oXKdYNWo?=
 =?us-ascii?Q?2UDaG+Qw+o6d7Lql8sgBjn99ncBC/o5bTwScvmgpUaHMAV6I/3bQ+1mEi8to?=
 =?us-ascii?Q?P1k3/HwNGYmQZVZ97V1xhbdAU6P5HMtaE1O85BRE1tRTBHswiJFqr0zJuAO8?=
 =?us-ascii?Q?ARnXG/XWlUnl97C2qQxyq+aOEsxGXyw5U+tLUc4dNTkvxsC2ToZLPR1X+fy8?=
 =?us-ascii?Q?w/n8BMfn/JnryX7JKYlCZVO7j+UHGhBdbEjiQdy39adMxHnmwmEbNvEHlcq6?=
 =?us-ascii?Q?xLpbx6jm/0ZuXMVvgnVQkUm+JTvg/orj2VLo04RQD//NA/VmjSPhkEspAbNn?=
 =?us-ascii?Q?kTg5cp9fC+X3W5DyK331XNOWKKuCB5PPSaqDIoFXb+1sV7ljNw0FvslZ+mRc?=
 =?us-ascii?Q?+SUIYJHJSdI4F+xlswYlaT+/FqfgBXrxT1FSTwSOEqPy/5cUEeCnjMs92doM?=
 =?us-ascii?Q?Sz51e6qhLLeK7zwM6h6osbnpa7TdjaRXRhMR7WN/xWXpzGUspalIAU+JHRzD?=
 =?us-ascii?Q?SgIDj6jUedltxIV7NmZ5Zs0UVkwgs69orravp1X5AxqfJRR6UKPnaOEI3uI0?=
 =?us-ascii?Q?xZiNdzCvkRpr6ndB3vrkkQYgw1oPN6aYO2U2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 18:53:46.7200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4000d5-3875-45d7-996e-08dda2cff891
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7368

If device is coherent or if DMA (direct memory access) is translated by
an IOMMU then program USB2.0 IP to route transactions through the CCI for
coherency even if the target of transaction is in low power domain (LPD).

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 4ca7f6240d07..00e613c4d8c0 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -32,6 +32,9 @@
 #define XLNX_USB_TRAFFIC_ROUTE_CONFIG		0x005C
 #define XLNX_USB_TRAFFIC_ROUTE_FPD		0x1
 
+/* USB 2.0 IP Register */
+#define XLNX_USB2_TRAFFIC_ROUTE_CONFIG		0x0044
+
 #define XLNX_USB_FPD_PIPE_CLK			0x7c
 #define PIPE_CLK_DESELECT			1
 #define PIPE_CLK_SELECT				0
@@ -66,6 +69,23 @@ static void dwc3_xlnx_mask_phy_rst(struct dwc3_xlnx *priv_data, bool mask)
 	writel(reg, priv_data->regs + XLNX_USB_PHY_RST_EN);
 }
 
+static void dwc3_xlnx_set_coherency(struct dwc3_xlnx *priv_data, u32 coherency_offset)
+{
+	struct device		*dev = priv_data->dev;
+	u32			reg;
+
+	/*
+	 * This routes the USB DMA traffic to go through FPD path instead
+	 * of reaching DDR directly. This traffic routing is needed to
+	 * make SMMU and CCI work with USB DMA.
+	 */
+	if (of_dma_is_coherent(dev->of_node) || device_iommu_mapped(dev)) {
+		reg = readl(priv_data->regs + coherency_offset);
+		reg |= XLNX_USB_TRAFFIC_ROUTE_FPD;
+		writel(reg, priv_data->regs + coherency_offset);
+	}
+}
+
 static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
 {
 	struct device		*dev = priv_data->dev;
@@ -92,6 +112,7 @@ static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
 	}
 
 	dwc3_xlnx_mask_phy_rst(priv_data, true);
+	dwc3_xlnx_set_coherency(priv_data, XLNX_USB2_TRAFFIC_ROUTE_CONFIG);
 
 	return 0;
 }
@@ -102,7 +123,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	struct reset_control	*crst, *hibrst, *apbrst;
 	struct gpio_desc	*reset_gpio;
 	int			ret = 0;
-	u32			reg;
 
 	priv_data->usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
 	if (IS_ERR(priv_data->usb3_phy)) {
@@ -219,17 +239,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		usleep_range(5000, 10000);
 	}
 
-	/*
-	 * This routes the USB DMA traffic to go through FPD path instead
-	 * of reaching DDR directly. This traffic routing is needed to
-	 * make SMMU and CCI work with USB DMA.
-	 */
-	if (of_dma_is_coherent(dev->of_node) || device_iommu_mapped(dev)) {
-		reg = readl(priv_data->regs + XLNX_USB_TRAFFIC_ROUTE_CONFIG);
-		reg |= XLNX_USB_TRAFFIC_ROUTE_FPD;
-		writel(reg, priv_data->regs + XLNX_USB_TRAFFIC_ROUTE_CONFIG);
-	}
-
+	dwc3_xlnx_set_coherency(priv_data, XLNX_USB_TRAFFIC_ROUTE_CONFIG);
 err:
 	return ret;
 }

base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
-- 
2.34.1

