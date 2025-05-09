Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA12367DF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808143; cv=fail; b=Oz0nQaIqhTEzeLRncjymB4H72GpQP1jpTsg4JX+H4JdrlKXquN8mo55VnEpWVjGU9unMlznq/yIp3wo5Uz8Se6lE+YoL38mQxfnoBpweBS+WFx5ONRejTccgG3cz7NJanLFCcjEWq0qo2oK31A2Eem6TRTPMMaiTb/LHDx91A+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808143; c=relaxed/simple;
	bh=7DCHzGLqdZMy5fCGElerKrOFwVrCI3QRPRlgC/B3Ei8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p/t0gKQtHJuZYx2sub2vfXi6fsbTiVRnfE1LrnQkL8l6qxO1jSNZTvcsfOt+cTO0WxHkOyBeAmjB2Ntd28xhaoezd2Nrm/3RZJGj6APnoROZCa5QMA5voyazkhyuQHzXggeATbMyXV372vJbQE19s6IENl/GLa41qHrcycQiDok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VaM69pfk; arc=fail smtp.client-ip=40.107.94.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VaM69pfk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihPayR2tqLaSfiw/xlojJQF0DzgE1gBskeMQ5yglvl+HHtO6KBL0tV3MP+9pU937EpeNvzD1rGWtTjT2DxSdnvHTr/fUywEngHEQUduiUzB8s31Hjq6yIPMB8MrzPlZH9paQ1u6cxLvzQjY4NWswGbDa/frKOn1yNoeJ11221pm1XlziYHJFrvtBOvWnO2kBr1Et95x4Tzl+v00wlqMRNAnToLbkQdgskWiZz0nkTkNfSc8MXllxxVwWqi9HB/kq7PbJuGoM9rCv5iJwSaFC7RgQMiAH6CvlOVlDzpbM6/+6hYBZTnsPN7+GLEGHm9akkpHblkJSomIrjiWUHcdPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCVIOwVgwsLsuXbBNeHpoXLzg+VKVFXeBtmKez7x0Ko=;
 b=vNxzWYe4aKkGnrYgHrLNxIksSpSUVr68WrvDyfqIzD9elMOVwvT19fwe2A2Ld/5DGAQFSExa33dtavWAYn/ek9WqNkWK5lJy1LBDj8mKwbmepHqPNv6cGwdOlhvCrVW/QxcgWxewQhQVrCyj+46Upr2PY+FeCSPBbeIWHQvnEYbvuKCbTpdzQquQFf/NAcdlbhitrN8GleX5YH1otjnsS/Zgv7XSphzTK1J+4zeMiHpfvcEh8zt9AIaFdzKwx+x8qQNJuCXS2SwAS1x7uc8IG6e1Z4l1FNq0fDXt2bYyrAh/4628dHrC5c9QWmOwUzizRGcdsTOdmFdd8cdHBrHaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCVIOwVgwsLsuXbBNeHpoXLzg+VKVFXeBtmKez7x0Ko=;
 b=VaM69pfknVicS5lUEY4i3fK3Q5gGsvK4ZmlwDUff7b8IHFDjM/i+hc2Yro89rpF79raI3RK1drgTtSzu0WuB3Hn1vsQMsh1tcsu8GceiNgxqcNf1NobS8SMhqCjAaLApFbZw/61EEM/s2ULsU6fxkKOvIqdsqqO0zZOo+c2yEis=
Received: from BL1PR13CA0103.namprd13.prod.outlook.com (2603:10b6:208:2b9::18)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 16:28:59 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::6) by BL1PR13CA0103.outlook.office365.com
 (2603:10b6:208:2b9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:28:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:59 +0000
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
Subject: [PATCH v5 11/20] x86/bugs: Add attack vector controls for spectre_v1
Date: Fri, 9 May 2025 11:28:30 -0500
Message-ID: <20250509162839.3057217-12-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 17774019-a142-44fc-5934-08dd8f169a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mUoFcndaUpSJ64vrwzb9Zw8o/oIBvjuy8KJ4E6PUmxDQitPAX7sUeFh3iWm8?=
 =?us-ascii?Q?nDGqaUl60MyS7/8X5/kp7LUFsH1DZYkjnP+CYljEs65I1LChFm+ODosENo8K?=
 =?us-ascii?Q?SwmABjE7bC7y9KlAsx8Yf63bSMNFNkxC4hdzx1S0v8NKb91FsbzMVkn2RGBD?=
 =?us-ascii?Q?W2VGQ+JQ5m0vlpCzjNqvomXKCOzoB0I99LlMqh6Veo3/r5nQkCWUFuE85heE?=
 =?us-ascii?Q?AA+dk5KmiBj9Epy1ixhPclaoY0actQq2R3SUxKuksu9KjiSWTrTUnfD481pb?=
 =?us-ascii?Q?W9omH59+X1wFc38Jqae72427gzpSikWEEm79du9HjaJyL6jppE2X2cwKUI6g?=
 =?us-ascii?Q?ajEZvVzS45WUEIUboIALPZnDcEJkoFD+7cQnV7qBZooEAuxR181d7DuFy5WC?=
 =?us-ascii?Q?ZxPzYY5ayX5am8BhZj2Yt692dXiRcG9Jk4S14ydayNTrQrRvEBiJwEb8h1IC?=
 =?us-ascii?Q?kEOMZHxxaz9uxCouf2TyiR67RCyXtBKveZps+R10tWjd6jj1lgPmFIZa0dfz?=
 =?us-ascii?Q?N5w29CrUx7HZeilIPqDVxbKmzyA5vNQdczd9pUL6TvF9LGxLm/PL+eqFMhn9?=
 =?us-ascii?Q?SlsCzKlm4yUUJOI6TrNtYmxr48jem22jechak9t2gY1nHyuZ7xVuMLbIlFfq?=
 =?us-ascii?Q?HUtEbO9hsa7EBo+v8rzTS9JdPpPJxTMqi61vljMz4GruaMZmfx/jWWlGX7Ce?=
 =?us-ascii?Q?CHSVXhc5XLjRBtop0JG9cIda0lqs4N/vUGDSJU/TD+BqD/wNUmkfrUkwFHQy?=
 =?us-ascii?Q?HBQiP6SPMxJT/RuyvJnyJDHMtTTZXx+w01hGI0kxWAzeZ90HM0lqYNozgILi?=
 =?us-ascii?Q?DyA6ZGBQZRZOvdCfRRzrm3vdWuh3JKxYpk8buGdHev2uvOraU3xTcUD+SH0h?=
 =?us-ascii?Q?e8+eKsMLSIMOnMNfSdKYceSM8X9mS+DXrEQsch/Xk+70+Hk2goDf7T+3orr8?=
 =?us-ascii?Q?pLpi9vhcSJNauFZYtZYeADOoviZ1/hT0eiOxz1wmUMMuTPqge2a29lNU0Oiw?=
 =?us-ascii?Q?+RZjSFEHG/zPw83b20DneweRlcM+Mw9Qg3aiB2PrvsCegtmswB/3CT0zyhFv?=
 =?us-ascii?Q?1uKll+4z4O0m8VJ051tKWnlm6W+XutlZsaXKbiJAWIQHYRKzDfbCTRDnjaQ/?=
 =?us-ascii?Q?POFSHu4DeOxddKDMrR9S676j3RQKhbD5lF0hJen3XQpQukg3F6O1Q61hvPst?=
 =?us-ascii?Q?N9lx4uf/ZW+EIZubuclEJL5rc4601GvmwWqzrEsev9KjFsLg51thJCEPRjYd?=
 =?us-ascii?Q?3qyxx8KJ+YdAw36MsSvIajwmFeLP15tD3Q8kRwz3EcRTT3GkXX6xPKrYWX4A?=
 =?us-ascii?Q?u3z8Vnsv6jkr/0tOvfc/OGzy1Q/elOIlkN6C/yURPVN8p73G09sdj+hH9mf1?=
 =?us-ascii?Q?TbamAx9dUrLxVC04ChFa8xr+q7mP+vRMNWUn02WTJdry+bcC657eRxkym36v?=
 =?us-ascii?Q?mpBXwRWUZUPr7bqxHfjoFxZ5mDVC0ogft3uPUL2P1kkts3bbV6MVzRZuKuC0?=
 =?us-ascii?Q?qh9WXaZCbIm/dsFICyqViNSIruYGsdNKD8EZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:59.5754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17774019-a142-44fc-5934-08dd8f169a3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786

Use attack vector controls to determine if spectre_v1 mitigation is
required.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 659455c5b38f..ad68130707c2 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1122,13 +1122,16 @@ static bool smap_works_speculatively(void)
 
 static void __init spectre_v1_select_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V1) || cpu_mitigations_off())
+	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V1))
+		spectre_v1_mitigation = SPECTRE_V1_MITIGATION_NONE;
+
+	if (!should_mitigate_vuln(X86_BUG_SPECTRE_V1))
 		spectre_v1_mitigation = SPECTRE_V1_MITIGATION_NONE;
 }
 
 static void __init spectre_v1_apply_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V1) || cpu_mitigations_off())
+	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V1))
 		return;
 
 	if (spectre_v1_mitigation == SPECTRE_V1_MITIGATION_AUTO) {
-- 
2.34.1

