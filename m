Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465E318FDCE;
	Thu, 30 Jan 2025 19:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738266578; cv=fail; b=TIhKla+jzttd5LVCJiWV2WgCYiBRs/oFKfU/sjElMoMdoFFgGenpi3OzxPNUesb6PZmsVH6oQH3ETuSNeyJdYYVYutHT5vMllD3ivYLxSgzLC5v0P/tiUSYSUNuATfSWse+//heNIjAf30zO/lq12xihhRi/wfhTZteXeeQcYn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738266578; c=relaxed/simple;
	bh=S0lqrL2gp1KAf6Rct1m3ypYt+Y60xu9WuHt6zS7Jxro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=coZl11luydQwIQRC17zb1wJ4hCSOij9VHOZbVfaPSlSKNR3fmi1FQ1/efUQWYO7n0Yk5U4Cj/YX/zWw86JvQUutO4KFx7AzdIOE09OKR2IJZo7NuWhCLKyuftJXzyWliSld/VwnNB0Jbgxtf9hMUkNQvwSmFU8598IAMXCysd4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sFBg1kq6; arc=fail smtp.client-ip=40.107.96.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sFBg1kq6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uV010LulQ602jPWv4BkElJi1DqhaiXs3uPAhb2NK9FX/80aM3mNGDrto5lCkTLPHrFmzlJ0e6iKjqN9dtRsreEcr1/7owI9RF5ZXOHmcnaUx8iQI0fA+sgRh7KJRsgkwGXsms0mk9IOvsWJQjoqPpjOqGRQq+0T3l+JoJadxmxjrhA9o5q3SdQrvF2haGZlXbCQB74JfVYJY59gfghLJBjphbsW5l/XG1jcWZWGCuh1oxQ75vRAsUZM8aLmpQTsnzm7vSi7+GOQM+nlmvNkzIFTk1w8cn57dOddq3THXDOa/3CekzTrJ5YQ8YOoqYGJcuWQrndtqUx4EyUvCGgiyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IguRn2yto4aPxPgyX0CyvRpI5fOBhtxcOycGopbkOpY=;
 b=Irw6bSOajcuHFMmqZ/5SsmqEE37WMDEKu4ZOfJOCUCASwMiD++1xreZmUzsZOltG3cpbudmV3cmy8dUDdpOX+GNSCS73JWeA5/qbtusgPZNHABrcVS/AKeXMnD87XAomaWZL9PF0iX4gqcxyYKONo4Ggj67YtX/a1VRozqyZiRpgZo4vxhBhLCdgedtE0+EhZ11CRtDSCbQHOUjlX1QPHygAkqKcEv2LT3ZtUxqgV0UDlETMVlcAumKyH8FNCCtwchHk08CuyWjXRYP00Eam/Itp5wteaZ1k0Pk5b7ZYKIxC/hMg6qyp6tZlVnqAiUKGFikzIWa5kFlTWgzHiSWXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IguRn2yto4aPxPgyX0CyvRpI5fOBhtxcOycGopbkOpY=;
 b=sFBg1kq63tT5XDfzeekGMbveQc2Edf6pCaXwVZD7+7PAuyBkgRuXt7RbIqQgDyZ9IqL9F+OJdmjC+1dZQS1WK3P0AmlD2mZgSTZ/ZR5NrBkCctwMeGG30Kw1se0wTCoMbTgxfy5s5j4zU22KJPuwopTNjyhC8ildBDF6OiYcqAA=
Received: from BN6PR17CA0025.namprd17.prod.outlook.com (2603:10b6:405:75::14)
 by LV8PR12MB9184.namprd12.prod.outlook.com (2603:10b6:408:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 19:49:30 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:405:75:cafe::13) by BN6PR17CA0025.outlook.office365.com
 (2603:10b6:405:75::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
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
Date: Thu, 30 Jan 2025 19:48:55 +0000
Subject: [PATCH v4 1/3] x86/amd_node, platform/x86/amd/hsmp: Have HSMP use
 SMN through AMD_NODE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250130-wip-x86-amd-nb-cleanup-v4-1-b5cc997e471b@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|LV8PR12MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb9ca76-7dda-4eee-245d-08dd41673612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U051S2FnQmFpei9WUi93ekxUOHQxUkRXOHFEbEpMdjNPS2RxMlhnNWYrcjdu?=
 =?utf-8?B?YlRPa3FwMVp2UzlCNjRVd2QzYjN0dHRiancxR2JHSjEvOVYxenNlMFVSMVVz?=
 =?utf-8?B?am5qQjA2d05HU1BlYk40aTVsNXhRdmRTcFhJN2R0RDBUc0MvamlIQXJ2UXFj?=
 =?utf-8?B?ZVZSOE5Fajl3dERPS24zZURBcWUwVzhXTDV6NXZDR3BmSmVjNkZiQklLc3VJ?=
 =?utf-8?B?ME1RVlc5ZUZMSUEyZTdzQ1psY3RaZENSK1Z3WXNNRENQYjJmRjhjK2g4bDFY?=
 =?utf-8?B?SnlrdkczNnRwbnpBclVmdWRkalUyZE5IR1lZS05SYWdOS0U0b055SWFOQ1Y4?=
 =?utf-8?B?bHJVZnJWVk1UakdzNWRDVDRVWEdIaGpmb21CQklEVlVqQU5vN200V3E0bjhE?=
 =?utf-8?B?UnVuR1JVOWpCT1RVeDJQLzJ1ekJxMnRPVmp4NmNNY3BGRWJMdklSZWV0TU8y?=
 =?utf-8?B?bXFtQm0zUEhhRm5WWVZ4TVZBYWtDek9rMXFMcllteXYwMjB2UGZTZmJhcy81?=
 =?utf-8?B?K05Kek9jMGRBMm1DdFR0L2NCSjVFWkNYYzdVNW5GV2FGcmxDL2VHQ3VuV2x5?=
 =?utf-8?B?bXdWVWQzV3hIOG5QSkJmZzhOVlc5SzNibXB3T0ViaGpyWUI3MnhPL3cvMTM4?=
 =?utf-8?B?eGxtN2p0SHRMQUF6MFo4WHVGVWlwNGxRZVhqTk5HZkVGTXMzUjExZjJnMnVH?=
 =?utf-8?B?djQ0WGp0T3dOZ1JYYzMzcW1Ra21DOWJ0M2tLOXUxNFRzczArRkVtUVRYV1JK?=
 =?utf-8?B?U3F3cFdBblJoTGdYUGRUbDBGUVozTlc5N2I1RDI1dUZsMEZHanVEdkFORi83?=
 =?utf-8?B?dEh6cTB5WUFpZm41RXExTHEvUzArMHdCNHFieHdsZHFtR2hsM2JwU1pMcTZr?=
 =?utf-8?B?ZkNKbitGUnBDRWxsRFlkTUhFRWV5R2ppaGdBc3BoVW52eENsZFMzUGFBa1E0?=
 =?utf-8?B?ZktzY3Y2WjNzVnp4aldIRmExa3FFa2dWK0NuK3JWbENLTVk3d0lOTE50VnFl?=
 =?utf-8?B?QlM2WktFakRFaElrcjREQXF1RnkyaXYrVmJWT1A4RE5SMzFNTEdXRGpmN1lh?=
 =?utf-8?B?MVd2cWJhU09QemRxQTZNY0FkMzRQdVIxVnV3TkQ3K3ZlMkNibVR3MDFJb2pS?=
 =?utf-8?B?azYzQmpINlRxT3JwdjNrZjVwaW5nMENybDRPN3loTlpoWnBOTm9SYk1Oby9J?=
 =?utf-8?B?Zm1kMTZjL3JuNjIyOGJianB6NFE0YW9sZ1hXc3NWUnpkakhkSDJUMEVSeWpo?=
 =?utf-8?B?NFY4YlpsUGRzMWYvcFdWSzdyQ1laTzM3THZkakZnMUt4OThVajR1RytLNGFD?=
 =?utf-8?B?ZEp2L2VCczA2TE5LWFJqaXNVU1gya2p2ZUVlaks3dWZxMTRsbmJvS0NCejNJ?=
 =?utf-8?B?Z1NPN3NzQytWbTY1am1LWHVqT1J5d3EwWHFQKzV0MlJjSjI1REJDZnc5RE93?=
 =?utf-8?B?aEVjSUNCckVtcVZnbW1wSUUyY0MrZUdVcVhqeE5HK2RkRm1zS2JtVHh0Y3RZ?=
 =?utf-8?B?a3NjY0VmbU9rbkxXWTc3WXJWb2hnRm1mL2lhOVN5enpBSDNsRW5XamRqYWds?=
 =?utf-8?B?VmRUWnBkbUxMUkZjTFZRVWhnSi9aVWtsYVdjRmIraGsxamhRK1ZqUkNOdmZl?=
 =?utf-8?B?SkxPdDM1SnVGQnpYbjdWcFZZQXBEVWp1YzUxSCtTdUxkSUd6RGk5bDZrOU5h?=
 =?utf-8?B?LzJpeG0xL0NuUC9Tb3NCcWkvelBWRU1IcVVUQnRCUEJQY2hqWlp4UTVOR01l?=
 =?utf-8?B?cFhTV29UUkFSenQ1ODZhZERNTVpOc1ZTYzZXSWlUd3ZqTzVjdWcxYU9BZ1ZK?=
 =?utf-8?B?Z3lZdXhtekV2Q1NXSnRHanNDZ1RVTjNGcVRqaVZjZHh2TThEamV1UHBLNXcr?=
 =?utf-8?B?L3hMV2kwR1pjMWZWbEdxeFRCaWg2STRETFRmRVFMRHFCVnIrTUFEbWVUekJZ?=
 =?utf-8?Q?g0Vcjku5tzs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 19:49:30.0449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb9ca76-7dda-4eee-245d-08dd41673612
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9184

The HSMP interface is just an SMN interface with different offsets.

Define an HSMP wrapper in the SMN code and have the HSMP platform driver
use that rather than a local solution.

Also, remove the "root" member from AMD_NB, since there are no more
users of it.

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---

Notes:
    Link:
    https://lore.kernel.org/20241213152206.385573-1-yazen.ghannam@amd.com
    
    v2.2->v4
    * Was left out of v3 set.
    * Fix build issue for amd_smn_hsmp_rdwr().
    
    v2.1-v2.2:
    * Include <linux/build_bug.h> for static_assert()
    
    v2->v2.1:
    * Include static_assert() and comment for sysfs attributes.
    
    v1->v2:
    * Rebase on recent HSMP rework.

 arch/x86/include/asm/amd_nb.h         |  1 -
 arch/x86/include/asm/amd_node.h       | 13 +++++++++++++
 arch/x86/kernel/amd_nb.c              |  1 -
 arch/x86/kernel/amd_node.c            |  9 +++++++++
 drivers/platform/x86/amd/hsmp/Kconfig |  2 +-
 drivers/platform/x86/amd/hsmp/acpi.c  |  7 ++++---
 drivers/platform/x86/amd/hsmp/hsmp.c  |  1 -
 drivers/platform/x86/amd/hsmp/hsmp.h  |  3 ---
 drivers/platform/x86/amd/hsmp/plat.c  | 36 ++++++++++++-----------------------
 9 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/amd_nb.h b/arch/x86/include/asm/amd_nb.h
index 4c4efb93045e..adfa0854cf2d 100644
--- a/arch/x86/include/asm/amd_nb.h
+++ b/arch/x86/include/asm/amd_nb.h
@@ -27,7 +27,6 @@ struct amd_l3_cache {
 };
 
 struct amd_northbridge {
-	struct pci_dev *root;
 	struct pci_dev *misc;
 	struct pci_dev *link;
 	struct amd_l3_cache l3_cache;
diff --git a/arch/x86/include/asm/amd_node.h b/arch/x86/include/asm/amd_node.h
index 113ad3e8ee40..002c3afbd30f 100644
--- a/arch/x86/include/asm/amd_node.h
+++ b/arch/x86/include/asm/amd_node.h
@@ -30,7 +30,20 @@ static inline u16 amd_num_nodes(void)
 	return topology_amd_nodes_per_pkg() * topology_max_packages();
 }
 
+#ifdef CONFIG_AMD_NODE
 int __must_check amd_smn_read(u16 node, u32 address, u32 *value);
 int __must_check amd_smn_write(u16 node, u32 address, u32 value);
 
+/* Should only be used by the HSMP driver. */
+int __must_check amd_smn_hsmp_rdwr(u16 node, u32 address, u32 *value, bool write);
+#else
+static inline int __must_check amd_smn_read(u16 node, u32 address, u32 *value) { return -ENODEV; }
+static inline int __must_check amd_smn_write(u16 node, u32 address, u32 value) { return -ENODEV; }
+
+static inline int __must_check amd_smn_hsmp_rdwr(u16 node, u32 address, u32 *value, bool write)
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_AMD_NODE */
+
 #endif /*_ASM_X86_AMD_NODE_H_*/
diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 11fac09e3a8c..24d7a87edf9c 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -73,7 +73,6 @@ static int amd_cache_northbridges(void)
 	amd_northbridges.nb = nb;
 
 	for (i = 0; i < amd_northbridges.num; i++) {
-		node_to_amd_nb(i)->root = amd_node_get_root(i);
 		node_to_amd_nb(i)->misc = amd_node_get_func(i, 3);
 
 		/*
diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index d2ec7fd555c5..65045f223c10 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -97,6 +97,9 @@ static DEFINE_MUTEX(smn_mutex);
 #define SMN_INDEX_OFFSET	0x60
 #define SMN_DATA_OFFSET		0x64
 
+#define HSMP_INDEX_OFFSET	0xc4
+#define HSMP_DATA_OFFSET	0xc8
+
 /*
  * SMN accesses may fail in ways that are difficult to detect here in the called
  * functions amd_smn_read() and amd_smn_write(). Therefore, callers must do
@@ -179,6 +182,12 @@ int __must_check amd_smn_write(u16 node, u32 address, u32 value)
 }
 EXPORT_SYMBOL_GPL(amd_smn_write);
 
+int __must_check amd_smn_hsmp_rdwr(u16 node, u32 address, u32 *value, bool write)
+{
+	return __amd_smn_rw(HSMP_INDEX_OFFSET, HSMP_DATA_OFFSET, node, address, value, write);
+}
+EXPORT_SYMBOL_GPL(amd_smn_hsmp_rdwr);
+
 static int amd_cache_roots(void)
 {
 	u16 node, num_nodes = amd_num_nodes();
diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
index 7d10d4462a45..d6f7a62d55b5 100644
--- a/drivers/platform/x86/amd/hsmp/Kconfig
+++ b/drivers/platform/x86/amd/hsmp/Kconfig
@@ -7,7 +7,7 @@ config AMD_HSMP
 	tristate
 
 menu "AMD HSMP Driver"
-	depends on AMD_NB || COMPILE_TEST
+	depends on AMD_NODE || COMPILE_TEST
 
 config AMD_HSMP_ACPI
 	tristate "AMD HSMP ACPI device driver"
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 444b43be35a2..c1eccb3c80c5 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -10,7 +10,6 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <asm/amd_hsmp.h>
-#include <asm/amd_nb.h>
 
 #include <linux/acpi.h>
 #include <linux/device.h>
@@ -24,6 +23,8 @@
 
 #include <uapi/asm-generic/errno-base.h>
 
+#include <asm/amd_node.h>
+
 #include "hsmp.h"
 
 #define DRIVER_NAME		"amd_hsmp"
@@ -321,8 +322,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (!hsmp_pdev->is_probed) {
-		hsmp_pdev->num_sockets = amd_nb_num();
-		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_SOCKETS)
+		hsmp_pdev->num_sockets = amd_num_nodes();
+		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
 			return -ENODEV;
 
 		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 03164e30b3a5..a3ac09a90de4 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -8,7 +8,6 @@
  */
 
 #include <asm/amd_hsmp.h>
-#include <asm/amd_nb.h>
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index e852f0a947e4..af8b21f821d6 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -21,8 +21,6 @@
 
 #define HSMP_ATTR_GRP_NAME_SIZE	10
 
-#define MAX_AMD_SOCKETS 8
-
 #define HSMP_CDEV_NAME		"hsmp_cdev"
 #define HSMP_DEVNODE_NAME	"hsmp"
 
@@ -41,7 +39,6 @@ struct hsmp_socket {
 	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
-	struct pci_dev *root;
 	struct device *dev;
 	u16 sock_ind;
 	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 02ca85762b68..b9782a078dbd 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -10,14 +10,16 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <asm/amd_hsmp.h>
-#include <asm/amd_nb.h>
 
+#include <linux/build_bug.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 
+#include <asm/amd_node.h>
+
 #include "hsmp.h"
 
 #define DRIVER_NAME		"amd_hsmp"
@@ -34,28 +36,12 @@
 #define SMN_HSMP_MSG_RESP	0x0010980
 #define SMN_HSMP_MSG_DATA	0x00109E0
 
-#define HSMP_INDEX_REG		0xc4
-#define HSMP_DATA_REG		0xc8
-
 static struct hsmp_plat_device *hsmp_pdev;
 
 static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 			     u32 *value, bool write)
 {
-	int ret;
-
-	if (!sock->root)
-		return -ENODEV;
-
-	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
-				     sock->mbinfo.base_addr + offset);
-	if (ret)
-		return ret;
-
-	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
-		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
-
-	return ret;
+	return amd_smn_hsmp_rdwr(sock->sock_ind, sock->mbinfo.base_addr + offset, value, write);
 }
 
 static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj,
@@ -95,7 +81,12 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
  * Static array of 8 + 1(for NULL) elements is created below
  * to create sysfs groups for sockets.
  * is_bin_visible function is used to show / hide the necessary groups.
+ *
+ * Validate the maximum number against MAX_AMD_NUM_NODES. If this changes,
+ * then the attributes and groups below must be adjusted.
  */
+static_assert(MAX_AMD_NUM_NODES == 8);
+
 #define HSMP_BIN_ATTR(index, _list)					\
 static const struct bin_attribute attr##index = {			\
 	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},	\
@@ -159,10 +150,7 @@ static int init_platform_device(struct device *dev)
 	int ret, i;
 
 	for (i = 0; i < hsmp_pdev->num_sockets; i++) {
-		if (!node_to_amd_nb(i))
-			return -ENODEV;
 		sock = &hsmp_pdev->sock[i];
-		sock->root			= node_to_amd_nb(i)->root;
 		sock->sock_ind			= i;
 		sock->dev			= dev;
 		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
@@ -305,11 +293,11 @@ static int __init hsmp_plt_init(void)
 		return -ENOMEM;
 
 	/*
-	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
+	 * amd_num_nodes() returns number of SMN/DF interfaces present in the system
 	 * if we have N SMN/DF interfaces that ideally means N sockets
 	 */
-	hsmp_pdev->num_sockets = amd_nb_num();
-	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_SOCKETS)
+	hsmp_pdev->num_sockets = amd_num_nodes();
+	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
 		return ret;
 
 	ret = platform_driver_register(&amd_hsmp_driver);

-- 
2.43.0

