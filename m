Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60D421ABC2;
	Tue, 29 Apr 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921907; cv=fail; b=VOEpHz6E8F/QWdZFXnknDArQXJybEHZAMPO52K2XbKbO8sq7OGoBoCYGYD39b8RLvtGDSJxAxI7xygiHFxr0Q1sUZZUol9L2AZUhEwYbLPFsR4YChPdYx/9t5zebAA7fCk49+ASdxXKC46IUb8AqdXooFIAgAd1pl0mA9aJo+tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921907; c=relaxed/simple;
	bh=+bUs8cGjfDwWk/q0Lt4Vfn/Whs2dbGPuPPq/WONrkS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=stJb82xSLRt9oD2LXt+OGQrz+g1bodleskaDXUudtisUlbR91iif7ZkClMTLuPJt8tkXR3b3RV0zemt8kojK4gjrOTT2anuN/9QflT+UQ0/LQKA1QbnteD4tAcaJ68OV6euAXAI0JwXYMPoNzp7zyv7hPcnA/b6IIOBqhTPCeUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qgg9fhOK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZjLevTCH; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qgg9fhOK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZjLevTCH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T60TeL012706;
	Tue, 29 Apr 2025 05:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mk6MLPaFktsVX0eC5nKzYtd3n8iYgX9/CRXiUH2VpdY=; b=
	qgg9fhOK0s9x1YgZBx4CwMmALu7Ssw6/BrNzZGtg4GCBO62ESGpKCZfRjDQFbtcO
	hpJkLU5FbeFYV5ayyd+Mc5hH7koRVtY5J5oSiVwQKUVVoy5WNEAOvf2WVQy7WFXT
	pOIWlv/i+30Rozu0eTGoI/tv++8krTBDbirMEmnxATtY9dz1KKTuudPrcnqt0x2F
	8wC6+viGGE3hdMol44+XbSA3R1jydx+0ZbfZu767kkPy+tWP0HzRollWyLUgNoca
	dP3N4DVvN/9FdD65mPg0rrIiNpT608EEohQf7C1mdJmV2VTt/RVRwpLehfNlWnDt
	qjGT1pZsfeeXSVEEkJM4Pg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46ae7cgwbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:18:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJwlqbOFdv5mIwo3fswNexlaqmQt1NfQTdKRpo5WYPGa7zvhSGpZyrnksKIKGQcm/h6k9dTNdZ7PGSp6mDZNS1WF7SH6BqH/YMt09OICHWulC6cyZhj63woFMQBnNqt0T1kK6vdDokbYUMTFTj8RwDGoQzAMvu3BNceXBzaBo+GjaL/KtYr3wEKh+2ruATrEHTnOLNCO+1xh7zs0n09xpOvUxDCGYk2sxhwjLIa5I8rBrh175k5R9c9vrBNIN9aGfc4dOkw1dmbnFo3Vs1NQn+FOyxDay0qF0k86lx2kHXOTHG27BkRqEs+E3fAlRmJJDfvCX1A8Ki7p4+dgqCTJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk6MLPaFktsVX0eC5nKzYtd3n8iYgX9/CRXiUH2VpdY=;
 b=ItohCL5voXd9hSGF+wYZcMv87dJPQ6e+a8y+MFXDt3h8nrOdyWRw2XynczLb5cLxournDbOVohd5gyx5AeU4DhUb2dj/Bpm268bAJuGgDOv+tPKWigRwacE8ckP0hsd1qhZCdokXmX5xYu7b4g0ngwD5srXw+XHQzZ9CUMbcgxxkwGFiSP2LmXJY+JDKbjXw2YHNqp4p0BFWanXcFqFEYk5LSOafUmMSxgfRk/5FC6F5/wRLOrHeoSl+Xuj2u9xDKUgoIHdE5SWGntvOwouNj5il/hLl6J3hruS0VxBxFbqmbIS7UIgNPsORyN6hcohS+sHcBA25CHQqqwLJsirjUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mk6MLPaFktsVX0eC5nKzYtd3n8iYgX9/CRXiUH2VpdY=;
 b=ZjLevTCHL5MOa8NwRZw8eMfL9VKuCk3L9s8pH5CBY34CvdrP4c3anINZzGZyphqBJGmCNsR8opNdsj3Yuh4C8bhtwGmGVNod+Vd8P9ak5TM7okaQ9y3VtljxQ7pkQDmZAqeSVPUPiRoBDxor8A/r1zYik7YOTWh3y9V7lDk4r9w=
Received: from CH0PR08CA0002.namprd08.prod.outlook.com (2603:10b6:610:33::7)
 by IA1PR19MB7710.namprd19.prod.outlook.com (2603:10b6:208:3da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 10:18:12 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:33:cafe::20) by CH0PR08CA0002.outlook.office365.com
 (2603:10b6:610:33::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 10:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.2
 via Frontend Transport; Tue, 29 Apr 2025 10:18:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 27C8C40654A;
	Tue, 29 Apr 2025 10:18:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1461F82026C;
	Tue, 29 Apr 2025 10:18:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/2] soundwire: bus: Add internal slave ID and use for IRQs
Date: Tue, 29 Apr 2025 11:18:08 +0100
Message-Id: <20250429101808.348462-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|IA1PR19MB7710:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 30fdd32b-c507-4130-6d89-08dd870724bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zr2uXekEbWr058OGysSCTjdzk3lin+ZjL2rhsMBfioUjcI2Oy5xMv7f06wQR?=
 =?us-ascii?Q?s6wUXDKOLA6gZyKTQy2QWRk213x40P0kEWgzQMSEt6LcSv42Slxnv8pRK/z3?=
 =?us-ascii?Q?In4DbEa6+kaNvqxUNUWtA6Zxwig8JVGBNZ6KDpgNEVlheqpsIPm6tztM7SQV?=
 =?us-ascii?Q?E3JyaifPNtYf7OsOMgniEaFvUysoIwq+M+ichlu4hKJ+1YOVLbB3eWIBCcQr?=
 =?us-ascii?Q?jfRwWyoA0oquQOXIowhb6vm0wp1/yvTh1H269YjAmXIATqPWqDb/1b93zSVh?=
 =?us-ascii?Q?ZTO54SGw4lPtzKyEFfjjX1KBNRZcHBpz1jEVssdJwImE/BvPy/DQoldULGn9?=
 =?us-ascii?Q?PFSercIiPPP+z3AiNYWsuS/yJFthhalBnGrMkJEfqufdSMDo9QDh+GdDon2N?=
 =?us-ascii?Q?IfiF4C/N3Q8SuEy8GjuDrNqMThfPvmCIt+yfPeTHXmMUgYwNffwIfec7BlNt?=
 =?us-ascii?Q?9j5HM6w5Wiq8eFxn/X/LoS9dwlSeIeLl0PQAq27EEBRPa5u0AfNrnzy/zj6k?=
 =?us-ascii?Q?ChPZ5X2RTPqtJob1M6ZjaQ4YL2gytg6X/K/lpgwA4f92jo5hob5cZZDg9aJQ?=
 =?us-ascii?Q?QZxrnYoLxks1iDdQJm1Sx14q1Mp7jfFO0zr57q1soiSGllTLjWBDRFdAEiai?=
 =?us-ascii?Q?uYAwWjuOyYicFtC3Ns++b6ZPoPI5BZbWGxznyLVnXBJP/G68l8lnKe3KMuxo?=
 =?us-ascii?Q?IM/MsQ2/6zKmcjC1QQu8WgDn9p6elu/Axf3BWiJ975yN5egSTMGZcLDTnqPk?=
 =?us-ascii?Q?T7WQ7VXeJy9i2liH5eYI16IJZevn6VbtWArMhQKYEex5DRazY6dDhiPCAuEj?=
 =?us-ascii?Q?MuvpE42yMcMysNT6HVOH8Wyl+IjtwuqpPMv0SjyXXYZGhed+9rRCSlIYOHrJ?=
 =?us-ascii?Q?G+PwbgnxTf6MJ8Xdw29+01pdL4PK0lq0MYq7EH8DpMijKxBrvztJBfLy4xAc?=
 =?us-ascii?Q?ec35YlB/H4PJgkZxeqfFJck8ZA5qdBLNtp2D26+s1V+tH4pvblqe++aqHudX?=
 =?us-ascii?Q?Aet7RSiSx4AAH37zZotwPM/qeO4olDDpZ0bPYnsb9DZaR9grVk1UQO0wDnVN?=
 =?us-ascii?Q?nc+bzjTChuI1uJ9GND+CiNuvJQL17X4318ZNX+kEx2hOsZdHJ14xZ5c/B6w0?=
 =?us-ascii?Q?PbaMnPsPh/KAzGUFPGmK0kqZ9GzAO2Ac3i7sSPpOXajQkBRKAJ+ctuga66lu?=
 =?us-ascii?Q?DedXcOpD8EmE03nayP0EPtnTkMdKXihVR/KIJtXYZM82wTmFHwy3ls93J/ss?=
 =?us-ascii?Q?sFZrfrQ+5f8tVsjgHjozxvqwBpCOMc+WjKt1wH9085CTjeb8C0X/S8DdzlMo?=
 =?us-ascii?Q?ckB07q5UINxkj3spHrbGbmaq+ge9LmS8djyRCTIY3MV2ExO/oo+GrGlQIaLb?=
 =?us-ascii?Q?RBaJUkWqwnNiAwnmY9VnSoGOHJaztadWceityeTaVqpRwo/rOhdi59OhezN9?=
 =?us-ascii?Q?s1n44fgeEphNXIXlcSskOcebwGiFbOgXj31Y8RHohBNik7mORKKXvfinHLQV?=
 =?us-ascii?Q?40gDlh/RmEZONRS890kkPaKzusoIBJOr6LXZ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 10:18:10.4961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fdd32b-c507-4130-6d89-08dd870724bd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7710
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NiBTYWx0ZWRfX2A4uhHD0Ur6v 5SixiWw7QGt4UVDUUmL+z9c9KD1TcmNjlrtogZGTviUb8GZGaLZ/1WurcIOh/4PgCbJY1Xv6YRt IUNWj8Tr0Fzued14DgsE+5ggANQlwc678/RbbHNGyN4JcDT9+8YO/96WFLShU0KnLc2/OXHnK4A
 Bi+ww5yuwBLq+uh7atkymrR4BwwSjQjw5Rzgf7X3DgkERkzbPFW89MPljgReSvDQaHIN9qP2ewt bLC9JRYRbmNPNZEBWwdjI57jHuGDSE5useUEtIG8xzJTQ0r7Dl+yscH3Dh1lGPpt+akbdem7xJ3 dMD1tv50OAG0IKk04HPe08jha3bfTvSCuf6P30LyhT7wAVAkRjOXkzOc6n85EaFewJq0ZkWrE+c
 2lY3KIiUk0uCIK+xDyyZPMYbTgrh+k3riw9tsY4OQG1JZZ49Czuz9J2o7aqn+goEANU0T2rv
X-Authority-Analysis: v=2.4 cv=DotW+H/+ c=1 sm=1 tr=0 ts=6810a76a cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=XzM-hvV5fgCU1tGGgewA:9 a=0nuxaduDBj0oWwsgcO0V3IwwSFQ=:19 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: OX4hzxtdoKxZZFJzoPl7bc3vQU6W2mmu
X-Proofpoint-ORIG-GUID: OX4hzxtdoKxZZFJzoPl7bc3vQU6W2mmu
X-Proofpoint-Spam-Reason: safe

Currently the SoundWire IRQ code uses the dev_num to create an IRQ
mapping for each slave. However, there is an issue there, the dev_num
is only allocated when the slave enumerates on the bus and enumeration
may happen before or after probe of the slave driver. In the case
enumeration happens after probe of the slave driver then the IRQ
mapping will use dev_num before it is set. This could cause multiple
slaves to use zero as their IRQ mapping.

It is very desirable to have the IRQ mapped before the slave probe
is called, so drivers can do resource allocation in probe as normal. To
solve these issues add an internal ID created for each slave when it is
probed and use that for mapping the IRQ.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Don't reuse the new IDA for the dev_num
 - Expand the number of devices allowed on a bus to 16

 drivers/soundwire/bus.c       |  2 ++
 drivers/soundwire/bus_type.c  | 10 ++++++++++
 drivers/soundwire/irq.c       |  6 +++---
 include/linux/soundwire/sdw.h |  6 ++++++
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 3f1d8ff55022..68db4b67a86f 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -56,6 +56,8 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 		return ret;
 	}
 
+	ida_init(&bus->slave_ida);
+
 	ret = sdw_master_device_add(bus, parent, fwnode);
 	if (ret < 0) {
 		dev_err(parent, "Failed to add master device at link %d\n",
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index e98d5db81b1c..75d6f16efced 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -105,9 +105,17 @@ static int sdw_drv_probe(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = ida_alloc_max(&slave->bus->slave_ida, SDW_FW_MAX_DEVICES, GFP_KERNEL);
+	if (ret < 0) {
+		dev_err(dev, "Failed to allocated ID: %d\n", ret);
+		return ret;
+	}
+	slave->index = ret;
+
 	ret = drv->probe(slave, id);
 	if (ret) {
 		dev_pm_domain_detach(dev, false);
+		ida_free(&slave->bus->slave_ida, slave->index);
 		return ret;
 	}
 
@@ -174,6 +182,8 @@ static int sdw_drv_remove(struct device *dev)
 
 	dev_pm_domain_detach(dev, false);
 
+	ida_free(&slave->bus->slave_ida, slave->index);
+
 	return ret;
 }
 
diff --git a/drivers/soundwire/irq.c b/drivers/soundwire/irq.c
index c237e6d0766b..f18be37efef8 100644
--- a/drivers/soundwire/irq.c
+++ b/drivers/soundwire/irq.c
@@ -31,7 +31,7 @@ int sdw_irq_create(struct sdw_bus *bus,
 {
 	bus->irq_chip.name = dev_name(bus->dev);
 
-	bus->domain = irq_domain_create_linear(fwnode, SDW_MAX_DEVICES,
+	bus->domain = irq_domain_create_linear(fwnode, SDW_FW_MAX_DEVICES,
 					       &sdw_domain_ops, bus);
 	if (!bus->domain) {
 		dev_err(bus->dev, "Failed to add IRQ domain\n");
@@ -50,12 +50,12 @@ static void sdw_irq_dispose_mapping(void *data)
 {
 	struct sdw_slave *slave = data;
 
-	irq_dispose_mapping(irq_find_mapping(slave->bus->domain, slave->dev_num));
+	irq_dispose_mapping(slave->irq);
 }
 
 void sdw_irq_create_mapping(struct sdw_slave *slave)
 {
-	slave->irq = irq_create_mapping(slave->bus->domain, slave->dev_num);
+	slave->irq = irq_create_mapping(slave->bus->domain, slave->index);
 	if (!slave->irq)
 		dev_warn(&slave->dev, "Failed to map IRQ\n");
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 2362f621d94c..0832776262ac 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -8,6 +8,7 @@
 #include <linux/bug.h>
 #include <linux/completion.h>
 #include <linux/device.h>
+#include <linux/idr.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/lockdep_types.h>
@@ -50,6 +51,7 @@ struct sdw_slave;
 
 #define SDW_FRAME_CTRL_BITS		48
 #define SDW_MAX_DEVICES			11
+#define SDW_FW_MAX_DEVICES		16
 
 #define SDW_MAX_PORTS			15
 #define SDW_VALID_PORT_RANGE(n)		((n) < SDW_MAX_PORTS && (n) >= 1)
@@ -630,6 +632,7 @@ struct sdw_slave_ops {
  * struct sdw_slave - SoundWire Slave
  * @id: MIPI device ID
  * @dev: Linux device
+ * @index: internal ID for this slave
  * @irq: IRQ number
  * @status: Status reported by the Slave
  * @bus: Bus handle
@@ -661,6 +664,7 @@ struct sdw_slave_ops {
 struct sdw_slave {
 	struct sdw_slave_id id;
 	struct device dev;
+	int index;
 	int irq;
 	enum sdw_slave_status status;
 	struct sdw_bus *bus;
@@ -968,6 +972,7 @@ struct sdw_stream_runtime {
  * @md: Master device
  * @bus_lock_key: bus lock key associated to @bus_lock
  * @bus_lock: bus lock
+ * @slave_ida: IDA for allocating internal slave IDs
  * @slaves: list of Slaves on this bus
  * @msg_lock_key: message lock key associated to @msg_lock
  * @msg_lock: message lock
@@ -1010,6 +1015,7 @@ struct sdw_bus {
 	struct sdw_master_device *md;
 	struct lock_class_key bus_lock_key;
 	struct mutex bus_lock;
+	struct ida slave_ida;
 	struct list_head slaves;
 	struct lock_class_key msg_lock_key;
 	struct mutex msg_lock;
-- 
2.39.5

