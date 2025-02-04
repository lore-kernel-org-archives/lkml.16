Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA59213E84;
	Tue,  4 Feb 2025 15:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682470; cv=fail; b=XhpGSj1vq6HlnDeew1lkD1/jBL3869KAaYPXuRrEgB2U59K2Zz7Zzx+O3Nd5NQlKzNkrfw+esZ6GbR2GqejXdiRd4bR/f0SYQ+ewTqMoWpafQLZJ+qi2haJ74e9SMujGvw42Qh8oKa+qof9lmI542i+5J7TSWOf876FV/u2JbkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682470; c=relaxed/simple;
	bh=4Gic9XBtI/IIVKjQDVeWU+omOYj/XV1i7/Xo7yfQUGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CiivL0npbNhqWTQfJS3OCFlSP/j/XIrxTVR1bKb/Gj6vcva94Uq23PTOp0jhD0m6y83XvWU7iZ7nz9IxTfdMLiYaEiA53A4a5G0TONWHw0MtgSRV4aLRIYx0vouuCcioRdk+0IXUiS6SACJGF75gcTbU1v+a+EsCuLRihyUBXPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jxpU1tKg; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jxpU1tKg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYWcCfGWNLRfd7INTH0nbHt00EEvUuhFvECFWPmLDBlOjdqUxHFN8m1WT/puGGbARUbfGQqTkW/dm7tH1s5G3nql+19qZuI2PfrADnZmHA7b1PzoDhrpgJCuYaxj0R5vlHYrSuR+ngDOBXBQ6lRev8kIp+hMADrLeLoBjcvEMBW0hGMbK4SecIEXWrAuoWxH7wUKFrjuux6FcKYU5V/hbnxNCX52iv56LNGeBffHcbRMBTHNKfq4CefjtFeiCOEISkF2zXoUx+Biuqbqyp+4tnpoLV5uqpgRV0fZdu9/8LRNzT0m8kipXDQk78nvUppo1DDt+CWORPz4/+QAL9lR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Gic9XBtI/IIVKjQDVeWU+omOYj/XV1i7/Xo7yfQUGc=;
 b=gFH/pxUyIk/CnHOEi/dWOSZPSPCaQqu5G7chEA8mtF7BqqgMicIBhqzm81u1y37UfN2Vx7bCn6n/6N7FpfdSyH4rOGr660F3vy6H7MQMo/3iZbv/Jf5cWCiiVZvRGG5yayWYAMvKUf0LH+j0guQMKZ0Fi2R4AamtJYVVGUnyNHQpHbZFfD7VD1T1Tk2zj5sbJ1ygpikVktAaWfskM8PXMI6ES7VkaMIkcs6tMtgP5MtNpCpOoCFWl3ZHrhWEls/HoygKy4KrqcvyDVdBsrrC7bwNZGGgYWFBa8GneNTYXcy0ArRUjIjltutO5X5UURCalvImmG0UhwE6A8ZbhkrwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gic9XBtI/IIVKjQDVeWU+omOYj/XV1i7/Xo7yfQUGc=;
 b=jxpU1tKgdT5ICSExkw9sdsxJqDIsEjClqhd7jEo4T1MoS0NuVRFkZ11FdkLKKr9IjnkGP8MWGFwtdD4cSdYy5cZ6XIzVzwCdfkJjK4zq72eQbbxIhGjB2BXZwxrT9NEtRBSJTVTm1FZrQoO6hy0DsYZn1+4bP8tvbv4W0s9yAr9Oolv/f1wRPgujGvCSrIR9+eykkyGFCC3li1knPzdP/aZfdg8zFtbeiy6y3NJwid8Heslu5QoujY3EVhCrijAJvEqJao6RoueaWlond/FfWZuC61imI2Qr2hhZ/ZkqWdaSKegFFRJ8rxhpNf17tSEiqmXhwBJhSFCakE2qMfpg7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7554.eurprd04.prod.outlook.com (2603:10a6:20b:2da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 15:21:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 15:21:05 +0000
Date: Tue, 4 Feb 2025 10:20:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v5 0/3] add I2C DTS support for S32G2/S32G3 SoCs
Message-ID: <Z6IwV5zYqGgiqFcj@lizhi-Precision-Tower-5810>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
 <afde74d0-b4d4-4907-bfd0-59f68861245a@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afde74d0-b4d4-4907-bfd0-59f68861245a@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd4576c-4e62-4aef-c569-08dd452f8aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aBOPlyp/dywFTvEmiKLP44/mGkNIePL+HCT2+7GqK2jAHBcyP6iEpeVXTnJi?=
 =?us-ascii?Q?x7kXkR+KtCrA2J/xIu88pDZww9WVOUpWwSjKvmHzlS2D06XfkWgzoHB5Xkan?=
 =?us-ascii?Q?NAx2UnGGC8+pSMUNXFUkYrR2rJFTvb88jevedyNMSZY+j8+eZ4r5U1s/CN8+?=
 =?us-ascii?Q?cSX1vHngfJNd83IpRXk1ZzMuVM4y0x4UT13GQP6L2FGtYPLQ4RoOj9qTDOG9?=
 =?us-ascii?Q?h7bU7JSuc8Y8a7nXqGazieaUuZ84pPm0raI6VjTk8wYkeZiXcO7y8bRQ3YBX?=
 =?us-ascii?Q?6bXzBSONO2N6EDf2gonlhgMP3bMpcX0dAP+4YuGdFy5biUz53awytEXiweUa?=
 =?us-ascii?Q?4gbYN9h6/XDJUb9eCTO4zGXQp9gwPuhJHBsjHqbN/lvWPNPAeopG7p2F3G2x?=
 =?us-ascii?Q?sDqJes3+l8pyKxA4uAh11RoO4ohxwlG1VGN/nT7Wm0vU4KKnfr2k8ePJ3Uoc?=
 =?us-ascii?Q?EYH3KMyp7l/byXcphP8YLG3g0V7PZjXesariyoL+6VcSliQHerW4DK79fA/d?=
 =?us-ascii?Q?EJOS43CnI6k2qxVpffSbEzztSpcDTjddBZc/fyxzT1FkKsx6/pIClWajIcfG?=
 =?us-ascii?Q?xlNPlKh6V8TXRZDCc+cSOYO2oNJmFbIw2AivLYLbXAAjbSlotkXHqs7gLrtW?=
 =?us-ascii?Q?j+46o993oDCkaC7b3h1YIQRCcY9exV04QbjJqTBAPSpclqwEgbBG12PPv+fe?=
 =?us-ascii?Q?lcCC0hPb9+YavEOtFMOwN73duiIEAbQ2MrpTJLsy78zVa1g5ZrOx+k0ZSrNM?=
 =?us-ascii?Q?/W8ONusiQy2BotrCDy18v5aUe+ops/Eve0x5uRfjsjZB0umGi1p9UwHVitvb?=
 =?us-ascii?Q?cvGv5OKCK8la4NMkAOx18D48aOM3zpDl9qoU9pMGWZJHPdTjCf5UP2JzIZA9?=
 =?us-ascii?Q?3OQoZlm5dgSUqA0r7iBRps7UL3hd1NyKEWu/ePxcj3VQpSlf0q+eZP9wt7i3?=
 =?us-ascii?Q?u17nDjbnq3IegQnkhkEoqe2KUAs0LFBIc+Yw42t7YqzNU/wweBuV2v+yxlSX?=
 =?us-ascii?Q?KLBpXUQ5TK8ssu24Yp4sI1QF/opJF9ONjaHgC65NbkWnCTbOGQHEWdlnIsiS?=
 =?us-ascii?Q?DU3bnVsXg3EKBd3UPZ9OipIauInqz0Uh6tGfz7nbIAA1+uhJ9dgrg4+ERymR?=
 =?us-ascii?Q?22dIqxLSVOAtfySFA5ooeNFlHb0RzoSektHfvvIINc6j9Y9oXMQO41vxyzyX?=
 =?us-ascii?Q?WNt0q4gEc9pCdCAwFy/7Hn++KJw4FJtHB6Rdi4iqVj2cAvNouEp59hp4ESvQ?=
 =?us-ascii?Q?s+ZqJR0mhIii3CS9MNAY7E1WZMYS3SBZAzI40iPU9tRfhD6M2yjSpBDbDgGG?=
 =?us-ascii?Q?orurVFOUBI4ClxXNtQYrk9sGY1s6dpgRoVR/AZ8eo6JUWNuRvnz1VwSZayln?=
 =?us-ascii?Q?q/iLiLAzmngOzlnoICKeLIXxBHpZqtqarueYcen115Q75e81m15RRKBi8oOW?=
 =?us-ascii?Q?2RsMIXwJMtwGRe0xClVv/vPaa/xswJH3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NkhDkWq9GTi36jEhT0j4p2hE3Wv5fAggFLRg41Wni1ZfFiCeOgla3IcjNArM?=
 =?us-ascii?Q?N8ni5t7bTGTYqOOzx28fmoYL6ZqTulji29g607Ke71fgIX+0sBgcFBk6REhi?=
 =?us-ascii?Q?fUdh/a7VsF70ytZDyVQccNrkIyxBHT6XdzxUs73hjdz6SFDQXeHUN7VRWxdH?=
 =?us-ascii?Q?MMlDcqAwJVaM42+QOqnrDQU/aN2t5JUOsTovBs41tUUN2xpgzzI3p+sTmkGD?=
 =?us-ascii?Q?EhypUoIYxazJlC7KcGwY6hGBCf6+i5CX/arS11h7qFzHAsBTTn1dwKGBQ8fL?=
 =?us-ascii?Q?QVpcCfTG7TLfiW/sWZ3F3Z7PBguqSEu3rHNC9FP0Vp1sVPlfbwgqsSsGCTdS?=
 =?us-ascii?Q?ntTXaV2vikNCLnE34FAVUniZ4qIhf4DIAvVibR3364zDI3u0EO7zjBFFmZpQ?=
 =?us-ascii?Q?NtD6ZscIV/Sh4PLY1y7n4Iji43YjSSxSDIEqMARJori3QxbLcxPiGkFiOaVT?=
 =?us-ascii?Q?0lbrcREQ/+eB/K7/IpNVq+FSRU4Mj1LJvIqIBsFOhgEfe4XKicvnLUNEMOEW?=
 =?us-ascii?Q?Q1bF41CAYra6RmPe+L8sWTEGSCs28gRZxus318Bl4Y2d0D7xP4iXNJM/IAaR?=
 =?us-ascii?Q?TbtITMSlvaPomhp9h9Hpa/hcS39tUlPKxbidmP5so3/pENAVoPwbNxMtluqP?=
 =?us-ascii?Q?NUzShOKRo9OrPsIvq7Sk7Iuw0gK7ipBTEAp1FFnikwo5xzYfEZlooIRjc3G+?=
 =?us-ascii?Q?B6PGwyj6xJVE97zEoXcUbZYmND11oK4Afk5f17JRrr9f2LoHM6AVtZr1gkon?=
 =?us-ascii?Q?+Id6XFEIFAojiBktcazmWzh8zsePrrrnUDTEOVi99n+jACg7Hm0uzeEZWvxH?=
 =?us-ascii?Q?QkwMJAIfr2RsR/45T61/yxpvK58AWgOzpyFP9QWEmVY3xydfwZ+RwRpUgY+1?=
 =?us-ascii?Q?otS/5xsosXzBjge0PqAitBBorI80W5vsUF5G27crAtfFz5y07TTgqxDYvmTS?=
 =?us-ascii?Q?Ta4IznhS4IsVq9GcOgJxdultYFIDXvdACZKqU4v52jZQ6MGSvhO7YajrPkpV?=
 =?us-ascii?Q?NJD6OONdLUGJkmBx/5EEiIuyaypyPDef/B7cNlfx9VE6Xx0tUtyiCKgu1Urf?=
 =?us-ascii?Q?C8Z6AaTs7/MhAnTaRRny0uJsRaYKWplw/2s0Npr8Dqci/rwm/inu/MOWf49I?=
 =?us-ascii?Q?HkmYo4X9hNoaJwRf9px+149QPSGxpQ6ccYfs23WZC7aOaP6EeJUTIDJD5fAK?=
 =?us-ascii?Q?6G1QK6kvAJIpzA8BzKG1v/Lpgjediics9V+prYa44dcJbqEGuDyk3TVHwDJe?=
 =?us-ascii?Q?1mYpml4SOMwFryvJauE6cG8sIEmq2UKONaocai2tKQQCMfbofAryXXYm0g3D?=
 =?us-ascii?Q?BRpkt+T2dLePUhsJf8A1WFnvspUGrlqHLeMCCLtHZVSpzcmfN5zTjZ0BPgAk?=
 =?us-ascii?Q?bXs8xiu6Fr2V1LlC8o4VZOEb1eHyhysbYe7JiPdUjp+/ZNnLyQlJQdGQSKR/?=
 =?us-ascii?Q?2671yqWTSp8oMJpUvt/EV808rU82RIfNoiK34s4SglvhQtPwZhNSDWOe3ktr?=
 =?us-ascii?Q?rgIov9PTANL3Lhhdss6k8JfiHr/+A4eHXVdOJd4dLgW9/gx1BhYSrMZwe3g6?=
 =?us-ascii?Q?UZQMJrYHuxlyMIbftt8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd4576c-4e62-4aef-c569-08dd452f8aee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:21:05.5004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icHYN1uy/2SGWuNsUePuZShhW9Ivd1Md4RUODeCv6QMWv7Qd9uagZa/vurQRmVoOJRRvjd80e6pk1I2GgnDZ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7554

On Tue, Feb 04, 2025 at 12:12:34PM +0200, Ciprian Marian Costea wrote:
> On 1/13/2025 1:05 PM, Ciprian Costea wrote:
> > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> >
> > This patchset aims to add two changes to the S32G2/S32G3 dtsi support:
> > - Adding I2C dts support for S32G SoC based boards
> > - Centralize the common part of 'S32G-EVB' and 'S32G-RDB' board revisions
> > into dtsi files. This refactor will serve I2C in this patchset, but in the
> > future it will also be used for other modules such as : FlexCAN and DSPI.
> >
...
> >
>
> Hello,
>
> Is there any more feedback on this patchset ? I see that it is hanging for a
> while. Just want to check.

After linus create v6.14-rc1 tag, shawn will take care.

Frank

>
> Best Regards,
> Ciprian
