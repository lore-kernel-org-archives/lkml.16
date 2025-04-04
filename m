Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0A115382E;
	Fri,  4 Apr 2025 00:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725968; cv=fail; b=RSBUhiWGYjJo/TgjKGCz0X3pLCQGXPuDYA+7gupCRpjkztBKavHZANZD0QSZAoI3dO7di1RNGr1hzReudwWXHflUmitDCBlvAmjG9HLq1F80ZMGhbiPAZLzZ7FmO3neCLxn4OcUX2Sb3AsfpuSj1J7x4z53uOM6IuaUesLzf6gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725968; c=relaxed/simple;
	bh=GtTjOQAP5uuYoxYMAieF34TGG00uavkEQaCTR4X1Ioc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ifdyigIqxRMd550fgejzDz0iyQXxkeJwcFUklf53UUB53qEnseJMQFiu2D8kZL1tC6XqLYt9ePCc3I7b+W5dVnPhwxHIQHZvqTMjdLoJ2mZLofXvip6ErsfeOD/QrMZhYmkpz3U2hoJR5Y96Dt3vJoEh6klC5oMceEZk2lKyuTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IFNqL8nE; arc=fail smtp.client-ip=40.107.93.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IFNqL8nE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2MP1faK47TkDx/hlEEZ4IXGYZmm2UKEQ6F7OycDNWEmR1k61+FIT4JyJjn5wB7yFQDj8zd6s5q64tgduoSOFTQ8Jyq13rtW5it9Lx7LfF7Awoa+TGgul9m9Yd6+yg/IP/JMiWCfv02jXvUdwNl087osbDgR9pEdliLFitRHd7v7n/uKA/iS1exnIQwC6G9ZdLiaECIChlI7cjofJowk9v4GnNrePbt6gEXBfyZ1ZdNEWdAxU+PNRgipyncUF/WYAorXUpyQwc9SVaIwmxdCQz4JDptNSgzGgwkGmTJ+4OZIizmy9yZo9iVTvRwwr7hmw7cAZVUSA/cMwgrO/OuWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OObN9NCGIe31oylmJNA4x3xbFZTJzokhHJV/MDaj24w=;
 b=u8QYPQGCXgNrGQS014sjF68jasGVA19g+p/7MH9/k0aDnq9asei1RO16JGihH1jKZwUb7rkWtomNvOJ8OqF8dzVSqFzTbBQjzOWeda5Djx9IvLjyCzjPwVMqXcY20qGRiOT+P/PUEWszHgyjgX7mk92ImDFUHTS4S+/CN73v+4J7EvMvloP04c8f7GyqlNYUAquN92qtURd/77QFOAFK/ItK8P0GaWxjx1LeNysdCdmRIzVA2h0V+TK7FFSJEGbvbR2BDhf/D75EyOctmYJW2eLMpEzc63BF+cG6pSOCmoLAVeGOe3JsYv7RyBY4daVHdPbmJ0MO9JX5Hh9nE1p11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OObN9NCGIe31oylmJNA4x3xbFZTJzokhHJV/MDaj24w=;
 b=IFNqL8nEooRLzWu15Fzjxv0SA6ktVAifb4Nzwu3p2KST+Elc4CeOKdTFh4KsEhZ1M9CyGuYKfr/tl80TRa1lnzLHKqnz4+E5NCy0W8xu92S4Wc2akqcRdDHrpXj/WqPKsA740clS+HxeckViTVPkj9JrUvarFVpCTmyDlS3akHs=
Received: from MW4PR03CA0240.namprd03.prod.outlook.com (2603:10b6:303:b9::35)
 by MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Fri, 4 Apr
 2025 00:19:22 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::f2) by MW4PR03CA0240.outlook.office365.com
 (2603:10b6:303:b9::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Fri,
 4 Apr 2025 00:19:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:19:22 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:19:18 -0500
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
Subject: [PATCH v12 04/26] x86/resctrl: Add ABMC feature in the command line options
Date: Thu, 3 Apr 2025 19:18:13 -0500
Message-ID: <e3019f750be4d8039bd24fb16f852e5caa0be638.1743725907.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743725907.git.babu.moger@amd.com>
References: <cover.1743725907.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|MW3PR12MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d94457-72f5-4f5e-4fc1-08dd730e5960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MUjSYaFRSkPWqYumhjHF3ok5oPBVa5IThi8JYCHa1tHkrhCJZe52wt+UiVFE?=
 =?us-ascii?Q?BpAY6Grq5ZhRzMru5QE6boBeJUK3SpORlRBWk45Fq3g03M6Brm9w+QmjVY6U?=
 =?us-ascii?Q?EMl53J1sYg0LDJ/aUldUA6O4zQc0NHOi716QPkb5k3D6TRVWBxLbAMqXSKYT?=
 =?us-ascii?Q?uW5gz+QKOXWE5NJnXUUZVr+kLgePwBhPUjMs33NusVOGFITTdgRb4mM5ZHeW?=
 =?us-ascii?Q?x7GYrICusg9Q14zNFzlSyRa1vG0OwocZ8XGZRkPQCSwYHV5aM9dBQD/BBpFi?=
 =?us-ascii?Q?CL3xU27Un1Za/07lP13K4sYGnZud1tGsX/6wCTr0/yP6Su3AHFFZkgXaTjhY?=
 =?us-ascii?Q?c9yLJSVj9tKXXwf/MgVL004fvf+1HIAx1zsHnWUjowwAfYGSdWPRmOtJ3KAT?=
 =?us-ascii?Q?VkQkrvlsG8htRkUE4aHDJWeHB/FR++sbyBj1q7l88xsIq457vgWArkOL3hJP?=
 =?us-ascii?Q?4MS3fzWDIcaUfSbIjfv3j4MFc4VGzkbF74WTfijAmDSB2El1n7MWNehILfNX?=
 =?us-ascii?Q?VKRYT8wy41/2ZGXEOTunlL2faKxM+Tew+ZA/2JRT6crhM5mfKltHWMHtFpd6?=
 =?us-ascii?Q?saUbmpdDssCxXpJRSNQEQZHGCzrFkvFXGj6z70iLhTVB+CoK9WMjbefWJFD+?=
 =?us-ascii?Q?KsxZnkcw3xXDjBXWwjD5JXtzRlviEVsQMwtvUVw8rpa7Zt5gOcz0PGBxxOzW?=
 =?us-ascii?Q?xQCGWajHP98D3h+03aEz9GB4/aUVtYspHSJ1UL88jvYJl38ozthI5wAuM8fP?=
 =?us-ascii?Q?r1RzsrmDEPlMM+m2ZeJDuDszaXEBK18CquNYfGizDhKLr+TtxhGmkmBsbUcV?=
 =?us-ascii?Q?PPTUj6Nak6zpW4Z7vamovOC4fDTpeK8G8AShPERZnY4cqqdJT2AdkJF3mteT?=
 =?us-ascii?Q?MTIU61HlgTiQbPvH9sbZ0Sq+/HepjettqJzbA5NQB9YmoWrVtyiBRT+EyQ72?=
 =?us-ascii?Q?0zdI0/WKeo1uHRkIqxDleGXT3r1sRX6417mZgDXIZOGTHIopnKutc1BA9kJm?=
 =?us-ascii?Q?ZvLih1GQfZTrHEUK9lWmDtxlCpuyauT/EnbeChesTERg5PYxEmuDUBHVe0kh?=
 =?us-ascii?Q?OHLee05Pk7T2SXdu7gw3b4YM2JL6ZG99GTKUd6i+9gx+zDi+1R+grNv+uszx?=
 =?us-ascii?Q?M7tNezMKbLTtVaExJhsqISUPSiQ9JxyHRRm7tg7r9fO3gRY0k0c3BzA1IyII?=
 =?us-ascii?Q?+PaeUIUCn2l6QAcUU5tFIfvJ05q6q5PDl5XDrapCT+ybRclP3Kmwub3CZ8KT?=
 =?us-ascii?Q?jJYnGp4gL3gmfZLaTDyV7AgddpURMp8U+m33XsmLqQrUj7GnBVey2488N8Xw?=
 =?us-ascii?Q?Cq6ZycS36jdrxHta7bEkaLFJcZ0CVDPIJKqEgNIUpFtQ7jvBcsyKJ9p9P0zQ?=
 =?us-ascii?Q?Q/UKaJpkkJRutnpalJiIzrV/dMNk43g4KPu0J56zElnR9v2pH6DgujflI5T7?=
 =?us-ascii?Q?k8lFXjFdXUM89MQiap68z9PZPd5e80qwxvLlcS4IcumSnIrnx2un/sTADRin?=
 =?us-ascii?Q?ee7hDp0cL369qGo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:19:22.0979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d94457-72f5-4f5e-4fc1-08dd730e5960
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393

Add the command line option to enable or disable exposing the ABMC
(Assignable Bandwidth Monitoring Counters) hardware feature to resctrl.

Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
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
 Documentation/arch/x86/resctrl.rst              | 1 +
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3e5e41cbe3ce..c4a88e9202da 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5942,7 +5942,7 @@
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec.
+			mba, smba, bmec, abmc.
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
 
diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 6768fc1fad16..fb90f08e564e 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -26,6 +26,7 @@ MBM (Memory Bandwidth Monitoring)		"cqm_mbm_total", "cqm_mbm_local"
 MBA (Memory Bandwidth Allocation)		"mba"
 SMBA (Slow Memory Bandwidth Allocation)         ""
 BMEC (Bandwidth Monitoring Event Configuration) ""
+ABMC (Assignable Bandwidth Monitoring Counters) ""
 ===============================================	================================
 
 Historically, new features were made visible by default in /proc/cpuinfo. This
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index a28de257168f..5ac1fe79a030 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -725,6 +725,7 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
+	RDT_FLAG_ABMC,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -750,6 +751,7 @@ static struct rdt_options rdt_options[]  __initdata = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.34.1

