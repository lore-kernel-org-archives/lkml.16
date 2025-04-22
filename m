Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA69634EC;
	Tue, 22 Apr 2025 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318588; cv=fail; b=keiYiENWy4g2mHQXaNKeLydGaHUxig61ON4NEtQsQd4RG/VsyTqE2nvX06pFCqCJ/kuCjTwlGAXamNWIwTazvGk/F0upObZKk4qYxBQHRSMUHg8xHohaO08M2srXQwql8Pvxe2TE9w5K66Tq0lPPPwmVUR+3D+nsgjGkka7T6y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318588; c=relaxed/simple;
	bh=4TNpLBW8SsBolkVn8XEBEPZu1Aclfco49YzZy5o844g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E3BWzHuilmeJVlIotWezKvLTklLKgUGu+DvlNHNplo7cIHkCHIEPaxIu+3Cq4ZL9mmHP7HiSS37StPzgkV4vu45nURDQLWZqAvzS4ihX9fMJ0vXOW8pIu65Ik1QH7bAqMe0UjX6DZbdnhY4U8I2lIFR8WWuzZiCZwszKbVNShfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AvZ92MpP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SNFMZYDg; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AvZ92MpP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SNFMZYDg"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M5remm022474;
	Tue, 22 Apr 2025 05:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7xGlM6ct/hi4eDbPoHT0V2nFPDwI6EnxEBPVRtPJePI=; b=
	AvZ92MpPNa4Hm+UvObb1RnM6oBCPw6PomVyS8yyWimvRgJwlyhgBcGbaTltAdPe/
	oYW1SF6R3W3yuvx2ftIeIY0+42qGDjQivmOYH1B06Qbp8CywSZCeXFBQd7my/0Ah
	rAWrJhcbiKEhXz806W+w0PCxuNazIX5dxWD5xkYfXg22Pb9aj3Mrwf+gYBKkGbDN
	H4hs/aBOnXUGnhQxR6zp++2cVjSEKkVRpf9RMMi0JO/K8XRbm5415ZHrWI7k6fLY
	pNM/nvJzwOJbT5uE4XbM+a2EBhQ2ADWzb45eN2gbgyJXef8O6a8O1NgmTRwdZGOY
	KRMfjsucrCff31TJT0GQNw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46488hk9y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 05:42:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLKkTedeyraiGeB7hfqDyCZ0xJ+pf51EgWiONh3AkDXP//0/57c4yfoQpEhAaSBa6c8ENPtOtnnTabLE9Fi7m5XKTtUvIj1GSNQYKiPWVRpRvQy6bMpA3k8FjOPQmxBZbw8/Cv4R/o8jxP5vpuocTTq+u66Cy3PbLXUT8Br+y3DdeqVaG5X4O+k7n0CbmcSVPqu4VMjCY8GE5W+91ZuQ6PqlnP2qUiBycy5+5eukE5bociERDTVzcPx+jtMZFH7do88ILya/U06n8OCjAXbCrtA9UUHCMp+T4Ij4C1nM/BvPACon1ed62HrQZbhBQVUK0U3ltjjIrupkUcKtqzkgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xGlM6ct/hi4eDbPoHT0V2nFPDwI6EnxEBPVRtPJePI=;
 b=APuqQeGfw70x+UqMVZd00yB+71/jgZvDSMHEQPChwNnVq4W2OSfnwJQjLCupowBEPYQIubxEvqAETWcAmfjg9U0mMLgtEdeuGJI2OpNgvtag9PgWEZKrESFTVbFv+fNpOiusCMzTlUgpYw7M0fld1K79FR21Ag8OAblNBNziK6YAXJnmiDWdNMnLfeJoiVNur0Pt+0g9IDrXoObWUId5KaCJzKQ3zkyckpTKefO0Jv/3lXfOTSDnns8erspeOBU54dFmGsjiB+4trTr4p75X3YIISge3SOSse0yup3zjN6ZTiFENSvNLZzJFpZkU3CjNsDRPLGbKXIdVic3OG7qaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xGlM6ct/hi4eDbPoHT0V2nFPDwI6EnxEBPVRtPJePI=;
 b=SNFMZYDgFeWbAT9K+GMCHJIsqZdUyhLwpsfY326AOWOt7MY6V92YvZdfGutjpVsZ/Jt1TZLxVExR8RGVHfCHNj9wU209v0cNH/uUfGEIawJtdcNHG5V9hue+Ax04sos8aCoblfsN99bjTihPZRSy6SclgzmsbtwPZoH+HelWItE=
Received: from BL0PR0102CA0042.prod.exchangelabs.com (2603:10b6:208:25::19) by
 CY8PR19MB7274.namprd19.prod.outlook.com (2603:10b6:930:9a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Tue, 22 Apr 2025 10:42:47 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:25:cafe::9b) by BL0PR0102CA0042.outlook.office365.com
 (2603:10b6:208:25::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 10:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 22 Apr 2025 10:42:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 44483406544;
	Tue, 22 Apr 2025 10:42:45 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2AAB682026B;
	Tue, 22 Apr 2025 10:42:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        sanyog.r.kale@intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/2] soundwire: bus: Simplify sdw_assign_device_num()
Date: Tue, 22 Apr 2025 11:42:44 +0100
Message-Id: <20250422104245.958678-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422104245.958678-1-ckeepax@opensource.cirrus.com>
References: <20250422104245.958678-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|CY8PR19MB7274:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3774cb78-ba5e-46f7-a98e-08dd818a6baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U+Rjb0lWXmSWKgkL+Xq/E+Kue4gPhcGfy1L4FXNr9rmydcCJJN0tK63r8Boa?=
 =?us-ascii?Q?8A2OOZNAAhFbGC+EmoWzEwT5nUKUbLKGJP5U+SeMug0h9KtipAT0Ws3+SbVt?=
 =?us-ascii?Q?4V+wJjI2KpxC4JfL+AikZQ//8xB7261DHP8+uul6EgXH/Yg3QCjsHnFD18Y2?=
 =?us-ascii?Q?eJqnn0eFkQjMrcOJ3YZsTMmkF9ED1++uSiDrJLUIa41/RCcJ/UUfttam88Ax?=
 =?us-ascii?Q?sX2AFH5EJFtaanR121EDTefX0qg860zWnwhnBFjDpk7N2Ionc7nLGXTv6RCj?=
 =?us-ascii?Q?i9ADFdMc0YAnWW/zQVlmdms5v+nWPzvgNR1/DOuDb/MOptuXOOVcFydQuisq?=
 =?us-ascii?Q?gmdw1huJF9I0H1Cv1NkZ+xhMUBNWLZyN3tVMgwaN9NGpx5Ku76GYjJM5yO3x?=
 =?us-ascii?Q?3NjRWRQikXr94m2wsCh0LfI8dhFLqw6ilMR8M9/RJYMnzkekpJUesBZJmE3e?=
 =?us-ascii?Q?NGZsDJEPmDzS2wFmslfj4IcfQ69TkGHLsCqiMcj6ELZsoDnRz4I5euoStWPD?=
 =?us-ascii?Q?fpkheHJB9IDva9Murdw/ZTnUgYlWRiKCue75LPVNLd7pJ9YFJX4NPu3Ccow4?=
 =?us-ascii?Q?9iGj0sr6poc1VUYGLILPJ6jJmVINmuclcCPpz2OPcwIGDjVfDjxvOv+INlKA?=
 =?us-ascii?Q?8NVFdGfBR3ot11pvme31HXevLCss2fb7joxcKXl/BA8/RpiyDVs4wfn5+Pbm?=
 =?us-ascii?Q?lbc1odhCMIVG7ifYvLh31FnrDsR5EkdrkNJk3Psdn+cGlfgk5xJsO5gVZS7s?=
 =?us-ascii?Q?78PSreVkWRzdtRI6W4v3c4lEZLdZbHURZjUZ7CE3a7BKfvTfskJT7wq8ro47?=
 =?us-ascii?Q?TLSUC0ONUDyMvF7ccagECXdXdz5i1LikkPd1VNHycsRi3fLpqCHcgraLn50h?=
 =?us-ascii?Q?JIREQ41uk2EvZdWVf9Jk6TMCALPKjurZ7Ix9eq+3RNSaVGTtpv5/IFXtc2jP?=
 =?us-ascii?Q?RX8l1aPGW5lgqi6zz+RqNLqHNzrXR2AAVuD1jQdRIkMVgU6v59BcY29Ke5Ks?=
 =?us-ascii?Q?3BDNZscKv28cwerUaWdVrA30lpAT64ht9R2L7jpFld1ccbrQdb4fHn7bcGqQ?=
 =?us-ascii?Q?BaBIO/vYfj7Syh2c+fjVH2IhONOp0U229nt1a1lnlJlRiduA/YXJrp5+AAtA?=
 =?us-ascii?Q?GycczfA+EbT2nBxYi+zesxaV5/1IOq08ZYiSkuMfyKLtu2lJgUQtbO9m4CUN?=
 =?us-ascii?Q?vOVAou7vn/VVH33JmbH2zD/8eDSwqh5DlinJaJLAu/JdDyHDTDIa0aDEIPhh?=
 =?us-ascii?Q?GUdGt4VA3v1uKZMip+yf/MHxnr0FNCg4F63D38JZ0DmnadWn88d6TC8iflPP?=
 =?us-ascii?Q?KwL7JVjAmXNZSDeCdwoRNHxeA/oU9E4Btv0+SdYisPJFhX/76Yc9Xd2cYLsW?=
 =?us-ascii?Q?l7pe5NnMg/cOT3E1GpSg9FRb5CEpw9lU8A2B6EyDRBIZ98ZzaPOYvC34ptDH?=
 =?us-ascii?Q?Wtz6dntT1vZedg84V3MVgXAbkBe+2Vzi9RFRrtWdbNmB4+hhcpkO/IXV8hhn?=
 =?us-ascii?Q?zZIYaL0ZHLJTDy+kjnQsAcHsjabYhDejfBGH?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 10:42:46.6549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3774cb78-ba5e-46f7-a98e-08dd818a6baf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7274
X-Proofpoint-ORIG-GUID: sjMCBD6DiCxiZXXJF2wRbguCQ0_tPvNU
X-Proofpoint-GUID: sjMCBD6DiCxiZXXJF2wRbguCQ0_tPvNU
X-Authority-Analysis: v=2.4 cv=K4siHzWI c=1 sm=1 tr=0 ts=680772aa cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=5-9vOy2AT5o0khUoHecA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Simplify the code in sdw_assign_device_num(). Remove the new_device
flag which can be simply handled inline and do a bit less shuffling of
dev_num in and out of various variables. This patch should cause no
functional changes.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 39aecd34c641..3f1d8ff55022 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -751,41 +751,36 @@ static int sdw_get_device_num(struct sdw_slave *slave)
 static int sdw_assign_device_num(struct sdw_slave *slave)
 {
 	struct sdw_bus *bus = slave->bus;
-	int ret, dev_num;
-	bool new_device = false;
+	struct device *dev = bus->dev;
+	int ret;
 
 	/* check first if device number is assigned, if so reuse that */
 	if (!slave->dev_num) {
 		if (!slave->dev_num_sticky) {
+			int dev_num;
+
 			mutex_lock(&slave->bus->bus_lock);
 			dev_num = sdw_get_device_num(slave);
 			mutex_unlock(&slave->bus->bus_lock);
 			if (dev_num < 0) {
-				dev_err(bus->dev, "Get dev_num failed: %d\n",
-					dev_num);
+				dev_err(dev, "Get dev_num failed: %d\n", dev_num);
 				return dev_num;
 			}
-			slave->dev_num = dev_num;
+
 			slave->dev_num_sticky = dev_num;
-			new_device = true;
 		} else {
-			slave->dev_num = slave->dev_num_sticky;
+			dev_dbg(dev, "Slave already registered, reusing dev_num: %d\n",
+				slave->dev_num_sticky);
 		}
 	}
 
-	if (!new_device)
-		dev_dbg(bus->dev,
-			"Slave already registered, reusing dev_num:%d\n",
-			slave->dev_num);
-
 	/* Clear the slave->dev_num to transfer message on device 0 */
-	dev_num = slave->dev_num;
 	slave->dev_num = 0;
 
-	ret = sdw_write_no_pm(slave, SDW_SCP_DEVNUMBER, dev_num);
+	ret = sdw_write_no_pm(slave, SDW_SCP_DEVNUMBER, slave->dev_num_sticky);
 	if (ret < 0) {
-		dev_err(bus->dev, "Program device_num %d failed: %d\n",
-			dev_num, ret);
+		dev_err(dev, "Program device_num %d failed: %d\n",
+			slave->dev_num_sticky, ret);
 		return ret;
 	}
 
@@ -793,7 +788,7 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 	slave->dev_num = slave->dev_num_sticky;
 
 	if (bus->ops && bus->ops->new_peripheral_assigned)
-		bus->ops->new_peripheral_assigned(bus, slave, dev_num);
+		bus->ops->new_peripheral_assigned(bus, slave, slave->dev_num);
 
 	return 0;
 }
-- 
2.39.5

