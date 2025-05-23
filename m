Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316201CB518;
	Fri, 23 May 2025 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748015599; cv=fail; b=X5BeRVr+Hge05XeL2sW62/k9fbI2QV1hihLDy2qeSJUslKmbGNBYEsb7H2qCthZiQuGU+Bf85O6GHX/QvcsMXA9fjS7pk06TM1jjtBwOMdhptAqAxeRgXMqgcMEQT0onfBnTG9rrxGS85tk1ke9KqfSEAMuiUkrbu7VGMm79V/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748015599; c=relaxed/simple;
	bh=YQaglPp3/5eedMDstlpUtSsabDp1vLTHdfpxoCbgA2M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LjYj7VOEBYDSpTW+zOpU7QxsENiFXh/CI2W7meKT99tdj2wfGagPuTZPmAFd7OPOXEHTVlVUm4doaSVjyE82TabPu5u/z8AWw3CjgeMwdkVZrdRroSysUuUtQPE3SAYz1ZY6NoFvmg2yoDIFW72CykLC65Ou6UUlPeMiHQ4pZu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hZYDlneD; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hZYDlneD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qeb7bcxthtR7IxMOBSD2+p01fHhgnRdYR+4heof4JYgP2KoBO10uN/W9/SVI/8cXfHrRghlqj5p6hK2ws3CzZK6bLTeVlvFbwcgrK4rzkIeOVAWQ4plYPuOpxHYW6Ht4MLo5emBIjeaJIygLHrDz0TbOkiX1PgoZwYZcCbH6R2DPcmjL+fGzNcafBl8h8OT60CU6PkSLWzCVyVf7IONTY+SkX/IP6Kj4ymJX50cLlzodIaU3nyO73m6Htpf7kGXafUChCZWM7CBaEbbARehVHyOW76KG3tG8U+4Uu5ZrvE7KSi3+r1qqtwSP+K4QQEbXjPchQqZiFDfsPfyBCb3F+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojwygm1nhupYslA724fkwxnZTL9C4lYsPjKz7aO4vqM=;
 b=xVfAR5S3DRuOW2IL6M6QiLsDJGrkOr8jUG5yA7kGdlFRRS0uIPjSehvQzX5wKQmA4G0glAmBh3RmdKr5zOdS8ayqlojnxY/3nIqlmFeUN/uUI3IonZ7wk51DN1zeGFU73Kxh/R5HHelxmLKdtiowsxQ+ERdau/kONK/99VqJquD/7nkmeuLuvh03Xq6+fNaWg+EbO4n3lbNaiWvyNxeU7Ae7afkGzHcl3qx5pMYTFCwbAkI3I4pkTWtkqS1pcMj3/386FzYsJYH1GpNNbJy3t+Jj94kJjEXX3HQw+N/EwEYxeh23XGHvfOdWZ52qqVeZfSDK7WIHl0SB+zjCY7W26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojwygm1nhupYslA724fkwxnZTL9C4lYsPjKz7aO4vqM=;
 b=hZYDlneDXmXkURvaLyeJE8X2L6xzLgS0UhksYh4GV8q+iO24xoW1mJ0Avx2+6Y9InKtXKWvr4mR15RakU6SRF5NvEXinKbetVBvBVWkRV+B7fznSZqCQfNFlkf7G4sanfSInq8dUWFEyLVE6/JDPyH/bFwxgXiUe0wX2nYj6K83P7L+yHN/yRQ4+Er2v9NTHS9/OrZU7rJ/b5XksR5OT4qTmFSecNThB2VDJpVDl0k6p2Q9nBJZIJAVyZZ6n1SbPE6JQK2a/0otMNqjwWLQEJG8Pk7dV1L7XHPJAvgkGvvjJ4RgTk4x/vxWpa53bdwmHGmdlQ/oxMyaHK6HT+zxOoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10750.eurprd04.prod.outlook.com (2603:10a6:150:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 15:53:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 15:53:11 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: mtd: jedec,spi-nor: Add atmel,at26* compatible string
Date: Fri, 23 May 2025 11:52:58 -0400
Message-Id: <20250523155258.546003-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10750:EE_
X-MS-Office365-Filtering-Correlation-Id: f27032fd-880b-4b94-8ec7-08dd9a11eb56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PY2Cj/BGfCpfrI7xW3dkUx9QJe36k0mUGM7mbOJV76lhp9yVvjaiyo5ckt+L?=
 =?us-ascii?Q?0xAgvHjzaulH3qiOIXoOfyWxCf43yGsLl8wOpnXm+gJDuIPjpLMlE5wNwDJh?=
 =?us-ascii?Q?+QSbC8iAm3c8D/A9m+8nHy2RNNu4XIAxCes8NKspSIpON9b+L7e/aDSUMYMn?=
 =?us-ascii?Q?eEyjne/q7YdYPy61SkNqUJs0QiDxIlSAQI3wHPfq6BiTImGNyiwZZi3IPh8k?=
 =?us-ascii?Q?gHxrZqvePuWD+wHODEvuXt6zTMjeEipuJjTkbQB44Mq/u23AAkivEGhutHf5?=
 =?us-ascii?Q?IrYWHNYk6LdO6N6UIAEhC08uiWV/jcY4fkCIZYwGssGvdGwa2dzjMY28k2p+?=
 =?us-ascii?Q?nMgFLjF1I9irlHeNfqHJaVD+66+tsbOVINDMkzmDHNprgHYARr7F75gGFQ18?=
 =?us-ascii?Q?YtjEQlwkF3zYAS/mjKVxGENWhLbs6cTRxRMkU6caO/fiOgmhVR8gs/UtIxb3?=
 =?us-ascii?Q?v9at+qd16PSm8Qz7/IW0S7lXHwg3pMFQlbi1bqjz8h4Z+fDCnbS0lZgwiE0O?=
 =?us-ascii?Q?Z3yUO6leAuumfbx3wT3z2qgZ9Ghm9byOUO9yKomVqwbLAaOu6uoPzAJb8kme?=
 =?us-ascii?Q?9M+dANqe7UODDV9t7orWc26ZtmQASqVzYCaeNRI7tWONbJeT2vjcue62Y8FF?=
 =?us-ascii?Q?DmHdn8FNRf1gUEyffJpXXmdKRbXJQGm9QNEVbYT2NJa0qyhHXYvUYnew52Bx?=
 =?us-ascii?Q?Ym9IFrpa9ffSVaL9v8UJ0Y5Tmsx7vkEv9Z7FFJCnIsLhy8rvX08gcuiSVU7f?=
 =?us-ascii?Q?H9cjMMnms/o4+TtjN/N2tbJ6RNOzohj7fcBHVCzeHut71DLblBC4WDxme/jB?=
 =?us-ascii?Q?MAIThDi7I1TukT9m8NTQc3dseQXStNP7IjXtaDOV1Ugv9XZuc0zvJwg1pQc2?=
 =?us-ascii?Q?KWkmaRSORyhpW5LUvELV+WWmxMRG/YK1DuG6da4sfbGmol/dZ3THhNee2KDq?=
 =?us-ascii?Q?1GW9BDHeS7Kg/gI2vwUXBqd8TvNcoM/zhB+QaI3mFE+rmIGs3DucUMPII7sx?=
 =?us-ascii?Q?ET9j6dQFU52nmhMzBQ9yAnBX056uhY4TbhQDmqHTjLUfjuHHMX8ukhF1iN3Y?=
 =?us-ascii?Q?EJ4tsw7dty7/a4EPRtIMU24JAvYC0tVt4YKTRkbjvETd9sh9N/lPB5jy/y4k?=
 =?us-ascii?Q?ILeNUpdfZslQPr+q6WbSWPQNcIJ5UXNgvjDfp/hDEBUUVkIte9zlmuo8r8kq?=
 =?us-ascii?Q?KaD2GF5n67/69/xb9BtDhUMbxzMd1HTjqbwyWKsjVa7mB7LVwi5JRHZg6mQx?=
 =?us-ascii?Q?FPiBttSBRXPgBq4YLTjaW/Z/DQufBZhZdg0Kt8GCygzkspxuOmvXvODYWXUx?=
 =?us-ascii?Q?iC2QUwMBVNS6/n76Pj4RP69PpYAsVmGAgscR5S3TsYY7B8V7YkjRgeU4s1Pk?=
 =?us-ascii?Q?LRQy+ti8fZpvNg8vla8WvDtwlAiy0y3md3P1/iSymr0aopH/8e/v/0fxmvDM?=
 =?us-ascii?Q?Pfly93LYFyMSGzBbbHfmgMNsuXVVMefDIH0po2ueQFtTJbanzzX1fvyWnN94?=
 =?us-ascii?Q?c70smK/xNAY+uJU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fhqMyWWytj/7nI2t5wZjH5vYF1mANSyGfw8z7z1gytO7lSjO/dpWQ2+7RtcM?=
 =?us-ascii?Q?eV8ZhrGYJSknV4vrs1ymr9oI+pXUwHAfj/srn7euP5THf/EaV8NKmrJn8GEe?=
 =?us-ascii?Q?Dnb9OHVbp7lHPT+mRto/UbLCV0QBhUEU0xQ/QXd8AwGbiIPKjjjTpc3cOFz6?=
 =?us-ascii?Q?scu6VARinn5lTNRFxn2C3OmBqMxvG6IzDwMMRa/OMRXKW1wkvJUMK0xMRNh7?=
 =?us-ascii?Q?Iqu4Gf764H3b8xgeyMeNynSnGnhLgUR5UK78uINH4C1o+r313Yo02pcyvprP?=
 =?us-ascii?Q?RWgYnLRVfr8DfqQKOl12eNJ/9/zG0FfmRaOnL9zmUF+Mpabo0VJ7axasTAmj?=
 =?us-ascii?Q?E+P9i/ygLQy6bF+CRen2+8zsZYWielLvdtYfTdMHAE4oig/uPVP7G8Akvg9s?=
 =?us-ascii?Q?Q1JLP1xxmpVSRcDr/wLPb6cHxH+blyLHCsSl80Bar8bs0/niMCmwPSsLmqJQ?=
 =?us-ascii?Q?pcwx490MSwgiCeBQRIX9QD6ucNGIkRifremDQOqpL4oeQCLtzbmAYNM8aGFJ?=
 =?us-ascii?Q?2AaJoGvme7YJQBT/egIL7AvoQd7DHRMsVvQaR9hTWqqHJg5p7imCcJAIj7Zw?=
 =?us-ascii?Q?kQBqfeBEgUzDPxX99Vvn3Z3P8v6A/H4izZW/iQooWtS2kKprVXIcstSa/MYw?=
 =?us-ascii?Q?lPhpE4Ur4H8GDy3A2uKgyJ90sVpddpOV4MbQBNTlsqnValGwM/ly7k24yqs4?=
 =?us-ascii?Q?1MwsoIMLS8I+zjhwme2B1sW+gc4hJQATgkBgLd3eTJiamxRMe5fN80j00iao?=
 =?us-ascii?Q?T/4Ou5H7OCTxBg5TWvsXnat2geBNcyuCZpHvxeinO/Au7+Nahj4ukZBarQDX?=
 =?us-ascii?Q?HQnOEyZ/pD9QJ4H+nZzFm/E1r2y0H8dXgySD51LLANy/v95ASlAVWVGa3Nxm?=
 =?us-ascii?Q?Gzms1/YJwGmoDqk6HTehbu5b2g00Xw/Uz1F6mxRV6ydq3KogbcyF+lroMGrI?=
 =?us-ascii?Q?YBG6BX08C4Cl9aLzWw6zTp7NCs8H4XUJHmaLGKQbzd8TNXpcn2WOgOA4a6Zq?=
 =?us-ascii?Q?y+dbYsSGPbIWLh5IkdOKTkhbYyVPanHIPUifARr6ovPPNmIshZZXyXmz1hEZ?=
 =?us-ascii?Q?JUB30gn+ER3Ag1BSKBiX526wxuup75e/JO7iUgP2UWUnSTJwdEZ7ZfWh8HlI?=
 =?us-ascii?Q?wiuURJ7FTogALGNdJnsyh6HzisEZlKmpbsCYJkE27xkWLgb6DEWdWNw/GbMF?=
 =?us-ascii?Q?ytoSWIkt5pQEZnY+AaJ6brpOP4Ek241ujnExa9f3SxUC/4TN9h97Qt8UgWj0?=
 =?us-ascii?Q?XUANVkFE5wqb1NoXIK0pZkudJoTVogfEQYedayXJk2W+/QdVTpdg0dfxBMCQ?=
 =?us-ascii?Q?ymrmcyUDd7+37+jngPeLDxmSCppx7D8j15eldxHe4DNsWyGXbZ5+UiEhw7gx?=
 =?us-ascii?Q?YHWlYTBHGPPVIvcV2H7ucsBTiTYx8Pn4TUEZNGWfMMQ1+ZCLbilxfnqy0hkd?=
 =?us-ascii?Q?7HeJXODz3IyMPB+wJTV0LBBlmA5EPUTKqs8lgutJOBUizUBEb5UOlRqtYnPS?=
 =?us-ascii?Q?CYbUzFL8U/kLCXnbgzSm17gG1XLKn1JoQEZ9BIPBnr9ArsVfiLgBjunwqWaI?=
 =?us-ascii?Q?YHntP6BTn43pxTwPgoFpSqBLI2tsPV02kXIDbKcK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f27032fd-880b-4b94-8ec7-08dd9a11eb56
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 15:53:11.3429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBLfvLQ8VdO+iEE8q+rg80HsLBT4hOvWRnay+gIULLXsEKyIPsJ/rdoPMickMWlFaKA7LBmoJCvftOzK7YQM0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10750

Add atmel,at26* compatible string to fix below CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at26df081a@0:
    failed to match any schema with compatible: ['atmel,at26df081a']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 335f8204aa1eb..587af4968255e 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -20,7 +20,7 @@ properties:
           - pattern: "^((((micron|spansion|st),)?\
               (m25p(40|80|16|32|64|128)|\
               n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
-              atmel,at25df(321a|641|081a)|\
+              atmel,at(25|26)df(321a|641|081a)|\
               everspin,mr25h(10|40|128|256)|\
               (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|\
               (mxicy|macronix),mx25u(4033|4035)|\
-- 
2.34.1

