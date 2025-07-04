Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90622D375E;
	Fri,  4 Jul 2025 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629260; cv=fail; b=fmw58I61nwmTX34VapLHoCErn6yvL5x6yLRox7/HSobpFZ+mKX6jGiCGqLWwlAf2ahjX1puWxBd+50/vLcjuHICxc48ghGcQ6cUVkjCuCEa3ldsSp2BZnypV8VVm7Gphj+iJ5H7k65uvGKb6qmcEBXVYfwS6ntAqx4pj6TJAM6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629260; c=relaxed/simple;
	bh=Rngr2GThNdU1hSinne3Ttz2G0aeHzslG3UL0bittC0Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TT/ycTwLCdRDuLuOT7gr7bJ25xjcxbw7Lp90yPPRH3wMpE+qkd3ss24eJkS5o6RymmGF+2FGwmWh5YWO/ColeL/fHrE+72/UsjkMwMpGjh3Sh1w7gYjy67bwZJM0yXPLc6/RMPFpkdxlmdKx0gY1vzMtrq5uT5YgWhk+lXK4SBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iikq3RZ+; arc=fail smtp.client-ip=40.107.94.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iikq3RZ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTXu3OGDGi/kbjGzZRuGxeGntALNGv3yejOUCmqR84bEw3l8ZlC9C1HXPpV3a//aBHP+LLPb7IdbQU4skw1/KU+vAV/Ant+Oc0I6xuiOP13roYh6KTRS+Bgxd+PeDsObq3BFgsZXlSOWjTHEPxETCne/MDE1ri5aEfC15+cKMP2t47l2JlAHshv8gYMVyzW7FE7lZk/ZtXIkrVYh37183k/GROcRcXjKY1Ga4+3ZAq7yEVr44/CqGtBAgiW2KsD7d+YSOV7VBUuecDGiXTrNqgUntzenGgnE3fPFg4JntgKRmKi/yQ6TOGfrX0VR6Xix7xs3wHhFGXmJmKq/wgCvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdoATwdI3mfgGJMyuFvaW9Q8M67+gYHziDJAlUNql7Q=;
 b=GkckI5r/gfoaROZt5853EhtrnbxYBZOGbjkiqE4P8joMdyLggJnq1F9wQmKNNLFWG9Xbs7Pd5E/qhaqc7gZ2/AQhxceYyB5fbun7g1FvRf3qHch91t9R10agZbVR1Ssy6kcloIYjdaD5jDLGJKXpiDtxnGa28kR//BzbngcV9fwTsieJTTy6vzZVkyew5of5g02UL1nPd6mXL4tytVO7xBp2kx470maSKVOcL/S21VKfTYLcYOQuQgpzOeqautttcgQ61gu1QQzrLGTwN/qMMvkG3YB2IU2xxTeeiLsJI1ZBNWSRH1P7xrjePTesGNM0mc0jsi+byFTOQQm4G6Mq1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdoATwdI3mfgGJMyuFvaW9Q8M67+gYHziDJAlUNql7Q=;
 b=iikq3RZ+0outVc/NvCfqQLCBYxy1I24p2YQ+0l3hZS+j4kj/7xH5qZfyLHxtZw53VIdKLziKBw9bl4LOi+Akc361zA2AP4FSi8D4nt8zCzsw+DBwCKhf7yrm8YTpnDUqshnxaqTYbRQ0997UrSUb6dN1yaPlAKSh4Q7fCLViN6Q=
Received: from SJ0PR03CA0199.namprd03.prod.outlook.com (2603:10b6:a03:2ef::24)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 4 Jul
 2025 11:40:55 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::9d) by SJ0PR03CA0199.outlook.office365.com
 (2603:10b6:a03:2ef::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 11:40:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 11:40:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 06:40:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 06:40:52 -0500
Received: from xhdctallapa40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Jul 2025 06:40:50 -0500
From: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
To: <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
	<m.grzeschik@pengutronix.de>, <Chris.Wulff@biamp.com>, <tiwai@suse.de>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<punnaiah.choudary.kalluri@amd.com>, Srikanth Chary Chennoju
	<srikanth.chary-chennoju@amd.com>
Subject: [PATCH 2/3] usb: gadget: f_sourcesink support for maxburst for bulk transfers
Date: Fri, 4 Jul 2025 17:10:12 +0530
Message-ID: <20250704114013.3396795-3-srikanth.chary-chennoju@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c96c8d2-1bb7-459f-89ae-08ddbaefa26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dXYN71sOZFrkwyhrnPHCJQX0jQ+t9qFdKD9qWG2zTXXTsZGWUJeM582CZq67?=
 =?us-ascii?Q?HyckAYvs20yUCGRkOpBqAT5xGdX4VNwJhEEgX6NLC6yAa+d917lolywF6TY+?=
 =?us-ascii?Q?M4yoxOfTazjI4VB+3/6aEdsnCiTqlEdpSMdRWz2BqwcGF577pWC3rfzdTDzw?=
 =?us-ascii?Q?yg/PypsTxTlEuFc+JUXZgA1vVHfMg7FYRF3pYSS62NwRvdvIl2SxVkrtCSAq?=
 =?us-ascii?Q?Ntk1adbt2xGysTfA3+4oH9LEbzVKQQgZijvYJxKXsCeNCKOAfdDRQl2B1KtJ?=
 =?us-ascii?Q?Rr35aPo9RF9B/L477GmYP2SsG65xFAdzpTHvNmYk/28n0jDV30GD+o+sQAtO?=
 =?us-ascii?Q?kQCyuG2lsvQf8tSPPQuWRowQH+1FLnlZNkgmk+iHk3G4AO2yw+plOQ5Gp0dZ?=
 =?us-ascii?Q?WQObaOrJfff7En3ExvQpy6EB3cRSpm0DCuPp+E1ulEFl4uR6xpV7cCNN0cU9?=
 =?us-ascii?Q?ROZ3FZTkQ/TxnWy/YUwkO89GVy10jPixpdUFe6H7ScDSkE31wzTER21Qc5ag?=
 =?us-ascii?Q?nFyw/gdczKZPs30/IcqG+5/1h/eBGxQ2LDdXSUp7qPz+6bWiAuHc6A+Nc20y?=
 =?us-ascii?Q?1+Fo5kzA4EcvSJ0kzsWpC82f4cikpipToFmtqxczbJwSC/flVBsZCWtzqJ2C?=
 =?us-ascii?Q?BOOPFEpnpE/G9a+p937YcyCnXKpeK3CEJgLeabNAOVnqxWVjrQ3B9FMVwWoh?=
 =?us-ascii?Q?quR53SF/2kXyoHVyyBod/bT8B/Jrby+sUqEsANPOj6bdbVS8G5dy6MmHjNrS?=
 =?us-ascii?Q?+y3DNvoTaDhZi6z17PmxJQPhDGPDvmNl3Eg4s9CFjL+EcRS9NJYwPBY/eEKI?=
 =?us-ascii?Q?rnWAuhSoJcHU54cMm28Pcsh/hvz4sCwKOjS7e26nY5RI9XpI//yCPI3FKA6d?=
 =?us-ascii?Q?oVe7sYPwb7WyzDEFSID8B+9MOAp2s4BDncC5o85o7nz3hJMKohNyjItnoTDE?=
 =?us-ascii?Q?A0aaaVr/R7x3gvvx3HZxqTt89cZQV1itHRMODbxi2EKTud1HX1IpL6cAfkqD?=
 =?us-ascii?Q?1t3AulXkOEaG4mfcp02c5Rzbu8mt7aAPMKofQmG4cw053D5qdB7vaWybERu8?=
 =?us-ascii?Q?2SKSD4fp82cq5gE4ux2pG322qsX1lSnCGxZ9vIsBHpzU8cV/WLl+b+J/m5b/?=
 =?us-ascii?Q?L9xJEd7WiGMkDNryE8rQGGZ9e+DxSatVb1RybUh6AwrGEvw6h9OU1gTzgjEn?=
 =?us-ascii?Q?LUTPKXtOn7kwYWNWQ1O9omnIAD8kKo0QLzjaJAyg+fUXR7Z09RGXc7Uxwg4T?=
 =?us-ascii?Q?x8WEU06WZqq3JSclt2BYapwAKI5Bydzq3OuKuIk2z94aemlPpvfUdPonzVLY?=
 =?us-ascii?Q?IjYnrokCnPjyIzVfM11tDHEzEdysI03reqp7Qvz3sXMrGh0Ux4s+Lp5mcU7u?=
 =?us-ascii?Q?qRUbBDu+pqRoItAM/J/7swEeJ5JZMBmBg/RhPByG0pAfccXJipe9j11oE1BD?=
 =?us-ascii?Q?72Bh9bUqZAJ16BdZ0B74elaEoZe5fy2bZt6tTVKxyCjqsfvNnQIf3VLxZx4y?=
 =?us-ascii?Q?+IrVlTq7Bm9JoWkkZfvf6jNW3dzcUrr/7JXj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 11:40:54.0299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c96c8d2-1bb7-459f-89ae-08ddbaefa26f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802

This patch supports bulk_maxburst. Without this change
we are not able to achieve performance for super speed plus device.
Without this fix, we confirmed through lecroy that it is sending
packets with NumP always equal to 1.

Signed-off-by: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
---
 drivers/usb/gadget/function/f_sourcesink.c | 14 ++++++++++++++
 drivers/usb/gadget/function/g_zero.h       |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index ec5fd25020fd..84f3b3bc7669 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -45,6 +45,7 @@ struct f_sourcesink {
 	unsigned isoc_maxpacket;
 	unsigned isoc_mult;
 	unsigned isoc_maxburst;
+	unsigned bulk_maxburst;
 	unsigned buflen;
 	unsigned bulk_qlen;
 	unsigned iso_qlen;
@@ -328,6 +329,10 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
 	source_sink_intf_alt0.bInterfaceNumber = id;
 	source_sink_intf_alt1.bInterfaceNumber = id;
 
+	/* sanity check the bulk module parameters */
+	if (ss->bulk_maxburst > 15)
+		ss->bulk_maxburst = 15;
+
 	/* allocate bulk endpoints */
 	ss->in_ep = usb_ep_autoconfig(cdev->gadget, &fs_source_desc);
 	if (!ss->in_ep) {
@@ -341,6 +346,14 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
 	if (!ss->out_ep)
 		goto autoconf_fail;
 
+	/*
+	 * Fill in the SS bulk descriptors from the module parameters.
+	 * We assume that the user knows what they are doing and won't
+	 * give parameters that their UDC doesn't support.
+	 */
+	ss_source_comp_desc.bMaxBurst = ss->bulk_maxburst;
+	ss_sink_comp_desc.bMaxBurst = ss->bulk_maxburst;
+
 	/* sanity check the isoc module parameters */
 	if (ss->isoc_interval < 1)
 		ss->isoc_interval = 1;
@@ -852,6 +865,7 @@ static struct usb_function *source_sink_alloc_func(
 	ss->isoc_maxpacket = ss_opts->isoc_maxpacket;
 	ss->isoc_mult = ss_opts->isoc_mult;
 	ss->isoc_maxburst = ss_opts->isoc_maxburst;
+	ss->bulk_maxburst = ss_opts->bulk_maxburst;
 	ss->buflen = ss_opts->bulk_buflen;
 	ss->bulk_qlen = ss_opts->bulk_qlen;
 	ss->iso_qlen = ss_opts->iso_qlen;
diff --git a/drivers/usb/gadget/function/g_zero.h b/drivers/usb/gadget/function/g_zero.h
index 98b8462ad538..3f327e37f398 100644
--- a/drivers/usb/gadget/function/g_zero.h
+++ b/drivers/usb/gadget/function/g_zero.h
@@ -20,6 +20,7 @@ struct usb_zero_options {
 	unsigned isoc_maxpacket;
 	unsigned isoc_mult;
 	unsigned isoc_maxburst;
+	unsigned bulk_maxburst;
 	unsigned bulk_buflen;
 	unsigned qlen;
 	unsigned ss_bulk_qlen;
@@ -33,6 +34,7 @@ struct f_ss_opts {
 	unsigned isoc_maxpacket;
 	unsigned isoc_mult;
 	unsigned isoc_maxburst;
+	unsigned bulk_maxburst;
 	unsigned bulk_buflen;
 	unsigned bulk_qlen;
 	unsigned iso_qlen;
-- 
2.25.1

