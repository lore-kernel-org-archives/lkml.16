Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2051.outbound.protection.outlook.com [40.107.96.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289B218EA8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993063; cv=fail; b=edbkrf1gUDpGzVbjyIxL41BUpzguv/XhTUlFB5DNKkL4X7vkO1QqwUJAwj1BHTZxldjpbTxeet/hI0xkl4EM6SCoiSV57DOUSbu3WOo7YT5h9C6w9fBkM6QiQF8FL8q1ZY16HSQa8EwFk69ev2ko7v9JHo4J/qvLB8ZbWrCSS6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993063; c=relaxed/simple;
	bh=TMpdYE1micTL6Pq+Z4DNEJvgE9lJtxsZPAxruBzc2DA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k7Wh4/+23tbY/iAZ9hy+SZ10yPKJKRUauyQ2sOG+Egnw6y78MNyMJ1oy1S7dKs0U9/1lJ74wkU7nEjAM1Zwn4x+SjMI+1hCdgbKk9fbdEC26ESKJ9PAd7ro2Jwy/k43ta4VhbEcpGpdcNXfE47QlXmFgWuBl8yeUrgd92570Q0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VW+qosrE; arc=fail smtp.client-ip=40.107.96.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VW+qosrE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JalDH8Cpo18GpeYRYn2h9aEs1LFunWfvSReAswAUElza/Mf50uIYgKEoZXxto0MQ+UaxcGSd37y1Etm7KMcwfe9PxUXtaduIag6oEM77hsz7B0WZ9CUZmqQpYNMSzuE1mlNsY68aPov5cvAzOTnjAniAZb1kChLksRPFsfDZHS6j8EncNw9jYf29ZobY6Xme3XhrcIC1y8D/ivm0PrSxlvj61aBg1XCeqtpnrpLqdrM1vvDNoMSfLcOHnOP/yhWnTFIVftfB8wd1Fq9ZZcYlF5EE0RyaapjuvJhHX9U8Ey18g9wC/n/wzMTk763wtaEc+05ahmXO+svxQa8SDMv61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwRYwGUXedta4IkjBDOMVIiXPAigpEHtfDrgRBsqV6w=;
 b=vIC/NbXFpoBDiKuzcJbcQneYftd6dhvdzk2VayKsmHWJSXPqrndtUF0+lhk7cwkCh4qX5iRpSNBEVWqhrF6hXEKg24/4S4KDH/d3J1STEj6lzWggcL3Vu2LHZH2A73wgCyIB7FgMLHzSIjPce9xIGR6BsQeHp17r5I/tgUXqMBKRl79IulfLCnHUZenyq9zpClTrtJOlG5Hv85UKnteg39snrxgkr49RO7VUu5PnAP1zeMfbVGVlWAhZq4SpmTOxRQJIp8BEwFBYpLuFT0IRppMq3LIYDstsZDOViE9emBAdzc+5Z/6vdc7JtBXPKwrerAKkzRs5pkiWVztlf3XS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwRYwGUXedta4IkjBDOMVIiXPAigpEHtfDrgRBsqV6w=;
 b=VW+qosrEvCwfx67YbOfhl8P9xmrt+dZ+XwD9TY6oSiL5of+krMdhx765hMtXpNbsKDtNGBGjBS2JS3gUI/UlD7AMVwbuh4VFb8hxUewY5EzZzN4Kt0k+EANtJY5GVLXfguAdoWBCHzxNqaR7E5hgCl84vDXONCdlu+tWEzHESxE=
Received: from CH0P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::16)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Fri, 18 Apr
 2025 16:17:39 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::a) by CH0P220CA0024.outlook.office365.com
 (2603:10b6:610:ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Fri,
 18 Apr 2025 16:17:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:38 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:36 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 09/16] x86/bugs: Allow retbleed=stuff only on Intel
Date: Fri, 18 Apr 2025 11:17:14 -0500
Message-ID: <20250418161721.1855190-10-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418161721.1855190-1-david.kaplan@amd.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: 26dadfc2-54fe-46b6-7ff5-08dd7e9489bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pk4UmSCVKDSDvlCZtH6OPRPal8vh7XQhbxgKnhG9mzJN6AzWqvFLJ5URNyrN?=
 =?us-ascii?Q?IkhExFhPZBpChDRIq173s08iFTj8N9a9VsP4cCap3jqtfdMovl2BiXAdvIyz?=
 =?us-ascii?Q?elIlPpY/MyFb6USAmXI8b7XKbUQGU2+V9LHsVqjOZvjUUdxOe3Nk1oFlr009?=
 =?us-ascii?Q?4grPuRiMY2qkGlaSAgkZJJvGHJlE9VIztqeH0PxMuEfJ99+R+ocK69/Ok4oL?=
 =?us-ascii?Q?KhcShg/rfCrQPzy2U8VuI4Pz5EztzNpYVLKq0yQWRnaiFN6wAOomaQVBNOvG?=
 =?us-ascii?Q?7SHEYwt95ylBRsuWNLQ/U0+z5i72y7NJOdxsJ64437lQtbegr/1Kk2e7sVw3?=
 =?us-ascii?Q?m/DOgp7mee05lzDDLaI+cyyCyHpoh+9X+zfbq0F1iZzPQURXxlMd1/TEb+Ti?=
 =?us-ascii?Q?ZQVQL1jpoSaTHsYi0+tXjJtFIAYExAFQUpc5OVYSlyTpCeTCqT8JVWSq0ocD?=
 =?us-ascii?Q?IcZzRCjqdXFI38j/6G2h1Njl0ZTRGbvo808p1DaxUG20z0MoU/9FWkXVFMXK?=
 =?us-ascii?Q?2bGb9C4OwjbNhENOSwXOpkzZQjiR42hjVMNUAcNrod8WQxepzqIzOlefQtYO?=
 =?us-ascii?Q?iJq7ec6EmY8tgZV5Ao/AfndhIccjTC4L96lwPGA1nuMGQehx+nTFt3nFOoKZ?=
 =?us-ascii?Q?uUjcp7SNPaOx/KX2PCSbOIptdOnNkZYfNffmIafO1jpeHuQsBOvp4fnlzeF6?=
 =?us-ascii?Q?5ygUDqwuUib6bQyLU5jfkyBId5XiBLrYGBS4595SOs6+MmJcgkZ/ioH7+r21?=
 =?us-ascii?Q?lPz3D4etjzVLBHiHlDlu9qd98lHv5HL+MGx8NWANfPZ46RwN5mcjxB5LFyDI?=
 =?us-ascii?Q?Bxw5pomipCed6WUM0yB0YtK33XqdiYt4uawGPKk2jGvTYO7nVE81uWgfHNf9?=
 =?us-ascii?Q?AKeqwib8QEsniM/+jfU27Q6fw46gW/VJplK45ksx3V2BCubcii3ukDhzpXwe?=
 =?us-ascii?Q?zEJQx//452R23IF6Bt5A33LtQieSp8CwMELI6+EYZGyRaILvBcQrCAVRs2+3?=
 =?us-ascii?Q?bQcKprUJLBRUsADJ8rSeMkN45hO8oIAduSDbEbBMMbN7uf29oLWcrYeT99LF?=
 =?us-ascii?Q?DaevsLTONAPGp0Q1KRhI60sZqNzK4iDqqHNnS1uekI9iTZfgivUZra0eWbVU?=
 =?us-ascii?Q?w4gDmRc70gYiTJlTHcxQoLMW45fE7Sdkp3MgvZKRCCHRyu6htXb4jsDkEKO8?=
 =?us-ascii?Q?+/Gl1wvj0I8DnfsNK+mCWZYrj8qHrshx3PAzSaa2aq9QfxrgetYGaijTsb78?=
 =?us-ascii?Q?2CHTyWmGUdHFut45vzkooXE3J4iCC3KI6/CebcJgb1pMIol6WmBfrgMMmfre?=
 =?us-ascii?Q?vl9qOmlxcEyRJh/rsS7k9NwumpFgdkhoAZvqxhyHBWg4pyMLb0/+5vXtWvyZ?=
 =?us-ascii?Q?trvc9u7u8vQDBGRsGqdh21x4IwMqV6GA7BhyxJy16I4DG1STNBMxRT+HsQr+?=
 =?us-ascii?Q?jjTTpXSbJCxKLY0fnQDZ8aSprjLUA1hcFG4LrFo9mEIYVhl4WsM3lFvtdQCI?=
 =?us-ascii?Q?LLFnrdeDoSQyXrXYjIM+tElQavrFBbhhP8N0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:38.6662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dadfc2-54fe-46b6-7ff5-08dd7e9489bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141

The retbleed=stuff mitigation is only applicable for Intel CPUs affected
by retbleed.  If this option is selected for another vendor, print a
warning and fall back to the AUTO option.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 72e04938fdcb..84d3f6b3d1eb 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1187,6 +1187,10 @@ static void __init retbleed_select_mitigation(void)
 	case RETBLEED_CMD_STUFF:
 		if (IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING) &&
 		    spectre_v2_enabled == SPECTRE_V2_RETPOLINE) {
+			if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL) {
+				pr_err("WARNING: retbleed=stuff only supported for Intel CPUs.\n");
+				goto do_cmd_auto;
+			}
 			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
 
 		} else {
-- 
2.34.1

