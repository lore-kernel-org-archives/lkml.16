Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225FF253F32;
	Wed, 30 Apr 2025 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027408; cv=fail; b=RocY6LCLVHqnY3CEB+OjN3RzYZqtGtsG8DuR1lvZzs5zKt1p7VjEo7vsrZTUbXYWbkBnp6Q2OgsoFSpasy2+YkopLn8NhF4flqs+ONqXzdkJiLPCGJVXgIc0EnpseJMP5Hw3rVKVcpDWRqkVeRmgSAK4XVumjK6/ADK05YnQ1r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027408; c=relaxed/simple;
	bh=x79UyaqklWbVJYAxyDqGQExd46nX5y8rQC+jWZQokYY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QNcMHscqptv3nuUFY1w4ExS44xvHTaP1cLD1ZPV0i2JkOMm9whR1yIVegE9RMoRcqwlXR1rJWGev7UirCI6h5tkiQzrQ+Wvetm1U2IGjEGfqnqqi0fBQja/zUPWXkAWpT6G/L5xVlSQd0VDD36whDvN3/bH5JAUp4vKDYc6XCKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mt0Q3WUD; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mt0Q3WUD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reoURxNSR8tigleCQOvewVt+NaNCkdLMHqg4QSUyHz/gBGsLkdeaCml9rXoDHJ3hOYQS6w52W95oayIoIkybiRV8rg9GUdkhRXiA15yR/xtZkQ999haKU7GYxGE9lQ9+rgZGyzF7r9FwnPSbUyR1nJVEzEv4N8FkrRv94wwBHnT2ZQihpqMoSqGaa/RvYSrWBoFBGZeLz769MYLaa5evpydDkzkp2uNbUXhbITdaAeJZJSqgW86S0lW8OxN3BtDBBdPS8au4Pi9LHtK6PNIt+LR44gI1KfvAAAq/q4wlU+dwi0sVY47wpWbisNGXLDdzpX6/voUgHFFYxYtPqjCo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skMl4zQ3Q7v8+67T5EhG9c724MlSUpoyqiLNRIxqYqA=;
 b=WJm5xMDr3xWr/JY+lfTiikyFF/85xXeHIZsydUezl5HOCQJe+qCAXaujS713sZwl42zFgn8GtMsiMjcetK+v8r1Wv+13jziPB9RapVlSj4K2Qs2v1SJkvvYFHE2uKqKo4jiD0JSkwV+NaT245qPSXWiKce9CxZ6jLCLqauwcMCLFAOCTEwavyB6TfBgMgvLw/GweEuh832ebItxUp7MXxi4mxD3iDB6Va+jlJZs5I4vdkVf7T4+CfbZhyAt2bsj86ZVjtRapOVllidp9C0rzD+yV2WfkRrY8yv1tg9gUzYM4QaPaRRNbHjYcZDnaVzpH/GMfgJxJaZYu9COyfRz03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skMl4zQ3Q7v8+67T5EhG9c724MlSUpoyqiLNRIxqYqA=;
 b=mt0Q3WUDgZLoL6FsyvZncM2vtyJ0onWpaZ/hJi4ih2wBEoj9fcLYzRKsh1sG/nnLS1yM8M51yCZ2fDHcZrxQUutmy4GgeWgUWIGYZ5mbNtJjln6iShKVGdWNyFo7oo8/ui9jXMC0a3P9AunSd//LTR1WtJBw7Okxl/SxBpJLDVRGFCoxcihgilJilkGyTGq5R41M1280LUaVwELn8ViVCXFNHscL3ONXb1aYUdUCk27uaTktdyyLhvxJJ6a3uVhgTuY/eh+zH5jZDD/7ji+X1mlnacpC+zUVyVlEnw5nexcUUzJ9Ws6bIrMtABlOVvvKKVaxqUygsKnn+16PFlnrNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DU4PR04MB10742.eurprd04.prod.outlook.com (2603:10a6:10:58c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 15:36:41 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 15:36:40 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/6] mfd: simple-mfd-i2c: add QIXIS CPLD support
Date: Wed, 30 Apr 2025 18:36:28 +0300
Message-Id: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0032.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::9) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DU4PR04MB10742:EE_
X-MS-Office365-Filtering-Correlation-Id: f9581a9a-a3da-4039-c981-08dd87fccd17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IMX+VsBGq1GCTZIs8w7VAzuvc33OtpoG+Bldst3maI6Rme7qoP63nsRT0f0v?=
 =?us-ascii?Q?35slmIiuagXsAtWMhD+1agNbSzamR7aLkBPbDzu0utuOYoWWeEuxupjNfhTL?=
 =?us-ascii?Q?mZHoO46DUFzRXGGV7/rpvPxTvRAuQr4hme6wQRIEKR1Y1ZkiPP9rVY3l1GYY?=
 =?us-ascii?Q?Mj7Cof9o1w5vySBECDs3CwU62Nb5uwakwa07w+vpBScbvo0aO7nuFPCiXclZ?=
 =?us-ascii?Q?r2CbX4nqHnpDFIb0uR3yWvvwB0N1237LWhcjCUzLdmgAsAQ0dVvs55aS6jYF?=
 =?us-ascii?Q?ZKNcYIUfifGm/MxCHLhdZ2Y5vOZGMhchwVg8Xc2rxeRw3afKv8kYEIs2jFdg?=
 =?us-ascii?Q?yJnBiJxWMaq29LYmMOjPZoLxLshGGqw0tdSxnLVLOgmV8Hzjnm6C4be99WOE?=
 =?us-ascii?Q?08XyvxUXqn40orM/NQ6wdt4otcMroHDtL/nGg4752VGEWt1+vNT5VkqHppOX?=
 =?us-ascii?Q?162KcbXaZMZ+VSEb+0ywfTii9LpNiAcaULTqjStiobpTG55xHEuklVefJ8va?=
 =?us-ascii?Q?OM/mdEdKA897c5ZfoaJxfJrOLqSF9qrLQNHjET7+f4lmrHigrnCQpmfk8Ddn?=
 =?us-ascii?Q?Uouigd5hqPgAD1yQp4zckF1euyKGE+A9C3HWHQNPsfqdaEgz8AjuDfGhhGHY?=
 =?us-ascii?Q?QwA7HQvEgtqMwpuwGYLHtAVvGkjfueT/ACk4xy+/Qg+Q3wF1p7dubnOHz/gG?=
 =?us-ascii?Q?+Q1C2oZzXsc643P6zT60QvnMBK1WdwHmNp0QQ8qbV7fJTTvQDyKR+s3QLzdJ?=
 =?us-ascii?Q?7uVPMxlXd2V1fIeRenDzEeP55kFd6Rz70t3DgewW5BIPeHltplw/7GBInJXS?=
 =?us-ascii?Q?nxvlEkbKyygI1XAqx5+YFBX+Hnu3eaOmG5EeKiDZWsQx5qrS1H4XXa++DSck?=
 =?us-ascii?Q?tUPxNhxhNdrNlmQQBAGRqtY6MWHO6dDEbdT/RnUjOxVHAnXmuRrKupqpLcRm?=
 =?us-ascii?Q?6gf0KTvrjqP80UJjwkmUfgkWWXMR9DyF+aXMi3oIQrd+SFQYuq2r3hfyYqpq?=
 =?us-ascii?Q?Lsb1R7/fBjnb/0xr1DBdm8/pL2liOR34dgUZR2gFPvmyy3IqsNf5VhBw0XbV?=
 =?us-ascii?Q?BMkJcGDIniE8gHQLdnmUowzWlN2jiAzNOUkrl8mx/fmgUw7N4ZOqXiRBmvvs?=
 =?us-ascii?Q?yqwjIObYxGj1IxU+fWNy87YMAInq1fUXTV1oLusEswXXspVWDQdEq0LWioy4?=
 =?us-ascii?Q?K+074dukrzzkFlyRmuf+SUWb1aZmNHWNHYkOo80Ef1e9ti8lCjsoF80KImu1?=
 =?us-ascii?Q?MQGc8NPllJVcCGyxmXZ8Cnvp1SeoH7EOLRPA+p2+VRQFSgafJNjosYMcHNzC?=
 =?us-ascii?Q?LK58tliFtU4P7W/Oup/KgLwZIxSXtzuWSQfxAjzn3Imhl7Mja4RTHJ9WixIX?=
 =?us-ascii?Q?1hOK552K8qHx6qwgWtL0Ogco4EZmzppVGWY5OHkplDJSi4BX5BxHSSPeyw4W?=
 =?us-ascii?Q?+cSMp3amhfc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p/Zi3/mtGZIjdibKRee7B/GvXaLHBgAF8y3yr44qmim8n1QEoy2k+vsgHQ/o?=
 =?us-ascii?Q?NyIXJlNtYqxSROu3Tw24/R4MgNNvFt86xvHoaEpvVZX/ChV+s2KlO0S8OB50?=
 =?us-ascii?Q?mASNsd3AJOXqzt7nBst9Sw2TIEluQxaKD74a7jaG+u1aEbzQT25QxynDRqYZ?=
 =?us-ascii?Q?Ms8Tp4eK0rtnK0sQ1xvKtrpa1P3HpJkJm3waE3HXU4QeW6tdd7ramTdPrAw3?=
 =?us-ascii?Q?GAPSRL8p0oPt1b/MvtqmS0txF4/3QOLAm3wHHhQz5BfbmxxGKGnHm0ZUGFmA?=
 =?us-ascii?Q?4jV0p1ZOERO30A248kekf5+YJMnbSLxH6+OsU5NzaADMQQt8mrpf/l4ja3qB?=
 =?us-ascii?Q?o482Thw0byVF41qt5xuE54Ylus+vp8sI8E3a7okPI9/EM/CnAcNOcSe++FB4?=
 =?us-ascii?Q?e+lzZhWIFAygxK6cD7Gp1YGRDgc2qzKtmrNq4ELunZGwBEB+8mSKXY95Kc9f?=
 =?us-ascii?Q?bEucCeuAQGZu9vlwviMqGkJzJNCvJtdBML7xm4akMwWSMdeHGUk1HMURapKI?=
 =?us-ascii?Q?OkKmA+T/3zbOv5cNSFpkA1BIz46NepYmHdk00C4OYTKHVe/4w4lVl1WRlAKj?=
 =?us-ascii?Q?7UAazF65iwmpaHCYJKPcuAWIr7jNTRnzEMizHWmIP/X5S9pgUcdRLgr4Z2hl?=
 =?us-ascii?Q?evbCGNNY77NTzQ4mumg0oDdddIN9JUIoDUNuI1rcyT1o873rLezG7I6HoqEW?=
 =?us-ascii?Q?B0F289zDYw+T/nSO3pW9haxaGa0XjJ3kt98Qd3i0pqOjjZuRwNo7QaKQwk66?=
 =?us-ascii?Q?SDYJRKT4mpNJTFYMV/CmH3L+uI0iDqDC2lHqyNnKebDjoO1B6WqdGQKWkf5a?=
 =?us-ascii?Q?7whvx8wtOr9lFGm4fI587PCeXuN9Mnh9gDVpdaZeDIqpGmCHBDLpH4BmeHtu?=
 =?us-ascii?Q?h8P4cM5IXLH/qckipvq7JL5Bb6F2/FX1Fyf3A9qDuJNYahIgka6eY6rKNGJx?=
 =?us-ascii?Q?cals64EZvZC8WPo8d4hg+IVCdjHUv1Rdz/AhTZuHixz9ZYH15QwjNLsDd2BM?=
 =?us-ascii?Q?rHS5v/qoaryrlnAVzPb/VFCsTjK7jhlf7sGHjp5JsaVixcSWQ725nigjGXJV?=
 =?us-ascii?Q?bAUihED9g8Pzg99uEWF+nifPHb1ZscW85baCHmC68Nonqa1zgEvIchZGNZPr?=
 =?us-ascii?Q?izY5lua2rMOKgRfJVjrpFmEKv1PeAKs6Fs6V46powd+VxuB/EQfUz8ADPeyf?=
 =?us-ascii?Q?oTMN2qbA58KigQdFjfAPX0Weuqm7G72dk2mgbZcNLeyxEqG6tdC9xH6GOIoE?=
 =?us-ascii?Q?pb9CgiwxK2T8eRIUszM0xJjIpw6Meq13AE/n/QRsolKZ2Ov85RBlfG8S97S8?=
 =?us-ascii?Q?suEt3kXCeXKRX6U61EGFU6Lf29hpbCTR4okzsvQrvDKyfOk4D0Tk0RZ2M2y+?=
 =?us-ascii?Q?05kHftQ1Z5jdlkHXsaiqLhZKXabA3ynuDIqvE6U3Q3Ic6CqUasJu4GV2zJpH?=
 =?us-ascii?Q?tqR/tvlOYlfs2GHEU4pVQn4P/wNJjRvPbxTZx0EBtr6AoJVjOooqHt3ttC44?=
 =?us-ascii?Q?nxnPzISlT3j6gOPCVyN09F9bwQd20nWgaBsoSDwQPfkArhTUk4HMni2JewTn?=
 =?us-ascii?Q?6QwexC44sLgIIw/diWzLif48AiosSJnLfS5rOS9a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9581a9a-a3da-4039-c981-08dd87fccd17
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:36:40.7647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdyNJLZ6SKIEG+NQBHgwYaTo7XYzgaxGpTXz3d2p++dH5aMNonEwhFrrcxSIZIdpYNVWnUVG/fdCAunVsucFyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10742

The MDIO mux on the LX2160AQDS, LX2162AQDS and LS1028AQDS boards never
worked in mainline. The DT files were submitted initially as-is, and
there is a downstream driver for the QIXIS CPLD device:
https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c

Since the HW works with the already existing
driver/mfd/similar-mfd-i2c.c driver, extend the list of compatible
strings to also cover these 3 new boards, instead of trying to upstream
a duplicate driver.

This patch set also adapts the DT nodes for each of the affected boards
so that we match on the new compatible strings.

The last patch describes the two on-board RGMII PHYs found on the
LX2160AQDS boards which make use of the MDIO bus found behind the CPLD
driven MDIO mux.

Ioana Ciornei (5):
  dt-bindings: mfd: add bindings for QIXIS CPLD
  mfd: simple-mfd-i2c: add compatible string for Layerscape QIXIS CPLD
  arm64: dts: lx2160a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver
  arm64: dts: lx2162a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver
  arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs

Vladimir Oltean (1):
  arm64: dts: ls1028a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver

 .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
 .../boot/dts/freescale/fsl-ls1028a-qds.dts    |  9 +--
 .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 28 +++++++-
 .../boot/dts/freescale/fsl-lx2162a-qds.dts    |  8 ++-
 drivers/mfd/simple-mfd-i2c.c                  |  3 +
 5 files changed, 103 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml

-- 
2.25.1

