Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744E7247293;
	Wed, 11 Jun 2025 21:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677094; cv=fail; b=ViNJ5GeNuRrXvdFiZ6pk+G6A6ijBpuaDO7k7slO/NLSM03Swtw2OiBBrfmY65hUuXU5LiEqpEDA5Zxm/DHBxwtJQouM86fPT/yqI7ciVb4zKrDfdEHkffO8mw6SoFvkP9LRA/0sPSbEy35gjtj0FxcDTHyBtsjvUeMeDKHjOXUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677094; c=relaxed/simple;
	bh=LzaXgX5VkP1y3UQh6X2/3szwoQomvPDJ95u3Mis5VZk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ds03q54arp8Ar8i8jM2DyRWVyPsMDsJwujiNhFrSHOOE9TUOrTj1EvPElX4XHNOj+RjWWHmvHIIJQ2Ta6+gLiteQgeY7uc1/JWAz84KTwqcYA2r81v5OWORl3ztzFE3V0wg2dLDwp1MwaNlj1l4uOBSQavaT6vuSCl6+LvNHBWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=awr109e9; arc=fail smtp.client-ip=40.107.243.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="awr109e9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MG59eVpKpfumn5UnXuH40MQl88pb0sYBETWA/424FYXqrugYo86v/+2BDrsN0N0oON0SDlykz1QqKRb13W8yxLsWs/6Ncc4JPYElO1yGL/rZMhK9pB1JgAyMcawuQ/Ag+nlTM35uU3rHpfV9Iz7J5NJPfRVYhdBgHarp3hthzWaN2DyQWkW46yYsrz2V4RIXlBtlr9dcoATzXIK0vCZ/tZONLq2ZgGvVR6SKRiOpxBVbL1PZAXE9/Dj2L42Jk5k0S0KgqAMSt/fuHei5WAOdmYOLz4QmF19AR+XLkORFedt+x/nFROVCIBj/xB2Itk7ppEt67qJOnfZp2EPyGemiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2Fc3RxzJUbOZXb5/P/Dttx2ymd5AJN7J7FKJC6HrEE=;
 b=AMRIHKiQ9tXsRJ1VOzemKzhJUw5TBbahUoRbPR+Lm+iOl63RLZVs6S8wCNHRL3CW93lUVk9qeoVyeSH4pYYmjxAyyaVscDek4Qyp916bRGdLRZefov+CChz1/m733L0exVqd1hSqpU2HIFQbD3O/1VQLKgz5TFn0QlWOoIzCwFZyNFAY47ffb6qXtgI1I4tHtuFTeMxvzEGNitimRyeAseA7qRqBaVSXyiPaQDQkFqdXX3E/leKSukAn4XbC6dCF4zjGUnFWm/LzjA1M8f2rCx3OqPBPe1Hth/mgZlLiMojpSJ5PV5q+imVqp92kl9XwmnDKOVqTAJvPhb6waJU/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2Fc3RxzJUbOZXb5/P/Dttx2ymd5AJN7J7FKJC6HrEE=;
 b=awr109e9MWKEhJynZ/gaPsvPGX04oJaUKMpu+KiWEjnT+hN3tl2g2o5vfxMlsMkzCE0Q7Dz6VeDyD9NjRkDas+bkzJibDuN6GhOdvok5KR7YAO688coWMGbODXCmotnIk6fKlljQ628v06tlyItmiRCzKPe6uNf1A8M2/fTOZMQ=
Received: from SJ0PR13CA0025.namprd13.prod.outlook.com (2603:10b6:a03:2c0::30)
 by SJ2PR12MB8133.namprd12.prod.outlook.com (2603:10b6:a03:4af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Wed, 11 Jun
 2025 21:24:48 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::e1) by SJ0PR13CA0025.outlook.office365.com
 (2603:10b6:a03:2c0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 21:24:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 21:24:47 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:24:44 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 6/8] fs/resctrl: Introduce interface to display io_alloc CBMs
Date: Wed, 11 Jun 2025 16:23:31 -0500
Message-ID: <16cebf7069e11e07c0d9e343aa72363325befafd.1749677012.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749677012.git.babu.moger@amd.com>
References: <cover.1749677012.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|SJ2PR12MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: fba200c0-05a7-4e63-7df9-08dda92e64ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q5hotpuY+jDV8h6xGlsoLa+hXpk2E31w3q1cVjzLm08+kh676BeVLIW25cI1?=
 =?us-ascii?Q?sLRjKwR/tyJdly512y/IqYquv7c+vt2mwhgqEfY85HInLJV4v92JxbqBs2ti?=
 =?us-ascii?Q?rAqUbmByc/IagoGbMdP1qDMCzgHEOJ3KI+KFX21oRHnOraKfMFotLlTSZjBu?=
 =?us-ascii?Q?1Rb/rJOwoAe0Nqq3LaivEtmK4bixRiuz4hKnoy/GZ8W4eX5HIeaaCOj/epZv?=
 =?us-ascii?Q?aDgboZ9BA5skRlv26Hj4vU253+UDXPTNYFYVvk1JtiLAd5pjVXUhUb19k+rE?=
 =?us-ascii?Q?5Il/UJ7Ib4az6RQy/HgjjtcFgsyEX1xCkEwdCKBrKrUpfJ/x29jHYoEkiafo?=
 =?us-ascii?Q?H2phydI2e9sdU/goVUcI36X5sDMjGOnicUyBrA69JG+6WRU7PdJITN1U4M6L?=
 =?us-ascii?Q?G1DHvPFQ+7CEjAfv5SZkMXsJFrEs5bRVkLWmGfTZH3PnCJp6VfpkW/nY36HO?=
 =?us-ascii?Q?7uKuxhJoAzn2ZVNr+NjP1BHT3zeTRLHzEtBRERzHCUYp8nhEYmIZ4UWk3DM1?=
 =?us-ascii?Q?2Bzs5EOWnoWGGn+okObSWmZjDfu8DgCAKg+YbS1GasXNPqO7459t7Cq0XJaJ?=
 =?us-ascii?Q?Pg2/itzMCAbXbcwCS01WZqJx7imYrcevXsPWoef+uIn64RC0Ufv9zUnnT/Y6?=
 =?us-ascii?Q?YosULV1bUzk4Ml8ctFwl3wJOmxEJWEqup/1O3OmZuRAxf6g4GATcW2p7Vr2H?=
 =?us-ascii?Q?3v3fmJ57QKa+QF9MxeTnMQfeK6cohL8DQImX86sL0Vw4WVmB+C2IxEeBl7Dg?=
 =?us-ascii?Q?kbHHjoTb8rS3ZgLdZ7ULCBCsemn33tYz1xc63oM/3+1Os5Z9bmRF8TNm9kiY?=
 =?us-ascii?Q?heh4Ypy2X0soc8l+RBEPMaH5BSnbQd/fGolZOLgeBoxVNkKt1gGpAHmFe4Oc?=
 =?us-ascii?Q?4qVfKfokYDYKU5nPXDPkTdMSk7xBM7cnaLVks9QkASmrbBUsLi9i/ysMfoR7?=
 =?us-ascii?Q?7wnSVl0i1Rt9HXFDkOsKzAe0YAd/UTqxTkJxrCsVmKjxjWZHMLCLaQqzvkzj?=
 =?us-ascii?Q?iY/VqbCeViBlQtllarXt7cebTKVFxwBOhDbCZBantL31AyVUEYU68SUID3sA?=
 =?us-ascii?Q?cxJmEgDRV3cU0mjQE3fGfoT9KuDdi2zU1LJLrlKrq+1fKR/z7CWW/xjG31xH?=
 =?us-ascii?Q?Isv8VtlqmyYZmyEOhvE7SzNfqzdIykPXpI3cVg95z04nsFTkomxFOkxDVzO1?=
 =?us-ascii?Q?pim/Q7YaX/6mPlJ4XhGi7MKbwIvWMUsYVA9lzyFnnX3W8yDhtWG1np2Rantr?=
 =?us-ascii?Q?NSzDiFbvZBgsY+yD9EVWRrORjhOh9zX93VXNSUiHxFh5NSZ78iEMLUHOszwu?=
 =?us-ascii?Q?BrNqje1ZSaN6838BMX0JimC9G+vP33pd3s+p6t/tRjevYfxQGUqN4+HqHMm2?=
 =?us-ascii?Q?cWwD3n0D2yC+8awgRQtWntYahSGhTlddak3XTQTy85eV8NVhwWm0bEWp2LQD?=
 =?us-ascii?Q?/6uDVDDyT7O5pPhj2EINO1hftZD5e9aThfoqGig3y6M1XMGXoeochVe9NKVA?=
 =?us-ascii?Q?6Ux8aNGeyShBpOp7b7VBOwlqWrygiVsNyMTsDq3OUzZ0ZAQIHwo5Tivd0A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:24:47.7965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fba200c0-05a7-4e63-7df9-08dda92e64ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8133

The io_alloc feature in resctrl enables system software to configure
the portion of the L3 cache allocated for I/O traffic.

Add the interface to display CBMs (Capacity Bit Mask) of io_alloc
feature.

The CBM interface file io_alloc_cbm will reside in the info directory
(e.g., /sys/fs/resctrl/info/L3/). Displaying the resource name is not
necessary. Pass the resource name to show_doms() and print it only if
the name is valid. For io_alloc, pass NULL to suppress printing the
resource name.

When CDP is enabled, io_alloc routes traffic using the highest CLOSID
associated with an L3CODE resource. However, CBMs can be accessed via
either L3CODE or L3DATA resources.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v6: Added "io_alloc_cbm" details in user doc resctrl.rst.
    Resource name is not printed in CBM now. Corrected the texts about it
    in resctrl.rst.

v5: Resolved conflicts due to recent resctrl FS/ARCH code restructure.
    Updated show_doms() to print the resource if only it is valid. Pass NULL while
    printing io_alloc CBM.
    Changed the code to access the CBMs via either L3CODE or L3DATA resources.

v4: Updated the change log.
    Added rdtgroup_mutex before rdt_last_cmd_puts().
    Returned -ENODEV when resource type is CDP_DATA.
    Kept the resource name while printing the CBM (L3:0=fff) that way
    I dont have to change show_doms() just for this feature and it is
    consistant across all the schemata display.

v3: Minor changes due to changes in resctrl_arch_get_io_alloc_enabled()
    and resctrl_io_alloc_closid_get().
    Added the check to verify CDP resource type.
    Updated the commit log.

v2: Fixed to display only on L3 resources.
    Added the locks while processing.
    Rename the displat to io_alloc_cbm (from sdciae_cmd).
---
 Documentation/filesystems/resctrl.rst | 13 +++++++
 fs/resctrl/ctrlmondata.c              |  8 +++--
 fs/resctrl/internal.h                 |  2 ++
 fs/resctrl/rdtgroup.c                 | 51 ++++++++++++++++++++++++++-
 4 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 03c829b2c276..b31748ec8c61 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -169,6 +169,19 @@ related to allocation:
 		When CDP is enabled, io_alloc routes I/O traffic using the highest
 		CLOSID allocated for the instruction cache (L3CODE).
 
+"io_alloc_cbm":
+		Capacity Bit Masks (CBMs) available to supported IO devices which
+		can directly insert cache lines in L3 which can help to reduce the
+		latency. CBMs are displayed in the following format:
+
+			<cache_id0>=<cbm>;<cache_id1>=<cbm>;...
+
+		Example::
+
+			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
+			0=ffff;1=ffff
+
+
 Memory bandwidth(MB) subdirectory contains the following files
 with respect to allocation:
 
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 6ed2dfd4dbbd..ea039852569a 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -381,7 +381,8 @@ ssize_t rdtgroup_schemata_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
-static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
+void show_doms(struct seq_file *s, struct resctrl_schema *schema, char *resource_name,
+	       int closid)
 {
 	struct rdt_resource *r = schema->res;
 	struct rdt_ctrl_domain *dom;
@@ -391,7 +392,8 @@ static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int clo
 	/* Walking r->domains, ensure it can't race with cpuhp */
 	lockdep_assert_cpus_held();
 
-	seq_printf(s, "%*s:", max_name_width, schema->name);
+	if (resource_name)
+		seq_printf(s, "%*s:", max_name_width, resource_name);
 	list_for_each_entry(dom, &r->ctrl_domains, hdr.list) {
 		if (sep)
 			seq_puts(s, ";");
@@ -437,7 +439,7 @@ int rdtgroup_schemata_show(struct kernfs_open_file *of,
 			closid = rdtgrp->closid;
 			list_for_each_entry(schema, &resctrl_schema_all, list) {
 				if (closid < schema->num_closid)
-					show_doms(s, schema, closid);
+					show_doms(s, schema, schema->name, closid);
 			}
 		}
 	} else {
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 9a8cf6f11151..14f3697c1187 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -374,6 +374,8 @@ void rdt_staged_configs_clear(void);
 bool closid_allocated(unsigned int closid);
 
 int resctrl_find_cleanest_closid(void);
+void show_doms(struct seq_file *s, struct resctrl_schema *schema,
+	       char *name, int closid);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index bbc032b4d0e9..0c2d2cf4baa1 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1997,6 +1997,46 @@ static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
+				     struct seq_file *seq, void *v)
+{
+	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
+	struct rdt_resource *r = s->res;
+	u32 io_alloc_closid;
+	int ret = 0;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+
+	if (!r->cache.io_alloc_capable) {
+		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
+		ret = -ENODEV;
+		goto cbm_show_out;
+	}
+
+	if (!resctrl_arch_get_io_alloc_enabled(r)) {
+		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
+		ret = -EINVAL;
+		goto cbm_show_out;
+	}
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r);
+	if (io_alloc_closid < 0) {
+		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
+		ret = -EINVAL;
+		goto cbm_show_out;
+	}
+
+	show_doms(seq, resctrl_schema_io_alloc(s), NULL, io_alloc_closid);
+
+cbm_show_out:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+	return ret;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2156,6 +2196,12 @@ static struct rftype res_common_files[] = {
 		.seq_show       = resctrl_io_alloc_show,
 		.write          = resctrl_io_alloc_write,
 	},
+	{
+		.name		= "io_alloc_cbm",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_io_alloc_cbm_show,
+	},
 	{
 		.name		= "mba_MBps_event",
 		.mode		= 0644,
@@ -2267,9 +2313,12 @@ static void io_alloc_init(void)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 
-	if (r->cache.io_alloc_capable)
+	if (r->cache.io_alloc_capable) {
 		resctrl_file_fflags_init("io_alloc",
 					 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
+		resctrl_file_fflags_init("io_alloc_cbm",
+					 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
+	}
 }
 
 void resctrl_file_fflags_init(const char *config, unsigned long fflags)
-- 
2.34.1

