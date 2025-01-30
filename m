Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C21187848;
	Thu, 30 Jan 2025 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738266577; cv=fail; b=FRPc5uDavsSrGCGd3JvGISdu38SK14rOzLhpsIKLHSgDM2XaYmq9KumMcVQ+9HhZYz7qfd1cIi5j9f+jdRPsEnbfpNYaHnqN0iKIjUqJNsijLLQveORWoAxyVAGNyNpD/SdIm5qHwpH92hdf7esHVl046WMoyS42vsbJGi2mjzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738266577; c=relaxed/simple;
	bh=0L/NO2bFoNcrjwJ8k46RGGJUmgyswR6hUP6Rg3XC2zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lokDuoB2gvBJek9yXMpUHLIHw/epNPJiuZZQ8dDJ2SDlI19CF8oyIP/Fqwq8rXyIOkP6gzFVSxBj+Lr0ysLtum1lDCICttHC6sHhlUT26rpQhfdhkfuOiMuihBavrgq08a/pURVAp8y5ppNBqo4EK/MMIOJxB+FQXEDy1/mH85g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SwzdO8Y/; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SwzdO8Y/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ti2yD+StJ9tg9EE8X7m37BJPPYCVF8hiM85cOI+KjKcJ/GHEz/SYTztf3LsyJ0DRWsnJemhXO3/eD1W1OK0MGQxhwLvO0B7zRGHcLc09rnlN5CZOD+nZc9Qoclrij0y22q67CQneNKnML2+JNkaPX8MBG+ZfnDdzfG3N5VyucNeFaAeO8U7ilgSHTPuSh24UPmeOqJ2QHAOSG2Iz7NQLDbRMDAfUHwHt9lkS1vr3XHo9R4twC7la2HRNsXdNbWhUTfEnYq/KA6C+e2yM99IeX1N/I3eEM7IHMyaHi85yvFKusE81gVCK/MXtiAlkVjqn3uCccLDiIIC+7HP9lzvVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl0Yb47Ce6h7xIl60bicbNfmAbkKWxP44UTv241J3Gs=;
 b=slS4yeE2+4wmNqdHNiU3j9mqMfyHThGWVuOmz1oNtjvkSqWID+grIp1jGYEVwpEUfXanSac3IX6JjijbSz6/zRWhn005k6sYA4H5pKMK9d03SwARTo+DuHTpEvcMf78yvkxaL4hrYbeQasSljvg27y/m8DrAuOf1YRXjW900z89YgUDS4ZsphGK+vfd5RgqPlFZr8ANH1uhtkJpB2ZneVbl8li4KUKwNFjaTSvp7j0ZCmKjYo8ED4giuX0iAAolJ5kGLFTf70wCkOMp3N3eNxvHrJH8Vdxq2THpnpZr13mLg+ozRLZhZRyfn7S9jIqWkcIy+2dJWVTfy8R+HGDkpjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl0Yb47Ce6h7xIl60bicbNfmAbkKWxP44UTv241J3Gs=;
 b=SwzdO8Y/NG+o/pAL66PMPzJyj1x7OBKPpBdT75Pd6Bm1UhAM8bkw+xQnqsIFqcVjl4Uq/fi3T68SXfpXOuRFEx43BXocwQeqfzbbxyMifaQJfBDwWqU/fL9Vuit0mMH0nRpst7UkyLlg+vj8TrjYvJ4LdTuuqOL4bq1/MTIGyCg=
Received: from BN6PR17CA0039.namprd17.prod.outlook.com (2603:10b6:405:75::28)
 by SA0PR12MB7004.namprd12.prod.outlook.com (2603:10b6:806:2c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 19:49:31 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:405:75:cafe::42) by BN6PR17CA0039.outlook.office365.com
 (2603:10b6:405:75::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 19:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 19:49:31 +0000
Received: from [127.0.1.1] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:49:30 -0600
From: Yazen Ghannam <yazen.ghannam@amd.com>
Date: Thu, 30 Jan 2025 19:48:57 +0000
Subject: [PATCH v4 3/3] x86/amd_node: Add support for debugfs access to SMN
 registers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250130-wip-x86-amd-nb-cleanup-v4-3-b5cc997e471b@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|SA0PR12MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: 80691a9b-99e1-43c6-90ee-08dd416736e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFU1dmRpNEorMzZNYU5VZ1hoaFhxQm9KbWRrV0loaWNLdkI4R3RnUnBueldu?=
 =?utf-8?B?TDhnNkZVVHZ6N2oyNlpzTTdOS3ZRSmF0TTEyYXRYMlFSZzA4QUFXMGdTNXVa?=
 =?utf-8?B?QWE1R3FaUC9kQnVaczFua3lRUVVabURrRzE5Tll2N0M3QUpKZ01ySDVPbTBT?=
 =?utf-8?B?alpSVGY2cENTWTdrUTJONU5RTEhTN0dmUUNqeG0rY0J1ZXhvWWpKL3FuenVU?=
 =?utf-8?B?OGhWQ2dpaFUzR2dubklsSXVLWUR5OWQ3THBaN1B5emNmQXFPTFFyeG9GRlVW?=
 =?utf-8?B?SWtiODRjbStpQjBkVWoxY0xDbGNUL2Y1TlNOMUJKcDNzUlJJRFBRUi9LcjRi?=
 =?utf-8?B?Z2Q2QUtzZjZXR2dCYThZUEpBVnZVZHRWZi9CNkFUSzVlZURvNm9JSTJmYWl1?=
 =?utf-8?B?SVA1WjYxYmhCRFgyS3h1KzZXTkFPRFlxVS93YXNQUDBFb2krb0IyalhXRUFo?=
 =?utf-8?B?ZTMrdFBQUVI5YmdiQkQ2OEkyY3JUSWRBMWFBUXBiTHRqWWVmbEtWakhyVk9G?=
 =?utf-8?B?TXNxYTkyVzlqcmJQZ0lzWVQrL0lsUWFoMlc0ZEdteForeCt5SURPTkhuc3hI?=
 =?utf-8?B?MmsySnNZVWJib0VkV2VuNzVhVlI3VHhEM28wYzd5cmJHSndiS0ZYTGluV1Bv?=
 =?utf-8?B?WUxwVlFCWHc1aUw0dXd5eTVrU2FGL3NoWHN4NlErR0xybjJ5SURZeFYwNXVr?=
 =?utf-8?B?ZkNOVXRwQThieTJyYkN6OFFoK0kycFhhRmV4VVFCRU1waDBGL055SkU4dno1?=
 =?utf-8?B?MmRSb1Biem5SekxiNi8yN0Iyem5OdEkxbTZJQVN4ZXN0SEhmU25lRWYzYmpH?=
 =?utf-8?B?RlBVNUVoVDhEajlhN0FTMkttck5hRitPbzdqcFBwbktzOGNQSDh6NSt5M0Jy?=
 =?utf-8?B?Rzh1c3ZaQ3o3NU1wNHhMMlhqdElEYnB5OGhwcUxXQ3dmODZCWThsdS8vdGdL?=
 =?utf-8?B?M3VSOHk2ZG9UTXRieXo4S3p1OXF4RFFhRlRaRHNmbDJzVjVhQml6QnFpUzBp?=
 =?utf-8?B?cHFJYmV0czFGR1ptTHRRWHMyeXdNK1NMd2IzSEVnRklwVmRsMWxoWlZhVCts?=
 =?utf-8?B?WjNaK0VEcllWTEZPamM0R0ZIcDkzcFliS082RnJoM0JiK1VmNWxOVEdOZTlm?=
 =?utf-8?B?dmpleU9jdU5MMGJLdjBrR2VyNnEyUzVlKzZCTmZqWld4Zlo0ZHczeHA5alo3?=
 =?utf-8?B?YUFyUVhVSkZ1cW5iWXRENUJlRTNaWEt3aGhKekczS2pTM1RmVU9RZGk0a3hl?=
 =?utf-8?B?Z0l3WkxBSjVVV1pLZk5ZMjlINkhtUXFmVlNYR3Y4K2wrSFNHUnl5Z1loeVNS?=
 =?utf-8?B?RGRBZjBFRTBvNnhnNDZRVVAvelRBZDJUb0drQjVUeFRFUzVqMVNkTkwxTTI3?=
 =?utf-8?B?TW1zMjI1dnNuREhqeHpSOWFpS0t2elIrUjltV01XMkowQnd4S01ycnlUZ00v?=
 =?utf-8?B?REVWTHdPM2FwNVFBWWJ1bXFmc3FFdEVQRFNqbGFSY1N5YUVqcEcyYUg5eXNa?=
 =?utf-8?B?QkI3aE1xTkw2TzJjN3Q3dVc0dHpDbk81bFQxK3paeW9WRnBUamw1c0tFU01K?=
 =?utf-8?B?NUp4WUVaUW5YYUN6a04xSkpHSDcyOTJIb3plMVJua1J6dS9WdVZZeGdRRjYr?=
 =?utf-8?B?dktsMVMvU3ozcnovNHd6TEo1WGcxZHRldjh5MmNSRHRSRk00c2hLRE5hMk04?=
 =?utf-8?B?Z3JkczhTa09hVFlmd0xoUXFuVVBFN3VUOHFoc3prY3BnTWZGVWlvK1J6VGFI?=
 =?utf-8?B?ems0M2NOZHNoa1p1ZUp1UExnUzhweER4TDdXaEF3Q2J1K21NTkhycmJaMTB1?=
 =?utf-8?B?L2ZIb0wzanN5WnBMRGp5UzNzN1gyK01pQTB6VHYyMjlkdnpKYnJwRVJvbm1h?=
 =?utf-8?B?d29CRldwV2JyZStxQm5yNWludEU2K2x2OUJXVm9qQnRxRVJacjlmVHkrOVZr?=
 =?utf-8?Q?RBbIBNdnPCM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 19:49:31.3886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80691a9b-99e1-43c6-90ee-08dd416736e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7004

From: Mario Limonciello <mario.limonciello@amd.com>

There are certain registers on AMD Zen systems that can only be
accessed through SMN.

Introduce a new interface that provides debugfs files for accessing SMN.
As this introduces the capability for userspace to manipulate the
hardware in unpredictable ways, taint the kernel when writing.

Include a kernel parameter to enable the debugfs interface. This is
intentionally left undocumented to discourage use of the interface.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---

Notes:
    Link:
    https://lore.kernel.org/20241206161210.163701-17-yazen.ghannam@amd.com
    
    v2->v4:
    * Was left out of v3.
    * No change.
    
    v1->v2:
    * Use TAINT_CPU_OUT_OF_SPEC.
    * Add parameter to enable debugfs interface.
    * Validate node input from user.

 arch/x86/kernel/amd_node.c | 99 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index ac571948cb35..b670fa85c61b 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -8,6 +8,7 @@
  * Author: Yazen Ghannam <Yazen.Ghannam@amd.com>
  */
 
+#include <linux/debugfs.h>
 #include <asm/amd_node.h>
 
 /*
@@ -192,6 +193,87 @@ int __must_check amd_smn_hsmp_rdwr(u16 node, u32 address, u32 *value, bool write
 }
 EXPORT_SYMBOL_GPL(amd_smn_hsmp_rdwr);
 
+static struct dentry *debugfs_dir;
+static u16 debug_node;
+static u32 debug_address;
+
+static ssize_t smn_node_write(struct file *file, const char __user *userbuf,
+			      size_t count, loff_t *ppos)
+{
+	u16 node;
+	int ret;
+
+	ret = kstrtou16_from_user(userbuf, count, 0, &node);
+	if (ret)
+		return ret;
+
+	if (node >= amd_num_nodes())
+		return -ENODEV;
+
+	debug_node = node;
+	return count;
+}
+
+static int smn_node_show(struct seq_file *m, void *v)
+{
+	seq_printf(m, "0x%08x\n", debug_node);
+	return 0;
+}
+
+static ssize_t smn_address_write(struct file *file, const char __user *userbuf,
+				 size_t count, loff_t *ppos)
+{
+	int ret;
+
+	ret = kstrtouint_from_user(userbuf, count, 0, &debug_address);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static int smn_address_show(struct seq_file *m, void *v)
+{
+	seq_printf(m, "0x%08x\n", debug_address);
+	return 0;
+}
+
+static int smn_value_show(struct seq_file *m, void *v)
+{
+	u32 val;
+	int ret;
+
+	ret = amd_smn_read(debug_node, debug_address, &val);
+	if (ret)
+		return ret;
+
+	seq_printf(m, "0x%08x\n", val);
+	return 0;
+}
+
+static ssize_t smn_value_write(struct file *file, const char __user *userbuf,
+			       size_t count, loff_t *ppos)
+{
+	u32 val;
+	int ret;
+
+	ret = kstrtouint_from_user(userbuf, count, 0, &val);
+	if (ret)
+		return ret;
+
+	add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+
+	ret = amd_smn_write(debug_node, debug_address, val);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+DEFINE_SHOW_STORE_ATTRIBUTE(smn_node);
+DEFINE_SHOW_STORE_ATTRIBUTE(smn_address);
+DEFINE_SHOW_STORE_ATTRIBUTE(smn_value);
+
 static int amd_cache_roots(void)
 {
 	u16 node, num_nodes = amd_num_nodes();
@@ -239,6 +321,15 @@ static int reserve_root_config_spaces(void)
 	return 0;
 }
 
+static bool enable_dfs;
+
+static int __init amd_smn_enable_dfs(char *str)
+{
+	enable_dfs = true;
+	return 1;
+}
+__setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
+
 static int __init amd_smn_init(void)
 {
 	int err;
@@ -259,6 +350,14 @@ static int __init amd_smn_init(void)
 	if (err)
 		return err;
 
+	if (enable_dfs) {
+		debugfs_dir = debugfs_create_dir("amd_smn", arch_debugfs_dir);
+
+		debugfs_create_file("node",	0600, debugfs_dir, NULL, &smn_node_fops);
+		debugfs_create_file("address",	0600, debugfs_dir, NULL, &smn_address_fops);
+		debugfs_create_file("value",	0600, debugfs_dir, NULL, &smn_value_fops);
+	}
+
 	return 0;
 }
 

-- 
2.43.0

