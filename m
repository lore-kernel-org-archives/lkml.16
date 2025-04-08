Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFD024502F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151604; cv=fail; b=ZVZiZ5ach8sk6XTCuxjsxBdfc3RshDoKeEgaYf4izh685SO3TNYVerO3fA/kRQzKSWg1Bjbr13sGXGVrOBpacnN9P29iirJZe7EjWG9PRUQvkSi3PL9AS2sQLh8O+TZ4OblxJfjJSPDHFBTc2us6PIeL0tl1YdsIqrgcQLpcLxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151604; c=relaxed/simple;
	bh=xEdf9ImSDJ6fM+MFl/Gs7dVqQ6ikTyD7RTDkIO3nJNM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NnIuQpeXZbP/oPxhXJbmQqsT/tz84kaEMo/7RJ5Q4Aa3+N4EvwRGzjnaA93AJYQZiBkhBhDPz76hfBnz9SEXSdfIBrrq1+9ceLk1NxWXBa+Mk1VKXoezWY/psaKVKXIze6dVni7jVzYog3CNhbMy6OSWJVWxqfwN8/ACWcmcAC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D0oN0I7k; arc=fail smtp.client-ip=40.107.220.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D0oN0I7k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxffWT/wPLD+RxQBjzQ7mfYlpyb2rkyK7fY/144d1wtedU1Mphv3xabDyZ+EBQfD3mAuhHnjM4an72Hi9SG0aywvNZjT1sAuw23ShseuVNkJclb5u8gq9YTpDsOvvjeJNfWHEXh1QjeaWoxM9VqN2oPAL376jXT/iPElCB2OBwa4bSm9murfkz8rFCiB0Jj0TpUVJEB0h4BhFQKkI/jQFD8kNlpanB/P/WZ0oDmUv2tLq/9pbIX5z9XnDsjZF3Lw2hipptX3Mbif067TV8BwsbXsBdcNSijm7sO2YsXCc9p+YPh4D8i1VBsnjb3djcQsmHoPuWQ1xSAluUPJfeqvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T5I3Td/pe/BVl3aAEHMfcjwlKM8kdYpSmpLcisrAo0=;
 b=fhxpC0dgdUCZbQifRb5mYDkEB0spqDQjwJ1Jhlk9eNLJgEecy47pmGNl1/+lBX6rn2e5fYp6iO5cGsIcTessaVHacC9nFg+ZarrCvkabfAi+FRyYkAFcQXBNtLcAU3dtnW74AxSQ4aSlt7gHrPgrIYAz8Ra2TwwgnL4nPF7zjjvk/8tMG3sgJnuYPv3dEXJxm02MepRuANAcVPrInnM8rshm6wFBdPv9igD6UKejSzbssFHCpSmR3lxBjCB/t25Fe66JqhYaHV80OgCC3T90bMNUj9uA8yTUHvr1aI5qodzfutFk3/0M2S7BnkDWz+E5Tq8FTx83KiSx4hRig/jz2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T5I3Td/pe/BVl3aAEHMfcjwlKM8kdYpSmpLcisrAo0=;
 b=D0oN0I7kHr+Gc2K3g9GhCPLN433XNDW2REa9SZaaOI5lgY72eazYKas4+YZhjk/c0Iy21jS6xOuAqFa3M5u9nOBSc0WZ+Dp2PJRTzBckDljZzpIYRXt7WgHe6JP7Y1POaWxsl8jdhVl8EEXPNGjRYD5Rw34ELY14qrct9JNOKJk=
Received: from BN8PR12CA0023.namprd12.prod.outlook.com (2603:10b6:408:60::36)
 by IA0PPF80FB91A80.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 22:33:20 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:408:60:cafe::a6) by BN8PR12CA0023.outlook.office365.com
 (2603:10b6:408:60::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.20 via Frontend Transport; Tue,
 8 Apr 2025 22:33:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 22:33:20 +0000
Received: from driver-dev1.pensando.io (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 17:33:20 -0500
From: Shannon Nelson <shannon.nelson@amd.com>
To: <jgg@nvidia.com>, <dave.jiang@intel.com>, <saeedm@nvidia.com>,
	<Jonathan.Cameron@huawei.com>, <linux-kernel@vger.kernel.org>
CC: Shannon Nelson <shannon.nelson@amd.com>
Subject: [PATCH fwctl] fwctl: fix repeated device word in log message
Date: Tue, 8 Apr 2025 15:33:00 -0700
Message-ID: <20250408223300.24561-1-shannon.nelson@amd.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|IA0PPF80FB91A80:EE_
X-MS-Office365-Filtering-Correlation-Id: e1762590-d917-449c-b1ed-08dd76ed5dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ji1+YRhQK5r8Ryn2iQhm2KGLyG08hBgrLDqaKHJ9/SyTjcs5dLLBSsLuSX4A?=
 =?us-ascii?Q?fMBB8VQp2wqO7Y5GYMIxA29RegbiEs6I9h4x3i8fvVwaL2Q/lHlKbAhyNgo2?=
 =?us-ascii?Q?sK8/Sd/R8Nzt74PFavg+K0BGCsih7pv6jUy5A9Hc9apCddKVXC/CrPNxlqp+?=
 =?us-ascii?Q?Gq6mFNrSLF3fItgEbZVldr4ctCRsxM4mi25Lr5gOqrMcQaHMgnFV/Vkr1SL9?=
 =?us-ascii?Q?O5lrmQEtsYFoV06Qw/S1vQ6RKIMgAxfVloe5mIBR3whIX5P0tdZVNFaCI02L?=
 =?us-ascii?Q?FwN5cvFDGu7cm4LzZQYdlnrNrUvuD5JfzfgDFFn23rK91h/H8CrssLRs804E?=
 =?us-ascii?Q?qGw64oeWo9HPztlI0nXt3tAS3i7c3n3jLHIYxFXOVNFZVL9faU0PzB4txSYt?=
 =?us-ascii?Q?6acfKxYmzw8d+udvAsZclYScQekl9AelQ/lg+O2zt2JMn4vLdU+pEIGz6FBp?=
 =?us-ascii?Q?++KTsGqhiZzNhVe5Ggw0CJk9kYZYYe6TWae9fTkuFwk00tNBdYl4a+tk1bSZ?=
 =?us-ascii?Q?5kkMt/jANq41jp5mmoj9GEbutwPyTEg/BB0g+Wvgt+76B+LmsuWc7OhIcR40?=
 =?us-ascii?Q?3vqzrFkbItzlluABmzjoyBPMk1ouVWC/6wExRjPokTZvv66y9+HzFAS2CbJY?=
 =?us-ascii?Q?yX4dZluXovWLBxmtS/ocDUtEazkubgH19jG8ARJQ0s6cfMNa9jO63Mv2ZpYv?=
 =?us-ascii?Q?HSUnzzyCjE59IpqF6hPsFd8A6EHAutqiKiyrRxZODXsBiavxPiA8lNd5qGmj?=
 =?us-ascii?Q?jrZBmagWVY2fDMnsD1QxwXX8FonkvkhFmKq/6KY6BoTs2kcUEL8t1v29qlkA?=
 =?us-ascii?Q?2hgFime6LBz6mQ5R5MhYAXBCy8Qq+41yzUGevutGiq5s4YXETMz4HoNQW4FJ?=
 =?us-ascii?Q?EhXkkdL0D88syApcXq8qTkcC50EcaGvvEwGA0BClP8nAyxSCIGZHkiV4BRNg?=
 =?us-ascii?Q?P9g9m0SXoE8PYPNkGOofMrcb+tKNMr5gLrEX7iA2OCYfOFYCcZPOTR6oqFoA?=
 =?us-ascii?Q?PpjKedieqcxJYw4epd/cRYMRXF+naKXNsXzDkEnMDB9IgzY+Bj0XNedENvdL?=
 =?us-ascii?Q?pM2MtDijXjbIoHwP80y3F4VZF4Cjvq5pTQPHK/z1mmnoPrnOuhLnr8KKPXOq?=
 =?us-ascii?Q?/g+l1VQB7cyHUD+ua94/cSSFipuIh8yVuPy7Tx6N58CbugsIQXITjXbanmVm?=
 =?us-ascii?Q?1E4BsdSLypcIWQfEdPmc1YitwAzy9Y5THxBYHFjazvjaEdpmn22a3+0r+l4B?=
 =?us-ascii?Q?AL1ycn7oPYV3PfO5w14iwqO3VMti3EOZnSMU/SlGNJjr4PjWglK+kR+8ce+k?=
 =?us-ascii?Q?ppYfccTms/Q6v65yz96U+sSd4UAoHdnZO6d48gIRznBTkV9HV7baZuLy/DZu?=
 =?us-ascii?Q?oNTtk9z38WYN1QSrtPcbl8qBjyZcW1UzjeU2RNcgPA38qN0d4U2i+RChyrnd?=
 =?us-ascii?Q?Pn7dhgTFsLJn8bhhN+b96NNJvBNhEkkIp37yBC+S7X3EbUWl6BIlinTQ10I+?=
 =?us-ascii?Q?klZdJjpH8qfAqT8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 22:33:20.6935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1762590-d917-449c-b1ed-08dd76ed5dac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF80FB91A80

Remove the repeated word "device" from a dev_warn() message.

Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
---
 drivers/fwctl/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fwctl/main.c b/drivers/fwctl/main.c
index cb1ac9c40239..bc6378506296 100644
--- a/drivers/fwctl/main.c
+++ b/drivers/fwctl/main.c
@@ -105,7 +105,7 @@ static int fwctl_cmd_rpc(struct fwctl_ucmd *ucmd)
 		if (!test_and_set_bit(0, &fwctl_tainted)) {
 			dev_warn(
 				&fwctl->dev,
-				"%s(%d): has requested full access to the physical device device",
+				"%s(%d): has requested full access to the physical device",
 				current->comm, task_pid_nr(current));
 			add_taint(TAINT_FWCTL, LOCKDEP_STILL_OK);
 		}
-- 
2.17.1

