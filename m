Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E8B1E1C36;
	Mon, 10 Feb 2025 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187393; cv=fail; b=PqNzBmyO3IjtnNlbO2xjEnq/3ky1i3+anBLyUtVR/aFVt3LDXGGZfN5SV1NpYEPCe0CT4xAeGwlMaPhPafKL9X9Js6creTi14asCy/RYCQFCbFkhhKogtyJbCnjQ7+kKIJwuRUCk1pXLoWFk+f6IXTTjsdXFxumVPVUHFYrhH6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187393; c=relaxed/simple;
	bh=K+SiG10T6wD6XUemfLff0fmhLWjXxOrHFiwAhi7usFs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cwnx0h2c9ZPvbxxVGbj7UU9pAkG6kpXumlnX+5/8Z/4LU5j1hJjnZhdj9GZl53cWR300i0UShHf4QBPe/baA5BIywEfbI+1CZ8N4fjmd+qvhtl/B8zIBVx4DixQWcgQbvxhO/wo3gYDFCbsdy6bXn8oLXmb/V0UcjRRlwkRkFLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BP2fWeUy; arc=fail smtp.client-ip=40.107.244.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BP2fWeUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpVgSgGAtwk+IgMzFH02P2iAncwa+mDTv6BxtLJxHZqKTz9auZbqG4SIcYsIxG9TGLpYA2Sso590yFJ246vAO8b5dCTpn+lCINSqrUy8c15FFNi6OdWNPQeoPjCmH4HUk5c8sWmQR4jWQ7A9N1wjJYX/rcqlgqv9oFVGSQwx4h3ybEjt2ZOCl2bYm5/qgHi+hthoh4MWekjGRUj3F8W4eXXFFgjn8HEHwigQKRZoGpXazwdJSheLThQlUogc+ZMELkbnOYa3Dpy1+PlHOtheZpQqBeXdmvIvZhfPRrtTN7ncVy4I1zwZVxsUpYDESYf1HHHIlncjZ1WRrNlx2AuE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=is7kyDmhG8OE9uK7LRQsTFEmY3Sd07kK1SIk131CIOU=;
 b=b9aADNlKv3L7naIItY1KR+xCjtT5oHHUXC8BP9kjkmnXJeePuKCz3L44vndEIMkQffxStSXwERJOq7J1CfarYY1asxhx3BAVVyKi1BoFAqOICD1T5CeG//3mpqgDfjN1cRTTrdZvM1DAPKeIDyCFyn2TWuLFMUZZPaWEC9UvG6EqTAQBTCuvyjldfccqGIrywTHaMqu3VXtrskEAanAftCdjhmwVIl+Y6DCRrxT63mry6RTnQR8Jx+8tl/evqqQ6kWhKW+yx2oL9rRHICOm+d6KutKcdE3GFYwvNDG197FRljhy7BbELER+F4s7gLSO2P+bNmuNmoxdsUts+ZRXv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=is7kyDmhG8OE9uK7LRQsTFEmY3Sd07kK1SIk131CIOU=;
 b=BP2fWeUyOQPJKZLbpCRjzqj4gufJTjx9+OzyGqeeicJ2MUD1SuYfoWGsguNTcwFUjqjlRXjZTdreQSc4WgY5wi3e3ID24X8EqgPNKyTl5QCd+qSprL2Eo1R8rmbgUxVjt8p0lgniRNt4IJfAyfyIQHfcN0Zl0+PVNUIzKa8oCjo=
Received: from PH8PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:2cf::16)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:36:28 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:510:2cf:cafe::55) by PH8PR07CA0030.outlook.office365.com
 (2603:10b6:510:2cf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Mon,
 10 Feb 2025 11:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.0 via Frontend Transport; Mon, 10 Feb 2025 11:36:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 05:36:26 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 10 Feb 2025 05:36:25 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Rohit Visavalia" <rohit.visavalia@amd.com>
Subject: [PATCH v3 0/2] clk: xilinx: vcu: Sequence update and call trace fix
Date: Mon, 10 Feb 2025 03:36:12 -0800
Message-ID: <20250210113614.4149050-1-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|MN0PR12MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 528ff55e-dab1-4274-8106-08dd49c72812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?epWFZFKbutPxmGElsz35O+v16MR/xUJ1m+uq6mrW9onXz1ZX6JlkCbOapn1P?=
 =?us-ascii?Q?DbV42Ussx9OXyHgBg8Ssv91HEpqaqoxyWedKKpqMThR3yRVAEuRmTyu4YkyD?=
 =?us-ascii?Q?L5uvMIRNY1OqQOCxbcGXab31aoU11CrF5QD4QtDEgFtnx3vEwHtXl44mCs2X?=
 =?us-ascii?Q?7iJbOuvPsRveOqaAgPkUjEXOB34CZRI7aHeVLzMFN4qlEeRAjJF7aNJVAlCp?=
 =?us-ascii?Q?5tvfUfRE2I6SQ+oIpDOD42HYDslaft6am1k/+EAeJRWSNh5si1T9SQU5W0PP?=
 =?us-ascii?Q?Vv5OQsJBQNqn5+0yus+NnRBKM+lEq1TFyNoa8X78LS06S6o3WDoS+8zUjpDC?=
 =?us-ascii?Q?5LG6hZ6eyej+p/Fi9jX3KSmEuIyxZpYHIjrPhzGk6QIcoBgFJzo3DAySI5aZ?=
 =?us-ascii?Q?tnO+Z4zMPTQnbTEBZucRgocYkJXdp0mghyHYcHoWWmdjshPiV4tb9C6vGkdX?=
 =?us-ascii?Q?OpqAI+LC6VQ8kHFupl2NlD7I5jNjHP/Jt3k4+z4lKvmCDsZo3AXmhH32Go1P?=
 =?us-ascii?Q?QRBL8qJjC38BXh10pRsdy4JXPizA/NnuyCFa9Z0TxYm1sYlDqFVpQdIYbyOf?=
 =?us-ascii?Q?GVn225yuvczKeiYQS0CfTJEVWGfreIru7LBKwI8LZEg5mXSqjitOCT0hdAF1?=
 =?us-ascii?Q?8is/jw7SNNvIkNMjkEmIykG+ml/uanIbjHk3Erjy0SXLhB4ya/9R2a7yk3ie?=
 =?us-ascii?Q?9JfAKelhRLunu4WsYhC6N3KSdF8EKegKZ3e12RuqG/VzB+Vg8+siDGXHLQBk?=
 =?us-ascii?Q?C4fgvJkBMCFT6NszNMjq9td8pw56HvSawL2qEN/GlydjrAO+7qfo9U9xFRLj?=
 =?us-ascii?Q?ygWGYuYgjHCUyldLq9FBZHb9nHQyEf0WihxA/gwTeXr4wIAA+ZF8oU5YWR5H?=
 =?us-ascii?Q?gjDG7y8L7lofR83jeU8J+FL4016x+9/NPfYgfSaZ4y1E2GQaxWUw9ge4O6xk?=
 =?us-ascii?Q?vbCd8VvtM4jxDDPIEhHJjz0XdnhMYExozmoWib4zYinHdbkYeNPcX0od84J0?=
 =?us-ascii?Q?gCDkhpP311ezMzWxb0Eotc4JGQLpeyVObx54OQeME7sgbrZDyxM5XOo6YXve?=
 =?us-ascii?Q?pYpHYL8cfQIioKsOKB7RylxsdA1smgdN/07Pph56J+zq3Bb3VXKwhGloctRx?=
 =?us-ascii?Q?KhDiIouLpGdI2HCSxpPgFUFVCh77xgiLgx0GR5OQ/L0pw/sy+n/estdpIUKA?=
 =?us-ascii?Q?5dnrL8Lrm/KUnQ3AARWYVyl2I+qNtmH34cWx0zzqPveldRSbm7Tci1LTZvA1?=
 =?us-ascii?Q?smI/kgWvLtryfE5jKBlSEi7dsDBnRVeiT5z2Ph5L5fCxyWU/vx68L3cAjKii?=
 =?us-ascii?Q?EWhFbHIFcTuSTjcMfA+MEuZb3feAS3x/zz6l8tLHVHdff8uWtFPSGF5qdoJO?=
 =?us-ascii?Q?OoVctCPkg6QdxX7fftdBxt8412zk3jDVIYDpgrAqJQEiHgWh0FgqpDLzVFlV?=
 =?us-ascii?Q?iag8vHWi+fYpPS++3VRDsDTGejQIqYrQM7czgTtMvJ7mtAioW3uN0doSPBDI?=
 =?us-ascii?Q?31HOWsAIj/pD2pM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 11:36:27.4536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 528ff55e-dab1-4274-8106-08dd49c72812
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763

This patch series updates VCU init/reset sequence and does a driver fix.
patch1 fixes call trace related to pll_post clk.
Patch2 adds optional reset-gpio support.

---
Changes in v3:
  - Removed patch https://lore.kernel.org/linux-clk/20250102170359.761670-3-rohit.visavalia@amd.com
    as it is not required with latest xilinx clk driver.
  - Link to v2: https://lore.kernel.org/linux-clk/20250102170359.761670-1-rohit.visavalia@amd.com/

Changes in v2:
  - Changed patches sequence to have patches with "Fixes" as preceding in order
  - Used dev_err_probe()
  - Moved warning to dev_dbg() and updated print with more detail
  - Link to v1: https://lore.kernel.org/linux-clk/20241226122023.3439559-1-rohit.visavalia@amd.com

Rohit Visavalia (2):
  clk: xilinx: vcu: unregister pll_post only if registered correctly
  clk: xilinx: vcu: Update vcu init/reset sequence

 drivers/clk/xilinx/xlnx_vcu.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

-- 
2.25.1

