Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3CC1E0DCA;
	Mon, 10 Feb 2025 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187401; cv=fail; b=jSEX+xPhANBC43i6dRqdjvW+aYiJqvViOQ/wqL3tx0XJvQua5jPBdU2iJdkm2UtkD1nYQjUlwgYpeeq7SOqytFEWG0XQpVVstIR/FUyUh7MC+68ZKdnC58TGU+k/gTkRmvU2hcETHGXA48HBjpUCYrJXkH5DSBJMxGQCZhvU0Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187401; c=relaxed/simple;
	bh=gFGqXHxwsC0+PWSy//fIrjvVkWpvGIY3aIc4o7Pyim0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOvlVTR6/dzgCay1AkCPysUPIf7UueYoIG+wIGLJ0v/eRJD485kEGhAaJT9ghX8FTJV/BORcIztUxvoqnczUuPS1WlVllOhoLI7LingHXrgahgupaR99nPESHDIjISya9TAoMb5HJ6VUaAApLJqAMSNXPp5VmVWtyCigFE0YaMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UQLcDVm9; arc=fail smtp.client-ip=40.107.102.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UQLcDVm9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pit0fpz0PlWb0kL9qmwGCFIHDopUWeshTjU/C6Op9sg1A/Xa1QAeMZIDNLIIvc+ZRad85rTqLwsDyZH0SBzhysCBQkX3aYHE3AZnC5ZTwdchFOu0lW+yvgvpB24gQp9FR7SpOXuFOvXC/9WPjgXx949cANReOBNYyge6mvsByeFOMxlhdEVbFFWvCDjJP1RTfksJiJ9jBZ+VbIsgmcMi39q5L9vKp6Eq3J5HCnv9jh832bGoHnrpWhegK1YYnn/icm2tpASxysdBuK4zQlRAavrNtM6tsmw3qG9wOPUet+HRaQaM3k4M7gBSuxhv61aV0DRWH9+MSwvK3f7sbJC+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPXFuQLXP5o9LljXT9gOjIOd3ugazJJUoGLuNZmQnCM=;
 b=O8mgz5okogDE992s+Lj+JOA9vfksr7k0/HdFIiRnI6ZeW9KeZX59YDBc6DAh5oWqWf7QciRI5/yHBUZGcAFNXGtvzNG5Vr/f/gY5JVEAoG0JIA6hYtU3H0W8Lh1EorZuATmteUeRQbhPX8ajQ21VnD7OCDaLEVLNn73ySGAO4+c5cTLqtak64XEQ1mAz+YES9fy2YFxmd1eikZBnxGMvMoFp5W3YxIt4l0kKaxJFNgiaBRlg6gvWNql7dDH4qqJqvjS3xxsG/wsjRkDbWhUtH5h8Zo+VgkLHkTOUznMlIntIU/Q75p7pz0qQEy+ygQxa9uUR7ZVyGx0n54Ru37Y4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPXFuQLXP5o9LljXT9gOjIOd3ugazJJUoGLuNZmQnCM=;
 b=UQLcDVm9X4GnLC+lOEtqgjpko3GVMOZNOXK75FAxje+lrJV4n3E8UNNYMIBFSu5rlpILJatktpulgD8WogtTgH8+CLgyAcLMsHrsSiQXs7nLwepbdVKVT564UUFf3Z98r3uzVaZ+RrjQSlkx2Y2x0m2mSVO2hEX3h5bty8idxDA=
Received: from BY3PR10CA0026.namprd10.prod.outlook.com (2603:10b6:a03:255::31)
 by MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:36:35 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:255:cafe::d2) by BY3PR10CA0026.outlook.office365.com
 (2603:10b6:a03:255::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Mon,
 10 Feb 2025 11:36:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.0 via Frontend Transport; Mon, 10 Feb 2025 11:36:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 05:36:34 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 10 Feb 2025 05:36:34 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Rohit Visavalia" <rohit.visavalia@amd.com>
Subject: [PATCH v3 2/2] clk: xilinx: vcu: Update vcu init/reset sequence
Date: Mon, 10 Feb 2025 03:36:14 -0800
Message-ID: <20250210113614.4149050-3-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210113614.4149050-1-rohit.visavalia@amd.com>
References: <20250210113614.4149050-1-rohit.visavalia@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: rohit.visavalia@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|MW4PR12MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b6c366a-7d34-4e37-a438-08dd49c72ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EAA36S9r7af2BKe2nruqq++bOeF02M+JU9jLAOu1WAjo2ohn+taVuqUSJ9kG?=
 =?us-ascii?Q?Yd+zzCVHgGw+60Es6LN2x7pBd3tcPSjI5k1zoYunNGxANhW5VYs47pSLjiCN?=
 =?us-ascii?Q?FfFrc7v1f6l0oK3Z/6wE1yaYq8/CMiy7+StlH4jidG1MIS47I8aV4SZNT6Ro?=
 =?us-ascii?Q?Vd7RqmsZTbtBUoVacOmX23LgtW2uTwv8HhmGUwdzljfTMRPRPbQ37XDX3V4y?=
 =?us-ascii?Q?4VQdi3WjBFVEQj0oxmIs57GAFkPnMc/G5n4PKFWDfeEbXzmGAANs2mKuw/h2?=
 =?us-ascii?Q?1BvfMWMSMVBgZoiCw2TS+veGqXysfUl4z0u2i3p1cBQ1HYq0Y5IjQqrxMcxA?=
 =?us-ascii?Q?RPT2ur3D41fJB1GtBY3p6cntTbccykHMHAdPMdYd6nfVcSg9Q/DoWMOwZYAZ?=
 =?us-ascii?Q?LPlMHiglAM5kGP6yhTI0eEL7N/w5rBfOp5OQOytIX+l7jNQvTXYjKGOuNBU6?=
 =?us-ascii?Q?IXaHWqJ8pO/1NglxEfd4E2Ek1Zz1YBCRZQ7xR9t2Ja0hCfhl1HIZ5+7B4p4c?=
 =?us-ascii?Q?BiHomS74yDmE7i9xWvCeZxk4pjMB/aixa0WUrRX4FZkeVM4Q4azPB9jvLG/k?=
 =?us-ascii?Q?3BoyK8xIG6zJHyI+zhuQCl7B0CFHQNjE1OFm5iUSu7Fg0ziWIuVFgzfiPVGW?=
 =?us-ascii?Q?iEkGVjHgb9UFaMnSc35wxGP7fA7SzADgQVaCc9cl+kMYahmHSWmrr/C0q1eh?=
 =?us-ascii?Q?RzFy8O8fBBzGl6DnJvQlEzysAu+4YwhrTvKvBT0ALxbLefHe8dOGDz4iGfQx?=
 =?us-ascii?Q?hyGFXrPsuQSuYUaffoM2qbnd9SY7C6Qdcv1M8ql7aUHJ1+X6qa2aOxZ5tIT6?=
 =?us-ascii?Q?ak71yiaJsskJr1ncvcRImuiZck7YcvxcUxgL2HMY3UOhCVfgHM94apELkFR/?=
 =?us-ascii?Q?NGKTsZchxkz2lxPA37h1DvHRAIDkeoRTgHDGV7PKrctga3fR3aoLdm4pJh54?=
 =?us-ascii?Q?FPjjJYnGTXcYBDcI4ULmJnv1EwvXJv638Enm2vD4CgY4V4YjesxGAu+g8Q+K?=
 =?us-ascii?Q?Kv8ho4XwsE4BmtIq76cwlrvMnRPvNqT3d5rWm3J3gEltK6Rys8xZsiS5Du6s?=
 =?us-ascii?Q?beRUoDFMOqRMjnDlHc7BlgolIg7fr6UGGCaN/Qg3srLXQCWtrIUklfG/bEO2?=
 =?us-ascii?Q?AEFPJFBHmQGJ7whW7DwJtva7mfdUG2ckdDlBL1NgdzzEg9zjXueZ13ji25jp?=
 =?us-ascii?Q?ynhqo6J6xeCLOLbYK8AAaTgHvNeANcPPzMr9n3jQlVYCvrHSYk39+VGIJg1G?=
 =?us-ascii?Q?mA4XVlStkxs2lDwdmceHIBR90n1unsjttOy27yLTvm/LrYiHf9XHrZdKtyE+?=
 =?us-ascii?Q?eYqJ5LybaMwBI33W+RJoKf5ZZMgEETiXhqJERNycABQk1SjP0OR1SYt9/Kwe?=
 =?us-ascii?Q?p/S86UxpzIfL2pGLo3romhyGit/6NfkYuDrmCWagoa4UEV24KvaerY7c3lGw?=
 =?us-ascii?Q?Tyt5IFu8rfrlUWr3k6ip8Btx71sydZXbq5UZqJv0L1oMdwK2VO2RSpym9IDX?=
 =?us-ascii?Q?F8UUqmVQaj4cQ48=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 11:36:35.5351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6c366a-7d34-4e37-a438-08dd49c72ce3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120

Updated vcu init/reset sequence as per design changes.
If VCU reset GPIO is available then do assert and de-assert it before
enabling/disabling gasket isolation.
This GPIO is added because gasket isolation will be removed during startup
that requires access to SLCR register space. Post startup, the ownership of
the register interface lies with logiCORE IP.

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
 drivers/clk/xilinx/xlnx_vcu.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index 88b3fd8250c2..1ded67bee06c 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -11,6 +11,7 @@
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/errno.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/xlnx-vcu.h>
@@ -51,6 +52,7 @@
  * @dev: Platform device
  * @pll_ref: pll ref clock source
  * @aclk: axi clock source
+ * @reset_gpio: vcu reset gpio
  * @logicore_reg_ba: logicore reg base address
  * @vcu_slcr_ba: vcu_slcr Register base address
  * @pll: handle for the VCU PLL
@@ -61,6 +63,7 @@ struct xvcu_device {
 	struct device *dev;
 	struct clk *pll_ref;
 	struct clk *aclk;
+	struct gpio_desc *reset_gpio;
 	struct regmap *logicore_reg_ba;
 	void __iomem *vcu_slcr_ba;
 	struct clk_hw *pll;
@@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *pdev)
 	 * Bit 0 : Gasket isolation
 	 * Bit 1 : put VCU out of reset
 	 */
+	xvcu->reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(xvcu->reset_gpio)) {
+		ret = PTR_ERR(xvcu->reset_gpio);
+		dev_err_probe(&pdev->dev, ret, "failed to get reset gpio for vcu.\n");
+		goto error_get_gpio;
+	}
+
+	if (xvcu->reset_gpio) {
+		gpiod_set_value(xvcu->reset_gpio, 0);
+		/* min 2 clock cycle of vcu pll_ref, slowest freq is 33.33KHz */
+		usleep_range(60, 120);
+		gpiod_set_value(xvcu->reset_gpio, 1);
+		usleep_range(60, 120);
+	} else {
+		dev_dbg(&pdev->dev, "No reset gpio info found in dts for VCU. This may result in incorrect functionality if VCU isolation is removed after initialization in designs where the VCU reset is driven by gpio.\n");
+	}
+
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, VCU_GASKET_VALUE);
 
 	ret = xvcu_register_clock_provider(xvcu);
@@ -690,6 +711,7 @@ static int xvcu_probe(struct platform_device *pdev)
 
 error_clk_provider:
 	xvcu_unregister_clock_provider(xvcu);
+error_get_gpio:
 	clk_disable_unprepare(xvcu->aclk);
 	return ret;
 }
@@ -711,6 +733,13 @@ static void xvcu_remove(struct platform_device *pdev)
 	xvcu_unregister_clock_provider(xvcu);
 
 	/* Add the Gasket isolation and put the VCU in reset. */
+	if (xvcu->reset_gpio) {
+		gpiod_set_value(xvcu->reset_gpio, 0);
+		/* min 2 clock cycle of vcu pll_ref, slowest freq is 33.33KHz */
+		usleep_range(60, 120);
+		gpiod_set_value(xvcu->reset_gpio, 1);
+		usleep_range(60, 120);
+	}
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
 
 	clk_disable_unprepare(xvcu->aclk);
-- 
2.25.1

