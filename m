Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F50D1FDA8B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614998; cv=fail; b=bvL8Toc3Ut3AF4zKUgmsTbqP5Z2RI5IlPWjjbc8RpK5Ge71mxKwAc/Ugq2nZW+VWgmYmhFFI9gW2t3Y/b+oRlPOi37cpXlWMPhSXaRqIdH36OAuDFqTX7TYRDCdVm5ssvzA5TJ6zPxGwF6IjQ3hruo6OPwRI/SAvGOJfDsuS9kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614998; c=relaxed/simple;
	bh=H5CJrdAw+L+QZpvZ+MjAct3ErnBHfJvinagOgEJTJec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f1r3r4psHT3p/E7njk205+2WD++TZVFAuxxEFitc1002ijpnnwepmc8ysIX4WyepzRkwI4jj1kjKGbWfC0F/3q3del4rvi3jORnn1cRhMqQ7iDhdiUC0m8eO5kydQDbwWp8rhSNxleEJ9+AyfwICW+0qPW9tnzD8oYlxtdauLE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KGbtI9Hd; arc=fail smtp.client-ip=40.107.237.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KGbtI9Hd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCosaB28GOZDQ8SWbR0j1plxE9miJOoGSGegCK5Pls9KTYGHdtvRTnwXv4OWD9reMTNVFk6F0aBjjYGd/mOGpmdQauE2Fxt47vSspKLzoZu3aMmMDSxJgNGBCBVHMem12e0k8yfizRW61GITwjxVGWAvfgbJUq1u0bQqhyaSr2EMVGsfb4bX6k2sxsUftzBU+seY/5pZdvg1dFWtSBTKMy91lBg+0pjVgNBQEvGBT6x8kR6fMmbxBTO+2ShQyPCYqzgw66Yxe312ymzsqzx0vthFZ+LP93pFMTn+mz6nabfvp+xhLYfow5RmtHoCzPr5+EONXpM93/d6A3KF3S++fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8iXk+rqud4sAdaUa7E3FPzeEEijeMYbyJbMSj3FIno=;
 b=GmQ4/fqzdNuanooQ/zBLqqjmnGmShniI+tthjbS/7NwfS6Z5B5j44FVCvQ0x6KIeJo3YfJBrJ5vf8BV6+flnZk59HGuNrQPSwtjwpvesQTJatKuwYH7bWmBanxYXeBzrQwdfKHdL4OCVN+fT8V2X+E1L54GDaAnIMN4BcaaTZ1sd3aIO5kUeXhObvnqY78yaRexb1xA7/OA3lggHXKrgHvNlQ771fPcHB/uBoV4PZ4ux8p16b2vSt3ZtyaXvXHMCBTXYHyXM1VN7UvMz9IlGQ8E0lat20C6o1hPZmOlaUSWGFOHt0+8Qgu2TcYbuc3yvEvYudKL/h11hLhtB9rGVbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8iXk+rqud4sAdaUa7E3FPzeEEijeMYbyJbMSj3FIno=;
 b=KGbtI9HdRJVp446iv4QUkuQjDfjOPUQuzm27v6NV5J6qutzbzNwdux7Ie7wZnOLzi594usRlfBGE7Czbb5/X5iPI1IgElZd0WWkRaUOCMueDB/dLEYDeq5nE1iiNwCgHJZE0/UOkvW6SFBNCJGMRDlR2+GgJlpzpKcxYkwuVxAc=
Received: from DM6PR14CA0052.namprd14.prod.outlook.com (2603:10b6:5:18f::29)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Wed, 11 Jun
 2025 04:09:51 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:5:18f:cafe::eb) by DM6PR14CA0052.outlook.office365.com
 (2603:10b6:5:18f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Wed,
 11 Jun 2025 04:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 11 Jun 2025 04:09:50 +0000
Received: from aiemdee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 23:09:46 -0500
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
Subject: [PATCH v2 3/4] x86/sev: Document requirement for linear mapping of Guest Request buffers
Date: Wed, 11 Jun 2025 14:08:41 +1000
Message-ID: <20250611040842.2667262-4-aik@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611040842.2667262-1-aik@amd.com>
References: <20250611040842.2667262-1-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SA0PR12MB4381:EE_
X-MS-Office365-Filtering-Correlation-Id: 194cdd54-d0c7-4841-b921-08dda89dcfdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xRetMoBJ1aqOqwRDEh0z7+hQY9bAlWbNa4pxwBEFNKsOlyefB86SzD/fntWt?=
 =?us-ascii?Q?ww/kPETJ8zOA45NmMP96d3winkXCiDipPb4Q9G8Z/CC6cIPLZA/SeebpYKCH?=
 =?us-ascii?Q?2Ps6CEJ3cnnbUOIAodpy2lAlJdCMIOmfowZKA3MYpi2u4iIxVx2pw/CC+yLz?=
 =?us-ascii?Q?lmdc/Q0qn3LgGz41pDnr5khzkL1tY4cIXIH849TTM5G+mPh5PmI9R+pZoqZo?=
 =?us-ascii?Q?AlbXa+R5Ha9WnjaNxIvkV2Cgsxmc6WToHr04WLLuA4T9+c66s45bCKt2RfAL?=
 =?us-ascii?Q?TfSkJgTwnNY79NZ29CrHe9z2/ZkXm+nIHbd08pP0cxrYGsRVelYlt6PkdPq9?=
 =?us-ascii?Q?jW5OPWsG/yUqelPxrsAMieryohgBU3YqNDozxYT4iz+1C/5Vn4CV+0zYcfEQ?=
 =?us-ascii?Q?7k6MgsLxf5lRVVSePdCWFO+gAyVGVDQhIYqxRMbKN6i9/OFuweRCGSUczjjA?=
 =?us-ascii?Q?HBfOaELb34YNhGyZK0ujyIcmNHMQ1p/Ydu1ZptF/eT3/8RUnJa/NtUFn+WYW?=
 =?us-ascii?Q?3cy0JdaKDCw0VA3+yUEODzX06VLvE0/PbAuyZmguHx8+4OcwK+rKWmK6Um4f?=
 =?us-ascii?Q?i152KdNRRdahZUR46k5xfBVbq62sV6hGvncTj9r2pp+fR68DDJgb9HikShzL?=
 =?us-ascii?Q?3uXa89dCkO/Ti5hQ4PmokGNU4d1F5ef1WMKdjdmwhCR9+kDW15dVnqpSw4ze?=
 =?us-ascii?Q?vaYox5/xUnY/Bic7kvwNAvMtGbFFS6E1PrzqFY1JW88dMWtrunL529ZjANL/?=
 =?us-ascii?Q?+42Ew4YxD2dZZ2IGELPLE2L2afbqvhZomINzW3hsDLqPoIzF+7sIXJxVmHNR?=
 =?us-ascii?Q?8e1Hn2qZxf9PHTO7KMOkV1FXAzTw99zn4FZVDb44QyjG1KQg9N9XIJETtXzD?=
 =?us-ascii?Q?JMi/MS6mVefztg2S+R2f8td8AIBS0cPkMPz70L+eWHpkcSUZvjtkB/cIh972?=
 =?us-ascii?Q?/urHqnKK4hgrkiu5gk9l4XkG2MC8SocJJoVg9c5pYc6pvwamX0EnKq3LVBlG?=
 =?us-ascii?Q?buF0cGCGYH0O8IJPQ6YsijtoSddDPVCqxGotFiEcVhRMhxUWd5tDFo76roTC?=
 =?us-ascii?Q?XEosSLxGS7hMyKWjshxItKIuTp584eatqJ/y85OcM0OuZvMzNezwvBTof34r?=
 =?us-ascii?Q?WKkhbg3L5TDQzH+rLb0cUAKDAwydh/OE6ltu1u62wf302wBGng+ywno/PYPa?=
 =?us-ascii?Q?FIFEe/D+zKYtkQERhN873R63XMzWBED/RtKtFfy9IvfjlL6H6XzRccs4XO2h?=
 =?us-ascii?Q?bkZE/d9IdJ5xU/RQ4mMzQD6LVmnc1diAj374emsBAC2zjxCw1ayjRDLvkIK/?=
 =?us-ascii?Q?PmtmUm1oPezD8RbcxTFaqACh8BkrgApGK+YDbx0W020JpkLl0cgjS6vTmSBE?=
 =?us-ascii?Q?NYwqnWFRoegPsznuuQoNnbZiDyU33k4I5U++0Ej3N8NS/4AnMoTNJW8k1VOw?=
 =?us-ascii?Q?pYwnK4zB6cWxYFf2QjqmG9qdaRpHubSWTIRuBAcGRM72SIB9T4lW1sgoNkoq?=
 =?us-ascii?Q?he8icTQ9LWiF1hte2wTzLMTPrcjKS/62oZ5S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 04:09:50.6576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 194cdd54-d0c7-4841-b921-08dda89dcfdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381

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

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Dionna Glaze <dionnaglaze@google.com>
Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---
Changes:
v2:
* adjust grammar
---
 arch/x86/coco/sev/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 068653865bfb..b0d423a353ab 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2008,6 +2008,15 @@ int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req
 	u64 seqno;
 	int rc;
 
+	/*
+	 * enc_payload() calls aesgcm_encrypt(), which can potentially offload to HW.
+	 * The offload's DMA SG list of data to encrypt has to be in linear mapping.
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

