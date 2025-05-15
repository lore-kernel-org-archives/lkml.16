Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809129B78D;
	Thu, 15 May 2025 22:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349785; cv=fail; b=j7E1X0rHK9J5wLRnrk9ly/UDcCzJ1OMkiWJGPRRw/4Haw0R677cTiOsaoQkG6iI5o8Ig4gR96XRVzgfonKAI53Nn+Efq0435jz8xQak0LYvkiekqV7WXYIAwyLWHnQD9V+DlVDpkZYso/zTKk1kovTlaGfyIJDvYUHriaMvjO+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349785; c=relaxed/simple;
	bh=C8KhxuDut1t1cm2NeTTrY0F1dq2aDsvSqmN3KpE1vYA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kb5l38pa/yZ1qjIM/M7jsKejZbGCDrjgxpWeLU28+yuJmPMQ53UY/JcssEgmFTxzHAHaDhd6doSWSadRtR+8X+DvLyvhWh4S5AvCnru+C6zACeIdEn4uicz0C6V43cIGlhGIDFFFnsB7oR6O2gvuBgtKO97NUtMWULRMXsl0Ydk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gB+dRsqE; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gB+dRsqE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qc0MKrXYvx8+V8QtIsUjnU87pOaOUFE//rzmuLzX+fNPWlzhi3A3JqpW6VWT0zf0nflTicx9wLxSA3lUUelTEkBFZnYmh/rBv3sjXaSQjDc8+9KgOfrhNHrI7f2QId2/p2r/9IPPTY0djkuV8RgUP6ZCUO4LFD4xzbrKfvzEmV0LEjWxy59xv7iIzrCm4Q+tfYN3Z3SQXziZWjeAycnbQbJv/F7mkbrGxibwUBl9vGD16qXPkmyILaaI1U32bZLhwGXvmBfy0HgYum5p8OiajZUvmRRepf+g/mEcMKPbqTkCTTOprUfp9qWXUGY+RT6pYODGrqBMOVaOGjyzKn1auw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYrqOL2HkNUlxYdwPifLiwqrjbMGwURY+c3E3QVrRJI=;
 b=x+GJFovPywOm+RzqVnsnFRninWjdn09e3evlA9YaqhkNBdBBODQtd+wzi1iPsd97hGLLNRCAEcTLpoS2sFZfrCeouKSjchqB2m6Wc3F37TCjNXO0LfXXesk3PWeTdU8+/5atl5ew+umIbVZ6DGoORB9BVxBqT8vKUZJ8wC5gK40ASG5eGrk/V/A/RKTh8msnnrIwHgf3HWBdTvOobvv2wRuZMY+jXuFrZJl3hvlbZoZQ9ngirj4haRdUR1LT95E9D+aBejAkqJ6h6BTW6SAkC1qSEC1zjOMEpNl9bssUWTH+N78iKBgvQIxkf4OIeRLj226/JUm30lnzDlucVZLkxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYrqOL2HkNUlxYdwPifLiwqrjbMGwURY+c3E3QVrRJI=;
 b=gB+dRsqEccwbYvuaC58oeSdW7inhjO46hgAyvyVdaRxpLzbWgQCh6v6OSAZmNQDA2H+hZxlKc8x9j2Fz7SAdPsG122MBOA1IJsJAxaoMhXwXcNhVeqnLX4Wp2k9zKhFS9lgdR9P6bXas5PPpetrls99jHenNrtwR0qtK5rqCIqM=
Received: from BL0PR02CA0017.namprd02.prod.outlook.com (2603:10b6:207:3c::30)
 by CY8PR12MB7433.namprd12.prod.outlook.com (2603:10b6:930:53::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 22:56:21 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::1b) by BL0PR02CA0017.outlook.office365.com
 (2603:10b6:207:3c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Thu,
 15 May 2025 22:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:56:21 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:56:18 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <babu.moger@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
Subject: [PATCH v13 25/27] x86/resctrl: Hide the BMEC related files when mbm_cnt_assign is enabled
Date: Thu, 15 May 2025 17:52:10 -0500
Message-ID: <1f86fadfa4fa0cb7daae506a8b0c22c1c3632ddd.1747349530.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747349530.git.babu.moger@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|CY8PR12MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b4070c-a90c-4c03-c887-08dd9403b5d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z/rsb2sOo3yZgwVx/fOwI9+npU979TqYQ5rkh6TwE/PMktt0bontitSFhBWl?=
 =?us-ascii?Q?zJBwxYNhpCKgSHyH1wsC28fbYVm1yMWkUOG1W2q14DgXDJ7fyU74OUhU4Y/q?=
 =?us-ascii?Q?COg1kc3696bqjgUDCr1tStTkSrV9QgLeaUKv85jxhKOoTe64gkoN3c9GGkqg?=
 =?us-ascii?Q?brF6mCmQeqCM1NuGNAzjb+7OpAlReWrXemTzhqIgApPemeR+KPLOrvXtTe2u?=
 =?us-ascii?Q?Nexi3xr5dQ2teNg2FYOno0AdJO1Vd9s+mRarTKaqTeFkkdMFSdnjr7G9ey7m?=
 =?us-ascii?Q?og9oypGLJO/w3xuy4dTIIVdH3KX1RQRitEpLxnqvPrICq5LAnCH0rI2nxD+T?=
 =?us-ascii?Q?NsD/f4rau4WFLWyQ7dCn4lB23lTObztqMmCF3FRlhrrTg9Oz21GB7gTU4SHX?=
 =?us-ascii?Q?42yWr4djku4MAsLQJd4Jq/QBDlcXC5dK7xzNjvfpq9sNIICzVEDezkU91J1J?=
 =?us-ascii?Q?0XknMQs4R9OURRZe877/BzbiRjrZ9r/HsTj6WkIfm7CHGAS+q59oh9Wd/+fP?=
 =?us-ascii?Q?Kfe3470sRAILXmMOL+vhAbVKSdFXu6K3VFKTh1/WYvUtQf7IZymsB2t4vDHl?=
 =?us-ascii?Q?R0riUTqPxQl/agzMQFbzZpWC7RmAxnjngxMkELQamt1KNn6gHQ5W1xEtO+7h?=
 =?us-ascii?Q?E7wgdgkVzKUWzLCoXrBT+FDegMQKvKxYkdX5IrUeSeHDDVX9Kg9mYUFVpJmZ?=
 =?us-ascii?Q?6KpEW9VkKLbTIOV6JBhNyHY2sqAIP0p4LwI6am+j7OU3jHeA9NyqGMIgINv2?=
 =?us-ascii?Q?cLdE7hhf+vRCHmI8itWK5CrY2kHwekRRrl3Sl2i50bXKHcgTE+2DgtzGb7Ij?=
 =?us-ascii?Q?1xj+1EEcaWl+E+aoS3ATDMcin/9CxRfaDgsipItJbDKyJAXOTbnJCBsG+mpt?=
 =?us-ascii?Q?o0Mqoa1t7N5XiCBs0hqjIKRv2d/bzlylpJ7sNcB6oLswCQ460TMoq7GhYEq4?=
 =?us-ascii?Q?nYMFKmSwhZTLV030b1Asui8Zu8SKzTxMhxeNprjR0oqNzRpWVszm2+eiCAeW?=
 =?us-ascii?Q?f8HdMJoGJi7VhQ1tGuDuiO4mBDTYvP46lTIH6qrNBY3DACi1UTXJQ4fL5s9A?=
 =?us-ascii?Q?wjxfObu5yNCxSf1ZMKdO0oGjfKXWcVTMA0eCpaKHdHhiLwZqEkl1DmxRxIm9?=
 =?us-ascii?Q?jcvrcDxV4bDRhds8S11oipqDKIb/bjyuGbP88G79CqfOlRLMBV6U+kzsdGe1?=
 =?us-ascii?Q?ZNPJHFoE6Adzb6vy/EeBEJwhIzAirUl2WAAQvZ/iD+lU/W7M3rzPMDocLdhf?=
 =?us-ascii?Q?ZvgV6sDXkJ3bb8j6vFROgXJsybPM5kamWkQ4JGNOARbH02LsJCKXziHM6v2z?=
 =?us-ascii?Q?3c78xkYljCrM3nvdri2qHwr6RqpNvCN2W8VTijIC3Dzw81WGKbSN8ice61Ww?=
 =?us-ascii?Q?e/rCNodh5m5SnLPHl9IVlxb013lMSjfMHFhJuuo54Pe5RtLiBZLHZccxELGq?=
 =?us-ascii?Q?nJ8WRM0+vVg7FTSzviEn04q3G8CXbQbJMO2LBDG4q/cuwnyrOlWL3npuAxlf?=
 =?us-ascii?Q?SMSLsxch20DglyQ5kLoJy/j/QC81herFkOVe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:56:21.2201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b4070c-a90c-4c03-c887-08dd9403b5d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7433

BMEC (Bandwidth Monitoring Event Configuration) and mbm_cntr_assign cannot
be used simultaneously.

When mbm_cntr_assign is active, suppress visibility of BMEC-related files
to prevent confusion.

The files /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config and
/sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config will not be visible
when mbm_cntr_assign mode is enabled.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: New patch to hide BMEC related files.
---
 fs/resctrl/rdtgroup.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index ea1782723f81..d6bf2a50a105 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1815,6 +1815,33 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+static void resctrl_bmec_files_show(struct rdt_resource *r, bool show)
+{
+	struct kernfs_node *kn_config, *l3_mon_kn;
+	char name[32];
+
+	sprintf(name, "%s_MON", r->name);
+	l3_mon_kn = kernfs_find_and_get(kn_info, name);
+	if (!l3_mon_kn)
+		return;
+
+	kn_config = kernfs_find_and_get(l3_mon_kn, "mbm_total_bytes_config");
+	if (kn_config) {
+		kernfs_get(kn_config);
+		kernfs_show(kn_config, show);
+		kernfs_put(kn_config);
+	}
+
+	kn_config = kernfs_find_and_get(l3_mon_kn, "mbm_local_bytes_config");
+	if (kn_config) {
+		kernfs_get(kn_config);
+		kernfs_show(kn_config, show);
+		kernfs_put(kn_config);
+	}
+
+	kernfs_put(l3_mon_kn);
+}
+
 static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
 					struct seq_file *s, void *v)
 {
@@ -2815,6 +2842,10 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
 			ret = resctrl_mkdir_counter_configs(r, name);
 			if (ret)
 				goto out_destroy;
+
+			/* Hide BMEC related files if mbm_cntr_assign is enabled */
+			if (resctrl_arch_mbm_cntr_assign_enabled(r))
+				resctrl_bmec_files_show(r, false);
 		}
 	}
 
-- 
2.34.1

