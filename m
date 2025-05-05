Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EBD17993
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454459; cv=fail; b=Dqg922+d/VwBqusDqzRCBPKhQp1BI+RhbWVs/I5tlGGfCeV4sAPGDNkEMbNhPZG6uekZU7THl/tjfnnjo5BDGXoILhZ9uhGH+6AuGFV/NOWIYz3oJjedLvLCsEoA8lZ71RnnTnpl53GeD9lr2y8YvEPvJE66UJsPUICe1yCtVQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454459; c=relaxed/simple;
	bh=FgvQYS7cp7zyMu19Ze7Xkvl2B3hyTaBlVH21YbJfTig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzN0p9mkvA7MNs+RrczIHMJuQ3LEbgO3okdLQUjn3Hh5JnFXWyjHF3cLqQ6Ks+YYMI0J4GovhRAEzoKFOztKJHgjwzZqLkQSUiKTQEqj/z1/QbOMWvjuxoXlOBLDoues+5MAarhfDvpPFF5BeeIIY0MJzXGieD8q0s9HAv7VmiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2wib2o3u; arc=fail smtp.client-ip=40.107.95.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2wib2o3u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=werh/cmWVHYX71ISvEKlGyLtoy9/CyRQxHBgeli4Cc7nCjXFcSGUyXDdYI67WkyjHn6vq60Pq2k29utrgnBZWo7TfGmVDerFag4LNBwbLlRO/zm7hkyLPlPjDnRGdWEPP8Ar58NkWM5JTgtEBUKhESaHSlnSmcqEMORMw1qGzflBL57adh2hs0LLqrGoIk8E8OqPx1FolnvWmnjTJzNY/MYbudHXoq+WHqviaWzhM9qNcmqVpfm5rGyPDbMd/zLbW1WtJhGSR/B7W/gfiOaFB4Btt/CY6kI1pdvSgCq+APLLb9szXovFWl6DYwFQaL1Y4uYFG3cSWAKq07cL/CT8uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5/g+QkU580S89oKwQSW88bt/90xhIB2AOp8xCEH3Ls=;
 b=liutExWv7lPvf7LWMig+j1l6iUBBB+dSyGkxIEQmc5n8H76tgprmBDG7FdrT4H3Mf9mD5TNoLxgrFsHqNhJ4wfjdKdJk/44XVy+eYLnAjrvDFKp1AJLsMWNeoKKmnXiWazZQvvMKA3TOdhPXoeAdKiJWuWStWwvCkZD1g5wVzItYTrPfXp27sZ0lbGMMJ/tdDrRwDDy0bEi20LHS29muYDsxUFkrB1IE4FYFBXXAND7X3OdsPctsJ7U+w2aqWB4kjeyKq8/66KorQvu3Jk4umxZzVVQpB8aTJ4DIdn4IeEWNYHn17/J7/WX4yW34vIGcwljoXfTaYN2LMOvrNnAzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5/g+QkU580S89oKwQSW88bt/90xhIB2AOp8xCEH3Ls=;
 b=2wib2o3ugDJd0IwojYOgVJeVaQMeqRkJRJeyf5yJZ/fIjtHE0/2a3fsQXXhR1xlHh9XOKTNohdYiqjTVRWveoAj+4p8sOP6zba4ppMesg6IpRXofl9AZdNAKrFUYMoUILwfPh2jLowGEawmNylt3q5maRuY1HenZbtJ8RuyuJ7I=
Received: from DS7PR05CA0045.namprd05.prod.outlook.com (2603:10b6:8:2f::7) by
 CH3PR12MB9395.namprd12.prod.outlook.com (2603:10b6:610:1ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 14:14:14 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::7b) by DS7PR05CA0045.outlook.office365.com
 (2603:10b6:8:2f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Mon,
 5 May 2025 14:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 14:14:14 +0000
Received: from aiemdee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 09:14:09 -0500
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
Subject: [PATCH 4/4] x86/sev: Drop unnecessary parameter in snp_issue_guest_request
Date: Tue, 6 May 2025 00:12:38 +1000
Message-ID: <20250505141238.4179623-5-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|CH3PR12MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d5f884-0c40-4999-5a38-08dd8bdf1d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KMDYJ3PxR+Lv6KdgdexRFAy1VoDyVyYKe3KH4nc10aJiTpAxyRLOUagzZwLs?=
 =?us-ascii?Q?q1+1U8q+UD/6Wjkjkz3OEf6psuO+BA7I6p57gbOyRaZU9cjjwaAUDaadOvZA?=
 =?us-ascii?Q?yLfgvnjsuqQVqbtmGwamY6BBenWbQhctKHsboUmdbRn300oyCWIjLvF+0RxN?=
 =?us-ascii?Q?0NwUzns+Q6Q+c1pdHSHt1TDg6FQLZ50mM6RqGbZs3D8LhZmSkPQdMsEUqv8X?=
 =?us-ascii?Q?LaRVVQuaZGuFVeAXpfgTTMd4oIk8c+u+ssWhdm51cmlVUWhq8nicQvB+ftSg?=
 =?us-ascii?Q?7D58C4b5r7UPqMNMfsHEHnj41L97uU1z+L0XHbBaikJQQYMbRdLL3UfsI7WU?=
 =?us-ascii?Q?nREOxS6o9xNQnvW88Wc+SWfKn8BKvFOHib8rd3dwK7LSJ/+qKI5JwyXufAsm?=
 =?us-ascii?Q?l5rinvRFKrFP2VIkMocAtjYmaCPaQWH3plLQcTm25zObTwZWsdWySu1RB9M7?=
 =?us-ascii?Q?DhzWtUqZl5eouKISspVPVpPE7hSU1t9a3V2WIGFQAbTm5TksVYwV1253EcxD?=
 =?us-ascii?Q?0uv0jYADBUJnOWfZE7Hz6fhoRA63R83ATGCddZgdQeyGMZ2NK8cG8xKx/+O+?=
 =?us-ascii?Q?7cAc9oeIm1yQHWI74E8b6RdGpc6+S6Hq4d9O40f7h+sA5ZzIHy8mSKgU1XV2?=
 =?us-ascii?Q?IReUGBgZj0L38bu6uPo2AR7dqlCKtknDgwfEPtFQifaVVVeJkbetajqYcnvS?=
 =?us-ascii?Q?C/ZwEHbVfKRY2MhQioDMv7sO1tWbdkXMiOAAUAYwsIDV6dItJKuJZk0dUe1W?=
 =?us-ascii?Q?0CBlMi3glf6F87EAW3GkEy++9AeJsJV1T1Nn4zH1ZCuk1VF4tz0ZR70iHZpk?=
 =?us-ascii?Q?+g6sAjQ1dlVuZDhapWvu8QZmYwPdddu2ilgv7aWjNb7gOVkSoqCi0CbjmLME?=
 =?us-ascii?Q?OMdAIktxMoVPHGmTDs22gKJ4Xav6LNhrdYK3A4bs4CG1GALBa5s/jGQ6f/ks?=
 =?us-ascii?Q?pn/FHD4Usx6YW2byLCAjmvoZ0iDBpqTYz/sgitCF1rIY3oBOr3z02hogjdVW?=
 =?us-ascii?Q?kXQGBZixkxBvVojLSXj4PWS+LFuaYm5n4Be9bEpXc+28oGrmK7VBbf1pGYBn?=
 =?us-ascii?Q?u83Rs2ZZs576/M55V7qg9B2+KJnDK7yxNvvEwWjHQov3inKfoTlvE5xHhy7k?=
 =?us-ascii?Q?Vzxb9MkTT6Kvw2YiDCzBBXRftCiVJ6xPwO5UdjLNXDos6Av6c+Tc9Z7e55ou?=
 =?us-ascii?Q?RyaPpZxmzCJ1kbdkAhjtI6JBUXSS229MLiOyryEGl4HUOdzp4W3Wp77lu1Kq?=
 =?us-ascii?Q?coYrzEDsdoONnkb9KzDgN5ReFBK80gITWUbIzBrqOhaviQ8TnjMAEEKJAsPn?=
 =?us-ascii?Q?mK5mytco+0b1WHfcS7gVwTIk7laAmrI08FWeM4JhVoWaqOJt1aH5HjK3sIp/?=
 =?us-ascii?Q?0dNNa/smzQ76aMU+i8S1fk68SeD3BluoJqBCWuNqik/WnF76naVM6hcIzkl6?=
 =?us-ascii?Q?NUyRdMPwYRgmOeZ+BbXbRY0Pss5lMbbBodv1CF0zfhDQaDAgyUWIXV1XmiIx?=
 =?us-ascii?Q?mpzlaWW+aPukXH+SmbrhBKqiAmahNvgW1t3A?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:14:14.1706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d5f884-0c40-4999-5a38-08dd8bdf1d5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9395

Commit 3e385c0d6ce8 ("virt: sev-guest: Move SNP Guest Request data
pages handling under snp_cmd_mutex")

moved @input from snp_msg_desc to snp_guest_req which is passed to
snp_issue_guest_request().

Drop the extra parameter.

No functional change intended.

Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---
 arch/x86/coco/sev/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 0b714df62445..0334c40a5c8d 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1322,8 +1322,9 @@ int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call,
 }
 EXPORT_SYMBOL_GPL(snp_issue_svsm_attest_req);
 
-static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_data *input)
+static int snp_issue_guest_request(struct snp_guest_req *req)
 {
+	struct snp_req_data *input = &req->input;
 	struct ghcb_state state;
 	struct es_em_ctxt ctxt;
 	unsigned long flags;
@@ -1865,7 +1866,7 @@ static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_r
 	 * sequence number must be incremented or the VMPCK must be deleted to
 	 * prevent reuse of the IV.
 	 */
-	rc = snp_issue_guest_request(req, &req->input);
+	rc = snp_issue_guest_request(req);
 	switch (rc) {
 	case -ENOSPC:
 		/*
-- 
2.49.0

