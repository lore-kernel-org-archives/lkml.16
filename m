Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADE22918D9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808153; cv=fail; b=RbhEsoPtR0vU1yay9AzfabMq72vgz31SCVl4qUj7QPK4KjiVgs4kvr6ht75bl30KaEr8BkJsCQPxu6XW2RvOyEc16OgLODa2oe3iXhyGrISERfUL4r1k+UjoTVditpv4NHiI371PiMgQkSPdSkJ93Yc8vgxgO99UVvPsVINcfXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808153; c=relaxed/simple;
	bh=0arSg2n0XSFlrzbaUoKyWgpPNqvjTw6BDVyVDCmAon8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qfHGIYO0cYPIToKvF+Of0yi4PwMe0h5OQdLB9k/NmT2E33RzRsAETUhJdxpxXZwYxaJcIaYOh3LseqjabfaMtoth+wOtR7NgBZLtR0WHQBG230wDJ4DY7qkSd8HkFzvY+sUzVVwg9qCxDooOikoK5reBJceT88dxtNc0u7KlV6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rvlTnXVU; arc=fail smtp.client-ip=40.107.236.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rvlTnXVU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eg3QNqpZ8oKhBkDqMbfDrLk2Yf5u3EKWyybWFa8gwkF6uavQYShMUfyOsPe70JlLmCE+5oM1BuXexfDceaueyZ94c/pzb/Lzl7RPz8F6d9OWc+YS8VjqkcLDTibT0j281hCNHrsrUNi2jj1noKVFJk07qFICJI3Mx1nQQwnma4W3a0oAjjrFfG4bEFNbRAhMKpgPaEvinlSnWUFJeKEDgZCgw1eyC8h5PeSoCuHClz/PdOaV8uhTULqPwUj761Ui+qBFCZJx8BMIEuQh+KewWN0wgdJNfK6mTD7BGhS0goXSAQG8NMX+o2t1L8Rmsj3n2HWZQJsCVrUMevXWYcgM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPt5bgti877jDWnmf/WN1Oa7K2oSotr3SBVnJdO77MA=;
 b=Abubh7wY5V9AXp/mNFjo/FqxAvcUMovif5j+9qHeD07lmW+9Zw/VsIWWEFxAlkHfJMLZ1UKIabKi1D56Ahef6/G3KLeXaXbKtTMDLTr2tHycHRfMC3Nqgz0LQC9B+SGjwasaHHHy/CZwfnEb/OJziJkndtiOMvIzgFhSJI+FsncXWlK5USk5OHDVGnBuxhxQGBVmkiM7JA1s+Vxk7aShs8PpwOwJQa73L5f7rRfdkDPnqpZRW3BfTzSazJpzPNSla8Te4IgvJgXwSskYxGXShDA0L5u9bdEHeOhV1IF96Zbn8tZ6cgREHbnoSfvaaINTdDFNQi19L1N/ycGMU4w6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPt5bgti877jDWnmf/WN1Oa7K2oSotr3SBVnJdO77MA=;
 b=rvlTnXVUChxSMDf/4UPYxUGPyWG8G3FMXhqPAT3JzX4xq1GH8OaVN6cCVuPRB6DInWtDjzmtpkCSQEYrDkw18ssAHykATPi8CEyst8fSmDbQf1ZdcC1kPfVwlL6GetSpxlI4lLHKDj91L+Zgb8Q0bqu3IACCIJZnOu8hN+mHsCQ=
Received: from BL1PR13CA0120.namprd13.prod.outlook.com (2603:10b6:208:2b9::35)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 16:29:02 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::3) by BL1PR13CA0120.outlook.office365.com
 (2603:10b6:208:2b9::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:29:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:29:01 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:59 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 13/20] x86/bugs: Add attack vector controls for spectre_v2_user
Date: Fri, 9 May 2025 11:28:32 -0500
Message-ID: <20250509162839.3057217-14-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|MW4PR12MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 345ddc9e-9fee-4b97-1c10-08dd8f169b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XUTjSm5SH09B6uk3byg/uhUnLp9/GfUG8+KkRGqHpue9nRmxUGySMHpNcK6t?=
 =?us-ascii?Q?nqN3JjTC94n5rWET9PVQTxaGDAD5AE3aUMyW5MqpeLCcFUc2ldg3TTfUd/cI?=
 =?us-ascii?Q?9z+r3EuYYX5r4CsY4TbnayDUcUOBfQTudekGQlBe2X7YtCsFDcbrfCULj3nU?=
 =?us-ascii?Q?TNvwgLgSP5MVbXTy/KRMn1zaGzK9bvdTRj2b/hs16YFi2jwRb0PoYRyFg4th?=
 =?us-ascii?Q?jLbLda0138lH1H692T5I04YB2no9ld4U70JUhWxOa5DznERcYcS/tvkDCVh8?=
 =?us-ascii?Q?PolkwN7bxEa8X9T8NwkZ+oPWJmxawOBSt3NLoXAoh/8WqTDkmee2T2AhEcKW?=
 =?us-ascii?Q?QFePNQsOSj5sO3zF2e/5lUxRvpLCZyOCkAY/8I5QewFbmGMiq5uzF2TfhiEI?=
 =?us-ascii?Q?bZKKNT37eYRKOYFlacvhcQU/KLKxewbg0lbvQ5aIyIU+AYCVJvANjOpMbgYj?=
 =?us-ascii?Q?qyeH53LMWYnL/Epg3FKbBoH2tM3eKy+mID+i5oOGTQ6uhLS7YY67epH6dLdJ?=
 =?us-ascii?Q?fHwAp/p2xsKMxW2gW95Sl/0gLCdpKzqqB3j7cnvXEeWqdGxeseytZ/lZVBhb?=
 =?us-ascii?Q?Hn1CMi1/AiKBxsTMC3un3xf0mVio1o+3iAQVY9nCa958hI8biI6WwfuEEvzI?=
 =?us-ascii?Q?DnkusMGTuKueurEg2lvdjBK/q/2tQunsHY/u3Be3wpoSSc5RU/r+h+zaCIVC?=
 =?us-ascii?Q?PsTLsUEt8Xlzw3gQsn7nGILDQM7PoSfxHWPlWtR8g92JAffMRtU0Tk4SaGD1?=
 =?us-ascii?Q?mhe2rGMLs20ZyFZNlQNQeBcqJxgv+LnH0jChhFi48cUfWRKMe4AP3IYAd7vB?=
 =?us-ascii?Q?nPa9vI9lPIjNPZkyn8oOD/6KZOzGXDl6Ivr9Q8tGFGhiByMDG/diCNyrPoOp?=
 =?us-ascii?Q?U9NOGeL7StgbfTljNA1UXRLA3iHxvaNVxKu9glkDUgtDCpIjCewIVuHjUk+z?=
 =?us-ascii?Q?mz9jEaHpQuLmuDGvQAGVGWXr0BApKA9cDsnQNOUxOtp4b2O0eUJPSijaqu+x?=
 =?us-ascii?Q?xSltFc9XG1BkI2GFPbwxJ9+6/205hSq6ciIcT1ZlPMePUZERQVbt1W6uczQy?=
 =?us-ascii?Q?q73kVy8zKYLNzvm+3rxwOMycqzGbyfMII0aazYzNKYq7zaVCjTSSiCDOBer7?=
 =?us-ascii?Q?yEcyJU87sKML2OyvrDxHOn7sKa+FKiqo56itXMl0paZjY6dN0XVHd1y8Z1c2?=
 =?us-ascii?Q?at0/G48PKUhmqnpnKIkk5YD82csaYC5/JOwuJ0sDDpiqiBBnMRHfb5xh9KW4?=
 =?us-ascii?Q?Hkwq8IdPoZVGXWSZg6TmihMhvqmW3EHJYllvia4bA+HJ0SpE6XTmKY/sVp/m?=
 =?us-ascii?Q?i58XaBW6QRl6VN+uAvIv9acfXzQ3eqI+p/ypR4f0g4SIyjCPnRIxQVQcr6zf?=
 =?us-ascii?Q?aY3oP1Z09xWXQQqMM8RB+l64tyNtAPthqFGqFUObsRH4CsUB937y5vBjzssV?=
 =?us-ascii?Q?yL0Avj0Gx+HP1dynn8MY8iT/FUOU5wB247gj1ejskTtTWtQRyiGoJejgJK9/?=
 =?us-ascii?Q?/H2O9LXyanRh15Jy5DYaVq0lJ13QPWNBFRX8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:29:01.0805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 345ddc9e-9fee-4b97-1c10-08dd8f169b22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825

Use attack vector controls to determine if spectre_v2_user mitigation is
required.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 160dcaa18b04..305a11fa9521 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1532,7 +1532,7 @@ static enum spectre_v2_user_cmd __init spectre_v2_parse_user_cmdline(void)
 	char arg[20];
 	int ret, i;
 
-	if (cpu_mitigations_off() || !IS_ENABLED(CONFIG_MITIGATION_SPECTRE_V2))
+	if (!IS_ENABLED(CONFIG_MITIGATION_SPECTRE_V2))
 		return SPECTRE_V2_USER_CMD_NONE;
 
 	ret = cmdline_find_option(boot_command_line, "spectre_v2_user",
@@ -1570,6 +1570,13 @@ static void __init spectre_v2_user_select_mitigation(void)
 		spectre_v2_user_stibp = SPECTRE_V2_USER_STRICT;
 		break;
 	case SPECTRE_V2_USER_CMD_AUTO:
+		if (!should_mitigate_vuln(X86_BUG_SPECTRE_V2_USER))
+			break;
+		spectre_v2_user_ibpb = SPECTRE_V2_USER_PRCTL;
+		if (smt_mitigations == SMT_MITIGATIONS_OFF)
+			break;
+		spectre_v2_user_stibp = SPECTRE_V2_USER_PRCTL;
+		break;
 	case SPECTRE_V2_USER_CMD_PRCTL:
 		spectre_v2_user_ibpb  = SPECTRE_V2_USER_PRCTL;
 		spectre_v2_user_stibp = SPECTRE_V2_USER_PRCTL;
-- 
2.34.1

