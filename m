Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EDB272E44;
	Fri, 13 Jun 2025 21:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848976; cv=fail; b=Gi9XDcDUezUHhYcuzqmtjXuvAyebX8egzDs6t5rbdZ3uGPG2jfRgxlCWn1QFjbkrT0eLbIwS+z0U3JsnFcRh2DIV4gEb8FzJPc+xsJ/8jgXE6uZGZLeulSVCoG1hr4bYL0ga8mwFFn+1MOLeuU1CU08PCMdxzdg9Q8M5Yb5sob4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848976; c=relaxed/simple;
	bh=utRTbmMjuoseKIyi2mgUgb2CbbO0aZVIVlu38P0Dr9Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LJC1MizmcuKkhW75j8kf7x7IxRYcvmxFDYFn/ibqXGlcseHPcjFbIGAat9cIUmWNruHZI1K778w3PLPmZUY/DKST2zt4xyjdm1950lIL8UDEi2CDp3H9nabK2C/pKJgcM6fIGeefcktHN/VsXbKl8bxAyNvgIPtsAmX/5QTyPhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HMNKX3Nr; arc=fail smtp.client-ip=40.107.220.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HMNKX3Nr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/STXoYkuTtX6AjvzjzDEINWRZtaCtRXBRmlXUj+twecIAPIJkTJZBHcMTn3e/qpAqSBAffvDdYF3H6djhj97d5oUeCshZF/N7GDlXk166u7+ITOHd0vDOJOOm5nBu6wP8RkbavZ3zJ/hoXoEvxSCfOtLe+KrH1NI5K1ubQs1VuwtcH0jXDr480nloHSJhRYIU9Lsg3zPPvej0/NXM/uQPRLxEWsQkRmXKTyJ0F6HOkbR5tIeG3n/j+uT6bNgAvFiI7Z5EK2X4e8K6izaEXFo7bV2ZATk1MF7O756bmrgjcfeC28sXdypJyrfkH89AaTVWFg+3QQ8IP/icUNZ99LGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcTzM5XN3l3Sd7lFf4fpceqrazo3z+vZ2R/RzQSq6C4=;
 b=LjQKF/HunMbX9v7iSeJwanOSswFD7diUkz2YKj8aBbxw3QYufLv72cOGx732l3ZCd3uOT1ZyVLJJRF2fnTGX0zTfhQVB3aIBz//NcX9KxG6ROMfpVnVCxlKsRkSlyWAZhVS8oFzWnJe4tDi9Nka/+vZz0gWDZic3FnPq1e901WnhDirjaUt6v5kMsJyUD0NIFMVDtL+hySdBLuBiK1zSgLFmGus0Q4Rx1JJPdA46ndVqsRzYzkp/Nd9qCQlg4nc0ADOJwzv79quD9LJWI/mVHqt2puck53cBuEfJIB1kN7FJCYWxXyWkvqfhGfCxgqX9m206MKjUveizdxhFocVMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcTzM5XN3l3Sd7lFf4fpceqrazo3z+vZ2R/RzQSq6C4=;
 b=HMNKX3Nrpo1yvQWToVOhD01fyPlZ0uu6f8z5UNg6j1Se58fe2jJjrvTO14iQ+YenSaqZET22BZ3695iRMNVqgRJiLh+wLonmHxOFn6Uzo3+v1w9qHAEiQaAxJfz4wWEdZUh9NeBw3DqVDlFEhdaHa/eSMYOxNn9KNcdx+FkDxPA=
Received: from DM6PR02CA0103.namprd02.prod.outlook.com (2603:10b6:5:1f4::44)
 by IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.43; Fri, 13 Jun
 2025 21:09:30 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::be) by DM6PR02CA0103.outlook.office365.com
 (2603:10b6:5:1f4::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend Transport; Fri,
 13 Jun 2025 21:09:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:09:30 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:09:28 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v14 30/32] fs/resctrl: Hide the BMEC related files when mbm_event mode is enabled
Date: Fri, 13 Jun 2025 16:05:14 -0500
Message-ID: <4769751d1de7c4f66b1c7f3c5ea7eeeb49951363.1749848715.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749848714.git.babu.moger@amd.com>
References: <cover.1749848714.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|IA1PR12MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: e89d6cb4-be5a-403b-9b0a-08ddaabe96b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WURGYm1lM2JKb3UxbjczTTVLTCtqMnRLVzRhT05VS2M5QVIydDh3WUdjOEdI?=
 =?utf-8?B?c2t3eGUyYXpBN2kxR0pPdEZnbTNhV3VmVUtSaFkrWlZrN2lCaUdUclpRL1k2?=
 =?utf-8?B?Z2FLQlpBb1hPclY0L3dTY2ZMRXQweEpyYjk1cGdQOXV5ZUNWeFlmU1VlS0lU?=
 =?utf-8?B?NFI5YWlKb3RvNTN1ZytVcE1aZDltek9oRm5hSVFwd1IyazdSblNWaGV0dDZE?=
 =?utf-8?B?MldPc2QvRHR4anUrbzBHWUtyNnVleDlWcjJIbnFUMGFWSnlUcHFvWkt4N1VM?=
 =?utf-8?B?NXBLL1JTUmpTOGhlTXZ2MWszMGhYSnJpeEd1bHRPT3duQjl5bTNYRll4dGsv?=
 =?utf-8?B?T25wci9sSXpjNTQvSEhEakpUOVJGbW9pSjBxMExpT3Nac0FiU0VualU0SzdC?=
 =?utf-8?B?am55aTJDeWNmMFFoK2tYS0JuZ1NYMUw0VkpDd3QxRmplVE4vcXRoODZienNz?=
 =?utf-8?B?N2RRWFNPaGgrai9zN0JKSGVtOVJVdUtLcERvNGV3b0R3WFVqZTBjQmxjMjRi?=
 =?utf-8?B?Szl4T3lrbjdwWG01aXhEYUVmd0RsZWZEOVFoSVZsa29tM1dJb1JrNmo4K29u?=
 =?utf-8?B?QjRwL0NHby9aelVQL09tS28zZEM4Ujl0TGcrRDF5MDgycDl1aUg5cUt2a1pR?=
 =?utf-8?B?ZEJFeDBCTXJlbGRwbW9Ndm5nRVZVdS9oSXBQY3NDRGVFdDF0UnRFK2xnOWp3?=
 =?utf-8?B?VDBEMFBPaVVhYzRKTUtxUmpCSFZleXl2Zmh4bUlLS2NaUmJyK1k0VG1mMGJw?=
 =?utf-8?B?cEhKVUZHSFlkNEN3bDZCbUg1elQ5MEJxNFBYSm5zN2pZd2RvcWtjWjBFRmR0?=
 =?utf-8?B?QnVQUG12dU53QklNLzExbEYyZ05sWHZCS2M4VGRIR1JqRlRJSExhdVRkYVg4?=
 =?utf-8?B?Qzk0YmR1U0tKRFJQczByc0VVVlh2dWNvbHp5R29tSzYrNVNRNlVMakdFVzg1?=
 =?utf-8?B?YkVXVmg2OFNXMWxTOVYvMW1HamdoTXBialhHeGFEa1dGZHFTMWM0RkdYNHJP?=
 =?utf-8?B?bkdoMXkrNDloenBFOEJNekc1OHpneUQzVE1tbGk2YkJTb3FoZ3Q1Smgzb3Yv?=
 =?utf-8?B?WVBFYTVoTm5UNVBEVWdqNTRsTm81UTFvbk0yM0dxVUkzMHNoTUt1M0FXQ2Zp?=
 =?utf-8?B?cHFFMmpuNi9WbW9NaGFabmtudSs4ZE14RGlNeVlIdlE3WmpsNWl4NGtRTnRB?=
 =?utf-8?B?b01aMEROTXVzOTRkT2tiRnVSVkNMMUMyNjV0c0QxVlNaY1ZsQVhwVHRudFUz?=
 =?utf-8?B?UU9hYVI2M29JTlo4WlpqMm56N2llckFBazkrZkIwQjZjQkJrSlZqOFovTzVX?=
 =?utf-8?B?RFJtMnhRdGRVQjRRVmRVcXg5YkRsNUZsM3FLMEtIVlVVUGZGaGQraDM2UjM5?=
 =?utf-8?B?bWhKNEhGTStCNVZrdnZ0VzJQY0tLQzViTStwQ2o1V29oNFkyZDEyVmtiN0hG?=
 =?utf-8?B?TlE2UGhzSlcycVVUdVVqVzh5a0dTTnVqendSQXh5dEZoNUhOSzhnVjVRVzNj?=
 =?utf-8?B?OUhCTXZRMERVRWxrMCtJUkhGOGpGR0NkellVTjZuTlJQT1VRSjlTdVg3ZzlL?=
 =?utf-8?B?TFQwTmdMSXkyVjllb01KdFZQWXNWNXlQOWIzTHZoZXNEeTZ6SUNDY0JXd01F?=
 =?utf-8?B?eWgvQ2pQYnhTSGErQ2dBVHVZZm1mRU96UUVEdlBERCtXUzlkdDFNYlhYU0Y0?=
 =?utf-8?B?Y0ZoYzh2Z08zTnk1RW5JRVF2UENlKzZmSFpQY0dMWEd4a2dSRFRocHlvY2c4?=
 =?utf-8?B?cytNdUk3aUFaNnF0QnRMYmJCWHhLcVMvMGpWdWNLajMxcW5yaG4yUEV0bVJx?=
 =?utf-8?B?SGFSYUwvNXFxVFVBOSs5MXR2VC9KdThITGsrKzRsRHpZRDlxRzJzUEpyUSth?=
 =?utf-8?B?SGM2dmtRZDV3SHJpbW5kekdsbFdKRWxNWDh3d3UxOUNkVUI0dFIvRmx6MVdt?=
 =?utf-8?B?ZVU5RE5WdVFkVmRhRFVnMklWYWc4eE9jbVZEZWwrR0JxZlpFZ2Y4akRmQmpW?=
 =?utf-8?B?YjJvSERLc2NmbzVCU0NXR2FjZldIT0pqaDlueGZRVHgyZG82RGJ3cmlzU2dK?=
 =?utf-8?B?ekdrMFZSOE9qUTVQM2wrZzE4ejhZMTUxeTF0dz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:09:30.4319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e89d6cb4-be5a-403b-9b0a-08ddaabe96b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626

BMEC (Bandwidth Monitoring Event Configuration) and mbm_event mode do not
work simultaneously.

When mbm_event mode is enabled, hide BMEC-related files to avoid confusion
and update the mon_features display accordingly.

The files /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config and
/sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config will not be visible
when mbm_event mode is enabled.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Updated the changelog for change in mbm_assign_modes.
     Added check in rdt_mon_features_show to hide bmec related feature.

v13: New patch to hide BMEC related files.
---
 fs/resctrl/rdtgroup.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 92bb8f3adfae..8c67e0897f25 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1164,7 +1164,8 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
 		if (mevt->rid != r->rid || !mevt->enabled)
 			continue;
 		seq_printf(seq, "%s\n", mevt->name);
-		if (mevt->configurable)
+		if (mevt->configurable &&
+		    !resctrl_arch_mbm_cntr_assign_enabled(r))
 			seq_printf(seq, "%s_config\n", mevt->name);
 	}
 
@@ -1813,6 +1814,38 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+/**
+ * resctrl_bmec_files_show() — Controls the visibility of BMEC-related resctrl
+ * files. When @show is true, the files are displayed; when false, the files
+ * are hidden.
+ */
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
@@ -2808,6 +2841,13 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
 			ret = resctrl_mkdir_counter_configs(r, name);
 			if (ret)
 				goto out_destroy;
+
+			/*
+			 * Hide BMEC related files if mbm_event mode
+			 * is enabled.
+			 */
+			if (resctrl_arch_mbm_cntr_assign_enabled(r))
+				resctrl_bmec_files_show(r, false);
 		}
 	}
 
-- 
2.34.1

