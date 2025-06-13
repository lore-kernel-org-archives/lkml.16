Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE45927510C;
	Fri, 13 Jun 2025 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848967; cv=fail; b=hVX282VKi2NBn0xlkbB9j1q/mUiqRjlD6HbfKsRr92Sqs1VPZdUqZjpHXPVjC9EcB2WhWQuaZ11i0BkRlc6YCoB6CQPf1Hoj4aSSKXPi2utVnRL0eSpMYoJJT9Lgr8Yq7IkwYXOREWyUaU+mbALsyyfThICEYbuZdqaE+uxZ/o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848967; c=relaxed/simple;
	bh=zw7FZaom9Ph8L5nHH3s3hQidmgTfYhKX+FnEPsEFUIM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=to9zQi6s3j2JLm0whJttJqJYjUc4Ts59YTfIBKHmWYlAUEy2g33XJhwrEnJJk1dQv7zz1ucIuW5CgxyWkYC5JxhmSgVWIpNP+HGFD4fQTTzzkTrtu+RJJWwN445Vfff44/ajSvuhF0IAOYS73dgokZv1rbsrOd5oZu6ss8jZK5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Vcdu3njO; arc=fail smtp.client-ip=40.107.236.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Vcdu3njO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdCDMplxSJlR0tPqyaEGZoTrvoia+ZFOVxjaxbzXTlsy+aw4P6sreuwDsS95YK3VHwGEwwwueVKfaNq8BtUSUJ9FSU8jwDyyJkLHfKJV3WZF8iBVbJYCOLg59O5IsNn4y9KRreaouikI+xBEjGkBXTbJBHwwdgikqFCp4im0WX+wIiCduknQn35DuibUzy1K5FZmjE+t5nSIPt793Kjm9ZnRnKH4Xtxbrnl0KJIq3cKQrlveQH6l04J+GVtgUr5B0w6/Whs5MZ4h80YuZh5c6ttRE2UplopGhbCmuhCOesnTfHdvsZ2sMx4NzVBpTGJhHU4CdeBI0JCepXg5tbg25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTCi9Q9XdDT5NpRnq2dFHntjIKp/qcvDAJH3epD6EwA=;
 b=q2Li6Bqfz42TmSr2OgqWFtGV6U/MSwMW6FTxN2pzxzMHj+EWeVD/cReqfirbQP8r08qXSQDEs2ZhfSAHr/mxqWrqiCurk2DvJoess+oCcyU2Ofa4DouZtlly+eh24azKwZQ+nozHI32Jx41iwv/6ZqXB0EsP9SgN8qrlq82Bhn1eUsPTBmlL7tmMlh1oNpYV8dQG53LqFD5QR//trbWEVwYHaZocwbpNAHNOWoObuzZoqhYAg0SZT10zwW7hCA03yX7Dds7dIVAWl95eYEm8QYq+/7egE825Q3YlJydkvvqpBpkwM65WeGTfI8c08ILj7+VxcHCPb9cyGUHAZk1CMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTCi9Q9XdDT5NpRnq2dFHntjIKp/qcvDAJH3epD6EwA=;
 b=Vcdu3njOmL1Dk63D9SyV/Z5E7G8JU7W2lZPRrveKm4Ahcaim4zFwMqo2XaTkiXAOgxCcK8TaADpwe/BTrRP+H+Nm5JTUCWyfKWBQJX6E7ElFU27Cnu346wywH90sfZ+93ObnFnpK2AVN77RPHg3U7xKavGzQfpBbv+57XZreeK8=
Received: from DS7PR03CA0235.namprd03.prod.outlook.com (2603:10b6:5:3ba::30)
 by BL3PR12MB6521.namprd12.prod.outlook.com (2603:10b6:208:3bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.20; Fri, 13 Jun
 2025 21:09:22 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:5:3ba:cafe::1f) by DS7PR03CA0235.outlook.office365.com
 (2603:10b6:5:3ba::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Fri,
 13 Jun 2025 21:09:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:09:22 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:09:20 -0500
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
Subject: [PATCH v14 29/32] fs/resctrl: Introduce the interface to modify assignments in a group
Date: Fri, 13 Jun 2025 16:05:13 -0500
Message-ID: <1fa5ee1e36bb599ae33d772e7a3c40fd3a4abe82.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|BL3PR12MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d8c493-9c3b-4e1a-b7db-08ddaabe91f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjZJSG1UVHRQRUNSQzluclF0OUNCd3dJYW5hNmsrOW4weDdPRFgwWjZUWWlx?=
 =?utf-8?B?TWpLTjZMMnozaGxVbG1Jek8wbW9IRlFlczZJZjBCb0w0VlN1WlcySlVGRXNL?=
 =?utf-8?B?TjlRY01hcEpiVkwxanZtcmRyTG9jQU9wa0Q1THpySDdBRkZKdFFXSDQ3Ymh0?=
 =?utf-8?B?R1ZyUFVhSVdhV1pheEJXYlZWL0VYalZWcDlUVWJlanVEYW1lSEF1djhwL0sr?=
 =?utf-8?B?Rmw1N28xK2tGVUlhWXdXR2VlZ2wrbytqaXZ3ODV3N3c3UmNDQWFiUnZGM2pP?=
 =?utf-8?B?UllxSnpBZkRhM1daTHkvV0Q3U1R3QUhhWTlsRi9wc0FpQUZXMmRsaUR5UlJj?=
 =?utf-8?B?bXBlV3ExZnJRVERvK3lneXhuelpwYk9NSitYeWpGNXQ0NGU4a3dMZlJHZGpp?=
 =?utf-8?B?YVV2MzNXMVVhZFhodEU4NG5oK24yak8xaWdFSVkvSEljTmdibm1lNGd5b0R0?=
 =?utf-8?B?blY1aTdHTkVRcUErKzE0eHkvMGx0ZHZLZ01GWkQ4TGxrcW1OT1JvbW41WE9a?=
 =?utf-8?B?cnlZMmJwUGdVU1VQZTlWRDM1Rkp1NmhnYk9EVGk0R3lSa0RLNk9VUkRYdlow?=
 =?utf-8?B?WW85YkZDeVd0ZTFXZDExd3NhbXd6d2xNLy85bkFRM2hNYWVENjdhSlRJeHFV?=
 =?utf-8?B?aDdJa2tyNnRnMExwa0VtOTFOdE9xb3BmdXVQa2tuZlZaanc2dmJ2WVhXZ0xk?=
 =?utf-8?B?cFlqbmx3djhCK0h2clFFNVBsZHFqWS9hb29vellDRzZCV01NR2FjYWJlMXBo?=
 =?utf-8?B?M2lwZ2lmWXFENWVLRnFJb3BtN1QzUFJ2S1orbE0zeGVEb2VXL2Y1K2dZOWll?=
 =?utf-8?B?VlVDNVc1OXRrZ21kMnFvWnh4NUk0aXlFQzFzNFc3UHpXRUtMck9JMmlsbUVE?=
 =?utf-8?B?Y2QvdERmV3FzY0NBb2MrOWY1ZXhwUW83Z0tOSlN2U2VCMkxrT1pDdGc4L1o3?=
 =?utf-8?B?TjBYZHJwNmM0TiswNW8rTXdrZlpjcjd2Z2NzUHpxdEpQclFpVG05TDd1M2Fi?=
 =?utf-8?B?TTUvUVBTbityeUlkTGNqYkxvRWNjNjQybXkwQW5ldmdzbkpBZjdLVDVuU09v?=
 =?utf-8?B?ampCNEFaZUNoakh1OHRCcVdOdmUrSmUzNGE3b2ozdVNhMkQxa3VEV0xRYmNP?=
 =?utf-8?B?T2YxQ0puUlZvam41SjZEL2dBREgrMFJKYnoxejM2c2dObThvbG5hV1RIU3VJ?=
 =?utf-8?B?RUJyaXVUbFNPTm1TZ1RXRlRqOTdXbzl0WFhrb201S0M4MXNnMnZYQ3pPemJZ?=
 =?utf-8?B?MENkbXhDeUl3aGE5dDIvUUs2NlJhcjQvVzRneTRBR1p2TnlPamNGbkluVjhh?=
 =?utf-8?B?VUp0Y3gwOGZnR3BmNmZRZXNlZFBPSXNYVU0zWDVPSldFQ1MvTFZUcWgxVVBV?=
 =?utf-8?B?bWNneCswRDk2dWFVcWpUZlQzK3FmRk4vSzFpRS9oV0JwNFhaNHY0cGQxdit1?=
 =?utf-8?B?OG9LU0FVOHZrbnFmaXFRN0xjcDR2ME1qQzZxOUlCdElzelliVVNnTys3dS9P?=
 =?utf-8?B?QU45aWVxR3lReFJUZExsOGFXNUc5MGRrVHJXamdEL1ZLcXl4aG50NkN3WnI1?=
 =?utf-8?B?b0RwbTgzc1FyeUg4bkJGanUzay9WR0czYnN1UC91ei85KzFkSUF4MXVhbVVa?=
 =?utf-8?B?NzN3bkdVdkZBRE1BSFBqTTVXd2RiTUlxREh1SlZhUm8zQmlTTXlEbHZxZUtF?=
 =?utf-8?B?dnFGTW92UXFPWUNIVjRwRzl4elRGNzNJL01LSjdVVXJzWStHdDd6MHcrZXBB?=
 =?utf-8?B?MUl0cmNOWnJNbVVqbmxYbUZINng4OTdtQVNBbkFFU3hRQ3ZQbklvWWFkcDdV?=
 =?utf-8?B?bEJjd29sTDI4cEVFWG9Bekp2TkZMZVg3SGlZQWViUlAvYytOekFkdCs2ZzAz?=
 =?utf-8?B?LzFUbDdtZEo4NUVrMm1zb25tOVc5RGszQUtxSHVKdnNBQ2xFdXhHaUQyUEFQ?=
 =?utf-8?B?bkc0RUFsTHpRMjVXNjVMb1NQdmdPMXB5eFN4T2xYVExaRVBGRWN3VWZHNU5I?=
 =?utf-8?Q?S2qfPxC44PDI6TIzSSiLxHat5qyprk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:09:22.4798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d8c493-9c3b-4e1a-b7db-08ddaabe91f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6521

Introduce the interface to modify assignments within a group when
"mbm_event" mode is enabled.

The assignment modifications are done in the following format:
<Event>:<Domain id>=<Assignment state>

Event: A valid MBM event in the
       /sys/fs/resctrl/info/L3_MON/event_configs directory.

Domain ID: A valid domain ID. When writing, '*' applies the changes
	   to all domains.

Assignment states:

    _ : Unassign the counter.

    e : Assign the counter exclusively.

Examples:

$ cd /sys/fs/resctrl
$ cat /sys/fs/resctrl/mbm_L3_assignments
  mbm_total_bytes:0=e;1=e
  mbm_local_bytes:0=e;1=e

To unassign the counter associated with the mbm_total_bytes event on
domain 0:

$ echo "mbm_total_bytes:0=_" > mbm_L3_assignments
$ cat /sys/fs/resctrl/mbm_L3_assignments
  mbm_total_bytes:0=_;1=e
  mbm_local_bytes:0=e;1=e

To unassign the counter associated with the mbm_total_bytes event on
all the domains:

$ echo "mbm_total_bytes:*=_" > mbm_L3_assignments
$ cat /sys/fs/resctrl/mbm_L3_assignments
  mbm_total_bytes:0=_;1=_
  mbm_local_bytes:0=e;1=e

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Fixed the problem reported by Peter.
     Updated the changelog.
     Updated the user doc resctrl.rst.
     Added example section on how to use resctrl with mbm_assign_mode.

v13: Few changes in mbm_L3_assignments_write() after moving the event config to evt_list.
     Resolved conflicts caused by the recent FS/ARCH code restructure.

v12: New patch:
     Assignment interface moved inside the group based the discussion
     https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/#t
---
 Documentation/filesystems/resctrl.rst | 146 +++++++++++++++++++++++-
 fs/resctrl/internal.h                 |   9 ++
 fs/resctrl/rdtgroup.c                 | 157 +++++++++++++++++++++++++-
 3 files changed, 310 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index a232a0b1356c..cd82c2966ed7 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -527,7 +527,8 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
 	Event: A valid MBM event in the
 	       /sys/fs/resctrl/info/L3_MON/event_configs directory.
 
-	Domain ID: A valid domain ID.
+	Domain ID: A valid domain ID. When writing, '*' applies the changes
+		   to all domains.
 
 	Assignment states:
 
@@ -544,6 +545,34 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
 	   mbm_total_bytes:0=e;1=e
 	   mbm_local_bytes:0=e;1=e
 
+	Assignments can be modified by writing to the interface.
+
+	Example:
+	To unassign the counter associated with the mbm_total_bytes event on domain 0:
+	::
+
+	 # echo "mbm_total_bytes:0=_" > /sys/fs/resctrl/mbm_L3_assignments
+	 # cat /sys/fs/resctrl/mbm_L3_assignments
+	   mbm_total_bytes:0=_;1=e
+	   mbm_local_bytes:0=e;1=e
+
+	To unassign the counter associated with the mbm_total_bytes event on all the domains:
+	::
+
+	 # echo "mbm_total_bytes:*=_" > /sys/fs/resctrl/mbm_L3_assignments
+	 # cat /sys/fs/resctrl/mbm_L3_assignments
+	   mbm_total_bytes:0=_;1=_
+	   mbm_local_bytes:0=e;1=e
+
+	To assign the counter associated with the mbm_total_bytes event on all domains in
+	exclusive mode:
+	::
+
+	 # echo "mbm_total_bytes:*=e" > /sys/fs/resctrl/mbm_L3_assignments
+	 # cat /sys/fs/resctrl/mbm_L3_assignments
+	   mbm_total_bytes:0=e;1=e
+	   mbm_local_bytes:0=e;1=e
+
 Resource allocation rules
 -------------------------
 
@@ -1579,6 +1608,121 @@ View the llc occupancy snapshot::
   # cat /sys/fs/resctrl/p1/mon_data/mon_L3_00/llc_occupancy
   11234000
 
+
+Examples on working with mbm_assign_mode
+========================================
+
+a. Check if MBM assign support is available
+::
+
+  #mount -t resctrl resctrl /sys/fs/resctrl/
+
+  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+  [mbm_event]
+  default
+
+mbm_event feature is detected and it is enabled.
+
+b. Check how many assignable counters are supported.
+::
+
+  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
+  0=32;1=32
+
+c. Check how many assignable counters are available for assignment in each domain.
+::
+
+  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
+  0=30;1=30
+
+d. To list the default group's assign states:
+::
+
+  # cat /sys/fs/resctrl/mbm_L3_assignments
+  mbm_total_bytes:0=e;1=e
+  mbm_local_bytes:0=e;1=e
+
+e.  To unassign the counter associated with the mbm_total_bytes event on domain 0:
+::
+
+  # echo "mbm_total_bytes:0=_" > /sys/fs/resctrl/mbm_L3_assignments
+  # cat /sys/fs/resctrl/mbm_L3_assignments
+  mbm_total_bytes:0=_;1=e
+  mbm_local_bytes:0=e;1=e
+
+f. To unassign the counter associated with the mbm_total_bytes event on all domains:
+::
+
+  # echo "mbm_total_bytes:*=_" > /sys/fs/resctrl/mbm_L3_assignments
+  # cat /sys/fs/resctrl/mbm_L3_assignment
+  mbm_total_bytes:0=_;1=_
+  mbm_local_bytes:0=e;1=e
+
+g. To assign a counter associated with the mbm_total_bytes event on all domains i
+nexclusive mode:
+::
+
+  # echo "mbm_total_bytes:*=e" > /sys/fs/resctrl/mbm_L3_assignments
+  # cat /sys/fs/resctrl/mbm_L3_assignments
+  mbm_total_bytes:0=e;1=e
+  mbm_local_bytes:0=e;1=e
+
+h. Read the events mbm_total_bytes and mbm_local_bytes of the default group. There is
+no change in reading the events with the assignment.  If the event is unassigned when
+reading, then the read will come back as "Unassigned".
+::
+
+  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
+  779247936
+  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
+  765207488
+
+i. Check the default event configurations.
+::
+
+  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter
+  local_reads,remote_reads,local_non_temporal_writes,remote_non_temporal_writes,
+  local_reads_slow_memory,remote_reads_slow_memory,dirty_victim_writes_all
+
+  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
+  local_reads,local_non_temporal_writes,local_reads_slow_memory
+
+j. Change the event configuration for mbm_local_bytes.
+::
+
+  # echo "local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads" >
+  /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
+
+  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
+  local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads
+
+This will update all (across all domains of all monitor groups) counter assignments
+associated with the mbm_local_bytes event.
+
+k. Now read the local event again. The first read may come back with "Unavailable"
+status. The subsequent read of mbm_local_bytes will display only the read events.
+::
+
+  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
+  Unavailable
+  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
+  314101
+
+l. Users have the option to go back to 'default' mbm_assign_mode if required. This can be
+done using the following command. Note that switching the mbm_assign_mode will reset all
+the MBM counters (and thus all MBM events) of all the resctrl groups.
+::
+
+  # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+  mbm_event
+  [default]
+
+m. Unmount the resctrl
+::
+
+  #umount /sys/fs/resctrl/
+
 Intel RDT Errata
 ================
 
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index ed0e3b695ad5..14d99c723ea5 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -51,6 +51,15 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
 	return container_of(kfc, struct rdt_fs_context, kfc);
 }
 
+/*
+ * Assignment types for the monitor modes
+ */
+enum {
+	ASSIGN_NONE		= 0,
+	ASSIGN_EXCLUSIVE,
+	ASSIGN_INVALID,
+};
+
 /**
  * struct mon_evt - Description of a monitor event
  * @evtid:		event id
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 18ec65801dbb..92bb8f3adfae 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2129,6 +2129,160 @@ static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file
 	return ret;
 }
 
+/**
+ * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
+ * event name.
+ */
+static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r,
+						 char *name)
+{
+	struct mon_evt *mevt;
+
+	for (mevt = &mon_event_all[0]; mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++) {
+		if (mevt->enabled && !strcmp(mevt->name, name))
+			return mevt;
+	}
+
+	return NULL;
+}
+
+static unsigned int resctrl_get_assign_state(char *assign)
+{
+	if (!assign || strlen(assign) != 1)
+		return ASSIGN_INVALID;
+
+	switch (*assign) {
+	case 'e':
+		return ASSIGN_EXCLUSIVE;
+	case '_':
+		return ASSIGN_NONE;
+	default:
+		return ASSIGN_INVALID;
+	}
+}
+
+static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
+				  char *event, char *tok)
+{
+	struct rdt_mon_domain *d;
+	unsigned long dom_id = 0;
+	char *dom_str, *id_str;
+	struct mon_evt *mevt;
+	int assign_state;
+	char domain[10];
+	bool found;
+	int ret;
+
+	mevt = mbm_get_mon_event_by_name(r, event);
+	if (!mevt) {
+		rdt_last_cmd_printf("Invalid event %s\n", event);
+		return  -ENOENT;
+	}
+
+next:
+	if (!tok || tok[0] == '\0')
+		return 0;
+
+	/* Start processing the strings for each domain */
+	dom_str = strim(strsep(&tok, ";"));
+
+	id_str = strsep(&dom_str, "=");
+
+	/* Check for domain id '*' which means all domains */
+	if (id_str && *id_str == '*') {
+		d = NULL;
+		goto check_state;
+	} else if (!id_str || kstrtoul(id_str, 10, &dom_id)) {
+		rdt_last_cmd_puts("Missing domain id\n");
+		return -EINVAL;
+	}
+
+	/* Verify if the dom_id is valid */
+	found = false;
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		if (d->hdr.id == dom_id) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		rdt_last_cmd_printf("Invalid domain id %ld\n", dom_id);
+		return -EINVAL;
+	}
+
+check_state:
+	assign_state = resctrl_get_assign_state(dom_str);
+
+	switch (assign_state) {
+	case ASSIGN_NONE:
+		ret = resctrl_unassign_cntr_event(r, d, rdtgrp, mevt);
+		break;
+	case ASSIGN_EXCLUSIVE:
+		ret = resctrl_assign_cntr_event(r, d, rdtgrp, mevt);
+		break;
+	case ASSIGN_INVALID:
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		goto out_fail;
+
+	goto next;
+
+out_fail:
+	sprintf(domain, d ? "%ld" : "*", dom_id);
+
+	rdt_last_cmd_printf("Assign operation '%s:%s=%s' failed\n", event, domain, dom_str);
+
+	return ret;
+}
+
+static ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
+					size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdtgroup *rdtgrp;
+	char *token, *event;
+	int ret = 0;
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+
+	buf[nbytes - 1] = '\0';
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+	if (!rdtgrp) {
+		rdtgroup_kn_unlock(of->kn);
+		return -ENOENT;
+	}
+	rdt_last_cmd_clear();
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_event mode is not enabled\n");
+		rdtgroup_kn_unlock(of->kn);
+		return -EINVAL;
+	}
+
+	while ((token = strsep(&buf, "\n")) != NULL) {
+		/*
+		 * The write command follows the following format:
+		 * “<Event>:<Domain ID>=<Assignment state>”
+		 * Extract the event name first.
+		 */
+		event = strsep(&token, ":");
+
+		ret = resctrl_process_assign(r, rdtgrp, event, token);
+		if (ret)
+			break;
+	}
+
+	rdtgroup_kn_unlock(of->kn);
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2269,9 +2423,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "mbm_L3_assignments",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= mbm_L3_assignments_show,
+		.write		= mbm_L3_assignments_write,
 	},
 	{
 		.name		= "mbm_assign_mode",
-- 
2.34.1

