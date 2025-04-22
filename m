Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE22033993;
	Tue, 22 Apr 2025 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318601; cv=fail; b=Yv9R2DFJrhtFg5UQQQzw8+ZLlySKXgwdr2PCQO0RtkNwxgzkSgPT/D6k+wCBtQhI8ynUIKuQIpSWgJu1xf92pEhJiiLZyzQ0dFyZKH1zYBOVISKaZfbP99TCbUKTK5TpYUoxjHjauS2liHDdQIiF7w/mhfRcq6rpxpBNCAIB7/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318601; c=relaxed/simple;
	bh=pqkS5jotktlbhpXYFlsVjJWFJTdg8pjbwBcTyI3WZ5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3spIfVzNY26yaF9Jg+y0j4RMpO09OCbMDMF9W3k5t0vQ8DmjuuYfkgOLCJEl7pa5VICmR8gS3AddkXpi4eysl1hHI5lany+b12t2uRvCsQ2RosFqmzz51DF6bjcDlVd3NcqpbwzunAJE1+KFgxfgCZJpm/RN52hHFQxSzdjNcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RW/ajgn3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lcxxx0HQ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RW/ajgn3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lcxxx0HQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M5aPg3030947;
	Tue, 22 Apr 2025 05:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xsJVn05P3CusSB0oPqAEj+gyValIjctqiazImIHVa7Y=; b=
	RW/ajgn3zpPtX1qCu+qWYmt4bvmhBgzQJaeyn0ZkM0etaX9xzz5J1xnA/3lMKdTZ
	o8rw/P9w7GXy1UaxQSewBJTU5VnXIRTFnguV8tZkLy6ZKrrNb0Kjak1AjlKdWRca
	igGTzjj1MMabyNTBEKJbEbjsYe6GD+6LsWBVGkSwMn6lY7JIBlgTQiTPRE0+tKRQ
	lSTPCmSYTeyKxQa2bMEf+jHbrvf9alSQA+6171rDoIOdg98LZobTL0jjC7TXWFFg
	2CFcKl6b/jrYbbzwuMC6EA10gC1uScbVAYgUaWizKXgJICus6zJQ+N+Wd/XKmO9p
	R49h50dnp4f3G3ZHNen7lA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4655gft3xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 05:42:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDG52LLvM7tzjv6TDnl0jgIu20I2CGi9tN9mx45/OQPGi208gz3OP0NBGpDIdzvJB84R/zOvwmyqkOV7vg53/8sNkmMXGCT8b3Ql3xeBmE2KlPsAX35cjcIX90qhB511fVu7xz444iSroQ2xoaYtSzDQ0sONdO6BKVy/pZGvmT9fSOJ1C1tqMfYU3BjFLTHXySpS44cr4D4VFo414e4EEfRZcI3BfzWs2Dy4dEgkNrpr7OsuH7Z7S5D2kWCmAh6HzTZyp8EO/jvZv1i7t8ctbA9K9RZ9cmraRYjwAriRkkhP0JDsUJPQ0thDv2Yj1jBod9n2Fk6DxX7bIwZg7/h8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsJVn05P3CusSB0oPqAEj+gyValIjctqiazImIHVa7Y=;
 b=jA+i8ZFocdLiQi32d7geuPQGU/kmyxLxrHE610/XoiqEWc1jxNvoxGsqUbnVDMsjArF/jCGXBuCPu6uwqRFUNsDw0Vv4kkgG3LQWLCdgS2yQsfkjkUu5fkY/RHot0lKSWIzHLGkIXKx24GX+qujHPeK7ok1XTkCnQ8ONbOL0N33DBnMTW6ptkXvWwfkquBSHsKs40Q+KOViEetXcGADX20wumFCiHVJyet5B7ZqDUu7Maz9fDP9WcQGGFdBUAcGHq02y7xv6nQHU8blGqgq7c1D2FO21Pt+txP8qqUYhyDqe916UQ307N7fhhZoIVRPweqQsH/zqbTgMRunoF2KmjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsJVn05P3CusSB0oPqAEj+gyValIjctqiazImIHVa7Y=;
 b=lcxxx0HQk7Jiqt+mPK/qm+hbiM3lHANjThRBgKDD7Owh+NetC8Pm1YW4WO4NJ/jBJRoIWqLpM9GYQldglH75F0KeNKCP95QNHHs9hSvVUCkoGwxVIfFtMV5ts2AwE14plqxFHCSt3RMCUHpBWW1fk1nDu+gletIyn/xvLyy2rAI=
Received: from BL1PR13CA0116.namprd13.prod.outlook.com (2603:10b6:208:2b9::31)
 by LV3PR19MB8420.namprd19.prod.outlook.com (2603:10b6:408:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 10:42:48 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::d2) by BL1PR13CA0116.outlook.office365.com
 (2603:10b6:208:2b9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Tue,
 22 Apr 2025 10:42:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 22 Apr 2025 10:42:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4B845406547;
	Tue, 22 Apr 2025 10:42:45 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 38D9882026C;
	Tue, 22 Apr 2025 10:42:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        sanyog.r.kale@intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/2] soundwire: bus: Add internal slave ID and use for IRQs
Date: Tue, 22 Apr 2025 11:42:45 +0100
Message-Id: <20250422104245.958678-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|LV3PR19MB8420:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4b0d67fe-6ed8-4519-2eb1-08dd818a6b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K1v8BNcb5ortjZzR3JJ0ST26poAAp4SNRiEb4FyJx9rFktLdst7/gvtkgvIr?=
 =?us-ascii?Q?PbaRFdniamQgvfsNdnWujJuDbkzZ4z6S6YGIh9VG1vhcKdYtY3GfKfH/66vg?=
 =?us-ascii?Q?ANKJC1QU7OxhDLU02shI73oasU/t3dRVodDvqCEEolaZvaRydLn8brv0FPNs?=
 =?us-ascii?Q?dXspcCBLD3VTaX/YUn6CdPxB9dxEznLeYyKDM55FpkKj9sUukhsnkaySRhw4?=
 =?us-ascii?Q?VuvMw5Kzk6q3u7gdWmIlNXE1y2zx2R1WwfC9azOs8fxtN7hoT8dsZzNdvG8X?=
 =?us-ascii?Q?ydGOJ2zqdfkUN19XcyiBb10ZJ05Oo1eVlba0hxuOjX011jGl1vmrO7d3lyLJ?=
 =?us-ascii?Q?Z9fiKL4CzU1lIb/tPdRS/Rhmjpcj9n9GdZQbel7sSIr7R0Gmqyuk2WtKvQfK?=
 =?us-ascii?Q?a5Dai9e8jb7RI3cictK+ZV+LQwbppY1ku4GRPq8KLMhncJwny/jFwwW0lZLk?=
 =?us-ascii?Q?TNcha2PqThcgjf7o8sNob2CqmBVCaYKBgY0IUcm+z/tIScZ+lBUF+rehyVHT?=
 =?us-ascii?Q?n4Lb8EUduWmcaCZZw+cKVbwC8h4y8E0s3dKPMW0KVO0Pzg5hzxG+yOsfRw28?=
 =?us-ascii?Q?FX5HejeRj4ExPPZaOtClgDncK6m5TT/TkbPlK/jONrjX8Df0tRSGZAPPXo31?=
 =?us-ascii?Q?8/7SFaP6o4l6YQ5r44EIjhu26P6hS6JUKWZDSR8vE4kDAPbWzG8Ah++gwC+m?=
 =?us-ascii?Q?XX25sJJiiIGpbrT929D2u+NucWgFQX/32lmamkdfTCHYg9ku6thNiwLDfR3o?=
 =?us-ascii?Q?xq8Myi+CQrOk9W6BfOr5a3oVIof9lUi/XD8h6EPzSEoL2fzVhgrkEDCjqBNa?=
 =?us-ascii?Q?lPj/QnVswZDlugCpFBIVZ3d8XJ4MDpHyiDhOiPxPVeiF66TsQ/mgWjZ189+P?=
 =?us-ascii?Q?xvwzYqQz/7jQMBmtIGreFxP9W9Ek/o6F8RcJTzmjgi/ApA/f8CB+dspCn6Ga?=
 =?us-ascii?Q?BvUJpzIjPnNxa91ZZIzn2Ao3kbkZS22psjaPBr7JtjDTgcHYvhzjZyUdSThR?=
 =?us-ascii?Q?mSs9r4Abov4FkPMhd4+P+Akof8zpwol6YS/1HYfPsrttO/8snJbpkG95y4CM?=
 =?us-ascii?Q?FoOGhQtUkzb3h+Ewx60lwhsEKM2roZS0hcQrWDrakuRn5cU0H48edHqdhUfc?=
 =?us-ascii?Q?I0ZKOWdiLBgvCUKB5vU22myYp/lh8FjcX0I1z9McSiWajUnhoSWWr58iTOSa?=
 =?us-ascii?Q?AA5kkVEiRxMrPYl/QsZQjcrL5ZbrefUkwqAT4oCldMBANg8hLyl4PNTbPFQz?=
 =?us-ascii?Q?xsZ9xtHxyIZv6AAn+ggQs68+wbJNuDf7OdBtEKyIw4IvDS3IvnhSXZOBsBsQ?=
 =?us-ascii?Q?8yukYg7jLwCe4LcW2uAiGMR3FO29PNuYx1D9sRUb82nzo/Gz0MHn8KgjJ50Z?=
 =?us-ascii?Q?FS3hTR/2GQRgGkFaJ8ICPrucEQcmz0IAWrAwOowPtVdMih8sA4ipA8phrT48?=
 =?us-ascii?Q?574jBubkwykrgNTgR0t9RP177HHWHAciVsv2McZL1G5smXJMBojpC9VOdD4J?=
 =?us-ascii?Q?u2sEyyT74FG40TNeJxubJbF7InlQwRXuW6d5?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 10:42:46.3479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0d67fe-6ed8-4519-2eb1-08dd818a6b80
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8420
X-Proofpoint-ORIG-GUID: c6vHO7RWUNmtTEGPgF38rfaZ6Z_5WYG7
X-Authority-Analysis: v=2.4 cv=btFMBFai c=1 sm=1 tr=0 ts=680772ae cx=c_pps a=c8UlD/aNTkVRGuk1JCy5IQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=sINPCLt_-1CauWpGqLUA:9 a=0nuxaduDBj0oWwsgcO0V3IwwSFQ=:19 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: c6vHO7RWUNmtTEGPgF38rfaZ6Z_5WYG7
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
probed and use that for mapping the IRQ. In the case that
get_device_num() is not implemented this ID can also be reused for the
dev_num.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c       |  8 +++-----
 drivers/soundwire/bus_type.c  | 13 +++++++++++++
 drivers/soundwire/irq.c       |  4 ++--
 include/linux/soundwire/sdw.h |  5 +++++
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 3f1d8ff55022..f5fa92f3deae 100644
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
@@ -731,11 +733,7 @@ static int sdw_get_device_num(struct sdw_slave *slave)
 		if (bit < 0)
 			goto err;
 	} else {
-		bit = find_first_zero_bit(bus->assigned, SDW_MAX_DEVICES);
-		if (bit == SDW_MAX_DEVICES) {
-			bit = -ENODEV;
-			goto err;
-		}
+		bit = slave->index;
 	}
 
 	/*
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index e98d5db81b1c..71aa307a5ac4 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -105,9 +105,19 @@ static int sdw_drv_probe(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = ida_alloc_range(&slave->bus->slave_ida, SDW_ENUM_DEV_NUM + 1,
+			      SDW_MAX_DEVICES, GFP_KERNEL);
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
+		slave->index = SDW_ENUM_DEV_NUM;
 		return ret;
 	}
 
@@ -174,6 +184,9 @@ static int sdw_drv_remove(struct device *dev)
 
 	dev_pm_domain_detach(dev, false);
 
+	ida_free(&slave->bus->slave_ida, slave->index);
+	slave->index = SDW_ENUM_DEV_NUM;
+
 	return ret;
 }
 
diff --git a/drivers/soundwire/irq.c b/drivers/soundwire/irq.c
index c237e6d0766b..98829290d134 100644
--- a/drivers/soundwire/irq.c
+++ b/drivers/soundwire/irq.c
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
index 2362f621d94c..7dbbd38c66bd 100644
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
@@ -630,6 +631,7 @@ struct sdw_slave_ops {
  * struct sdw_slave - SoundWire Slave
  * @id: MIPI device ID
  * @dev: Linux device
+ * @index: internal ID for this slave
  * @irq: IRQ number
  * @status: Status reported by the Slave
  * @bus: Bus handle
@@ -661,6 +663,7 @@ struct sdw_slave_ops {
 struct sdw_slave {
 	struct sdw_slave_id id;
 	struct device dev;
+	int index;
 	int irq;
 	enum sdw_slave_status status;
 	struct sdw_bus *bus;
@@ -968,6 +971,7 @@ struct sdw_stream_runtime {
  * @md: Master device
  * @bus_lock_key: bus lock key associated to @bus_lock
  * @bus_lock: bus lock
+ * @slave_ida: IDA for allocating internal slave IDs
  * @slaves: list of Slaves on this bus
  * @msg_lock_key: message lock key associated to @msg_lock
  * @msg_lock: message lock
@@ -1010,6 +1014,7 @@ struct sdw_bus {
 	struct sdw_master_device *md;
 	struct lock_class_key bus_lock_key;
 	struct mutex bus_lock;
+	struct ida slave_ida;
 	struct list_head slaves;
 	struct lock_class_key msg_lock_key;
 	struct mutex msg_lock;
-- 
2.39.5

