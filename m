Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011026.outbound.protection.outlook.com [40.107.130.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACA124676B;
	Mon,  9 Jun 2025 08:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459073; cv=fail; b=adG/FQ3xyWd9Hqwt3kzBES3/BdrZSwSqChiqcn07LCKOXPyrkrHWPa984UWpIPNu/CiW5YYFW/ujt7VzwRZjcywDD2R/V7Zw1gc+jxlW3rrsh041y9SUqdMqXBcbQ2HcL+u10UTSA2dT04jqfJMazBnzorhiuBAwPO/qQ+DuLPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459073; c=relaxed/simple;
	bh=YSMKOXotYok4+PN+i2hEe1JxF5MvoAb9XIHW1Pxm9Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z2R0jDkNFu97PxlMW8HLoae28Hu3sZED5cdCa0LhuyqR7JO7R41SS2H8runkDhGwmRO4J3U+K2CGqw1gauGR6dClYpO1WLWiSGmD/I38FMc7ctpoVGzTs1TxKhhRsGYHyRIb8NyZZoXEMVakeneEoWolt2BeGdJNJ/LiAoy2T8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eJ/5TjMJ; arc=fail smtp.client-ip=40.107.130.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eJ/5TjMJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxKWGTudieUKl2D9yD9wYDP7RHi/foec4uF/cYS7fGV0HlaYfL9qCwIhVbyWZ3PVUy6Jjfs6ToeLVFDr+fkizahyDkVJrqL8hP8dHUZH/+iKDUrNU83IQvTY5VEyPegKa2YgndpEmuk5uNxA8t4r6b2FW7QfbvYQKH/NmR9d/8aQzKHAuRAtHNB0ZnBdM0phxNtReoaeLLVtGOcaHwISLIBMs3VaWOme2L/WpyWTZegQg8W9DPCz8/ZQ+X6uZZ4GD9U2dj6uPkSdbnUG3UGrbBbmDmmSFF8qb5NWJmG3r6/qx2uPvEmPH2/4je1xHMjRf5nQl1LWphv8oKOXkfAqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSMKOXotYok4+PN+i2hEe1JxF5MvoAb9XIHW1Pxm9Uo=;
 b=Y+nbC+gkCHc1I+j+ehOJcxomIFUfEZX2dJIxJQTEee6/Yhy4ur7lHHkOKLqHIGEuzPC5KkzBno5IkLOS5qZ7fFPuXzZ2NSYWlVmQEA+VdqkXSNFcK5O5nQTHvRjyxRCjd1hgjS47yKZuYy0dUBSDd88TeDqb36yee25PObvd4HQWGVMIN/aluWJQpcr4Grn0NRq6h25giEU32+Omt+4u9y6/o7sPIFI9fJPzjBBs2wiYsgZE34muNFcc4khBEDr4qd82VSGnU/f/42FSSWCmz63IpPcQoo8RkPQMtzS2EfWbblu/QWQV+JQRC+XLlmLLz0nFDPoQx4o1gYneAMgUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSMKOXotYok4+PN+i2hEe1JxF5MvoAb9XIHW1Pxm9Uo=;
 b=eJ/5TjMJ5Ysmy/uvDqeB7uQvvHfGgJA9dbpuYFkHEWW3RbbBIdNa7z8QUc+deNTOC/GEf79pDF4OT+2Q69/Z1nEqlNMCObjr4OnS00lFIMxH1GqEPCqhi+KZC3z1tsjnzNzPFAe4L8K+20r65q4WaI/yIfaj5IzsqMw5NGaKnJTmVla9F7gAvXhOyp35qTKo4TxPjPyMPjeto/++X8KOKIJCwK/Z3zMlHguz+poehAv9+QV1aw/FB15Lf6DdDu5M8j2rwcWI9UJCa4si7W2bkzCh1mekg93xfuR7T0akgLaGlYmAkLq9q1ghnQh0ZNNQXLGlQKDLElWYlQYZTN/vIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10677.eurprd04.prod.outlook.com (2603:10a6:150:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 08:51:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:51:07 +0000
Date: Mon, 9 Jun 2025 18:01:14 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: imx95-19x19-evk: adjust pinctrl
 settings for usdhc2
Message-ID: <20250609100114.GH13113@nxa18884-linux>
References: <20250606190045.1438740-1-Frank.Li@nxp.com>
 <20250606190045.1438740-3-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606190045.1438740-3-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0149.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10677:EE_
X-MS-Office365-Filtering-Correlation-Id: 27fc9ffe-2036-4e1a-08fa-08dda732c62b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J4tCbCubLHAGwB7R6Ne+H167D/QccGd2GFefHEXaUve9aICTkTqrn84eyXHF?=
 =?us-ascii?Q?YiC9QtPVDmS6mFKBCcuzDwXr44dNP8rTVRNDJAF3FqGJAyQPpKdnoaNmMrE3?=
 =?us-ascii?Q?Tyd8xFYkqRRSdnrnqE8Z4YMcX6P6Fjw1wO4ofgL8BezDIoiCowDq0TMmLmHz?=
 =?us-ascii?Q?Bzbziz7yftpVFSZ9Uz3aR5mlKLEYJOrwQKEY2A71ol1O7DK4K9Rl9EgpDimo?=
 =?us-ascii?Q?fr6Fk2eAFpQNvABtllnY0LDkQZwwXR6vauHDTVQOe27JEwSikSmZ8/aqQgpy?=
 =?us-ascii?Q?7NNhFhyRjiL3YHa6jDPv0qHQ9xB8gqSPdi0an4EaorRqn426GodqWQRNZO46?=
 =?us-ascii?Q?aToc+U8WT7jwR97P1jNIHQh8GRUW4xoRDjs+uDzrXRNSIcflLuCnv8DOMEvl?=
 =?us-ascii?Q?FvPmzg+WLNTruvDOQnmkq2GpjBBhZRpsW6sZ3PQN6lu/kY7+ZwRQFD0LUIKj?=
 =?us-ascii?Q?qCdMbMbD5aUV+wyQQmmC8w7XZBvPOuNZt03AWwYd4ZyJ6guGloOVdWSTStVT?=
 =?us-ascii?Q?DcaIjWFkTVIB/R6X8AUR5E7kp/FOygo84k3BkAFF5ZtexcHF1PjS+qlemUt6?=
 =?us-ascii?Q?lj66T9OlzlmDLZ+6+Vuh8399goMH0J1IS5wQr4MiWY7bWfTBwwiAGCQxjXSJ?=
 =?us-ascii?Q?sOV6YUdFC7B2lBNtjw6TL2d3oFvJjOl92SpOKxtLgusRyjAzBWMVj3AX1gPi?=
 =?us-ascii?Q?WTcL1NEqrkhGsmjPs8Gn/9pW1iMF3B/oNdXoPBJisAso8oCnEAmXCIXPzqiv?=
 =?us-ascii?Q?3CtlXeFwtCk3M6OsttcRq9iLQDsxM9J805/K0zm+WxM1EFWGSMMBSRL17xiZ?=
 =?us-ascii?Q?aODZqLStyW2RD7Pm/VP7jMdCLkUVkGmiLDTehxxH9i+30z9rsi/q89zfUCpT?=
 =?us-ascii?Q?MD0egLYOWpitNulLoFVwIwX4k3YdDK5kfrbec0DhpJQz1WMzXzyBG0jfV5Nx?=
 =?us-ascii?Q?ev7Yi+ERXZS7MDzp6r3hWJGr0Nz72njPuCqH4AL4istI1SUaHZEnG16M4Kjz?=
 =?us-ascii?Q?5BANnjgErpgqUzFn/0eZixIsDL+cWIESZ24dEdZCMtAdPRdpb4Rf8GP3aQG0?=
 =?us-ascii?Q?8UN5WiCKvFbOY4KsJAN29N6kmcb61jfMffCWsszYR2wua3eXi3/2PZy3zeLf?=
 =?us-ascii?Q?N9E0NCECR/nsn+n3VEJXC50MvJ5XA1G84bsizfrDEb1ugQ+FvWCR6jp6cPmn?=
 =?us-ascii?Q?VUK5b04j0457aGFrbPHPqx0xywJhV85+J1fE5VCSVDgx9FRYnh3wswCRjxaA?=
 =?us-ascii?Q?w4SlDXr/RFr5SXpBRRyOeDxtbECSYYwSmdADWuRRMdeZIarcwh3rd70OzQx8?=
 =?us-ascii?Q?W1+l88dqlldpi2ng979mjcvvc5MnReo4VCr2s39O5QpbMFFSFqTHGrBW8LPg?=
 =?us-ascii?Q?aXsMsNPlc9d34pZRO7Mt8mnMuHX3/u1wc4AGhqnil3MaKb2UJA7MlFYygC9P?=
 =?us-ascii?Q?L6odj+LxeOOyNR/VMIyr7fq8JveB9Mh+Mc3YVrmR+HAD8iCKv03fmg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NTWHBkjovVYYr5w9ZNHorVxoeaefWGvYH6NvUX4OIe1QB/gRVJGMMeowNAoD?=
 =?us-ascii?Q?heC0KbyxQUbap2Uwit4kynEqVkq1wsv0foqGZx+nGR+BmeeN3pLkVyzjKS95?=
 =?us-ascii?Q?oYc8rl95KB86KwdkWvKuisF9EcWhrY+t/4sfhgptfhZZ06/LLSGyrkIcCrqv?=
 =?us-ascii?Q?vJJmU+TA6rdfzLDndP8cVqmjl6aIrbHBv75UchSj69sKqKotIHVCg2WZpaxB?=
 =?us-ascii?Q?Ne2XVubeGnvOY8oA3b6dTe6mNLLZOP1d7thGnbh7+zKpNmO/vrG3D6ZYrmrM?=
 =?us-ascii?Q?8EJQ4iXBZLVmgjPKYawZWMI1kHe0Px2+FsgI/qQS+7oedWi2DYA9nGMtUV/Q?=
 =?us-ascii?Q?I6ELMaJVnWCWKAGlKfIs/eVYUcjOu3dTIXDbMnzciCcoIbVANIazB9v1WIBk?=
 =?us-ascii?Q?VPWaf51kZZhtPNJVb8ajorTpcPghtA2MDTiLlDSAtCUh6f6e60DV70j+YjGf?=
 =?us-ascii?Q?EDFUSAUFX41+UdQYJ90wl5D3dbbDAcR+ynTAbwVq9d/RH2WV/A724cWQF6Nt?=
 =?us-ascii?Q?2LRNYxzfKyRFVOuJHHU1V50V3jbFnOf0YQwF53n/zIbizM6zm8ZeCuZyERkl?=
 =?us-ascii?Q?4KwDNbWoDxFyekjvWTs0pTcC2w+UJeycPaluDjyf3Vx8oODvU1A4THU7zda0?=
 =?us-ascii?Q?Plu4ec1Ts25dkWb4wk/JdxdNhJxuWOCO7v8ECMYefmroFPBrqzmqKlHLrmYI?=
 =?us-ascii?Q?+ywGz6NS1pf7tlw5+nRJIolBexxydaykesLkuxE2uobfhHvqTROijdUvadyp?=
 =?us-ascii?Q?0PLdJggxH2TzskumW+4mMjl6IKhsCgLONOo9S2SrWF4nHME6TrxmQoldhdfY?=
 =?us-ascii?Q?PwdXkzGo0rqxxOByQHrBrJaiTk++DNVaN+DIGb72658TZWLDodX6v1B6KK2m?=
 =?us-ascii?Q?NIENgueMmm9J2CwU5iQ0wRmynI74OqVx8kXFR6tJhq5ca6lT8mWCZrqeoECp?=
 =?us-ascii?Q?2aR7LJuJrrsL+bi3CRKNfEnz8WFCt/xBKhGOdUqKiR2u6+mw7Wy2Gfpv2Y4j?=
 =?us-ascii?Q?rBbSrX8CqLTc/AxfpcikpWjCzLx3n0EDkzgUoWWJZbbCubkUqYcQeSwA4T4x?=
 =?us-ascii?Q?DTMKmPL+1zOv0cIXi2QNzSOgYRHoyw7gNNex6hS//AxFieXEtQ1txPeOp3p7?=
 =?us-ascii?Q?89nyJRc3tJHFT6rNve0OCXJ3VcYo6L335Gcl+m7r8HmdsqlJPG6kmcF+NxKC?=
 =?us-ascii?Q?N+53URypO4CW9MM/10KDCmL5qZE+eGzWdA+dgeheSbhR7OXEII9iqp20Tjlt?=
 =?us-ascii?Q?00IrpIPxnmak5FW42pu6Z+aKg/wpdNagkPCVLn5RWY1MgQV7GutZrJniXyg1?=
 =?us-ascii?Q?Qddy124j/7rATPFn4MTVkZV+wNn9sfDSNJo2j5C1YP3YlnrOVYzXLT7G/HFD?=
 =?us-ascii?Q?A3rZtOZD1hn37O0AO5QiN/lNgn41Q7yeDXUGqnnVG7GOTrQVegMYWJ7jzMk/?=
 =?us-ascii?Q?9S7iND5vA+p8lury/DAzuE5ZkmxAPiLiLyV4O4Q4GjlV9yC79XtXPkhs1Mws?=
 =?us-ascii?Q?vo+n7qKKX4cnulZko8Gzs8eUrbsSrmAKxRPS4alTJqRaDPafrZnfvT1SpOBi?=
 =?us-ascii?Q?o+6NN8mdQzywgqDhNjycbeOU45jRQxPOr17aCBUv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fc9ffe-2036-4e1a-08fa-08dda732c62b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:51:07.2733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xulAy2HPqBexYkP6huBQNo7j+HGIZ/TdeNW20orkmLaKpn/rEIOcj8BhaWrS1zn76nxiiBh3p2wh1lhOgIIz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10677

On Fri, Jun 06, 2025 at 03:00:43PM -0400, Frank Li wrote:
>From: Luke Wang <ziniu.wang_1@nxp.com>
>
>The driver strength is too high for SDR104 mode. Change the driver strength
>to x3 according to hardware recommendation.
>
>Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
