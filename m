Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F41A1898FB;
	Thu, 30 Jan 2025 19:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738266577; cv=fail; b=b+NG/tjr86AqaS6u7XQ9bTQUq+YmDaUBWPp1+1WsMT2NUwWVSB6zlfMu8vghRL2hGDcnrFNWopS26AW5FaCSi1hoMF44p7Ea2PYUaVobgeyUp/3LeJobR/HGdEfKtfxPmLP3qbWmzhjeC3IrU3OAkRxSDlHInng72JD3wieT2xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738266577; c=relaxed/simple;
	bh=W0dqkEnc0TRexxPaQoP6GeBcIUjTUTEvkbs01xpIuMY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=thamWCN6WlNn686Ey4rEaX9FQ5CQTp/3cP5ReRXwJ/q5Va/SR9G6crKH9562YgRp1oC50iAU0hX3vfjjbIkNkFIN91mTWVrozFsuFnkfKhzLkSkQBqTJ4Gb3h/5QFnk+f0gpYGRVqKB/eazXUmVSj8a70R/+t1+2OcYMwrRJj6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AsUK9YYh; arc=fail smtp.client-ip=40.107.92.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AsUK9YYh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzo13yvS9p/Y6cm6KyGteS3nFkKqDEqkBZ1n5sQx2zUFM/wRdFq/Da2OhYEy7mV7OiMJQYRSm71hCkFTrF9fTx63DOoCRRLN99xN8EwrA9BF2HDk4VUD5rBdloXm9+z6sKCnYmrQtq+F6pX/6qPBCcYq/yqrRrJTegK1WK5NFpp2JnKlxFCM6ONAOXDmUovtnZ1I6HQL0P1hTEnYTrCwoaLmghKWzhfL9YOQTaAEC/P3iegrage7WyChfUwzQKWSritPEpfXRxpcBDyRcLP23C5N8fzamszQmHTosBWXeOFEunZ8pRUjZzz69t8lWEBR929kjsvl62EKi2LwJGRSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97dlXtaRVI3Rui1U9HH5zYCKQX7e15xtdEXV8C9mbQg=;
 b=HQRglvTNHr392nhc3qX2jJQWltHTWB8EPMJ2IYpKNkzT3Ej2iZ3cdUaK7v9NUoevXIjdIFyxQiTfFesbIDeidYw7RAyQZaGyET+6N9ku0n00Cobk1RfFTPg30bP/LbfWxEIywERv02p5H5P1x+92mk0EqEoL85JvjFVL97Fj0miQvkeZqRy/yvWL+VFJF/5yjCELalLjgg7uXmXhZrHvrrB/5qZ3dsfamc9CHyczFtpNpm+HqJlDuse/pHE4LZgFqbXx1O459pe4eS1GM0sRgodAiEmzP1i1kHerg7ADtpWJr26YQ8WWYvkUxwl/1KCY/6i3mQv/IlrUPcl/bZt91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97dlXtaRVI3Rui1U9HH5zYCKQX7e15xtdEXV8C9mbQg=;
 b=AsUK9YYhxdJ1tCbuMJs/n7upIoknKwxiOSjYnp5jJOmg1EycctR3B6/7gU+KB3/Wyxu0hD9TtUdx29dPV63S4ci6xKbqSOfsLNnrLe87roM9j40z1oCkPFHSAjHAFjLxG8G+uQkFyBq32f57e0h3aWaxObVjEvc5bKMRH/4pUwM=
Received: from BN6PR17CA0047.namprd17.prod.outlook.com (2603:10b6:405:75::36)
 by PH7PR12MB6419.namprd12.prod.outlook.com (2603:10b6:510:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 19:49:29 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:405:75:cafe::64) by BN6PR17CA0047.outlook.office365.com
 (2603:10b6:405:75::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Thu,
 30 Jan 2025 19:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 19:49:29 +0000
Received: from [127.0.1.1] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:49:28 -0600
From: Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v4 0/3] AMD NB and SMN rework
Date: Thu, 30 Jan 2025 19:48:54 +0000
Message-ID: <20250130-wip-x86-amd-nb-cleanup-v4-0-b5cc997e471b@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbXm2cC/3WOzQ6CMBCEX8X07OJ2C4V48j2MhwKLNJFCWsQfw
 rtbSPTm8Uvmm5lZBPaWgzjuZuF5ssH2LkK634mqNe7KYOvIgpBSSajhYQd4FhpMV4Mrobqxcfc
 BtCoUl3VT1JSJKA+eG/vcis+XyKUJDKU3rmrXutEOh86Ekf0abm0Ye//aTky0Kr89qSVJTKRWO
 UqQ8DJvdsk1XnOmO8UTSdV3Yl2Y1FfMUGJOREWaJ0ohpgr/m8uyfAAJ0iGmBQEAAA==
X-Change-ID: 20241206-wip-x86-amd-nb-cleanup-6383ebdf8d25
To: <x86@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>, Suma Hegde <Suma.Hegde@amd.com>, "Naveen
 Krishna Chatradhi" <naveenkrishna.chatradhi@amd.com>, Carlos Bilbao
	<carlos.bilbao.osdev@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>
X-Mailer: b4 0.15-dev-d23a9
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|PH7PR12MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f32c3e4-1481-4586-3cd7-08dd416735a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGZoVlg1UkF3TERnQlF4akVLTytYZWJXS2h6MUM5Y0EwV3RwVy8za1hEcFpV?=
 =?utf-8?B?dzZFT0pRQVMxd0dFOVF6MFU0aS81bXVadlg5R2t1aEsxckRDTk42ekNhcGlS?=
 =?utf-8?B?Rlp0S1pKMkp0ME4yY0NtVTFraStIQjlOVWNOQUN0VE5TcHY5Tjk4L2xLTWRW?=
 =?utf-8?B?bXRCcXltT0RBUEdzTDhzNjFaREIrTDRVL2lsVllGd2JYQlhYT1RQUGJZOGJS?=
 =?utf-8?B?Y2RZazlDU0dJL2I4K2ZMK0VWRHFUYjZ5eU5ibGU1anM4cVcwNExDMVIvMDRV?=
 =?utf-8?B?MHlzZzJpc2QrcGlYSXFzWHFsOW1sVHMzZnREaGwzR2I5ZnNvK1lqVitsL0VP?=
 =?utf-8?B?VlNjeUxudDZCdEJCU1ZuWWFaazdMcGI1cm9QODh5WlhYSGNaS25EUzlOT0F5?=
 =?utf-8?B?VGFMWGQyYlAxaWN0L3c0dGYydTFCYTJNZXkzS0d5MTZySGM2Sm1wWmtBVVdU?=
 =?utf-8?B?dmhXT1J3YXVadFdOV1YrcnVkZ3BBV2tVUUY1cXVyS1lycEt5aVk3SVNzNlBm?=
 =?utf-8?B?SERGcFJYbWNoNTNFL2E3K2kycXJsTXB4SkxnanJUeEN5TGVpSWlDd29vVFkw?=
 =?utf-8?B?R1lMcmFNL0pCQU5WY2oyelJSSSt0OXR2RlRTN0tnM2YybE1PbU5FZUxzWU5n?=
 =?utf-8?B?UUQ5RHRDUFV5SFhRWmpWU0RESWpuWit2SWNNSFpJa0U3UXBKTVZZV0kyeXBi?=
 =?utf-8?B?SXJSbDNpVSsvbnh3V0szVHgxcEFVNzlPcGtqL0J1YVJxRkNBYzBjcFJ5YmdP?=
 =?utf-8?B?bjZOdjJUc3FrRW1mdUs5bk12YW5FUVNHamwrOEQvS1ZGaWMzVTlzSGJ4Q1hN?=
 =?utf-8?B?Yk8xTFZVOXFoZ1FwWnRYeFBSZVNsZFE5a3Y4c3VqYWNqWjk3aTU4U2l3eE1L?=
 =?utf-8?B?TmJXbFRWYjFtUDFndE42V05oUUVBTkhSeGlpanBNcE1MWDhGQ2ZCODlZUkhZ?=
 =?utf-8?B?ZC91c1dWU3dhSFRtS2RRb2IzREZXL3NpV1IzMzlsUTlBblRCcDBjaEFrMXBY?=
 =?utf-8?B?VmxMKzArc2VvMXRnTUFreHRaL0VvSFNwcHNaZm1KOGxUY0FSblZWUk1wRlM5?=
 =?utf-8?B?RXRFZUkwRWZoeUMzblZaQVlvWDc3R2VKSnczeUI0aGpVZUJhNTVhMy9NRUU5?=
 =?utf-8?B?bnNGVUp0cllGWXN4dmVFZHh6VG44UWdraGVJOHlDdU1vMWhjOHZSbVNyMFJJ?=
 =?utf-8?B?aGtxVlgrWjBQZUJBTEcxR1ArNXh0dkJHNTR4NDFNL0lsb1VRUVdHakJzQ1NJ?=
 =?utf-8?B?bGxpVy9kRzVqa0FyZjBCYm40anJUb2JseUV4WjVSSUdhcnAvV1d5ZUIxeTNT?=
 =?utf-8?B?cVNKczlNUTB3RjR3bTBBeGVqZklCYjhsbnZBRXl2QUxxdlhrS0NiekwwOHpQ?=
 =?utf-8?B?MkpjL2txcGIrRXFjdmZ1TnFLeEt2WUVHOWFONktSQ3QwMzlZSnZlcmkraFBY?=
 =?utf-8?B?VzB1QmRGZk16YW5OWkhURFNJQnNSemtLdWxsQkh6SGhQMHYreUp2RTdaVCt2?=
 =?utf-8?B?M1UxNWw2MVkrMW1paGJnMTlQblBNcVJtakZxY1Z1VXFsWUZjbVljZS8rNGVz?=
 =?utf-8?B?ajRZbVJmcG1TNnB2Q2JrTkJYN2J4WVViTUV4cjE4OVBTWE5VaHVYUElqRnVt?=
 =?utf-8?B?ZDF3bVg0OWI1M2JSOXVqZVM5Z1VUazYyMDFOZGU4WEU1Sm9FTE9CUkZwME5y?=
 =?utf-8?B?Z3hrdTh3TVZkbXNPbmlVS1M4WkRaWUdjQmdOQ2k3b3RLMTFTNzZXOEpNb21U?=
 =?utf-8?B?ZHpINHcyVHhYV0VldTVhNE5XVFE2VnhMNUo3Z3FQWE12d1J5SitiV3pqQjBk?=
 =?utf-8?B?V09xT1J3akI5L2tCSEJNcEU3UXRhTGFsQlFiNlhnK0l6UXowWnNaU3IzcHpG?=
 =?utf-8?B?Zk54OVdaS3YyTWdIWngyeXFlcW03cDJHT0l4U3QrU0J1YnVPaldUYXVGcFpV?=
 =?utf-8?Q?xDzFz3V0bHGa5bT7kFc76r9lIEZeez7o?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 19:49:29.3417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f32c3e4-1481-4586-3cd7-08dd416735a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6419

Hi all,

This revision includes the remaining patches not yet accepted.

The only major change is to fix a build issue for an exported function.

Thanks,
Yazen

---
Changes in v4:
- Includes patches left out of v3. 
- Fix build issue for amd_smn_hsmp_rdwr(). Used Suma's suggestion.
- Link to v3: https://lore.kernel.org/r/20250107222847.3300430-1-yazen.ghannam@amd.com

Changes in v3:
- Based on public branch from Boris. 
- Add check for not finding any 'misc' devices during init. 
- Link to v2: https://lore.kernel.org/r/20241206161210.163701-1-yazen.ghannam@amd.com

Changes in v2:
- Rebase HSMP changes on latest upstream rework.
- Keep Node and SMN code together.
- Link to v1: https://lore.kernel.org/r/20241023172150.659002-1-yazen.ghannam@amd.com

---
Mario Limonciello (2):
      x86/amd_node: Add SMN offsets to exclusive region access
      x86/amd_node: Add support for debugfs access to SMN registers

Yazen Ghannam (1):
      x86/amd_node, platform/x86/amd/hsmp: Have HSMP use SMN through AMD_NODE

 arch/x86/include/asm/amd_nb.h         |   1 -
 arch/x86/include/asm/amd_node.h       |  13 +++
 arch/x86/kernel/amd_nb.c              |   1 -
 arch/x86/kernel/amd_node.c            | 149 ++++++++++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/Kconfig |   2 +-
 drivers/platform/x86/amd/hsmp/acpi.c  |   7 +-
 drivers/platform/x86/amd/hsmp/hsmp.c  |   1 -
 drivers/platform/x86/amd/hsmp/hsmp.h  |   3 -
 drivers/platform/x86/amd/hsmp/plat.c  |  36 +++-----
 9 files changed, 179 insertions(+), 34 deletions(-)
---
base-commit: 25cb07b28aa8f42f3123a7b0bd09ea1d9a24fa28
change-id: 20241206-wip-x86-amd-nb-cleanup-6383ebdf8d25

