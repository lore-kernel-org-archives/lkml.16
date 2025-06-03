Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012064.outbound.protection.outlook.com [52.101.71.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6941DA23;
	Tue,  3 Jun 2025 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963582; cv=fail; b=euANzUlSAMmBlKTIw3RbfRaC9A790+Re3dGn1CDfJq18y4I0yUq53wkUJH8uxts2I2YFfNlZLggvZ1ECoqs5dtKzRW0r7/7XCwjCq2eNkPjiH0DIF2cONpZw/MBIraNlBsXh8FAb/Lg8NPYuUAMoGRI2wIPKNshhXWNc7W1gkI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963582; c=relaxed/simple;
	bh=lXpJBNrS0BCuSXiTNUiSA2WBCZovLKCFEWjSvoK/Nys=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lL6Ush+48G6w5F4e8C0esJnkpJV3XqO01NB/lfL1rwK9d0clBo+sUNJiKL60pDAyAxoxr1ScUmyaQyYMCFFFw53ZYyPao5D0RBNf6wDQzmMDzB3AlZHp9CPj4SGxm6VflKw8LciEnxYB+PSWcFZ7lAK641XL4IiaSNZVEzkvP5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CK8M2izD; arc=fail smtp.client-ip=52.101.71.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CK8M2izD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wF87f4OdxDMycGAf4rbzH8RHQ+PAP6ZMa2it72Y6jroVYsu9FB2vdd6ue07YDFD3LNh4mF9CtciF2a32hX2FTqPCjzDl554WgTIwaalrzEAj9q1oQnyonK2WcySbAiZ6VM8Z7sobJ2CvVqzZcNZFWuLww2yT/9r2e2P0xTh6SE8fYngm6tY800HhYWgwWNb5eR9qIKOFSv9ekzAVgnOiLbw3VvuuxubvEfi0gNTul6zCmVkf9fXIaJHzwLvMGHVwxtXUf4JursW45rliIvz+6W168v4SeDJe65VjZxM7SYTwod2+0GWeIgqF5MaSEvcS8hVq9+Bm3RNyLGA0PwdI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMeJsRPB1iKdMfEdnVQghbx/iRnAPbzPhocvHbC4Cpo=;
 b=rrw4C6+TyQf0zzfCdz8f5r93uNKQsK6q6tbRqX4SaQTA0trlzqtnTSXtaxMGjv0DDnrmkMTMH61HRm3QCdfGQtW+2BNRkLQmfpBDAnVLAxAMgoDcvAPi+6BPsCaHo0vzj7t1J7pAGn+CrqjXyfqGJphS8aHVwMyfrYz2EZb58spZqoEpTNy3VdjQHxLTKO50xZMI9aQKZzSyUgpF8ajLqs3vC1MPdfBBSKu/FEHF214enA8nKeLppvdlLceSB+Jm/wQpsc4c1A1eCaYkJq1DJ9PFoIj30qQZoZM2SSx9pQFT5+49oUTCmbRf5UZnhYkTHJUQWIzldYh73xzMD6XooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMeJsRPB1iKdMfEdnVQghbx/iRnAPbzPhocvHbC4Cpo=;
 b=CK8M2izDKyFZ5R9ptP1vZ8VZbf3VIjoOf1NuXy2g4im1rkcI+4Mg1k9cqGYWe+kf6ks4TRYIx/Jpai/Og02J+yviUODoH9Xy4DK1096WXOKxy+B3fMekozo77j6nFVJ0nBh85erNV6MyRA4hHzv8b3QsBVsJ+wECmWoElyg8e2U89Ju2PYDc7qr0RfYmAmsWhTYvqLvALbW0RtkCJpDke80okY63yjj/G+b9TaWK9RnSIYeGAHKSdwuE/DdRBKZ+c+CvfuwVdsp/ALOWpzGUTfbvP9H59gBm78718KjQD27FE5YA+bSJ9pefJj5qNb07LV0yb7IcRnDFiiCRQPcULg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8164.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 15:12:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 15:12:57 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	wahrenst@gmx.net
Subject: [PATCH v2 1/1] dt-bindings: trivial-devices: Add compatible string synaptics,synaptics_i2c
Date: Tue,  3 Jun 2025 11:12:37 -0400
Message-Id: <20250603151239.1065763-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:510:174::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 5159f490-39a9-4dd2-e02b-08dda2b11f61
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?FIW5qSpyGElKkcTJD7Mri5LPbDf3Inu8W8dWGQpfxauM3lUXagolc4OzQUcg?=
 =?us-ascii?Q?mODlbmC1dbCte53qAVEX3fGiOkVf8X+JDtRHBHvs5IhDX27IlLK8M/el0xxV?=
 =?us-ascii?Q?U6Kt3Fbsc4C68EPutmB/owQs/y9S2gkeA8fhXt3znFBtMkjxn4eZeYQl6vqN?=
 =?us-ascii?Q?/wCCk9RgzUr9mmX3Xfdg0Iocw8OMhyUSSZSdzEDBcAS61ej38jv45B+J3OjS?=
 =?us-ascii?Q?UTjUcuHqIJ7vTbrbHHj9QLGRkpd0ERv5waIm4W0Rj+RUv42L9p7cD7BM860F?=
 =?us-ascii?Q?xC5n87Rh++Y3fmR019Ve1MTdi1FxHH4It8FK6HXVslvn2OGCbHyh5wWdmWX9?=
 =?us-ascii?Q?VRsXJ3QdNEUPR2iQYiOpdk5DlkiSbzgwgfv97ovL6wUGID53rXU9/a4lnU1a?=
 =?us-ascii?Q?v5gB21yLqt/ZpUwVVGbUmkOG3u83BVBOucwVoL9VJiupOMULC4OHmbw3WuHw?=
 =?us-ascii?Q?cf6fs06wQPK3VOtxafV3CmIWrvmdewRY+asx+9kwS0NA411s2bxpNwdt2Lx8?=
 =?us-ascii?Q?/OiaiXwGBThzsbS4ck/XD0kuYXu85Gag+K32WHTv81giUebyjio/lObgZVy3?=
 =?us-ascii?Q?0p7eAtjBeEMBzFnNagO8z6Arue3b/r9/A+srEF174uo81vd1eHqhg2WZcqTX?=
 =?us-ascii?Q?HPHU7SL4q8b2DVi3bjpTrjCQ8vjbR/t1c2goi7y9KxW2B3LEe6YGRN+9A8rJ?=
 =?us-ascii?Q?gaoAKYroJF6U74evAUxPk/yTmlRPsqLpScM+e/RhNsRfEuY4XuUu5ddEoWUo?=
 =?us-ascii?Q?TN9y9iRdUJi8ZDnivF3Nra2LjqIOzkmKDONdi4S/Y+lRD2z+x5P0NBoBm8a7?=
 =?us-ascii?Q?wZZWy+26UWI7F7vdQKcg2EtqAmHiWrDaTuiueyeV2NFfxEsA9vD4jIVhUZRt?=
 =?us-ascii?Q?6uxm7u3MwB9CMFeW0ECZsaOHDz/jXUM3G9b9ox0IPaJA0wmGZtCexFtLCDV5?=
 =?us-ascii?Q?tNSz5IxxyLguhhKRuAMtXZ37Jyq4hbIaQig6YAmz8E+U8UXnGC8OVaaW3cQp?=
 =?us-ascii?Q?resdmtoByZV0vIlaoKBtgUqhcxhNgaZaC6Pz3PX3aNjSUr3eSR94aPo7Er6Y?=
 =?us-ascii?Q?7R0CB1Tah5GCxQXnRwwtmRV5PfVRWIUfxIoC0vSua7btO/9TWzZzTq5tO8mN?=
 =?us-ascii?Q?lxmDH+1ldzJP0QrGH1/ilFb1ZPBevGk37rOfJymoyQMaXVsKl4PJkU86t2fR?=
 =?us-ascii?Q?jfMjAiknWvwZumMLWYS7E7FMhmU9oe5PfzK8XwsRjb+NaQwWe1eFxpXTDpoO?=
 =?us-ascii?Q?fIflx7Okt5OEqaj9esekh5AUFgwNbPyQtt8lzE4JnJW1AWpp0q5GxHErkZNE?=
 =?us-ascii?Q?//8ZbNAP+rzqGpqo6xGE9gCV56b+SoGVSd/pr4NaWaLRDimmkY2j1bMYZqYi?=
 =?us-ascii?Q?vizXxv19puY3foUlVW8x/C1Vc2jFrGNNfEBVRxuZxTuLeF2CWTdXgzLzDub7?=
 =?us-ascii?Q?zxQehfRR0RthaiKXj0A34fURUzNWoJsxDl6wo6v6890xnzi1TwCAPfVxDOZP?=
 =?us-ascii?Q?1kXP9lo15nES2bQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5IXMoG/fu4u3HKaAp19uh5AJqRwKoKHSJH9OUqiArObTHMcWB0s6Avh/NsMo?=
 =?us-ascii?Q?p2hgS7LpXZQAds72VNaHQsJ98uO4Zaflf93adhxneB7NMH4THxZDhWtHv9Z8?=
 =?us-ascii?Q?b5aGCIt5Yr21p4VIvUHzHRkRHha6cmSlvuwUSK7hjqp2KcDAeQkJwc3awQeZ?=
 =?us-ascii?Q?bJrvbkxRO9UzUkRpN5A3j5tZD0DK3fqP1pOfO9nalGOLmgmMBLNlDX+8xOM6?=
 =?us-ascii?Q?x8eoqUW/JrWxvkjUQpW2lBRWNUXduq6lt5Jl7HiGJNcnOW48PWZUXLS/GZGb?=
 =?us-ascii?Q?VhGXsyjjM4Pj5M0TVsNpFASu+OeJUC9PNGoanTs/pLvxh3lRyRYGO6+XjzVf?=
 =?us-ascii?Q?g+S1YlFCI1b2J12Me9/8eofy/VYrHbgMISMYxa8lfpXiOTs0PlSNwb4jRQnC?=
 =?us-ascii?Q?yrDG3Ng7cCP6h01zbGojpaN/0EVogZFvmY6QmlU2aMKsJw0Mj8QucvL6OW/2?=
 =?us-ascii?Q?czhsqnvc7NqYN2Dbt2E+eyKvGm231faFIPi7bC5owGzlq9fVma0duV9e2Ov/?=
 =?us-ascii?Q?HwZUkpHTA3hTkbIi8GkWsDJLiKPiUdk7YI6ErzWbaCvt7e+e/08TH3t0ScEo?=
 =?us-ascii?Q?f/n7PU0SHBIc3/wKMqnAUnkJYNmX2F29uqk0vFtEZ+d8f8FX97UqoeGSZm7x?=
 =?us-ascii?Q?QR0XN8lEo3E4dWN2LCOV6XKQZSD2at+1nkMUpzdvZsirJ0hxqzntPvtiCaTa?=
 =?us-ascii?Q?23rWnaQ7kIj1Jma4zVMymVzCtaQWf7FzQjojQaESLsSNWMbBE6HltQv+d7l6?=
 =?us-ascii?Q?9Bcw7V16OnTam8Js8IC1pZMfJbHuqHA83Kypi9RaaBWv4uRK6iS6sg1cEI1V?=
 =?us-ascii?Q?Vcyz4qKAgELE9Uj4y+dn+D4Fe6bgsLntmMH0ppEkmBFBm8MGZNuLrukYV15m?=
 =?us-ascii?Q?CqUGK2PoNiQqaf/UOAw5htryGSdxTlm32i50LwQ1X3/ZvvxgXtKTDJcQ2Z1X?=
 =?us-ascii?Q?ObOmCgW81/1kcJJbpmSHGZ9a14cbwLLPp5WhVuOo2XBKWJ+AGpjz67g44C0V?=
 =?us-ascii?Q?HRp4enzkQaxVY3+UHyiKWthgQJtVRK9HQvbTW35XKgW+IpgYs3T5i/QMmL5N?=
 =?us-ascii?Q?D8Aa3fEcRnS1iteItYrXCkMgA5GjUSeUAkQ8X+yDls5/oeSNfnrh86bKjDVM?=
 =?us-ascii?Q?WvJIcIXeEnzOuYfOzP8tlqFFdh01v/X6RpJaW/TM5Z2Rvio4TbxMGZmI85lh?=
 =?us-ascii?Q?iZzaRRQJLlDfOgTXROG44/jS0cM67e1cSlAvPxjBI3nWJLNqDs8WhQb3qb8v?=
 =?us-ascii?Q?N3nKzhGYAQpKsjuh+4kDWP5P+8C0v+e4zGucflERmsOzfRHyRYmY+ipelmrD?=
 =?us-ascii?Q?6Y9QDYu3LeAAFmKdks160p+f1GuP3/d/oCYsxhrv6iWn98aXpbp9oXgIEFSN?=
 =?us-ascii?Q?cyjFaKEZFAGCKYUZWmoQlde0a469BcBih8XhITf1ZzC1Z+lauVGn09MzY7Ts?=
 =?us-ascii?Q?qovSJDMudXjbTxX4Q57fdCDs78Oj7t+rQqZBLeFp46aXfoFzGgM2IORF3UlM?=
 =?us-ascii?Q?PkwJ5I73eJoby7cs8QYBqwC2DVyoArHXbGtLFiJEn/Mfkw9f1E2FqiJ4fd63?=
 =?us-ascii?Q?bJj13TSQjRg1ns49amPZT8124SRiB54Qj0QGgaMf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5159f490-39a9-4dd2-e02b-08dda2b11f61
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:12:57.8167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OTJhKaTGAJp/UUicfiFnRBSzNK6yEyh8R6Kh90EtwwUQeT29UHNi5J/1fZDpCqcVs4ti4KinHIfdQtkYxsNxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8164

Add compatible string synaptics,synaptics_i2c for synaptics touch pad. It
match existed driver drivers/input/mouse/synaptics_i2c.c.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- update vendor-prefixes
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 38bc1937ff3c9..dbec1300bb7ed 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -362,6 +362,8 @@ properties:
           - sparkfun,qwiic-joystick
             # Sierra Wireless mangOH Green SPI IoT interface
           - swir,mangoh-iotport-spi
+            # Synaptics I2C touchpad
+          - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
             # Temperature and humidity sensor with i2c interface
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c..5b9c7ab6d8185 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1496,6 +1496,9 @@ patternProperties:
   "^synopsys,.*":
     description: Synopsys, Inc. (deprecated, use snps)
     deprecated: true
+  "^synaptics,.*":
+    description: Synaptics, Inc.
+    deprecated: true
   "^tbs,.*":
     description: TBS Technologies
   "^tbs-biometrics,.*":
-- 
2.34.1

