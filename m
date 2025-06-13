Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7D26D4F1;
	Fri, 13 Jun 2025 21:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848741; cv=fail; b=RTexOa4HwTpUyiUb1sr0bGBITIQ45swC+UQIToNF83nz2Jp0CBpHPTK72cuPejV1eh89Sw5ya2EN5jgPwBwaitgoKVuD+Z2YL1IGqy1CXw6TqqXryfto29m+M1k2tKs9a/gD+F999+zXNPf6d6Ko4Xn+3RWkSiVOj4hzq8dj3xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848741; c=relaxed/simple;
	bh=ymzy7xgh6rjML8YdGPyDyid7V0atIAUgaH6/rUlNFHU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IJxoR2Ut35AUC/RL0XC2H8JRHpikT+NHKujK2610jxWamUfy+shxkVj0aNUjqMrTeMuTM5XhwHKZT2iEdV2ThxrD+Idi9FBLDKxYZ5zsjSLHjfVkNXwsITGqU4S6EOMTCSasI61oE/4QyUGeEnu9MUOEMKIviEK2BQmNQcWVohQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CTdx7ANh; arc=fail smtp.client-ip=40.107.244.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CTdx7ANh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phM1fZhf9sf+aLfYfAZGto8K4wBp8+ONFBxxzS0BXNy3UPM9So0DZztdquj4tiLeSEuAjw6OzTdoHN068gKRLFZbXhZ4FAYPNPgq7dR+u2ri1J35snpAODpk4c9oBzTWTKRrOImya568VmsrJCVrrGkqwqs4CLuYKWoHq0kwmZ1t6sMdFYKKf5odb4FQYpNx5iaE939cmtNxsUvsY4c8B2Ha7XNS5yrg2dzcVyk44/Wt2+EQa3tni9M4eg24UWlp9PvN96br7I5WA5z7FgzqgI0TtBsvLa59w7dR0E0qXaT744x6G9VD6w8ha1gMEKymCT0lIiCdRIWQ3oHggFbR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge8rASGgKiYIiDpRV15sb65HckMVwAtw3gJ3tzHav0w=;
 b=nMzA0cunZrZJYTjTrRhXIhskWw6DJXnu+8IrrvlACMtvCxCvvqQvqXpHIWonO28esA3J9BK4xjfXe+xXjcFOPGhZO52xOwECK1E3ZnD4H/Ov7dwCTqj6JkgwPvIqFm9vBUKf4HKaQA74EJoRVZ0Kn8XSElupfLDVytvjJpneYqYFcMhdQiAcgMAxG5uyD+aIoBTXCVdOfJvhADs64fe7/oCkZ4+OJU6BAIyzO89sKbic/j0RUCBeFZePaeTvPF3C2rzqXUKbfnQGoWMXTn8uyJfMSG5Zi+HLcCKdezO94Xq2Y9ycp6D9XCrjAREnS/wx+nMGOWEDUkSq0L/a/Cy+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ge8rASGgKiYIiDpRV15sb65HckMVwAtw3gJ3tzHav0w=;
 b=CTdx7ANh7jshN/hHZbT3WQ4o7fYE03cT7W2We9ymO0v3Tf+IJsUlsrEReqlzCU2erzwMGpZYouXkw61oBR8WGFLa0XhjnikQEfNlh9wutssayRZAb2hVoPxgr+m1Wfda/Lw2jEMx14G3mpxgxLg6AhJUexmKNeANniFD7/ZqGa8=
Received: from BY5PR17CA0028.namprd17.prod.outlook.com (2603:10b6:a03:1b8::41)
 by BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 21:05:35 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::ec) by BY5PR17CA0028.outlook.office365.com
 (2603:10b6:a03:1b8::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.40 via Frontend Transport; Fri,
 13 Jun 2025 21:05:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:05:33 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:05:31 -0500
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
Subject: [PATCH v14 00/32] fs,x86/resctrl: Support AMD Assignable Bandwidth Monitoring Counters (ABMC)
Date: Fri, 13 Jun 2025 16:04:44 -0500
Message-ID: <cover.1749848714.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|BN5PR12MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: c53ac544-2678-49a1-5c0c-08ddaabe09b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SytFbzB4MFM4LzMwRnVKVkp1dlU0eHhNMFhjQmZ0eG1JWG1aYk5pZ2h5ZC9T?=
 =?utf-8?B?V01YUlVoMVpsREdCL1ZmRDVjU2dHZFhNSFFHMlczTU0xTzM4bVhaRXExSVRr?=
 =?utf-8?B?b3BaWHgyNVo2V1UxN1VDaWo0bHFiVG9wc2RIcXk5SnBrZGo3RWpTd3pVcmxM?=
 =?utf-8?B?eC9DejdvVFpIMmdjNXJKQzM5d1QxVGFpQUhnVXVyNVN4b0xieERVMFhpNktw?=
 =?utf-8?B?Y25WR1IvZVhBck1OWWZaSVhtZW9MWjJPWHVzakxXS1VGMmFYQjdLZHR0TEla?=
 =?utf-8?B?ZG9ITkh4NkpxeExCRURPZEhNSlRrNUFoVnRYMDlKalg1Y2xOcnFUc2R4VTZL?=
 =?utf-8?B?M0JwcWtwV2lXTUMyTXRUQW1lcFpwNDROeHU3UVhZY05yTERnMmZzRm5kVzFZ?=
 =?utf-8?B?bmI5WGlkeFphMTllNlRHdUJBVnZ5c2UvWkNaaXU5TGNnUTMvQVJGb3EySVdO?=
 =?utf-8?B?a0Mwd2NJTGFEZDRieXk3R1NVNis3MmFBd3ViV0M0ajFaT2lSSVNiNEVBVmJL?=
 =?utf-8?B?WWhlTmQ0eTI5eml6Z1BobmRneVZaTVBicEZEZXJRRklrcGhSSjVobHk4a0Ez?=
 =?utf-8?B?MDhlMnNFUkdRTlpucVpKUzAxdTJuQjQyNXdMOEpGa1IvSXZLWjMwSWZTVjd4?=
 =?utf-8?B?emtlaGltT21LK1I0cFdMd24yd0VzRlJ5ekg5Q2hLVzVLOUVEbWxBTGQxSGM4?=
 =?utf-8?B?aTlnWTNlUlZFVjh4Q1pickRWei8xak9ubGZxeFQ2emNTaWczQUdsVENjSCtU?=
 =?utf-8?B?RHRaeUNaRmxtOGxaS2V4TmMwTkUxRlY1UDl0aFBZeUp0dnpBZGh0dlNCOVFB?=
 =?utf-8?B?b29TVG91QU9veTNHVTBFcHdjMndvZ0ZKTmdTM09jQ0xRSnlJRm5ESXVVOGM5?=
 =?utf-8?B?ZVBHMCtwN1EzeFM5L0pNK09vcU5icGsxakpHWTg3NytyMUk4KzBPU1JLUk40?=
 =?utf-8?B?bEMrRDI3ZThnaG5xZVBlVHg3U2JuWkE0SzJkVUpuS0k1QzhxczBHQjlqRlNQ?=
 =?utf-8?B?dWlVK2JiTW1KTlpWYWdoY3ErRVgyWHBCUTRuYXpoMldTZXIydHZOdVJmcW1M?=
 =?utf-8?B?VmZ0K1JoaG1qSnRVT3g3MUwwcERXRU5TR2hpMHBRRWFQRW00MEJpM3lKdmdB?=
 =?utf-8?B?S2pQVldpd1NYM3JFR1NqQi9XRno0NG9wSVNFYlN0QTh4SmpKMkdwNlU0YkZN?=
 =?utf-8?B?bVVhelp0NDBFbU0xU0psV2tCanVuMVd3cGZSU2NlLzMzZjRNL2VqOHc4ellp?=
 =?utf-8?B?Z0dKc3hNLzloUEtubVNYTGtQNUQ1ZGEyZUhyaW5td1ZRM1pLd2dhU1dMNld4?=
 =?utf-8?B?dThoUUVscnJDMkNRWTM4bEloUWpZUFFLSXZZcXMwYm9SdzJHeVJTZ1lJKy9F?=
 =?utf-8?B?L1J4WWIxRHBKUDI1cTNXQ1B6dTN1Rm9qRm9meFN5NExiQXZ0KzBqYisxY2M2?=
 =?utf-8?B?eGdxakxqQ09xcVlyL2xXK1Q3RFdlQkMrVURvdk1pUkpKcXIzemRzaGcrUTI2?=
 =?utf-8?B?NEpIakUwS1oxZytZY3piS0t2VDQ1end3UjBlTHlBOTJLekY5MFVJNW9SK2Er?=
 =?utf-8?B?c000SmNZVmxpY0hKTFdBOE5SL25SYlcyNlpTT3E1c3V6K202ZXVyMWxjRjlF?=
 =?utf-8?B?M2NVdkhiaDY5WUhQV2ptZDkrdHdPMXRxSGdMeTJBVmcyRlRqTm1aUE42QU01?=
 =?utf-8?B?OXJzWVhWTndXTGNYQWVTNjh6M1BBcHgrUDVpeEwyeTJ4WmdVdzVpd1MrNnBS?=
 =?utf-8?B?ajlwSzFuTUV2N0JNdEZ3SFNuUkhxd3Ztb0VSOVFkYkNCU1RoMC9FaUVaZnMr?=
 =?utf-8?B?VFBrMVFId01TdnRqNUhsSEl6djVSREgyUk5iVTltTnpSbjhLTmp6VDNyaFgz?=
 =?utf-8?B?WDdRbkZINXViUmpVUktWb1R0SnluL2pnTHpRSS9SQzVNekE1NndzSWZCVDZO?=
 =?utf-8?B?VHNSRmhLN2VGTVcyMWxoQzFEMmh5cXRiUEhheXdIalNzSVZKWExEQ2pUNDA1?=
 =?utf-8?Q?hlcdhm8zDxvb9Hd+U5MoLZi/8J6efU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:05:33.9059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c53ac544-2678-49a1-5c0c-08ddaabe09b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9511


This series adds the support for Assignable Bandwidth Monitoring Counters
(ABMC). It is also called QoS RMID Pinning feature

Series is written such that it is easier to support other assignable
features supported from different vendors.

The feature details are documented in the  APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC). The documentation is available at
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537

The patches are based on top of commit
b75dc5e1399df (tip/master) Merge branch into tip/master: 'sched/core'

# Introduction

Users can create as many monitor groups as RMIDs supported by the hardware.
However, the bandwidth monitoring feature on AMD systems only guarantees
that RMIDs currently assigned to a processor will be tracked by hardware.
The counters of any other RMIDs which are no longer being tracked will be
reset to zero. The MBM event counters return "Unavailable" for the RMIDs
that are not tracked by hardware. So, there can be only limited number of
groups that can give guaranteed monitoring numbers. With ever changing
configurations there is no way to definitely know which of these groups
are being tracked during a particular time. Users do not have the option
to monitor a group or set of groups for a certain period of time without
worrying about counter being reset in between.
    
The ABMC feature allows users to assign a hardware counter ID to an RMID,
event pair and monitor bandwidth usage as long as it is assigned. The
hardware continues to track the assigned counter until it is explicitly
unassigned by the user. Additionally, the user can specify the type of
memory transactions (e.g., reads, writes) to be tracked by the counter
for the assigned RMID.

Without ABMC enabled, monitoring will work in current 'default' mode without
assignment option.

# History

Earlier implementation of ABMC had dependancy on BMEC (Bandwidth Monitoring
Event Configuration). Peter had concerns with that implementation because
it may be not be compatible with ARM's MPAM.

Here are the threads discussing the concerns and new interface to address the concerns.
https://lore.kernel.org/lkml/CALPaoCg97cLVVAcacnarp+880xjsedEWGJPXhYpy4P7=ky4MZw@mail.gmail.com/
https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/

Here are the finalized requirements based on the discussion:

*   BMEC and ABMC are incompatible with each other. They need to be mutually exclusive.

*   Eliminate global assignment listing. The interface
    /sys/fs/resctrl/info/L3_MON/mbm_assign_control is no longer required.

*   Create the configuration directories at /sys/fs/resctrl/info/L3_MON/counter_configs/.
    The configuration file names should be free-form, allowing users to create them as needed.

*   Perform assignment listing at the group level by introducing mbm_L3_assignments
    in each monitoring group level. The listing should provide the following details:

    Event Configuration: Specifies the event configuration applied. This will be crucial
    when "mkdir" on event configuration is added in the future, leading to the creation
    of mon_data/mon_l3_*/<event configuration>.

    Domains: Identifies the domains where the configuration is applied, supporting multi-domain setups.

    Assignment Type: Indicates whether the assignment is Exclusive (e or d), Shared (s), or Unassigned (_).

    Exclusive assignment: Assign the counter ID the RMID, event pair exclusively.
    
    Shared assignment: A shared assignment applies to both soft-ABMC and ABMC. A user can designate a
                       "counter" (could be hardware counter or "active" RMID) as shared and that means
                       the counter within that domain is shared between different monitor groups and actual
                       assignment is scheduled by resctrl.  

    Unassigned: No longer assigned.

*   Provide option to enable or disable auto assignment when new group is created.

*   Keep the flexibilty to support future assign options like Soft-ABMC etc.
    https://lore.kernel.org/lkml/7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com/
    

This series tries to address all the requirements listed above.

# Implementation details

Create a generic interface aimed to support user space assignment of scarce
counters used for monitoring. First usage of interface is by ABMC with option
to expand usage to "soft-ABMC" and MPAM counters in future.

Feature adds following interface files:

/sys/fs/resctrl/info/L3_MON/mbm_assign_mode: Reports the list of assignable
monitoring features supported. The enclosed brackets indicate which
feature is enabled.

/sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: The maximum number of monitoring counters
(total of available and assigned counters) in each domain when the system supports
mbm_assign_mode. 

/sys/fs/resctrl/info/L3_MON/available_mbm_cntrs: The number of monitoring counters
available for assignment in each domain when mbm_event mode is enabled on the system.

/sys/fs/resctrl/info/L3_MON/event_configs: Contains sub-directory for each MBM event
					   that can be assigned to a counter.

/sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter: The type of
			memory transactions tracked by the event mbm_total_bytes.

/sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter: The type of
			memory transactions tracked by the event mbm_local_bytes.

/sys/fs/resctrl/mbm_L3_assignments: Per monitor group interface to list or modify
				    counters assigned to the group.

# Examples

a. Check if MBM assign support is available
	#mount -t resctrl resctrl /sys/fs/resctrl/

	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
	[mbm_event]
	default

	mbm_event feature is detected and it is enabled.

b. Check how many assignable counters are supported. 

	# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs 
	0=32;1=32

c. Check how many assignable counters are available for assignment in each domain.

	# cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs 
	0=30;1=30

d. Check default event configuration.

	# cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter 
	local_reads,remote_reads,local_non_temporal_writes,remote_non_temporal_writes,
        local_reads_slow_memory,remote_reads_slow_memory,dirty_victim_writes_all

	# cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter 
	local_reads,local_non_temporal_writes,local_reads_slow_memory

e. Series adds a new interface file "mbm_L3_assignments" in each monitoring group
   to list and modify that group's monitoring states.

	The list is displayed in the following format:

        <Event>:<Domain ID>=<Assignment type>

        Event: A valid MBM event listed in the
        /sys/fs/resctrl/info/L3_MON/event_configs directory.

        Domain ID: A valid domain ID.

        Assignment types:

        _ : No counter assigned.

        e : Counter assigned exclusively.

	To list the default group states:
	# cat /sys/fs/resctrl/mbm_L3_assignments
	mbm_total_bytes:0=e;1=e
	mbm_local_bytes:0=e;1=e

	To unassign the counter associated with the mbm_total_bytes event on domain 0:
	# echo "mbm_total_bytes:0=_" > /sys/fs/resctrl/mbm_L3_assignments
	# cat /sys/fs/resctrl/mbm_L3_assignments
	mbm_total_bytes:0=_;1=e
	mbm_local_bytes:0=e;1=e

	To unassign the counter associated with the mbm_total_bytes event on all domains:
    	# echo "mbm_total_bytes:*=_" > /sys/fs/resctrl/mbm_L3_assignments
	# cat /sys/fs/resctrl/mbm_L3_assignment
	mbm_total_bytes:0=_;1=_
	mbm_local_bytes:0=e;1=e

	To assign a counter associated with the mbm_total_bytes event on all domains in exclusive mode:
    	# echo "mbm_total_bytes:*=e" > /sys/fs/resctrl/mbm_L3_assignments
	# cat /sys/fs/resctrl/mbm_L3_assignments
	mbm_total_bytes:0=e;1=e
	mbm_local_bytes:0=e;1=e

g. Read the events mbm_total_bytes and mbm_local_bytes of the default group.
   There is no change in reading the events with the assignment.  If the event is unassigned
   when reading, then the read will come back as "Unassigned".
	
	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
	779247936
	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes 
	765207488
	
h. Check the default event configurations.

	# cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter
	local_reads,remote_reads,local_non_temporal_writes,remote_non_temporal_writes,
	local_reads_slow_memory,remote_reads_slow_memory,dirty_victim_writes_all

	# cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
	local_reads,local_non_temporal_writes,local_reads_slow_memory

i. Change the event configuration for mbm_local_bytes.

	# echo "local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads" >
	/sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter

	# cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
	local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads
	
	This will update all (across all domains of all monitor groups) counter assignments 
        associated with the mbm_local_bytes event.

j. Now read the local event again. The first read may come back with "Unavailable"
   status. The subsequent read of mbm_local_bytes will display only the read events.
	
	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
	Unavailable
	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
	314101

k. Users have the option to go back to 'default' mbm_assign_mode if required.
   This can be done using the following command. Note that switching the
   mbm_assign_mode will reset all the MBM counters (and thus all MBM events) of all
   the resctrl groups.

	# echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
	mbm_event
	[default]
	
l. Unmount the resctrl
	 
	#umount /sys/fs/resctrl/
---
v14:
   Patch #1 is already been reviewed. Not need to review.

   Patches # 2-5:
   This is Tony's work. This is part of Tony's telemetry series.
   https://lore.kernel.org/lkml/20250521225049.132551-1-tony.luck@intel.com/

   Tony made special update for me to include in this series.
   https://lore.kernel.org/lkml/20250609162139.91651-1-tony.luck@intel.com/.
   We both are going to carry thesse mutliple events support patches.

   Patches #6-31 are changes related to mbm_assign_mode. 

   Took time to check all the text comments. Taken care most of comments.
   Anything missing is not intentional. ):

   Removed the dependancy on X86_FEATURE_CQM_MBM_TOTAL and X86_FEATURE_CQM_MBM_LOCAL
   as discussed in https://lore.kernel.org/lkml/5f8b21c6-5166-46a6-be14-0c7c9bfb7cde@intel.com/
   Reworked on ABMC enumeration during the init.

   Updated the code comment in resctrl.h on all the prototypes.

   Added lockdep_assert_cpus_held() in _resctrl_abmc_enable().
   Removed inline for resctrl_arch_mbm_cntr_assign_enabled().
   Added prototype descriptions for resctrl_arch_mbm_cntr_assign_enabled()
   and resctrl_arch_mbm_cntr_assign_set() in include/linux/resctrl.h.
   
   Changed the name of the monitor mode to mbm_event_assign based on the discussion.
   https://lore.kernel.org/lkml/7628cec8-5914-4895-8289-027e7821777e@amd.com/
   Updated resctrl.rst for mbm_event mode.
   Changed subject line to fs/resctrl in few patches.

   Removed BMEC reference internal.h. 

   Removed mbm_mode in mon_evt data structure as it is not required anymore.
   Added resctrl_get_mon_evt_cfg() and resctrl_set_mon_evt_cfg().

   Removed evt_cfg parameter in resctrl_arch_config_cntr(). Get evt_cfg only
   when assign is required.

   Updated the code documentation for mbm_cntr_alloc() and  mbm_cntr_get().
   Passed struct mon_evt to resctrl_assign_cntr_event() that way to avoid
   back and forth calls to get event details.

   Passing the struct mon_evt to resctrl_free_config_cntr() and removed
   the need for mbm_get_mon_event() call.
   Corrected the code documentation for mbm_cntr_free().

   Added WARN_ON_ONCE() when cntr_id < 0.
   Improved code documentation in include/linux/resctrl.h.
   Added the check in mbm_update() to skip overflow handler when counter is unassigned.

   Changed the term memory events to memory transactions to be consistant.

   Changed the name of directory to event_configs from counter_config.
   Updated user doc about the memory transactions supported by assignment.

   Renamed few functions resctrl_group_assign() -> rdtgroup_assign_cntr()
   resctrl_update_assign() -> resctrl_assign_cntr_allrdtgrp()

   Added rdtgroup_mutex in resctrl_mbm_assign_on_mkdir_show().

   Fixed the problem reported by Peter.
   https://lore.kernel.org/lkml/CALPaoCjvUSKLKOXzF85j8mHT=eZYM-7R0=gJ3PRgOk4yuF5ZhQ@mail.gmail.com/
   Updated the changelog.
   
   Added check in rdt_mon_features_show to hide bmec related feature.

   Added the call resctrl_bmec_files_show() to enable/disable files
   related to BMEC monitor mode is changed.

   Added resctrl_set_mon_evt_cfg() to reset event configuration values
   when mode is changes.

   Changed the name of the mbm_assign_mode's supported to mbm_event or default.
   https://lore.kernel.org/lkml/9b08ab86-22d2-40c1-be20-fcc73ee98b3d@amd.com/

   Added example section in user doc (resctrl.rst) on how to use mbm_assign_modes.

v13:
   Removed BMEC related 2 patches which were in the previous series.
   It was related to optimization which can be doen later.

   Patches are created on top of FS/ARCH restructure. So, major changes
   are due to FS/ARCH restructure. The files are split between
   arch/x86/kernel/cpu/resctrl/ and fs/resctrl/. So, functions
   are moved between these files accordingly.

   Added fflag RFTYPE_RES_CACHE for mbm_assign_mode, num_mbm_cntrs, available_mbm_cntrs.

   Removed the references to "mbm_assign_control".
  
   Moved resctrl_arch_config_cntr() prototype to include/linux/resctrl.h.
   Changed resctrl_arch_config_cntr() to retun void from int to simplify few call
   sequences.

   Added the event configuration details inside the evt_list in monitor domains.
   The avoids the need for new structure mbm_assign_config. 

   Passed evtid to functions resctrl_alloc_config_cntr() and resctrl_assign_cntr_event().
   Event configuration value can be easily obtained from mon_evt list.

   Added new patch to pass the entire struct rdtgroup to __mon_event_count(),
   mbm_update(), and related functions. We can easily get RMID,CLOSID etc from rdtgroup.

   Added new function __cntr_id_read_phys() to handle ABMC event reading.

   Added a new patch to hide BMEC related files when mbm_cntr_assign mode is enabled..
  
   Added the call resctrl_init_evt_configuration() to setup the event configuration during init.

   And few other commit message updates and user doc updates.

   Removed Reviewed-by from few patches as patches have changed due to FS/ARCH restructure.

   Let me know if I missed something.

v12:
   This version is kind of RFC series with a new interface.
   
   Removed Reviewed-by tag on few patches when the patch has changed.

   Moved BMEC related patches (1 and 2) to beginning of the series.
   Removed the dependancy on BMEC to ABMC feature.

   Removed the un-necessary initialization of mon_config_info structure.
   Changed wrmsrl instead of wrmsr to address the below comment.
   https://lore.kernel.org/lkml/0fc8dbd4-07d8-40bd-8eec-402b48762807@zytor.com/

   Fixed the conflicts due to recent changes in rdt_resource data structure.
   Added new mbm_cfg_mask field to resctrl_mon.
   
   Added the code to reset arch state inside _resctrl_abmc_enable().

   Added the check CONFIG_RESCTRL_ASSIGN_FIXED to take care of arm platforms.
   This will be defined only in arm and not in x86.

   Changed the code to display the max supported monitoring counters in each domain.
   
   Fixed the struct mbm_cntr_cfg code documentation.
   Moved the struct mbm_cntr_cfg definition to resctrl/internal.h as suggested by James.

   Replaced seq_puts(s, ";") with seq_putc(s, ';');
   Added missing rdt_last_cmd_clear() in resctrl_available_mbm_cntrs_show().

   Added the check to reset the architecture-specific state only when assign is requested.

   Added evt_cfg as the parameter to resctrl_arch_config_cntr() as the user will
   be passing the event configuration from /info/L3_MON/event_configs/.

   Changed the check in resctrl_alloc_config_cntr() to reduce the indentation.
   Fixed the handling error on first failure while assigning.
   Added new parameter event configuration (evt_cfg) to get the event configuration from user space.

   Added tte support for reading ABMC counters. This is bit involved change and affects lots of code.

   New patch to support event configurations via new counter_configs method.

   Removed mbm_cntr_reset() as it is not required while removing the group.

   Added new patch to handle auto assign on group creation ("mbm_assign_on_mkdir")

   Added couple of patches add interface for "mbm_L3_assignments" on each mon group.

   Introduced mbm_cntr_free_all() and resctrl_reset_rmid_all() to clear counters and
   non-architectural states when monitor mode is changed.
   https://lore.kernel.org/lkml/b60b4f72-6245-46db-a126-428fb13b6310@intel.com/

   Moved the resctrl_arch_mbm_cntr_assign_set_one to domain_add_cpu_mon().

   Patches 17, 18, 19, 20, 21, 23, 24 are completely new to address the new interface requirement.

v11:
   The commit 2937f9c361f7a ("x86/resctrl: Introduce resctrl_file_fflags_init() to initialize fflags")
   is already merged. Removed from the series.
   
   Resolved minor conflicts due to code displacement in latest code.
 
   Moved the monitoring related calls to monitor.c file when possible.
   Moved some of the changes from include/linux/resctrl.h to arch/x86/kernel/cpu/resctrl/internal.h
   as requested by Reinette. This changes will be moved back when arch and non code is separated.
   
   Renamed rdtgroup_mbm_assign_mode_show() to resctrl_mbm_assign_mode_show().
   Renamed rdtgroup_num_mbm_cntrs_show() to resctrl_num_mbm_cntrs_show().

   Moved the mon_config_info structure definition to internal.h.
   Moved resctrl_arch_mon_event_config_get() and resctrl_arch_mon_event_config_set()
   to monitor.c file.

   Moved resctrl_arch_assign_cntr() and resctrl_abmc_config_one_amd() to monitor.c.
   Added the code to reset the arch state in resctrl_arch_assign_cntr().
   Also removed resctrl_arch_reset_rmid() inside IPI as the counters are reset from the callers.

   Renamed rdtgroup_assign_cntr_event() to resctrl_assign_cntr_event().
   Refactored the resctrl_assign_cntr_event().
   Added functionality to exit on the first error during assignment.
   Simplified mbm_cntr_free().
   Removed the function mbm_cntr_assigned(). Will be using mbm_cntr_get() to
   figure out if the counter is assigned or not.
   
   Renamed rdtgroup_unassign_cntr_event() to resctrl_unassign_cntr_event().
   Refactored the resctrl_unassign_cntr_event().

   Moved mbm_cntr_reset() to monitor.c.
   Added code reset non-architectural state in mbm_cntr_reset().
   Added missing rdtgroup_unassign_cntrs() calls on failure path.

   Domain can be NULL with SNC support so moved the unassign check in rdtgroup_mondata_show().

   Renamed rdtgroup_mbm_assign_mode_write() to resctrl_mbm_assign_mode_write().
   Added more details in resctrl.rst about mbm_cntr_assign mode.
   Re-arranged the text in resctrl.rst file in section mbm_cntr_assign.

   Moved resctrl_arch_mbm_cntr_assign_set_one() to monitor.c

   Added non-arch RMID reset in mbm_config_write_domain().
   Removed resctrl_arch_reset_rmid() call in resctrl_abmc_config_one_amd(). Not required
   as reset of arch and non-arch rmid counters done from the callers. It simplies the IPI code.

   Fixed printing the separator after each domain while listing the group assignments.
   Renamed rdtgroup_mbm_assign_control_show to resctrl_mbm_assign_control_show().

   Fixed the static check warning with initializing dom_id in resctrl_process_flags()

   Added change log in each patch for specific changes.

v10:
   Major change is related to domain specific assignment.
   Added struct mbm_cntr_cfg inside mon domains. This will handle
   the domain specific assignments as discussed in below.
   https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
   I did not see the need to add cntr_id in mbm_state structure. Not used in the code.
   Following patches take care of these changes.
   Patch 12, 13, 15, 16, 17, 18.
   
   Added __init attribute to cache_alloc_hsw_probe(). Followed function
   prototype rules (preferred order is storage class before return type).
   
   Moved the mon_config_info structure definition to resctrl.h
   
   Added call resctrl_arch_reset_rmid() to reset the RMID in the domain inside IPI call
   resctrl_abmc_config_one_amd.
   
   SMP and non-SMP call support is not required in resctrl_arch_config_cntr with new
   domain specific assign approach/data structure.
   
   Assigned the counter before exposing the event files.
   Moved the call rdtgroup_assign_cntrs() inside mkdir_rdt_prepare_rmid_alloc().
   This is called both CNTR_MON and MON group creation.
   
   Call mbm_cntr_reset() when unmounted to clear all the assignments.
   
   Fixed the issue with finding the domain in multiple iterations in rdtgroup_process_flags().
   
   Printed full error message with domain information when assign fails.
   
   Taken care of other text comments in all the patches. Patch specific changes are in each patch.
   
   If I missed something please point me and it is not intentional.

v9:
   Patch 14 is a new addition. 
   Major change in patch 24.
   Moved the fix patch to address __init attribute to begining of the series.
   Fixed all the call sequences. Added additional Fixed tags.

   Added Reviewed-by where applicable.

   Took care of couple of minor merge conflicts with latest code.
   Re-ordered the MSR in couple of instances.
   Added available_mbm_cntrs (patch 14) to print the number of counter in a domain.

   Used MBM_EVENT_ARRAY_INDEX macro to get the event index.
   Introduced rdtgroup_cntr_id_init() to initialize the cntr_id

   Introduced new function resctrl_config_cntr to assign the counter, update
   the bitmap and reset the architectural state.
   Taken care of error handling(freeing the counter) when assignment fails.
  
   Changed rdtgroup_assign_cntrs() and rdtgroup_unassign_cntrs() to return void.
   Updated couple of rdtgroup_unassign_cntrs() calls properly.

   Fixed problem changing the mode to mbm_cntr_assign mode when it is
   not supported. Added extra checks to detect if systems supports it.
   
   https://lore.kernel.org/lkml/03b278b5-6c15-4d09-9ab7-3317e84a409e@intel.com/
   As discussed in the above comment, introduced resctrl_mon_event_config_set to
   handle IPI. But sending another IPI inside IPI causes problem. Kernel
   reports SMP warning. So, introduced resctrl_arch_update_cntr() to send the
   command directly.

   Fixed handling special case '//0=' and '//".
   Removed extra strstr() call in rdtgroup_mbm_assign_control_write().
   Added generic failure text when assignment operation fails.
   Corrected user documentation format texts.

v8:
  Patches are getting into final stages. 
  Couple of changes Patch 8, Patch 19 and Patch 23.
  Most of the other changes are related to rename and text message updates.

  Details are in each patch. Here is the summary.

  Added __init attribute to dom_data_init() in patch 8/25.
  Moved the mbm_cntrs_init() and mbm_cntrs_exit() functionality inside
  dom_data_init() and dom_data_exit() respectively.

  Renamed resctrl_mbm_evt_config_init() to arch_mbm_evt_config_init()
  Renamed resctrl_arch_event_config_get() to resctrl_arch_mon_event_config_get().
          resctrl_arch_event_config_set() to resctrl_arch_mon_event_config_set().

  Rename resctrl_arch_assign_cntr to resctrl_arch_config_cntr.
  Renamed rdtgroup_assign_cntr() to rdtgroup_assign_cntr_event().
  Added the code to return the error if rdtgroup_assign_cntr_event fails.
  Moved definition of MBM_EVENT_ARRAY_INDEX to resctrl/internal.h.
  Renamed rdtgroup_mbm_cntr_is_assigned to mbm_cntr_assigned_to_domain
  Added return error handling in resctrl_arch_config_cntr().
  Renamed rdtgroup_assign_grp to rdtgroup_assign_cntrs.
  Renamed rdtgroup_unassign_grp to rdtgroup_unassign_cntrs.
  Fixed the problem with unassigning the child MON groups of CTRL_MON group.
  Reset the internal counters after mbm_cntr_assign mode is changed.
  Renamed rdtgroup_mbm_cntr_reset() to mbm_cntr_reset()
  Renamed resctrl_arch_mbm_cntr_assign_configure to
            resctrl_arch_mbm_cntr_assign_set_one.

  Used the same IPI as event update to modify the assignment.
  Could not do the way we discussed in the thread.
  https://lore.kernel.org/lkml/f77737ac-d3f6-3e4b-3565-564f79c86ca8@amd.com/
  Needed to figure out event type to update the configuration.

  Moved unassign first and assign during the assign modification.
  Assign none "_" takes priority. Cannot be mixed with other flags.
  Updated the documentation and .rst file format. htmldoc looks ok.

v7:
   Major changes are related to FS and arch codes separation.
   Changed few interface names based on feedback.
   Here are the summary and each patch contains changes specific the patch.

   Removed WARN_ON for num_mbm_cntrs. Decided to dynamically allocate the bitmap.
   WARN_ON is not required anymore.
 
   Renamed the function resctrl_arch_get_abmc_enabled() to resctrl_arch_mbm_cntr_assign_enabled().

   Merged resctrl_arch_mbm_cntr_assign_disable, resctrl_arch_mbm_cntr_assign_disable
   and renamed to resctrl_arch_mbm_cntr_assign_set(). Passed the struct rdt_resource
   to these functions.

   Removed resctrl_arch_reset_rmid_all() from arch code. This will be done from FS the caller.

   Updated the descriptions/commit log in resctrl.rst to generic text. Removed ABMC references.
   Renamed mbm_mode to mbm_assign_mode.
   Renamed mbm_control to  mbm_assign_control.
   Introduced mutex lock in rdtgroup_mbm_mode_show().
 
   The 'legacy' mode is called 'default' mode. 

   Removed the static allocation and now allocating bitmap mbm_cntr_free_map dynamically.

   Merged rdtgroup_assign_cntr(), rdtgroup_alloc_cntr() into one.
   Merged rdtgroup_unassign_cntr(), rdtgroup_free_cntr() into one.
   
  Added struct rdt_resource to the interface functions resctrl_arch_assign_cntr ()
  and resctrl_arch_unassign_cntr().
  Rename rdtgroup_abmc_cfg() to resctrl_abmc_config_one_amd().
   
  Added a new patch to fix counter assignment on event config changes.

  Removed the references of ABMC from user interfaces.

  Simplified the parsing (strsep(&token, "//") in rdtgroup_mbm_assign_control_write().
  Added mutex lock in rdtgroup_mbm_assign_control_write() while processing.

  Thomas Gleixner asked us to update  https://gitlab.com/x86-cpuid.org/x86-cpuid-db. 
  It needs internal approval. We are working on it.

v6:
  We still need to finalize few interface details on mbm_assign_mode and mbm_assign_control
  in case of ABMC and Soft-ABMC. We can continue the discussion with this series.

  Added support for domain-id '*' to update all the domains at once.
  Fixed assign interface to allocate the counter if counter is
  not assigned.   
  Fixed unassign interface to free the counter if the counter is not
  assigned in any of the domains.

  Renamed abmc_capable to mbm_cntr_assignable.

  Renamed abmc_enabled to mbm_cntr_assign_enabled.
  Used msr_set_bit and msr_clear_bit for msr updates.
  Renamed resctrl_arch_abmc_enable() to resctrl_arch_mbm_cntr_assign_enable().
  Renamed resctrl_arch_abmc_disable() to resctrl_arch_mbm_cntr_assign_disable().

  Changed the display name from num_cntrs to num_mbm_cntrs.

  Removed the variable mbm_cntrs_free_map_len. This is not required.
  Removed the call mbm_cntrs_init() in arch code. This needs to be done at higher level.
  Used DECLARE_BITMAP to initialize mbm_cntrs_free_map.
  Removed unused config value definitions.

  Introduced mbm_cntr_map to track counters at domain level. With this
  we dont need to send MSR read to read the counter configuration.

  Separated all the counter id management to upper level in FS code.

  Added checks to detect "Unassigned" before reading the RMID.

  More details in each patch.

v5:
  Rebase changes (because of SNC support)

  Interface changes.
   /sys/fs/resctrl/mbm_assign to /sys/fs/resctrl/mbm_assign_mode.
   /sys/fs/resctrl/mbm_assign_control to /sys/fs/resctrl/mbm_assign_control.

  Added few arch specific routines.
  resctrl_arch_get_abmc_enabled.
  resctrl_arch_abmc_enable.
  resctrl_arch_abmc_disable.

  Few renames
   num_cntrs_free_map -> mbm_cntrs_free_map
   num_cntrs_init -> mbm_cntrs_init
   arch_domain_mbm_evt_config -> resctrl_arch_mbm_evt_config

  Introduced resctrl_arch_event_config_get and
    resctrl_arch_event_config_set() to update event configuration.

  Removed mon_state field mongroup. Added MON_CNTR_UNSET to initialize counters.

  Renamed ctr_id to cntr_id for the hardware counter.
 
  Report "Unassigned" in case the user attempts to read the events without assigning the counter.
  
  ABMC is enabled during the boot up. Can be enabled or disabled later.

  Fixed opcode and flags combination.
    '=_" is valid.
    "-_" amd "+_" is not valid.

 Added all the comments as far as I know. If I missed something, it is not intentional.

v4: 
  Main change is domain specific event assignment.
  Kept the ABMC feature as a default.
  Dynamcic switching between ABMC and mbm_legacy is still allowed.
  We are still not clear about mount option.
  Moved the monitoring related data in resctrl_mon structure from rdt_resource.
  Fixed the display of legacy and ABMC mode.
  Used bimap APIs when possible.
  Removed event configuration read from MSRs. We can use the
  internal saved data.(patch 12)
  Added more comments about L3_QOS_ABMC_CFG MSR.
  Added IPIs to read the assignment status for each domain (patch 18 and 19)
  More details in each patch.

v3:
   This series adds the support for global assignment mode discussed in
   the thread. https://lore.kernel.org/lkml/20231201005720.235639-1-babu.moger@amd.com/
   Removed the individual assignment mode and included the global assignment interface.
   Added following interface files.
   a. /sys/fs/resctrl/info/L3_MON/mbm_assign
      Used for displaying the current assignment mode and switch between
      ABMC and legacy mode.
   b. /sys/fs/resctrl/info/L3_MON/mbm_assign_control
      Used for lising the groups assignment mode and modify the assignment states.
   c. Most of the changes are related to the new interface.
   d. Addressed the comments from Reinette, James and Peter.
   e. Hope I have addressed most of the major feedbacks discussed. If I missed
      something then it is not intentional. Please feel free to comment.
   f. Sending this as an RFC as per Reinette's comment. So, this is still open
      for discussion.

v2:
   a. Major change is the way ABMC is enabled. Earlier, user needed to remount
      with -o abmc to enable ABMC feature. Removed that option now.
      Now users can enable ABMC by "$echo 1 to /sys/fs/resctrl/info/L3_MON/mbm_assign_enable".
     
   b. Added new word 21 to x86/cpufeatures.h.

   c. Display unsupported if user attempts to read the events when ABMC is enabled
      and event is not assigned.

   d. Display monitor_state as "Unsupported" when ABMC is disabled.
  
   e. Text updates and rebase to latest tip tree (as of Jan 18).
 
   f. This series is still work in progress. I am yet to hear from ARM developers. 

--------------------------------------------------------------------------------------

Previous revisions:
v13: https://lore.kernel.org/lkml/cover.1747349530.git.babu.moger@amd.com/
v12: https://lore.kernel.org/lkml/cover.1743725907.git.babu.moger@amd.com/
v11: https://lore.kernel.org/lkml/cover.1737577229.git.babu.moger@amd.com/
v10: https://lore.kernel.org/lkml/cover.1734034524.git.babu.moger@amd.com/
v9: https://lore.kernel.org/lkml/cover.1730244116.git.babu.moger@amd.com/
v8: https://lore.kernel.org/lkml/cover.1728495588.git.babu.moger@amd.com/
v7: https://lore.kernel.org/lkml/cover.1725488488.git.babu.moger@amd.com/
v6: https://lore.kernel.org/lkml/cover.1722981659.git.babu.moger@amd.com/
v5: https://lore.kernel.org/lkml/cover.1720043311.git.babu.moger@amd.com/
v4: https://lore.kernel.org/lkml/cover.1716552602.git.babu.moger@amd.com/
v3: https://lore.kernel.org/lkml/cover.1711674410.git.babu.moger@amd.com/  
v2: https://lore.kernel.org/lkml/20231201005720.235639-1-babu.moger@amd.com/
v1: https://lore.kernel.org/lkml/20231201005720.235639-1-babu.moger@amd.com/


Babu Moger (27):
  x86/cpufeatures: Add support for Assignable Bandwidth Monitoring
    Counters (ABMC)
  x86/resctrl: Add ABMC feature in the command line options
  x86,fs/resctrl: Consolidate monitoring related data from rdt_resource
  x86/resctrl: Detect Assignable Bandwidth Monitoring feature details
  x86/resctrl: Add support to enable/disable AMD ABMC feature
  fs/resctrl: Introduce the interface to display monitoring modes
  fs/resctrl: Introduce interface to display number of assignable
    counter IDs
  fs/resctrl: Introduce mbm_cntr_cfg to track assignable counters per
    domain
  fs/resctrl: Introduce interface to display number of free MBM counters
  x86/resctrl: Add data structures and definitions for ABMC assignment
  x86,fs/resctrl: Introduce event configuration field in struct mon_evt
  x86/resctrl: Implement resctrl_arch_config_cntr() to assign a counter
    with ABMC
  fs/resctrl: Add the functionality to assign MBM events
  fs/resctrl: Add the functionality to unassign MBM events
  fs/resctrl: Report 'Unassigned' for MBM events in mbm_event mode
  fs/resctrl: Pass entire struct rdtgroup rather than passing individual
    members
  x86,fs/resctrl: Add the support for reading ABMC counters
  fs/resctrl: Add definitions for MBM event configuration
  fs/resctrl: Add event configuration directory under info/L3_MON/
  fs/resctrl: Provide interface to update the event configurations
  fs/resctrl: Introduce mbm_assign_on_mkdir to enable assignments on
    mkdir
  x86,fs/resctrl: Auto assign/unassign counters on mkdir
  fs/resctrl: Introduce mbm_L3_assignments to list assignments in a
    group
  fs/resctrl: Introduce the interface to modify assignments in a group
  fs/resctrl: Hide the BMEC related files when mbm_event mode is enabled
  fs/resctrl: Introduce the interface to switch between monitor modes
  x86/resctrl: Configure mbm_event mode if supported

Qinyun Tan (1):
  x86,fs/resctrl: Remove unappropriate references to cacheinfo in the
    resctrl subsystem.

Tony Luck (4):
  x86,fs/resctrl: Consolidate monitor event descriptions
  x86,fs/resctrl: Replace architecture event enabled checks
  x86/resctrl: Remove 'rdt_mon_features' global variable
  x86,fs/resctrl: Prepare for more monitor events

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/filesystems/resctrl.rst         | 315 +++++++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   2 +
 arch/x86/include/asm/resctrl.h                |  16 -
 arch/x86/kernel/cpu/resctrl/core.c            |  82 +-
 arch/x86/kernel/cpu/resctrl/internal.h        |  57 +-
 arch/x86/kernel/cpu/resctrl/monitor.c         | 218 ++++-
 arch/x86/kernel/cpu/scattered.c               |   1 +
 fs/resctrl/ctrlmondata.c                      |  36 +-
 fs/resctrl/internal.h                         |  52 +-
 fs/resctrl/monitor.c                          | 374 ++++++--
 fs/resctrl/rdtgroup.c                         | 853 +++++++++++++++++-
 include/linux/resctrl.h                       | 127 ++-
 include/linux/resctrl_types.h                 |  15 +-
 15 files changed, 1924 insertions(+), 227 deletions(-)

-- 
2.34.1

