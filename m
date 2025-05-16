Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5942224259;
	Fri, 16 May 2025 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382804; cv=fail; b=O5eWb4DhoMkYv04x+oRZ24M8XhCgAYNxs2Y80YfpICXVL4PeACZ+VhDu3Dw2Khc+CFUHE9IebDPh7J9go0ou2rRSNU5D/gYhCKXw0QXol99/WN/OxeZrjxjWK871HD/gj3+b6L7cPUCnrSZDnuCBnlZtf3WhUCdclnSImKJDNqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382804; c=relaxed/simple;
	bh=+yP/RUWY9vxILA5yxVLh0hDveBck3G/sxE+lJkg+YXE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rB/VijBiDeymR8JAfyvg2WaPqKMKkz7yiYo3JO2y/BKwPvydGX2fc4GBkKX5aBiJURTGvVU47QugJvmXVdql9jZC8ZMeQOY1rzUcf4xeY7Xa3JHRnbjrdd3Wl/58vh6iDT1jRTkd6/dzBcEgFNr7xaZjrVmBMKQYk1UL6CvbDk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jpRzEyE1; arc=fail smtp.client-ip=40.107.20.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jpRzEyE1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4cUSPBD29U3SnAOs0sLs8lZ9hT0l6qfZp+A6KCmZMbsx2ci6ZzXr7wbDwiBoklZ4MCFFTsULq5KDMX2rpQmA/u2Wr/j2ZIVCZG7cqP+oRiN6Gr2gHAc/soCmV03PPPOjbRnoGoJqT+zk2ZFBMAwaQp8N1QLUPWcIw6EmwX/zeYdtM0dtBr5SE9VXAAt+UBKkMqP+txbPYnWiYbybCpWBdr5bSVGl5+4tTnSAMRanzlTpyoXgagsQcQN9WKY/bTyHDv0NFcVyYqbfGE6lhVZEwYPEhCqH9ob0vYzN4hwKf3wPfL4MLhnrQ0i54RfH0B4D47UWMgl1wurOCiQYhmsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmHtDEyRMYieDfivjDNfPaJX6DVrir+/DNoyoIQmWz0=;
 b=iUhp2RY4kB1oOJ30PmnVm7h8VMZ34V87KERfdt8Eu2Wi4FyXmrvNKAJbMnH3AnBB6Rrq/DtwAxWF0jokkjJk48R/tFsUPfFRPDG626ecpIACwMihTHbZULOvYOcZRhzqJjH3I/IJqvVCQPSloVdS+cdKwzCPJyTXRUElULZY0/Eo2wvhyhxci3Ej+62VkbaSG11he6mRT8V8AqAh2lTpJTFDbPcbvQZQhQUITXZTpGc2oJBhY36j1ma461IVzO6YBz7tPG2/SpGhwGM/bRJ4ro+NLCnb/mq2fSg27EyAW96jYfGvd89gZhOVmVJJsHfazvxdA87ZDTv5ONeakmWIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmHtDEyRMYieDfivjDNfPaJX6DVrir+/DNoyoIQmWz0=;
 b=jpRzEyE1lFhM95fvI4+7KuzxngZL1M3pcxEM0oiD26PFnwoCNbGEPpUNZDJjJLKZxvVBNuJlpuaZg0Zl53f/E4lOUKJYXZoUG1guDCXd1GL2fqWZZ/UCaMbQJBpL1Bx8y5etFPiAOx4DO8fOkI5nq/ep+OotkCJLKbpLg0YIbynnKAmEnzs1tgYof+8xYzefF6GbGymZpqVu3k7PJQoKtkfIPlovBnqxldYglN4d27etIWFfBYdsl5wg+coW9Iq+XfugyJzdIWhYaNxOEtiZi8zGNN4aR9oLtZLozJcIaHSsa7FfXVJlzi6ZPZ0SlXR7htxY/U7oH6im+hfETn84Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS4PR04MB9313.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 08:06:40 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 08:06:39 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_xcvr: update platform driver name
Date: Fri, 16 May 2025 16:03:34 +0800
Message-Id: <20250516080334.3272878-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS4PR04MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6216f7ef-8eb0-4751-4491-08dd945095d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2RB64vemiQNv1I75nKiT7OLWonMO76plPJ77ytDxmhq3B8Fcmoe4mMutAHRl?=
 =?us-ascii?Q?l6L0RRM8lVg6AaS+MZzXVfAjZgp/qgx8ZLC/qQ3Dp0vX94AIUBeQ1z+P2Z4P?=
 =?us-ascii?Q?1jbI+dgVxEELlSdGRBE82lEEcO1yD4+sjgHDb/AsR5kH6WitemYYo1YCIrOf?=
 =?us-ascii?Q?8/43RPkKpIUsKu03G5scoc8QuzUVjgee0A0LEo+s2whiiFLKEcxFzy9AiZzr?=
 =?us-ascii?Q?10j9Lm/BOWYRxILdvHyiDhmFEm15O/DsDYPcFprlfKwwWXwK+FqoojhwZj/J?=
 =?us-ascii?Q?Tl9yqLO7eg43j8U2etKJ+G0dDdO1OKlJoqVT5pkRUe2jNi4haKkgIyLs5IlO?=
 =?us-ascii?Q?VhSIz44KyKsqkjhlN5Dq12p/Z7dGOvkDKW3prSowqsRGv6NkjVSts6nrqnnJ?=
 =?us-ascii?Q?RXyB9nP9mw2wu1UaulR3wt5TtzwvK64PQUFY7Vja2y2NrR1dZsILLf7Tqzew?=
 =?us-ascii?Q?4hloITxKPxzF1/MHxvJWwFEeTz5MXbK89ZboCkG7LpjLSnohReKwro31CR5S?=
 =?us-ascii?Q?du8JCqLpKDmktcKbMVrmCRzZvTYuPMIz50ERJ4i9VOGWE8giD5WCo/YKZ5Ed?=
 =?us-ascii?Q?hdoJJxwzBCg4ono2B0wyH0om3hNYtck++yJmV6twDmWN73mmBWLfuqbj+8ax?=
 =?us-ascii?Q?nQ+kFLwOyCbieIbCbduL9Ipy8i2C81qxhmvseS9CDkg4+wdT8Amqov0Rolia?=
 =?us-ascii?Q?vibjRVQLfAtepHzxoMBLRA4qeqX2S2avpxLICSTb56tivQLe4dDPuEZOrOSX?=
 =?us-ascii?Q?7qCqEeT2e5YN4Qs5QbgGTc+u/f8l10y+10FYS+kGqdcePskVTVmCWFZqBRbE?=
 =?us-ascii?Q?BeoRJ0KKtEw5guDvUYahrCRU2sjEyLFqWHIxKCImdVVAbjdaDu+WXtgnK2SD?=
 =?us-ascii?Q?zR3Ias7hZLtFvi9ExV9CFG8Ct4BWdzDqrpmXD2nDBhYSb8Y4uhRDQSa0bu/6?=
 =?us-ascii?Q?m5dbihIEaRg3+MxA0s8jNqh08awfG9TFTetV0g9s8iEqZUWSm9sqj8biR6EI?=
 =?us-ascii?Q?8oBHi/V5REJShDHZiZOh6zMblVdhAsLULUBABQLH8ouyZw7t1ido6fRh+vT8?=
 =?us-ascii?Q?K2MkevvAOzaalNfDirdZ+sNUrgVmcex5ShO7pb+oVHypQNrZZRnmo+D//c1c?=
 =?us-ascii?Q?n8b0bMPbh1nSIBX13A5PVuOFsNnH9VW0nRU4blgrhOicKGDqF0YwEa/6hFSP?=
 =?us-ascii?Q?Cqvz5OdMEDNdKcQ57r6OEVqVR1wiSzksaA6BmLnMw1FcvcAmuWNY8lwSXxIO?=
 =?us-ascii?Q?EaB+fKkwJHJJCFHXQCSj+XMr/EVXFwJybXB9amPhsuYxDvOASe6wh15dy3ae?=
 =?us-ascii?Q?uDKsatoNPQPmJWjJHCEyMMdftrVtQeU7WcMjAmPsizo3hVJd0h0S3xm1Aefz?=
 =?us-ascii?Q?MKZq4wYJScUz882jidhh8PPAuI/l7Zp+LGfgV+q/VLR+ABAkPGGk11LWyDBg?=
 =?us-ascii?Q?KR7j1vNurJDueXuubhK+XjLkP82LqUby2+AH8ObtU6lSvYVc7qClnNP+RNXO?=
 =?us-ascii?Q?aiZtj/00UL5AqIc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QjlC+bat9NKtcHVZMRfbipPWebwwhs4XgUly6aMAe5k4IcPClZXFpktV/D+h?=
 =?us-ascii?Q?NdAJ9i+NReqWBzCX77nHANeZOEGcJBuxRXohB1vCVBnxi1XQj295YKTDWI/3?=
 =?us-ascii?Q?tCa/a2z4lGXC0w4ftk8Goyl32isrNHBpSeQSBXpAdpVGZ0w3keVKNI/Ikoii?=
 =?us-ascii?Q?cVHZVtjjstoI4vFPZcESMwhN8+JT/s8eqizTuz0UVaFZL++9WC8a+mByF73H?=
 =?us-ascii?Q?w5TkDnMewZwljdRUM0k0zg0LkNz8SwN8hWQ1lXi/bWoveDl8r4f0a76dZncF?=
 =?us-ascii?Q?pg6piVkAwZ02znzm95R2TNKBRFfn+7um6S0s0hENf/BBqP25mDplvvglZpEc?=
 =?us-ascii?Q?ef0A441iTMIVhjA+9rjjFpYsjETALR0XgvdlVujsE0hYri32ifqDE4Ua8IZ9?=
 =?us-ascii?Q?aZC3wmGzEDGLfk+izvr2CJU7E+DqgGibOUeFgTyNTAcrcn4xzGZlaiqX8+mB?=
 =?us-ascii?Q?f/384fX5VfWtBJCOnIQFuuWRbxxqBGj+4ppCkpqZNWao1aM02IXSvTR6CqzZ?=
 =?us-ascii?Q?fBAvaHCPedFHCgiS4aCd3sEr0VkQxVUb0jd7JEHkT1LIWZh5LCmlvF2gjlil?=
 =?us-ascii?Q?QQ/aZ4j0qRybLeoNlzxcdBJbpd+DF0GuSW8EhMQrBytNbDEgx4L+HjQbJHX/?=
 =?us-ascii?Q?P8wItS2V20HRvQtYvOg/0U38kHtCJ9XQ2JPNwo5EQa+k91hRHnL2rS6bcK5v?=
 =?us-ascii?Q?bLgCGJcsQu+E1veud4v8FhJ7w+7twukKxozCpAM1ELZoQ//0Vhtfr8oVJ5hp?=
 =?us-ascii?Q?fdoqzyPWBZ8fadijipP3f+q2Fu+pZh927LWtRbODyByPqh6Rl1z1nhsOnaxp?=
 =?us-ascii?Q?BYnSYHlFJmnGa2uvR13aFrrwHJKbAfpyBWNSvaqbV0nC800W1cegCXv5+mfi?=
 =?us-ascii?Q?Wj/jj28629iwYH+VB80aUQSc3pB3BHneOMwsfrSXJSeR4RRor6mY+Urken9y?=
 =?us-ascii?Q?EN6PJEerlvWjJdNqwwwodujFZHq/RVN1oXEznbyrjBq6cVVN7U8II4oVJMgV?=
 =?us-ascii?Q?zcM9NmEvvkOgdvbOKxo0IHd3bcDLXiqduWwTiOoMO9KPFuYXT1+f0T/EIgK2?=
 =?us-ascii?Q?+VNJt7qswklzk8OR9jfQQmNkm73XU+Q02rvSfTYlb3ubA/rNHnanUvTHq6ZL?=
 =?us-ascii?Q?BLivOgpgnyOwdcvHf/gMpOsP3W/c+iwCJhWx2UyIdIEV1rZg4fvh1rFdOGkF?=
 =?us-ascii?Q?C2Mu72tRhAGqO8Vd3o+QZvmEYG3tUOIB7D32rq+hB8nfE8vOKafOmyEPO5uL?=
 =?us-ascii?Q?keQysfR6/f5MW/jAFubEEwuzhNZWd3/FT+AOzHjZqmn5gSyGwZlXxSY8/Tzu?=
 =?us-ascii?Q?k2Nyj6PCdazHW2dx7WWPYEjbC3/qYd49H0Fhob7LaTs7ozL24oDdGwl9lUoE?=
 =?us-ascii?Q?J0rWsXfFMNEqLOGZwxY6/AUQD0pUq6i+uOcL6AAPNke5LPpGZ/DSdsthLzax?=
 =?us-ascii?Q?o36g7JoyKn3aiUFy9E+YlPiRB/MgOLkrzDEVBVd0pcVyxS0LmysDFtgJ7tfn?=
 =?us-ascii?Q?vuW/cJto0CHxGIz1S73k1FbdQo3EfOPU3hDnJT1AU1FQv2F5DStorpE4J0+E?=
 =?us-ascii?Q?ChIfJPOR4IxpHGkj7yAONHTzCUJxfakJFL+YNk4z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6216f7ef-8eb0-4751-4491-08dd945095d8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 08:06:39.6945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfm/P6/wQamsCieUGhmtO9Ff2gJsk3HBHC4TS0LdncUpxsDKr+aAaXvw7T+wnW4rIKtVEuKzkHADuBB+JvXLTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9313

XCVR driver is not only used for i.MX8MP platform, so update driver name
to make it more generic.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 83aea341c1b6..e3111dd80be4 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1827,7 +1827,7 @@ static const struct dev_pm_ops fsl_xcvr_pm_ops = {
 static struct platform_driver fsl_xcvr_driver = {
 	.probe = fsl_xcvr_probe,
 	.driver = {
-		.name = "fsl,imx8mp-audio-xcvr",
+		.name = "fsl-xcvr",
 		.pm = pm_ptr(&fsl_xcvr_pm_ops),
 		.of_match_table = fsl_xcvr_dt_ids,
 	},
-- 
2.34.1

