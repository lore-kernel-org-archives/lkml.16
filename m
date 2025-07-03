Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012024.outbound.protection.outlook.com [52.101.71.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF42989AC;
	Thu,  3 Jul 2025 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529045; cv=fail; b=RhWI5fiwBosnHRr5XQifbf42jusi5dsInSv8uHmoo95rmaHL1wW+tVwA7dOTlWxnyCblDkG1QUFJHfh8X2pF3WNM3NX3WZPX4WfKp5UNxifgi5ZpAwKuGQsBLBEYOuyLJWUaFzOaYScjHxbDpxLLVpirklKkQwgzbwIXqr1l0Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529045; c=relaxed/simple;
	bh=AZTTvND3ukTyVABWcvsBCAcq/pA2pR6LgUfm1+Xde6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cvH1S8q9pFtuGaj6/AbixGaWG15oNwctWQn+jPuYTysNq63SW1XZ3QOMxV7zM8cyKKGp0+P/ZJSvPGhDQLKi+QLuYxIuMTfsgsdTLWWhzN4FTEHHZhfWf0UoTy7zP1HbhdgCGwfLLmfrYeALMywU3he+iFt6jflp4lCrvoMClwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=rbBmtH0c; arc=fail smtp.client-ip=52.101.71.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="rbBmtH0c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mn7s7RUlPlscBqbVtaR+iVL1EoEmF32BVyNt1qXTUrqU5pqDHJrh/fs97yV9KjC+GUCfxTtaMX5k1KCqC2sLHpU01NTAhZ0G3IzI6YcZRDBV0SYXFP5Ec2rZa5MEmk29Iq6UrAlPkRyK+Z3AdPcre+lTC79pCThdeK3ZTML6M1oBuN3KkyWdyfu4q3RkahvD1NXnPrbX+JXgAS6EdWRkt+KpobwXoL+XXUfxL+Hhx8Uecm9pJYlS/E+38d59azonVirDsgLUTKj/+ewe5zZcJZ+dqSMMgZsL7b1t9F9F0ts2a2Htz1w8mBLxhNEi/73CS6o00qJ34NPzgXIMYGc1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X24t4osH+dEeMhOfnmwZ9P5zSUo/8nicJQuTiNuriIY=;
 b=two8H55W/c2I/cWfuuzHd735jsLlNBDUnZnVGqAbSZfheM4dRnvb45g9KU9ylKVDMeirewtrZ8QoeU6q//fAIVs3uNlDZFns+IrzNgBlhOhzBHLu/z3f8G0p4ZgIlF6bXdbWcPo7xxl+Jk2CfSOu8d5LvCongJq/GjnhKu+bwB2wCx3sJX48unEZcrJ47Ehx/ONY+5SmH3fMWwU48WN/mu9UZORXkctuUfdTUIQnK+Ei1HHyIoL+S9CzsaAkepAs5gF1t/jXEVL+wVc/SukYVscpITVG2ZcNhJ1qgISkE4KSBm3YmWeGt00cgh1J5toOKyCK4/0kpHgzosWM3qCpWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X24t4osH+dEeMhOfnmwZ9P5zSUo/8nicJQuTiNuriIY=;
 b=rbBmtH0cSCZrBbW1GdKlstGdWzUTlrFnIZ//MHy8FLAe/WFZMT30GydFR4ImvYEzAq5g5vDeeohrgG6QWZwU6IGtB+dyedtR1qJB0V7wFSoAMlxV/nj9YzPT9aF02rZjaV9gkxt+/o7omvcagwEv4bUNKfaWIMyP0cSkb0O8yEg=
Received: from DU7P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::32)
 by AS8PR06MB7238.eurprd06.prod.outlook.com (2603:10a6:20b:252::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 07:50:41 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::13) by DU7P189CA0025.outlook.office365.com
 (2603:10a6:10:552::32) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 07:50:40 +0000
Received: from AHERNOBLEIH55.lgs-net.com ([10.60.34.120]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 3 Jul 2025 09:50:40 +0200
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
Subject: [PATCH next 1/3] ASoC: dt-bindings: tas2781: fix reset polarity
Date: Thu,  3 Jul 2025 09:50:35 +0200
Message-ID: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 07:50:40.0680 (UTC) FILETIME=[2C144A80:01DBEBEF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|AS8PR06MB7238:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 31f62255-d6bf-470b-379f-08ddba064ed0
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j6Rq6TYubVtL+9d/r7ezbnfG8jlDzSAqlC+typ16FYlr3Y6HGFTWJiY+DAbJ?=
 =?us-ascii?Q?iXruory7S2l/cGwatc2A4qWgAzUI38iPpAsRmYfGlO9cXY0x9s2z/mYjT8xp?=
 =?us-ascii?Q?EHoxria4mej80IEyu+1azdn+eLhK8ZHc0OEiWBPajPZinDLv2yi8P0sLD1sW?=
 =?us-ascii?Q?LIAYZOgXRvfuaaAHJBcXR+IekcKsGH+sjXixPsmxv6BFEHkO35D1hDmWPHCd?=
 =?us-ascii?Q?5P/2TrAWjOJR2y2YrMlZtTC/rep41gEji3LZWqpIle2dLR02lTbkn2QTmsoC?=
 =?us-ascii?Q?uxVr93jXLrm6MK6OJjMZyGS2MDeg5+dnp1g0581/e8bht250IX7iY6aZbEpo?=
 =?us-ascii?Q?5gjuGOdW338ox9QUTtH/n1XxrOzNFNFI+KJVRUU8OHBUQ15yW523en29OoBf?=
 =?us-ascii?Q?nbEcba2fgx98wk7lbCz1km3L3JFaqPI1+x3HRSp8GQ7phpa1bCyxdPqgSr3S?=
 =?us-ascii?Q?Bh6u5Y1JESW2pZ3bHsLv8PW7GOBo4xY5iCQMzQXnc1owc7QqCC+uchGlK+uA?=
 =?us-ascii?Q?gcVCzYYC+c2u/jdK4EtQ4DsItvlUA2xyadpuanGShCM3WxMccEgcQ12IqPvx?=
 =?us-ascii?Q?cMOjXoQut0mAT391xhrZZuXlhUELAkxr054X3QKYvXVI6KHw90KlrJv/NJjU?=
 =?us-ascii?Q?ewgn1+mstynB3/piVtqWlr+P11zgm6IllF1nmircSdU2R5XQ0AnvdU5umfvR?=
 =?us-ascii?Q?Bof4DQJDMzct7Q0Fs+EFkHJO6yV06zJIUyR5e6rerGncM0ci9083/lvAY4u4?=
 =?us-ascii?Q?kkE4fJZojSs2HMomm8DflL83gImOmgtgXHVeCGLE4w5peYF3pAzf7VNwy2ro?=
 =?us-ascii?Q?vWHHp6WXoHQORQqTwTtzg4Id7B+msrhldpZUCCamWpaK3PBTN3i6MNCxu7XQ?=
 =?us-ascii?Q?ApLVO4rGQkFu1D1ObUgM7CswHDNbZXKqRQymhA0PUC2d1bMOXlj61gtOIfRe?=
 =?us-ascii?Q?UZGBHzO+jKTmytgb8Py2c5pGNcB4a701JYfLwHd9WmNT6dgPbBNJ0MQ67VBy?=
 =?us-ascii?Q?6Uy+Jpr5bGystAR3uETRKpPnJCJ0tjdGQr0v/63OcDtNZd+9jZ4ZcRU3LgkI?=
 =?us-ascii?Q?LqKdPEq0WjRHAKuE/1emSMcRZuiV26UMp9GVp1W6eNriShf4qQHSgaPaFucP?=
 =?us-ascii?Q?TlPHAFLv+wen/cBY3heKMAIaNct/63RAMkQvoLYvHFcjCivM10n7bhM4Y+/G?=
 =?us-ascii?Q?t6Caq/C+vB1jjrwzNm0Q0BxfYknG3P8DyMeC84llYRDDnxvpayqLt/99Oia8?=
 =?us-ascii?Q?EDs+aLELU+3KrBbmdlJ0/6xCoRNMIHIQO2hZoMEUIjn+3PrXzVOYBefTFHji?=
 =?us-ascii?Q?d/1hWNESw7Z30VV1OleQvgHbZwApq+8YUhtSwCkoJJrYuydkScXNLBAtJaK5?=
 =?us-ascii?Q?JhK+/QnBQsZITaamxGdXNpThrWXiWBuFWc8NMQS75oYZXa5DJZzn4xfhS2H8?=
 =?us-ascii?Q?0vzr8C2wfPz4ipN5m3uzRci5q25//1N/tDkPAB2l2LK/vW5x1eoXPKYvn+4f?=
 =?us-ascii?Q?hwxg8FIJrsc5KrdDtlT5nrLt6bfq68Mm/uq55Io95tqLM1rRHIET6WMpvw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:50:40.9934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f62255-d6bf-470b-379f-08ddba064ed0
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7238

Both TAS2563 & TAS2781 have a reset active low. Yet, the binding wrongly
indicates an active high reset.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 Documentation/devicetree/bindings/sound/ti,tas2781.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index 5ea1cdc593b5..47f5d3c6339e 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -116,7 +116,7 @@ examples:
                   <0x3b>; /* Audio slot 3 */
 
             #sound-dai-cells = <0>;
-            reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
             interrupt-parent = <&gpio1>;
             interrupts = <15>;
         };

base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.43.0

