Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AA9B65C;
	Mon,  2 Jun 2025 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880272; cv=fail; b=ug++ciQSdWoCnWTi7kdCI9xBXmmmAie7+ZpbwmIOtCUEyPd62BLMOS10fNdJ74h5IFseEZiZma43UgA56+pUiVRBSYpyKqcSxATdOLyXbZdqOfAR3n8ZCtMh9bx+Jf2POln30zvgkGE4dWMbJO1bw4e9IlZiqV1mqbL+tge2KRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880272; c=relaxed/simple;
	bh=7Plzg5qvdCzJDTA5QcPtD47gyiUFN028xjgSq5EeTGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YIUY3ZAtIek3QCrlVJaSYkmE+vZyHBb5rqbLF5Q8MVzuqgWu6QCqibnaiCyJGSi4qE7UIUb89B5vvioCgJAlPLUSVcEbBuhq/70YIdWxHIZA1fC4r5RfQanZ0gqHFLypyacKtKjrGKBd6a007jqJpwToF2n+rwUleAPTuuY4j7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fyJEkCoO; arc=fail smtp.client-ip=52.101.72.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fyJEkCoO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKEc244P9x5L/NKdfOKrrNJf1tbETMREpx07Z9FNHJNP5zAu08ZLhRjwA2UeMDWVnW7RxMYtBcXlxDA3ArRaa6liHBicA1nIWI26ZB9P+bmqfbwWeT73JFYWF5GKAlWPA+cwX4bYv/RFkyTINE5Wmp1dxuyXhuzz9sPyK/WgiQVa8Z9asIgEbwOtvmD2NrBdNQG08xVJUxTNHTYAqoATHInmi/1LlAWSuPgBEoByIHZ1qu/N221upYMzoM4t2lhfqVgyvPca+P0aEmj28IaeTIxInsxIE4YEY4Sfa4r3toi+e7hvhDrj1Bw3mXrQpRLH8uXV3tz+baGVLZjsINf5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWXAsFH3PbPCZ2SHcjcJnG565XNmDWbHOkJHFwHFo+E=;
 b=lZYarCL658ocJschwDCefqYSYKoe2OiKriSY+tk9g4VMZaopZFaoSJnVIzKI3r5ykeCQxeQ3vShmZHQ3xe7y9wawF+75oSQg1LD8hfVTSfzjDhriTLqhrND1NolYHeVc0eoQ9Eob1AWkGQWKkHnjcq58QY3Y5SGTu6UcohH/LRc72jnwKqeEvXeLEzDJ1YbrvGdnx0EaV9rcfl2aKfr8zRU8/oCdlb0PyHev8NFzuynXUJ+KZWkKE32wdMMS0W44AyjYG4ivLGUyt/urlKTiaLayvqaRYPtiyw3nUeNCVXCnD5dfg8TX0gpEPqXfPLsrhfyLdGjZ0EdheDKi4UFOnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWXAsFH3PbPCZ2SHcjcJnG565XNmDWbHOkJHFwHFo+E=;
 b=fyJEkCoODmrL9mVow8BDELGBqQJTz4Nxd281EmYk36g36SEcdIAutbeyp+dZkikjNwMOZJjk4xfxr5xWxPR+EPgmFbN90bdk8lbOCHrr/7LvTn8TlsBdQLClrMLiJ9ROukXxtK52INzW3vnZFRh4/VWVnK4nyqCSymF6KkwFbXmS3Zo5SHeOS8t2rq26vNlJ4UReoEpYbFSNVWlwXt33t4qTaNk+8Zw0KPj1pI9JqnfycxTZbgvzkUcHWh7BIBnibJZHM9qaKaUOoG9o4Fo3cODmAvdnnp6haBwQA3n3QQTbO4HWekLU4loIwAd1YYMGuJ1E8gUasH8j5+OTHc8cIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7881.eurprd04.prod.outlook.com (2603:10a6:10:1ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 16:04:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 16:04:27 +0000
Date: Mon, 2 Jun 2025 12:04:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
	Michael Walle <mwalle@kernel.org>, Fabio Estevam <festevam@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Message-ID: <aD3Lg+LRUThzm2ce@lizhi-Precision-Tower-5810>
References: <20250602140613.940785-1-Frank.Li@nxp.com>
 <618490ca-cde1-4e13-8638-f5cb65606c6d@mleia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <618490ca-cde1-4e13-8638-f5cb65606c6d@mleia.com>
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 6487add7-1ba2-44af-b209-08dda1ef26ac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?nC3HZ9UJTmrtiK7LF2tdhP6aOjodyWej+JnVVYXH75GN/hAGtv/lBNVo32aX?=
 =?us-ascii?Q?j/HpiJ2AP2S9Mvk5+XlBUQL7jWMZ/53xU7B38/PZEZenzYqUYqtUZ2bRFivc?=
 =?us-ascii?Q?Ph6emMW3UrOt7pVB1ht2utgJveok/C1JDIMCCBHW60ZIxX2V/GIXUM9cez9U?=
 =?us-ascii?Q?/drePdNF+17ZrTucB+ySRsJK0gt5varcEnU4FTG8Dtq6aapOS7E+SGqVO7+7?=
 =?us-ascii?Q?2s0TZC2T5cpPyEPqFIlk7r6L6rMxHlPL0Y0ihaKgwIgBmo0NVpvc2S991wXV?=
 =?us-ascii?Q?LCFhnXuV7cSAbeWS/M3GRmH62BwnoNeaeo/iIt1gDRw1I1LRQ1HdUaVKaP+U?=
 =?us-ascii?Q?uHO4cdm0YrDGnuE2G48EXyWMd68qCJw8CVFUHHsTRWbcMtsCsFBv/G3f5ITR?=
 =?us-ascii?Q?jY3WZ9ys1a2SFVCoN1iJmMCZKRN4/MJ6NOznjveApNG/mFFjNmFg3LvIMkny?=
 =?us-ascii?Q?G/GzOYLb/QQwvhTb3bL3aXbdfi1r4OCtpAN9YFtJBRdmfwNT5X4G04V/4d8R?=
 =?us-ascii?Q?DlSXi28/i5aEDWQoGkJjfOcU7TDigPy2j1MTp/HWrUGByG7uGvvEBL+VFpPm?=
 =?us-ascii?Q?S5B069gMZ6Eu2nuKGdRMqOd8v/6OKZg7vIIr4t9WifbRQGdbmGhpynmF64qB?=
 =?us-ascii?Q?xSEeDWmfhsnFPqziSckpQ7sq6dBCnLPUFQjNVwt9C3rlZYheqrIPFyacXrio?=
 =?us-ascii?Q?PbIbuHplKZhR7IXXl48UrLowqZZA65b/s4rwdkeB7fdJxD+jw4lIfeFwS7CI?=
 =?us-ascii?Q?DavYSQKaJcbDxuHdPj5jyB4csbF58PAUPEsImOMBjpiOo87uMXVJz6219ubs?=
 =?us-ascii?Q?0r21ZREH2LfiXWHaMUSNdVnxPNkxYTl2QRhspJkRo8jOK63fvINLe8L4LUtN?=
 =?us-ascii?Q?NQkv8EExVA6gdYUVacbBHKIfB7DGMOvaW/YV1mml5F7WUcEGolrLB6rjWkbl?=
 =?us-ascii?Q?xITVpwwwYyQfA7HBc/CchrGrC5C/0YMGLIhgt1aD2z6Lb8nQ9/bwu5yaSyOE?=
 =?us-ascii?Q?BdOZLhKYDwngxYE2PD1k6j9O6yMsQOKYB7DMWhSdcRvOb/74lYp5FlxS+EZI?=
 =?us-ascii?Q?1s0pGd/VD1UsTZ1V0cJXhmJusACmdKN+MmOha3Wlnd/l5ffl9mhMsh7F1TG3?=
 =?us-ascii?Q?xqQGRFzPHqrMBXOagGtXTnKQUd9RC9Eb5pIFoK+45EiMQYPaZICdZCOQbovu?=
 =?us-ascii?Q?T4YiCsl8srtPodXYpNfcRCGHo9cQJPNl7HrbRa5+26ZdwCTt0JyaXotFEHmX?=
 =?us-ascii?Q?UUxGFOnI22bEzljQNdD2LFH75gx0OBfsG+n0QJOx2T1KtQV7DZxtG9T+SrlH?=
 =?us-ascii?Q?WcTehvj76sk64/ry41h7HPaySC/N/MAT0kdJ+7u4qho6UoSQ/RZNqg7v95dh?=
 =?us-ascii?Q?mMtHvsXbX3O2XngTkvICPBNOkN3in8HzzVOruwqrDk1MUX/aphzFIFImHnx9?=
 =?us-ascii?Q?5DsDpIIko4INdGqTIKyseQtWDoSaTgXrL27nXw2YtMxO3Vn3m+tkXQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?32fkfKxk4aiMAuFgdKrEQcIXLqDK1wwSpCos65H9nuR76dHYuDMm6HVfw33B?=
 =?us-ascii?Q?V7SGqFeVtQYvUg1Uh+eB+nHD5NPntUHhSrs3VO08kqs90YCsc92ualMK0DSr?=
 =?us-ascii?Q?bD7g1sfD/p8pbgZ/fn2D4SBYqdAiXFaYLeyS8gdY6W/SETdtw0ymynR6el7w?=
 =?us-ascii?Q?zp/LfgNrlyNGngxzxaSpP3hgu2vUX3cDkTpjLp/Gvm6/uoDrjPzguWgKFWIO?=
 =?us-ascii?Q?x00oQXqv7TuZ50NHmTpYWvlbF9wY0DqLd01LeCXAkMRNdeFHs5BJK/4EifSK?=
 =?us-ascii?Q?MYowDrDsfiqEynphyd/sKlW+Zgi7biB6/NgiJiXYBDXV9Z11fjIEslgvm+LV?=
 =?us-ascii?Q?2CinjlnIPGoQKM9ELWoADhZ7AnYZreOST6v+ERpIfvGLyTfglv7PGL81fDhX?=
 =?us-ascii?Q?oK+GbedHqTikK5O4QwSz6t4N7cGHIsHnAih2SaKxO2NeoDRyj/wzoK5Hhjv2?=
 =?us-ascii?Q?E1v4aIcJVUOrnzwfV+d+mP2/YxefoRiOvRJttCSCgIuZyWBkL6FcUJaZmwn2?=
 =?us-ascii?Q?HJm88EBo0RpdgMw0FRVsxeUModKJavTUePtGwyD72TA1ht3PxwoVAu+XuD2Z?=
 =?us-ascii?Q?fANs/vjSSLQ+iXvqfLY9JHVVQiSRJYLRBQoPkCgclV/dX2mK+kCEH1Csef3r?=
 =?us-ascii?Q?qdJqb677qqJh3eGAbk+Sp9bMO7fy2o5pCHoMNoqm31vcERGfAyDri2YbZDKo?=
 =?us-ascii?Q?iVRNFcLF3V7Fkb6K1Wv8WNpjOQ+GTuZpQ6x7Y/aNm835ksqZfGsT4i1/OgG+?=
 =?us-ascii?Q?qwVnmCy9IQe5jT0D8iQ4rUGrZ5y6ibfwU0VBqwiXy9+9uuDcmyyfRoENZsv0?=
 =?us-ascii?Q?1ERdNTRgNKSdwvJURN1RpULpyO6i1SJN/JYYzG97osKo8L7r54gPaa4MrEYS?=
 =?us-ascii?Q?M4gxfrBrGHZYta5VL23u9pbHGFc+5GNqopiY6+S0RWUkj8YvxUcisJI73Vlg?=
 =?us-ascii?Q?SacWM/zH+tmxZzqeVpZ20oIiwdl9IWM/YrYWZsPGLHdb17ic6bxJCbKlloTa?=
 =?us-ascii?Q?JaMmf4pbrmDj4IZPFw3w68PnkidO/yUVmY51GTvk9cAVAunfzEciX7DDjJUq?=
 =?us-ascii?Q?SiMT+fk15wjzwnItAHCesvo0Mg3zB/42c3WKZ8AGnIQ+PASZOudczNWm/uS2?=
 =?us-ascii?Q?ydYwLcsQ/kRovAlBlFnAAsWcLD0eN02WlxoJcogUrcuA0tuYy0t43O1uqX49?=
 =?us-ascii?Q?ShRc5fWaxAPiirrls+tMxWHYtNXcuIe8BKHxbC3dxp63tVCEihVKvkfsSWLt?=
 =?us-ascii?Q?6D02KJwSh3OjJg5e4x+Tzpyr4+Qp4pOooAGRGnfkyI5rt0Dgbs0xL7z0utZv?=
 =?us-ascii?Q?jMgyMmQF9L6x5/hhYljosGuztQ1Pr10Sv5D/WWi9hFWSqz5iJ59dxOMOIgWP?=
 =?us-ascii?Q?tklEC7Ho7AJZDjYzdHPIUssGh5YCTE4WElbE0EYtCLc298x3QPzGmgHY6zVg?=
 =?us-ascii?Q?nmuLSB47cZY6JGyWD+5b01Aow0P8JAVEWc91cj6HCPas0i+38w5Rag3wM+Kn?=
 =?us-ascii?Q?GBUgfIQaLflHgcwUM7xMP8u+x1UF8fGI63xUI6H6xjS4938lZO9IQ2acDz35?=
 =?us-ascii?Q?aP2YraKxnaoRVg09hIc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6487add7-1ba2-44af-b209-08dda1ef26ac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 16:04:27.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqagNK6xDbZwnHZim2bYs791O5S5XwWP+UIOx6HKxq604qG4WNWEWHsFzXGIpuk8H3UquQqPmN17EZL0uwsUNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7881

On Mon, Jun 02, 2025 at 06:34:14PM +0300, Vladimir Zapolskiy wrote:
> On 6/2/25 17:06, Frank Li wrote:
> > Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> > warnings:
> > arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   .../devicetree/bindings/arm/fsl.yaml          | 23 +++++++++++++++++++
> >   1 file changed, 23 insertions(+)
>
> I prefer to see NXP SoC powered boards under Documentation/devicetree/bindings/arm/nxp/
>
> LPC18XX/LPC43XX SoCs are not Freescale.

Generally, we don't distingiush that, new s32g chip also in this files.
All nxp/fsl was maintained by one person and everyone know these are one
company now.

Frank

>
> --
> Best wishes,
> Vladimir
