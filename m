Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC61273D78;
	Fri, 13 Jun 2025 21:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848863; cv=fail; b=IZme6jihjTY4H1VNgKKfkOQunsS00Je6V1Em2waASVICMILpTW27xKBGo6iu/LPrMcJ9UJuSEjS43dSiTmwygRNJltMBvwl79xAZJg/ZolGAUwHtvhV7bGvVxRC0qEyL5iZ1WiweEif6CaFmnCq88ufAf6iQuv7YmNqw8l+i0o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848863; c=relaxed/simple;
	bh=iHQVfLx1ASC5IJqnJM+veZW2SHqcnEikvbHDc+WRdK0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NMSzwG0z42WT4zfEhT9KGbtaNf7OdZuPqznmkwmRUeco5ksDRQapn16rjMLzafM0FIjG8uWIDLKpp8C8uDOOB0JvxfhydB8Es2LtdQ5PMhUpmFFz5vfnlDxpdu02PaGZia0/zlddX6Kz+i3Zn7H8pekIbWGuImcykuRREq3w7cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mk/XXjiG; arc=fail smtp.client-ip=40.107.220.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mk/XXjiG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNnmkEwzIzkJWxhi+qOAqesJ4QF43zz+ksQk/LDOwj7dQlVDEqnhsxyVGBS/jL+so9ZwGyUw6X1AAUyqQIcQplh0qKzJtKJkJq3qdxkn7BXyk7AHbLu5CRPeiVH2JZ3b2SY6/DGIiXJ5JKE7bWzaAzLwZhAXBnK3e7Wt/LBEhazVrOxO4EzQJW1571wcye0JSvai9ihRhBLj3IMq7TguHOGz5rL/yuQjqaw0XzLXeSJRur/AFG4i1eg0/1jck6cij6H43XojrYB0iu+0qU2ZtREGBCFky3vw2hxgSJcP9QPEYe6Rlf4tui5ISO6gxj8VMwoqfn/L2RulEc0kyOyM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTs8lj/1SLzljbIVWJPPCpcR6PJcc7KlqeQ6VLuOXD4=;
 b=adxKvn7ORzUWFCqxrZonsAhfQzMi5ixqiKw1A9XDMfUZA/neLmtf6kgGxq1c1upWsJMP3z1PTCL88LfnFRn+ub0jl0YCub3uMvwzhqiOhmG8RuLTpxVtb2VciU3guKrC5AO60NnrIOiZ5P6HEz+Xpa9e9kYxG7YNNcuYqaEjKKeUSFNYWvCn5MtyFNUF77kngw86uqn8NF9Sw9cp0KmbmL93YTwqZ2otudB2HJrOHNizbPXiOZXbPYR7ByMeJe2958tBdtbGqY/jl4t3DblJO60SXbuRcDhy0fHsZ13DVvJ5vGGprOGeLRG4Bmbhkv6o5/sl7kpuCpe3PlZaR+g+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTs8lj/1SLzljbIVWJPPCpcR6PJcc7KlqeQ6VLuOXD4=;
 b=Mk/XXjiGri9y+8jtWYMu18JZsSaMuL0GA/U5af4bbziicRyk3vYVD55SRsi/Ibhzpx4g8R8SlqhUXpd/W/nedxdCnhPEpzU/oGf1A5UQ+pARqFNPCujTfUmhON2gHQc8a+tfJhQHIwzSrNQh/TqMTQG7fpYsbzcp51z+ak47KF8=
Received: from CY5PR17CA0042.namprd17.prod.outlook.com (2603:10b6:930:12::29)
 by IA0PR12MB7627.namprd12.prod.outlook.com (2603:10b6:208:437::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.42; Fri, 13 Jun
 2025 21:07:37 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:12:cafe::98) by CY5PR17CA0042.outlook.office365.com
 (2603:10b6:930:12::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 21:07:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:07:35 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:07:30 -0500
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
Subject: [PATCH v14 15/32] x86/resctrl: Add data structures and definitions for ABMC assignment
Date: Fri, 13 Jun 2025 16:04:59 -0500
Message-ID: <cc10b03a447bce684f0656db79662a485e972e87.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|IA0PR12MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c77df8-0822-4c7e-068f-08ddaabe524c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3dSZDIrVUVaT1JVVWRVR2ljV2RwOFJmS0NyeEdMdzcwY3RoSnpZT1o4L2ow?=
 =?utf-8?B?SlNhT3I0MWpiM00xOEEyL1pXNjlIRzJFcDVrbHRKc00rQmNldDZIMVZTQW1J?=
 =?utf-8?B?bXpsTlROSHVkT0hQNjdrYlhoWDdoaGVXTUJGa2tNbWJnTXR1MW4zaVlpRGx5?=
 =?utf-8?B?cVhveHVEMVI0ZHhWRGN5elB2Ums5NFhralpYTEZkeG56eDR3MGxPMUtJdldy?=
 =?utf-8?B?eDBodXNXWEIwRkxWK0QxMTJ3dnkxRG83aXptVlJmYTZWY0E0ZlE2Nm0xVmsz?=
 =?utf-8?B?VGgvNkQrVVJUZUZWbzlLZWJtbjk4K1cvUk1LVFh6SEtRWUV4YWRlZnVDeFRh?=
 =?utf-8?B?MkJZNGExNlUzR2hQMGMxN052RWhPa3dXTnZpaXZpZStWMm03ejdaL3A3MmRj?=
 =?utf-8?B?UTBzMW9OaTNqVWhGSHk2V0pzZytSdGplMWdNc0U1Q0dQRDh2RGdyOEZ6Tnpl?=
 =?utf-8?B?M3U3RUhDelFvSjNodW1pcG1IdnI4WWlJaUpiU2tnVGswMGMwaVo4NlRXSWZy?=
 =?utf-8?B?ZVRJaVJVd045L3lIMzV2MG9OQXhobE9kdXg1TGdNRW9TN1NGWVl3aWI5SGg3?=
 =?utf-8?B?MTRnWTRTdmd1Z1NXR3JXVUgyb1AzQmYvOGwyS09GMGNQRUExQ0ZLYjBtRFJt?=
 =?utf-8?B?Nzd6ckdQcEl4VlR1ejJFNDVOaEx2aEhlR2Rjc05wYTFjZGgwUGtBamZRWUdu?=
 =?utf-8?B?RXEyd1QrT3UxZUt5aTJmUCtZM1N4aXp1Z2t4NHg3MGdRSHh6WnZWUEYyaU14?=
 =?utf-8?B?RG1LQy9zbXY1Ykt6K2ZpOHo2QkFlaE1hNnNOdlF2bGVCNCtidGFIRjNhdS91?=
 =?utf-8?B?V1NaL2JGb3pqYlFtUDg5eHB0RTV4MzVsVHc1WHZOakVNVnkzWlBreVZVTHhu?=
 =?utf-8?B?Zis1T3pRK3NRcHNJQzJ0WFE3eTdtSENIc3ZrdGx3bC8vdUJoaktoOC9aK01I?=
 =?utf-8?B?QjVIWG1RQkRxdVFGdHVmSW5Vd1Q4NXQ0ME5VczZkVjFjdFFlTVhjMmdDT0pv?=
 =?utf-8?B?ZjdmNDlzbktBdTduVTNGZ2J5SzJocGhQcUxicDBOeG8rbklBdmNJNmRzSlhG?=
 =?utf-8?B?WndTMjVMbzhuNmlGcVpwWnVrdnk2aXFneld6eXMzaG05RHprNlNOL0dIVkQ5?=
 =?utf-8?B?c0tlVWR1UWlMMVV0VjNEOGNKQ1pQZnpSWGNhWmcrTy9aTDBXRXdVdDV4TzY4?=
 =?utf-8?B?Ly9JWTNIMnAyRkZuaTdkZkhBdTJiWWJEaXRsNTR2R3ZUTVhRUXA1R0ZmcHFI?=
 =?utf-8?B?d05hNG5GandSbCt6K1Q5SHVQSk1iOHgzZWRxZE5pb0tqMTA4STR5NHh0L3RH?=
 =?utf-8?B?Q09XUkllOEV3a1ZFd0UxWG93Wnd5YjMxeUpzMHArWE9zUGZtT2cvMkxReTJm?=
 =?utf-8?B?anJHeWl3ajNoeVprY095bmdtcHdUUUZRY3RSaXM2WkxqWkNlbXE1R2l1S2hw?=
 =?utf-8?B?YTJoUm9yZ1h0a3ZuS3RzbDZDbnFlWUZCK2hITlg5cXRINGRPcFVFTEYwdStl?=
 =?utf-8?B?TkJwT1pOZVUyZGtJQzh6MHRLbjR5Z1dDT09LaXA4WGIrQkE2WmdaZ3VJMERT?=
 =?utf-8?B?ZnVRTVB4aURINUt5QWdLRTBUV1BmLzYwSUhYU2RkVnl2WUs4Ymh4MHh0S0ox?=
 =?utf-8?B?V0RFYVN6T0IwQW4xRkVDN0hXNHRFYk1BNzY1bmVtVkVYS05NRk1kQmVmbnJI?=
 =?utf-8?B?dElHQ3JZd0NLcXYrNXZqMGNEQmFpUXFxem1sZmxQK1NFMUlOVDBXdE1RSElH?=
 =?utf-8?B?SmFFRDBMVU8xcUVuZ3NWV1RxN2JNMWxzb1RXMkRyL3BUMDF2YjB2cmgzUHNp?=
 =?utf-8?B?aVF2YWRFS3lXV3Nrekp0M1g5Z3c0STluUFdoTjNWSXU1YnFRNlRBa3BKTHVp?=
 =?utf-8?B?YmlaK285SFgydjVJOGlJWU83aTlmSGU2ak5OYU5EWXg5RlBFVmprZUtSYlIr?=
 =?utf-8?B?Sk93MzNKTmp0anVmUDJTc0pTckdIbm1xL0YrNlpTQzJTUEdyamlpbHRRemtF?=
 =?utf-8?B?ZDcrY04waGwxQ2pZNlgvZERHZzlWNUo2VWVHZy9HY3BpMlZWNURqWlQxY1Nu?=
 =?utf-8?B?RXRheUFPME8xUWxHajFiUk5Xa1VPeWd1MWIwQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:07:35.6655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c77df8-0822-4c7e-068f-08ddaabe524c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7627

The ABMC feature allows users to assign a hardware counter ID to an RMID,
event pair and monitor bandwidth usage as long as it is assigned. The
hardware continues to track the assigned counter until it is explicitly
unassigned by the user.

The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
ABMC counter assignment is done by setting the counter id, bandwidth
source (RMID) and bandwidth configuration.

Attempts to read or write the MSR when ABMC is not enabled will result
in a #GP(0) exception.

Introduce the data structures and definitions for MSR L3_QOS_ABMC_CFG
(0xC000_03FDh):
=========================================================================
Bits 	Mnemonic	Description			Access Reset
							Type   Value
=========================================================================
63 	CfgEn 		Configuration Enable 		R/W 	0

62 	CtrEn 		Enable/disable counting		R/W 	0

61:53 	– 		Reserved 			MBZ 	0

52:48 	CtrID 		Counter Identifier		R/W	0

47 	IsCOS		BwSrc field is a CLOSID		R/W	0
			(not an RMID)

46:44 	–		Reserved			MBZ	0

43:32	BwSrc		Bandwidth Source		R/W	0
			(RMID or CLOSID)

31:0	BwType		Bandwidth configuration		R/W	0
			tracked by the CtrID
==========================================================================

The feature details are documented in the APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Removed BMEC reference internal.h.
     Updated the changelog and code documentation.

v13: Removed the Reviewed-by tag as there is commit log change to remove
     BMEC reference.

v12: No changes.

v11: No changes.

v10: No changes.

v9: Removed the references of L3_QOS_ABMC_DSC.
    Text changes about configuration in kernel doc.

v8: Update the configuration notes in kernel_doc.
    Few commit message update.

v7: Removed the reference of L3_QOS_ABMC_DSC as it is not used anymore.
    Moved the configuration notes to kernel_doc.
    Adjusted the tabs for l3_qos_abmc_cfg and checkpatch seems happy.

v6: Removed all the fs related changes.
    Added note on CfgEn,CtrEn.
    Removed the definitions which are not used.
    Removed cntr_id initialization.

v5: Moved assignment flags here (path 10/19 of v4).
    Added MON_CNTR_UNSET definition to initialize cntr_id's.
    More details in commit log.
    Renamed few fields in l3_qos_abmc_cfg for readability.

v4: Added more descriptions.
    Changed the name abmc_ctr_id to ctr_id.
    Added L3_QOS_ABMC_DSC. Used for reading the configuration.

v3: No changes.

v2: No changes.
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h | 36 ++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index b92b04fa9888..7342ff03a5a0 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1215,6 +1215,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 1a4e96044aac..23c17ce172d3 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -165,6 +165,42 @@ union cpuid_0x10_x_edx {
 	unsigned int full;
 };
 
+/*
+ * ABMC counters are configured by writing to L3_QOS_ABMC_CFG.
+ *
+ * @bw_type		: Event configuration that represent the memory
+ *			  transactions being tracked by the @cntr_id.
+ * @bw_src		: Bandwidth source (RMID or CLOSID).
+ * @reserved1		: Reserved.
+ * @is_clos		: @bw_src field is a CLOSID (not an RMID).
+ * @cntr_id		: Counter identifier.
+ * @reserved		: Reserved.
+ * @cntr_en		: Counting enable bit.
+ * @cfg_en		: Configuration enable bit.
+ *
+ * Configuration and counting:
+ * Counter can be configured across multiple writes to MSR. Configuration
+ * is applied only when @cfg_en = 1. Counter @cntr_id is reset when the
+ * configuration is applied.
+ * @cfg_en = 1, @cntr_en = 0 : Apply @cntr_id configuration but do not
+ *                             count events.
+ * @cfg_en = 1, @cntr_en = 1 : Apply @cntr_id configuration and start
+ *                             counting events.
+ */
+union l3_qos_abmc_cfg {
+	struct {
+		unsigned long bw_type  :32,
+			      bw_src   :12,
+			      reserved1: 3,
+			      is_clos  : 1,
+			      cntr_id  : 5,
+			      reserved : 9,
+			      cntr_en  : 1,
+			      cfg_en   : 1;
+	} split;
+	unsigned long full;
+};
+
 void rdt_ctrl_update(void *arg);
 
 int rdt_get_mon_l3_config(struct rdt_resource *r);
-- 
2.34.1

