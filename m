Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD48231C9F;
	Mon, 21 Apr 2025 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275514; cv=fail; b=gCS8uVeGSFWQnCv/lp1VjFNSvGc8+HFWqYJnYjjLpIK8rLNNcf6WSYCd5E4/a7GU3L0BE5GIcnsorrrquNYMgZMHUn732gv99xrkQMgkHVLEP804uhLP6N6a1IOidXVthQzVouU/61FyVMX8H8h8eitAhgvZUMlkDQEV2O9BVHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275514; c=relaxed/simple;
	bh=PEeRloY3kcdO+zkDvSHnIHAixZLt+KuHwzx+cqEfMeg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CSYSSQmuOvgAZPVewKMee/pwND89u0eOK55Kj6pSJykyj7ksGCZTmJIZb3Cq0i+AOGswnvH7K0p02kfAhoOD5V7J74weVb5VY8atWzRGaGAFpW7wxunyEoUgaoyVPDc5k6b2h/qJQQx+lIdIgx5t3QRL0N4ctiLklNcV+v6uFqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ma+q2TXe; arc=fail smtp.client-ip=40.107.237.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ma+q2TXe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlm0wod1DjF6yvbNuDPAX5C62RKXaNfl2Q+DUQiM50tOCrJ7Pt/gMFx4ryktji/VbYR/xB6Lifbo9IDfUL5L9HyV6CjAR+dUqQrcyGTLVqce3UtXqISXvMA6Roros1pi0PSooASvef4dO1IQg6zdDvxy2HIPlOBXMbDEE2y4YdS3fb9TfiXb8r13rWHPYb690p6b3BNaLezYdKA3ycqG3Yd99gp0mUAAETfmTiHr2nWsuzPDe3H5JJFz+EKV95b377Gj5VQc1ozQxrXGBzZmBuqNKQZUuoRcnpKnuJO52KvANwbskkfn+7xwcdW41YPiWL/jOoBUx9GGGTJXmyOgCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9TqdundEwjggvlcwi8MRvgYAb1Ui5lqXWdaVEx24q0=;
 b=rdCy4Hx2PlWfN4uNrCDYLgPBK+n0YO3tos0cHxktzSFwjp3qfpbwiOKmP294IDQd9J9eAjeqm5j6X+DJpiK5K1TMi79oZNY2UuTKJeZD/xbKJuXGLhu39wFNGXlZew/IFTHhdieGEoDScE4ICfBC7KAGhr6+916iAl+JQNBkczPCXBR43U/wBc4oLm+Ts4Q1JjilVC8SpNtTP5uhe2ksYaWKVFKf6RpUpIn2Qxr1oXvqibwtHnwNMafkkbAndIjFDcweGTx+BKZ/FlueclBZVatLnHPkOR4n4HmX0p2hvRMrnoQO+XMGOT3ucGtu7QlXXVSmUXd7Qs32B5tV+cGhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9TqdundEwjggvlcwi8MRvgYAb1Ui5lqXWdaVEx24q0=;
 b=ma+q2TXeHovSxfCXy1tgQVKDsOEmlWl8lLV/JbJx6XLFQgo/Y4eht/K3+J4d3RlHNQcwIcSlWvaSWz0dLvfAwodezrOBRzJMy1LGgsGBIsD4+2BoRE04lSfdCwWZ5YyflFJo4MkI6UC97DIqY0xWpwRShHToZCi8A/37qycL6I4=
Received: from BN8PR04CA0040.namprd04.prod.outlook.com (2603:10b6:408:d4::14)
 by IA0PR12MB8301.namprd12.prod.outlook.com (2603:10b6:208:40b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Mon, 21 Apr
 2025 22:45:07 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:d4:cafe::e2) by BN8PR04CA0040.outlook.office365.com
 (2603:10b6:408:d4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 21 Apr 2025 22:45:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 22:45:07 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 17:45:05 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <rostedt@goodmis.org>,
	<thuth@redhat.com>, <ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<thomas.lendacky@amd.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<seanjc@google.com>, <kai.huang@intel.com>, <xiaoyao.li@intel.com>,
	<kan.liang@linux.intel.com>, <riel@surriel.com>, <xin3.li@intel.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <ak@linux.intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>, <gautham.shenoy@amd.com>,
	<Xiaojian.Du@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>
Subject: [PATCH v4 7/8] x86/resctrl: Modify rdt_parse_data to pass mode and CLOSID
Date: Mon, 21 Apr 2025 17:43:51 -0500
Message-ID: <d3581016aa7ee51727276f043cd7b5ff8d21002b.1745275431.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1745275431.git.babu.moger@amd.com>
References: <cover.1745275431.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|IA0PR12MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: b98e0f5c-8774-42f1-0120-08dd81262a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AATN6vVf2vh73J99uac5om3VSMHdYDmeenehwV+EkJHorc9h9bPLIqOOuJev?=
 =?us-ascii?Q?dmREAu1vXX9DChj9TG6lnh7a+W15ybuMpsRm5oZecru4uxkps8MQiTDenaP8?=
 =?us-ascii?Q?8xELPOdKaeW8QMuMQWEe4mv6SAC8x7NF0tB1ge+ErbTzJY7ZIYUQa9YWdoCl?=
 =?us-ascii?Q?TwINqsv9AcTQX9T+ePW/GaGl//Ar8V1cVhL9tPumW8pmma36vcZjuj/nYBUk?=
 =?us-ascii?Q?Qx28JcSTUUAOTtZf05FtJoT/W1Y9n+xstz3dwagPQNwR/sbis9sFmWBDC14q?=
 =?us-ascii?Q?uYrxrWejkwtzd3tGW6YZgkNv5GS8psng+DHXE01IziaCXppHm0cShrd8U9wP?=
 =?us-ascii?Q?EPielHHx/1dPMfkHxnzkaVIk8T8a/0kNh8TbLhoRjSv/fLX0Smj5YP7IJenA?=
 =?us-ascii?Q?YdJn/cFBr+aXQHDGFfgFsqRA85ET649dJBt7g8kl6LGmJv8KnMOZ2xO1UNG4?=
 =?us-ascii?Q?hykzn+TLKDgtC086zIuJmL4Si21DflZ8DJvjKXkCGEnS5bY8q+C07X3qbPpY?=
 =?us-ascii?Q?Nz4r1NvOS/7CJFWpLDAW6bKP/Q8OWViT15+BKp6biZODwp6hP9Z+VYaDOalf?=
 =?us-ascii?Q?uJGpLDv2/H9H7xl4Qeh9mlixa5ZlsysfCqqg+pZLlVNwjwuCbPKBxc5UTeC8?=
 =?us-ascii?Q?P1EFYbYzcxMg6vqr6nG9se4sQvKPd58s9gDemrbALYl+ZWCPy+s3UfftyNig?=
 =?us-ascii?Q?pFt/tgtVkZV+x2lCFdFl/W0BESU13VvB/+VSTubcqZeX0kNe9HE/VabsYfXa?=
 =?us-ascii?Q?6mFFhxHVJsyVWAgXx33DvLwLMEKBktLSicJyQBYCbP2OZlhvYX0V3+Kxd4B+?=
 =?us-ascii?Q?mAhPbD2QysPfP7MFIBfQq1jB28o8Pz1872zS125ETNs9KHYJVKgxgbiJDTNv?=
 =?us-ascii?Q?DWReRbS8ZeM+tOk2K/An0kwk3qfxHSJ0FrwzNbfjIBHuIs7UwWXWRnaxMDX2?=
 =?us-ascii?Q?FsolLRPEq1Vg0d8urD3fhQFfcwc30sr20KRUhjijf79E8TIrJjMC3Oa6rdN3?=
 =?us-ascii?Q?aP0WnfbHCM+m7No4IIGZBNIfUgk/mNo6YMmQSa4SYweLWrlj5OuCB238kluQ?=
 =?us-ascii?Q?PqvLmXSuSt774LDh594Rd7LtGf8Bu7kKYyxWe7WksDR21zvP19gDhCiWA/Qo?=
 =?us-ascii?Q?pyFbhlA8YcO6ZJU0utXC/jeSVMMPzWe7/3YS2+Ec1n1P8RxjIm50vJQk4I1F?=
 =?us-ascii?Q?LMiVSaovvgX2Ub54ACRFNtF3CR29CE4sZzuCm/gpL+npkHgFTUoPucmludXo?=
 =?us-ascii?Q?Sm49q/QNnvE3X55+JXDdJNDaYsKUNWEmA3ZycvjSCVOcrGgwAF59tdykHw+H?=
 =?us-ascii?Q?LMWYSFcN9uwwEakGrRWX5YlxxT/PGMVFK3yM9MLqk1L1L/rf2l69jMYdqA9D?=
 =?us-ascii?Q?T5mG3v7JRnwJj9FMqW4yqedQthsQ+tNbfGy9D9RdJqXd5zLM0p6OlpDZ925y?=
 =?us-ascii?Q?wf9rKdDijlVhQ/UdOLKaMcr0pXYldLL3bW7vKcR5sEx7Jxvin6TaTw2bqLiF?=
 =?us-ascii?Q?gwtbHs5mx4WHVec=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 22:45:07.1588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98e0f5c-8774-42f1-0120-08dd81262a21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8301

The functions parse_cbm() and parse_bw() require mode and CLOSID to
validate the Capacity Bit Mask (CBM). It is passed through struct
rdtgroup in rdt_parse_data. Instead of passing them through struct
rdtgroup, pass mode and closid directly.

This change enables parse_cbm() to be used for verifying CBM in io_alloc
feature.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: New patch to call parse_cbm() directly to avoid code duplication.
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 29 ++++++++++-------------
 arch/x86/kernel/cpu/resctrl/internal.h    |  6 +++++
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index d1a59b56a456..e5d1e77e1995 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -23,11 +23,6 @@
 
 #include "internal.h"
 
-struct rdt_parse_data {
-	struct rdtgroup		*rdtgrp;
-	char			*buf;
-};
-
 typedef int (ctrlval_parser_t)(struct rdt_parse_data *data,
 			       struct resctrl_schema *s,
 			       struct rdt_ctrl_domain *d);
@@ -77,8 +72,8 @@ static int parse_bw(struct rdt_parse_data *data, struct resctrl_schema *s,
 		    struct rdt_ctrl_domain *d)
 {
 	struct resctrl_staged_config *cfg;
-	u32 closid = data->rdtgrp->closid;
 	struct rdt_resource *r = s->res;
+	u32 closid = data->closid;
 	u32 bw_val;
 
 	cfg = &d->staged_config[s->conf_type];
@@ -156,9 +151,10 @@ static bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r)
 static int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
 		     struct rdt_ctrl_domain *d)
 {
-	struct rdtgroup *rdtgrp = data->rdtgrp;
+	enum rdtgrp_mode mode = data->mode;
 	struct resctrl_staged_config *cfg;
 	struct rdt_resource *r = s->res;
+	u32 closid = data->closid;
 	u32 cbm_val;
 
 	cfg = &d->staged_config[s->conf_type];
@@ -171,7 +167,7 @@ static int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
 	 * Cannot set up more than one pseudo-locked region in a cache
 	 * hierarchy.
 	 */
-	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP &&
+	if (mode == RDT_MODE_PSEUDO_LOCKSETUP &&
 	    rdtgroup_pseudo_locked_in_hierarchy(d)) {
 		rdt_last_cmd_puts("Pseudo-locked region in hierarchy\n");
 		return -EINVAL;
@@ -180,9 +176,9 @@ static int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
 	if (!cbm_validate(data->buf, &cbm_val, r))
 		return -EINVAL;
 
-	if ((rdtgrp->mode == RDT_MODE_EXCLUSIVE ||
-	     rdtgrp->mode == RDT_MODE_SHAREABLE) &&
-	    rdtgroup_cbm_overlaps_pseudo_locked(d, cbm_val)) {
+	if ((mode == RDT_MODE_EXCLUSIVE ||
+	     mode == RDT_MODE_SHAREABLE) &&
+	     rdtgroup_cbm_overlaps_pseudo_locked(d, cbm_val)) {
 		rdt_last_cmd_puts("CBM overlaps with pseudo-locked region\n");
 		return -EINVAL;
 	}
@@ -191,14 +187,14 @@ static int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
 	 * The CBM may not overlap with the CBM of another closid if
 	 * either is exclusive.
 	 */
-	if (rdtgroup_cbm_overlaps(s, d, cbm_val, rdtgrp->closid, true)) {
+	if (rdtgroup_cbm_overlaps(s, d, cbm_val, closid, true)) {
 		rdt_last_cmd_puts("Overlaps with exclusive group\n");
 		return -EINVAL;
 	}
 
-	if (rdtgroup_cbm_overlaps(s, d, cbm_val, rdtgrp->closid, false)) {
-		if (rdtgrp->mode == RDT_MODE_EXCLUSIVE ||
-		    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
+	if (rdtgroup_cbm_overlaps(s, d, cbm_val, closid, false)) {
+		if (mode == RDT_MODE_EXCLUSIVE ||
+		    mode == RDT_MODE_PSEUDO_LOCKSETUP) {
 			rdt_last_cmd_puts("Overlaps with other group\n");
 			return -EINVAL;
 		}
@@ -262,7 +258,8 @@ static int parse_line(char *line, struct resctrl_schema *s,
 	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
 		if (d->hdr.id == dom_id) {
 			data.buf = dom;
-			data.rdtgrp = rdtgrp;
+			data.closid = rdtgrp->closid;
+			data.mode = rdtgrp->mode;
 			if (parse_ctrlval(&data, s, d))
 				return -EINVAL;
 			if (rdtgrp->mode ==  RDT_MODE_PSEUDO_LOCKSETUP) {
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 2ac78650500a..92246d2b91c8 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -241,6 +241,12 @@ struct rdtgroup {
 	struct pseudo_lock_region	*plr;
 };
 
+struct rdt_parse_data {
+	u32			closid;
+	enum rdtgrp_mode	mode;
+	char			*buf;
+};
+
 /* rdtgroup.flags */
 #define	RDT_DELETED		1
 
-- 
2.34.1

