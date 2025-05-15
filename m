Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08603293725;
	Thu, 15 May 2025 22:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349643; cv=fail; b=OMEkDaKS4OKJiD1d1IT+oNSZEkibcu8PfTDp1K9ppSVChPSvxy+o5qwpwZDWBPko9x6rl9tm3yVzkCymQFCWOY5/A8aA0V87U+smzETSvsvU/tpzCS+fS3iKk6Vn6NF7LcCnsRmbEOQ74qA0LnYX56ZS+xIoU7J88xSU0PEnT54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349643; c=relaxed/simple;
	bh=yUuDtlL2sYe+G/uLccQckjUWWZPgK/Z5VhfCOz85ejE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ps27wcdzrFr4bLVp58vYrwdE8sdb8FcaY4GYnrIoaDVW+d3qj/mspjJhzhdf4yglZTXVTeipsOSb3KXvhLtxRozMF0kXMPd3JEpbDSbyhWOwXa2N9FCX+YHxp5GVZmR+dhubNz9G3gXmwRlRuXzgafhB/1pTK6hnhP3/zKVYTBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Lgnmh1iP; arc=fail smtp.client-ip=40.107.236.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Lgnmh1iP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntKT+wAyE31TW7K5Sqg1xcx+Dlc5ovIMQ6pl4JofkKiIbmTHtNgV6wG/V8X1ayp6jVsC15OInViO4Sgee0KLEOFx36zLxgDrS0kIAaPIJEPJ3ZOiadb54VaQUoEQhLLMTOruf0G3hAESWI0nIA2xBE6AHyJrOXsbGd1uSFq5HK+pd69AkW8BilqdpgCwGY3wLfW9JPMScZPj55MEMHMr/d4g9rnyKK8oHGX0XHIUVT6Y0z9+oObqffH+VTmASDmJt8/3/GrFx2HMPmokG7/d48e8zltb2T4WWK+ooE+J/R/l6tIKe9awVV6aoP00wO/u/xzsqf97i4IdY+UCpRirng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HLqapW7lVpWHpZJhR0jaO7dcTA/iR2q3oyNbdM9U/E=;
 b=zVD8zY6EogN2Myv0rvfpPmZbvB41WRx8xoBkg1UKNfmTUtWeuqFA4jWxeH1MQK+iSEkWxIeR30eM67wokp4F3suRPfd7NsD+YBT7qeyIq2Ol5z6mdRpK0jkpeH4+9GMSLA3UyTvUTwqkGme0WcvLqTfvmSHlXtr1Eu0QwsXo8FOAntbg1nabhih8twTgEWIwFq+3Dg+cac8rci+2OLCxPE+ui3gagqEdFdZEa5i2AOZdOtn8rXOO0wJRCbmfMbgqbtkRrqv2BXojBhzA6Ku1X6iI8MBVZRXGbsgU5afGfEydcjI8wO0y24pSd7uK5XoRuv/zFsuOEBmjFFTkRBuLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HLqapW7lVpWHpZJhR0jaO7dcTA/iR2q3oyNbdM9U/E=;
 b=Lgnmh1iPM9158e2hocuNkcxPiMrhUcU8avibQCQ/vtCqbycpij7ifQTc8qU27IcF0AsuglfeQf4hIJP3rjMGso+mFGZTKuudOt4EhZUPrtvQQlXQS6TEvtH3wtaWW8WA/Avl+8DYhuGE+pkX2ikqadN19KeziSLlfj97At+6M88=
Received: from BLAP220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::6)
 by SN7PR12MB7933.namprd12.prod.outlook.com (2603:10b6:806:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 22:53:57 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::95) by BLAP220CA0001.outlook.office365.com
 (2603:10b6:208:32c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Thu,
 15 May 2025 22:53:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:53:57 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:53:54 -0500
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
Subject: [PATCH v13 10/27] x86/resctrl: Add data structures and definitions for ABMC assignment
Date: Thu, 15 May 2025 17:51:55 -0500
Message-ID: <5fa043432aa1a697b11b0bd5fbd25a778014fb43.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SN7PR12MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 204e2e42-85ef-47fb-74bf-08dd94035ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rko1QWhsbEo4VW9EcFVuckh6aUNUc1ZMc2V6cVJtSi9ldzFJVUN4NkNjOTlU?=
 =?utf-8?B?c1I3ZS9wc0h2T1o4cnpXbnJ2eUxpellBc3h0SEs0UkdNdW9BYXB2VFl0U3c2?=
 =?utf-8?B?L3ZaOGhZVVFLUWgrNGpxNmc2ZWZvdWRoQkdVSmdseGFvUzk0R0N3TFQ1aG5R?=
 =?utf-8?B?bFRCdW1NamtwTlN3SS80cHlBdFM4T05pRFdsbzF1Q09ZU3BpZklrUHAxeENh?=
 =?utf-8?B?WWJ1N25SWnJFUU0wTUN2L3NxOEVJVXEyQ2V5U1pBRmNQQ1B1clBlWDVKRmZC?=
 =?utf-8?B?d0ZUai9FSnlyMW9hT2VoWkR6NDBJT2RoVXZJRTI4RXl4Ny9KWkdHTjdVTW5n?=
 =?utf-8?B?bldmRlBOSHFjZkNkV2Iya0ZOZ0xISXhPZnd5T1ZsZjZsTndWNGF1Wmx0V0hB?=
 =?utf-8?B?b0R2cjFUSDUvYjVaYk1US1dpNW1Ga1NNeE5sWXpuKzBsYTJJUlBHbFRYbE1C?=
 =?utf-8?B?RDU0bVdVbzNHd3VHWTRQV1RJWXhRSEpjRzJRZEVvOFg1ZE1XajloNVA4Q3Y1?=
 =?utf-8?B?RlkyQU5HaFNUYmQwSnNBSkxpTjR1L0hVeW9xNGs1VVlIazJiME1pMG5XaGJr?=
 =?utf-8?B?cVNXaVY1dVc4STNHcUxzMjI4NStxUUhFS3RpM2dTY0lmVHQwN0lZSXFQV0Ey?=
 =?utf-8?B?aUZTTnl0UkM2VTh1emxCVHpqRElta3lncWcyTVlKTHBjeEFERGR5SFNSZU14?=
 =?utf-8?B?SnF6SkdLWDVHaHE4ZVh2bEswbUlKYWkwZGVoZDZkaHEwcTdhKzE4TlFhaVhr?=
 =?utf-8?B?cHdKN2ZYZUF0eDBtaWhiNE1ObUN3aDVuWFhjZjI5SXRmMzZUWXdiVHd5c0l2?=
 =?utf-8?B?Y3VBZ21nNlBScEsvK1RGQm43Mm9QWFk2bktyZXlXVWgza3F1UkR0QVFvL0xx?=
 =?utf-8?B?NTRpS1NqRW1rWWVsNjAzLytvQkFxeUhQdXZuTVBoWWF5ckJYM1BmNGNSTWNt?=
 =?utf-8?B?QjhNUWw0anpiRGQ2cWt6dFEyQ1hiTlQwb1BMR2pFZTYwaWtkcU1RbEZwZkYw?=
 =?utf-8?B?dWdjdDcvbkRYczYxaUR1TmpoVml6TVNLNzVsZWJsMUJwZmVGZHVESDhjeEJu?=
 =?utf-8?B?WGwwSmwyNUk0ZkN3UXRYNFU2RDRDNkpDUEZZb1hNRmQrQWt3bHpURjFTMXpX?=
 =?utf-8?B?R3IzU2M1MTEraDRUemtMN1V1MHQ4ekl4MDZHZEIwTTVEN2dpVVR5c2ZHanZl?=
 =?utf-8?B?NmJvL2V6T3VGdStjcVlHRVBReUFkNTVXNnpBdXFBNUNtRnhVaWo5WjJvd3lm?=
 =?utf-8?B?NmoyME1jdW40am8yY2pGQTlhS21IOFdJbWZXUUsrcnR3UTYwaU0yTzBWSUg3?=
 =?utf-8?B?a0pmSUExclJWU3ROTEZadW5xK3NDcTFKRnVBRUJVMkxLcG5MVE9OUHVRcWtT?=
 =?utf-8?B?UjFva0U0Ymk5NldQbkd1UVpkdG1jYUtUMHpvdXVuYkZLQTdUZzhBK091bjMr?=
 =?utf-8?B?M0pBQWtuZnlhalBjeHN5cFNDWHZnWXVQZnVRWG9CcWtRRlpua0lZTnJiMDNk?=
 =?utf-8?B?TFR5Uld4a1ZnYStyRUZ1bXFXZVc2MWVHUVMvd0FXV0ZXdWh3MmpSWTdTVGh0?=
 =?utf-8?B?bkJpcXA5WEphYm1ZK1hUWFFwUGV1RVc3TDhabHpJUnREZW5yVU8xTzJQREh0?=
 =?utf-8?B?SGczM3p3SytiSDZWaDN3YUJIUlBSWmtKYnV1TGtlOEw4cWlsVm13bDZiaWg1?=
 =?utf-8?B?by85RGdqOFlaV3JRNGhHOVgzZ1dMd0x3QUFyYkZVNDRUdGM1YWRRZDdFOGJN?=
 =?utf-8?B?U3pGQWp5SWJuNHlpWG9kNVpJaTAxMmtPZXlYWW9KNTdDVnRoWlRacTlRSWtt?=
 =?utf-8?B?REFqRVpGNUZSQk5DNVdWTHRFL3VKOFVEc21FY2NDSUluQU5DeThjb09JOGY0?=
 =?utf-8?B?Mmd0eVVhZHQrL1MrRm5WTTNNMWhWZ3hDRmViSUkyMnUydXZ1WEVnYXAyVk14?=
 =?utf-8?B?N1pSYnZmMXlpZnlDalZzWWRpVndiQThnRmpXZUNkbG1pT3NlWXpiT3lIREpy?=
 =?utf-8?B?K0pySjhrZDJGZUczZnowWnVBMUpCRTcrTzUwdGprQUNZTzRXVDY4RzBxT1Rq?=
 =?utf-8?B?OGF0cHVVZUNPNkVyV290eGJCdGRuZ3Y5ZVRiQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:53:57.1839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 204e2e42-85ef-47fb-74bf-08dd94035ff6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7933

The ABMC feature provides an option to the user to assign a hardware
counter to an RMID, event pair and monitor the bandwidth as long as the
counter is assigned. The bandwidth events will be tracked by the hardware
until the user changes the configuration. Each resctrl group can configure
maximum two counters, one for total event and one for local event.

The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
ABMC counter assignment is done by setting the counter id, bandwidth
source (RMID) and bandwidth configuration. Users will have the option to
change the bandwidth configuration using resctrl interface which will be
introduced later in the series.

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
			to track for this counter
==========================================================================

The feature details are documented in the APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
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
 arch/x86/kernel/cpu/resctrl/internal.h | 35 ++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 3970e0b16e47..b5b5ebead24f 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1203,6 +1203,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index fcc9d23686a1..db6b0c28ee6b 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -164,6 +164,41 @@ union cpuid_0x10_x_edx {
 	unsigned int full;
 };
 
+/*
+ * ABMC counters are configured by writing to L3_QOS_ABMC_CFG.
+ * @bw_type		: Bandwidth configuration (supported by BMEC)
+ *			  tracked by the @cntr_id.
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

