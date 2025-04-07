Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEAD140E3C;
	Mon,  7 Apr 2025 15:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039148; cv=fail; b=Lmo0R15zsG0z4wSskskGfY3CXtovbzAmfkCYg/AIZcYerBIAN7Xir1KSW+Soj/vtByiDA5E8kQRUNzRgN9f/7OrQIimKf6u2tOnuM2uI1/7Do4+9onZ0uiu2RXLnSTCuLjxq5iOyyFU9OO0SqB+ouQCpy5GARKBvYgly//B0NRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039148; c=relaxed/simple;
	bh=oOY0XHFCH73Q6NBYL0JtRMejacb2Uo4XZXkj0kHo0/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QtgwDpgMemTWmhefBqtKfIhiTueilWKxgpK53x+r1NjdsO3XU25tBFj8gHc9vB+5k+pLlm4xfDGKRt4+Ie4NHm1jNM+mSUAxu7Uarahm/DnUMa9ChI+7Bx9hbpH4EUpMS9FFlchOIyXCrrdAW0pzdwHvb7AKPOznh+DnsU+ODH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Qmm1UD8F; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Hf5K6Cuz; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Qmm1UD8F";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Hf5K6Cuz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5374i0Xd031389;
	Mon, 7 Apr 2025 10:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JwNkKkCYqmeDTvoKK6HcIY+7+3SEVKjEOU/mNrWmAvc=; b=
	Qmm1UD8FnvZGjDc7/Jrlp13Z6vwmbLgsdE+GiMaE2b2XXvng7LIxwe8p0HEXgTSF
	KDnVkB+zkRhogm87W/AIUzV+dzA10PtjS36CrEOohQLjWfrwzxzvq667obRevGs7
	abAI7if+VX8cli5OutDbD2b0VxeAZEa+a2mrjP6iKDDIB5n0GHGucoVrJO0Je2Rw
	9KmSVHHe8OcILViqp+l4sSMgHpuQi2km8aZqKHVBUSErX1VwC8VqEKDi9OsIROlO
	nPsrIVcSEdHKdl/YTkCTJJBd+AHBIMZ66hkMgJiPmqQKwzjx3eQWz0yml0UKVoPP
	88aEg4+knxJDQNedhzPSZQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45u0xgje9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:19:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACrWDxad9/EPYEuePY+ZiILdHBhVNGnpg0fgbCYF3RVr7LzUxDqInE/sW41IPDDIL0T9AT0YfOJ6Pu2ZaInq2tSuYRXU/jzKGaRNZfiTLpo1bfCoT63YCbS3j0klTqPeW0i9xiLwjnk7fhtjDqXIKeULx40dn7Af9qt3+gPzBgBIMEeoOy4rNIClNNPK6mFLYaNF/DPTDajt/Yd6y5mnkbz1ddRkiYoaaDcZelqhB7TP7SuJdmXEV28iMfvgDDoft2EBKH5CSDejE+zpbnqCWDsu2LMf0i/zceYWsjP2yMf+cFvODMy9GpQnzJuzkPjkyPr9mhsPc3DRwv8SFTcGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwNkKkCYqmeDTvoKK6HcIY+7+3SEVKjEOU/mNrWmAvc=;
 b=elsjARuhohHZs+JhPE0C3QZLplWEXrm/Ce93yH+lG0xE6a2SiN2uzUPegPufIirHwJPNPjbU14qEMXgUaCblBHEKjxmZ5C78ZLtD5zBtLx7PK34u6W4T/q5hPakYBJn+1JC3vitRzz9X2IgLwCQUMyxVx/7vXz3MNkGAbyckzDTf++qctfJDI7XHmsyqIr51ZLSnossjDkuubekS9MAscnWw72EWIyNbzKQXQtgHUlxiue+21Pgx8XZDQYtPu/00M1hz4erRQ4D+kI/G+MnxF/R6Iyo4X42t8U/jmuGPDveV6nZLPJMbrAyW2xCHYS2EnkE7oT9kIRaGkee/ccVetQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwNkKkCYqmeDTvoKK6HcIY+7+3SEVKjEOU/mNrWmAvc=;
 b=Hf5K6Cuzw6qRAE+HA1A3N/cH6DF0Ul5/6LKqTKHIJnkAvhNjs47ZBKHCvw9dAJ/WGOb6cMJ8kaKAhL1Jos1Z5YGW/P7VHQGRJi8/A6vOCPjWmmH1r1Jcf5BBFoaddIt46/9B+3RY1V5V6Ie6PoplXGqZakWnuGdRqVNV8017mhw=
Received: from CH5P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::9)
 by CO1PR19MB5127.namprd19.prod.outlook.com (2603:10b6:303:fa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 15:18:56 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::29) by CH5P223CA0020.outlook.office365.com
 (2603:10b6:610:1f3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 15:18:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 7 Apr 2025 15:18:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 524E3406544;
	Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1C2B082255C;
	Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/5] ASoC: cs35l56: Add Index based on ACPI HID or SDW ID to select regmap config
Date: Mon,  7 Apr 2025 16:16:40 +0100
Message-ID: <20250407151842.143393-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|CO1PR19MB5127:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d7858337-df02-4534-d61a-08dd75e78349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TTIuPkrXAzHND4icFVWMK8n3JAs7bQIwKNYZ5KQ73wUSPYxQjtd7GBDH/rMH?=
 =?us-ascii?Q?Z0V5wcYqTjs7ppKZ2cWkloS8FEARhcyCdtNFFyWRdpLgqSnryerHCI/VGULG?=
 =?us-ascii?Q?iT8m3JCeZYxr+9JkxSGHdwpMp3bNy5dpwPnD+LlAqgVkyiRpizGFXGgtsRRp?=
 =?us-ascii?Q?h5tQYlbQIiIiRCJIT2TqoQyX4drik23HRRG+W5PmyqbzsYStwLkoHyv2TZNe?=
 =?us-ascii?Q?vnBz9fml8uP0jUCQCXRlFOg3HisSv+aCQgdPJvcpB0W/qT1S71/1UDqFS3+A?=
 =?us-ascii?Q?7zd02ZPF05cFpu3kYWW5gUSIAG+8i6HozgnEDzzNPJDOZtyCoVKKt/Y22egC?=
 =?us-ascii?Q?kco6NXB+13qgYGHLoViNnxm68TwXdl1wv5TrhPK/FBw9qGuXj7hqaIXmY+dC?=
 =?us-ascii?Q?pJz48L2Z7FlxF95CZwH4xkvbSq8r7HqgkJwYmRrjXPmznvgIyjAEqkEySFAY?=
 =?us-ascii?Q?a1SZws4Nz5SmomE1URhfy0XvbQ0nHr1Ar4IJPfaWtv5GlWsDEdp1ogiUI/MG?=
 =?us-ascii?Q?0y71l6IdcAvNogwcWcIUm6uwGAf7BpGrGV4jt4v+CJP5IvPHAVDpknJ4kp85?=
 =?us-ascii?Q?7+k4cNhajpFA6uYoa7n6SWRWlpAUfRSmRXNnWuhSVO24hWHfhrPz28hzD481?=
 =?us-ascii?Q?ZetmhYKj/6EvUd24bF1usBnvsn3vB06nNoCp20568CEqFTxlamyVa1ty6coE?=
 =?us-ascii?Q?qn1hLSm7S79XNOhnC/7Eb6Zym025OAmAKX437sdIrwcyS3Am7Q1agmgGYghZ?=
 =?us-ascii?Q?dNNWfk7jPHbsYPBh9445MXYvqCQbUmyxlsCuG9i+UjhnJd94YfwCSY6yAB5b?=
 =?us-ascii?Q?uBVVDZbsAh/bXLCNEQfyZomqU/9y/bo+1KIrCN+CHDuc2ivr/tDa6qCpsHxS?=
 =?us-ascii?Q?ti03d7kwiOqYr2QFBa1WuNfmFdZw8cDbTuKNQzSsHmNF3QVM9O6OObiLlc+I?=
 =?us-ascii?Q?SiD3uST1XR/rg5y1fbGv59oxr7T7siHQkZf/TEgZQxHcoHI+ngXxYW8JUzE/?=
 =?us-ascii?Q?50kA4tBYFTgpYOT7WM11sEHTt3ZATJCSI37mm7bl4w6R7fcucElKnusgh6hm?=
 =?us-ascii?Q?waknM2LrBdfKtCVBj1INdHt4/4QzSYkG2JkxIEA6yyrv/Jo3glkaR/vWyRFs?=
 =?us-ascii?Q?Vg0ZU06CNIdEb9PCt35KkjjluRfm4ou2taB5NQ1FIl9ULqKC+A4UTrEh9j7I?=
 =?us-ascii?Q?0dZ4q08MSPvo4Yf6dLsLHlu1czSZTNQspJeS79E4jNSYYJv+5Yyv5Gx3x0QX?=
 =?us-ascii?Q?Y7BnRaIU6SQIvj99I22p6YjtjQ7PVi68j4Qt1WpqW72KkbOTlSWGAz0S/3np?=
 =?us-ascii?Q?vI3+tFv6xsUTqcLebqO/45dOZk/+iDQ8Ne+hrIZXqHUc+JjVwNFkdCeMy9tZ?=
 =?us-ascii?Q?DICpz4Kop1M3LtGkARsgs6G3JQAfl/vfwq1lo/noSwrhFuL3aCaVtBeEAnaW?=
 =?us-ascii?Q?rol2JYvodOuAyD3IgCyIoM4ZAwdvTao2pYqMd73eVHNVrfUNXrLGxRn5OLlm?=
 =?us-ascii?Q?zypTqifeKeKt6Ys=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:18:55.4684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7858337-df02-4534-d61a-08dd75e78349
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5127
X-Proofpoint-GUID: BMWg-EHbTQxi_kR72yFI7z2N_TkPSDyd
X-Authority-Analysis: v=2.4 cv=bOIWIO+Z c=1 sm=1 tr=0 ts=67f3ece6 cx=c_pps a=gaH0ZU3udx4N2M5FeSqnRg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=2BTUUkmCcW1H-Px24zoA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: BMWg-EHbTQxi_kR72yFI7z2N_TkPSDyd
X-Proofpoint-Spam-Reason: safe

This is to prepare for further products using slightly different
regmap configs.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-i2c.c | 16 +++++++++++++---
 sound/soc/codecs/cs35l56-sdw.c | 16 +++++++++++++---
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 8a518df1e16e..5962914e2180 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -17,9 +17,10 @@
 
 static int cs35l56_i2c_probe(struct i2c_client *client)
 {
+	unsigned int id = (u32)(uintptr_t)i2c_get_match_data(client);
 	struct cs35l56_private *cs35l56;
 	struct device *dev = &client->dev;
-	const struct regmap_config *regmap_config = &cs35l56_regmap_i2c;
+	const struct regmap_config *regmap_config;
 	int ret;
 
 	cs35l56 = devm_kzalloc(dev, sizeof(struct cs35l56_private), GFP_KERNEL);
@@ -30,6 +31,15 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 	cs35l56->base.can_hibernate = true;
 
 	i2c_set_clientdata(client, cs35l56);
+
+	switch (id) {
+	case 0x3556:
+		regmap_config = &cs35l56_regmap_i2c;
+		break;
+	default:
+		return -ENODEV;
+	}
+
 	cs35l56->base.regmap = devm_regmap_init_i2c(client, regmap_config);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
@@ -57,14 +67,14 @@ static void cs35l56_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cs35l56_id_i2c[] = {
-	{ "cs35l56" },
+	{ "cs35l56", 0x3556 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cs35l56_asoc_acpi_match[] = {
-	{ "CSC355C", 0 },
+	{ "CSC355C", 0x3556 },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 3f91cb3f9ae7..d178357e1196 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -509,6 +509,7 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 {
 	struct device *dev = &peripheral->dev;
 	struct cs35l56_private *cs35l56;
+	const struct regmap_config *regmap_config;
 	int ret;
 
 	cs35l56 = devm_kzalloc(dev, sizeof(*cs35l56), GFP_KERNEL);
@@ -521,8 +522,17 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 
 	dev_set_drvdata(dev, cs35l56);
 
+	switch ((unsigned int)id->driver_data) {
+	case 0x3556:
+	case 0x3557:
+		regmap_config = &cs35l56_regmap_sdw;
+		break;
+	default:
+		return -ENODEV;
+	}
+
 	cs35l56->base.regmap = devm_regmap_init(dev, &cs35l56_regmap_bus_sdw,
-					   peripheral, &cs35l56_regmap_sdw);
+					   peripheral, regmap_config);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
 		return dev_err_probe(dev, ret, "Failed to allocate register map\n");
@@ -562,8 +572,8 @@ static const struct dev_pm_ops cs35l56_sdw_pm = {
 };
 
 static const struct sdw_device_id cs35l56_sdw_id[] = {
-	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0),
-	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0),
+	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0x3556),
+	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0x3557),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, cs35l56_sdw_id);
-- 
2.43.0

