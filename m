Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38562036EC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749661549; cv=fail; b=MnrolMYnPZ01IZCGGEftd/3rOB7FZZmlflPsYVrJdEWJzZdB22uNDnUH9t6BWLrXSA19WkoR4aJFe5tJYM2g16QZb+Qnl5hCXxIxl7GNXZRszFUGjJ/piZZBotYNWzYRCk0+vDB6A8WA+omsnzCfTVzSScDwfV13WCtcLzoh2o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749661549; c=relaxed/simple;
	bh=O4HW15ReJt5KLeMTtn8/cJyZtL20+wYFNN/d/z4blJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hdj8mT6ykyaNO/SRYp1NoBQjY78uAOvaknRXwZitO6plAHtJ0v9N4U77DlyNgy3ypnbHk4/zKwRXzq0gQ5Vglfu5pVtD1SkTpX9n7NuH6p2oYSM7csGzTCJHuRbwNcRdo5pFbxfYoH5JdHh4wPhmXiAUbCEAMFnbnWoPyAMOKS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dQQAzsRC; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dQQAzsRC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bO1M+Ghs6kUgjSU3AZc54defPAE7ED0BGrRarvMAtrwfZHURhJWgwVuA/FgAopuP/JiPdMxHs2Epcoyexjts8Rk0TDCqgzfqKVA/NPQoV7kXNnc3GrzlgYwKgxN96t8P4B9wOaZE2d721iPBPZnGxDWaT8q0wtJdtz4prZe7lXKXkc0LJKx4lF6+RHpVomJkZKQ1h/Kmjpj0bqWs7sydeDFD+svmJZ2SZgKSgBTA6XG9jO9NOWrmVAhmtVdQl/djh6hclS3xur9vHAMaGRxNT/jBDRGM87j/OnFq+RBzIaTbIFIgOTPu68/wLD4bXBjcdJEoYPkNzSCinOyS5C7Gog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkAYxN8kU8vovdIVY+aRlndIL66vmK7xp5nTggrEEwo=;
 b=ZagrlDzZXH44LnVgbcIAtoV6C2WzzaCv+GLOawOgDWT6sD7QwHjqqOvjM/SEa40jJQW//A1rmbBPxeKWFM7I2xS4yxfapvZvI0oB4wWFGxRiMbxn6IWshfjxeoIh3dkc8pLLSUBQW3AOVW2NH6O+ERyf6czpiUxIgKjyDhhmNJpYPi9whJOmIIQBXdf5S4aoUpMyYOGLjMpRQUX1hiqmJqhEaq/0ivooxKWjsJlD/OifYm6YU45BlOYVTqV9iawtr+WM5qQ2WkM89kw9nIYhWWhqS63S632beUW3p27GF3eqoYHxE5f2gwoXpuMPgI3/xwWMdO9RpaP91A6gl+BKqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkAYxN8kU8vovdIVY+aRlndIL66vmK7xp5nTggrEEwo=;
 b=dQQAzsRCbfAdIFw0q0uD5oAFtMO05zNEMliJjSx1lPys2LeVwPjPh/2jjl5I4687Mmzto72/StVlxcSxw4Iz5XRx4t+yC72NZBeyQJVZ/oVDPkCaRyjkJ4IDDtse4ZGkIkqS/tPTRuQ2OT93csgWnZ8GybktIOMfb7O5vYabzqI6Oh3RL6rJWeIn/H9s2Qbrf2m4QQiX/73rWV/+dj3nOGYKZDy0Wfvi3NGmJkEtXvAhbvmxkGRxkDOXmHlfgVX3fpAVbzvibjrPVwsC3+pz5x0TN4HJkoCfPObIthdNz3T7+DHoT1nYvD7jWu3LAfgByoWfx7Df/L5OT/je2zEj3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10455.eurprd04.prod.outlook.com (2603:10a6:150:1c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Wed, 11 Jun
 2025 17:05:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 17:05:43 +0000
Date: Wed, 11 Jun 2025 13:05:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: jk@codeconstruct.com.au, alexandre.belloni@bootlin.com,
	aniketmaurya@google.com, jarkko.nikula@linux.intel.com,
	Shyam-sundar.S-k@amd.com, wsa+renesas@sang-engineering.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com, elbadrym@google.com, romlem@google.com
Subject: Re: [PATCH] i3c: ast2600: Generate T-bits to terminate IBI storm
Message-ID: <aEm3Xr7Oj1wjASUT@lizhi-Precision-Tower-5810>
References: <20250611040203.487734-1-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611040203.487734-1-billy_tsai@aspeedtech.com>
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10455:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f4033b-a9a5-4dbe-e39c-08dda90a3336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9wvv9JEEWxVid2P+h5/0iYtOajRkl0gKhsujbCBw75xidf4Fy4tUBj5hyBCE?=
 =?us-ascii?Q?YJ94Z91F8woe5l2wjod4riFjgOsr3nMjQJo7l/ueY0Gq7cJApvtE/KuN8O5z?=
 =?us-ascii?Q?kzKwfgmdJ/K2CqpkPOwjCJnrOTt3AOL/SSo0kvIjYG38zmzUuHCWfG6fH0BO?=
 =?us-ascii?Q?wvoOh/NFyNiofhsjX/NNc3dvG9E3VNtrFYOoTpZdzk2Jyqs0/jSTwORY6DDE?=
 =?us-ascii?Q?DXJ+fRaWVNDdic3QUTzYJOPBVP8dqahqZ6hZctAolfoWZqzyCsulAGslOLlD?=
 =?us-ascii?Q?3LE4V6JwUbMvvGoKEJ2klSElMccxA+3SjU5l5x7d5ZnrkoVYnTp4l+9CHNwk?=
 =?us-ascii?Q?oKeS1WYXTQnRjqG1LU9CWVkrG0S673yJ8Q63kgbsenhYopAVYxkzFbuMUhpD?=
 =?us-ascii?Q?0kgtbo0jDWLOmb1h6CD2hSvbI5MIZNKs+w0lxgctvdeFSY6Bi0d7csMUHPu5?=
 =?us-ascii?Q?SoNtDFWiv6b5qvb0MKbXVBsHTTxi+vkiD2RcSKCVRLzrYLwMXplhbHddkJlp?=
 =?us-ascii?Q?Q51ut3y1V2HYGHi5I2aeYczM3L4KHQ+9jmBuUhasib01P3R0sYxLurKfzjnE?=
 =?us-ascii?Q?SFR3Wv6YH/6Y9Xp4jpffjcjmPWb86H1t/zWu3phP4UbbjOqB0R4kTsrL0ThR?=
 =?us-ascii?Q?0/e77lG++Qub3TyOfgJfqp6W9xQXR1v0UfY6e7HlJSF6fkPom0j3i+BODz5Y?=
 =?us-ascii?Q?NxUMJBFlKAf4uNYa4gHgG8Xmn8rBhNYYt8nLD1Jdg1R/GEv0WeAL+OfURI5s?=
 =?us-ascii?Q?3EJAEgAddwbjrDdBegCOb0TGOQdRZgJ1qOgBi+92kuPf2mdy7YneN9XlDy8Q?=
 =?us-ascii?Q?lEGcQ4/VEgLBLck07PZWvLwV4d0M1c9DnzyQ0FZE4ON0ud94qHtfsF4v0fyd?=
 =?us-ascii?Q?h9pO/7UhoM1mM7wh1do7mGhSujw5qUCvw2W3l9Wz0g3hdMdSpf1EiJ5VDXll?=
 =?us-ascii?Q?U1m23qMXmVWHOURdwqONDMeH147+Z/F83F5zSn9Ex/Wc7Aknb26hOzBjm0kq?=
 =?us-ascii?Q?EWSRdlez5r6+K8fYyhWbyP/8pGjRmOJlE+NZ90G61Q1mNsl5s07a0Sulie1E?=
 =?us-ascii?Q?3+NoFpOANtCskVVvDB20fmsGtlFk23z4CQF/t5GtBzzJ5rnuz/BtUlALmcMN?=
 =?us-ascii?Q?Siz9syNdGwkxzHXfm/uZGCU4QmrFu1RyHjvK6K5NooFCINoTZLwa7mC9IdUJ?=
 =?us-ascii?Q?F50leNzUVbvmBybPC2lsBumTufDdiq9No4DHSE6iTnJWCDEHlKRIAmrrnR0o?=
 =?us-ascii?Q?N9J2CR4ISjnQydoNzVoQ723LIn/yjSjN8eBeABGoOa33iyDf0o0XLSYTcfmr?=
 =?us-ascii?Q?pwqYOGbhw5fBB1hcs8MK2DdKUcdYwh8sqa4DCxthZeE/N/ZlZuOGgh+aIV8a?=
 =?us-ascii?Q?JG4t+c8vU8zoNN060p1qlGgbjPG/vngalTlR6WCDZ5mleJ/v39fbaP1rBNW2?=
 =?us-ascii?Q?+zoJWeDOeqwpRY6CI/8U8s/jmHQ3Mc/U2a3K0OVb3BVj1p+K62DOOQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BORBqnHDGcFtOMtyGUuc1QbSQL5UMYshy1meYJWvzMmm+5ArEytJy+Cc7rNq?=
 =?us-ascii?Q?MO6Lny7BN41ShD5SU01vJuFzTGwuxbT2IFA2lpGAINi/Rxj08qJiyOCfjPdM?=
 =?us-ascii?Q?ngEIqJ6cu/84OVyJ+Gkpii0eomVamVSIrrIbvp7hE3NtTuT32khGSzGrlFpv?=
 =?us-ascii?Q?sp0E7+yJb84gX1xjWrtZqI8Luy+QZv6V5UQFmAPh11xKQPpNFl/yX90yrkRR?=
 =?us-ascii?Q?+dxsdVwJxuaU7eG6CtNbYuFq5ucekHWWkkstR0uWcMswy6oOhdwYNOf+BzT0?=
 =?us-ascii?Q?tLg/eksulilD8k1Jqydt11BWs28dnfejDvxsmsoM2BdeKoxDv410yvQRaP+d?=
 =?us-ascii?Q?NZBCwfdfd9W2c1ltL15UEjC60hnnTnCQOyu57iRmrhnmA490wjfqEp6YGaD/?=
 =?us-ascii?Q?avyzorcgZNEqzmxJAP16Vohobcoirni/2NTRPnysFKFQ6bpGoXfdPY5ljEGw?=
 =?us-ascii?Q?2nnmrDXLMB0pH7WCadE/fp25de51qUS0VQcPNnIGmXu59XTdFkBzTCrmyKBl?=
 =?us-ascii?Q?tnPaywDfpT2gCRxzPuvlqgfedEcB4U0xCAUjLdSYYT8fg3q5ph52IYYn0LXZ?=
 =?us-ascii?Q?WDThsSFHgaQSwlEOLiCsRZ+QYw65zGKmm6y5b0c7hR4QasLM/TDamouOx9Y0?=
 =?us-ascii?Q?aqD+BGEZxdWv7lftcQsp1OMxtcN8iYNYwx6bbfSO5VQ5ArFjWnWuHK/KalP6?=
 =?us-ascii?Q?UPuX7QobRwd8vNppGHLRdkqTN0CFf+UKTygCE3Khx0PxXQdiER8MClqPgZw7?=
 =?us-ascii?Q?7rkfRY0xuojdW+Zcd08GmPxDRUBYKVzNN3uytTD3r0EftiobVkbqs2EsoId3?=
 =?us-ascii?Q?1Pxylv03qEFkCu5Nqzl8gFyE0q5jXk8OpKoZw+8YCZmzvsUjEbn14avM2twg?=
 =?us-ascii?Q?n+KSzEdD6i0Gywtqrd08EJDTejIPInnCc9lokzqStdSu4dXHpGHK45a1xbw4?=
 =?us-ascii?Q?9QEaDbcP67QTmC82lxfDLipsXcPtX7rURQfhnm0X2lsoE150gtDwN2oxwvyr?=
 =?us-ascii?Q?8/LWBhg6Bq7DsWqgXNlw4LKxht50+HcEJNWyXkMRktB1iBYJZRyN9ACBi8/A?=
 =?us-ascii?Q?etJse7uOA3ZiW2gvWcbc7/6LguDWV2vOEFlvWK59dPF54qYrSznL6OnwJUs5?=
 =?us-ascii?Q?x4dff3Z7Ee87R303RFAxKbHgh438ie4fy1hR/M4aD1XoIfbImT4xWpV8vGiG?=
 =?us-ascii?Q?+qtI5KgraNZWUAU5qleDVXokDO9yh+fiRw9e0K5SaiBRwcyOa7Ylqf8CTfTD?=
 =?us-ascii?Q?+gjXj8UqSmXuEgPLPpJmuyNUJxpmSGoO8z883OVbh9x3W2GBbFukH2YalpSf?=
 =?us-ascii?Q?rTrYw0OKmlw44g5G/lQUor6rZg+YLwQJv5tUXw37WNAFeHLZy2G/NOM5qSZ5?=
 =?us-ascii?Q?OfRKMdkZFy9cQe/8+2NAraIZUaa9yNJj6sV6s76x/qyufCdInN4N+moX9CHG?=
 =?us-ascii?Q?1ukpEkn+hWfT+ibWp1h+itLUFe7GE8dp1CA2tGpwibRSGQh+WiaFaVP71vyv?=
 =?us-ascii?Q?eJBVKX7yGfK9+lPruZTqYn9TGai7/U1n0Frefo8C3JsccMW8o0YGbe0Rqv45?=
 =?us-ascii?Q?/upSbK6geQuCERObydyrfPn1abWwrhIfFolcgXwR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f4033b-a9a5-4dbe-e39c-08dda90a3336
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:05:43.3540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHPMN6Xyu3HP6B+6/ogksf8FLliVpW6LTcY/a7Yb/GSPBNdaiVcgZ3eByppq73qo6opLa3A/hIVcPlNHdbNYAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10455

On Wed, Jun 11, 2025 at 12:02:03PM +0800, Billy Tsai wrote:
> Under certain conditions, such as when an IBI interrupt is received and
> SDA remains high after the address phase,

Can you descript more clear?

Generally IBI happen at below two case
1. SDA pull down by target
2. Address arbitration happen

Then Host send out ACK,  according to your descrpition, look like host
NACK target IBI request.

> the I3C controller will enter
> an infinite loop attempting to read data until a T-bit is detected.

BCR/DCR have indicate IBI mandatory data length. You should know how many
data need be read according to IBI won's target address. Why relay on T-bit,
which just is used for when target have less data than what expected.

> This commit addresses the issue by generating a fake T-bit to terminate
> the IBI storm when the received IBI data length exceeds the maximum
> allowable IBI payload.

Add empty line here.

> This issue cannot be resolved using the abort function, as it is
> ineffective when the I3C FSM is in the Servicing IBI Transfer (0xE) or
> Clock Extension (0x12) states.

why ineffective?

Frank
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/i3c/master/ast2600-i3c-master.c | 60 +++++++++++++++++++++++++
>  drivers/i3c/master/dw-i3c-master.c      | 14 ++++++
>  drivers/i3c/master/dw-i3c-master.h      |  9 ++++
>  3 files changed, 83 insertions(+)
>
> diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
> index e05e83812c71..6ac0122474d0 100644
> --- a/drivers/i3c/master/ast2600-i3c-master.c
> +++ b/drivers/i3c/master/ast2600-i3c-master.c
> @@ -33,11 +33,28 @@
>  #define AST2600_I3CG_REG1_SA_EN			BIT(15)
>  #define AST2600_I3CG_REG1_INST_ID_MASK		GENMASK(19, 16)
>  #define AST2600_I3CG_REG1_INST_ID(x)		(((x) << 16) & AST2600_I3CG_REG1_INST_ID_MASK)
> +#define AST2600_I3CG_REG1_SCL_SW_MODE_OE	BIT(20)
> +#define AST2600_I3CG_REG1_SCL_OUT_SW_MODE_VAL	BIT(21)
> +#define AST2600_I3CG_REG1_SCL_IN_SW_MODE_VAL	BIT(23)
> +#define AST2600_I3CG_REG1_SDA_SW_MODE_OE	BIT(24)
> +#define AST2600_I3CG_REG1_SDA_OUT_SW_MODE_VAL	BIT(25)
> +#define AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL	BIT(27)
> +#define AST2600_I3CG_REG1_SCL_IN_SW_MODE_EN	BIT(28)
> +#define AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN	BIT(29)
> +#define AST2600_I3CG_REG1_SCL_OUT_SW_MODE_EN	BIT(30)
> +#define AST2600_I3CG_REG1_SDA_OUT_SW_MODE_EN	BIT(31)
>
>  #define AST2600_DEFAULT_SDA_PULLUP_OHMS		2000
>
>  #define DEV_ADDR_TABLE_IBI_PEC			BIT(11)
>
> +#define IBI_QUEUE_STATUS		0x18
> +#define PRESENT_STATE			0x54
> +#define   CM_TFR_STS			GENMASK(13, 8)
> +#define     CM_TFR_STS_MASTER_SERV_IBI	0xe
> +#define   SDA_LINE_SIGNAL_LEVEL		BIT(1)
> +#define   SCL_LINE_SIGNAL_LEVEL		BIT(0)
> +
>  struct ast2600_i3c {
>  	struct dw_i3c_master dw;
>  	struct regmap *global_regs;
> @@ -117,9 +134,52 @@ static void ast2600_i3c_set_dat_ibi(struct dw_i3c_master *i3c,
>  	}
>  }
>
> +static bool ast2600_i3c_fsm_exit_serv_ibi(struct dw_i3c_master *dw)
> +{
> +	u32 state;
> +
> +	/*
> +	 * Clear the IBI queue to enable the hardware to generate SCL and
> +	 * begin detecting the T-bit low to stop reading IBI data.
> +	 */
> +	readl(dw->regs + IBI_QUEUE_STATUS);
> +	state = FIELD_GET(CM_TFR_STS, readl(dw->regs + PRESENT_STATE));
> +	if (state == CM_TFR_STS_MASTER_SERV_IBI)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void ast2600_i3c_gen_tbits_in(struct dw_i3c_master *dw)
> +{
> +	struct ast2600_i3c *i3c = to_ast2600_i3c(dw);
> +	bool is_idle;
> +	int ret;
> +
> +	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL,
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL);
> +	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN,
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN);
> +
> +	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL, 0);
> +	ret = readx_poll_timeout_atomic(ast2600_i3c_fsm_exit_serv_ibi, dw,
> +					is_idle, is_idle, 0, 2000000);
> +	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN, 0);
> +	if (ret)
> +		dev_err(&dw->base.dev,
> +			"Failed to exit the I3C fsm from %lx(MASTER_SERV_IBI): %d",
> +			FIELD_GET(CM_TFR_STS, readl(dw->regs + PRESENT_STATE)),
> +			ret);
> +}
> +
>  static const struct dw_i3c_platform_ops ast2600_i3c_ops = {
>  	.init = ast2600_i3c_init,
>  	.set_dat_ibi = ast2600_i3c_set_dat_ibi,
> +	.gen_tbits_in = ast2600_i3c_gen_tbits_in,
>  };
>
>  static int ast2600_i3c_probe(struct platform_device *pdev)
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 611c22b72c15..380e6a29c7b8 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -158,6 +158,14 @@
>  #define DATA_BUFFER_STATUS_LEVEL_TX(x)	((x) & GENMASK(7, 0))
>
>  #define PRESENT_STATE			0x54
> +#define   CM_TFR_ST_STS			GENMASK(21, 16)
> +#define     CM_TFR_ST_STS_HALT		0x13
> +#define   CM_TFR_STS			GENMASK(13, 8)
> +#define     CM_TFR_STS_MASTER_SERV_IBI	0xe
> +#define     CM_TFR_STS_MASTER_HALT	0xf
> +#define     CM_TFR_STS_SLAVE_HALT	0x6
> +#define   SDA_LINE_SIGNAL_LEVEL		BIT(1)
> +#define   SCL_LINE_SIGNAL_LEVEL		BIT(0)
>  #define CCC_DEVICE_STATUS		0x58
>  #define DEVICE_ADDR_TABLE_POINTER	0x5c
>  #define DEVICE_ADDR_TABLE_DEPTH(x)	(((x) & GENMASK(31, 16)) >> 16)
> @@ -1393,6 +1401,8 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
>  	unsigned long flags;
>  	u8 addr, len;
>  	int idx;
> +	bool terminate_ibi = false;
> +	u32 state;
>
>  	addr = IBI_QUEUE_IBI_ADDR(status);
>  	len = IBI_QUEUE_STATUS_DATA_LEN(status);
> @@ -1435,6 +1445,7 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
>  		dev_dbg_ratelimited(&master->base.dev,
>  				    "IBI payload len %d greater than max %d\n",
>  				    len, dev->ibi->max_payload_len);
> +		terminate_ibi = true;
>  		goto err_drain;
>  	}
>
> @@ -1450,6 +1461,9 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
>
>  err_drain:
>  	dw_i3c_master_drain_ibi_queue(master, len);
> +	state = FIELD_GET(CM_TFR_STS, readl(master->regs + PRESENT_STATE));
> +	if (terminate_ibi && state == CM_TFR_STS_MASTER_SERV_IBI)
> +		master->platform_ops->gen_tbits_in(master);
>
>  	spin_unlock_irqrestore(&master->devs_lock, flags);
>  }
> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> index c5cb695c16ab..1da485e42e74 100644
> --- a/drivers/i3c/master/dw-i3c-master.h
> +++ b/drivers/i3c/master/dw-i3c-master.h
> @@ -89,6 +89,15 @@ struct dw_i3c_platform_ops {
>  	 */
>  	void (*set_dat_ibi)(struct dw_i3c_master *i3c,
>  			    struct i3c_dev_desc *dev, bool enable, u32 *reg);
> +	/*
> +	 * Gerenating the fake t-bit (SDA low) to stop the IBI storm when the received
> +	 * data length of IBI is larger than the maximum IBI payload.
> +	 *
> +	 * When an IBI is received and SDA remains high after the address phase, the i3c
> +	 * controller may enter an infinite loop while trying to read data until the t-bit
> +	 * appears
> +	 */
> +	void (*gen_tbits_in)(struct dw_i3c_master *i3c);
>  };
>
>  extern int dw_i3c_common_probe(struct dw_i3c_master *master,
> --
> 2.25.1
>
