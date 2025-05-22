Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA902BF3DC;
	Thu, 22 May 2025 19:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943585; cv=fail; b=jHplRKW2dBw5tF2h8GwC2NWp+2N1G4dd9J9ifASO5oi8XpmeIbvLWV3dQBZSfht40aVyYjzG3dROWVup5oTLqA+6OMfbdSSp8ZDuH4KKdBNgMyTvIHsNuya1DoNwIbbzJaj6ReUoA+oieawiJgB30HCaXr5OtJbapArsquzZnFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943585; c=relaxed/simple;
	bh=nBbmhyaOZhjzvIbG9ddWeyTzqLbhjCgarC6HovZsY60=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+RtafJfUDKitDiuO3K6GXkVJdQGVt93m6UMITH2A4edvmvxKNMGnJGOk5Aml7Iu2XzrNJ+LvnAZ9PGCDZGHmFzisgTjOLPfD2DG0FGG/ViDuRprUR545lwtsZ/6lXx2+tqDspPK14ClCACO57HNo6gaIt5pK37DZEHabqhV53M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ndarcnh2; arc=fail smtp.client-ip=40.107.236.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ndarcnh2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a03c3DMHslrwByLB/ofw8Boajuc2gcnjN8niDBm/4Ew8PDcitjBANjuWa3BrPN9T/DSROSkZV/fXCpw1siiwbchb/W12e8VXSJMlnqp6YOae35raHGXNG3r/shsL+CDVwuIJXDiSTAqz1NBoRu0blvOZ38oW/WATv/SxDFoRDFKbnoS8ZGE3ZkzqVv/Lu4v9VYasrEsSVm1bqyNzjf/0rM4xXCYwnLXWNhS3xDJlXYX6WzH3DL72dlx7sFTkoPE6BADyd+qLVXjyhyYYos4u8M6Z4zSGqGeoAYa8W8GWJc4CAaOHBvGxulZaLuUGeTCmyULxGE+PS5bq+SWK2IHrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMDeJ9qvYNx0Djw8ma6/erVj4baOnShWx04yk3T5AO4=;
 b=mjO19AFKnOrru6klgWpgej9o25DkxoSB7uxq6YI4q9c8jSdYi1s15mGo8nr9OCn96K7Y5POaM9wlxQnUkNQvBcq8ePx/FIgg4CKmuMC0xYLroUxGWUMMr5y9QVqiCFhr+nmMarKjiCw0RdcGz1ow8aCwtHf5vGywQ2L/Vyly0zesYdgJeGdWaeF2hC+M6ybyX4Q7wMWdSEANspShnfeTdfoIdSAOPaZFyVGz9GETjisyin1w+VwQ4ZTCCZP02QE/jT305NPlYGmB/u/+T6yx6wxZPV3385fzgO0/hfI00fTvAbOHx9ZMHzF1cKFYNojd51n5VqSIiVHzo7qZozsHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMDeJ9qvYNx0Djw8ma6/erVj4baOnShWx04yk3T5AO4=;
 b=ndarcnh2gkEJKMyJHz5QH1CGoMnOCOrResC7yxS9hveLJqxPrjrN52F4BrlbXo7oSN5psDswNoSqNcZxkq2DBZYiUVRo7Yt3O2D37M+Z9RTDH5C2zmMOmWYijJee02eRJ5VxkEvSVuDnS2f1SQn2R3J0PrfNE2pc22f2Y+b8TOI=
Received: from MW4P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::32)
 by CY8PR12MB7732.namprd12.prod.outlook.com (2603:10b6:930:87::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Thu, 22 May
 2025 19:53:00 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:303:114:cafe::28) by MW4P222CA0027.outlook.office365.com
 (2603:10b6:303:114::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 22 May 2025 19:53:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 19:52:59 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 14:52:56 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <thomas.lendacky@amd.com>,
	<seanjc@google.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <nikunj@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <babu.moger@amd.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 6/8] x86/resctrl: Introduce interface to display io_alloc CBMs
Date: Thu, 22 May 2025 14:51:37 -0500
Message-ID: <6a739759112b08595a5db191d0679e64e15ed244.1747943499.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747943499.git.babu.moger@amd.com>
References: <cover.1747943499.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|CY8PR12MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 01beabf9-6a98-4347-09d2-08dd996a415a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pQoOFLspckJKYV81tlxFPl4W6ZA/97ZN6Ch7iRTdOAieHXLQB5fB6owXrZqx?=
 =?us-ascii?Q?qOR2LAQuT7Fex3GQW9uc0Nb21edYciv4AEsI9iEUpN31nX7xPlQUtzFTeP7z?=
 =?us-ascii?Q?V2Be97KMcb7+DvihUY78jGDeKnYXihr3uGnEcmuvHK74qsNHqO9hn+T11YTD?=
 =?us-ascii?Q?6ZNA6UuRFIEFJ5lLFBMIPk9ZUnZWvIGdSlsjnl9lsa28dIsofuobIN2Pw+7g?=
 =?us-ascii?Q?I1nG/Jt6voQ0vxkpjkbxA2b/xblpUT83Igq73SVgNRfxhlLpY7yuGhuVG9B/?=
 =?us-ascii?Q?NLVhID2BFQM2eJ9yeTw8oU22p9Sc6yH+963UBoCvchLc5b9c2zDXosF3abZM?=
 =?us-ascii?Q?15LdYgA+E3RZEBUnYv2u+2KPu8AZz28gfQZlivqnn8rkvFjXe2c2SFWTr8SO?=
 =?us-ascii?Q?YujJ5gpWjUqzEFPM8AwnESh2TYVIdcBGNJ+t312qm/0VABfMaX06nb1BCduH?=
 =?us-ascii?Q?Ns8AR44WcHCRiIBNXGalDhukgMC7JoFafZImMX+OUhO5WZHKiDWuF3wggyMq?=
 =?us-ascii?Q?P/7h/LHcNQc2kM+5ZUyA3RydN0JjMPqQuZnVeuMTgbs1KB0ZW59Li4N1N6Fn?=
 =?us-ascii?Q?n5F8g4d2LkzeFZTb05m4YlleAl64Bko/R5fCQONKvYkEKVTIPG7NkpGASmpz?=
 =?us-ascii?Q?koxLHS2t1pBQ1ZcsUgjspl0EnfNAaEBJFu8EJ6A9CPkbZEaUZjBAuPHO3Men?=
 =?us-ascii?Q?wpiRh6kCUleejfyqjrvVHyIxHq8+WljknPohQ4wMm9Xm4yJVTkM38IYgQVpI?=
 =?us-ascii?Q?PKrd2jxXT2w1zw832GM7Sk6W2jowLxB46vzyqOe3zwZ/FATPMy6vELfnvXNS?=
 =?us-ascii?Q?KV9gH2EuRvKwt0Kvoi5YEv7xsWgddUYMOpDPZlglms8x6p9XcbzxVwxKs0CK?=
 =?us-ascii?Q?LE15ChOFtBSHSpzIRWnpDkHO6fDMg1ZGnekjBowZWoXz2E/t48zJ3NKn1vvm?=
 =?us-ascii?Q?Tk/VrsDValpK1OifjbIGLAUr3hqwS8GvnYHQEe+30lU7N6Gn5CW5WWpNmh5A?=
 =?us-ascii?Q?s/r9UGK3OJtsMTwp6//m4j0EL4nrWnn8DfPsJiDFpSR6jxiDCfb6jB4TmOuM?=
 =?us-ascii?Q?7lbaaHOtQM2d3Kx0ANf4MX2w/GucJWzrRX07OlHvV4qRsmJSwVUJQuolpnxK?=
 =?us-ascii?Q?ht+KtKvtt1vAYRgFfmuahcdk8uhcCZaueJsvv5+gnkcCrZGnKfJEacnnHOAA?=
 =?us-ascii?Q?mX7BO9xyWP9fOZtzA6oePNFHKK40i5r3Ch5FKEhnmzBy405X964rdyp604G3?=
 =?us-ascii?Q?OqYsRK8kjbaLH/E0r9P8kCL7cD++ES/h77BgKF9vHQ3cdNdGLm18HreXQwh1?=
 =?us-ascii?Q?rsiyprmT/8KzJlGh/2aah44Im0C9oIt1KKiS9v+dEWV3FPpCQao1UFYML7Z8?=
 =?us-ascii?Q?/v8tGjrFBpR4COnmeFgF+0ETpabFreTSewWTsCHaTqHG8sKUGbwem0jwDc55?=
 =?us-ascii?Q?4nVwjBOTuAjJuplg7GfdwYVadgPOV6IJBu438JDSDTt7VM2H1qE6iwllYOte?=
 =?us-ascii?Q?aw8RtaZkdLiXL33Ji8Rw1yFP7RlmnaTqHJRC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:52:59.7223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01beabf9-6a98-4347-09d2-08dd996a415a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7732

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
 fs/resctrl/ctrlmondata.c |  8 ++++---
 fs/resctrl/internal.h    |  2 ++
 fs/resctrl/rdtgroup.c    | 51 +++++++++++++++++++++++++++++++++++++++-
 3 files changed, 57 insertions(+), 4 deletions(-)

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
index f5b79c73fae2..9277b9c146bd 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1995,6 +1995,46 @@ static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
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
@@ -2154,6 +2194,12 @@ static struct rftype res_common_files[] = {
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
@@ -2265,9 +2311,12 @@ static void io_alloc_init(void)
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

