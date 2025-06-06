Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8081A38F9;
	Fri,  6 Jun 2025 16:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749228032; cv=fail; b=PerMSvgiodaYBpe5ahgQBtffb+a+rdvBYzYprV8P5ZGi2wnrJILXkELf3pipYTVPwUsTtgZHOt9f9E3gc7NJWlLT/t+1pF3UPbB9y3zmRScIDYPSzRKYdoZcLGDxTq40LTQZx8ZPxXTEy114hh4wPvlSK7xUBuGA/9l8buaD/d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749228032; c=relaxed/simple;
	bh=7iD98/HG/w4UQ03/jrEeoJ/Af88di8Ke/3smJo8wWmg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LdPvhJuSfPSK7YhrWccXdiOifQgNlSa/lGOkdf+fZ1KM54FtNvmHAU+UNWwwxucT0vsw9FxCp0PVW+V23a9lshWOHjYpeC2n1tPRMDt3gpNRap3LcTZVE6AO/mNGvOX86xlU1QV22/zrH7FUOHAEEndFlZXJV62Psex5qjVMcnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CyPqolG9; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CyPqolG9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3psfFZOvHZbfuTb1glq2P0fS6Gfk5SJKjrbMexgHJMjgMWzif7SvchyNuzlbk+8hz7kYq1aJs5oyshdF5MP5aHJRe2LeSuKaxNrhEGTEmvciTKfoZLqVC3M1m5Ap3EzIQV0cX02dm1d76i1B3cCuE1vqiHBDxJkLe8axGx8rXFt6Jg5r697wgdn4LZb77qvnTtWZtYwzORX3UjHRPxZhaVx0yAJQ97+PEYxzP+DZxnkloKSBy81Wr67Drst+ntiyauczt/SzG7RINv2HzqShCWI+GxNeWOmwpLVHQu2tgcv7bVobZx0hoh2WoHV9xEPK9MJZXnzz3FeQ8lEeXAncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo+SHKP+oNW1ZZewkkx/csNzeZKDn1CWnGph+dPzgRU=;
 b=XiF0NHNGbF81QNAx5TA6ZnN60xUhrcngDP1S/RJeeIiA2rpkWFIKwUztO2HxJn4jPFYRrjJbuq1BQxYeVjAu/fGSjhHhSVxUv/o5Pj71f9LiXld/lfVGxV9gj+tyZI7B2WWcmwuPjNo+oZE8zZxFEyharORCZzTnYb1FV5hJpTIkqZIDIlqvILdMrCmXBkeIxIaVlOT07S4Cj2a9hVtXd1dgadDPr7GGMBd+g1a/x4Eq3AJFE8KAA1n6I/8km3cDKJwTtWPeLt+VpmESMjY/PAGYRk307+9iUPF39cBpjWQT+eRkf/S3IOWoaksOJ2cvm006tvAGePuTUwLC+vYdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo+SHKP+oNW1ZZewkkx/csNzeZKDn1CWnGph+dPzgRU=;
 b=CyPqolG9UiDwfJhD5DJCAS/VVPa8WNiFBFw1Aw/g0azz7SFOD0vMuD4RaTnao4eSjoEqevnRkIV9fKaxTyFsyZiI+6blYoyWv4Gj4tgV67haGRtGgiPpIt89kjzwAyajLkMOZEklh5DeoH7CoW/5YXYqoOYwdE6UbzV90WzZHA9rbNW/zGz2RJSIaBybHFfTiitnFR3EgM/UhN1zwb9Jti97bE5y6ir8N2PvbJE/axhuHMGdfA82iNFs4I3vGZS2iTyWcUlUY55Zdvnoyz/WauTJyOF4jRIZ1EBTo+JnJsplkmrnS3b4oVDCVEim4Uu75ueY/f1I/5GdNW05zzp+xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Fri, 6 Jun
 2025 16:40:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 16:40:27 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Roland Stigge <stigge@antcom.de>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Date: Fri,  6 Jun 2025 12:40:11 -0400
Message-Id: <20250606164012.1363896-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:510:33d::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f67da6-03cf-48cc-b77f-08dda518d791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dP0OEx30T9osozgPfOo0b1qVg3D+2FcOcILmlvS5JfKxRfrvB2EFcb3Dwr8Q?=
 =?us-ascii?Q?H78cpJpUPutXnnoTWzQj7KsqLDiKnljlyFRMEMqa6KRCEAfeXbN9GYNScG3q?=
 =?us-ascii?Q?U/AAecp5BcD5WD9g8iXvXqruXVe1MNUQ3z5f+FYZUD3FXTaPqgXlNAXu/cGY?=
 =?us-ascii?Q?/6nEkLY1s/L437sia65A6Hd5oK0zpQLZ9K2o3BnujDZRAj6p3ZDjeFpJe8oK?=
 =?us-ascii?Q?ujWROSgNjgO/KPk1k35Rv0g08tWwrg4go+TI5mqftnTV4Zi+WviKZtR0oxtt?=
 =?us-ascii?Q?QrRqdpLsBlSkTYlHWoBMfOjhm0sg6fLwEqthEuYKteQFxg4UAyENyjlmRDBv?=
 =?us-ascii?Q?tGXJTDHXznuhhE9jUGbRTHGNZTZd/7q5AU6Xn8/rKw659+k+AbwbYuAldnZb?=
 =?us-ascii?Q?RYj6JFWVRtrfMA2tj/ize6mi+hsWeUtOvhYeS+BsHRw24O4McyfUlEDY99Qp?=
 =?us-ascii?Q?JYaqT8BQil/Z5kKYHL7ypzj4795oPbcmY2ROVVoVXLbhoZ1jQw381wSzohZu?=
 =?us-ascii?Q?rCee83ytbanj4kWVZ5dyabs6jCypsEKBalB1ihQzAyvTH+rycBQlqzLrhyP/?=
 =?us-ascii?Q?iKfYTjpXcjWvhiknA755HGJzCJ2z1Wiu1iJ2pzaGMw/exa4d9H6EFbhobTAt?=
 =?us-ascii?Q?LM9mrcP3NbqXl4nbXfYHoSf5NN4tRWycEQA5UEQ/I5rr9wMxF1kJ0Xu1ItD6?=
 =?us-ascii?Q?6PQSxHGOzIvIwMfQj02lFKODuprXKj5EFq7kpTA6GA+Y6AHwc0Cbw8oRVzN8?=
 =?us-ascii?Q?sPelrFSVTiKW59BMvQvhsFZM1ch7jrKM9lbQr+Poe3qhUEf4Y/iWewjtG1lj?=
 =?us-ascii?Q?jCQ83M2C1/ZwWu6Clzmql7HaHrBGmJHp/Ht+tjRulpky8i7OlojrE29xwaso?=
 =?us-ascii?Q?P48Tfjw+HIKfCrGmWnlz1/zp0l+XY8RbnwCP7B/EKRZilzAEkpzHmAn5Urvz?=
 =?us-ascii?Q?2u1ktaxLSMLOUfeWJm6OUuW/ldKMsMCj+WXPeAe+NtqyQX2IMzhm1QaQc9Q6?=
 =?us-ascii?Q?K4t3xPVB9bDYjpBA44ma54X9SOadvGrC/vtd0+TlrDIMLki/o8leRhcIh6zo?=
 =?us-ascii?Q?INTcxptEoP+KKk5XUqVw1FqLFqdPHlUJojq8w7jW2TEOPEnLjE1X6/U3uTAq?=
 =?us-ascii?Q?Ajyvo/Y6QuwTqJPYSin5dibD/XWrS1iSrVRjDWwv45KLGBjLp3s1ivrTvnjP?=
 =?us-ascii?Q?VpY2X62KjVYYdLywTXeZXcybCRxd5zTrQuKGqCjenPcWt89J3f6tg2uZplXR?=
 =?us-ascii?Q?naM0XlzH+gn4aBndoEI9JpSvGD9qECq5fTtGBZkZxrvQSVWSTtRYDN4W9KtN?=
 =?us-ascii?Q?6/O+GF5/jTToLOi1WzMzw/wGqyZwlb2d0glGklM+yEl+dSHzqqqWyvyBGzeY?=
 =?us-ascii?Q?oGVHoZO0hmK5kJlFmZu79a5wAeJBKlu7j/Fqr1wU8LZuYRlzSs71NvIpuvHx?=
 =?us-ascii?Q?5/ZiFe8QWl73hS9ALo2TG388japmxy2eyyvFAIyPdg+JqF5XNvvTug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ipLFsO84LNmWdri3cPTzKLi0DfEF+Ec87Wwbw0taRMr2rn01+XURud8+O6KF?=
 =?us-ascii?Q?UA/9IcNYnYIHiFpbuFfb82S8T/2RXwOMV58FQW7hFV8GhkM2xpltgklZkPHY?=
 =?us-ascii?Q?DeawkFncp94ArvCooOoC8TCynY/TKcyywasQNtV/UsTH/fyPz16dYyZ9z95a?=
 =?us-ascii?Q?1jKb0ssfS2yD69HAGfSErTatZz2xI3563DvteBkLmeoZ/OqoDFinuGLSqfPZ?=
 =?us-ascii?Q?Fmu4khsbJanz892IzK/e481xcxLXFWPuD3KFw1kkFMi//TIix8FN3aKsEyh8?=
 =?us-ascii?Q?BVfHFBIgpO2xqe9La3rLCbiZQi/2fH/RcAFOg0r3zFwwvX3LFnv39/cOfian?=
 =?us-ascii?Q?+bq8rjPbxZs3pOl+C7NgBh0fsEcQVesxzPdR2tYwWvu+6xaJvfXdhpOYxu/q?=
 =?us-ascii?Q?/gYZbW9leNrqS9O6ABlxA5Fye0kT6+13syt/zTc4cONHcdVi3MLlqf5sd+m+?=
 =?us-ascii?Q?TRx+8kcqx70pJ7SgFfFgQkLkFjwiLgms4uHd14PdVZNKsewq3By+chEpea9T?=
 =?us-ascii?Q?gtio1GOscW3qY5fCVxgbZ9uXtUWzVopfzro3u7qvgngbGVTQorhXVEFTZLJ4?=
 =?us-ascii?Q?qRczsTHbfKqVgaZfSuPg7AJxASi4qPD9UTuspzFcNOnjKz/OF+1p/yS2MGQW?=
 =?us-ascii?Q?MMVdxIUpDET+5mBN6EukmxknAKWjJx0SJLzgG6n0lr544j4AYMFk93vRKjlv?=
 =?us-ascii?Q?yEe06G85BepNE8nGsv8Wb3BX9QgaRuGOEZP0Ot0PM8Erl03tLPXR2hmebnFh?=
 =?us-ascii?Q?IObRyQ/EyNw4JDXCZYgFXrPMXgzJ0NXYwfaT3+YUDFT8vOLdd960hmUBMCxB?=
 =?us-ascii?Q?yfrSF/N3W5+6vyMk7BVAt2XdJxlFfNNa0gHqKNp0vKTpzPjvZpjRVc5MLv5X?=
 =?us-ascii?Q?i1DJ9sRBeT4Ruq7CyZCeG1T3++2b4zvfbWtEuu7gBHrVGNrIBJsli6OdHANz?=
 =?us-ascii?Q?lX2AapEVM0Wz5zHcYd8JzvHwLa2T9657GOr40v9mj4Fw8gfkcPPsX2bSXZQX?=
 =?us-ascii?Q?pjUyVz5Miii/0kh0xCWCqFYBIhB7x97HulfUxrpCaJFOExKpjVYAYySFl1KM?=
 =?us-ascii?Q?ru7io17w5VMaoHInmb9KFYlmvGY86B1GNb1XEwM7hGNTmR5IQx0T40c0UAlB?=
 =?us-ascii?Q?uuWe3xKWNOGRl+M4/e1S9GKJo8mj7UmR6+lf3uCNGSy0E3CaNSp7strK4K49?=
 =?us-ascii?Q?J124eFXsbNyfPNT0pMiWzyEOOwJ5OTdmm8tF58irAX0YzXK5Nnqoo+7F+glR?=
 =?us-ascii?Q?Wa+Thd4RHSQdZldgxSJrX0RNiJ8xoIYfnfsQ2WXV2ocGrCewfqy8KRFakZIQ?=
 =?us-ascii?Q?yU3b/vZI/1EiMdSLp3PQJQxDh0W6GUJrbpuI8HA0QExZkzUy4Wdr/5LXUHHV?=
 =?us-ascii?Q?mu1VTgkIdveK1kSh5s3H09pMxLIY9MrmZeNUUUIOGH11R7w28hExmEkfjQp+?=
 =?us-ascii?Q?moWCcSrbxe7ovH2gO65kpdTzIdm9/WY0M/tSaNUTmuTHSqiIPBTwxm6T1c8e?=
 =?us-ascii?Q?V3XEXw+GlbWHRgDbqp3a96MS4loeSXr9V3W4bM/Wjw+iUbVocpZHxdaQdbRP?=
 =?us-ascii?Q?EEDns2n4B4DES/vSGjH5RzTqlSo9IBV4Ftebzl0E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f67da6-03cf-48cc-b77f-08dda518d791
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 16:40:27.3360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6XQYqCPGqYkXzObRhC9Pwb/32aOXfTaUwNZ3wKU8xXxMvaduhldhi6FbIqNki2NrVuq7CDrjDcGKbrOtVr3pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132

Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
warnings:
arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- move to nxp lpc32xx.yaml
- fix ea,lpc4357-developers-kit include lpc4337
---
 .../devicetree/bindings/arm/nxp/lpc32xx.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
index f1bd6f50e726d..73dda0d8c28e2 100644
--- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
+++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
@@ -22,5 +22,27 @@ properties:
               - phytec,phy3250
           - const: nxp,lpc3250
 
+      - items:
+          - enum:
+              - ea,lpc4357-developers-kit
+          - const: nxp,lpc4357
+          - const: nxp,lpc4350
+
+      - items:
+          - enum:
+              - ciaa,lpc4337
+          - const: nxp,lpc4337
+          - const: nxp,lpc4350
+
+      - items:
+          - enum:
+              - hitex,lpc4350-eval-board
+          - const: nxp,lpc4350
+
+      - items:
+          - enum:
+              - myir,myd-lpc4357
+          - const: nxp,lpc4357
+
 additionalProperties: true
 ...
-- 
2.34.1

