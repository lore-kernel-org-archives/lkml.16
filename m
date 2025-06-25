Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA73182BC;
	Wed, 25 Jun 2025 05:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750830085; cv=fail; b=D6fsiean7CIXV8r/IAmKcIrVJjePXZvspTezXjcWvg2M4qsou8oITvxXtOiNDsk2e8/GU6onrcm+qBYX73pFfyuhBO94JFvm5niU+MfhF92lsZWm8eNIXesAXATWXFVNaQrQUu3wvEUX28fnksSbOs8fQ/uOv8GbqEjPR/+Y8vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750830085; c=relaxed/simple;
	bh=gRhXejGtgGSQZMbsKNLwRkWsvTnR+Lvg5S7Tt3c/1dw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KnYADPcUOgMjrJrWs2OG27dVAULg+ueI79Z30RnR9zh0HVw4Ey/wy0FomrpuPnoYKPgTBWc0U82WcznTU5ZcWC08lXA4zxp4W2jrNzL0H0R7yw2iq/HHajvCZg8JYcbwOu622YUgAoNsdAGGn5Y53Tgn0+Vv3Qc5EqfQvngVD5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q0f5Qrbi; arc=fail smtp.client-ip=40.107.94.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q0f5Qrbi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8BcTAhH9IcpktZ7zWCL3d/x0rkh4mo+uSv+Az0st91nZWRyICJ/4kpfe5+PZ1DvPixfeXvUeQoukO/HLMqfIZkkfpoUSn6xqg90fmd7o4fBj9M2qPWL71buieRTu4DblUQ5dYKrHETsKNkIMjw9Y4+J80FNFz2I8zUdjd+VT2b36pLTtq4nmuy/+cG4u0qdbJ5ShTebC+s51S2sFl0u/Wk116UuS/m5/RUduE6g6dmEQcrZGbAXeemkiSmYkFQOnyGGgKxBggBMN8UwrF34XhPOq4uC/nTVA9Qbc5aTqFblTzkCa4Q62m+U2hhF8LMZXoZIgCNL669kJYBSlf6l0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovuQIaIxJyWNfQz8v1QNJVEO8IKWWgz7rW1z47T/Ems=;
 b=Qmkc0DRcWOBS7zx+XKkxDtyMzcwl0zAQ9V8vtx8JpBp7xr5PKf2asylpDjLOF63ZEJt7LSDZ8iu3tUMrY+DQgDqc4S4nYswQKn08XobM1bTaBdWymlec7IzZSL1bKn7/reli36bNB0CvhFbf+EckAZPqJZMjov2ocMZG1Gym8yoApK+nWn7wfaS9vZx4o63ahRcYYeDJ2Og5PKDtDcL8xbj0/aCtGRqvB3WlRLrxF0YoGmvrcjBWK2LD9oyvrexnJPkQFEvVf3VpbJ+OA6ZWG3/5rLhhDGnC5YVInsJz5FYowFIHRXg+Bz91TKq+S3+/4TDqpJMbZIxo7v8wdmS4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovuQIaIxJyWNfQz8v1QNJVEO8IKWWgz7rW1z47T/Ems=;
 b=Q0f5QrbivMInZs8YS4B1lSaJuBf29bz3SgZhJlibLvjp9Zi/9rtYGbuueBhVrng1fifRxUOQuk2RZdFQqIHY8naqz4dGGxt7DnfjWg09/H06vA+szLtmVIXMRVqB6AsuBNA8ovZoj4Su9DMsWm/baAJItSy/6BBBBMu6cTqVPgA=
Received: from BL1PR13CA0395.namprd13.prod.outlook.com (2603:10b6:208:2c2::10)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Wed, 25 Jun 2025 05:41:19 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::70) by BL1PR13CA0395.outlook.office365.com
 (2603:10b6:208:2c2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 05:41:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 05:41:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 00:41:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 00:41:17 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 25 Jun 2025 00:41:15 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>
Subject: [PATCH] clk: clocking-wizard: Fix the round rate handling for versal
Date: Wed, 25 Jun 2025 11:11:14 +0530
Message-ID: <20250625054114.28273-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|DM4PR12MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 370b1ab6-45dc-48cf-0468-08ddb3aae8c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ablTemGQxII1IrM4CEiZ48D2cQb1GZviUQzNUi9xGkOFYAOD33LU7rPqUM5I?=
 =?us-ascii?Q?2TyCetZvb4AtGXPKa7cMAjB3dvRywi9Lh3j6q4onoelVn8DrzX6kc8CGsomO?=
 =?us-ascii?Q?TR8E9Wutb/taZau+g1HJdH3oRL/dVjKs9eMzTsncr1c942GJuZj0ouVAMRSg?=
 =?us-ascii?Q?b15bkyTJV06s88taTKHxrCVfEr+I3tQqHnOLU68STHHNmoa0p22vtORNUDsA?=
 =?us-ascii?Q?Ppj3H/RiHoIeMNfLh3eITc6fdS0cvpj/C+iRVrgJlNze7zfGExsma9fTHZXS?=
 =?us-ascii?Q?TSWQcmjBEl8mmUBn5FWuWUw8LEM/Hg65udtqwZpC/qAu7teOaQwmli48qtjT?=
 =?us-ascii?Q?URP3sGnVe/vrA9sn5NiRVFBmbPassg1dMIW0ye0/gn+kuujp7LrB7QcNkE6k?=
 =?us-ascii?Q?M/aCeaB/5ZuBW+azAQ8TmtsrSHSFH4+CQG1AJ3YlG5a8W7ZXH2vumE1VsAEM?=
 =?us-ascii?Q?yX0wyxBsGi1krxpTai15Xd0lm2CaNBDoXXkRyIPNmntpT/47zIbhzBPBi0bT?=
 =?us-ascii?Q?UBHAse1qlGmvOWB9ytPuZiylV3+lgyJCqRFX7XXtJQpnhl5KLtxcegFukc31?=
 =?us-ascii?Q?gSWVmaL5LTdar6kYtWn9Ah4uvApqZYafc7UhDJZ4IAZRa2KXroZol39U3KwF?=
 =?us-ascii?Q?e2Z/OEPf7S+1vGF8ZUA3TEld/1P2f5bNyr5rrQP6PQHEFwzOJUaPVhRvzEZd?=
 =?us-ascii?Q?xZx/YeGyTRfTvf5RJSgZ2Gba2K1aQWttqILBjtwoPPetf/Fg/aVNtmNWyHmi?=
 =?us-ascii?Q?RJ4ywnLUwrUC98ntrpwr0hUJ33LAC+UzRfFs5rFKmaasIyImz57ehQfaLg83?=
 =?us-ascii?Q?y8sm1MkL/wRY2HqTUWwBkpEmBj888JetUpHHVJFFfXUrvdzOub88eYkodG2r?=
 =?us-ascii?Q?/rx9ndfJ8J8wdbp4kKYeseZxNp4fIsmGfhufuZIxrsdnASbFLMjkqV17DT/o?=
 =?us-ascii?Q?uESg82pLV2/8SjhL579o2e+v/x+CVw3pFYxOAiET6x2Zz4dIs7Uiz1Acghcq?=
 =?us-ascii?Q?UGkmaO1WLYkBS95b67M7r0ipTdon2NG9liUOcmkjVpKY4vpraMbhcRBK8kf7?=
 =?us-ascii?Q?6JqA6sE1cZGfft0hOEl7YV71jqaUVltbACPLvTK0frjSsDUPT7YbTJsgkh4M?=
 =?us-ascii?Q?HqWaeps+KF5a7vtxcjPrg2s7SJijINoMEatKbfftxofu6LdVzfI9aQPCzIxX?=
 =?us-ascii?Q?vtpLMGinl27bChsIb4FJ+VQlYizoV/rfav9VNtmNHzyns1m8sJklUsIZi56n?=
 =?us-ascii?Q?dkcndkp4qBtSMLFyQS2tsHkyHGdetztrQR6epJ8l6t7/77AYTv2dHIL5z/ek?=
 =?us-ascii?Q?7JsZmL3v4vy0ED52MaAz8XoEhiw06REuxHFZ07xOs55TNMJ8ov4tVFf6g1YM?=
 =?us-ascii?Q?5JEvZFrzNmqP81rI9ly0wTBRfWtSAdW5o1Nu82DZildBV46cY2z05i8ayMzu?=
 =?us-ascii?Q?mL1GEiMMmcUWvsuoAjHTUIBsIuyJfaiGwwJ87ZrJkmweyyGUmtFlR1IQgzYD?=
 =?us-ascii?Q?WSDRevrW+E2CJlWKzNimSybNzuSWxxJTUOlq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 05:41:18.7166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 370b1ab6-45dc-48cf-0468-08ddb3aae8c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010

Fix the `clk_round_rate` implementation for Versal platforms by calling
the Versal-specific divider calculation helper. The existing code used
the generic divider routine, which results in incorrect round rate.

Fixes: 7681f64e6404 ("clk: clocking-wizard: calculate dividers fractional parts")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 9a35031b0afd..3efce7b88906 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -673,7 +673,7 @@ static long clk_wzrd_ver_round_rate_all(struct clk_hw *hw, unsigned long rate,
 	u32 m, d, o, div, f;
 	int err;
 
-	err = clk_wzrd_get_divisors(hw, rate, *prate);
+	err = clk_wzrd_get_divisors_ver(hw, rate, *prate);
 	if (err)
 		return err;
 
-- 
2.17.1

