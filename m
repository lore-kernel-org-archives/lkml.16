Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AC428CF5B;
	Thu, 15 May 2025 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349566; cv=fail; b=Rx4Ehb0oK6pqKZ4LD27xdfoVm7bKJGKihB9S0IshlK9FiMNj3aHqK9o4PfO0b1j/fbeXpnSVVZi04ka/SCnQbRVZlNzLsLoHEqBUREqu4qTZfCwCV0pGhzqJl81ZohJEJ37gTAlWgsTEWIeHXZUO5elptJwTT7v564yEzt7d3B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349566; c=relaxed/simple;
	bh=0/iDnoAeqpM+vJ9H5LPo6A1avDG8P61CkYy/phjGLOU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EAYVysgcz8M5vVglWuou/S5454bM9IsLczf9JjK8NbvmmDuNthvc21xMA9hT4p8i3rIpZv67PM5ln3u9qcrbEi8OwTSzS7mT247z8D0pJDwjElL13ZjJ83M+B/n8RuFqQC9wCgsBOUReGHtBTzPimo5hkH0OxQOcSIUHC59ZSVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=V8MyZMfn; arc=fail smtp.client-ip=40.107.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V8MyZMfn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtlj3/Gw9CwgTgI/hnlYvpNtoR3ZGgixeGF/RtE1hEvO5XO53KdV0hgG89XIEOU15wvvowwMNb4wB0RDJ/StvJ19vqxrvV63Rb61ElCBpFTIMevEXPjuhU2vEQ23XcGCdaqOWF8Qyrv4yvBaTmLkcoRmPv20RkJ0ILgEm8Qu+vM20W9R4eoyhuHY4xkFn6q7ctbn5gNwozQ2l/wMfHWYuK01a4FdLUyqYG/9jhgDQ9UxJE9+/ArgkiKzgLzCTHq+f+6VQ1fjUWRHj3os5Y/q0koEqzWVA/vLalx7gPwU/zja/u9aldd4ffAHcKuip3qxlkwndHI1qgEDCr8yOOWF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cyQCtr8wFokSYAvV/dk7NVVNUo65eWk53+zUQGPfMM=;
 b=qVhyrSY1Ek+ZIj/hWTgkvTmaAi8rAJZxvPxg41FB40udZWwStwLz21udUmW2nBlVef/K/LakJFCFyWgSnoLU3V/Ly+k9KU9XYeuvgonguRN6EizoEEhEWjtsC3VPBsONO08TZ2P3cxDzoog7r7l1jYaBCx0DOTerdHajnoIC6IW+JBR90ZYmXBqAQ7QbIhGyA9eftK3X44DLVv2V/E6Pzx8g4HgUajnmTa0tW2W7rZtjcZaI8ok6j0WJPY7KwHRW1yUpM8yBw2e17Fq/1wp2jY5/BYP7zsf2MX9qaGs4F0HmhWfichLEmQ3TkHq1uNzMD5LU6PdhzfI8dyX8573LnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cyQCtr8wFokSYAvV/dk7NVVNUo65eWk53+zUQGPfMM=;
 b=V8MyZMfnQiVq1fwTOKS6p6lFRMys1N1z4ItJdWUMzr+j5HdHy3xCFapc8acDHSGQflW3Ghdhm1eRnnUIpmQF2KafMXGyc86Lv8EOefd2MczAqMWBvvUeO6gTCKskTDuAOun8iS3qDjG6cGiLE9u1OQ8QnmmJd9g3ha7neeNrLPM=
Received: from BN9PR03CA0358.namprd03.prod.outlook.com (2603:10b6:408:f6::33)
 by PH7PR12MB8154.namprd12.prod.outlook.com (2603:10b6:510:2b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 15 May
 2025 22:52:41 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:f6:cafe::ed) by BN9PR03CA0358.outlook.office365.com
 (2603:10b6:408:f6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Thu,
 15 May 2025 22:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:52:40 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:52:37 -0500
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
Subject: [PATCH v13 02/27] x86/resctrl: Add ABMC feature in the command line options
Date: Thu, 15 May 2025 17:51:47 -0500
Message-ID: <a36eed6b7b499a46e5b560f014a3bb1586d6bd76.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|PH7PR12MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 8937266b-fff9-476d-40fa-08dd94033273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GXXwuns4yVkZINtHeikLBORvFX3yEYpU5UYA/NOugon0N9eyaAIfC+MPnCuB?=
 =?us-ascii?Q?RbmCJUTWiJZV+1HiJ17D6HsAvIZFEWznjOk0viRuwx13sRxf5ZARtIvx4FNy?=
 =?us-ascii?Q?tFqOYDSEIetXXfnp0CgeHPGZtMYBkFTtd5YT2Wt+ehtvChFPbKRzH1SeElvP?=
 =?us-ascii?Q?lpejjamnOy3UaSNaQiNoiJt8j6892y6t5kd58zeYg9oGnIHZWIXKHChWoe3B?=
 =?us-ascii?Q?hdGrOQ4usOOq7UqC4hZCfGwaH8VdVSyaYL/J9fWaksH0Cz9zsMW3Ncozaryq?=
 =?us-ascii?Q?RO961xVzB0nLf0FBknQKaJ04QAedHRoqD8uURQYnnsEzbWzbJq9emiYS0dfl?=
 =?us-ascii?Q?HfUGKD/Cxchq9b0AU5CJ+FhVPsQAovIIziSQqs883BV9Rtev/igQ/xLSS8d9?=
 =?us-ascii?Q?DnPeiQ8Gt7E9rGXafhANkDVDZnted1qwnjpKfKdKraBAtJ8N8hK8V/wvS4AK?=
 =?us-ascii?Q?zqGXp+8MzJ0oEGpoTIJgZriS1GBQDv/R5MwcXxuTE/ZgbtPMv7B4SGW8Mmn+?=
 =?us-ascii?Q?jIsSJYcFUuoPiSTOLFaaH++syAfxGXw0WgBLpUKwGE61mGh/127YQitN3LYY?=
 =?us-ascii?Q?QPw8Ijs6VtQWZVFLAedrV2E4kq2Y68lxJkgX1OfSVosF01vszvwg/IliKF/N?=
 =?us-ascii?Q?XGUCknAjWhxR0/Np7V93gyEj54vlvkBbf1/TSDC/gq5qOiG1s3rWoi8zpWIO?=
 =?us-ascii?Q?zS80mRKFlTR9b1oHxq2oiBO6F0t8UOT5OTxo6z5eIIEXJnOyGnKKk1DkZ3pz?=
 =?us-ascii?Q?ZFHecfn3dfpxNat9YOB8zXAQJ+7nxLxRQvTkDtav8kWCxArY1+LpgnuB5RF9?=
 =?us-ascii?Q?PX4ZbGCOERmI3KJnJAmd5jX+m3OHWvh3O57IPImTmYhjyMBxYMLtqbImG7Md?=
 =?us-ascii?Q?kVpgiwXIvRZ90Gt7ElNGXlpcxwcQrJiKrVvE8/WrB+nte4MgccqNNA3So0q/?=
 =?us-ascii?Q?zhpz4LhEo1b9PIf5VMex24rzch0xk44eGTqOT2eZ9TibgNfhIi2BKt/2RDXm?=
 =?us-ascii?Q?LNQ07QHW3cDYQwQg4Fl67hl/kBUUr7niwCoFNdAUKSPDHAjq2mRxHz4Ee4G9?=
 =?us-ascii?Q?V0oc2RZd9wPuXoHKvA9LMVfjsDT19TlMoZwIpWuhfrPdCqTaAUeUA0lhu1lO?=
 =?us-ascii?Q?gLOUVXdE5/+xQqUc2VlnsPtIHJUIrNyUTDmtusm22z1IEs0YqvVgg9j5WtbS?=
 =?us-ascii?Q?cfDW10ZoBccPtk9R8u/5Mp0hveN16HtCbHrxsSSNRHV2knmTnMoHVIkpV4nH?=
 =?us-ascii?Q?caIozI/XkXjJ5Y1Zeu1rja6nDeXko6c5CuN77GQ3Y1oloGkYVAV70QwxztUZ?=
 =?us-ascii?Q?oZu6LaTQzW4ktkZ3YSxW2aCWcSNTXl7TW6DxNU6hEejUDgoqVXRc5PCNHvuX?=
 =?us-ascii?Q?H0sJGsfWsIErT/qXlEsdgg0GWklb6hr1jMpa4Q27xMaZ777OENc2xftAhF6X?=
 =?us-ascii?Q?/c66SWJpqKY3Q1bjZJiKJt/ynqC37wdWt5ka5nfPKSm6MZHMjI/op9AUPQ0J?=
 =?us-ascii?Q?u6NOepYbkScWazSB1CHDG6Kg0ysgfyTcoVy2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:52:40.8285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8937266b-fff9-476d-40fa-08dd94033273
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8154

Add the command line option to enable or disable exposing the ABMC
(Assignable Bandwidth Monitoring Counters) hardware feature to resctrl.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Removed the Reviewed-by as the file resctrl.rst is moved to
     Documentation/filesystems/resctrl.rst. In that sense patch has changed.

v12: No changes.

v11: No changes.

v10: No changes.

v9: No code changes. Added Reviewed-by.

v8: Commit message update.

v7: No changes

v6: No changes

v5: No changes

v4: No changes

v3: No changes

v2: No changes
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 Documentation/filesystems/resctrl.rst           | 1 +
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d9fd26b95b34..ed9761bb2e4a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5988,7 +5988,7 @@
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec.
+			mba, smba, bmec, abmc.
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
 
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index c7949dd44f2f..c97fd77a107d 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -26,6 +26,7 @@ MBM (Memory Bandwidth Monitoring)		"cqm_mbm_total", "cqm_mbm_local"
 MBA (Memory Bandwidth Allocation)		"mba"
 SMBA (Slow Memory Bandwidth Allocation)         ""
 BMEC (Bandwidth Monitoring Event Configuration) ""
+ABMC (Assignable Bandwidth Monitoring Counters) ""
 ===============================================	================================
 
 Historically, new features were made visible by default in /proc/cpuinfo. This
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 224bed28f341..15a1dfa92923 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -704,6 +704,7 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
+	RDT_FLAG_ABMC,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -729,6 +730,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.34.1

