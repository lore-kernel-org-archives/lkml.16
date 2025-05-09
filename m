Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4042623BD05
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808145; cv=fail; b=HJnCROyJoNq1smi7p09/ZT7vqNUdKB/Ch72qTbjmAcsajqG/eK2CGhuujQgiY/4VzyBUxV+HFaJaxlz0FrdUrlPNJ/qF/8e1cr+g/Fvqzkggh5h6H1wR8gMmCrxvfvg7Vw5zDrdwGEaSFQLNQxSDJkAnCpYr2h+787lPsph7oNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808145; c=relaxed/simple;
	bh=tRBYN+cny0WeAiMGZPWS1+6lVmTDpS/ovmRvkpoR4tI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/aLAl4dpfMp5VFvpRLxXdvbXo2wT7SOqqExBZ23VE2Hn/ltf+skVVAi9yAMjV/DND127sWhwoZsH7ptuTcwL7WudIWs0sk2Buox0TRrHuBZxcY3b5TbgjMjLpboEKv/FDsUjYb682roKZ4rkqgjvU1WxQdGmOUDx3RlAZXvrUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=a9WxRY0u; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="a9WxRY0u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohflnBMYipNQY+6ejx02AJB5RsrwYHz4orU7ir+NEQ+LIkf33+csuHXHWfDHKog7hxBz/D7e2NEx4qLW/b2/3ZwHI/84I+fVcbDLL3GMq7hARWzBb9M3PGsSH2M09UBlhKy6qCbLQTRSDh7ok+tLzKv7mQ/HippqiMr0WizxJzEYJwmouOuIUGkeo7zgcIkspv8Juf6vdNgk2o5NvGia34FVltwUKiGcSWPXR3df4hm26eYX1uK9MjsYOILLZN/XWju/a1b4wMGO08fUoC6w8PWHygjszetEbIZ/bgxH6+aoekywkbURzOFhVwiAZvVT9ShxPjaW1TwiFEX5rzixFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH94MwYROFayZ9EhNJq9fMoBvK0P79UwFDdThTJW+Zo=;
 b=qYhpWUPGg1xaeOWwmJDSYmbMxs6AV5hFulJGsz+UzuWWqaq2CVupRS68DuaqxGM/tjXMFO9gne4GNn1soOmx0KMiYlCFAqFdSwp7XxQSkJ8L4Qtr36k/Sqt385giKp7OydjdoC/mHWtBHT3VN6wo/pHZ92pMrW8Py/7cMa15WlaF172lCWkkecF/N7Vw+NksdsbolF+dvGnQeeETlgp5rxChnrkquKhYgY4N8SRE66i+grYf1MqERTKsetrpPijN7fqOwvLD2F5jkqgg0/Q26P2wurJ8JEiaL/bKbWfFykbq5G21bfCmL9WNyCVAg+bPe+m+WRkC0akcBEWcZTTKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH94MwYROFayZ9EhNJq9fMoBvK0P79UwFDdThTJW+Zo=;
 b=a9WxRY0uAfsvi9a3Fm4ztcP/hphPNE6IUYp2sq626Pm6fhK1zUPdI5d46JbmCP3zo0Bj1MlKO1cPvuUIaMDZ56O/Kw+3LQaAL161IjxdwxKGY21Eqqfc/tTJJ9Pek7WFRuMf8YNoYAPG7C+iusOfv1i5oAQff/Dl4xiZlmhUeZU=
Received: from BL1PR13CA0117.namprd13.prod.outlook.com (2603:10b6:208:2b9::32)
 by MW3PR12MB4457.namprd12.prod.outlook.com (2603:10b6:303:2e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 16:29:00 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::c0) by BL1PR13CA0117.outlook.office365.com
 (2603:10b6:208:2b9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.6 via Frontend Transport; Fri, 9
 May 2025 16:29:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:29:00 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:58 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 12/20] x86/bugs: Add attack vector controls for retbleed
Date: Fri, 9 May 2025 11:28:31 -0500
Message-ID: <20250509162839.3057217-13-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509162839.3057217-1-david.kaplan@amd.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|MW3PR12MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: d3fc6c9a-b893-4d1c-806b-08dd8f169a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jhi5z3wR/FGynEqGkzAPPOK6UXDiKIFmYl9mlbwwkIRpJd0ZIMVa8t3Tch4e?=
 =?us-ascii?Q?9BPEAJ+t7m1nq8m44iloP6zFAugWkX4+A/Qqsibpn8u+jLMQJ4jNZwDPUTPZ?=
 =?us-ascii?Q?/b4LKyhpkTXQnROekWqq0vmJ+/RiT1BV0mujW1UuTRwgL90es5A2mzqE/GmH?=
 =?us-ascii?Q?UWq9oO6qcnXq1OmxGhM3i2oaiw1BaFqjRJwm4p1YqTvs65k7hzMvVkrP8rKr?=
 =?us-ascii?Q?RTtS5+I6AV9+9TZt/zUZADWxz7jA6rdEwr4xOoqq15+nIcRzes5jSzU9/EdN?=
 =?us-ascii?Q?BLDYCatDVcJd6vvegDyIXxrW0t3REbYgtXfUVsKEKSux2xTZxdhSzNsSoxTv?=
 =?us-ascii?Q?e7Ry9lb/u95SPjAUlXE8dsfiHs2oUWpksrmKtTgnvtmmsTVt4+8vhYyZeyfq?=
 =?us-ascii?Q?Ln2WmupzpCcWVfBWh9t+vpyTKKbLfzhR97DjTvrf2eLcANZO6zMsv/YNyeMH?=
 =?us-ascii?Q?oX/WSH8/RN79G9e/zVm31+k9LIL3eHrtrpUK+pi6W1Wf8cCDkMUuheT5huQF?=
 =?us-ascii?Q?j9tqWajw5ZsVuY7wE6eBO0EGzw+sv7zVE9JKBX+NYBL6DffVmJcSsy6T6+tw?=
 =?us-ascii?Q?+abBTogFf9u+m5ctor/SWLE/GH0X8z64pegYxoZW0sAZRV5Aasr4f96+Y9f7?=
 =?us-ascii?Q?Pbfl4WtM+jxhc+jXOsxO1BohWQVFj0Q/PLScGaOerV86fcpBDzOV29+u+ius?=
 =?us-ascii?Q?JPNijO8ZbgZSTv6/qpw9lLamQkhiW8n5EY+JnRFFulZOe246NQXRKQkh4Wjt?=
 =?us-ascii?Q?6NIC03rM9MymNPqJ83vmDZusRp/Jr3jPvsrfzczTEOUL6697PnWfnHj/ZcF9?=
 =?us-ascii?Q?vRLltfiUVGnbDoYZ9dTUaMFHaXzWkZes1RobOemvhO7b0rF8XyqahwaElq5f?=
 =?us-ascii?Q?qjocIs2+dHKRZNswDMOb+cDCgflXWSwiKrfvL9ijXWEaN4lQ1spn1Mkzo41+?=
 =?us-ascii?Q?LIpdTQCEmNaPdJvYaofYUknKGv68uwy6wkVVyUsJpsMf36+DkTXTxbf8qMI4?=
 =?us-ascii?Q?GJ1YFQsPau0rEHqOz/focgZuOMf7SKk8T5hJavKO9m8VVThKEZSdQ5zlLeGd?=
 =?us-ascii?Q?NG/z0bjDdutUK/ZQUhZ1OkLwPLiDAUs05CKobzelrYDUcePWhuR+DaQkKYWi?=
 =?us-ascii?Q?T3XKiB9wuBW3KeYcmzaUyxypA+PFE0/3QtWb2dDzGGqWwm9OKTbS9or8rwTA?=
 =?us-ascii?Q?PhEi2dRHRq12pUnLZWJKj6/BrIYo1C/7nqSrs+KPF9bwlEP1FQvrL7EXH4kt?=
 =?us-ascii?Q?+XrIqugPhZhFpkPdBKNw1E5yUt4Qo+bYhWoo/+grzxBa12xaoaInWR60I5Y/?=
 =?us-ascii?Q?YflXjSgHRPNBJVWJVaF/wXrgipjrhKnr1otl8GpdNwtZyq5nOi9K6qvJT0RD?=
 =?us-ascii?Q?e/Nx3hjQLxBbfYi1Ur3f/tB/m8iPLSCh09S7gR7PBaUY99DmoGjB3xvU1pYj?=
 =?us-ascii?Q?sHiaZYy9muRIGvX4q63pUY6VLc5IQtkIVcb8Rrd3XAtZN3ZV/xvVNFOJb+Ma?=
 =?us-ascii?Q?KBSMreeyCJBVOX4Oz7CJAprywg4spnm/Zd8Q?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:29:00.1336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fc6c9a-b893-4d1c-806b-08dd8f169a91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457

Use attack vector controls to determine if retbleed mitigation is
required.

Disable SMT if cross-thread protection is desired and STIBP is not
available.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index ad68130707c2..160dcaa18b04 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1251,7 +1251,7 @@ early_param("retbleed", retbleed_parse_cmdline);
 
 static void __init retbleed_select_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_RETBLEED) || cpu_mitigations_off()) {
+	if (!boot_cpu_has_bug(X86_BUG_RETBLEED)) {
 		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 		return;
 	}
@@ -1288,6 +1288,11 @@ static void __init retbleed_select_mitigation(void)
 	if (retbleed_mitigation != RETBLEED_MITIGATION_AUTO)
 		return;
 
+	if (!should_mitigate_vuln(X86_BUG_RETBLEED)) {
+		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
+		return;
+	}
+
 	/* Intel mitigation selected in retbleed_update_mitigation() */
 	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
 	    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
@@ -1303,7 +1308,7 @@ static void __init retbleed_select_mitigation(void)
 
 static void __init retbleed_update_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_RETBLEED) || cpu_mitigations_off())
+	if (!boot_cpu_has_bug(X86_BUG_RETBLEED))
 		return;
 
 	if (retbleed_mitigation == RETBLEED_MITIGATION_NONE)
@@ -1401,7 +1406,7 @@ static void __init retbleed_apply_mitigation(void)
 	}
 
 	if (mitigate_smt && !boot_cpu_has(X86_FEATURE_STIBP) &&
-	    (retbleed_nosmt || cpu_mitigations_auto_nosmt()))
+	    (retbleed_nosmt || smt_mitigations == SMT_MITIGATIONS_ON))
 		cpu_smt_disable(false);
 }
 
-- 
2.34.1

