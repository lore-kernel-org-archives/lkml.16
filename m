Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2916E17BB21;
	Thu, 30 Jan 2025 19:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738266576; cv=fail; b=LLK0OzG5vva9MxbLGzEt4SC+XSiwnWlyJzuycciBexn7NWuxoS1T1UJX5K8gZxNLbXnkqVe389y5gTNRznh6fjKmNIIz56of37XCZbXi/9jsVASxeNlmDtg7a59rGNytwum2RsTCCo+o6xgJjkQGHMCtxwjEn4VpTTzQdtpfyKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738266576; c=relaxed/simple;
	bh=8HYFoPkQiUVXA6WqByS3WA8PaTDBU5ulGymRGTabOjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YoWdp1eehALRss8WYkZD3G/IY3LkxMiwONOBruSBFpkzbrgc92/dJYWW5azENz9TPWob0jg4K4hn/3dosiWJ0fWzgGbdUDTYbCGKO7T+Vh7KkIEqstym8QweyR2c/yRQy7MGRKdrHdSqRK8goHOa2vkDTH0nh23JwWcelGTAa1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5eanYAkk; arc=fail smtp.client-ip=40.107.237.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5eanYAkk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3m0trWuPezpGX1zQhV/R3ShxYcxRzbblF2rLbgYLm5nJwThvCNDwmQdiXAWbb2JAdiFS/K8cFcGuI2PAVwq6q8rh4FPjqekb0ZtzHHUR8HpxHldwdStGIzLvvnS7nrjXBXFmLkZFoYBWuJ2j3o/4KTq2GzC87Ip1I9/7bv5gzlavuSR/vOfBnZZoPqcV1zKV0j390u1sJFMO1XH37drnm6qcFX9HyBwYdde8GnMjGViAZ+bo0JlOJ/8Un5PDTDA+7m5592ZgaebBrxHp3myYTS7xTlGpH+4pOy2nTfJOgNBBanQMvJ+vXlV93NR7znRl/8LlKHM1XmkO7K00hdiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikx5FAp+LZSRZ7jIGpBnebM9rGTREHa11KAHY7EVdkI=;
 b=r3+zR7tc+O9Ppg4EmWOXgqfrng6/dortyHsIKedgEu8w1B1iMMYSPK3/IJHEunT+S61LpA/yrSDeHs2Mf2SjR2MOtafCFP+/P7jxP5UYcjIanEMKK3GPOFrXzKxzwpMM0uOxDrdD9z9R9cR+/N3AxrEfumSPjlMB490kpWjuLN3Q3gutsAW6pxJ+tveWKEe/BXLPPtQ6/Wj1xh9nRwLdp8NAdYGFbHWQDXWK7xpA33o8SEQVkSvvEj1oZPf/Be2dPptm0lz90vPuetu4sX6CWT9FrgtX3z+kOlHOhX3/sRb8gGD/wnshhopMsrlNvpqdAHC1mfV++fEclCyvl01tDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikx5FAp+LZSRZ7jIGpBnebM9rGTREHa11KAHY7EVdkI=;
 b=5eanYAkk2S+guocBTUDP0kk9SoDW/ZLX6sUroLfKwx20v5PLt+cSl08489miBwZPVYLw1lKxf6Trkxk/szA2/xZDugh/X5ExRsztBE0xQ864WINUC5TycDCmHhkou4gH+EvtA9IzfzbYDEJDWMIv2A4KyiCQWy5kuLw98uCbDwI=
Received: from BN6PR17CA0051.namprd17.prod.outlook.com (2603:10b6:405:75::40)
 by MW3PR12MB4362.namprd12.prod.outlook.com (2603:10b6:303:5d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 19:49:31 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:405:75:cafe::4f) by BN6PR17CA0051.outlook.office365.com
 (2603:10b6:405:75::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 19:49:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 19:49:30 +0000
Received: from [127.0.1.1] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:49:29 -0600
From: Yazen Ghannam <yazen.ghannam@amd.com>
Date: Thu, 30 Jan 2025 19:48:56 +0000
Subject: [PATCH v4 2/3] x86/amd_node: Add SMN offsets to exclusive region
 access
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250130-wip-x86-amd-nb-cleanup-v4-2-b5cc997e471b@amd.com>
References: <20250130-wip-x86-amd-nb-cleanup-v4-0-b5cc997e471b@amd.com>
In-Reply-To: <20250130-wip-x86-amd-nb-cleanup-v4-0-b5cc997e471b@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|MW3PR12MB4362:EE_
X-MS-Office365-Filtering-Correlation-Id: 447f7ffd-a5dc-4565-5cc4-08dd4167364b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFBsRlZPSDdEVGhRS080elh0SDB6SDBIRUs2aTNXUWZ1bUlNR3Jkb291MzdE?=
 =?utf-8?B?SGhoUVg5V2hNNEdQcWd0WkM2aFRBakYrV05ocVhPeTVGWSt0V0orRzB6RFMv?=
 =?utf-8?B?cUx6b0xLWkR4c0diWEtQbzlpendKZEcwb3BxTHZ1MW1SNEQwaGNtY3gzUm1O?=
 =?utf-8?B?Rnl6VGtLazF1dnlyNXpNMEkwekVDQkxIQVZ4ZnNDV013ODN0MGQvQ3ovcVkw?=
 =?utf-8?B?bjFCaStXeC9ESCtYVXdQWkVDOThwUXpKSTBXNFRQNEMySlRYY0g1ZG1GYlJk?=
 =?utf-8?B?cUVZRm4vb0NxMk5BVml5VTdaZi9JZjVuS2tlcHpDVi9tQ1dZWXFsQUdBS29L?=
 =?utf-8?B?cTVjSGtCT2k3czVBY2dQaEdsTFpMT1NZRDZreE9JRXJWQTBucnFhZnlhdzNq?=
 =?utf-8?B?cDFpbHhScGFIYXBJcGg4N2tKNHZxb2dhaVN0YTZyS2x4S1dDZGJ2L2JaeHdR?=
 =?utf-8?B?OFYzT041MTg0UVpRbitSL2VaUUpQNnpwMzQrdGlrZ2FqRXRZNmVVZ1djNHBp?=
 =?utf-8?B?c0J4ZUROaWJPTTU1T3NsdFd1WXpRRHpQUExEaGtOamNKTlUzTHQyNUZ4MXcx?=
 =?utf-8?B?eG1CTnpybHh1UWphMXVwSWJWVDAzMzdtSUJWQTlhc0FCVjFhY2xPTTB5ak5M?=
 =?utf-8?B?aGVDaHhnZ0Y4VjFhZWdtZVpsemZuNnZmaUE5cGhhMnNzN0R5ZHhLQmswNkN6?=
 =?utf-8?B?UEdycXM0NG42N2tralF1a3lNd3ZybWtneVRnWHNQOGt6bHhPNWN0Y09Ydysv?=
 =?utf-8?B?ZUhSZm9pY1p5cWpLZGNpOEpCeDJPdkl4TjdCaWU4UlhCTnAwdWpVMnBINHZr?=
 =?utf-8?B?RTJjK1Zjb1p0dld3djFVbEdONzByMDlUdDN3VURBUlVCcTFYOEZ2R2tqVmtY?=
 =?utf-8?B?d21zSUtOMW5OT2RLMXVzZCtEeVV6QXJZcmdvM09rUC9mQVorYzVFRHgyZ0FX?=
 =?utf-8?B?SlZLbnc1ei9TSlA3aTJ5Wit6ak1EZlEzNElnN1lWTm1iMVhwdUxZWCtQOUww?=
 =?utf-8?B?NDhCTTdYMUMwTm1samZLVmZQTWhaZXZTRFV6SzlUaFZwb1R3TDA2NTU0MERR?=
 =?utf-8?B?OEVzaDl5T3dZNXFIY0VCelFNVHBhNC8rMnVFMTBDNWZldzlSd1RFUkpiVy9u?=
 =?utf-8?B?RkFWK0tFWC8rZVhlSGY5SGs0dk02VWZ4WmZlemF6aVlYRCsyRWhKSStWTzNU?=
 =?utf-8?B?Q0pFNVQyWVJRcVV0U0Uzd0N6ZW9oWXNVQm0vWU1LV2FBMFJJSkhnZm5yUFJj?=
 =?utf-8?B?MmRkTDRmWHErMWo3ekNhQkdlak5qZ09qdVc2T0xXTFA3Y0F3QXBlVUp3Vlds?=
 =?utf-8?B?YTJycjNzeVFtZ1RMZHd4bVRsL2M2M1ovSTljb2hUV0FCOEpndmZLTFhQd1JB?=
 =?utf-8?B?eTdqY0tBaHZXN0NqYmFkd3h4TEs1Sm1lSFhtaS9KUUpkWXR3eXRUcVByeVBJ?=
 =?utf-8?B?OVk3ZjVIZkdGcUJuVUVaMC9BTlEvL1g0VDV0elpxNWhxVjJvRXNqdzRtWEE0?=
 =?utf-8?B?OC80WjFrQTdVWXNqV1lwcjdkWUJsNFRRM05oS0V6clk5eWp6c2IzbFd3SGsy?=
 =?utf-8?B?cko3VXhwK2ZVcW1BVkFLTDlDWVA0SU9QbjMybWZuNGhsQUZHcXhDUUFFVm4x?=
 =?utf-8?B?c2NTTTk1Y2ZsN2lubnd2NTQwUlg4NTdCaTFvT0RmOXZjb2VsL1A4bzJRWnZi?=
 =?utf-8?B?Z1o0Nzh6NlNDc0I1Q092cFArYW54ejBVUzBuOXZQREx4ZFdSM0dwNWppcHRG?=
 =?utf-8?B?VFQvbG9IQndock5McWNNeVYwVEIyMjEzOS8rRDRtYlVNOFJPK25wM2RJQy9p?=
 =?utf-8?B?QjByVHMxYXVaZGxPQzlRYTYwR0NJdHZPQWE2WkV1OWRKYkVmektUM2VLdEJ1?=
 =?utf-8?B?a2ZVaTNvT0krUGcxdUV4Nk9sOVdITnhrSEhkM2ZCRi85V2prRHAvS1EvV09Z?=
 =?utf-8?Q?notbPROW2HY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 19:49:30.3574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 447f7ffd-a5dc-4565-5cc4-08dd4167364b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4362

From: Mario Limonciello <mario.limonciello@amd.com>

Offsets 0x60 and 0x64 are used internally by kernel drivers that call
the amd_smn_read() and amd_smn_write() functions. If userspace accesses
the regions at the same time as the kernel it may cause malfunctions in
drivers using the offsets.

Add these offsets to the exclusions so that the kernel is tainted if a
non locked down userspace tries to access them.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---

Notes:
    Link:
    https://lore.kernel.org/20241206161210.163701-16-yazen.ghannam@amd.com
    
    v2->v4:
    * Was left out of v3.
    * No change.
    
    v1->v2:
    * No change.

 arch/x86/kernel/amd_node.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index 65045f223c10..ac571948cb35 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -93,6 +93,7 @@ static struct pci_dev **amd_roots;
 
 /* Protect the PCI config register pairs used for SMN. */
 static DEFINE_MUTEX(smn_mutex);
+static bool smn_exclusive;
 
 #define SMN_INDEX_OFFSET	0x60
 #define SMN_DATA_OFFSET		0x64
@@ -149,6 +150,9 @@ static int __amd_smn_rw(u8 i_off, u8 d_off, u16 node, u32 address, u32 *value, b
 	if (!root)
 		return err;
 
+	if (!smn_exclusive)
+		return err;
+
 	guard(mutex)(&smn_mutex);
 
 	err = pci_write_config_dword(root, i_off, address);
@@ -202,6 +206,39 @@ static int amd_cache_roots(void)
 	return 0;
 }
 
+static int reserve_root_config_spaces(void)
+{
+	struct pci_dev *root = NULL;
+	struct pci_bus *bus = NULL;
+
+	while ((bus = pci_find_next_bus(bus))) {
+		/* Root device is Device 0 Function 0 on each Primary Bus. */
+		root = pci_get_slot(bus, 0);
+		if (!root)
+			continue;
+
+		if (root->vendor != PCI_VENDOR_ID_AMD &&
+		    root->vendor != PCI_VENDOR_ID_HYGON)
+			continue;
+
+		pci_dbg(root, "Reserving PCI config space\n");
+
+		/*
+		 * There are a few SMN index/data pairs and other registers
+		 * that shouldn't be accessed by user space.
+		 * So reserve the entire PCI config space for simplicity rather
+		 * than covering specific registers piecemeal.
+		 */
+		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, NULL)) {
+			pci_err(root, "Failed to reserve config space\n");
+			return -EEXIST;
+		}
+	}
+
+	smn_exclusive = true;
+	return 0;
+}
+
 static int __init amd_smn_init(void)
 {
 	int err;
@@ -218,6 +255,10 @@ static int __init amd_smn_init(void)
 	if (err)
 		return err;
 
+	err = reserve_root_config_spaces();
+	if (err)
+		return err;
+
 	return 0;
 }
 

-- 
2.43.0

