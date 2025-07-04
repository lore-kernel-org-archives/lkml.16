Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061BE2D12F1;
	Fri,  4 Jul 2025 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629270; cv=fail; b=bZAtEMuF7o1wgIwGMxb5itiYUtmACmCwzyk5YheLBpTj1IpcQaPOU3+5YWsj8//V3aUIf3/Ozl6t5fBi8eHauq79Rff+eR/OtN6mfcR4r7a1kATLiaBoogWu1WbO7Mwnj6u+tsi89wwD3GMJgT3fCEeuF178qSyXMWZxh97SZF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629270; c=relaxed/simple;
	bh=D7ENNFUaXg55PuE2StDfihzpbbtItUOGyDlztaAap0s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXByodvo8UQ1ZjUu0DLmxN4lEKeArkhO9mSn4NhWSwR5904BC4EKdhcnUYRqsXyhzVzL3Q+0nO3PTiXywOXCtOJkG8KvqNnWgqcdSdMx3nSP6eb2SQZHQay/mbS/QqZh/K1VVaKLSmCdtxyOGxTIZpKcqebhr9nUSCiJdaj2bvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D372K4Wd; arc=fail smtp.client-ip=40.107.223.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D372K4Wd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS5o76RsGszdamqcLGCuNR0lRaM2FR+XKgbHk0cIWQtHIYdnjTkBmmIVYXVJeJjDT+bofOoJxdJpNqMoC7HDn1Db32i6lZF2nuGzB1XIp+SlytjCEjMzDtj6JXnXOSUtSVsTatc5gptSaZ2eN+s9UvdXLyRrXuETxh6I7rTJQrSTAqNd22TXNMSnZ6Q+RX2SUIAjhdVoFimARFbduXRdJvUpJF7Xqa2WpM/8jhMqh9I0nqyJSsLlkZU3U7z6Z4y7vGgCOqkAscxx6k0gZgIB0aSAuvYI8Go1pHZmw1oip6ChS8n7D1jOpraBf0JqUm/9S5hnJMB686yPC3FgQbHqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF3uC8+aBXaj4Hb5xZJIgBSCZ4z19R2u9gf7m21ilGc=;
 b=h6a3tOEp/0Jhk1gWjKKQ1zBgAZGIUKFnKjRIHJ8DJiPbeI8K6W5uwUCut05GOVE1fr6qnq8w2VWt8C6Kg4dM7M6j4u2Jjaymp/ccZSuB7vjx8Mfrb2j/Rz5OicsYbsGb7jT4+1A1W1/XHFvwzeEMvV181o1Vb/iCYAcKTy/ff+SThJ+Zhud2+Pa9G/b/I+AUSmox1Pprq9/SetJaIJqhI1dg1+QhMLa4aB3HXQK//tDS+HRBoJlGZRpQGsasK13AoC3x9HGo7xlhQrMu5RVUhg8ogFH+Fa5ZZuhiOfkT0O8eiie7Kj/GMt7TqpQBH1Z7IHasftGPl/wM5bZQv1TU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF3uC8+aBXaj4Hb5xZJIgBSCZ4z19R2u9gf7m21ilGc=;
 b=D372K4Wd+EvKfWh6tUcD0LP7kSjPv+DR3/bGJ89ISDZtLbHPyMpI3TUvdGmkFGIRp7Ce2Vi6vO7F6WjsXqVkRw+0AP2tmBCTIEELAOSSTpumThc8DPSEsUUhChezD76TuSxwkeeUJznHECQbcoTVqnXrEI7PpTZAtbPLitF/QTs=
Received: from SN6PR16CA0064.namprd16.prod.outlook.com (2603:10b6:805:ca::41)
 by CH3PR12MB8548.namprd12.prod.outlook.com (2603:10b6:610:165::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 11:41:04 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:805:ca:cafe::a3) by SN6PR16CA0064.outlook.office365.com
 (2603:10b6:805:ca::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 11:41:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 11:41:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 06:41:01 -0500
Received: from xhdctallapa40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Jul 2025 06:40:59 -0500
From: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
To: <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
	<m.grzeschik@pengutronix.de>, <Chris.Wulff@biamp.com>, <tiwai@suse.de>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<punnaiah.choudary.kalluri@amd.com>, Srikanth Chary Chennoju
	<srikanth.chary-chennoju@amd.com>
Subject: [PATCH 3/3] usb: gadget: f_sourcesink: Addition of SSP endpoint companion for Isochronous transfers
Date: Fri, 4 Jul 2025 17:10:13 +0530
Message-ID: <20250704114013.3396795-4-srikanth.chary-chennoju@amd.com>
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
Received-SPF: None (SATLEXMB04.amd.com: srikanth.chary-chennoju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|CH3PR12MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ceff89-5111-46c9-e164-08ddbaefa786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zo+m3LaIjVhYKzfloo7HcdCU8FB0ULjqvUJP5kLIC7LNEDn1RxIf/LeS62df?=
 =?us-ascii?Q?ywdrzDTKFWEiqbcstDTMM6kpeGeDkX2vH9oiSt1uPM9+ZbysQXz+yAo5QXs2?=
 =?us-ascii?Q?OwCpEZZABk3hH85a4ZCOViiMbScYgzwoIYgGabVhqSKfE6ViBM5hhpaqkwxx?=
 =?us-ascii?Q?uul0GsPDSjnqhUVKRDVN/Pc9PSNMwtg1j/7Ssnee52O2vs4ishVoW9TavgxY?=
 =?us-ascii?Q?vRpWYpnIKVvxRSWwvtA2y7a3L+D8/8Hbm9ErHqjNi/eiP+FAh63crll5POnp?=
 =?us-ascii?Q?RJrsbrASKV7QpxUOjOChn9qK4PaYkDiOdcYNCqiPkDpkEgUIbth2h6QRRu/K?=
 =?us-ascii?Q?1B8Lyn6EH4v30P82QhEiJhuh4py8dCJTKdivpx1ZUubxhu2EVOJX9BjXRrhA?=
 =?us-ascii?Q?gjp7MBzl1bnhuWNHjDSTADOPfcYzSsuSOG24IUtJzjXvMBn8aZBnZyNbjRjA?=
 =?us-ascii?Q?C+hw8FNuLBQFFnKyGoBjbkdU8qpF2BJYezRFp+Q3wIXmncdkPaI3/5lBrLjz?=
 =?us-ascii?Q?l0k3gz6/7b2oCyrSYwT19hGKMrl+3SB54pHHOoQp515UJC/4uFwwhz2GbeN8?=
 =?us-ascii?Q?IxppQsvrP/2La51zqfeH3nf8Jm2bSEqg+NhbvrE7/x3oy0e3iReyEcSzqnf4?=
 =?us-ascii?Q?qMLomOpyQJ+tRGqyLhNFghYeLmyh07QPO6Jk495x1Po1TJ5W7akNEgosFY1k?=
 =?us-ascii?Q?JbiDX4nPX7oabOT9mK+LHMSGdJ9Y5VkjQs9/YNO84mxPXtnye0Mo/OkDkgYW?=
 =?us-ascii?Q?bQJG7IZqZBjImcwNiitntAeqqDrWpbNZjIxzj7ftMr8bw4YiXq7lL9yzDwKf?=
 =?us-ascii?Q?ZGHQHV0r5EjSbBnJVTkOzB8evACGH2uP7+p0Q4H366MyNE4dcUd/AGX/J77m?=
 =?us-ascii?Q?1zduKVJQSD43ZZ7yAj9VcxNjVX1F3kbPO6Y3oDxeMurRhj4/CgaEx2nwE6Du?=
 =?us-ascii?Q?iQ3YIBcahHrKwREK4+47tBG1RKaRH3qodSk0miXz8ADnsak/WYAaxVlpg9Uu?=
 =?us-ascii?Q?QL2PuMJ2HzWV/04O3aSki5RDIN5zuT7zAPU/3wNrhhxi/7Pe/4KkypAc/9BL?=
 =?us-ascii?Q?RbAPdqX6uOARa0XDeQo/c5FvlK2fDRiF+srKCuJ8gYkukJ1kvAvGUBlAUlAU?=
 =?us-ascii?Q?LVutgjuHFza9PwhkZJ2bHUrHEHIWov7f5ciWDyE+ezJ2Q+pz2ZrGHKEEg54U?=
 =?us-ascii?Q?NWQBSi/BuHZ3/YEgOah3mwsaDNzW37BesHCSjG9GvStPEGbsmgfQLeuu3AvW?=
 =?us-ascii?Q?jJoHeqbXwEFMcgH7s5ZlpKZHNdydQ1NowUYqrWotkJUvqUex8GkiD843ItGf?=
 =?us-ascii?Q?OOwUniSXMdwvhK15Uo8OkD6LT+VnzW+tE2yIK4gleoNWvZNFhiQ7ogmGj2AT?=
 =?us-ascii?Q?1jiuR8Z7gYe82F2xa06NWEQ7ei8gmTffILUcVnnzQKlEdoss/vcN0uFMU07O?=
 =?us-ascii?Q?/T4jOBjQvPArJBQq68fC00c9F5WIZyR1oj2mSl8BeWpzmkSRRtf8rMRTEvGq?=
 =?us-ascii?Q?OIfWPMVRNjMftg4RTgihWfk/nqcH00vTGeHw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 11:41:02.5698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ceff89-5111-46c9-e164-08ddbaefa786
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8548

This patch is created to support super speed plus endpoint for
Isochronous transfers. Now super speed endpoint companion is
accompanied by super speed plus endpoint companion.
With this change we could see the Isoc IN and OUT performance
reaching to ~749MB/sec which is 96K per uframe.
The performance numbers are confirmed through Lecroy trace.

Signed-off-by: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
---
 drivers/usb/gadget/function/f_sourcesink.c | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index 84f3b3bc7669..6499e95e0e9c 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -232,6 +232,12 @@ static struct usb_ss_ep_comp_descriptor ss_iso_source_comp_desc = {
 	.wBytesPerInterval =	cpu_to_le16(1024),
 };
 
+static struct usb_ssp_isoc_ep_comp_descriptor ssp_iso_source_comp_desc = {
+	.bLength =		USB_DT_SSP_ISOC_EP_COMP_SIZE,
+	.bDescriptorType =	USB_DT_SSP_ISOC_ENDPOINT_COMP,
+	.dwBytesPerInterval =	cpu_to_le32(1024),
+};
+
 static struct usb_endpoint_descriptor ss_iso_sink_desc = {
 	.bLength =		USB_DT_ENDPOINT_SIZE,
 	.bDescriptorType =	USB_DT_ENDPOINT,
@@ -250,6 +256,12 @@ static struct usb_ss_ep_comp_descriptor ss_iso_sink_comp_desc = {
 	.wBytesPerInterval =	cpu_to_le16(1024),
 };
 
+static struct usb_ssp_isoc_ep_comp_descriptor ssp_iso_sink_comp_desc = {
+	.bLength =		USB_DT_SSP_ISOC_EP_COMP_SIZE,
+	.bDescriptorType =	USB_DT_SSP_ISOC_ENDPOINT_COMP,
+	.dwBytesPerInterval =	cpu_to_le32(1024),
+};
+
 static struct usb_descriptor_header *ss_source_sink_descs[] = {
 	(struct usb_descriptor_header *) &source_sink_intf_alt0,
 	(struct usb_descriptor_header *) &ss_source_desc,
@@ -264,8 +276,10 @@ static struct usb_descriptor_header *ss_source_sink_descs[] = {
 	(struct usb_descriptor_header *) &ss_sink_comp_desc,
 	(struct usb_descriptor_header *) &ss_iso_source_desc,
 	(struct usb_descriptor_header *) &ss_iso_source_comp_desc,
+	(struct usb_descriptor_header *)&ssp_iso_source_comp_desc,
 	(struct usb_descriptor_header *) &ss_iso_sink_desc,
 	(struct usb_descriptor_header *) &ss_iso_sink_comp_desc,
+	(struct usb_descriptor_header *)&ssp_iso_sink_comp_desc,
 	NULL,
 };
 
@@ -428,7 +442,7 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
 	 */
 	ss_iso_source_desc.wMaxPacketSize = ss->isoc_maxpacket;
 	ss_iso_source_desc.bInterval = ss->isoc_interval;
-	ss_iso_source_comp_desc.bmAttributes = ss->isoc_mult;
+	ss_iso_source_comp_desc.bmAttributes = 0x80 | ss->isoc_mult;
 	ss_iso_source_comp_desc.bMaxBurst = ss->isoc_maxburst;
 	ss_iso_source_comp_desc.wBytesPerInterval = ss->isoc_maxpacket *
 		(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1);
@@ -437,12 +451,17 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
 
 	ss_iso_sink_desc.wMaxPacketSize = ss->isoc_maxpacket;
 	ss_iso_sink_desc.bInterval = ss->isoc_interval;
-	ss_iso_sink_comp_desc.bmAttributes = ss->isoc_mult;
+	ss_iso_sink_comp_desc.bmAttributes = 0x80 | ss->isoc_mult;
 	ss_iso_sink_comp_desc.bMaxBurst = ss->isoc_maxburst;
 	ss_iso_sink_comp_desc.wBytesPerInterval = ss->isoc_maxpacket *
 		(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1);
 	ss_iso_sink_desc.bEndpointAddress = fs_iso_sink_desc.bEndpointAddress;
 
+	ssp_iso_source_comp_desc.dwBytesPerInterval = ss->isoc_maxpacket *
+		(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1) * 2;
+	ssp_iso_sink_comp_desc.dwBytesPerInterval = ss->isoc_maxpacket *
+		(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1) * 2;
+
 	ret = usb_assign_descriptors(f, fs_source_sink_descs,
 			hs_source_sink_descs, ss_source_sink_descs,
 			ss_source_sink_descs);
-- 
2.25.1

