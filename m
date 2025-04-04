Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143F1A9B23;
	Fri,  4 Apr 2025 00:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726043; cv=fail; b=fX4wrzbav8c0suZBSqtiPAGASPMPrBZve9FITXg7E+wwAhjRJHDf4qfOQn7TrsH2JwlvpJFV84SgKFGn9ggm4AkinkclUBitpsq26nrDgv4omNoyysX/g2cKqg60GNmFn8da1nyw5t1NPNMf4WdHb2XO9mCzl68gUaO6Wv6O5k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726043; c=relaxed/simple;
	bh=VeMtJtqmWiei13I2aQ3zgERrqsKt6vscBxIJ6IILz04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XTt1DCcQ/FhTeVqhMUvIj8C1CXlQEMPlIGUKQliGXhnIfVvzUNMyiMEZOJ1WtDFM70yXZ13uzJtAqWuKi0K7wn+BbtuEhkYZKsBvMGtQ96XM74yu4+qV2fgs+qfk0tPjY7U7lkD767DEXoFXqLg4yBsdMOpaaidGNo/xbARbYQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gMh94tW3; arc=fail smtp.client-ip=40.107.236.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gMh94tW3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxYSSPKWPk1Rw/dBiHiOaEdIFPwipyHkIUtMCjgzR+2HbJNA7hGgsAkWDUU7L+36Q9nKzyGTN9/WxgWiGNacdXnl36Q+LeYBU6WPGPoX6ZKtulK40q3BNuOP6/Ja0vhS1QxOz0emIg7i3ul/N3dg6OAEmx77c+6YBYTwXXi4Xk2Dj0uNNbRfpfSvPqseDrAClUy6XOeiRRdGsd2u6r/d1znxdvHfOXj7doAS+zA+HNfhc42HjIoiuxNoZsGxl94Xh5pAa808KwmUskS6ozWGgcFvCKWEMpHfulVt17LI1nPPRZ7OoyvUmcJOG4xLNt2NQu8JswtBaZQIp3Piug6aTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSeJXEGSZ6bHVPiJdMGLcEn3QXDCt6Ztqylmqj58loI=;
 b=OS6qFxQAF4YWxVV6/59S0R5+vApYtXnJu+8P6/3SwA8WWbj/TqJ6NNHHnVOrqjdh8s5lcQpzxzKRU5Bg0RzwQC0cK1t9Deagefe7m4BvP/yjFS5XfwV7iStmyi86SqT4dE3I1Vywvc1UVhFfCbKtHIiRvPBXSvdI8mR0k1dGLXTRturI88yyZYkew/vYQ4kdf+qJtPAgfNp24QybflpBHcYQN4ZV4/g59vr6UInOaCth9UZ8V2JL3wjKFJjm3C802f9uFumbc3jE+SAsyGfaZe0wraTBkpv3Ex/rc0/s0nQULo/YMR0OME0bLLJS/8oPz45JuYW9np6JvwS+cwA79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSeJXEGSZ6bHVPiJdMGLcEn3QXDCt6Ztqylmqj58loI=;
 b=gMh94tW33HWAclKwazSet608bUPWjqDRG03Fo2kPIFnUbY3EQcHoFGxPPxJHJsf2Z25YYo4v4Jf4xum+fY1UK1vj/A1azK1+2swWbVTQIc5pPBrLqznHZPTl4xR+cWOoyRlbWRPCZjhAvJMDDmhQFkV9Gg7ob0t7Z8v4UE0lC6Y=
Received: from SJ0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:a03:331::10)
 by CH2PR12MB4087.namprd12.prod.outlook.com (2603:10b6:610:7f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Fri, 4 Apr
 2025 00:20:36 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::ae) by SJ0PR03CA0065.outlook.office365.com
 (2603:10b6:a03:331::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Fri,
 4 Apr 2025 00:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:20:36 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:20:32 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <babu.moger@amd.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
Subject: [PATCH v12 12/26] x86/resctrl: Add data structures and definitions for ABMC assignment
Date: Thu, 3 Apr 2025 19:18:21 -0500
Message-ID: <3a15e2e5d6c8a5e9ee65b3fae48ada7eafb77628.1743725907.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743725907.git.babu.moger@amd.com>
References: <cover.1743725907.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|CH2PR12MB4087:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db0d820-d23d-457d-acb6-08dd730e8568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDBwaWk4WlJER1c1Umo3UXV1NURJdENGOUU0UXhFVUlaMjFpTyt0OFRjKzNQ?=
 =?utf-8?B?REU5UjA0SE85elBKWThUMVRHNFYrQ1JMUWFkM2diUHJvcFVkOHpleGYxdUJK?=
 =?utf-8?B?dEpGa1lwSWNoMXoybXR4NWM2YjMwUjBESXA0dnE1a3FKdUU5dVhmNEwyNjg5?=
 =?utf-8?B?dW14NFpva2pyeVNEU1Y1V25WbkJIYnRrVnJFTlI0ZXVrU0FTd3dEeU1vOHpZ?=
 =?utf-8?B?aHorNTRTTVdHV2tVWE9qamVDWEMvNnBNVUpQTlZQYlpmRC9BSjcwcDBWTEox?=
 =?utf-8?B?bEl1b0FPMUkxTmVCWVdmbi9QbmorQ2E5NnBsTVV1YU1vKzBPWHh4TE93VXRF?=
 =?utf-8?B?T1cwL2krMmx5R2YySm1JYms2NjFwZ0NlTHE5c2V1TFV5SS83OUVRNkJLZ2VR?=
 =?utf-8?B?YjRhdUJZR2FDaHhUWTIrdUdZZGlNTlVvVlEvT3V5NnNINWIvUitZTmRhVVZL?=
 =?utf-8?B?SXJ0Ulo5bnMyaDZQdWxYRHY5OWc5Q052bEFIVDBQOXp1SlRGK3dSb0hBSXV3?=
 =?utf-8?B?Q3RHVkVCNG5MMnVkdWNVVHQ2djBycUJBUjFmQXgwdzI0NVhHVmpjMXJCaFE5?=
 =?utf-8?B?MEVodTU3QXBpQ2tlS3hjQTVjOEQ2NStNeEJZdHNQUDZ1WWFCRURjTUd5R2s5?=
 =?utf-8?B?MVBCbjlXWjBkdGRiU2h2ckdmMXQ1SUxJa3pkNmhlNUlHOXBlOG9nR2JjMks0?=
 =?utf-8?B?TXZBanhWZlZoMHdrN1dBZ2JvYVoxaGY4djVweTJVNmRuMldwbWk3eEs4ZlBo?=
 =?utf-8?B?dkZpU3psSTByWm9DQVgySE4zRkdadjJ3Z2liNGpaUk5BWGdtQTdtaVZBTjd1?=
 =?utf-8?B?ZVF3YzVseFBVNjhnV0dzYU1VNC9OTGNrc1VkSXJIVUJYYzF3emp6U3RWbVYy?=
 =?utf-8?B?UkdVREUwTTlCb3plSDNJL1U3M2Yybk12dVFTUTM2Q3BZYTlCMDJYZWpZOHNT?=
 =?utf-8?B?M3k2VmpSU00rY3A2REQ0bHdyMmUra3VkVEFqNElpTUJVREFPa2JjR084cFhQ?=
 =?utf-8?B?WE1sbE5ENzNCNGRITy9hTDh0aEhFSTZTNHFhRStZNDNQNjRFeUhUZHVtbEhr?=
 =?utf-8?B?WVAybi9TSkRwM3B2Z2kyZ3JBMEU4MXlDTWMwN2pLSWtJVDZ2MzRTTkw5bW1K?=
 =?utf-8?B?NWlHV1UrckhROFRGRjlGRGNycEM4d0RoU3ZPSzljdnVvcllBVThWcWxvTU5T?=
 =?utf-8?B?a01WTTVDUkowRTFYUWlaV2VjSCtpRElVaHZVQVlTQlV3NFV0VTZxVU5ZTGNZ?=
 =?utf-8?B?TG9sbWdzTVRsdTRkLzVwSmlqZThvdEdJaWkwMDJGVlJyKy9kb3l4ckY1YjRQ?=
 =?utf-8?B?TEZQRTNaaERXVkI1ZnFFcjBiNWFuYnVickR5L3dlQWJwSEVvQ042UWMyQ0tm?=
 =?utf-8?B?Z0FDc0pEbDBaVXdZbGlhaExwbGNsd01oMGVzbEZtTlJFUlNObEF6WFlmRFRK?=
 =?utf-8?B?NTJLUWk4RzZFMU5pOTlGa3N5QkltemlzcGJuSTZWZUx3cVc0U1dwTUN1d3Ry?=
 =?utf-8?B?MVBuaG9IOFZJakJFUEFWZkFFS2FNdTRQWVNXVUNNMCtzZzhNd1pWSnZvVjBT?=
 =?utf-8?B?L0syUGRjc015c21TOFlkbEhTNUc2SXZ3clF6aER2cTdTNGR2VjdoS2dPK0Nl?=
 =?utf-8?B?dFRzOG50UWRZNkJJUFBqOFBvUkZSY3VCZ1l1VmJSVEdZNTJ0V3haaWZGaW81?=
 =?utf-8?B?bXlscHZLb3Jtdll5Y2JERjJiNG00azA1Y1JZazl5cXNKcnlJbFdodlJrQ3lr?=
 =?utf-8?B?c3gvZ0pCcFlBdkI4UC9uTWZIMExESWY5RmZIQkdiRVF4S01jcXg5bVpBd0RZ?=
 =?utf-8?B?WUswSlFLNG9HRWZoREg0cEcwem9xc0E0Q2YwSG9LVEpVUlBqMWVpSkhQNGJQ?=
 =?utf-8?B?aVgyd0ZtQk10TmlyQjJpMXVZalplUGMxYkJIVUpxNjB2UG9JQ2VRSjZndXhV?=
 =?utf-8?B?RG5yM1pYd1BSR0t1NE5vNkZVTC9aSzNvdUxCUEgxNHBTY2Zrb3ErQ0NDZkFz?=
 =?utf-8?Q?u079ChN+4L9+k7j+KSOttZnzv1+uqI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:20:36.0038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db0d820-d23d-457d-acb6-08dd730e8568
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4087

The ABMC feature provides an option to the user to assign a hardware
counter to an RMID, event pair and monitor the bandwidth as long as the
counter is assigned. The bandwidth events will be tracked by the hardware
until the user changes the configuration. Each resctrl group can configure
maximum two counters, one for total event and one for local event.

The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
Configuration is done by setting the counter id, bandwidth source (RMID)
and bandwidth configuration supported by BMEC (Bandwidth Monitoring Event
Configuration).

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
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
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
index cb3c0720d910..17f80eec2202 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1201,6 +1201,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e4b169fd6970..0b73ec451d2c 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -483,6 +483,41 @@ union cpuid_0x10_x_edx {
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
 void rdt_last_cmd_clear(void);
 void rdt_last_cmd_puts(const char *s);
 __printf(1, 2)
-- 
2.34.1

