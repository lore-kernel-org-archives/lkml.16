Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595292D0C98;
	Fri,  4 Jul 2025 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629257; cv=fail; b=rc3chTGHEUf2feTSknrKw9cvPRs2HX+Vp9VYm8LIBdeCfaI7AwQn+eUEH/8g/laZO+S0ldeaeOnIWZYdXsW0BDetwXg9Bt+Afzqla8/NkEv81qVY/NU78Z0rGkNzLMdaFjp6kGs03kS6gXJIKLjuHFkGef7Oln1OU7gn+PH0TJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629257; c=relaxed/simple;
	bh=i1SNYa1Wh4r/bZFH0Rwd7Nfkp3YI6SLQs+AX7I1fcfw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Efamzz5F4LrQlLPSSRdzrmtrqQSFPKtJ7fsjGUEhwHDhBeKKIsXk1RJhOMbBCuwMhFnfqBssXX7J6JMyHEA7GK3+i77BC2ZWS21PR02xRQ08EQfMcNhGV2yORKuG/z+pvXzqn4juSZZTqpIj+3UY9DoUPwY0WHBG39lFQRNhEeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Le4rfhmO; arc=fail smtp.client-ip=40.107.237.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Le4rfhmO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLkSd5HryCOPe3tJKmlU4TdL6eckw3Rh9WoiX/4mjCNIzteRSdG1y6d3m0vVAgX5v/LF+Hkx6yjzCzQuN2uUp4dvWLqqOzWa2fdt7xVn0Fr2K6LDDIxEL55xzpiSUaf44r39Cr+fs6X42ntIgk50djnFxRgZOyAGZuEAP6o1oSCVhThMCSEy2FLUmq8g1g5fCt/7G0vMUo9++JtK3x1V0/dCKr4ThEYOiQGU+Dm4WtPBH6FbFxLiVr3rArjp1X81a2G57ZwIfyeLlMUdwre/N9D74XtiUCO5lZib0sPJFURx3EzXl0HTphlHKLcqyFCdXQog1WqsEHZxCumvKNFRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5org7tZeyRzt8Ct7VN/kTlCXJNYFBJUkrthem9HbXk=;
 b=t33wtlZzFkv6B4fUoHkeh/kQYAb/jZSYx4xqwqqmH4j/s6oACYKw/jO6crcqm0HEDMKs2au0pvvHGgHwNnCcC25CapmD9oEYp3dydRNefUOOQHvc7K+mUjHCz552iAAinXSqfd8+9waulcQdash7CzPLP/Eu6/dIvaFnDkhQqrVhzLdX9NsSutoMfVkL/hdTF5JM8bA1lTZWx5c6Dv77A2yAMV2KUEUJqIz80lqGHxvG+1kt8eQAjUWGUS486CHjdd6J8vGfLPRre5Ebo8i8o3S2W+PhDEjxXnkFpCli5P5FD6ZujkOcLQBs7yRH5V7nHRPoRX9OwlK1izrLYGnMow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5org7tZeyRzt8Ct7VN/kTlCXJNYFBJUkrthem9HbXk=;
 b=Le4rfhmOopJzv1rYFDnSpmCjSoCjMXjoqurmy+JqGIEVduPAZfqYJkjToPFyO26igLULOu2dgGt4Gcxn3gnUjljBXOqLGq875FI+b8qL7YwfxnV8iE075AAVTvkUZHyB7ICquR7iAapwYAX37FhdFy6Qqv8TToda2Yl9mhlBnIw=
Received: from PH7P221CA0056.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::30)
 by BL1PR12MB5852.namprd12.prod.outlook.com (2603:10b6:208:397::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 11:40:50 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:510:33c:cafe::fb) by PH7P221CA0056.outlook.office365.com
 (2603:10b6:510:33c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 11:40:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 11:40:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 06:40:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 06:40:48 -0500
Received: from xhdctallapa40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Jul 2025 06:40:46 -0500
From: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
To: <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
	<m.grzeschik@pengutronix.de>, <Chris.Wulff@biamp.com>, <tiwai@suse.de>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<punnaiah.choudary.kalluri@amd.com>, Srikanth Chary Chennoju
	<srikanth.chary-chennoju@amd.com>
Subject: [PATCH 1/3] usb:gadget:zero: support for super speed plus
Date: Fri, 4 Jul 2025 17:10:11 +0530
Message-ID: <20250704114013.3396795-2-srikanth.chary-chennoju@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
References: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: srikanth.chary-chennoju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|BL1PR12MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: dec6efee-2f46-40e2-cdf2-08ddbaef9ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?82HwAPfb6sXkL9sKn6UDtTywnjt7MEzEUvqv6rahq9sp2AYoDRt/CCbbvC8v?=
 =?us-ascii?Q?pZoxiLEzmk4hgIKinvYOnciw+N5bFXLeLtcVK7p9fsmU/oO9e4d7icNhIf3g?=
 =?us-ascii?Q?bD8n7PPUfFW+pc15PGtI2PNpsQ+pasnWP+YMhUfTqfhjZMj9tjmpMRHyp5Zp?=
 =?us-ascii?Q?XmA3ycGOxno8+r6ziXFtphbYOb+DaCotyx0ZqdwRrohwgIw5HPE5RCfR6RhJ?=
 =?us-ascii?Q?8k3OIf8WsHVmGsGuksWmZmD8+R3X3ZKIeAD0e5qvLTk5evjLL6cpt7ZUJHMk?=
 =?us-ascii?Q?0pIyb9sDFEEmE7pfg/xd76FphQgGCF/lav6CqUIms28aRSME3BpQANueqWI3?=
 =?us-ascii?Q?cwU16g4K8OU0BEIFDxQl7AyxN+4WRdjPi5x0xoCZyMwykDMyf2s9VFt1Lb0T?=
 =?us-ascii?Q?9HmcNkJcWGl7+ZTdtE4sUypIlQ57TIoU4hxwewdligH/NRd9EtYQWbEFcPkJ?=
 =?us-ascii?Q?TSagAvWwNiSaXuO2Qo3t+xHhB0fVZAy8lRQfdyrGI7WmUr+QhdjieAgnZYBB?=
 =?us-ascii?Q?l2WYd0/HSi1+OW76xCN37++DJh/MlpyeIThg4GJkdU5sI6kbfQDzLwzithze?=
 =?us-ascii?Q?TaJfBBT84MEEf+LngtO2xO4aej65LNB8NTv64G2+vnL+FTmcBosTG2/2SgKN?=
 =?us-ascii?Q?xYkOOWKo5OrTsHkYzGZg3Zr+UlE0mZdieFB2lbZxgIBVt5iTm30nJC8y/i9h?=
 =?us-ascii?Q?McNlBsOKqrn5QjzZKq6mSMXJsU1adFbe/szGE7bd5+WY3Usqx0CDiDwXeXW8?=
 =?us-ascii?Q?fgl7lkiCQLTxcNs1w6mWATd+pjOxygSQR46GZLBOWyVNs0myhcN9fDaz107T?=
 =?us-ascii?Q?iGKvjMPc9eSnaV/OnzUx5gUr6LthJ3LvwLJDn+pocn68uviHS3Ayf7SssWQ0?=
 =?us-ascii?Q?pGU4aYTZnN5C+a2lI3S0DxWW4U2aSaPbcC3FhWYZTLeVy6b8tbu5sqTUk/8F?=
 =?us-ascii?Q?cDq1ktsKOyzVCASi/twODQia+I1V0eneS321QjtKh0MYAmKOjIC1Bf458Lcc?=
 =?us-ascii?Q?TGU4t4F5/gv/BnHT3OVlVZWBKFRiHEhljDnOjZgVh2hwRH2P2quTEJPraIhL?=
 =?us-ascii?Q?Seo0dZXOKHSqMya/avHhO2pTMm3PDh/PQhEW6NfXBBl/3XrOcbRtN/oIrPlI?=
 =?us-ascii?Q?UKcaRtqmPODvqmBxrxO0v+ybYkrsazxcjNBjLH/VYSjhSB/rick2vB7FviJ4?=
 =?us-ascii?Q?45R2TlbQeBMp1PfF/+Gm0Ng+khd1pf374qMjVo7SZdUGKCLK1bE6V3e7noVc?=
 =?us-ascii?Q?SAENvXk6QHGx0CulQBMHEqWc4ZA0wIeTZbqXBPHn1KVUABYc93pfjqAlYkeR?=
 =?us-ascii?Q?teu+DJS2enW3FmKD/2KrGlcddfEJsZHzrzxxiGdvud3Abd8cgD0IT+wzXOVK?=
 =?us-ascii?Q?2CejKZIDj3eizYot0btSPutd6oMZoDopRhLOrvRdAgaopOakcoTbzeB3V/Rb?=
 =?us-ascii?Q?GNz2AtR/IfM6K26GNhqFBCxi9Cks0oP1dfErEigmcn5b1nfLkIfeO+1w+72h?=
 =?us-ascii?Q?5BBCJqsBopHX5Abw93bVzNAphsIJ3i9PSoIE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 11:40:49.8498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dec6efee-2f46-40e2-cdf2-08ddbaef9ff1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5852

This patch adds supports for devices which are capable of super speed plus.

Signed-off-by: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
---
 drivers/usb/gadget/legacy/zero.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/zero.c b/drivers/usb/gadget/legacy/zero.c
index a05785bdeb30..0cfb7dec22e2 100644
--- a/drivers/usb/gadget/legacy/zero.c
+++ b/drivers/usb/gadget/legacy/zero.c
@@ -415,7 +415,7 @@ static struct usb_composite_driver zero_driver = {
 	.name		= "zero",
 	.dev		= &device_desc,
 	.strings	= dev_strings,
-	.max_speed	= USB_SPEED_SUPER,
+	.max_speed	= USB_SPEED_SUPER_PLUS,
 	.bind		= zero_bind,
 	.unbind		= zero_unbind,
 	.suspend	= zero_suspend,
-- 
2.25.1

