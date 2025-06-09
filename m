Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171125DB15;
	Mon,  9 Jun 2025 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479652; cv=fail; b=Jxxpana4JB1SN4oaJn6VJu76Lihn8t0sMvWfJvYSOq6cKJViICyG/9Gf2KKuUlIOCq7yE4iVLHf/JNOkAHM12BKHyTUihjD35K7m+ovRdoyR6GkaVyYngHdr2tG/Sjm1BZDF1jQFsw9rRm7ahUMSf2wvao5fC1cArliQrPyAgP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479652; c=relaxed/simple;
	bh=S+WFiwZc4N6SXTBJWY8d2DlXN0/QKChVu7fZ0y8GtrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nWFi8ZDweRjoGqmeCSMKvbWtuz9UhyDzEKFwKe0DOERXXbrdYncfBQukSn4Xqwb7utTpZ1NGd32IdFO2N/cnEdpG9lxPfOMKcwOBfmsdwyj+JQ5LbwAeOKINaUKNc7AsNWE3BGr7Vh2V/rsPDbCB9zbiTXKi7Zd4R2AnfUuB9TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mAD3UZxF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aNzcEKJH; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mAD3UZxF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="aNzcEKJH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BRjR5023174;
	Mon, 9 Jun 2025 09:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zV88FLFTRXv0tsXve5zvhby2Z50O1BF9sdyZp2CvPm0=; b=
	mAD3UZxFvfuMyxw+miARcq2Pe51a+A0QRTi3CIqHOPpLnGKK3YxoAMEcP7tfxGSm
	fdxjLPs7UHewseJbrrMVqoOWu0hdkvRio2TgCcCaCzibdWfqzgnazLm1pdCEWvYb
	RZZnX6f8MdMPjsK/DdhIRShSvgTIMNXsvuELVi8WqwWHlFynKArNPIGGRt99bHSw
	UbvpItjGNc5iRLLgxJ7zhiru/yJQHG3KO1wS1q3GOOcIjFTl71EnH1Hx3zQUEPP4
	Ozd1LD/tRwcOH6HN+yTPoo+Ca1excx/TSk1NmZnm6etP0lS9KSXVtdmLFdiJmGrR
	C8HqEglkwqG7hqY9BsEtZg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12hn2205.outbound.protection.outlook.com [52.100.165.205])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v1jra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 09:33:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ar16aqe/E/ec8jg3sXwdTW3f29O2hGAuFiLUnPMuq0q80NTFLuJ7+UGE+EB2Nd3QGDP1c5IwwXpUONXT71vE7MS6ljTl86G0T4rgmrF9BhA9jqOdGtusXnM1QtSkMIdn5iefZKoEBOexrXsN1ff45L+ev6dbcGrtHPTduNq/swSg3ldOu/oRyZRQCBAYMhmFgAfm1PtEkms/lYEOc53nSFCf6NjJhUa0/elzUSZXw0ykU1h7ZoaHISC0/T5TadkQRFkw5LRfn8r8KAVYN/6fgLjOokKqyxQ64KJ0IbvsgeHaBWj77aoQ1qkR5gdSpuyKs1zPEAK4USkk+Wz1mxJJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV88FLFTRXv0tsXve5zvhby2Z50O1BF9sdyZp2CvPm0=;
 b=mhiCOep/bDmM6rhwfSU7a1NYZz2PqAoc3pS04K/ETq5a86qDjJiMkctooRd7wE11qggiJz40ThSSp/A2oCJlHKi0LmOHq3Df2w10CBr1eZ7XcN03TIAFUP6uYcJ//1ynGAntXxvOqJSKz/GvHpom1R0YsmImeVI/tu+Ur1MMonYzenPcaWxowVjKrSvEnYiOwPbFIpT0rbMRc71Fg/R6zuNnrRTh7zuVCNZhlpBhPt2KNiRN9zAksRPK1OT4BddRY3BeXTt2bFgEjxC5gIIYb2yfZfYdoyvgV5cNbF+P6FQavo+NdggLQps74l0lfva2JkTc6rNgUwj9ibQhKOj/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV88FLFTRXv0tsXve5zvhby2Z50O1BF9sdyZp2CvPm0=;
 b=aNzcEKJHIgeeeK1IxfoVBgHl4fAkyLiGK98hEA7fewwA6uCcsgpnLPEMNVNIzPzvZreIfPvRN+UkvQQJSsv1+zqYeI2imoHWWMV5Ffwl2qHlNrK2YKDO1akHR+oSTB8/GiuWXvZsUjOVoa5werG5DNFBjLtqSbZFMRtckQlPSNY=
Received: from CH2PR18CA0054.namprd18.prod.outlook.com (2603:10b6:610:55::34)
 by IA0PR19MB8075.namprd19.prod.outlook.com (2603:10b6:208:48b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.14; Mon, 9 Jun
 2025 14:33:48 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::f) by CH2PR18CA0054.outlook.office365.com
 (2603:10b6:610:55::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 9 Jun 2025 14:33:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 14:33:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A4F7A406545;
	Mon,  9 Jun 2025 14:33:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8549D820259;
	Mon,  9 Jun 2025 14:33:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] soundwire: Move handle_nested_irq outside of sdw_dev_lock
Date: Mon,  9 Jun 2025 15:30:40 +0100
Message-Id: <20250609143041.495049-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609143041.495049-1-ckeepax@opensource.cirrus.com>
References: <20250609143041.495049-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|IA0PR19MB8075:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a5428dc9-e127-41ac-f058-08dda762a590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|34020700016|36860700013|376014|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?udFSRtyE2VdYCrkQ1ZNiLipwMlob/5iw4rhYKr7IiIc/gR9K6pcbM0JRBN9A?=
 =?us-ascii?Q?t8rpWmv6mzInbL62sX2F+XspHvSE3z8g1hKwZIXNRcXzNMnly+hfS/PyWtUI?=
 =?us-ascii?Q?Y1IJuGm/7fsdgWvZBvJx+ZpasduFmVWRzw4XaKFmD3AUduMt/dI8mFgrGuQ+?=
 =?us-ascii?Q?vD+VGIDdgVGxnmt3+SzQwvl+7gH+8a0p2fr1dXL6LQnApzvD8lbEGg4ROqPz?=
 =?us-ascii?Q?T8RTy2GViuDiIhyU40JP1jf1r0/ukDblkasmshSr1V9fRlXs4NhMSlMWzOim?=
 =?us-ascii?Q?xU9Fmjk/CvCydyjrG4fhnLeKk0TY75x1alga1BngP/+KSWUYTOkDEFMG6BjN?=
 =?us-ascii?Q?24VdcdswIZ2w6hl2YsaE+sPhO0PFQDBn8C87+UT4J/WPJmi0EgJ7vTP88acX?=
 =?us-ascii?Q?Q6fgSzwWca8lCRuD+nzG0vnJzrflOnAXUOKrid88op3FyBmOdo6Gd5GLvSwj?=
 =?us-ascii?Q?VM+p4YFu9BF3jI1zVNH2VHMQetqgS+YT8VPkTaYC+X+MXv49MMojOwWPQatf?=
 =?us-ascii?Q?hgFKNKoJYP6i77a5rBUm6ABIs+k6f8g2ajcro9e6ubRi15X4np8moYNlCxll?=
 =?us-ascii?Q?th95S4hMOiZHvg/lQVMbNSWIWHS2YtSNnblQMQyg4cxFNu3NHSFRB+ipEwqw?=
 =?us-ascii?Q?AvvuyqtAhyUPY3uMkZxSAesEkMTQbur7JAU9ELSWZKfRqJKB/iZVco6NIATB?=
 =?us-ascii?Q?0akVCzsdv+YW0rZWIAIzgKQ5zC9NJ7sYQChvFz8T318nO5BK3SGceMEFEM7X?=
 =?us-ascii?Q?o4e5b5uqj0aIZshwZBPpb9/+Z4JX+Jn5/F4resANgd5rdB3qV+uBMEgElM1D?=
 =?us-ascii?Q?hbTcQs4NLHqDk952pwQThgbrItiv9TAwvH6ax1LpbN9rBEfcxd26Y6q5XPPW?=
 =?us-ascii?Q?b9eCH9ofs0ju9yNaRglftxcOq72OoxSW7ZqIqvvxLLC5w6Sb2Vfyt48RXIaq?=
 =?us-ascii?Q?8meYyV/ScBw1hbO32S4QwI+8xzJawVPxXqvUc4nVsu1icbaSHClWnApHxqSs?=
 =?us-ascii?Q?s2pU2mpBTXQR+L+sHqf8cda84YHG6MrxCRybN59R7dWvEi9B91HQPmOfR2K5?=
 =?us-ascii?Q?hD/NLrcqzPw+fhg7EiRZeSVo/Hcj88pNKh/2tOQn93L4ccWNJFxMEIA+2qK8?=
 =?us-ascii?Q?Om8fF7Y4nJDwFfCVc3aNlnI2cUlS8qR0V38h3fRBqhvhpiktB+gMaUADLlYC?=
 =?us-ascii?Q?O27iaI+EamkLt/JUc1Ekzy7sN6Xgd0LSmkffzPWInLWDrKILk8RzRy/FUv4L?=
 =?us-ascii?Q?l/d7Bg5cQpxccLWdhhb/ysAFntjyhc/1B5/9OVs6gSYdWvJ7swmf7ZN9criL?=
 =?us-ascii?Q?QnUZ5Ap/Y2n9v5gNerL/9Bp7ymDiyrWJWDv4hiy8HoonL1QOhIFMwT9udI+4?=
 =?us-ascii?Q?rb7I53eTAKjJnNqidZHKNTQK/7UebsZrKs1TkATdX6W7MoU3llMLfcbXNe+3?=
 =?us-ascii?Q?XUoA47vAHKjq4IpFhqFAlWsePl3Ccq0FCwkegZEh05RoXTHEYLdxC93caNcJ?=
 =?us-ascii?Q?HPiBX5vzZrCCDcqOLqlWoU9f5IpHbtI8ICG8?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(34020700016)(36860700013)(376014)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:33:48.0173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5428dc9-e127-41ac-f058-08dda762a590
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB8075
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6846f0d7 cx=c_pps a=g6O1Ap9VmrRh8OHv0Sc4DA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=w53meyi4tCFG7f2_AfMA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNiBTYWx0ZWRfX5pUA0NWY5zGE F+O1/w4KsXqjPRIvUZf5UbITTlhpEz1x8QmMOQ0gaD2V5GtpKW+oiZ9UTdy/JS+/wwsanTSLtqv PfZczikkvk7/uwCQcEAo3ZYj4GpDSW50N8MiZoKV8FVHFRWAcjIqn+2XEjWsKIXHDMChRzy4sSz
 vuTFW2hXxjmewQwLI0GA/PKFShmFSuxXGV1Z0sN36VQhOreZ1EshKyQJ90xoLbYigcCnVHDvL8C wvwJdzIBJoN6XEaL/J4C2rnbyJSbXFOCt+DEi/a/4/RwVGp64XqwAYVaizF9DGhFGEUmIvTAAxV GeaM5Pgo4vefkwyjn/16Cr+zUHrPrIGjCyEOUF6pzRsGU0e3f2n03E1/MDRjNMetOurDt2ljfGh
 yTNZvz+eGo9dvjmrMXTHGJb2ESi8iffwlc8gnn/JRPM/rXTjDTgS59htzCYhW9OXe31ytcrW
X-Proofpoint-ORIG-GUID: QxUKcMN3amnkeI2L6Fsgc4GG9wKWNCiT
X-Proofpoint-GUID: QxUKcMN3amnkeI2L6Fsgc4GG9wKWNCiT
X-Proofpoint-Spam-Reason: safe

The sdw_dev_lock protects the SoundWire driver callbacks against
the probed flag, which is used to skip the callbacks if the
driver gets removed. For more information see commit bd29c00edd0a
("soundwire: revisit driver bind/unbind and callbacks").

However, this lock is a frequent source of mutex inversions.
Many audio operations eventually hit the hardware resulting in a
SoundWire callback, this means that typically the driver has the
locking order ALSA/ASoC locks -> sdw_dev_lock. Conversely, the IRQ
comes in directly from the SoundWire hardware, but then will often
want to access ALSA/ASoC, such as updating something in DAPM or
an ALSA control. This gives the other lock order sdw_dev_lock ->
ALSA/ASoC locks.

When the IRQ handling was initially added to SoundWire this was
through a callback mechanism. As such it required being covered by
the lock because the callbacks are part of the sdw_driver structure
and are thus present regardless of if the driver is currently
probed.

Since then a newer mechanism using the IRQ framework has been
added, which is currently covered by the same lock but this isn't
actually required. Handlers for the IRQ framework are registered in
probe and should by released during remove, thus the IRQ framework
will have already unbound the IRQ before the slave driver is
removed. Avoid the aforementioned mutex inversion by moving the
handle_nested_irq call outside of the sdw_dev_lock.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 68db4b67a86ff..4fd5cac799c54 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1753,15 +1753,15 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 
 		/* Update the Slave driver */
 		if (slave_notify) {
+			if (slave->prop.use_domain_irq && slave->irq)
+				handle_nested_irq(slave->irq);
+
 			mutex_lock(&slave->sdw_dev_lock);
 
 			if (slave->probed) {
 				struct device *dev = &slave->dev;
 				struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
 
-				if (slave->prop.use_domain_irq && slave->irq)
-					handle_nested_irq(slave->irq);
-
 				if (drv->ops && drv->ops->interrupt_callback) {
 					slave_intr.sdca_cascade = sdca_cascade;
 					slave_intr.control_port = clear;
-- 
2.39.5

