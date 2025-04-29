Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D613721D5BF;
	Tue, 29 Apr 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921907; cv=fail; b=f6vI4zQbKpg6qbJlwsQYNgTZq7UNlnCOpOAISARNG243pyd1NLnpaX4ifpooYPTLnlU0BCD4oGWI6DM07/AsKrLlGFvipAHd9bUzI4Rx9DAteyYo5XY04VLPjlywGPGuy8tMGXORFOXYF/R57jXPkob+65owNT6w9bOP8qe4nFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921907; c=relaxed/simple;
	bh=XgfagJKgX7lzdO+5QYxqQRdx3d1/1naG3Y2wDmQDUpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mr2HttJ8ic5gh+hSXd4XfcfwMq/g7LANRxF59RXAJhFC+S3mduy3oF458+f59Mubbmka3li8fVYbY3jA0WZ1uaQJXd0BBUkImAbyN4GUFP40KANy67QO1c0tJZbe6WNYoqU+jNzkFxXnbwsMpHl/gYKR2s5q8QQ51qLEB5PLmEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GIZbgUdO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jirah6Rs; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GIZbgUdO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jirah6Rs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T5mCe9027191;
	Tue, 29 Apr 2025 05:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cf2scKqjc0DHwH7f+pbQP7FRnUj5JydpifcgEChW8Bw=; b=
	GIZbgUdOc/RUOdEe6kgIpmmQZs5juuvlh6ACCHJVHziiz8VVHhYuS9Wl7XG2HjUa
	GUu3mkEqb2bRJF62Ad+UmlXT43WUTZLd+6RYydR1wEgabZpHwbEzvWPVU47EfIPP
	t3cbqt3+vN49/K0cgFpS93Axfl3rU/Xk/OYuTwPaRQ6j5WY46Kigjezn0G+2i6z1
	XkFsHVEzo2xisEvVetuyk0Mr/rZTSz3U+c79fQdsG70rDEGxu3tZ0yvl5n9FTbA7
	xRJsrafkjtQttKDWG7HmbEpUhekNayXeok7pnrwvHylyEoM0Vs3fYxD7n9La4o4V
	11RJcVYBPqxmF7KAqD6moA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46ae7cgwbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:18:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOQxHMxiMqHBxbB7EGQKJPjWO4VYzoAmviG0vQlpffRSGzeDEMibO2JjAS8IdwAl2rYAwXQqYPervkvWCde58nRzxxWEcXAVBubGWab/GFWQcqYfjKMi8kxSUAOZT29ZcrnsfuOuM44bVQ9wQSHk1JRRxNq8DGRTNjtkaRJO21opEHm7X83tc+NTw3+OluR/rDRRmyLjT93DxEsItuB4gg29Wxkolf6Vwbs/emkazjXiotfC9LR08xJQxdAxVoab+NN2TXCLQpj9k+N0D4C/5MNPYQqY965NU1ESdkB9Mc7JQjQH56KwEHY5vWzJuk1KgfdXyraZEFu6GFCqf4ZiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cf2scKqjc0DHwH7f+pbQP7FRnUj5JydpifcgEChW8Bw=;
 b=MHN3lOFuIHcS2jJBOpF+yY3GNj7jrnZCVeKjmaWpjOo50aDQRODbpo0CFyiSjlnKoE7aXeJGA2AbND71fvj+mu4SfUrdttwI3t23FuGWAKJBdwqaeT9e5dScgK2diwhcFY/PcZzRaBrY6H9XNko0bTNlxwXHiFWOwsZe1vNvPu4bgUuczTGm2YlVR/YXY5LOkO99/mbuGlEVv5UMdFqB/RthAmbqTx1Un1mEhqS9EgQk3QJU+qMdPxrvPv0eq3YsCFHN4OI27AWiIqhdbBI8e1OV8s9cKCVC+tl6BvykuInEnnBXoTIxWGBh3RQWNBGikJfJRt8fZWIopqsscdjh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf2scKqjc0DHwH7f+pbQP7FRnUj5JydpifcgEChW8Bw=;
 b=jirah6RstwWA5WODcrehTPEi5YLqhtScRL0oKKpY/s+tqeUFYBt3fvAUZ4xY4U+re1aXctK1An3I6PVBr7oTv/9CfL4RaMWXSmHOoxTH90LgKpkFZWzlsM0Xk8AOUNJ6oC+aK27JIy0ev931YV9MAkKv+j/WBqJ9ofDN8IEBrrU=
Received: from CH5PR05CA0019.namprd05.prod.outlook.com (2603:10b6:610:1f0::27)
 by CH3PR19MB8405.namprd19.prod.outlook.com (2603:10b6:610:1ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 10:18:10 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::48) by CH5PR05CA0019.outlook.office365.com
 (2603:10b6:610:1f0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 10:18:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Tue, 29 Apr 2025 10:18:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 18074406545;
	Tue, 29 Apr 2025 10:18:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 06B0A82026B;
	Tue, 29 Apr 2025 10:18:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] soundwire: bus: Simplify sdw_assign_device_num()
Date: Tue, 29 Apr 2025 11:18:07 +0100
Message-Id: <20250429101808.348462-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429101808.348462-1-ckeepax@opensource.cirrus.com>
References: <20250429101808.348462-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|CH3PR19MB8405:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5c227a9e-393a-4543-a3c1-08dd8707249b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nd/ajGmE9yChMJIdoUUe9krw52M5GerAIIRTs+tNb6FgMEmbzkpcwpbwsi/S?=
 =?us-ascii?Q?PljeW8JA3P4IossSNTmPRrviqTSrOOg1oycpKagp95cfVwbjZLi1sHMwJUuX?=
 =?us-ascii?Q?+qzTb1vx3EmjctXXoOHuGFZ7UyJqDzhReWYmh/MtlF3wwLCOZxiR/+uMcGav?=
 =?us-ascii?Q?nFwYcNynMzB8ZCimJm45IvH2yG0wlTKrIH5clYarLCNXwJ6TrAfGhfnttbLP?=
 =?us-ascii?Q?CteskaQmvSxe8EM49KzEyikxDnW/hL5FFT9+b0FkZIms54jWz5RjuC+2TrIC?=
 =?us-ascii?Q?698qGGAnt94r/6UhOmg9bcPfsdHi+LVQ2K4OtsLOp3w55vMgHKi6UUlq8Ig7?=
 =?us-ascii?Q?eJHDIwDs6fIV7m6TQSaiA/Ln0gV9+f84ydmNhJf8dsU5qIFYiIrxjUIVESUq?=
 =?us-ascii?Q?df4v6qQAkZyWzzcytJFJ4e6zblFWz87Sn+GJR+fXowHBZpwXmw1t+OGUd0e4?=
 =?us-ascii?Q?ixvslNnUIcFXkJ6wRbQc7ExKuXoG2AafHjaVKcbZER+3aNCJaECByfA3xHd2?=
 =?us-ascii?Q?XsYm9D8+dHa5rrhVJrjL1tiqNyudh1/QyHFhe5Iv69dRvH2vx+BDBjFO03ed?=
 =?us-ascii?Q?4eMdXdaAOqX9Iti67S5LY+jJvZ3MsgwV0bKM1UHgX8cjzPnt23Ybx9Hru0fY?=
 =?us-ascii?Q?8Ow+qXSsobxUAryn4KcLNELKtadL+Lb7Qb7HqIUZqWgbCezhx1xk7YV2F0/f?=
 =?us-ascii?Q?zc+XgvZ44wSwvkA5mw5j+HXwvL9LsOsndlSWNy3KUZ0ZrMQD3crmOAVs4ox/?=
 =?us-ascii?Q?2GeKC5RPxMUMDGCWqmJ9Jj7/CiJWO2fE/Th2SGh+Ys6W4j9uZ/tzcNJH6Ods?=
 =?us-ascii?Q?ZB/zyI5I1g1irlKrbqD8LBX8wKnOATvc+pzgIlpF1cFKlnUeY5NuwFzxyTZ9?=
 =?us-ascii?Q?r/Att8BekLwYxlympyX/8EpOgx9E+Azw4KdG/+1l1q4iB3cgjAcqDw5a7UwV?=
 =?us-ascii?Q?WLONLOmiVle9A7USnLkR39Rn/pV7g9JioSFsh37W1PKxW0WrszvSy2MSMDOk?=
 =?us-ascii?Q?RSaRKQzj50FcddAH+BottflCxDma/apesmjkXcDoKGeaLYLiH8Thd41QllDN?=
 =?us-ascii?Q?UjLJgr3rJeZKXXtVGCVCykQ8/y+m37V+EeEnxaOEW4lwztKMugZ5/XHaqXcy?=
 =?us-ascii?Q?OI/fFBuWsCw7257yIjmT3QrVaBXnZ0ps/3p8b1IQviFYX3VoORCuLnKSArE6?=
 =?us-ascii?Q?PlZRvwmRpI0Vm61Qj34NOSgNRgoAArh/YFSbKaI4kaBozLByEUsvgx54QjHC?=
 =?us-ascii?Q?0ZvKpJUY6WCTHz7Nh9LwGkBNCkDy5sdSx67KyxYLsI+1vL6ZTIUpGWWLUTDJ?=
 =?us-ascii?Q?t2gxDLxmN8KXzrc9B50ZkbZ0Xy3/BZZ+n91HgEhf5vfIQrTy/ZAnMKW2YtZu?=
 =?us-ascii?Q?NQyUGxPGAiQWxiipSNUymfG/1PjcnlG/zELRDLT4ZRU5VqdauHnHB1oiPCUb?=
 =?us-ascii?Q?iCn+SJkAQSEZ4F6bMUE1lgsrSSYjfbXm2ctgjU8Lor6wByGTtEjFrjaf+hnY?=
 =?us-ascii?Q?zqahOLXVimD1fdreJekw8SSic7mo+OpbnmS5?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 10:18:10.2737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c227a9e-393a-4543-a3c1-08dd8707249b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8405
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NiBTYWx0ZWRfXxSFZshXkS/By /S22INXSlBPJO+UV+LfA061rZUYbjEW/2aa26qDMJ2RNPAo4v4YIzyiXk3YBrKAs5hyABDnyCDJ C1a9P3ul1l6hXizpyD9X9X147ioo+l3ky3/0QW30vp9KT4vhycHZfJyj9gUErYE9CZG9/wFQMwu
 HwzeADDmhGJa9imp6Ay7fJPinrzhyeJ5K1tlj6Y8K2GFrZSpjUKXjoow9QrgBWG2YoWwfslXMnV Y5auuLFFwc5JFveLC0Tc7eYi5shWkikWAuGIxa2mm2+NQ3q2ATSaL0uo3YayHR2q+qYbYo+Ntga T8ObGWTEel/WyJ3GuXiWOtihnEbwKujEO9kNt+M2ynVB3kwE2nKsSynACMjhOqQZE5kvcbpXLII
 t83BV61aZdkCf2JVJzRZ+yOFXjtQSthFq4JBzAFE5kv9rdMDF+lhMxQjna46JdtUaw5FafO4
X-Authority-Analysis: v=2.4 cv=DotW+H/+ c=1 sm=1 tr=0 ts=6810a768 cx=c_pps a=p6j+uggflNHdUAyuNTtjyw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=5-9vOy2AT5o0khUoHecA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: gg2HJ67_I7nVomQf0ywKvfB6ZR16HEfg
X-Proofpoint-ORIG-GUID: gg2HJ67_I7nVomQf0ywKvfB6ZR16HEfg
X-Proofpoint-Spam-Reason: safe

Simplify the code in sdw_assign_device_num(). Remove the new_device
flag which can be simply handled inline and do a bit less shuffling of
dev_num in and out of various variables. This patch should cause no
functional changes.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

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

