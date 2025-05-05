Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D517993
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454401; cv=fail; b=U9d5t046hFUgHrjvfxghvX5yTX5t+xhvJATWUAR0QLdsXwlW1snhXtoTQabEYJtxUk2uqzwE6d5Xq4pB3yn4lNl9bpS+33zzOrlOkCAx6w8UGnkeXcQvBRhm5K+6jEgSS4db+LrwaHOoZLPUyjgLBdPjbENptgii8dlugz93b6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454401; c=relaxed/simple;
	bh=MByrxKyLy7fzLHei6wRI9QVvZDeKhr0NFlnCssuJEHQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KBHMqboG6GJXiAspB9lZ552o4nN9Y9aDSNFiI2nm6KoEfENe+Wvn01ylq+nKeLdvrfg3R4/NHrm0jybNFdNCuIGd4FcI2Hm9sm+4C430x/A8IjNyg7yg9egwYO6Xp6rW8EVK0nrTtYmy8dRi8alsyB/WnyLy4RggKmPyVDJsCgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1u5Dyqe5; arc=fail smtp.client-ip=40.107.223.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1u5Dyqe5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTBLoNOiTCVoFP83HEJJRcPbst2CdoBoEds+Mhr7/QI/TYMKIYFPozodMJhc+pfpczQWI+vP0uSfuTspSTbtWqTsSy0KU2WFELDBddRsPxwbI68UWk8LCW94bqXZ7MeJdcKnAajJND+jde0/J4dqHTmFdCHZejCSsHnaY2QS0P9GjBT3lLgfNpUgB3w5XGumBrSoN7HZCX5SF2BgHL8bDgn3LvuyydDdJSX6JsuibOnM9UXMWD8W+IC1/kH9Faosp5tTOOYOg6NfUV76lpdpbbm/+wJp7piz65glgvtLrFpNpaSEQ07yhVvPzojJWE5ZP/tpkkz/ylcRBKvvPGw5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfSxuMznfqoPFgKMMGAvss6JwkaSI4VgunMPeyby08Y=;
 b=c2EcJ4vMGHZSZlrJOycqxxAw00YTCyysxfgF/oYV22mO80ckkvDmBorNUPn4iXgPrWOdSYA+p4Y3cIPy6T8JHm4ekxAsT8FMNf4m9UqOyP0nCdq2f/CFvo+XRUxDEpkgYnAtux7Ap2rfFqevlKHkeXq5m2LLgIiuHQDO7ljoe4RqMS18dlFg4e3Rb7rdYy+9/oG8jZO/m7j1Jm1MIyMkSxDEwQ/+74JLdUpl/VF66S7L67FZE/HvUYg8q6ZFW3cgx2ZxtIXyKsycWFJvCRWDYdG3kjcue+b9HZKoLlTrMilVlClrw4qPb3tFR3+IBdDW3zU+LSwExw+mRxQT6Rko7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfSxuMznfqoPFgKMMGAvss6JwkaSI4VgunMPeyby08Y=;
 b=1u5Dyqe5wtZ6DlJQVdo+UMLt/pUvS+JYzphCMwuyecPJMhcmHXJ+DmGqdMDC3iFZnbcQBghaIjUp6MtbnAcKJp8sLtAKRRRmp8FPu4J1HbKoP7L9g08CfcdRHoaA+jjNg2Oj5GCPbiPNfnZdq/jXhzbzLZ40z69bivoBv2FXPFg=
Received: from PH7P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::15)
 by CH8PR12MB9743.namprd12.prod.outlook.com (2603:10b6:610:27a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Mon, 5 May
 2025 14:13:13 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::ae) by PH7P222CA0004.outlook.office365.com
 (2603:10b6:510:33a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Mon,
 5 May 2025 14:13:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 14:13:12 +0000
Received: from aiemdee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 09:13:01 -0500
From: Alexey Kardashevskiy <aik@amd.com>
To: <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, Ard Biesheuvel
	<ardb@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>, Ashish Kalra
	<ashish.kalra@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Michael Roth
	<michael.roth@amd.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Liam Merwick
	<liam.merwick@oracle.com>, Alexey Kardashevskiy <aik@amd.com>
Subject: [PATCH 0/4] x86/sev: Rework SNP Guest Request
Date: Tue, 6 May 2025 00:12:34 +1000
Message-ID: <20250505141238.4179623-1-aik@amd.com>
X-Mailer: git-send-email 2.49.0
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|CH8PR12MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: c8fd6072-734f-4534-4e86-08dd8bdef8a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Irsa9Pn1yHOklv6xVNsbu84sFZG+FkmlnzEJCvBY5FxRUX6uJ8YgJw7JUB4x?=
 =?us-ascii?Q?tgnqoMsUzcSnK4RnCAWsiQf534azrXDqHvYjix/qs2OFLz6rzkql0C12ebEf?=
 =?us-ascii?Q?Fc6Hq/0nCnLrjmkHvJdAIH17C4wlk0HMbW9+lf5/H2Ew3dmDueZm2xDO6Zqc?=
 =?us-ascii?Q?4kt8GAn/gZ5uQakhxPmCTm03e4qdvYMaAE9dTSK3VBuBlidJZijdEkE9Ph1p?=
 =?us-ascii?Q?N4SSuxtAzLVokW6tfT644/2qRjyq5TSZYUXzzzMs9tMyS28MOldvsnyBlh1l?=
 =?us-ascii?Q?45x8VXqRRVhP06CPWOfhQfLp2PlNGHDP8VnwLQOk/Pqz6iW8Aij2cuJ/bLWA?=
 =?us-ascii?Q?nlQutyQ3MtJrJPzBAl1uK37+V8aOebIpXdDbKtwSLiDcwT1NWL8SlsTTZAf6?=
 =?us-ascii?Q?xfTOelgzCMBHO43OSQJ5JmVmlqJeU7j1RqMTBDz4oeeSdfUiP85v/x/YRImW?=
 =?us-ascii?Q?sf3r3in1k2MLa2ORkjjHGlb8KZFDcrvD7hULi6cHSInrZ8juzH7auOd3D50n?=
 =?us-ascii?Q?uLl8sntQ0AbBcKD0d1CGexx5V3xN/p9yrjqa7ThzwVRQtC0E5QnUqJkkW+Uu?=
 =?us-ascii?Q?ec+60jFQZQHK6MmKqvoMsgSFQYNT5pRVZgi+SIgZ+9NiKtXmUXhmwV1tsxqX?=
 =?us-ascii?Q?jPfi5iUOOlFIe4U6yyOyaofppfeO0IKjzNe9zBIu/Hgu7WpwgAHecmtDwAvI?=
 =?us-ascii?Q?Zn3JZva4NamqAVVHJCn/WwSZjDQtDldnIpcYLKHsd8PjbUzilNWzU2GMIa+9?=
 =?us-ascii?Q?Whqu8Sirswjit1KSbaJ3dCkPZ58O6ZZ4vjXDM9/EY5B4k+twLLMuvDwUemL9?=
 =?us-ascii?Q?FvbuG3p8HIFtzCiGlpL7/gCfdKLrrsiFZBuHO7noAk4nOPavW9affa/teV5P?=
 =?us-ascii?Q?Fqm+nDi6gcAwiaLuZes+oMK3Y0rvDOuv4xrxheshJutOBSibP61B+qu5tMo4?=
 =?us-ascii?Q?UmsO41MpaDYlrCh62jdMzeR7eLAE6LJ9bDY9UYxHZX6aareDqmzDx9SXOguK?=
 =?us-ascii?Q?eDci5tJ03DWhAeuk9VBZ56xZnr897CzaBmUq1YRDA3ASjknJpVgbzSStoIzL?=
 =?us-ascii?Q?qCS8x6iALcwIs86AUB4uGIhkU/e325PYir4jbNU0s2dJZ5CyDs0xcDNf7+sG?=
 =?us-ascii?Q?G9zBii7LutBGMgU5Z+GdpK5aQ5f9jV4TF73u+GehLVAHJO6N7Atr5dCiLfef?=
 =?us-ascii?Q?uJ2EvaHCOrAVxftNDNHB1MhnM4VtJubVOJeSmD84ceB1/OIB23maGStq+Aqu?=
 =?us-ascii?Q?asIHXfrtM9S+U41hZ69Lt9pMl7+NNngZCtCncMtxt0LXsXoizmjaqDY/4peC?=
 =?us-ascii?Q?uoiJepFIkLMZHtRoZl7hUareq1L7y0FjZpRgzEwRRo94JqDzqy5YbW1IxyNC?=
 =?us-ascii?Q?AbtTCmxuxcijh9yMShX+aX92RDTHP1pQRk8CsZ2CVcvebYfA/D+n5QvF7WHo?=
 =?us-ascii?Q?rJ2dWshQ5tY330GK8ww5BgJO8AvXah7QO8Egjl9fAFC3ED+J1AozJxs8nBOt?=
 =?us-ascii?Q?n41mdGKmKeuri2fhf7yZ9yhx7aDfeSFJ4Kr7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:13:12.5396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fd6072-734f-4534-4e86-08dd8bdef8a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9743

Started as a part of the fix for
ae596615d93d ("virt: sev-guest: Reduce the scope of SNP command mutex")

these are the remainder of followup fixes/improvements as
the SNP Guest Request code evolved enough to make it a bit hard to
follow.


This is based on sha1
6c201ee95a30 Ingo Molnar "Merge branch into tip/master: 'x86/sgx'".

Please comment. Thanks.



Alexey Kardashevskiy (4):
  virt: sev-guest: Contain snp_guest_request_ioctl in sev-guest
  x86/sev: Allocate request in TSC_INFO_REQ on stack
  x86/sev: Document requirement for linear mapping of Guest Request
    buffers
  x86/sev: Drop unnecessary parameter in snp_issue_guest_request

 arch/x86/include/asm/sev.h              | 10 ++-
 arch/x86/coco/sev/core.c                | 73 +++++++++-----------
 drivers/virt/coco/sev-guest/sev-guest.c |  9 ++-
 3 files changed, 44 insertions(+), 48 deletions(-)

-- 
2.49.0

