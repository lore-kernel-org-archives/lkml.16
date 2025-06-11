Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8889B23AB81;
	Wed, 11 Jun 2025 21:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677054; cv=fail; b=ibVbt3NtC8lsFO04rJh1OB5Op07u2EILhsfvBrCjPKrDL8DdDtwwGCA/EP5Bljkhy36Gg9VPOdvi3KpRcbFgWE+apOOAT7T+NPQx1aS0XgzN/lwokXeL8VMOzoZVZOJkmX1lUjJ8L+W9ybDHPdgT2zaDnAr/H/+IxQX04gHNjBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677054; c=relaxed/simple;
	bh=Zi+HlO67SV1SGTWi4ycwHUpg2uHh5R7+DRVxXo0UhQQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q74ZrwVTTEYYzdj38Bggge+m5FIblnU9pYUh+KBA/DhCi0CpoSBZgfFFeJ4fVkhujY/GvPiVLFZT5QgzYgIcpmrnsYEmgkgjZqaTBFf9T9PnnFv32M81iOrrsZyiAQHvHp3VKJS5Q6C3e1FBtCX0oScjgMJ1E1ZGuF1KkUtnEtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KD0TXbfp; arc=fail smtp.client-ip=40.107.237.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KD0TXbfp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxu3E/QcUTEThinpuEf0EPyb4dUj7vEVceTFZfw2xUg+JDRh92qDFHEtIXcG7j4uFMBDic0awYRPXweVnETnyq8cRMHqObsYoIV/3+arakKIwR3sVOKU+naHIUDXL9LjDt4jwIua2R4mG48DT4+WflSaTHYkO3/ptBzRlIPfnZBLJCqxT4mH1nbeUYXYEwHrHdp7PJ1NPtezRWaUTdhYqWCC+yTFda+0vw5wWDwTlxgHI2sD0abbtFWsSgTBVqwVuEI1+gs5Hsi2OYir9tc4Rb8Hifo4CsXMS1jSlmqJds6tnpGUzYSTjOodHJ8N0AnhHbCbuqN4XSc+CJsCoru+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9xGFVRbTUsmehLiQw9DvSUU6O+3WP+vQN1ZwkL8cC4=;
 b=dZbBMOond0+SMxozk1VswgRjzCdT35RFq9VqmCXBglJT+xTFweDgi6f7W4EWifGAvbzip7AYzi6/gPslvKLE4WT09KAC2LZstqOVY+l561glgu+Uwz0KfoGc+xDSOYMTq0oh2KhECNko/5jllNDmaPl0UwIaI6l3iLHdA6vuH9Vz/K8C5Ucnuz9eGGPLW7/givYpkj0PxY4itvDPTcWZAFgJ/HPztVftifYX31qaLoA/Gb8s+AfH2vra3ZXBSkOm1+n3Pm1Uwz7Xttg3AvcmgPgnW37vZVwP1gkL73mG3fYkPS9LNhxeywnaF9OGT8CEg1gZOFIqFGCmaCTAHDvhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9xGFVRbTUsmehLiQw9DvSUU6O+3WP+vQN1ZwkL8cC4=;
 b=KD0TXbfpesHi7B9NRxUrf7VmPqr5UsmSDyg2woDDWzy90SWwFpsCkv0hX+iwpDWz7Sm0TNd499KaizVQI1XcGueZgO7q40jOqlgwHrM1DX020lwEMkVI2u0gwqRu3BG5+yNytyOz1GcL1/HTMcqFY49HgGPevgGJHAYA0k/TVZs=
Received: from BY3PR10CA0027.namprd10.prod.outlook.com (2603:10b6:a03:255::32)
 by DS0PR12MB7803.namprd12.prod.outlook.com (2603:10b6:8:144::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 21:24:09 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::5b) by BY3PR10CA0027.outlook.office365.com
 (2603:10b6:a03:255::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Wed,
 11 Jun 2025 21:24:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 21:24:09 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:24:05 -0500
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
Subject: [PATCH v6 2/8] x86/resctrl: Add SDCIAE feature in the command line options
Date: Wed, 11 Jun 2025 16:23:27 -0500
Message-ID: <22176f481564e2fea9936592f0adc6824efe2edf.1749677012.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DS0PR12MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: b08cef35-4341-457c-10ea-08dda92e4da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/WLZ8nb8a0rGHJWdMzalc/ZrWr5pzpd3enWsBwqTYIJurruzmm9YPk7gnCaJ?=
 =?us-ascii?Q?VH9R+U5WFZWHCYUOqfsQemdt549nVw5GQinCI7m9avO5vmRTZQwkEnhfEU5d?=
 =?us-ascii?Q?fTA8ptNJuXOG/ZqhSj5a753r3ASdnHx9+TltBQUMPiH8CsJ2OkweAh9XID/E?=
 =?us-ascii?Q?X0ZJfEEBvZExqGzIdhQVad0YITAzgohyZmAuJV7ggaBxpBZqR+LMcAzWHXzM?=
 =?us-ascii?Q?97LmxxWDLDb5R0dGZTgHMKf89O1QVSQONbLvlzQhkD/XrizvIEhqnET+Q0fK?=
 =?us-ascii?Q?77dEtiTyeYVzwgHdMJEFH6SwUke01db5/FfY1fUUHnjuztYFOJBP3C5qR6Ud?=
 =?us-ascii?Q?9BXQhsSHssw23WRKz0pHciFNDq20/NPQqDq38f8C8/SbW+IJ6rFpL8S+kiJI?=
 =?us-ascii?Q?qKeDWW9AJ8/lD5TnmXBLQW/ngw3aJBhqFkbSwEegzaPP3KvIfjOCPBcU07fk?=
 =?us-ascii?Q?cgLQHpLT0ScrZp3jNEgttU6X+IX+rHm3GUuIMQsVqPelSvPSjVXI28qMseWC?=
 =?us-ascii?Q?T6kIMnEupyhqBgD2jOdnJRteOu/jwHO+SF1xUV8gHwLaKNSHeF7NBcDvziGY?=
 =?us-ascii?Q?2baoAcPKiAUxiNv/BiHILUP/RhAGKYRpAl/OcIY5D1oUL0pUjDuZO7M0JWXH?=
 =?us-ascii?Q?1YndkVQUNu+G2lLg13pAcPq0RTKm7mpZwCOcDn0zPBNYwwF1fYK8TME/w4xo?=
 =?us-ascii?Q?J3IEuaQ3G1IZxiEnTrdkCP8ZRa+FQbjHLWA3h6s28JOpPy+uBSVPlcaogZqj?=
 =?us-ascii?Q?Y21VPcS3O7C0weOGLzS5qyT2qHoBEM9XkHikda5phIow7UDNvvpEM4E/Ruqn?=
 =?us-ascii?Q?R/Bxlk8ThKn9QoVRaoruLSd9JYiCz7H42IRfP+uxGM2H8/pARjc2uxw0PPJ6?=
 =?us-ascii?Q?RZP1AZsNcqNcLPEQ4La1marx81OJEsqUkPRs0Jh8ksieSCt1dghQC6A2hglQ?=
 =?us-ascii?Q?Gd0vJO0PyoRSXjv8hKytCb+Tt3j2uq42swWKDZ6Iiln/HKiEu7GlbgQMR90l?=
 =?us-ascii?Q?NTS7KVPHJUUdY2cYCkb+eD012RH9xZmROvQ67otP0Cf2/sqRbrIdAH6jibny?=
 =?us-ascii?Q?nrI1gl1YpA+N9joUdJtzhf98CNVv1iHPQJJo+AORlvSdphPHFvos/ZbdMBGf?=
 =?us-ascii?Q?GBzVHl1M59YiCTa/k697BC0RxhhC3SRFBBmmzMzBftAzrUkNeU/4c2Mfg/jr?=
 =?us-ascii?Q?Q7zosau8AozEu9b/06j79EZe6/zFV2g83lAlksub6B/zTzCwxDcXnEUqTeEJ?=
 =?us-ascii?Q?uV5LTU9eHEz8AxKar2OC55+FhXGeWcDr3TISABILmwvPxHCTaZ95UVFAnRAX?=
 =?us-ascii?Q?jubQdHwMWi8wCDgNrk3ttoXH5vCybTg6B3Hw/R+c8Dl6X/msetDp1NDMBIge?=
 =?us-ascii?Q?CNBIgD1Sy1GuIWr1AKLzmLUNbL39rxwg/6Z2R602SxTGH7jm27DJXaMRh+AO?=
 =?us-ascii?Q?wy69Fqkdm8ME/QEV+QjEWwj4P3e/Jqna8HBD/MoFlJ4AfOAiGSUunav/Y8Q0?=
 =?us-ascii?Q?22M0dxTK8l/AjPMiPew1v0olVooeghXXB0ypp4hKjaBRBFr1FFdK0AZirw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:24:09.1531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b08cef35-4341-457c-10ea-08dda92e4da6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7803

Add the command line options to enable or disable the new resctrl feature
L3 Smart Data Cache Injection Allocation Enforcement (SDCIAE).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v6: No changes.

v5: No changes.

v4: No changes.

v3: No changes.

v2: No changes.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1f2c0874da9..95d89f881e10 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6066,7 +6066,7 @@
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec.
+			mba, smba, bmec, sdciae.
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7109cbfcad4f..326c679ade5c 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -705,6 +705,7 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
+	RDT_FLAG_SDCIAE,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -730,6 +731,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.34.1

