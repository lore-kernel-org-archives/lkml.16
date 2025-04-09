Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487425EF8E;
	Wed,  9 Apr 2025 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201382; cv=fail; b=eaB0Ew9/usDPOqHjSvu0+UE/UhWdv6oWbjaNdSicC656MzTvVC9BmgNy4ikmcpXhkRpArbb7qG9N1Pk+Zd8vU0/K+QkC4PlTzXHSF0hR9puD2u6b2b9tXYrPsMLGWp0Ad3V5qO4h7LbWqRPCYb7McmMWaIi2+Bozm7p2JPWztCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201382; c=relaxed/simple;
	bh=t4xoF0SxMACP3htD7nfANjqGSuUEl5RyHwzIttMVGps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nwuXnTBBIyZ76Nt33f6A93CO5yzSzBiKWV4oBD/9yQTnT7Z3wIz88nKHHmlM/xZVuivHMMXZeOjTks/yxaQV3YVQBU1QI9o8FTp4mRCKjXAqoSrjoRok2JA2OQLalkY+x2c8vPFeAB3bJbj7j3WK2TDeJZ3We7tDF7khXwMU324=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ak4Vglpv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=M0s1Dt5c; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ak4Vglpv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="M0s1Dt5c"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5393oh1i018230;
	Wed, 9 Apr 2025 07:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=i9fQ5eyKagewzBQ/
	CnD1aOn2gEC/ccufz3StBIguLLQ=; b=Ak4VglpvOVovScqeUkf52qLaaQlFW+9p
	YEzwDXsBR+hXwNBJi4CBg6cdJbdO37ETY2qyW0qydb+go/kWH3zG1Z53cjnGJ5x2
	VKof5ofhAKJ9OreWJN54n7DM8GS0RVAnDCuWITf3Is+7KhqFLDc8LmmWSSaznEO4
	wqTA0iuJbC3WSpPIJQMU4e7a1yJIKPhzU57cBxcan5qlZlIBD8Cos0Pvq15+zmfP
	hI2qCoTh0NllT5BaOYwe77HpsBOoBUdtL9YxfAnlKo74kPTvbo33bKPDzMhSJxku
	0x9SoeB1I4KuVwhCaFOqmF2OVVuLDn/aY3ncHdlJLCj/6TjFgjc9XA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45vemwm27d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 07:22:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQaPkCqKi46SkPCxLqRi7rK+Bm7NJkoT5bgWkrfR7txQFODdR2N8Q9rTXgUoeyIue4SoKhJ/w0cZ2Sh+xSijQM2EyvsOm/uLntaZOSZvmzDNgcyjY18RdWD8UyeRwvDnLCySw+QKods/sWDfq8oTu4A4Mj19WTchS+JZy+BIrtb6zEO7tsncfFPIKVteDU7HDH7ecLCMxL6ZIChrGNi6B2Ci59vyIqzS+sWAZsfa9d5q3aY+FtxCETRfSTQg8WLgchOHwjzhi0XUvvBIr56/CbIVIk/eESq7tFzyuueJ6pW67D6dzwnQEA6QKg2pd9BXq6qKjtyzVwKaBho8w51dwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9fQ5eyKagewzBQ/CnD1aOn2gEC/ccufz3StBIguLLQ=;
 b=lYNH45a5Km3y8rXMn0567WFAX2tNbGeQiQ/K5IaxP6MNbs+HQaK+xNM4lvL4N5Maokg2D159nn9rH9E1s5UJ6P2XSUdrTgqznU1Cqe/nF08DxCjbuZ8ZtMmmHSzfuEZynSfCqAyF06APw+e37EvBjOF4iGtpZ5ZtQcPt73QEBShcp44hrWPphJwDDhdg79JhAZ6X12cWXj6a8gLxV96TdFlG2ct892O0ewm3w4zsjHIpwVsTPCFFXB6FNoRc36LaVKz7a4xJiuVrXxi37+DQI8LHHPOJDVTHR6LbSqYIcTULht6mwsNH3dF4jgWKl7Skdn1rg0WwVBungrWciV0IWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9fQ5eyKagewzBQ/CnD1aOn2gEC/ccufz3StBIguLLQ=;
 b=M0s1Dt5cLsR88lbXOJKZZ7ia9/x78gbnyEGf9GDqJWXTWSJCq8cls7s+lB/Vsnp2fSWCaDeA3soYQRJsMN1CvMaOrYTD9th9HxoPzeG79mhwumIVByLW0h3T7b3Ae457I7tGDuy2IC6VJLsNylH/Ds4K0QZTbX2XkHPsSOVl2MY=
Received: from BN9PR03CA0437.namprd03.prod.outlook.com (2603:10b6:408:113::22)
 by PH0PR19MB7427.namprd19.prod.outlook.com (2603:10b6:510:28c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 9 Apr
 2025 12:22:42 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::5b) by BN9PR03CA0437.outlook.office365.com
 (2603:10b6:408:113::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Wed,
 9 Apr 2025 12:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 9 Apr 2025 12:22:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 08EF1406544;
	Wed,  9 Apr 2025 12:22:40 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 05E11820259;
	Wed,  9 Apr 2025 12:22:40 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        sanyog.r.kale@intel.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: bus: Fix race on the creation of the IRQ domain
Date: Wed,  9 Apr 2025 13:22:39 +0100
Message-Id: <20250409122239.1396489-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|PH0PR19MB7427:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e6083f49-c58d-4d7f-8f27-08dd77613956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1gxPiEh4OiQnSlNJbm/tZUE/MKmGWik3ZBciXrYw5m6o5PDIYdVNGukNM1Aa?=
 =?us-ascii?Q?pib+xHc5kBENfOa0Cekl0XQ6c+bs55VtrzGOOm+u1pAc2aAWhe8ucNCOncGk?=
 =?us-ascii?Q?yCql7Mhp2l8ippebkB53s/aP4TgdqJLO186ZfwEG4zRIV0o1iphnK3iwVzUu?=
 =?us-ascii?Q?EGH50L/BDjCCzHMNC5ItjGg6HkQ9TiOxH5SKUsghNB52/2Iky3ry4HwvLqHC?=
 =?us-ascii?Q?LD4QByKITRsHwuQ60rJQwZf3mn6Upu2s8Na565id4Kak4H8w/f0I3xDiBe6T?=
 =?us-ascii?Q?W75cpDfCrFJV/Mvgx2lZAuIP7zyJCMYx5+h+Pp19krQYNPQJ1KyGhVlhczEf?=
 =?us-ascii?Q?a33YYckDeIQng0josXXkLa/Pop+VpP+YXW/VYee/ALZWMD0mczK0gjAPdQn0?=
 =?us-ascii?Q?0tnIjLUL9LKnY7ktVQsjHnalL0ht7NaotnzgIkgu7dJPFjqApDNjmn6HugKm?=
 =?us-ascii?Q?/65sZAdaf8Wj5N3wjsTEU+bIH5jnwfSqDn04/r7PXSkJi2Hb0nfR2MWE6Kam?=
 =?us-ascii?Q?Go1Ebkx/vVFM46KH1fvfTZQiHbqLllRXJy+5wuqU+rr0kXGlrNKLQKTt86OQ?=
 =?us-ascii?Q?k6jo6h+Uw1xB7+NpPLnhdAOLe7eCSPuv9it1n2b9yCl2kpyHNMIF2Ur+xpL1?=
 =?us-ascii?Q?OvyfwDdaWA5hAdFGOmNlbikNAcUSNU0SS5y4YBqL/9St+RnDUfRk3nBFxBbP?=
 =?us-ascii?Q?gfzWU+7Zur36sjJZw8jIyuxsC/avCJZcwkp7kEZRKmyIrRPmGl4BNfROS/cv?=
 =?us-ascii?Q?jpVO6j4VThAJgxL2ms782E1cPM4Tl6snzpTaZmZtTYh8D5KxvAQQipwvCCUy?=
 =?us-ascii?Q?BFRwbYT0xNotJgodrg8p9H52gdbS8f0GE92G6zfRD1rjmXatuwPn9EncuTpI?=
 =?us-ascii?Q?BW2uF2QGV+nSN1CBKhTgpi1LSvc0HEJfUa+Mg/XJpK8IlgKyyxVIKzdy3ZEn?=
 =?us-ascii?Q?9Hqw7dMxHxEQrtNWDwOOQsEVZdRSOMjSQ7ICS/aBCsTwQ9Fc5GUCAxbWVgJI?=
 =?us-ascii?Q?n5THNDWSb77KYNre6D0yaSu5ZNoCDNCQzW059cB1z24CVLM98BFHX1hiATtU?=
 =?us-ascii?Q?Qpplo4hZPGpWFyEJYPv1kUuODEjmMy8b5oo0xVpoPyLo2XP+0ZyNBCR548Pr?=
 =?us-ascii?Q?pK16YObrwackAFIvweXla/AsTxB6UpnFu1TMR796tNAm+kig+psBVd73pNFy?=
 =?us-ascii?Q?BN62or8fi+R8G3/ADBkoFLSX9hfVJEJH2AK9lI7o3ZPjXi11iSF6aUXTuTii?=
 =?us-ascii?Q?W+hAbe0nW1EzTcoONao0aL1WHoR98XZkSAmJ0apwr8C9b+0qNYtVHNtcmTxE?=
 =?us-ascii?Q?F5AxY6O927yZMMmYugHuqVgb0M+qUfV48HtZGcBF1NfomjmFX32HHPK10Gi1?=
 =?us-ascii?Q?KkINFJdkVk70tcgvkVq90Kmv9EOQuwi1Goz9itBuq+gTsmYzg705PslIJ9cf?=
 =?us-ascii?Q?pbPhZ6n1XnniHfsyVwBEgLaIzxOycCu4jOvMJ4Dt+PapXCzRI973wg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 12:22:41.1955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6083f49-c58d-4d7f-8f27-08dd77613956
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB7427
X-Proofpoint-GUID: nrekASPtr_fDwG5oSChB0rZjwY_ie-yR
X-Proofpoint-ORIG-GUID: nrekASPtr_fDwG5oSChB0rZjwY_ie-yR
X-Authority-Analysis: v=2.4 cv=bYprUPPB c=1 sm=1 tr=0 ts=67f66697 cx=c_pps a=nskeBUqQUen4dZUz4TdP1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=ewqUbTxJmRIais4Z28sA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

The SoundWire IRQ domain needs to be created before any slaves are added
to the bus, such that the domain is always available when needed. Move
the call to sdw_irq_create() before the calls to sdw_acpi_find_slaves()
and sdw_of_find_slaves().

Fixes: 12a95123bfe1 ("soundwire: bus: Allow SoundWire peripherals to register IRQ handlers")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 6f8a20014e76d..39aecd34c6414 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -122,6 +122,10 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	set_bit(SDW_GROUP13_DEV_NUM, bus->assigned);
 	set_bit(SDW_MASTER_DEV_NUM, bus->assigned);
 
+	ret = sdw_irq_create(bus, fwnode);
+	if (ret)
+		return ret;
+
 	/*
 	 * SDW is an enumerable bus, but devices can be powered off. So,
 	 * they won't be able to report as present.
@@ -138,6 +142,7 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 
 	if (ret < 0) {
 		dev_err(bus->dev, "Finding slaves failed:%d\n", ret);
+		sdw_irq_delete(bus);
 		return ret;
 	}
 
@@ -156,10 +161,6 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	bus->params.curr_bank = SDW_BANK0;
 	bus->params.next_bank = SDW_BANK1;
 
-	ret = sdw_irq_create(bus, fwnode);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 EXPORT_SYMBOL(sdw_bus_master_add);
-- 
2.39.5

