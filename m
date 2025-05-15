Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF593295519;
	Thu, 15 May 2025 22:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349781; cv=fail; b=M7+pXJr1rBYmCbD4xlWLtGmhUEWk519DOwteRQPFrzb1/miTWjwG8Z0kliGuZZpqRTnJ6GKQq9T23GxL/AMwXkyaIsGCGADXUFK2zSoV9uXYFe6dNG6D6Mr/7KdFPqeDSDQLTehwjgI4Y5rXA4iz46/sS5e1J21uDyNTiNVAZb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349781; c=relaxed/simple;
	bh=lQyjcmoj21lBZzdastJ94nMUCki0qUcdZHQbvtz5iDA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbvQwP0/q+HLnFNZbDHIsr6PYig8w1PuvoEDtMDzCzbz0BlT4FZv1PDrfkIVhKMG8E1m0EfIxXfiVPzvr4q6icPyBbQnfXDVqoQSuX6EIIR4KkwuaOLookaHhgoKb0dME4F0OO+21eL0sfhd3fJUbSG615pYP+/tFgPTS53Pfhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kgS1Teff; arc=fail smtp.client-ip=40.107.100.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kgS1Teff"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMJgXgZMPjlQ/Saq3oR2/fpIs8Hl/YYUgbkNtmgFxFH7BwUwW82wtqMLsCGDVW0eCj9mwSeBCBqJzkr0zshlgGYRxZYGP08ZGLOs6O7R8sJHv1aTEMWCkt6b0vHA9VCQHJGNOIf5EAAXx0GZggL1cM5HxgSe/GRNn4BKri8axHZiUjK0lbu7GyBsBtNuO9UXvRc4p5DkDPeU7xPy+qCboMor28Afaz1ldXQyz/jIy4ab2OT6XFR4TGBYtltKqggoGLg7CGYT2ZF2dv5RF+siuDOU9RdT5GaOn21p3m82PzN+LEjHFA8iGAjXOWTJK4HJWmNLNODwg2fxbNHtb57XEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MmI2b7kpFbxaTZNizGaoCZ88FSLLVf2EzwL0yH7JRY=;
 b=PHeOiKn1rK5ELl+l66HnV1oszRAypONNvPe0kp2miInM+BirQ/FJsM1/czebw24ZtfYJIeA4holsgIWRXSYa0pviiqq+UMJnCuQuf9+3iQziyc+l/gQygqz6RR80KJu4tbtf6uE6vyRPp9TWOPmFJ4GTOiGKl875Oz0jzrkm58by4bUrodZFATtCZucQOLRxzHpklnOOLBflLFQe9ZnwMDV/+9CLLR75MH87bAIp5zf6NzFicEPEqM1TWSqJXjB4Et07k5QNqz0+tG0WW4R9zSYOsoICAXTlEloukNGFgL17q49xODyjSti1gm8unK6kg3bzRZUSXmuNQtN5rIV3DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MmI2b7kpFbxaTZNizGaoCZ88FSLLVf2EzwL0yH7JRY=;
 b=kgS1TeffOsYh46KXfaxKmuWCCH7hF3QuOwYuSFSFVVeT1gIHe7enrWuG3iwumCnwxhm/p4285WAG00dfpki/zNr+TiUcH02xEenHR/GToeGTsRGV+btwwcK5Xnz7g81s9gGPClUzv1ifD/EUPTSJR2PXfm7S+utZt/9q5qruxk4=
Received: from BN7PR06CA0071.namprd06.prod.outlook.com (2603:10b6:408:34::48)
 by IA1PR12MB9531.namprd12.prod.outlook.com (2603:10b6:208:596::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Thu, 15 May
 2025 22:56:12 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:34:cafe::c3) by BN7PR06CA0071.outlook.office365.com
 (2603:10b6:408:34::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Thu,
 15 May 2025 22:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:56:12 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:56:08 -0500
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
Subject: [PATCH v13 24/27] x86/resctrl: Introduce the interface to modify assignments in a group
Date: Thu, 15 May 2025 17:52:09 -0500
Message-ID: <6a2cdedc0b2bf7e3da82d453b0104b46a2e85529.1747349530.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747349530.git.babu.moger@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|IA1PR12MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: 03867ef2-9e2a-441d-6bec-08dd9403b06e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnVweUZiem9mdjVhRXBjSVlaNGpMMnpmS1h1eUNvc2Z5aDlXS1dBZDRMQ3lJ?=
 =?utf-8?B?UVhhdDh6Y1JKcGw5aVBzWHNCUkQrK2JmKzc2SFV4OEgwRXAxYzlibzdJNTBj?=
 =?utf-8?B?N2FOTVhpeWR1S3ZwbUFNT2M0UEhsZStrWWtYT1ZucTZxeTA4Y2NwOFc4NHZN?=
 =?utf-8?B?RzcxTzhlb0IrTUcvOWZuS0hGUkJBb1NRRThHK3BJczVJM1YydkJ1YURTTFYv?=
 =?utf-8?B?QnBaRk5tUnMrMFdIeWhaMFI2N0t0SDk1dDVhakJNQks3eU9kTktpckFvUG9q?=
 =?utf-8?B?cWR0dTRFRGZaS1lVQnNjWlh4UjZJdHdLSzlNTUR2YVh2L2lYU3JsU3VlMG9F?=
 =?utf-8?B?ZkpDNVAzV0hpTVpkQ2JVZDgrTmo5ajNGbk5ldk9NQTlyRU11YTJOSmtySkp0?=
 =?utf-8?B?Nk9FenU4bzJJQTRMdnEwckttTDZ3ZnlUb0NraEIxNHVPZ1JFN1AvbE9CUjZG?=
 =?utf-8?B?RjlYaHMwZU5GNlBlazdlelRpU1hxajJHdjh4UGdpdWlYbURJTUM0QS9OMnA0?=
 =?utf-8?B?SEN5dnJjYis2THB2RmplQkh6SjZlS3VnY1Z5ZGlMWTVZQ1VXd2NOQU9hdVdx?=
 =?utf-8?B?U2NtVDl6S1YxTE1tK3BHUWVpbWMyVEZjVVZ2dzl5WW8xNnFjT0FiOS9BRjF4?=
 =?utf-8?B?RFhYTDhoZUJFUzU3dXhidmJkaDVCdlg0aHVZeHd1bGZGUmpiek9BOEx6ZGp6?=
 =?utf-8?B?NVpGWHRtcmxWNmEydWxGVFA5enI1TWtvSTVCdlRTb1pEaUdmbTRkN0hJN25s?=
 =?utf-8?B?ZGZYRTlUSDJsaWpxeU8yRDNySkRrMFBMV3ozMFpiS2dGRU1yZzN5VmpoL0lw?=
 =?utf-8?B?ZStvR0xmWFR6UnZLRFVQZTFiUmR3cklpWHRENE5NK3pyUWlnejhvdzZwYlJO?=
 =?utf-8?B?YWk3RmY0TzAxSXdDdW45TUVndW4wVWgwMDJ1Z29hVmxySlIxNkh4aHlDcXAx?=
 =?utf-8?B?T0YyVkRsR1B2bEtQckpQSzk0cFA4SVdlVHZNRHlmaVY4UW0xNnZwdEQyaU84?=
 =?utf-8?B?YnVmSkdzYTRMZ0VZY3plL1hxcmxFMXA0VVVPQkZzNXpzdEpPMzRMMGRwSU15?=
 =?utf-8?B?RjE4UkNvbUdWVlYxYjBOdDhFUWxWa2ZWdmdHT1ZTMUxPUlV6VGF3bXNRdmFm?=
 =?utf-8?B?b3MrK3lhanBySW8xN3E3Nzd0WU9UOG5vSVMxZWxBYzAzeXZ4ZHlxdS91dVo4?=
 =?utf-8?B?azBTa05obkNUZEJNb0NKSlI4TEpvVmtHbVlWejJMbFJORngyamtSY2FUVkEz?=
 =?utf-8?B?cFM3aXF1dnJlR1A2Z1BqdXdZVXpocDRLTUNTWWNDNVFuVUxzMWQrclVFT1F4?=
 =?utf-8?B?UUNyNHBOUWIwMlRXWHBXRlc0WkZiekdFaXBPZld4SHppNVE1WWxWaGRRMGIv?=
 =?utf-8?B?UHJFSHVWVXdPeGpVNEFkeGZMREEwa21vT0Z3blh0VjFiVzhRRnYwcjVHTmQx?=
 =?utf-8?B?bCs1eTNybi9TWU9SMnhjZFF3Y3RBNGNPY1VvazFXVU1kZ2RLOUg0WmI2YW40?=
 =?utf-8?B?dGtiTEIxYlJyb1VzRWIxa3lXeTdzVTNSdWpPczRzajZwQ3oxRkJDNzY3RWU5?=
 =?utf-8?B?cVJyQnlnQWljeVNXL21WRmJmbFBJSnpjV1VLdXlrSHQ2MXpMdHVKVnhMelNT?=
 =?utf-8?B?UEozbHd6YUR6bTRzUkExZkI0aEtyQ0FGMkNGeE53OFRtbjMramRYZmdRek5F?=
 =?utf-8?B?elhJYXE4QWZMeXMydTI2WWhYYUFWZ0JOODMzUDJ3ZzhEZ1B0UjdFc3V1N0p6?=
 =?utf-8?B?YVkzSnF0YzRCTG1nYXRrRHp6Tmg4cUhrWkQvTmtrRWFUUnRMTjA3Uis0cnFZ?=
 =?utf-8?B?TGNoNlFoYlRIT1c3a003MGdRNVBzQVlJSVpHakFObUFQWHZ1cVVTbG5rdDhG?=
 =?utf-8?B?R0pDM0Y4bXR4eFp4bjJDd0llOXo5L0hERkszSjZrVGVQUW1PRElzdjUvZzJ3?=
 =?utf-8?B?aE52ZWc0YUtVemwyNHFWZzllM1d0UkM1NTV0MW52ZVN0TnhmZEsvZnc1Y2Rh?=
 =?utf-8?B?bVdMcUZaMUlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:56:12.1884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03867ef2-9e2a-441d-6bec-08dd9403b06e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9531

Introduce an interface to modify assignments within a group.

Modifications follow this format:
<Event configuration>:<Domain id>=<Assignment type>

The assignment type can be one of the following:

_ : No event configuration assigned

e : Event configuration assigned in exclusive mode

Domain id can be any valid domain ID number or '*' to update all the
domains.

Example:
$cd /sys/fs/resctrl
$cat mbm_L3_assignments
mbm_total_bytes:0=e;1=e
mbm_local_bytes:0=e;1=e

To unassign the configuration of mbm_total_bytes on domain 0:

$echo "mbm_total_bytes:0=_" > mbm_L3_assignments
$cat mbm_L3_assignments
mbm_total_bytes:0=_;1=e
mbm_local_bytes:0=e;1=e

To unassign the mbm_total_bytes configuration on all domains:

$echo "mbm_total_bytes:*=_" > mbm_L3_assignments
$cat mbm_L3_assignments
mbm_total_bytes:0=_;1=_
mbm_local_bytes:0=e;1=e

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Few changes in mbm_L3_assignments_write() after moving the event config to evt_list.
     Resolved conflicts caused by the recent FS/ARCH code restructure.

v12: New patch:
     Assignment interface moved inside the group based the discussion
     https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/#t
---
 Documentation/filesystems/resctrl.rst |  29 ++++-
 fs/resctrl/internal.h                 |   9 ++
 fs/resctrl/rdtgroup.c                 | 165 +++++++++++++++++++++++++-
 3 files changed, 201 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 2350c1f21f4e..d779554a2f91 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -515,7 +515,7 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
 	Event configuration: A valid event configuration listed in the
 	/sys/fs/resctrl/info/L3_MON/counter_configs directory.
 
-	Domain ID: A valid domain ID number.
+	Domain ID: A valid domain ID number or '*' to update all the domains.
 
 	Assignment types:
 
@@ -532,6 +532,33 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
 	    mbm_total_bytes:0=e;1=e
 	    mbm_local_bytes:0=e;1=e
 
+	Modify the assignment states by writing to the interface file.
+
+	Example:
+	To unassign the configuration of mbm_total_bytes on domain 0:
+	::
+
+	 # echo "mbm_total_bytes:0=_" > mbm_L3_assignments
+	 # cat mbm_L3_assignments
+	 mbm_total_bytes:0=_;1=e
+	 mbm_local_bytes:0=e;1=e
+
+	To unassign the mbm_total_bytes configuration on all domains:
+	::
+
+	 # echo "mbm_total_bytes:*=_" > mbm_L3_assignments
+	 # cat mbm_L3_assignments
+	 mbm_total_bytes:0=_;1=_
+	 mbm_local_bytes:0=e;1=e
+
+	To assign the mbm_total_bytes configuration on all domains in exclusive mode:
+	::
+
+	 # echo "mbm_total_bytes:*=e" > mbm_L3_assignments
+	 # cat mbm_L3_assignments
+	 mbm_total_bytes:0=e;1=e
+	 mbm_local_bytes:0=e;1=e
+
 Resource allocation rules
 -------------------------
 
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 446cc9cc61df..a6069a5dfd49 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -51,6 +51,15 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
 	return container_of(kfc, struct rdt_fs_context, kfc);
 }
 
+/*
+ * Assignment types for mbm_cntr_assign mode
+ */
+enum {
+	ASSIGN_NONE		= 0,
+	ASSIGN_EXCLUSIVE,
+	ASSIGN_INVALID,
+};
+
 /**
  * struct mon_evt - Entry in the event list of a resource
  * @evtid:		event id
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 8d970b99bbbd..ea1782723f81 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2126,6 +2126,168 @@ static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file
 	return ret;
 }
 
+/*
+ * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
+ * event name.
+ */
+static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r,
+						 char *name)
+{
+	struct mon_evt *mevt;
+
+	list_for_each_entry(mevt, &r->mon.evt_list, list) {
+		if (!strcmp(mevt->name, name))
+			return mevt;
+	}
+
+	return NULL;
+}
+
+static unsigned int resctrl_get_assing_type(char *assign)
+{
+	unsigned int mon_state = ASSIGN_NONE;
+	int len = strlen(assign);
+
+	if (!len || len > 1)
+		return ASSIGN_INVALID;
+
+	switch (*assign) {
+	case 'e':
+		mon_state = ASSIGN_EXCLUSIVE;
+		break;
+	case '_':
+		mon_state = ASSIGN_NONE;
+		break;
+	default:
+		mon_state = ASSIGN_INVALID;
+		break;
+	}
+
+	return mon_state;
+}
+
+static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
+				  char *config, char *tok)
+{
+	struct rdt_mon_domain *d;
+	char *dom_str, *id_str;
+	unsigned long dom_id = 0;
+	struct mon_evt *mevt;
+	int assign_type;
+	char domain[10];
+	bool found;
+	int ret;
+
+	mevt = mbm_get_mon_event_by_name(r, config);
+	if (!mevt) {
+		rdt_last_cmd_printf("Invalid assign configuration %s\n", config);
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
+	assign_type = resctrl_get_assing_type(dom_str);
+
+	switch (assign_type) {
+	case ASSIGN_NONE:
+		ret = resctrl_unassign_cntr_event(r, d, rdtgrp, mevt->evtid);
+		break;
+	case ASSIGN_EXCLUSIVE:
+		ret = resctrl_assign_cntr_event(r, d, rdtgrp, mevt->evtid);
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
+	rdt_last_cmd_printf("Assign operation '%s:%s=%s' failed\n", config, domain, dom_str);
+
+	return ret;
+}
+
+static ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
+					size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdtgroup *rdtgrp;
+	char *token, *config;
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
+		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
+		rdtgroup_kn_unlock(of->kn);
+		return -EINVAL;
+	}
+
+	while ((token = strsep(&buf, "\n")) != NULL) {
+		/*
+		 * The write command follows the following format:
+		 * “<Assign config>:<domain_id>=<assign mode>”
+		 * Extract Assign config first.
+		 */
+		config = strsep(&token, ":");
+
+		ret = resctrl_process_assign(r, rdtgrp, config, token);
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
@@ -2266,9 +2428,10 @@ static struct rftype res_common_files[] = {
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

