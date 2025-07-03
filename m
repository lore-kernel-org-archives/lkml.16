Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011053.outbound.protection.outlook.com [40.107.130.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7347029AAF3;
	Thu,  3 Jul 2025 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529048; cv=fail; b=DY0wFEwT5HBEjlR/VQnZ/m62n8eZ8K3Rt4oEPJHo6ZjgfDUW7gGlap3ViEWicBMfCernCsV7BWwbuFttixiqHqwea865pc3Ci2Ns6n3ZqsxsKDNdqRkeTHnEqn7jDeCH1yY+orWaSl4FmGzULFeNwi4/DT+S7/cTP1e5idpt46A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529048; c=relaxed/simple;
	bh=VwNUDvufRCYybEG/qaIAn6chZSsB3kmwQqMts3y2Xkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NuoRgmFVLannzFc+VCkMv77H5isyIudZPFMyjjRRsH8vjdETW/9Wm77mx0YQPZwll4WF8NZNJszNUtWgFLLQH9wKLviT+gNzlMWsSCBc5Evg2hdHcLadqHHd5VBSP38Ufr0nxe9UcjFzWqNzv4TPL1+lZkxzjhZOZuNEt2otE8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=UUormHln; arc=fail smtp.client-ip=40.107.130.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="UUormHln"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yF4I1Or8cW3JMGqD3YTQ3Rql+lVmSbTbQG7rvJrPmEaeTrkRot8Z8ORoZLJMVM2oTR1AODO6Y6m8g3pdnvcd4z85BnGmhSb8rCcZHnrbxstEm3Z/MxKKECL7HDS5gn/CO6zrmR5+MG2YNu2c0xkrBRFUK0Jxbx9eLuHIMq0EvGRhsoFq0QwMPeXf71F8gxhhgjVJLDJo6y7oJO1MYwFTHLPvK8cCu0QvRf64EB0T5h620G0G7cMQ9vtUgGYbyAnBnndIGKtsmi4121d+cZMyAo/7NebBJVK/QbiDqTiOzEWD2FbODPjet4qIj2Ut3ZSVbt1aVKXKZkcTE6piwykHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REDZOq5F+1bmqH3IXzBHu3LL6du7WZMuPArozR2ENfc=;
 b=IKU+dd57OZKppXWs7seb4l+kDpcBZxVzxOu/oqYnqsELjcMJllFN/WSsJljsEiKLNdTQPRUmoG3am+tYUPTnBBlpOmcR8wOH5J1ma9lXtTWchfdqn0EjgG65uiRzVu5hZZ0feRNEbswmXkk9i7ZoW7024fGDTYpWG8wu8E3cND5wc59ko2/+2b37aBwPdoHCEM7BRPgbYFTUSeQggrMMcAg458t9NmwCXBdML/y8x21QCAgSiifSrwsBZioAEFiKB6LfYRbaHIayslOVxohH5lSSTD504DtAXtNmMsCzAH3MpmbLkXwBKYfcV6BNwy9hd/nJFQECh2AfO07DhIUU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REDZOq5F+1bmqH3IXzBHu3LL6du7WZMuPArozR2ENfc=;
 b=UUormHln8tfe34r0NRv1Lh9ur/hUOcqVxZtPV64GgKmgR8y6RzscUWlbyzuyOnVH8MIo//GhxzITj3lV0iASk7hTzZJYz4kVKnOEDf02Ob6tBpdc1jCoXgzCAFfaJxlY0NqTU+G9b0BGHmpoerZdNMKLHjvbiGZ9cfOqYy+161I=
Received: from DU7P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::27)
 by AM8PR06MB7044.eurprd06.prod.outlook.com (2603:10a6:20b:1d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Thu, 3 Jul
 2025 07:50:41 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::bf) by DU7P189CA0001.outlook.office365.com
 (2603:10a6:10:552::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 07:50:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 07:50:41 +0000
Received: from AHERNOBLEIH55.lgs-net.com ([10.60.34.120]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 3 Jul 2025 09:50:41 +0200
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	m.felsch@pengutronix.de,
	bsp-development.geo@leica-geosystems.com,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH next 2/3] ASoC: tas2781: fix reset-gpio polarity
Date: Thu,  3 Jul 2025 09:50:36 +0200
Message-ID: <20250703075037.2558549-2-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
References: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 07:50:41.0368 (UTC) FILETIME=[2C7D4580:01DBEBEF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|AM8PR06MB7044:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c65c23c2-c758-4918-6a28-08ddba064f28
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LGkrDh40XC8mJiL3glBGqTLsfaX86QEpt8ZDqKzZnJdVbvZwLHhqGljojg9K?=
 =?us-ascii?Q?8k/gx6Br3vGjgyH/YM4c5rNOQnpx+l/qOSNVAxzLRaPVGt2U9x38z7n2hwws?=
 =?us-ascii?Q?t9tpkripZBwmafHWNKGGVwiX+MEjEIzOGokIyntO4mjW0wlKISHaaMUApLav?=
 =?us-ascii?Q?7iKZraPXbwgpSsD1I5EycEPl5/HrPbEcW7FRzzseadQ2G1rBpCwCWC5vwxs4?=
 =?us-ascii?Q?Z+h7+pNpkDAXdADGvSIh7yYZL4TLSQ9AZXamKWq3bfKNnSvecn9HJvv+w6UR?=
 =?us-ascii?Q?4AbCL3JOd1vLdEWd1K7E/MQgMVNB4qNf3x1hs69aajfNO3OVuJ1dMKR0sr89?=
 =?us-ascii?Q?Ikrc1bjmGYQ4BykyVydLLgU6sx49zPG1gMmJoQhsICHIuu1t6pgIO8QjMGFm?=
 =?us-ascii?Q?P2Z6PTAJW+Usub4RT3l/yNT3DLFtTc/yJ/do6ajTxTB349/PE7ZYU9kGltKV?=
 =?us-ascii?Q?zrJAIlQkR7Msf4vSd57l2Az3GmmczSg3GmmZ3zOEI6CY1H37oTUOnyEZiLTh?=
 =?us-ascii?Q?8B3xd/feWyFQhuGlf+owEf0fzqezbX639lF2JrwFkUB/6o+bRpl8vhHUKhva?=
 =?us-ascii?Q?wjrqOchPS0g4GkzYbXSEqsqsGYcsSDkGbw340TTp1vCWWHIwAQhjdGy81KM4?=
 =?us-ascii?Q?J8lyn93oxiwZQD5GRMt5bEC8XREY/eF8vbWugKo2W6jnAUwn1TKPykg/khWq?=
 =?us-ascii?Q?nZmv23advb/UN4LLTuoZj8E/Y7PYy0omTAiCNtALWTjTv7pjSF7UY9SFDMHf?=
 =?us-ascii?Q?sJRGRkyAq3ifZ+PcrWCP0XyGB7xzXQsAujuW+ORqr51bZZu7dmJucbeAlbem?=
 =?us-ascii?Q?rv+n6irAiCSwdqrV+IezlxutiApDuyfJVumVyd9sVp+pJ15sBga49ZhrT62R?=
 =?us-ascii?Q?y5bc/a2UeRUTepPFEhKCRY9qUMb6dHuIENS6TRpNt2SAcrkZ6bulmoxRVar0?=
 =?us-ascii?Q?S1EQ9/T4Ii3YTVnzlr3eIZdasYngtauLAkF5qAqWnTRCIFkr7ezOyLvhNpsq?=
 =?us-ascii?Q?kqbNHNg0bkFmKG5k4kUDwsHRNrfXalT2Ewccx9XaiuLTD1RX5PLC2fZ79ryR?=
 =?us-ascii?Q?XmLN0ln1cYi+BXg1ZIuR0naJ0ELcb2007haJIYuCIvQpQZR6EmRuF5XeBDCe?=
 =?us-ascii?Q?TCKcFiQv76X9JOmyFLDE8U1/AYtL5PQNqVwS3a3MWaQqtVUSXZw9UMPATX3C?=
 =?us-ascii?Q?/UqJTeX51XDWLSVMe4W4eYBpPSjNHO2OaAgBow3gc8Hlw8jPt4LHCzAZaVwJ?=
 =?us-ascii?Q?nEg9Ert1+Y9li0aOgoFvDm6+rKQgr2cBS7hAWGepz05xVlcbButY0JK9W1SY?=
 =?us-ascii?Q?sBzOiN94yV2uonaOru4B4+rP5JUn6V6pNZ6CapMI/kk2S0Z8HhDOvezI8wIA?=
 =?us-ascii?Q?/RUmDOjIzbZCIK4zEGNK8D9NZOTWxUkOJeFYLuanIRJPEwHIZIdYLDhYr/+e?=
 =?us-ascii?Q?yxbL0LoWAbL/QBixePPt8f1bgzwuOu3fD4oYfKkd2JSAHyzArl1aDp6pLmIV?=
 =?us-ascii?Q?tOaVRARF6z0jN7pfzax2Su95qDWF8CPvzFd1CxzSd16Ry9hScnp5miIzKg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:50:41.5715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c65c23c2-c758-4918-6a28-08ddba064f28
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7044

Both TAS2563 & TAS2781 have an active low reset, yet the driver assumes
an active high reset. Hence, in order to get the chip out of reset we
need to lie to the devicetree about the reset polarity. The patch fixes
the driver so it could work no matter the polarity and leaves it to the
devicetree to define the correct polarity.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 sound/soc/codecs/tas2781-comlib-i2c.c | 4 ++--
 sound/soc/codecs/tas2781-i2c.c        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index c078bb0a8437..2553af086637 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -313,9 +313,9 @@ void tasdevice_reset(struct tasdevice_priv *tas_dev)
 	int ret, i;
 
 	if (tas_dev->reset) {
-		gpiod_set_value_cansleep(tas_dev->reset, 0);
-		usleep_range(500, 1000);
 		gpiod_set_value_cansleep(tas_dev->reset, 1);
+		usleep_range(500, 1000);
+		gpiod_set_value_cansleep(tas_dev->reset, 0);
 	} else {
 		for (i = 0; i < tas_dev->ndev; i++) {
 			ret = tasdevice_dev_write(tas_dev, i,
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9f4d965a1335..b7202b000247 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1895,7 +1895,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 		tas_priv->tasdevice[i].dev_addr = dev_addrs[i];
 
 	tas_priv->reset = devm_gpiod_get_optional(&client->dev,
-			"reset", GPIOD_OUT_HIGH);
+			"reset", GPIOD_OUT_LOW);
 	if (IS_ERR(tas_priv->reset))
 		dev_err(tas_priv->dev, "%s Can't get reset GPIO\n",
 			__func__);
-- 
2.43.0

