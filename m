Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A25D1A7264
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867105; cv=fail; b=WBB/LJgN2S1ldzWlqC4/KJMTRHR89dsVA653q5Rqpjo73XG0ovHfcTpYnliB+yiQYoRcRid8Fp8QLR4yNrdaT3BWeVHbsS64D0AfQaCjvQd6rer/U0a2Zz2skmG2Y0xyFG9Mp3G8FJdkPXWIzEswNSsrVkPDA5Q1f+ro/VWwoNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867105; c=relaxed/simple;
	bh=oNNoKIURztB1RpB58apaSs4AX44oZAeL+k8Qi0if4Wg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dcLNpKam3N/0YpRsx4R3PLLjMPbVIQ0LhRDrNaUMZ2Ildpc5gCEGlPedYCr6gl9xuZXIGoObieBfHadRL+1r+UvKOsttfWxTJZ5+RRj0KdNZIkw6XOmDiJVVaykaoLwFiECgnkG/oaRSjh0a8zBkNXRcQpkTbeab3qqeU2kS9uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5qfEOoaj; arc=fail smtp.client-ip=40.107.92.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5qfEOoaj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCYjWBOshivZcGUklq8Zxp/IF0IFPMAOY6h3nSYasMXDdT0ZJxTkxTk2iZMRn8yeBlOAUm0azJHhRLKVgcryv3Br2AwLlJC6d1avdfU7aYX69t24t9UyXOcq7YqEg8ur+eWAUoxuqBc3bqtFiMdkyACE70IRQpEvZfQcOEj0VP2LpPSD+B9gJMdToI/klqKvGf9MGZYOB4bjMtRypzzwxcf9j//s1+EeE+flVsfTbZQ+fTq8rFmXc55ukrViB4bvlsTitAXLsuvIwnCSy4v/+LmJVBA/GRycba3fWtqY7AtFPUaGGH+Rq4AQNV+F8a9ZKHNXb5FlRDzeWzh3emDnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ar22oSVOzKSBgz7UE8a0HRDVLInYN2S2oJh/+jtfdKg=;
 b=vkNi0FgL1P9TiuG3V69MYlH7MunSQ4bxY+vfmmekvgYdVM9/akIBTPsuXzZcKG99jAtEzFJeE5k6EBaXS4IF7ZkY7n8qJV9pguJeq96i3w4owcUnxpuVNLJoaCLIF9x1hDPFRmyRhSrdhB7OHcnmR+HA4Hyk+KEoILzsPIM3O1U23wAvOEBYbJgZ4w/1Qla8VvyaySwXBQRD98CgML5Q2GndZXPIwno/upVYAj7oQCGlSpT3ltt1ZyAbf82iO7nEDIw/D9ehztnJLHZ9CdSr1AeZqtIogVN+0W8Gu7k6+2hui8/rLnjRyNzR0hdWQWHh0wftJ6n+Djld/O82OLRAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar22oSVOzKSBgz7UE8a0HRDVLInYN2S2oJh/+jtfdKg=;
 b=5qfEOoajIgaw5ezZTwEh9SEHYvTjdr6V75rQmVG4/mdvQ22viE9U9DAiFm0/KgPbPrOEFOn4wJEm0oitIxqWMV2YWTKEW66lFYfs8zl+dCk4EqzyghEfUWZKc3CoPyEQOBO4ckk4qUPbfaX11zxILXmx8vumnHVBU6gPMm4Vz2U=
Received: from MN2PR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:c0::37)
 by SJ5PPF7B9E98CB6.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 25 Jun
 2025 15:58:18 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::89) by MN2PR05CA0024.outlook.office365.com
 (2603:10b6:208:c0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 15:58:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 15:58:18 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 10:58:14 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] SRSO fixes
Date: Wed, 25 Jun 2025 10:58:02 -0500
Message-ID: <20250625155805.600376-1-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|SJ5PPF7B9E98CB6:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a3431f-9dfc-4b48-6add-08ddb4011a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dPtJfsjiKmmVVSYuVLNudYDYpoD2RIe1mZ9iKL3iptlP6EjUtDIweestH2Tq?=
 =?us-ascii?Q?k00zpvkxx/8cHQf4qp11aGbJPT3oP6iGI9IxOsVbg9/EdhTMb3BZlN3gs/u3?=
 =?us-ascii?Q?XsREKN1MQnsSUcve4c4mkGJQk9L3rC/bLbPBdUHrJ6XT1R0E4G5O5Kab/lKH?=
 =?us-ascii?Q?78Oq5W2tAcRmSQzVx/J6b4QbbbUtdSxwRhmaJwrOdD8gNkWPHNyZ/igdW0EW?=
 =?us-ascii?Q?9MB7nu3XwTowEsvm749KntrdJ9oiZM03r17fuHBSnpCS9ww/y38Qa2nk6jVA?=
 =?us-ascii?Q?9jXV9W6l7V0VDoFoRaKac5484RY5DVI+2DjnNkGSd5tFx1QY95CRgUUTxhEs?=
 =?us-ascii?Q?bohXRS+n/e31ubTP7DwOgUg7QyXNIN7qH9NHfP1pfcDyoJ9gOHNAwojHempQ?=
 =?us-ascii?Q?0iUlKSzK6+y0PdOhVNGeNmXLubqT2hQFnvWvLdsVUKxTOc6UT5Szcx4ZC99c?=
 =?us-ascii?Q?FvIDgmqvfq8GRCkZDmzYPsv/D2yvqUMZwYA8eXg4EvMKcZ30m8noSs8tD62E?=
 =?us-ascii?Q?f4FhU01UBCNC2YuG6vH63a5j6T8HoQFd9dI4hBBexCPCOyP/U1/n/c6QoJ5U?=
 =?us-ascii?Q?WB8sWtrdzeqO3k8aZV/dr04aKoXi/r1iSplhNQsUC43Mvto6kRFdp/5j3Ntg?=
 =?us-ascii?Q?grPTlCpcMjsOhrDv5tLqoG3xhySEENt0bKA5THsbeY+I9jwBkgiSBojEM+8W?=
 =?us-ascii?Q?Dv4Y/UcgeonSeGvt0Xf+v2qOFNb//pKAF3mRB+ezOjdIgPcXxoS4m8TDo8ul?=
 =?us-ascii?Q?BXInM5bqiV9BmL/VhzXPowUDFrD0KjicZP/KPHf4x43RBeg+OwEuzWxefj6m?=
 =?us-ascii?Q?16S7kIKryLrMhnZilOpqXeKZ7wiHfnulfEmuTnjY70R2Z2xwQsGfUj43yWsC?=
 =?us-ascii?Q?zYhjRjk8xMGNngw7WuRwtfi+SIFWvsQc0dmaztW2VTXtVfovqbSGvfx0mxCa?=
 =?us-ascii?Q?+V3Cqd10F+i0b15yqtVwKRPz9Tu/euyYkF/tRhBUZjIJZjaAK8ISBb6COU1J?=
 =?us-ascii?Q?OrysyFA1vmJRumM/0nSbs9PsvFgvngRY1FdcnjivlLyDPF/3aZoAtnepj5kO?=
 =?us-ascii?Q?5JD3C2Y0FDCMyv0vn8zVsg/+BlbGD+28UOExzxJL9JM7EtQ+ele94SWo64IR?=
 =?us-ascii?Q?LggxwzOqgZZmr+a3edOgHZPK+Z6wXev4LQmHKb7vN7kOsGcOhWnAW1A9UNqQ?=
 =?us-ascii?Q?qxpU+Zowj7TfDk6OPkFbsKt5YZQgt56dwQm1qONWC8qA/eZQwVd6rwLevg3r?=
 =?us-ascii?Q?rYk/pyAeSS6lqfOsbttkVlGHmT1cAseoDdcEhMxzQyMbtsbURe+NN063hA9M?=
 =?us-ascii?Q?OI7DgqRL7H4ghdhywPCgajt0JJyUlxYbbfI/HZGp4/NP1pqFrqagOqzphIM5?=
 =?us-ascii?Q?SaRETkc6ECoRER8akKSLYv5LB7UNNc17nfy0zL+GGcr2sWVlw60ltlduZK9+?=
 =?us-ascii?Q?8mgZcWHmiBeQzIuSee663cmWhvvSYlchTcAocN9OLR+hVCL7h0OmtF74Vhu4?=
 =?us-ascii?Q?zuqamJhgWEUSnITmPor1dqU87Vyx7Jt3oMAS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:58:18.1100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a3431f-9dfc-4b48-6add-08ddb4011a0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7B9E98CB6

Minor clean-up/fixes for SRSO mitigation handling.

David Kaplan (3):
  x86/bugs: Add SRSO_MITIGATION_NOSMT
  x86/bugs: Use IBPB for retbleed if used by SRSO
  x86/bugs: Clean up SRSO ucode handling

 arch/x86/kernel/cpu/bugs.c | 78 +++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 39 deletions(-)


base-commit: 49151ac6671fe0372261054daf5e4da3567b8271
-- 
2.34.1

