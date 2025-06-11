Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD0F35962
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614947; cv=fail; b=uyD1wwVqSRb7WPuK5jSS0IzOlHk8e+mmjLntevyzBV3LZRVN+2gly6eR1jj6c9LaVYWDrJBDIEUOQ6wzgvLIDN4VAAJ2w1sgd2Ut0NDoia6/s7nfUohBWqT0sSwwhOsJrAEN1UL5hi8TpMEzgODWpIa/tbn/O6JzYLlpDp8ym+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614947; c=relaxed/simple;
	bh=a+65NTQH7J/fPzi5lVRAv7kci7Xukjf1WeKQqhQh+nk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jvZKcU3kIFAd+qNzvRt6YU5wsj3XIqOuLMCIqg4ajETivI06H6oINbOdNNvXBBwn9UisY3EbePjE90EKDu/OmUt5TTuNv8lFNUlQdcMocSMRlkPZZ1Ci8inD6zvoTf48Jt+7/rNhWeyd4+WaXMfUhVU8SbbFkS+DikMPQARYDwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UZTT3ECz; arc=fail smtp.client-ip=40.107.244.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UZTT3ECz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdlNZdB2X3+NP7qFIp7iJzYMWXN2BT/Gr99vbagYZ8tvuZSweeMKRF2DzZ48TeEFCtm87npnGU0pAwn41B5g2+F9u0bwXjwApt1KGF2GP28LXxd0zsU/35YHUG7mjIup+iT2ylBh86uEZITuSoa5NvSodT9PbNuHxp8oCv71kup4Iplp81s6A7IJq1bIb+SUt6Th0zgeZ+JbdRfkeX0ub9DeGOZqOEmv09FCxY9jOsVNNUWsPu7aHvYTKU957L7hP3ekEwooIo8roia0Vd5h6SGrex231MfnvYByIE8I5Fd8iRmq2WPQfWllnYAJeUlY8kCBlx3VAZTL3EmGT8sh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlcfQA7P/cPOhk2r+vhpKNO+ZBINQG9c34Y07aFZ4AQ=;
 b=N58FvLh6wwm6/GTGCaXmKUN5+9SR5pxNVVjHplQirl74K/URzdFOGrAoupYuv1dhSuDkYL/atzpDJKL1iKEIM0Qacu/vTdaWVksNOWY4y5q5CWOXwoEEUJpuP9NZ854EvRagdcFPgs9ACKyGu8nqkSbM31xaB1LI1VBO74hx6Xx5O+mKuKl/KqQBuYc20sdSmMqGtScWFCODbfwFd49itO3GF/m4t7j2e5lZttr3TVB6Ag4l9tqP/q9e0QYrrCGJ2tTNSZFpc15Rn6Ws4eb6cRE1UFbGPBioRqj+oh+gNNDNSUyV9DK6s/pNBI/0KLH0dWbdA1nkqqFknH2ZwivmuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlcfQA7P/cPOhk2r+vhpKNO+ZBINQG9c34Y07aFZ4AQ=;
 b=UZTT3ECzo1kiAjPETzgv727d8U9X1KrswxKjzJP0DiD/vQR84jWWImpA17KXpBfoLoPTq28AgtlpIlLNLHk+VLbKIoYXIhTySg7QO2bqyJFlES9UEAWoxT80IojcdEwweqNP3jaC/HwhUpNtaKghomSsLYe83t7DYSsHeveiDNM=
Received: from CH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::29)
 by SJ1PR12MB6291.namprd12.prod.outlook.com (2603:10b6:a03:456::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.43; Wed, 11 Jun
 2025 04:09:03 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:1ef:cafe::74) by CH5P220CA0006.outlook.office365.com
 (2603:10b6:610:1ef::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 04:09:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 11 Jun 2025 04:09:02 +0000
Received: from aiemdee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 23:08:57 -0500
From: Alexey Kardashevskiy <aik@amd.com>
To: <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, Ard Biesheuvel
	<ardb@kernel.org>, Ashish Kalra <ashish.kalra@amd.com>, Dionna Glaze
	<dionnaglaze@google.com>, Michael Roth <michael.roth@amd.com>, "Kuppuswamy
 Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, "Alexey
 Kardashevskiy" <aik@amd.com>
Subject: [PATCH v2 0/4] x86/sev: Rework SNP Guest Request
Date: Wed, 11 Jun 2025 14:08:38 +1000
Message-ID: <20250611040842.2667262-1-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|SJ1PR12MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc1b084-cc0d-4c6e-0b52-08dda89db35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U8KtIXOgzp0oeZtL2cGB1cfXhNYZk1AnY43SnNZXbN1iek6iRjpvWLvrpXIX?=
 =?us-ascii?Q?GMGO2qfRfRcIIwhnhO4QT5SgA1pGfvSb548XdCjjTZXIfw5aCirSnvgtJFC4?=
 =?us-ascii?Q?G1jfh8+z9/vPHSJvReFdGmdzTFOWdxcyu4Jz+uzYoQEPjrmA/bcnXg/S0IRO?=
 =?us-ascii?Q?CRL2lAje6dM2rHj2o/WW0OH5yjeyqkVQ3rzezYVM9Gap4JWoBEXZRAoFuQPT?=
 =?us-ascii?Q?bfMBIhl5e+Ic2XMIWk1Qz1tkSqhMRO0fSoJJsIjxn3B3YbjHIyjxj1d9q7tf?=
 =?us-ascii?Q?zZX/fOHkCYokogSzeuHxl7Y5DWraTSSmQjCu/+8axCPD1w+VP56+1Dn86kDr?=
 =?us-ascii?Q?5A6VG5LvpSZh5eKqAFOUgiu+8UGybAvj/XhOLLbUHMyUAL3P2tkryk/snEZp?=
 =?us-ascii?Q?QF7mbQ1TgfS0O4FWKpH/1msFXi16BPKcsvQ6FpzZWa/5OyDAz+mQxGzlFpGH?=
 =?us-ascii?Q?QkowY24FZUg6uxsCeFkDOV+18xMg5b87bIbhU4C03BzCsbXQgspRuGPVuPDT?=
 =?us-ascii?Q?8kQScga31XHGWFMb1cZZZtXHjTHLFTpcc+M28WaZZddpcV0G9WbNhacsXReL?=
 =?us-ascii?Q?hG/NYWDiSzCWzq3E1u1xOqLUotF9r5fKUMRD4Y3krpLww4ZkmjTklYT7zAb7?=
 =?us-ascii?Q?zURmYyz2+FhlLdaKvfJVAMkvKAyfWYdU9KjDrLO5FqL11cPgFcxNlMP1tMXV?=
 =?us-ascii?Q?CiB5vAvRYXf5vHP3GiKW9ccKh1AdUD/IWV2z6Oet5UIlpgN3A7Dv7zN2WTgI?=
 =?us-ascii?Q?tRe8hJJRTWtkaQRrOQ8b5L/vT1t/7nTN5/lRNYnULTxS/PrseerWe6R3lXKW?=
 =?us-ascii?Q?A9F/s4KemhgdIKlTA2bsdtzxILi3+diDt75y25NNYUSN/cM2btYH1vYQTLwf?=
 =?us-ascii?Q?z/WtjTKFLqFQOdouKHs1IegEhKADFZbh6i33wHEJnXIw64eswOAbM9kU7YFR?=
 =?us-ascii?Q?KZxVkVM2xG1jdbhtsyEvkjUYxw7ukBvvVVoUAbvcv0zyj+5UwL4hvn+ijAQE?=
 =?us-ascii?Q?HbghVUO0F9nrbSwHU8iNHEBf/bh1EeAZNCCQsASCixC19CnCj3iIoGIbXNms?=
 =?us-ascii?Q?Igo1QewzWq+Dw4OwUJc4wkDcT+EFFrFI24m7kT/TzgOh6ywpkrWfPc7DqeZN?=
 =?us-ascii?Q?4ch1SufdhM65VMXadTd1oGpYS2xm3UtcmUzAKZLOf6RLCGucr7rmcct0bgzQ?=
 =?us-ascii?Q?1a5r4ML3kuPDXkdqUKYFRFJKQn52ndvfdEO/CpBIhNkmEwlIxBusRVgjD39+?=
 =?us-ascii?Q?/Nqhc8xeDWOjtLMdVknfLeDE9vnKEC6sDzAVuKkyJN0NqeX/H48GJXjGLovl?=
 =?us-ascii?Q?4qkexJDZoDxbk7moTQUJpCJ8MOZQCTmmyS7AVALuurYZbqlT5Wy5tusiOwZY?=
 =?us-ascii?Q?IhYNEroePQN/yJMoD5donMXOhXi7R54z8IY88agJic2vyqvhgkTKnYGMNG31?=
 =?us-ascii?Q?2/8KZqPxBqx/ZnMAa8CzTL5BoZfs80PiG3H7yJgNw5xusIkprfojPxEd19mC?=
 =?us-ascii?Q?ihyG8K+JBFE0BF+W1UmS3XvIytqyheTelNhYc8RH/SPwKpDT/OkIJjXtGQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 04:09:02.8543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc1b084-cc0d-4c6e-0b52-08dda89db35e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6291

Started as a part of the fix for
ae596615d93d ("virt: sev-guest: Reduce the scope of SNP command mutex")

these are the remainder of followup fixes/improvements as
the SNP Guest Request code evolved enough to make it a bit hard to
follow.

Changes:
v2:
* added RBs
* adjusted grammar
* rebased on top of v6.16-rc1


The previous conversation is here:
https://lore.kernel.org/r/20250505141238.4179623-1-aik@amd.com 

This is based on sha1
19272b37aa4f Linus Torvalds "Linux 6.16-rc1".

Please comment. Thanks.



Alexey Kardashevskiy (4):
  virt: sev-guest: Contain snp_guest_request_ioctl in sev-guest
  x86/sev: Allocate request in TSC_INFO_REQ on stack
  x86/sev: Document requirement for linear mapping of Guest Request
    buffers
  x86/sev: Drop unnecessary parameter in snp_issue_guest_request

 arch/x86/include/asm/sev.h              | 10 ++-
 arch/x86/coco/sev/core.c                | 72 +++++++++-----------
 drivers/virt/coco/sev-guest/sev-guest.c |  9 ++-
 3 files changed, 43 insertions(+), 48 deletions(-)

-- 
2.49.0

