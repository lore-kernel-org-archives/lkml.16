Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B021417993
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454441; cv=fail; b=Ulx49OZfkRGdMdvd2zzR0cFl/9llYt8XW/gE6GsBXJOGZ6ScryY8S1fClcIGBRhRMyVabGiLm2VWq85pzS2i2k8MnqvDe6PJ8so/yfNmze1p3+dlCXqdaYb0ofXBxqfYMj7Up7Ew0HXn2vetGd1SIZNDFLnWHbsu7/6e89FSeBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454441; c=relaxed/simple;
	bh=qixu2PwtYPw+/eOWgMQXNfluwGc5pNyj8Fd1Q3PbOwg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3u8C3Eh7ZcECOmu4DbdBt7ZfYcMLiFzYtdCOELOHFpkQmrzVSMpIYQQ+K8oX/UgHkFcDmkZ5j+tiHEE5YOAs46kJYAI5ZxEfAcyregjZ4rdsNcSkr6lNcAf4u8mo1JBjSNIHHY5aPGV4hKL+EumKgBHAs2ew0vWD5VA1r8kI7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S/a61J7l; arc=fail smtp.client-ip=40.107.223.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S/a61J7l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM9CSDIq12zYS77kzJRkrbj6R3cT2j65/1hBwNVdWaRIB4EsduyhOXZ411neDWIW2DFg5lmS0pE0gpvekvCVElf0yNABrVqAfqutaemNKNCR9hPMVW+MMlbmq99hySlLxqcXCdkcuHeT4Og+o4ws1roWg0jTcR2pmzDCSzYeyq76iaVOVgR4YbOSHLac1wJQwNp6LdG2KRBLa01UzA32cnOqCcxluFMYNn7hyPTgH6DC+ffx8kirYD7rIhN7sslAHW2p1SIjQ5L0xaiNr7ISIxg7ilbOaEL1dj55RpB6yplHDX5kjaufyLHfVGNDz3xgDpRc+8ZoVupRZ+tV2RMxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtCHTBj2ikjUoFZLg2R/mABh1LpJMFoE8LMOfmVxPVY=;
 b=Tx1u/6xZ+9cbenee21rkSRrCxYk73JX9kfd7xIHWgmjYQLa0MLeriV1dhkp6eb+eW6ef7WTGLbpouDl16kHEmmBVVF/pY38+qiiefzgkvjIwnG87vGQWUqTs7zGnF+gz4qA4Q7WSWOBU01aAxsbIfcjRlaCljEER094Bqx2s1BhWlti7/QDwpvPrEfiM088GRYIo9t0GJkCoOilABx3V3NlziavsYHvb/NInl17ZDSleCHCntCs/l2pusjm/l9azDwg9h2wKdoU327fN8ZCCnp2SSrmpFcgQdIMdJFPqs4otIAyjreu6lR0sr3UzrrMp7Gvb9Ws7I/nFMoopZtZtOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtCHTBj2ikjUoFZLg2R/mABh1LpJMFoE8LMOfmVxPVY=;
 b=S/a61J7l06Bu1ApNuXdfz8fp1GElZhvmG9YXtuisVvtaOEDH7bNWr/15VBrjGU0htP4izATkn6Lspf/OvOES9rArfmK4K/e0vTIpKsmCg1+ow5neXZXz3hWSHHOdBW6uYe27sRXYrB0IkHutJYleW1g/NklsxsDGKcm4lkErfcY=
Received: from DS7PR05CA0079.namprd05.prod.outlook.com (2603:10b6:8:57::9) by
 CH8PR12MB9743.namprd12.prod.outlook.com (2603:10b6:610:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.22; Mon, 5 May 2025 14:13:57 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::3a) by DS7PR05CA0079.outlook.office365.com
 (2603:10b6:8:57::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Mon,
 5 May 2025 14:13:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 14:13:57 +0000
Received: from aiemdee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 09:13:52 -0500
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
Subject: [PATCH 3/4] x86/sev: Document requirement for linear mapping of Guest Request buffers
Date: Tue, 6 May 2025 00:12:37 +1000
Message-ID: <20250505141238.4179623-4-aik@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505141238.4179623-1-aik@amd.com>
References: <20250505141238.4179623-1-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|CH8PR12MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dfa29a5-40a2-48e5-6bd2-08dd8bdf1351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YJF88JC4K4u/4EVakOb9heNPDaS+7MP44ftEM8Zq+LcVO439D0azGZQBAcTE?=
 =?us-ascii?Q?CbqhvcoedOKJ5a0LdSUHbv6zl4KmOarYXFrtEl/aX1E+GBuDt8hZfQPLwytd?=
 =?us-ascii?Q?UGIVXNldQvxjP14k1f9G48RlxZsNcIlUr7Eo7Y0kkSffCu5skIWMLyE0HkmH?=
 =?us-ascii?Q?EYDC8V9dCGwlPbcpgtMQdEa0Dh8c/ELrgS2WHY6iJv/rPwmUzm2W1OvGSR+s?=
 =?us-ascii?Q?lguS3VDD8x37JjyEDGD2EPHZONfMUkEdO7fBdiMNHUqcHKNHhZRpAq1Uxx67?=
 =?us-ascii?Q?CaovL8eMEFyJxuRQw7gAtFrcL9CtRsRW3aKIjGQEtfYH/0h8UT0xFlyWJora?=
 =?us-ascii?Q?Wuodovii9RAXwT5obNaFZ5KtozQcuS2M3fYOUBP/deOtnA6agbtmn0AQN4DX?=
 =?us-ascii?Q?Na0o9LleiRpzZ/dYCiJlBlWxyUfl7yk4ecv4uzfH09LORK8l2WV1txUVs1Vr?=
 =?us-ascii?Q?FDAdcIm5QgphifCdWGTVKpdXEzZ0sIJo7C/tSjpjiYa2OsflngWP8gVhzp8F?=
 =?us-ascii?Q?Ve9C9ziFHdBhOIo7JrNhBAMvKKYKuwl8B5a70I3U0rS21whl8FJ5PxPC3hMf?=
 =?us-ascii?Q?GwwCpQb543iHLqDSGmGGZK+sH3F3gP0hXE+hKC4UAlHpNpn4+2bu3/yc1rmA?=
 =?us-ascii?Q?Ghp5aUTGzUcNvH2fNp/twOehKMJ6BXO+nqOTT0QcqvhwH9BQcG314VFIZL/k?=
 =?us-ascii?Q?WWXfXc42tvS5l9TL1s7I2LU+PIPKWpIY6R+kKQDc3XMuQbBjXNmVi6EVhGQe?=
 =?us-ascii?Q?Be23rgZOVFsXaDe5+rAQmelLR884esS8vKMKGu9Gue++tBOZGR+0x662thRY?=
 =?us-ascii?Q?ksWJRB5AZ/hSAWWqjsHEnZbOA7Ma+cit+WifkGYLpwWx3P729mdUlDkAqD+7?=
 =?us-ascii?Q?6Obuh7nk6bgv05ra07jSaMhBsgQdOFpux/cnAnFg6MoCN2Nb8qZ4ZTP4z3pp?=
 =?us-ascii?Q?IzjtVBCybKAosdIE/GinpFTKZRQV9xEhcZNYI2AzglXKFZDjtXFCj5q87GiX?=
 =?us-ascii?Q?aMf+XXWVyEzLgQmiVnE712w946YfxgsLXWFi3fpt/VSH8vXoyZ/eQkqirsCx?=
 =?us-ascii?Q?+cPRk9zKAAZsY71b1VMKcdcwOZiNnrn3qTlGE6BZgcWxofFXDtS4ok5nj2Bm?=
 =?us-ascii?Q?J5PQ2z+1vs/0gmSPFT+yF6Naxir5yArdho+Kj42EN9hudt9d82EAU5S8da2x?=
 =?us-ascii?Q?VO0muT57UJS5L5nTRZm9YDWY3FffuWR7aKclQhbqax80dF9vjDTyHK7SV5xW?=
 =?us-ascii?Q?4F/fOqnQ2kCb7JsF5ABJP3LO0AdzJCFJ8dLuYWoDmSB2AxRaoH85n4r74Gw0?=
 =?us-ascii?Q?Re5J/ZrK5tqWdIw/2RU5nqpPsbk2IBurRPwSXNv8hxGacwvDJtpHQJReMsaX?=
 =?us-ascii?Q?IweTGrxC6f2NbWRXBW6mU+2PuYLnZSEL8rP5ZOH3J9bdi2+0FohphL1QCL3l?=
 =?us-ascii?Q?4v9jWIfm3k2h0pJARML/V0aQ2gU/0hAcpc2F2yoB/eimiQEZh56p+6GvIEB0?=
 =?us-ascii?Q?hseRigM/gQQUWWJ9VaSaQyloK4p/gcFFh50q?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:13:57.2991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfa29a5-40a2-48e5-6bd2-08dd8bdf1351
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9743

The Guest Request supports 3 types of messages now, the largest is
the extended variant of MSG_REPORT_REQ: sizeof(snp_ext_report_req)==112.
These used to be allocated on stack and then moved to the SNP guest
platform device (snp_guest_dev) for the reason explained in

commit db10cb9b5746 ("virt: sevguest: Fix passing a stack buffer as
a scatterlist target"):

aesgcm_encrypt() and aesgcm_decrypt() are used for guest messages and
might potentially use a crypto accelerator which requires DMA buffers
to be in the linear mapping.

Add a comment, pr_warn() and return -EINVAL when the buffers are not
in linear mapping.

Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---
Changes:
v4:
* ditched BUG_ON and ifdef
---
 arch/x86/coco/sev/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 818ae7b1694b..0b714df62445 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1941,6 +1941,16 @@ int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req
 	u64 seqno;
 	int rc;
 
+	/*
+	 * enc_payload() calling aesgcm_encrypt() can potentially offload to HW
+	 * which involves DMA so the data to encrypt in the SG list has to be
+	 * in linear mapping.
+	 */
+	if (!virt_addr_valid(req->req_buf) || !virt_addr_valid(req->resp_buf)) {
+		pr_warn("AES-GSM buffers must be in linear mapping");
+		return -EINVAL;
+	}
+
 	guard(mutex)(&snp_cmd_mutex);
 
 	/* Check if the VMPCK is not empty */
-- 
2.49.0

