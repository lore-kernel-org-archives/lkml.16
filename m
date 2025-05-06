Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC7814B965;
	Tue,  6 May 2025 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525566; cv=fail; b=s2saUBC3IAwovNBlKPCaltgg+A1uSj5dBo+B4zUg5VvU1RLJHAtox7FcqPhW/gN5fk83b4qEc0Cc5+ymCJ8N3544I54nzdlGVJLx8fciTtfY93gcKbuhxhjOWckZEAV0nR8tXgYcqjhsAPYE8arA5oJb8RpitodO83JezJKv2zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525566; c=relaxed/simple;
	bh=oOY0XHFCH73Q6NBYL0JtRMejacb2Uo4XZXkj0kHo0/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XARCLDdHNXef9YDC5hQ5FMajZQOAzcZuS1MPJrUFgA6tJTDVsJQV63QhnwasCSv8xVvOkWc6E2i/D+iCr7TEVo59ASPcBh/YGdU3ngSt5lURbSbErvpnxPE8ehM6Iwbagdf3sGCqUUxlN6GbSa24IrFyqeGM+L5KgUNq2odODi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=opfx78hF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=S+YiT0a9; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="opfx78hF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="S+YiT0a9"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5460I0Hj010201;
	Tue, 6 May 2025 04:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JwNkKkCYqmeDTvoKK6HcIY+7+3SEVKjEOU/mNrWmAvc=; b=
	opfx78hFdONaOrTiwXTIESE4BvrqfpypJ5zBCKvnOkXp4C6tj+/mzqqzmkVHJR3V
	qoAcuG786hBITOSvVWzBJ+5Uc3fVgGf7KG9HHZ2SK22Br3Dd4hMk/l7aFz35PHbq
	ZftH4ZTEn67QGGRKdhBARFjmZhOvhh8fng+Hri0p0HvUFBRlE5RPTRHsRORPKCVq
	f2/GU7ocSlHbS+rlVSI5Z8dTHiEz17f2dk1ORDSrQxavqNrzGE6NXtlVfbemx5YD
	KnixbySO8SSSeaKrYAOAWbgOyK7trY/g+NMChm7tzmoDoR5rlY0RKIUPYMOr7TKR
	mekEtcJWSAE5QkXnJt6CIQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46ew4n9dnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 04:59:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3WfrjNUTX+777YPKSZlZ0wbKbtuxNCPdecvuFtDeDx9zhGA3kfgHpk2y6x4GVTz4svVmxFVt4hY+5AF2ENzLEJyTP8HF3HBQzQmb34Bu4iYh7fsRejL/Pv3zVPpFHO3aT++dF0EVOMi1qe8wqUakBX+kPZ88GmUQWP8MLavm9CIPXWfFSi+uAdWCMffEq11kdh0mfkLrSNKeWIGlFEGvgH4gflaN7Xi0TCRsL+ruDyBVPsxZTY33TjKMeZRHj1BDPoUvtA/SWlvPJ2fFXQuDNClwbopHTE8/nsBJ2/laMhPrS5LHEMVN3jEQ+6KKgpTI/+m6iifdwT5oBnj1pMZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwNkKkCYqmeDTvoKK6HcIY+7+3SEVKjEOU/mNrWmAvc=;
 b=kwwC9YxcJfYW3QVahBqD7+tvL5yxzpJ6j2IlrAiUSGt7cIo4HfwkMCn2zCBIxEzWTsCUBXMIzeTPh6wI1Pnv3bR3hcA/2FOsgLr2Pjp2+0HPv8O8NUL5piALF77AvdZujncazn9SnWFNpgoJr7hyLNFca/VmJDfuV0mIjVnnt+GlhfjOFudCqNKQMUwxTUO8I8hr7FyK1+gsrVNgQzr0HCKaOleE8XQGqXxg/XpC+f6M6WYIGiFrMvl+wH+iQ6N0m04snDyMlYxcGW+2BZVW5cTlFHuBWZwsazAOHx0530MJyY6f4u5d51Kay+9OF9Hr6nO9po6ZXcYmaJ/KrbEKrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwNkKkCYqmeDTvoKK6HcIY+7+3SEVKjEOU/mNrWmAvc=;
 b=S+YiT0a985huc4ad1mG+uHwSF97/DcplM7LYgWMxgSlRbJDFTHGfCnN2WZAWE02jM2Usag5VLhjCtycP+sWE6wZH+jB53dpSY8LJP2akJ06sBHVyepjSc5i/hUipoZVa2dBnV25UxGQ87iL35qm9OI+Z22gofHLVqvriz3LOvJE=
Received: from DM6PR03CA0067.namprd03.prod.outlook.com (2603:10b6:5:100::44)
 by DS0PR19MB7441.namprd19.prod.outlook.com (2603:10b6:8:142::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 09:59:14 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:100:cafe::13) by DM6PR03CA0067.outlook.office365.com
 (2603:10b6:5:100::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 6 May 2025 09:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 09:59:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 107C7406547;
	Tue,  6 May 2025 09:59:12 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DA49A82255C;
	Tue,  6 May 2025 09:59:11 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH RESEND v1 1/5] ASoC: cs35l56: Add Index based on ACPI HID or SDW ID to select regmap config
Date: Tue,  6 May 2025 10:58:46 +0100
Message-ID: <20250506095903.10827-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506095903.10827-1-sbinding@opensource.cirrus.com>
References: <20250506095903.10827-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|DS0PR19MB7441:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5a741d22-b2e0-408f-e172-08dd8c84a7d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7XggPGT/cd8vOCMaM92ade2hiKHxrgh2JNHi1sCmfxTUykIpXSHghj5VigiY?=
 =?us-ascii?Q?wAhrLeFM7pe2Qn2XhK52VjKKKmrfJNfmj2KFKQWPzjWCFLDgWAUAoAlsk2Lk?=
 =?us-ascii?Q?JiV4C/N/bDb2rayYd3riCRiBpGMEuUUOD/Jm1iIDRERT1wxKd7ohwHnq+/00?=
 =?us-ascii?Q?BFUUiwIjLOnsedG+aWr/U05D9xRUMVUbgeN4GDdZK5ZcmalYixDZyqZvfz4H?=
 =?us-ascii?Q?Un2Cb/UWtbFMlUvyfJ/8vnbvEL2n2etfe5bX05YLFrVJmiolTgQQmgmVKEPO?=
 =?us-ascii?Q?3MKGaO3o28WtpcQcagR3tsl9+Wbqg6kM3hVzx4p2htoQkkeHj/RDpu0VUksG?=
 =?us-ascii?Q?JkIyUrWekRpMp66pCBp+7JUGV/b1rOXMjGe/1Dnuop2FXPJMe+Cw7Xv/+6GU?=
 =?us-ascii?Q?Dc9RUvRaqJoSk7zlIZ1JxzK4l+4DqpZ1Ot3p9QNKqUxR/weebkHzOSUJS4Sl?=
 =?us-ascii?Q?CcJ+bQPs6GyVAA/x82dptXfecUc7PtfW+4nZW8VxF3+x1ekpr5DoirC9qsjV?=
 =?us-ascii?Q?kCjugAhJqTfmqeOBxkVmAUsvrpnNRLw3dPzr5wiPnXdxFIu5gskvPQ67h98E?=
 =?us-ascii?Q?I09s2VD2xmyttFL02K9XrXDZCilgFQstFBoXzYGu5fLfzUKw+v79pzkYcCz3?=
 =?us-ascii?Q?ueiS+MrAeXUbXhjKhPgX+oQ7VOe4hx2lklGXEXcFyo73NeWWIFV8LZ6py3Ov?=
 =?us-ascii?Q?jkwq5mmDlXmFWUJf70Du4zNyP0b1TavSmDaw9NHuHzpsen/kG0hSChIok/J2?=
 =?us-ascii?Q?VKHx8nKWzJn+tvK4r4tCDpGj8uE5hSRNZ7HJdTsxOlEDCTeNu4mgIX8rQy4f?=
 =?us-ascii?Q?9nnaP8fhyPiiP6PAUq1Jb7SzUURWwjevKMH64ty1YnA4e2XsjVv/HybNkf+U?=
 =?us-ascii?Q?8VO8E9eB+YyVirt1DGAC0sD4RZeMVzLKgM0xXLO+Zu5Qz49PseNRorEvGfSp?=
 =?us-ascii?Q?dQf+4b72LcP0ZUqPWo7epjCCAj+INMfVqNPrIgMO3oBmAZBd2V7Xgen7kgwC?=
 =?us-ascii?Q?X8l+tpHKWW4I2+A9C6/Ui/agi/EaeGlJb4boKdrNaWwtr3RQb+JxZoITti4P?=
 =?us-ascii?Q?xHD8EmW1cYy7VALO9I4ysHg1KcrAEvhCqyVPajQPrTtkBDlVg9fsLButyqYo?=
 =?us-ascii?Q?YqYSI1Yo5FnWGuORVoUeiqQiyY+43kd8BNFNFuSwUTOJ5bhTt48zi5jeUoRL?=
 =?us-ascii?Q?iMSh+2pQ3f+w7znoSOpWonU5TuSRc8Gv2tPKdDsivnTcC4M9oS1x6T69fP77?=
 =?us-ascii?Q?2skzbjqNCn95KvAIkd2Io5Ajymj3nYT7lA7jvsAWYGsVJlwnR47oOe4cWMo0?=
 =?us-ascii?Q?J30HiEGpzRn85/lS9PW6yEMUjmAQFk5H5LE1LI9+O9XmxfkadQhnZ/oC/hWN?=
 =?us-ascii?Q?BKQI6mY/X6f6dbL+klbHjs+6x2q8mD6PBWO7Lh+QNnOx5V85VDaNZ1zPE28y?=
 =?us-ascii?Q?2TnRbcfjnJLupe2LXJN8JiwV5KShG8S5svPv88DBvx2XBfb9H+T72m7yxBWM?=
 =?us-ascii?Q?wy3HDWK28+zsFrzO1gEPaBGkZWLdpiyOdNRD?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:59:13.2888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a741d22-b2e0-408f-e172-08dd8c84a7d4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7441
X-Authority-Analysis: v=2.4 cv=KoJN2XWN c=1 sm=1 tr=0 ts=6819dd79 cx=c_pps a=R19XVbJ/69TrMGWtO/A4Aw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=2BTUUkmCcW1H-Px24zoA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5NSBTYWx0ZWRfX56fsDIcKQ2QZ 82TgqqqD8vYYOOggQfGYlmHPtQN59ttzWK4vGh0ZqqTSwEei2Y6gPs6NiT+uminUUH7CfjNBS8n AivZSQuW/EmZEVzZ1oHm8hGkgwCABw+Cf7NhL2mV+QZqCKyUswLrkseFa89Q0PA+QA2r7SbxdTn
 Hp0OE/Uu0q7JDl4sC3ddk42EAhzZnvw7EZYVO1A9yq/GYhe5fv0t6SZtpHa6YroNMz8l+bT+g/6 PEHW4+MfXbMUi/eueJEs6MZfdlKconDDeywq3SAPOQw6pCp9NYLIZSDbRFxTcP3LPzWItapeKl2 uuBggqsquVN88AD1Ti+/aFBeotg4rv8BzrPemMsj3zPS2Df4zYLCu9VNDGDyuESqswgjip3ImpR
 z5UnmVnkrPENMzFVszQTYkA1l4Aw4CQQAWotQo4fwwaHIh48zWJI3wugdWKlJ5+F+ftr1daN
X-Proofpoint-ORIG-GUID: JeduW6pATUMb_Utq1bV19ruzH_TxO4vk
X-Proofpoint-GUID: JeduW6pATUMb_Utq1bV19ruzH_TxO4vk
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

