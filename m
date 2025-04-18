Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8899F226D08
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993069; cv=fail; b=IqWkQy296FMI+oWXnVpYNe7nqZ7MtGnqGcoBKSLlW4S8jCc4mCmFYu134KsXH0th5MMoPqnn8Bvru0sMaHDv+eIsbYL8rl9qGbm6OtD5wLIItIWM53eeSfLfWPNhbYQ+pWvQycy037mRvLrQ6dQg45xdZdhrDXdcoBOPRWRohVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993069; c=relaxed/simple;
	bh=fbSoGu1x8VmiQNrpZrzI04kFbgtYxrt7fVg6yAxs9s4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hj4l2iVxoibh3/bxjda+413M7xLsR4jQZetPDYtX1sMiSZ1Z3lF5W7hNMy/BZrgg9as4jPqyItfaFfXiCTr6PBZ4lGD+uUjTD72UKtkABDl5JJBavZvcrg3nfxUykHQ5cXQtFhlhQb6jEHzPb4KBC4gM3XWNS73ySPrAUFFbys4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qIyHQcxd; arc=fail smtp.client-ip=40.107.96.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qIyHQcxd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YW6drdkyUkj1mxCxTurRf3AETpxdddua1VktJ5wd20d3idNy2iR5/GdjGPqAcKUs/bU+pmhMbUfXkwX8FjTIkEqJPjwQGqnLmBoiM4QgWU0fFXwdao56MXwytzWuwh3ojoNn2h2I+5GeLLeo1iakgGWtXimjWXm31I2yvFgiHzBgQKmMDNuhwjhar2Ae3GBun/jDAiEFcj9UDJw7cSeFsrFv3CT92OGEKBPst6AV4MN+pQFovTNJQsah7XRSra7iAZo4adA8WrlsMjdRedk13c5jzLt1zlJL/VneNAiHuHeaivhkfuK5WPinx2j83CtsC1TUs90KjTq+fmzZ0k6DLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuCagIIAaFndumnTZ4HR6LnePAQLWbidfGNVQILKQWI=;
 b=j358a9HkR11/EL00HLWklR4jnko8vxmooHQIo4p+ROChFXfX5cSUnpZ/mFuTV4ne9SfbM7Z/r9ABiWXswYHUeyVMhQcqmycJHhv3Z3uElCUY3ntS8xNoA45HpV2CQGwSkSrkt5waE+Pogz56nrmbLC7zDqRmIipInPZhGSH5iWduzC0pwPEY8wgikUERfO41jLO76+Wkcsc+nhzZAIiWpy+Z6H+OW9VXVY88D8k5jq91hKkqs9pWym9mjSYEW/HSvlaDW95fuHLwTSG56C1MZzhfqQIdzsW99eM8hv7L4n8QhhLcnCA6QMWnsNkx9LWogNVRUoBamuSdhrRBM+6b6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuCagIIAaFndumnTZ4HR6LnePAQLWbidfGNVQILKQWI=;
 b=qIyHQcxdXVWT7u962x8+PJqGWGWVaHJs++FgI7Q4cjKWpd5PldT8c7YNmHrr2JIqXuJUVl2NthwWur0LqJHwnvaK3te/qZI3Vfou/Msw95+xhkfNX+WJEdOcPY4C5vEJokGUgEAkJF9qfh/YEUcRyuSk4iSJapUheIpwWdXwBxM=
Received: from CH0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::19)
 by IA0PR12MB8696.namprd12.prod.outlook.com (2603:10b6:208:48f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.43; Fri, 18 Apr
 2025 16:17:40 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::dd) by CH0P220CA0001.outlook.office365.com
 (2603:10b6:610:ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:40 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:37 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 11/16] x86/bugs: Restructure spectre_v2_user mitigation
Date: Fri, 18 Apr 2025 11:17:16 -0500
Message-ID: <20250418161721.1855190-12-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA0PR12MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3f64fb-2638-471e-7f6b-08dd7e948a90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LG/SHL9RMNgSHe3Ez1uLmydIStVAsOup6u8+RrLcNCWmjVyDErccGwf3rAmq?=
 =?us-ascii?Q?HPv8yhyAKDo7rZmSRGjXvN3ICsMRXRoAIAqBLNW2In8RQF4ZaqaSwvEn2gHv?=
 =?us-ascii?Q?Yjs9ZJNvSHoBguH9nxGMZ4XRNYLDVGDriwK3ATt2Zi9eQNCABdaGzxiEWBSr?=
 =?us-ascii?Q?rWTdXpBXX1A0H5yyWVwYN2/eQ7vtkIXIA3wdfk47VyIB7qQ5E19Du0ZB84Na?=
 =?us-ascii?Q?vbXpwszyEQ0JYocWq/3EAzm1+1FElSKq01wVRHuX9B4aQIgLHv6tj5TmUgC0?=
 =?us-ascii?Q?ZfHvCcGx18pJ+Fe6IHypL1+d6V7qnKWrz5mkS2waON+g34k7twT+dfRro+h9?=
 =?us-ascii?Q?E4lZyuyp2sBc0XgF/xRpqpvKJtiwtOoqrByHpMrKm8BMw//7ebB2EY5HoNMx?=
 =?us-ascii?Q?S3ahmyvOqBpn+sDlQ4i5bd5IFRWHD08DEN59+GTL3PxYYCSl181Vzn3Y/i0N?=
 =?us-ascii?Q?692HhTuSH4FuarEv+u/r927+2dr4ctXAB+sJrKK5gCjwirtRoej4NqWZmY7w?=
 =?us-ascii?Q?0d7o6NTXPxuzUhoJP1A60yy2eCfHAMhXeUMrgW3n/rFP8IWNPzmOQ1Qv4+xc?=
 =?us-ascii?Q?j0S6HwJ/LkXVSLUP3R0ViFKu2TXKcnNAj3SD7+t+cv2fbkckZ49csBAfQYrc?=
 =?us-ascii?Q?7jYdGIY279IdCxIZioQuU8GRcRky2lRh1Kf/Dp284dr/iY7hVC7DRH4eYKdT?=
 =?us-ascii?Q?JDnF2oQKWga/mywVfg03kASqOFYcpgDyZbyKlSPaSCmnn44PZo/oi5QDRYm5?=
 =?us-ascii?Q?1siKk5ZZl+xhaW7CQbEiLwL8WtxKUy2/BbR4sD+dEnrWnhCH/6PZGGkBlEdh?=
 =?us-ascii?Q?R4qVh/wt74kEvoP7qJpR+fLxG0nJrYXTHa/0tz4nObffZbVKrbg+UKh9eN8r?=
 =?us-ascii?Q?0lB4pkVkpZLNYWmiF2OE12X5Tc77aL2druyK0JRxBSyJFJdpyjyPPFhPRzX1?=
 =?us-ascii?Q?3pq2fXYLyCHt8oABEGvC5e7ozsq7+KkRQ4qmKoCJqaKYr1onhY6Im1s0+HSj?=
 =?us-ascii?Q?LoJcvavGe1PftUZnnzxnCGdE3j5nN9FszRsooz80cDjXv4LzCyuftgHRNW05?=
 =?us-ascii?Q?XG5xYJq8we2lyprPq0U4HTY4yMs14sGXBJM2trqN8clyg1szSIma1pUykWpN?=
 =?us-ascii?Q?M3XaYqIARisbZpgYtGTbFOWE1lJf5RcM3qRSrJIC29991YpVChNNel2WOIeO?=
 =?us-ascii?Q?bu2HgfZkikrBPzFfyaiGj/+ZBProJLK/7x2WN5h/lvJbcZAZ3siCjcNKgcGj?=
 =?us-ascii?Q?Q3jSjM/2SObgME479KTD0BcfPv4MdYN/vqFo+EHkE/gyxoQOBrLfxNvoePW8?=
 =?us-ascii?Q?xhOItNOU/3k9nwXjTqm2tYMbvcxrsIa7DW2VD0TEqIYZ55xlgixNuZzDxMDx?=
 =?us-ascii?Q?/27DUvGqi9bKv/fXFhgs5wQkMm+psToNHo8MI8kFEgktTHz4B7Qx9POdejcr?=
 =?us-ascii?Q?HFsvU7rw9GfFlDe3detTZETD/JxxC8+03B8ug6NSB7kqo81KE0hZ02KwYAsd?=
 =?us-ascii?Q?ScwVFTtgwbk6vgJTl/JSDOszhHrrsyuxqiAO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:40.0626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3f64fb-2638-471e-7f6b-08dd7e948a90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8696

Restructure spectre_v2_user to use select/update/apply functions to
create consistent vulnerability handling.

The IBPB/STIBP choices are first decided based on the spectre_v2_user
command line but can be modified by the spectre_v2 command line option
as well.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 155 +++++++++++++++++++++----------------
 1 file changed, 89 insertions(+), 66 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 248b6065f4bc..bb20cfb81015 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -60,6 +60,8 @@ static void __init retbleed_select_mitigation(void);
 static void __init retbleed_update_mitigation(void);
 static void __init retbleed_apply_mitigation(void);
 static void __init spectre_v2_user_select_mitigation(void);
+static void __init spectre_v2_user_update_mitigation(void);
+static void __init spectre_v2_user_apply_mitigation(void);
 static void __init ssb_select_mitigation(void);
 static void __init l1tf_select_mitigation(void);
 static void __init mds_select_mitigation(void);
@@ -190,11 +192,6 @@ void __init cpu_select_mitigations(void)
 	spectre_v1_select_mitigation();
 	spectre_v2_select_mitigation();
 	retbleed_select_mitigation();
-	/*
-	 * spectre_v2_user_select_mitigation() relies on the state set by
-	 * retbleed_select_mitigation(); specifically the STIBP selection is
-	 * forced for UNRET or IBPB.
-	 */
 	spectre_v2_user_select_mitigation();
 	ssb_select_mitigation();
 	l1tf_select_mitigation();
@@ -217,6 +214,11 @@ void __init cpu_select_mitigations(void)
 	 * choices.
 	 */
 	retbleed_update_mitigation();
+	/*
+	 * spectre_v2_user_update_mitigation() depends on
+	 * retbleed_update_mitigation().
+	 */
+	spectre_v2_user_update_mitigation();
 	mds_update_mitigation();
 	taa_update_mitigation();
 	mmio_update_mitigation();
@@ -224,6 +226,7 @@ void __init cpu_select_mitigations(void)
 
 	spectre_v1_apply_mitigation();
 	retbleed_apply_mitigation();
+	spectre_v2_user_apply_mitigation();
 	mds_apply_mitigation();
 	taa_apply_mitigation();
 	mmio_apply_mitigation();
@@ -1374,6 +1377,8 @@ enum spectre_v2_mitigation_cmd {
 	SPECTRE_V2_CMD_IBRS,
 };
 
+static enum spectre_v2_mitigation_cmd spectre_v2_cmd __ro_after_init = SPECTRE_V2_CMD_AUTO;
+
 enum spectre_v2_user_cmd {
 	SPECTRE_V2_USER_CMD_NONE,
 	SPECTRE_V2_USER_CMD_AUTO,
@@ -1412,31 +1417,19 @@ static void __init spec_v2_user_print_cond(const char *reason, bool secure)
 		pr_info("spectre_v2_user=%s forced on command line.\n", reason);
 }
 
-static __ro_after_init enum spectre_v2_mitigation_cmd spectre_v2_cmd;
-
 static enum spectre_v2_user_cmd __init
 spectre_v2_parse_user_cmdline(void)
 {
-	enum spectre_v2_user_cmd mode;
 	char arg[20];
 	int ret, i;
 
-	mode = IS_ENABLED(CONFIG_MITIGATION_SPECTRE_V2) ?
-		SPECTRE_V2_USER_CMD_AUTO : SPECTRE_V2_USER_CMD_NONE;
-
-	switch (spectre_v2_cmd) {
-	case SPECTRE_V2_CMD_NONE:
+	if (cpu_mitigations_off() || !IS_ENABLED(CONFIG_MITIGATION_SPECTRE_V2))
 		return SPECTRE_V2_USER_CMD_NONE;
-	case SPECTRE_V2_CMD_FORCE:
-		return SPECTRE_V2_USER_CMD_FORCE;
-	default:
-		break;
-	}
 
 	ret = cmdline_find_option(boot_command_line, "spectre_v2_user",
 				  arg, sizeof(arg));
 	if (ret < 0)
-		return mode;
+		return SPECTRE_V2_USER_CMD_AUTO;
 
 	for (i = 0; i < ARRAY_SIZE(v2_user_options); i++) {
 		if (match_option(arg, ret, v2_user_options[i].option)) {
@@ -1447,7 +1440,7 @@ spectre_v2_parse_user_cmdline(void)
 	}
 
 	pr_err("Unknown user space protection option (%s). Switching to default\n", arg);
-	return mode;
+	return SPECTRE_V2_USER_CMD_AUTO;
 }
 
 static inline bool spectre_v2_in_ibrs_mode(enum spectre_v2_mitigation mode)
@@ -1458,7 +1451,6 @@ static inline bool spectre_v2_in_ibrs_mode(enum spectre_v2_mitigation mode)
 static void __init
 spectre_v2_user_select_mitigation(void)
 {
-	enum spectre_v2_user_mitigation mode = SPECTRE_V2_USER_NONE;
 	enum spectre_v2_user_cmd cmd;
 
 	if (!boot_cpu_has(X86_FEATURE_IBPB) && !boot_cpu_has(X86_FEATURE_STIBP))
@@ -1467,48 +1459,65 @@ spectre_v2_user_select_mitigation(void)
 	cmd = spectre_v2_parse_user_cmdline();
 	switch (cmd) {
 	case SPECTRE_V2_USER_CMD_NONE:
-		goto set_mode;
+		return;
 	case SPECTRE_V2_USER_CMD_FORCE:
-		mode = SPECTRE_V2_USER_STRICT;
+		spectre_v2_user_ibpb = SPECTRE_V2_USER_STRICT;
+		spectre_v2_user_stibp = SPECTRE_V2_USER_STRICT;
 		break;
 	case SPECTRE_V2_USER_CMD_AUTO:
 	case SPECTRE_V2_USER_CMD_PRCTL:
+		spectre_v2_user_ibpb = SPECTRE_V2_USER_PRCTL;
+		spectre_v2_user_stibp = SPECTRE_V2_USER_PRCTL;
+		break;
 	case SPECTRE_V2_USER_CMD_PRCTL_IBPB:
-		mode = SPECTRE_V2_USER_PRCTL;
+		spectre_v2_user_ibpb = SPECTRE_V2_USER_STRICT;
+		spectre_v2_user_stibp = SPECTRE_V2_USER_PRCTL;
 		break;
 	case SPECTRE_V2_USER_CMD_SECCOMP:
+		if (IS_ENABLED(CONFIG_SECCOMP))
+			spectre_v2_user_ibpb = SPECTRE_V2_USER_SECCOMP;
+		else
+			spectre_v2_user_ibpb = SPECTRE_V2_USER_PRCTL;
+		spectre_v2_user_stibp = spectre_v2_user_ibpb;
+		break;
 	case SPECTRE_V2_USER_CMD_SECCOMP_IBPB:
+		spectre_v2_user_ibpb = SPECTRE_V2_USER_STRICT;
 		if (IS_ENABLED(CONFIG_SECCOMP))
-			mode = SPECTRE_V2_USER_SECCOMP;
+			spectre_v2_user_stibp = SPECTRE_V2_USER_SECCOMP;
 		else
-			mode = SPECTRE_V2_USER_PRCTL;
+			spectre_v2_user_stibp = SPECTRE_V2_USER_PRCTL;
 		break;
 	}
 
-	/* Initialize Indirect Branch Prediction Barrier */
-	if (boot_cpu_has(X86_FEATURE_IBPB)) {
-		static_branch_enable(&switch_vcpu_ibpb);
+	/*
+	 * At this point, an STIBP mode other than "off" has been set.
+	 * If STIBP support is not being forced, check if STIBP always-on
+	 * is preferred.
+	 */
+	if ((spectre_v2_user_stibp == SPECTRE_V2_USER_PRCTL ||
+	     spectre_v2_user_stibp == SPECTRE_V2_USER_SECCOMP) &&
+	    boot_cpu_has(X86_FEATURE_AMD_STIBP_ALWAYS_ON))
+		spectre_v2_user_stibp = SPECTRE_V2_USER_STRICT_PREFERRED;
 
-		spectre_v2_user_ibpb = mode;
-		switch (cmd) {
-		case SPECTRE_V2_USER_CMD_NONE:
-			break;
-		case SPECTRE_V2_USER_CMD_FORCE:
-		case SPECTRE_V2_USER_CMD_PRCTL_IBPB:
-		case SPECTRE_V2_USER_CMD_SECCOMP_IBPB:
-			static_branch_enable(&switch_mm_always_ibpb);
-			spectre_v2_user_ibpb = SPECTRE_V2_USER_STRICT;
-			break;
-		case SPECTRE_V2_USER_CMD_PRCTL:
-		case SPECTRE_V2_USER_CMD_AUTO:
-		case SPECTRE_V2_USER_CMD_SECCOMP:
-			static_branch_enable(&switch_mm_cond_ibpb);
-			break;
-		}
+	if (!boot_cpu_has(X86_FEATURE_IBPB))
+		spectre_v2_user_ibpb = SPECTRE_V2_USER_NONE;
 
-		pr_info("mitigation: Enabling %s Indirect Branch Prediction Barrier\n",
-			static_key_enabled(&switch_mm_always_ibpb) ?
-			"always-on" : "conditional");
+	if (!boot_cpu_has(X86_FEATURE_STIBP))
+		spectre_v2_user_stibp = SPECTRE_V2_USER_NONE;
+}
+
+static void __init spectre_v2_user_update_mitigation(void)
+{
+	if (!boot_cpu_has(X86_FEATURE_IBPB) && !boot_cpu_has(X86_FEATURE_STIBP))
+		return;
+
+	/* The spectre_v2 cmd line can override spectre_v2_user options */
+	if (spectre_v2_cmd == SPECTRE_V2_CMD_NONE) {
+		spectre_v2_user_ibpb = SPECTRE_V2_USER_NONE;
+		spectre_v2_user_stibp = SPECTRE_V2_USER_NONE;
+	} else if (spectre_v2_cmd == SPECTRE_V2_CMD_FORCE) {
+		spectre_v2_user_ibpb = SPECTRE_V2_USER_STRICT;
+		spectre_v2_user_stibp = SPECTRE_V2_USER_STRICT;
 	}
 
 	/*
@@ -1526,30 +1535,44 @@ spectre_v2_user_select_mitigation(void)
 	if (!boot_cpu_has(X86_FEATURE_STIBP) ||
 	    !cpu_smt_possible() ||
 	    (spectre_v2_in_eibrs_mode(spectre_v2_enabled) &&
-	     !boot_cpu_has(X86_FEATURE_AUTOIBRS)))
+	     !boot_cpu_has(X86_FEATURE_AUTOIBRS))) {
+		spectre_v2_user_stibp = SPECTRE_V2_USER_NONE;
 		return;
+	}
 
-	/*
-	 * At this point, an STIBP mode other than "off" has been set.
-	 * If STIBP support is not being forced, check if STIBP always-on
-	 * is preferred.
-	 */
-	if (mode != SPECTRE_V2_USER_STRICT &&
-	    boot_cpu_has(X86_FEATURE_AMD_STIBP_ALWAYS_ON))
-		mode = SPECTRE_V2_USER_STRICT_PREFERRED;
-
-	if (retbleed_mitigation == RETBLEED_MITIGATION_UNRET ||
-	    retbleed_mitigation == RETBLEED_MITIGATION_IBPB) {
-		if (mode != SPECTRE_V2_USER_STRICT &&
-		    mode != SPECTRE_V2_USER_STRICT_PREFERRED)
+	if (spectre_v2_user_stibp != SPECTRE_V2_USER_NONE &&
+	    (retbleed_mitigation == RETBLEED_MITIGATION_UNRET ||
+	     retbleed_mitigation == RETBLEED_MITIGATION_IBPB)) {
+		if (spectre_v2_user_stibp != SPECTRE_V2_USER_STRICT &&
+		    spectre_v2_user_stibp != SPECTRE_V2_USER_STRICT_PREFERRED)
 			pr_info("Selecting STIBP always-on mode to complement retbleed mitigation\n");
-		mode = SPECTRE_V2_USER_STRICT_PREFERRED;
+		spectre_v2_user_stibp = SPECTRE_V2_USER_STRICT_PREFERRED;
 	}
+	pr_info("%s\n", spectre_v2_user_strings[spectre_v2_user_stibp]);
+}
 
-	spectre_v2_user_stibp = mode;
+static void __init spectre_v2_user_apply_mitigation(void)
+{
+	/* Initialize Indirect Branch Prediction Barrier */
+	if (spectre_v2_user_ibpb != SPECTRE_V2_USER_NONE) {
+		static_branch_enable(&switch_vcpu_ibpb);
 
-set_mode:
-	pr_info("%s\n", spectre_v2_user_strings[mode]);
+		switch (spectre_v2_user_ibpb) {
+		case SPECTRE_V2_USER_STRICT:
+			static_branch_enable(&switch_mm_always_ibpb);
+			break;
+		case SPECTRE_V2_USER_PRCTL:
+		case SPECTRE_V2_USER_SECCOMP:
+			static_branch_enable(&switch_mm_cond_ibpb);
+			break;
+		default:
+			break;
+		}
+
+		pr_info("mitigation: Enabling %s Indirect Branch Prediction Barrier\n",
+			static_key_enabled(&switch_mm_always_ibpb) ?
+			"always-on" : "conditional");
+	}
 }
 
 static const char * const spectre_v2_strings[] = {
-- 
2.34.1

