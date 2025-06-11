Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62823717C;
	Wed, 11 Jun 2025 21:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677105; cv=fail; b=Cel43k6OV729+IEWVBd4G73FtLIjje5vRBlfxcDo+TgF7PNIKX6YbRjAObkQNuuCG1lzuxlJF59jj43SVbi0gjT85eR6ZqCN74Tgav5YLiE4YTw8wULXNYW37/oonBqHZXz31IBvGu8bL75Lb8kpmZbiqimP6BdpM/ghmWpUXT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677105; c=relaxed/simple;
	bh=LWOoJ56LkcUcJT3e2AWppW34ruQ47JszQMeh6uH7Hho=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M8kcm9es35v3+pOtiynqPl7E4vIkPi+oIQVTiZMd8/xiTa9Xu9EWZKb4vd/cz4wyEqAmSK+EZjWKGBwflyNRBE83ZxR5J/cAj1vQKlBZ8MdffSwlC/r3TYPh5yFK1B2Et3vzpYk8IX/HEuUVWYBA2TZBllhI+gKBvSmN6u4Npeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r6FhU/Zk; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r6FhU/Zk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5aH3+WJy1NGqvEShwpYKW1TBOoZHp1yi2uMD2Z+pDqJQB9wE4BdGLWqub2k/3eQDnLlhE0AQCPa3mAMJhjmOkC+TtOevlWzedE1GPWKzzG3/cOkLNZjout/oDUZAsRKCBIRP7TbBDJAbYp3fUpdnN56BfWJXUPyngb+ezVCMlLDgkAtEdSFP2gewNe4wpZjeKm0aFsZSKGvlDKq2fTSwye8RaL8JvL/Fa4/AtspggR64bzd7A0fIEJrmTa3a1l3kcvSMdBQxLQNPePdMTTqmOdB64yRLXtp2fpdCs6qCsP3Hie9ckV/GrAbwANMj8WnEmI3qcw4M6gAR9LLa6DWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDhCvh0g3P8U0UaN9SYBEj2rFKbmA7fxzLDnY9pKGGA=;
 b=hfBFjOF0YZEFrML/qkO+jrT+6eNHMU5NB1ZzmpSnN7ZiCs6KboDoxa4CxP6sMkbfp/xPjAVNKlIV1GgfMorZE0aw6DTILMARahxSYIV8oEtLMOZac0RJHd8nq1HYqcwsHNZscpPYYanVqs8MWrzunKYLA7cKtA+RpHUQlVPEGk9Kt4PoeCbEfgektpHgHviOty3AOJ2LchMHrzZIPkv+ALOhHXu5Z9lYg5lPtSQkT3t7SkUZpW4Xk/xjGOzucef+5v6ZDr3u7GxstDtk87qlrfiMw/pM04G3ISiKS2G+DjllizfyKvcVqlzOI6A3DGLsm2QCI+ow9EiAwv5Pawnt8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDhCvh0g3P8U0UaN9SYBEj2rFKbmA7fxzLDnY9pKGGA=;
 b=r6FhU/ZkOeC2Vr/xRLJ78J0fdSlREyCKDOSdo8NXdndS6oKage6wf1hpmJx09udz9b4YutP3YNZvNNWnzSRoz5uVGZsVNPQf46zXvkO9NwKbttTszfD2d0+UZ53NXFrsKkdpFAyDTJkW3kvdgmjjtvFE7T+3FfqD81sYRPLr6YU=
Received: from PH7PR13CA0011.namprd13.prod.outlook.com (2603:10b6:510:174::26)
 by CYXPR12MB9428.namprd12.prod.outlook.com (2603:10b6:930:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 21:24:58 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:510:174:cafe::a9) by PH7PR13CA0011.outlook.office365.com
 (2603:10b6:510:174::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 21:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 21:24:57 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:24:54 -0500
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
Subject: [PATCH v6 7/8] fs/resctrl: Modify rdt_parse_data to pass mode and CLOSID
Date: Wed, 11 Jun 2025 16:23:32 -0500
Message-ID: <8ffa8b31f471750464235f6df21971f7353b7015.1749677012.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|CYXPR12MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: e0288446-6703-4818-509f-08dda92e6a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BNUZObchYHKJdSq0YZwr7WcvvhP738xNOBMMVooERm/GgRnkm4bz7VQGd3mY?=
 =?us-ascii?Q?YBtLWg9NL46lrQmuhASXII5ecj7IySdZ5OHhsY12wi/Hzu+r0WsS911O+HDm?=
 =?us-ascii?Q?8z0IwHRJ2ca9uFkSVNtPHYjDbFKgI6yKvBLLT2sFIRaAxdGL0JDQNDz8SeqE?=
 =?us-ascii?Q?4DjMdxWyzgLVpiUja3y+nUVEgkKVB3CJBNDYwdUuV24YvDFN8F9uJmbeXjz7?=
 =?us-ascii?Q?2StjVKs1Mk/7gjjjtvMfs1Fqssj9/50Y5F2tB8FKQR9SUv+YTP7dkSbFayUH?=
 =?us-ascii?Q?LVdYZNtMbZkUvNmZJohZ2HMuxvVeqsoxYgmNWP6JqyUqDFfHht2V9tGrj5cq?=
 =?us-ascii?Q?aGiwl6DJ8pNEdlrbbBG94XMLsWKPU58+PdDjizkG5jGaRf5by92J7uOaO7LC?=
 =?us-ascii?Q?1wQ4aQFyUCDS/V6crjEw8m5UJlGSyOtlipK5SX8Weegi6GvHFrKg32NePAwG?=
 =?us-ascii?Q?YNc3zvMpkRvskWIWnlhlj/c/RLWcz4ZIqdq28MPuuGMxGdGUxxvJnFn55GTK?=
 =?us-ascii?Q?I4m62z/ciqZx5HzE/Orexfy6DVx6T8SLiNzqOoL88SWGO/MLVkQ/NylndMWc?=
 =?us-ascii?Q?E73C4Vxc65nXxB7xzOi4Mv3yYm1QePlJedgg8mf8AICpTbbTuneLSzn2NaGF?=
 =?us-ascii?Q?JbGitvProINs8vdc9IG0nWFTKQYhYxCVyGuWXEXtlEZY7/zBTD+hAX7ImIS+?=
 =?us-ascii?Q?zqQLuJJl/acxra7xmVLALBULQsNujZpqxfE5bBKkfR43p/9uO4h5iIq2nLgp?=
 =?us-ascii?Q?xkAQ0CTDmz+z8BN9lylWQA6r/4LLPWoYkxKZne6dgzrsEJVlDADjkqR4MxnR?=
 =?us-ascii?Q?FHNQrp8IkrDb/Ih91bD7WvaTWa/iTPAAh4LU7lFwxIKbfM5Gzoog/V4hUz/o?=
 =?us-ascii?Q?m7fqO2iOLfWy5TIIOG5TV2dhIG60I6UgmsTeonRPSFkbVcxkLh3QI7bapcoZ?=
 =?us-ascii?Q?U1bInviriqU0jOveCRMSrK4u8sN/MktYUG3qPdL47Dt/6k44hb6ZbNqyxoa9?=
 =?us-ascii?Q?mk2v6b9L6vzusiAZNBMSKFKE+vXF5SkA9B5UNECp18MRdNjKpXHJ7GRscuxI?=
 =?us-ascii?Q?iHFflzp/6pf/nSjIo4yihTmtn2q26gqnk3RzKqnd9GjGXiWhhy2zYEod5XG+?=
 =?us-ascii?Q?Xe515xgd8zn8e6n8TSWIFwPWmghuroVaxwGd8CnJGNI7F68HUlPGwdTujndG?=
 =?us-ascii?Q?ZOAjAn/MZDp0yl6oiDCT49FsX5dsPmBx1uuzF/hca3pAzpTEQ6gPDR/Z43Hh?=
 =?us-ascii?Q?jrNEu6kaZ74RLSjLrGLYinC/b/y3vK8d4FOhJLWeuMWTJHRdnf13iDKBtDeU?=
 =?us-ascii?Q?pbCSDoTKcD/kilv8UvLPf3AxUnUnqkuPBIdTKH2UakjUL8S1q8GQRTxkORW2?=
 =?us-ascii?Q?IIyzYNhJwNu1A7xKERgd5WrSeQlTlT6QKDOGlRggXXsWK/IGb7ZlMavCRmhP?=
 =?us-ascii?Q?VHvk6aS3LGYX3lnM4HZTDYqvWoZzoaVp9oseFbBf/XK2niUHcuZbZXBCe7b5?=
 =?us-ascii?Q?uR1yr4bANucgkPEbGdltSpGiCEHVOx7LrtX5lsuqScpEpiVDQakZ/w3jJw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:24:57.4346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0288446-6703-4818-509f-08dda92e6a6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9428

The functions parse_cbm() and parse_bw() require mode and CLOSID to
validate the Capacity Bit Mask (CBM). It is passed through struct
rdtgroup in rdt_parse_data. Instead of passing them through struct
rdtgroup, pass mode and closid directly.

This change enables parse_cbm() to be used for verifying CBM in io_alloc
feature.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v6: Changed the subject line to fs/resctrl.

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

