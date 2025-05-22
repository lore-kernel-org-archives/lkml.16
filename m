Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376001A9B4C;
	Thu, 22 May 2025 19:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943599; cv=fail; b=oCXXE67euLLopRzrfB+EVf/IAjxE+4QMgPM7+i8QCZe7i+uHPcbZnMp6XJOMc8gtCqokFsLKlYFjF5yUZM5aT35dLtrPRuaRHW7+Y1hUeoeXB4V9f5VU6ofMdBMIFyvVO8nDdMaoZXCHiN7zw6uKANKmgIpIOTbrj65L7oRjSsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943599; c=relaxed/simple;
	bh=Qmee4qhvS86doR1euSyFJpLs3iFgXid1lkv4L5esAJU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X3zSq5uWe/Uv5SYOxkawhOXJeCxbhogqI0oTWkawFpdcsfQuat28yHJ0E5B2hP1QZQIdIpR5aLtu1WvR0+yegjKSn2PwAZs93sdzIRG1RHXOAMK0GBKvi7y1f+rSWihWs84u9YaYFdZc51NC4hCp4Bo8Y2wC1Z3/poKd2TP7PLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IPdNyVZW; arc=fail smtp.client-ip=40.107.92.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IPdNyVZW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbfwO8C6H0uZvVgRrbiW2ZZlsLFRaYv4EhWs9ga/XqUxoSKmAVcPkiVNFSpm5uPFxlDPk5CIMhqt+J5rL/bPHp2KRtj9MpxACX+ajej6mAtv/o/3ULEI6xO1PFBvghj36Q8bBEKrn3Txm7JOJF5TIf6RQvSfPIbCjPXgjmAUT9hVGb8TifQQuIyXmMAIjR2l42DXpynA2aDqF3HQaRo2H8RIenKAx4asKmqrTLnTxAoiwPdiiQ56Wz+mphOp78PHL/eiOIPnRNtVkUafyGx7vn9WBbn+uTX8VWvFP+GBPGZ8FRz9D1QoEMb/VIgeiujBiDGfLlb53iklC9Qd9UExEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGx1poJ7CwVydL/t8c9A/pibUzt75tjZqcr+UMj2A3A=;
 b=eNz32iwCX4wAMX3CKRY7vpyIpmzHmMuRKOQT9MN1dr69TgsvxnKtOByBumb1w4w14xPkg4h3IUNv54hHtYbRHu9T46R9pV5jnMkueS+i04cOS9x5UHmE3LKEyvVzU71tvhw8w2lu82PPMqRTpspBMOZBeNLq9I7gUimARAiEHJrkob6miUKtzpfd594lPDOn/Ahbxc2CgLgeoO7qkr4MRUH1TjFi6dm7ttJDzLO2YwhtyD+uGg0aiXNvxwZRhCatW6dAKxZrZLqPABJE6dx6CJcCRW6NaD9ohsiaxfigxf2t1oXD5rrb148m/iCElq7PIHke3ujAXateX5dmGwQWmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGx1poJ7CwVydL/t8c9A/pibUzt75tjZqcr+UMj2A3A=;
 b=IPdNyVZWWGPk6XiVf3347kFjgmNklvgGPzYes2yhzE/N54XjQdhFlPHbTLLyZHBkad9W4cqrGWrO+VOFJyQpmmycvW9VqznL34eWYdUGcy0F9rUvMdDOOqeukybttZQE0DNeGX1GGpMsvCIBf0y0LS2BJoTJDH8ekWgllsoGMuY=
Received: from BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::6)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 19:53:09 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:59d:cafe::42) by BY1P220CA0002.outlook.office365.com
 (2603:10b6:a03:59d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Thu,
 22 May 2025 19:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 19:53:09 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 14:53:06 -0500
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
Subject: [PATCH v5 7/8] x86/resctrl: Modify rdt_parse_data to pass mode and CLOSID
Date: Thu, 22 May 2025 14:51:38 -0500
Message-ID: <c1a0d51772df5c30e88e29117d56835898b24265.1747943499.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|IA1PR12MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e74e7d6-3170-469d-04e4-08dd996a46eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BB/VfsRQYMco8FdFAPqkDYeCzJPNI4GKVLkqaXWLDiHDzl+jL9oGl/D9/yE3?=
 =?us-ascii?Q?oU6Ye397DysnMGDuXn0p1u+QWX4JOVubL+qsiViBOeYsH7cCV6/SF6DFbK4G?=
 =?us-ascii?Q?j48x5Jpzvv/UFWLeG9EJxY/8em0M8xk/nomWnxUOnUzN/cqKX3PMWyr4QzNA?=
 =?us-ascii?Q?yiQKH4dHxhWDcJw7LLjhRQTr2WWhB47n8N2sSUmQzGoHbT0ajpeFGJxGHx9p?=
 =?us-ascii?Q?0M3SEV44V6708+5HcDcMURfDfKKjTrF3Y2etj8czsjQe5Q9tCcURvVRwnm6d?=
 =?us-ascii?Q?fp4sB6E8kNmIoRVkzwPsUXbe0uff8EH0zJ7E5UOGXpSvQr0AFRgupPAT7B8M?=
 =?us-ascii?Q?n3hDYJTe3HQDZXJ2I0U1xdqEisiCo/rtLbJdpm4BtGa7cMbSOyJE2mdEqvIJ?=
 =?us-ascii?Q?iNYArYXjRrL9C5QLoYEaGeCbaqJzf3UHlQFXdHUJFMbiqLe2gtjbmTKlkwOK?=
 =?us-ascii?Q?yaJN5BWfEFqLGI4SmMYcZp0pQg1DzGNY9lwxGEZDD0+CF2werKByl6MJMzxT?=
 =?us-ascii?Q?YeXg5g5ZhlgamE56g/7FihnRi2IdL4BO6vvwyigRpxNCCqdICtYze4JavCrH?=
 =?us-ascii?Q?Tfbik0Tw/6FD6+PjBdtJ30aSbxhgY0OfQnrAuMFQSeYzeqEnakmqYCPZIyR/?=
 =?us-ascii?Q?mkRo5QAjNuTtYAnYMGJAiimBNv4HLwXfzRQd5xlyFh5a5m1s9PInuVdZRa9v?=
 =?us-ascii?Q?1wEirnx60bLCHg+NlYooytoO+84caS59t9ZivFLbgf7GkS5RnFWkUZt/rhRg?=
 =?us-ascii?Q?J+ulHrctorjyzjuzw7BiHrvqMTU8QeLZ3/sPpeP8gfqXed6QeW0SKVJ7yXgJ?=
 =?us-ascii?Q?BNGo/RdePKHeyU2HRAGUtkPwGhdYtYFpmzKc14ClTANXJAGnlMEfnIrkKVAK?=
 =?us-ascii?Q?2e9oDvtf1QAWaOEq4Od/Ozcw7pv8f2N91cj2rNBuRPheF8szDThnc9Sjvm+c?=
 =?us-ascii?Q?tOYc0+0QQqvqPn+jQzTIYNZTt1MiZdHIqlX5efUHkCSsFyBitxC+Eg/wUL2o?=
 =?us-ascii?Q?Yy3pWtiBhoJsP6OOjr+tlR+TOHR6nLiKuoi8U0VgaX7pTpw7yzHa3tda/iUm?=
 =?us-ascii?Q?HJloT0Rh/HvGKQlNUUBpNaznVrGSGXeuFZmKOd9gZ8nGprRHMb8pBhy117ab?=
 =?us-ascii?Q?jcuOGbi0hri1DoO5gvhbvf/c5Piw4Ztdd76Eb5Hk2eQeQC/aP+BusBpKZGil?=
 =?us-ascii?Q?I5rsVW1kZWJQS0EC9NK9Zl2pv42DbdALr9jmOiOjMVw/QrRNfzhxxyHXUvju?=
 =?us-ascii?Q?nllC7ssGJX4JiCkTaK7pbeZoi4HnJKTYScpiZLn9k5F7ITVtvPigMs210zhx?=
 =?us-ascii?Q?iRXnpxCCJGGLPZkdC+qagBFEO04J+5rpxBMjii9/GWdFxHfWAfpN06VJ9j0E?=
 =?us-ascii?Q?xBahCt+32i6V194BmDqI7Qx+bPLHydKVvxC2f0FIokbLiMjFNlKmNfRggOF0?=
 =?us-ascii?Q?jol1GbAtlhJx2XT4duAh42hfVr5JNy9WG8cPuZLH0uHHiob4ZhlPjo0cdOlL?=
 =?us-ascii?Q?T6XBeKq+BgADxbcNHt8llmmlLeHMDTIqXLC9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:53:09.0512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e74e7d6-3170-469d-04e4-08dd996a46eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258

The functions parse_cbm() and parse_bw() require mode and CLOSID to
validate the Capacity Bit Mask (CBM). It is passed through struct
rdtgroup in rdt_parse_data. Instead of passing them through struct
rdtgroup, pass mode and closid directly.

This change enables parse_cbm() to be used for verifying CBM in io_alloc
feature.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Resolved conflicts due to recent resctrl FS/ARCH code restructure.

v4: New patch to call parse_cbm() directly to avoid code duplication.
---
 fs/resctrl/ctrlmondata.c | 29 +++++++++++++----------------
 fs/resctrl/internal.h    |  6 ++++++
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index ea039852569a..6409637b4de6 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
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
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 14f3697c1187..10a3188ffa54 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -201,6 +201,12 @@ struct rdtgroup {
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

