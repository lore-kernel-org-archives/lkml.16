Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3772122F755;
	Fri,  9 May 2025 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804612; cv=fail; b=uQw6u2SV4VK2JUPUJgqzz+6MoxxG1x1nLD1cKgaKjiHrzlD17ErJtrrNfijF6lMCmb97fmu1o5KJ8lC9sZp+d+5hAfTBPXbt6MeSf/UEwnWXXKq39bZrNdZMAt9Hus/dnLc7rtbbNLeQHOH3mKv1+qFdGB7lfVXT+0E99Zorutk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804612; c=relaxed/simple;
	bh=NX1B+VT5Dw5rJv8nYropVXkJl2EnLZsQMBl0F8/gZ0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n37Lo67goO/l7c/J7sj/IOtpnw3JnAFN0Z7eQQ+EW7CNB/Pn0xGCVsZkpXZQzSRq11TZdJsu9W+2lChytuo/B/oL7ZX5IH9xX5Hh2k17EWW3Tpsb5aaU+gZSG6frAp0HrUR/8KLGmhohM2Gq6IalPeKBBHCb552HztAjniYkfhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cB8k9n0X; arc=fail smtp.client-ip=40.107.22.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cB8k9n0X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/wtwzQXMBEHOgtLVYDUxaDQdJajQW6jiHTlgrKxwpbtOWxu/Qx1B10FxRFutAdqsbpjow79cscH6WKzHlY7J017XJodiPnPMvRrPkWnqK/EHv71NgN7ZawjYGhhXdWKXQOwPJMYjzpxMhCu+zPefJHkpna0CCWotdUXUiZzFZJH1QPxI4sndKuG4njnzYtOJx3W7S2PjN58ARs9VATFzHXRws2yesA3sGDj0Ur1sSNq/RyRYPfRxTIwJdKmOH1nRfJkppeDvDEzbKx+wBKsq/NXTe9uA+hAmrg15hjGBayzuGe3XDQQ3WAxQ+avZf0lXeSyqXqt7HjO0f3pPDwtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md1Vyw2cRCECSPokPTEjbANAsZ4urdNZ/sogExfeJW4=;
 b=aTnd0SMePYJVtE63XxL/T6ukDiKknUAQYdUMwS47tybeO+gL2ZUOW3ZnvT/VL/1soNP5rnqyUG0nRH5E/2FykcpsWQEjVM6P+diz6xBqnwRCUWrxBhIg6HkJEfcDFkfv0Uht4JqAzocYv6Vaccdqb+YlGoxF34bIBOfm4vIOwRQPq88pel/EF/H62AydZQUpBFTJXGy15Ehl4h0KTEZBIs+opgrNOpKdi5jB2ybJD/4DAEoH032OBxuD6WdnqjFAYUEuo57lNmjutfa3MTcZphThul/Omz9JZU9Crij8Og7cIEaEmQfuUK62pAJ0UN/e2QXvuvGUYTXCev24U47kgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md1Vyw2cRCECSPokPTEjbANAsZ4urdNZ/sogExfeJW4=;
 b=cB8k9n0XwyLEgWJJbVABddf4YzwxxLwlcSrlivFiakiCbi+9gprjwlb8CrztLil301cCvIduzlFjhSBc0WznNw95pPkYZC2QoSaVcAU5uvl+afNp5NWUG3VcIZj3i8wQagvggj4Ohr7gzaPLC3Nuke8PY3WFZS/72ZlGlwpfamHky75rQvKz+7gv1SZov5nUz1Hz60lsXK4DH6mkBKcEVg4zwJecnLtfBj1Su3ndiOYH/yxdMiDegUJBvqzbWqUDzuHfIKUPzfBWwxrT+6+y7bAdXfS83OIlhBoi+zLIeF9yeQNXa5GG/pJdmPwEy0q6camfPRcrxl24aSOKHbjzmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9974.eurprd04.prod.outlook.com (2603:10a6:150:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 15:30:04 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 15:30:03 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.oltean@nxp.com,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v2 2/6] mfd: simple-mfd-i2c: add compatible string for Layerscape QIXIS CPLD
Date: Fri,  9 May 2025 18:29:36 +0300
Message-Id: <20250509152940.2004660-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
References: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0007.eurprd03.prod.outlook.com
 (2603:10a6:208:14::20) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b02eca-6dd3-478e-26e8-08dd8f0e5eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yp2AzetmCAERmKO5x/iCvBTFC0c6ZOIUcP1bSCRWDOEzljODxNDoNsvNlLeX?=
 =?us-ascii?Q?Uei+JBQXvX1ZzdB/7tVb6kokHRlhCQNqCAbIoUM1dq0HQg8cRUunjZOw/wwg?=
 =?us-ascii?Q?6k2WjieEUHL1q1o1HQs5ELqdLJaAp6j2pawCrc8ZjOJSbIGKYefryV9q4MrU?=
 =?us-ascii?Q?tt2IphPNpYM2mK9xaYLUH8/gOQbfi/+0QAFQCzufNcMTCqWyt4YOlLptQJz9?=
 =?us-ascii?Q?2ghGgj4hZW7hSUqhs8M9MlrWVfjdZ1Fuqcc8TcUDatgj8flWyuZNu+Imd96b?=
 =?us-ascii?Q?BJmp0Xodn/aS/Q00W/si/GScPwJmNzu6JWbJs1ca0lumdS9i5WSM/mhk3g6J?=
 =?us-ascii?Q?MFcUwwpg94nU47Kh2Xs/o43Z47M5s6Ll4QMXVRW70hygDKLsK5dke5pUvi2o?=
 =?us-ascii?Q?lDkSWtporeigJV04jr5+e9W8TfpyLbagbPiYL12NCKxbNe3FNsG/7qkG/afB?=
 =?us-ascii?Q?xrxFmYilWrAssRZdzyWPwRK/UwDKYL11GXaQLVE5dzqvhWSZA/rM46WxhW6b?=
 =?us-ascii?Q?YelD8FbCxSsnb4Fo49svJ/EhovucWpBOLFciVRSydV8KD7M9EmejJvcKifDQ?=
 =?us-ascii?Q?ciRHwWG1fxOQ68AhU7MwUhBxXX/j3gKSLJyn283HUYaU/y8eIWcBYoYywL0o?=
 =?us-ascii?Q?F4UWXxEemQcgAjVKqv++va4GZOyghdifP69IAKw1eAQQRwdOsxXKJrGlhJIe?=
 =?us-ascii?Q?Ygb2sSXg1GUQhGeBGXOuaCiBoatGEYG05tsEkBKcslgf6mWp7QpwO57RheX8?=
 =?us-ascii?Q?eHQGN2Anm7kJeNTHgjhn8kcg1dgvqmyeh123sh4Tggd2cE01neOolke85Dkl?=
 =?us-ascii?Q?l3CW9oDMaUrxY5lTmoCktXJFVoeXIm52ftWjyoMcxmO0P/TGEB///kPrz0fR?=
 =?us-ascii?Q?oY7MzvszG1yv8SzmzBgcoFZEUr5en30S7dCFhFqLhr1oXZSMaPCYbJcTn4po?=
 =?us-ascii?Q?hBjcMdokok9keyVAPI669qp9V/I2pX2+ca7QDVITLhF/PMrTwdHfa+j3Yk6G?=
 =?us-ascii?Q?Wa89bOFo1oZBOtQJHaUo6bspBTI9CTR7pFNJN02r3hUP5fwWypin092TeMzM?=
 =?us-ascii?Q?AEFLital46IaMIhKsC8rk9/I/fRYzNIGKeRBLQurY6cr6RdawRihFaX79yI6?=
 =?us-ascii?Q?/eO5Ma/hNpi1Fromkzg0BVgVFVG2GOGMQs6ne8SSVE3UggYtxQ5ZeEnJ8X6o?=
 =?us-ascii?Q?NGUoP1liGD5ImkYHRt+HAJrh915bno11BTC8ZCIr5Rp/thG8E9Jpw6IkwXY0?=
 =?us-ascii?Q?jsKFkDzbp11H7QTIBGKpvAlzcf5RLHA0tNsqTx1fUMTYwY7Tn4DnkrEl17F3?=
 =?us-ascii?Q?g3xGA02lLAbrU+UhlqQ8pRQtpHiQ5gDn/8n6SaqgviqlEU96dEWoHVDAhcEQ?=
 =?us-ascii?Q?rb4vcTHiWmuzGXZQvzmzljriLkU95BLVJupygTMN8B21H6u8kTuF+pK7aPUL?=
 =?us-ascii?Q?RyjFPyIX4qo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QkAQ8A3TWLc5c2IFXq73MuBxEcO5AzN5p7I8ip8NMQ+p/RRk7bdsF1Eqj4ga?=
 =?us-ascii?Q?CBUGpt+OhY85+3i2WV9akLbRqOF0Pj9tvYgXPtntoT+LhI1FI0YHgoC7wUU3?=
 =?us-ascii?Q?fj3ttZdwtub1pRsC6wOzbb9ZPTE3M2vPcgDl8P0SQniI2YvcROmts0GCKD5d?=
 =?us-ascii?Q?IS/qa9+F9S1zFgCPJps67000rf9LrD8yCb5xkvv8xDenSaZ1b76Agnb3g/Lx?=
 =?us-ascii?Q?6uJ03ZAF2T1nyCG+eMwY1vzCjGaZScBHiKsK3HOc+nQMEOj9lxP8wqASkpLy?=
 =?us-ascii?Q?pueN1/6FbxwQFO5oGS9/4e7KU4yQijdV25QDu31qcpzxrj2r8pLLjWr3/iSE?=
 =?us-ascii?Q?PpTSTjOzYvtuv7a0Q7QXX4fucWhUBgoY9O6+0i74UhJaasY8xiyY3UIlP3IA?=
 =?us-ascii?Q?Z/MRCvZEhxMyg3T/ZFHqMgB8MyHmEKK46MFnl0xdM1/McZroeFSnujqq8KX1?=
 =?us-ascii?Q?mbPDBQyl8NwlwgqUkUrpNaElI+MvdP9jliK351Mjq/kIOMIOicS7cyMVGA9O?=
 =?us-ascii?Q?ULhyM162LIgThRwGkgEmMy4a5RgtRxwZHpwXacnfHDdGjuaGOn0q9KLaPTlu?=
 =?us-ascii?Q?zhTAgVdbQ/Uhd1FJKbvcbFSi2xPiy6Fi3UeY7ysdFKv1SdN6P9ASsTYONchL?=
 =?us-ascii?Q?ORmarHvjF/2vf786ptFt0Y1iF3D7kKrHPKlHu6BSsrCFhZR5uMjz2HVbWVUo?=
 =?us-ascii?Q?uKgM/VRjdJebVtqwymhDucaW9mZ6rpMJ0EHHzTIZBcGYK4ms1kN3JM3hJxBI?=
 =?us-ascii?Q?uIT1b5a5MHakmlHVeUd87g0GoyhOL2rHu+fwwzgp/BO2Glh3PTS0TEYIr4CX?=
 =?us-ascii?Q?C1EXG64IBhUT8sCLxjgwU1jl/k0W+wmLkztJsPaOMVYe0wEsOP5FcjNkiIqs?=
 =?us-ascii?Q?iMi1HcVPGB67toxvr4Ny7dK0j8+U05G8LLn4JgBR57LpfPQRZvrbaAa0GD5R?=
 =?us-ascii?Q?mxSbuhve4tAZHDW007bbQYe4cIL66CoOP3xM8kXvGZre1jAci5QFH131gB7k?=
 =?us-ascii?Q?Y3KZhsTZSEyJHYhJoeLEbsbOTci65EBQ7eSq7LYXiH3NW175c+mawOwmEeqn?=
 =?us-ascii?Q?OIP5q2CZSaIyYXx8jHSFfJBq6cApPEYCTGKrg26lKxhXQ4O+wnQaZTIIIWFI?=
 =?us-ascii?Q?iwmu24qcDjjXtJOn22+OJqfGwB1Ho9RY3/hcRv9d6W9ozJGhHVoHrB4HMGEY?=
 =?us-ascii?Q?s9tuzykRNiTxkA6BhWF/Vr5IfvVATITPd+AupnC9MioKvJQir9IrHLyrLq2M?=
 =?us-ascii?Q?GKC7fSTp96BQFFdnp5XGHR0ZPb9hEbMKMu7DDGpMXXYKCXoG64cIGPPfcf+C?=
 =?us-ascii?Q?debjrs33BZOqLzu3DstS+NKx8PXzsu/rpU2/vtnBzQl0W4bItlydpgvYDZYY?=
 =?us-ascii?Q?M97tBds19jPvRhJ7ytzA0RqdGrpiEAk87mXIri2XSjDUguXsTRY1BgtA6Eby?=
 =?us-ascii?Q?kqkToTtOrUdrE7niPr7t0+XUpTvnlMwnf8QFBcdKHjMih/pmqJSQPEgsuoWt?=
 =?us-ascii?Q?K7WcoPPnuktJ5NFItPZwlUcy0uwDfJQNkYpQn4CrKZFqBFXx1SV7gFOJUkAk?=
 =?us-ascii?Q?b+6xVdYo2N7THS+qiFWf+pqhZWhIwbD2JV/51WEL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b02eca-6dd3-478e-26e8-08dd8f0e5eba
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:30:03.9014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7IVnjwcTJ2COj3hUA+xwn/9Qg9Ok0KQcqXt1EP/RBIPKUfhN5TlKPHIvGqbcHoVbaB7CMLDwSpIstWFsVNd4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9974

The QIXIS CPLD found on Layerscape boards such as LX2160AQDS, LS1028AQDS
etc deals with power-on-reset timing, muxing etc. Use the simple-mfd-i2c
as its core driver by adding an individual compatible string for each
board. By using the simple-mfd-i2c driver any child device will have
access to the i2c regmap created by it.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- use the new compatible strings

 drivers/mfd/simple-mfd-i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea0..2ae47282e658 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -99,6 +99,9 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
+	{ .compatible = "fsl,lx2160a-qds-qixis-cpld" },
+	{ .compatible = "fsl,lx2162a-qds-qixis-cpld" },
+	{ .compatible = "fsl,ls1028a-qds-qixis-cpld" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.25.1

