Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDCE28DF1F;
	Fri, 20 Jun 2025 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430705; cv=fail; b=Hi7AbHq7o4jtGEdrRYmX4d1xb1bnJbNACVVswGGBsANVPu3tK3YrwPUZEHV9UUxFgrKB1e6/sXhiJgjUOE4wgX67LLDpcfIT4bmtvIqbGLdRjicp5kICMPGOqOoxqpWd+svcfr2ANkVMfNVPuJjQbTuXS7zHBhIhyt0I6hWdg9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430705; c=relaxed/simple;
	bh=eIqrLvR33K2wm4MHKWCNnjmjf6er4J5uU7Piumo525I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DuVr30EpsEBuzLUt4LUmgc31cyQycmZvFh9ln7+YAf11t3wwHN6jw+RTFA3in0GF78cPsINzMJlmDj3MDwCx0mJ/yrwbw9ogIe2mEEXugyo6HGq0d7LpYN7heLvNLnzB0nFapDWj6LLAgyeChKl7yTc+pKbWuzoizXUjr03CVC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ba5tuWNg; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ba5tuWNg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNese6sg9SYqky1OAjueAw1JgskbCn0F/spm3Y7kBjHvIGPlThc/ToFK36LrXxg+KMHym2bW4V63HoVA4/yArmkUCn0k6+zm5omjyfd5FfoF6BT9oBNZIkPanrUf3g9sOB1pRTpNahPZO2x06pvrsIFyqyxjyJXuvGDYCflCeZ8Iea0R7XvY679E5v7Z4wqpdYreF66lyhriZ3M7bmuu6qzq9sfPWBf8nbXiPyl5i8ink2t7qE0iSfb7QnI3+mU7jZ0o1o1TSYlPtctRaXqgLAw2qa7Y55VQFN2y42zpWBKQ9LKEYNKeARZwRS4g24uWqY9T26eq+K7fLS368qdBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndbB0hG1b3z12U/7Juv6rucA14/z2MsiQh50BAhHvs4=;
 b=vNYKkqr9dvMI/qTi7bQqBGQWRfS9ZPAu/7vrWVCRwcOmZOiSgUWBNVy+wCAcGmWpnOhwsITc95L3+LZD0kj0J1zMS106xp3VWNyHYWRSJHAfpPnGdZYus0TJN3wz9eXPj42C+X4yQ7YbULw9g7IVVfwEUE+wn4Qe/WR61AyNVzDWznGUOcuXuBOsqjdElUMxikxPGzJrSKFcRQ5VdzTS4J/6msrRQ5zP3glxAq2FG8igu0sflk5hX5N+UrmteN0TXrLf6IQGyLbCMI8xV/z0YYB33wSUVI3ctRXXz6MrxxghG4tYwVgN8qV7XVgFneVMUZ+9SRauiAZf1csxQgEnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndbB0hG1b3z12U/7Juv6rucA14/z2MsiQh50BAhHvs4=;
 b=Ba5tuWNg+Xv15He4X7Bewh864YAmBKD46Dn2DMf7CIUZ3mXYp2QJlV4tN1e08XIG6Owh2BIcWmMce5JWxBWDl519GITC32rTfIl07wqLwI6yZtC28WGA4MdiDhBGWPBZXu7fIDnNigWQJ81DGbNNrTCOVjTQfdgISlBR4alj3vy1vLZNStWZpsVVZyAvaksLraOMn6BwczVojGKdUsqAn2kfmEfFwTVG6+M6vOG2UJ++7mAecB/ww9FNvaPS0RneakCDETF3+9VzI1t7x0BdH+ik9fhxMpurR3BDl/U2JxuKU6BABYIoyqkvzJzHumYncITszrW18IlsRWPqu1RlvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7563.eurprd04.prod.outlook.com (2603:10a6:10:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 14:44:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 14:44:59 +0000
Date: Fri, 20 Jun 2025 10:44:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
Message-ID: <aFVz48C3d+HHVHvv@lizhi-Precision-Tower-5810>
References: <20250620122353.150700-1-goran.radni@gmail.com>
 <20250620122353.150700-4-goran.radni@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620122353.150700-4-goran.radni@gmail.com>
X-ClientProxiedBy: AM0PR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e45d547-8ad5-4683-e3dd-08ddb00907de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzgvYzhHNUszWkc1VjJaTm1zSEFpbWFiR2FUSmR6VGRENjZmNTRZYzdONDRE?=
 =?utf-8?B?ZzBwcEZOaE4rQUJUNDZUZmZLNHpRS1pFS3oza3M2M0xQVmlpSE5tSVF0eFlq?=
 =?utf-8?B?STZxT3JrQ2daRGZXeWJUa0x4cE9TQ0I0UDBOUkdEUDBrT3pUS21OMU1WSVZo?=
 =?utf-8?B?S3FITFBLcW4rS3NTMVh3RU1FMis1TWh5NllrSnFYMjdkYzRlSEkwWmNnZmlJ?=
 =?utf-8?B?MXNLVkZaS1dsQWNsZ2lOMXArV3g0K0VYY0MwVitBcVh3M3dNazN2Tlh5UnlU?=
 =?utf-8?B?SktheDJub0U0RDVwOEtSdzN0bUdCQXQvajVpeW9qV1NTQjFsc3pZc2VJaVh3?=
 =?utf-8?B?M0YvRENYbDArME9uZldaemF1a0d5K3VhN2s0REpzeGJ4b1czajFha1BDS1ds?=
 =?utf-8?B?MTNUdE5ZTFFURmd0T1pmcWd5andjelFtSWpVNnJveFBMQkFCSmd6NmFoMHAv?=
 =?utf-8?B?em84RldTUHlodHZOWHY0SlFrN202Sk9KamlGYVdXeVRVZUFPR1lKVUxVQ1hR?=
 =?utf-8?B?M2tlR0FxS2lwdUxoL0dMUGlrOVlkcGZ6dWdzeTJlRjBRS0JBc2xVVEN2WDFS?=
 =?utf-8?B?c1VDcVVneGR6WnFpUXFBaTRUSzFVKzdwRExFSE5hYTkyc1MraDlDSUs0RlRo?=
 =?utf-8?B?eDBjczFKZ0RvUmJ2TzJ5TnNKUERDZE1mK2dYODkzUWY0RDJlL0x2WEl6RU1y?=
 =?utf-8?B?bElNTmxMWkE4MXlmdVdIQmt1YTlsVm5SWXBnNWVMVVdaZGVoWmdMRmFBU0ln?=
 =?utf-8?B?MExhWVowQXU0SDQrRThrc1ZxSnNZM3pYZkFjNVAzVTBqL0N5ekl0Yk11N3ZM?=
 =?utf-8?B?MUtreHAzYW1xdzRrZCtjY3lnaHVDMEEzOWpVQmJSV0VhY3VzMlJoMHlDZmh5?=
 =?utf-8?B?NVV5b1hOZy9UNXI2ajh2QVRmc01xMmdTTCt0bVNSK3JYUE51K2x5N0lmZENt?=
 =?utf-8?B?UktHbk9KZ2NMeTF6MkJoSnBRVEUwYjFSSE1kbjc5RWxPU2pUTFhFd1RZelZw?=
 =?utf-8?B?L0sybk1QZDY5bkUxR2FhYVR3d1YzRi91R1B3NmVQMUhVVzNmVFE4NDBsYW9B?=
 =?utf-8?B?ZUJDTHA0R0FVTlBCbkxWZVdDOG9nVkJHOFZFK1U0Z2wvV1hEL0hwWFNmSnRj?=
 =?utf-8?B?MkpvOUFhd2RUbHFadUYwK2U1UWpvQ3drY0VVUjZhTCtzbm5kVzdvazRVaEhs?=
 =?utf-8?B?SWdGOHVUa1Q4bDk1dS9PKy9kdWlyWjRQemwyVjhmL1BJSGowb2dFWFZOOXBK?=
 =?utf-8?B?dmQ3bVRnMlNLdld4TzJQWDJNTDh3bWwxdWV1MXN2U05FaEFhSWVqMzBXTTI0?=
 =?utf-8?B?UHZWUUNseC9MczdnbTJpVS9KTnVIZ29JYjVHNTA1M1VqTnpkT1hYVG5nUk5E?=
 =?utf-8?B?aVN5TUxJVlZja2p1S29MZHl3S281OW1lY1JVdXhINUFhZlRtTkNlZUxqTGov?=
 =?utf-8?B?bk1BRWZBaWRpSkFXdkdCUFVCL3hQMjAybHZCZjRQOWJ3V0NjbFFGNzZoaU5C?=
 =?utf-8?B?ekhIbXJkVWNXL0FuNnpjLzlWZVJNbkd1NytuajVTSkJWLzBvT0pxWUMxZjAy?=
 =?utf-8?B?NEhKMnk0NlM4cmpCWHVYMTNtN21sdHh5Mk11U2xTK0xzNVpnWmVZVkVBODha?=
 =?utf-8?B?TnRWQXQxNmJWNDFZRGZ4VmVVMkR2SFFsREd3bGdlSlZUYkJOM0IzK1EyVldN?=
 =?utf-8?B?ZmVFL0w3SUZhWmdrVzNLL3llM2hLY1JSRDlXb2lGZXZILzZaZExjK3Y4Z2tM?=
 =?utf-8?B?VVVKWFRGMFFkWXlZQkhNWHZsczNheDBaTmlBSDNXWVZsYVFEbjFpSy92OGpq?=
 =?utf-8?B?d2NSOHpkcjBqTy9TMjArdGF2MVkrZTFxNzB4d0xmNG1Ic1ZzRWNRL3BvMkt2?=
 =?utf-8?B?OWYvY2tRVVYxUjVla3FIRy91UloyUmJ2b0syRGhpVFl1by83WkZnV2JXL0J0?=
 =?utf-8?B?S0s1Q0tPa2tlWkpEeGVSWDJPYjRCYjNMeEliQzJXVzh2ekJpaGFRek44WlJt?=
 =?utf-8?Q?3FiUfCvaHMY6H8o5ikPjvUnJdeFMGA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3FaSUxHLytHODNmcnROOFdEd1o1ci9EYm45b3lEcTVYMlh6Z0ZKMHlRRTVk?=
 =?utf-8?B?VXdTM2tHYXJLSzVNa211UG5JdHh2VFR4UklqVk4xQmlpajhJZTl5eStPYUE5?=
 =?utf-8?B?VkpCN2Fpd0RlRi9nOHFsekFoSHNtUlpwUGIzUG05YXY3YzJ1aGtqaDMrMEUv?=
 =?utf-8?B?ODZQdFZwVUw2bmhnU2Z2eHhTcVh2UUJ0SmQyZS8zYXRhWDk1WVF1ZGVHcUQx?=
 =?utf-8?B?QmdMQ215NmMrLy8yZE9zcFcyRk9oTjRNWjRIb0dVcDR5bXg2Z1ZWK0JFcEpZ?=
 =?utf-8?B?NlgyR0ZrVUJMMGZiUVhFQ2JqeEhVdmI1T1VLMTFnWFU5K1R3VXZvTDRZVkxY?=
 =?utf-8?B?WFdQR0JhTEZHbW5iUThHZGdNYlpEWWIraFVJSGlFNmh2aFpFVDV5ckUxV2x1?=
 =?utf-8?B?WHRjMFVxd0N0cVZzWmVReEVwdEg1a1MyV3c2MG8vT0xhNDhUWlBlWGorU3F5?=
 =?utf-8?B?YUxtMFBCa3pjeW9SaXA2TXlrNkdwTFJuNWlodWRsR1pYb2VtUTE5Y0dLK1RF?=
 =?utf-8?B?YW5SVTBQSnR3aC9NUUFEUW5sZld2K0U4WFo5aWQwd21iNnB5dGhsOGNpNy83?=
 =?utf-8?B?MXBGZGJwMjFzTDAvZldicjNCV1QxQ1lSL1dMMnYxR0F1RXdrb1FYcCttTHh6?=
 =?utf-8?B?RS9EZ0lrZTFSR0k0VTNFcitrZ1B4ME5uUDhTZktjQ0FzY29hSkdIV3daNkU5?=
 =?utf-8?B?UERveDR0eUNjT3RFY0lhVDJiSFJJZzJTb3NvLzNMRlY0d0JhanR2NENkcWcz?=
 =?utf-8?B?SjErczJneWEzeGw5L3pPS0t2d1ZySlF5TE9zRTIrOGhQcVB1NDZ0MVJVckNS?=
 =?utf-8?B?RWVSTitzWWVEMjdVdVNWSXM1anJXOCs2OG1lSG1oa1hxd3JxNUVSOUljdVg0?=
 =?utf-8?B?ZjBmc0JBUUREQmxjM2QwNmdLeU5zTDczZ3gzNWRQdXhuemJjazVRMkxzbkRC?=
 =?utf-8?B?SXNSTkd2S0JNcUhyWEdrajRkYXgxS3RCdVZtbWFXcW16NHh5eFB4aHlEbGVp?=
 =?utf-8?B?OUV4ekR5MnZkeEFyUFR0L05ZaUgveDRxdmVNZ0VpcFBVTmRQZ2VLWFFYamYz?=
 =?utf-8?B?MTFINFI5NEtQTm9kTFpjMHFQREZLZVpGSVZPdDdMQkg2REZBUGFzb0pYR0Q2?=
 =?utf-8?B?azBzcllESHBhR0VoR2dXeDlyanpSWkZRckl4MG5Ca3lDRW5QZm5Ca1h0Q3dN?=
 =?utf-8?B?cGxXR1AzYWU4VHdBQ0djdnJVRjlycjNGcW5VMTBuOC9nNTdENVJSWFRaWDY0?=
 =?utf-8?B?K2N0dEJlRGRML3RrMUdqaVhDSkJLTFlmb2xreHpITG05YlB0Nk9qQ3I3Y2lM?=
 =?utf-8?B?bVRZMzFDRHUwRDVyN3JxdEpoQXByNGVxMkhGb05FTk01MzdFSllXWlhEdVUz?=
 =?utf-8?B?ak8zVEtNYW04SEMzVE9zY2ZDbFFMMFRCbnRyQlZsdDlFWnJXb3BjMyt3Q2JW?=
 =?utf-8?B?NXVGMXo5dEd2RlR2Q0Z3TTlaMlgxN0dqUVlmcVVpRzJ2a1pEYTNmZW1NNGhM?=
 =?utf-8?B?cG1tTUtRVXd3YjBBQnRoRjh2cDlWWDMxWitJM09rZzZldTRDZ1h3ZE1ocy9x?=
 =?utf-8?B?czY4dEZ0eGhoc1Y3djlta3F1YlI2bHhwd2dyd0RnODhMUkpib2ZRZVU5YXM4?=
 =?utf-8?B?UFo5dW1JQUx3OVNEYWJBeUk2ZkQ0cWlHekNyNXkrZG9jekV5WHdIN3VNdkZX?=
 =?utf-8?B?YVdGRUdBUytPdGRXcXd4YUZuSkh4MmJ3a2hvSFltMEN3a2VndWlTdkVyRU1G?=
 =?utf-8?B?MlJybGRiZ0lGYVdBbHNHc0tNYzZ5ZVNFNUQ4aitEYUdaVG5WTER5ZTdCV1NC?=
 =?utf-8?B?ZUI1UTB0aUhXOU5YSUhkTWtwZTRUTFF1cXpjbVdtUjZPK0hPZ3NKVUJxUml2?=
 =?utf-8?B?VSt6QjFTMHZ2ayt1b1h4b2xwYUZZR3B1b1JjQ0dUcmpFQ3VmSEZML0pnV3Uw?=
 =?utf-8?B?T2NVSmR2dXE0WGRjZ3BoYi92eGMxNzF2VWVTVFZvUmY4d0Q1eEhDd2FuYnJG?=
 =?utf-8?B?c05HZ21YK282akZXZUpDMEducUd2ejBHeXdZOWFlWTlYTmV1YUJWSFpMQWZy?=
 =?utf-8?B?bU5VRWlXQWErRDc4ZlJlMVk3RmFHcEVISVFGK0p1WWEyTEpGZHFvaXQxWUgx?=
 =?utf-8?Q?WMyko3aKGF7zlTjUhDmYYulk4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e45d547-8ad5-4683-e3dd-08ddb00907de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 14:44:59.3078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dw77RmDN6xXy9mqupS398U7Ou6y/T4Uc6ah5l/3t5tvxjwbhfYd+lpaWosVSKHUk0BEV2trM33Q8wnatVpPrEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7563

On Fri, Jun 20, 2025 at 02:23:51PM +0200, Goran Rađenović wrote:
> Add initial device tree support for the Ultratronik Ultra-MACH SBC
> based on the NXP i.MX8M Plus SoC with 2GB LPDDR4.
>
> The board features:
> - 1 x USB 2.0 Host
> - 1 x USB 2.0 via USB-C
> - Debug UART + 1 x UART + 1 x USART
> - SD card and eMMC support
> - 2 x Ethernet (RJ45)
> - HDMI
>
> This initial DTS enables basic board support for booting via
> SD card or eMMC.
>
> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
> ---

why not in the same email thread with other patches?

Frank

>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx8mp-ultra-mach-sbc.dts   | 909 ++++++++++++++++++
>  2 files changed, 910 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0b473a23d120..e2f2500238fe 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -229,6 +229,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
> new file mode 100644
> index 000000000000..3ea0c94da98b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
> @@ -0,0 +1,909 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 Ultratronik
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx8mp.dtsi"
> +
> +/ {
> +	model = "NXP i.MX8MPlus Ultratronik MMI_A53 board";
> +	compatible = "ultratronik,imx8mp-ultra-mach-sbc", "fsl,imx8mp";
> +
> +	aliases {
> +		ethernet0 = &fec;
> +		ethernet1 = &eqos;
> +		rtc0 = &hwrtc;
> +		rtc1 = &snvs_rtc;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	gpio-sbu-mux {
> +		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_sbu_mux>;
> +		select-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> +		orientation-switch;
> +
> +		port {
> +			usb3_data_ss: endpoint {
> +				remote-endpoint = <&typec_con_ss>;
> +			};
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-0 {
> +			gpios = <&gpio4 27 GPIO_ACTIVE_LOW>; /* Wakeup */
> +			label = "Wakeup";
> +			linux,code = <KEY_WAKEUP>;
> +			pinctrl-0 = <&pinctrl_gpio_key_wakeup>;
> +			pinctrl-names = "default";
> +			wakeup-source;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_leds>;
> +
> +		led1 {
> +			label = "red";
> +			gpios = <&gpio4 24 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led2 {
> +			label = "green";
> +			gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led3 {
> +			label = "yellow";
> +			gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	reg_usba_vbus: regulator-usba-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb-A-vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names="default";
> +		pinctrl-0 = <&pinctrl_usb1>;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VSD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&A53_0 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_1 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_2 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_3 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&ecspi1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1_cs>;
> +	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	slb9670: tpm@0 {
> +		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
> +		reg = <0>;
> +		spi-max-frequency = <32000000>;
> +		status = "okay";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_slb9670>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&ecspi2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> +	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>,
> +				<&gpio1 8 GPIO_ACTIVE_LOW>,
> +				<&gpio1 9 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	nfc-transceiver@1 {
> +		compatible = "st,st95hf";
> +		reg = <1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_nfc>;
> +		spi-max-frequency = <100000>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
> +		enable-gpio = <&gpio1 6 GPIO_ACTIVE_HIGH>;
> +		status = "okay";
> +	};
> +};
> +
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0x1>;
> +			interrupt-parent = <&gpio4>;
> +			interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +	fsl,magic-packet;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy1: ethernet-phy@2 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0x2>;
> +			interrupt-parent = <&gpio4>;
> +			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&gpio1 {
> +	gpio-line-names =
> +		"#TPM_IRQ", "GPIO1", "", "#PMIC_INT",
> +		"SD2_VSEL", "#TOUCH_IRQ", "#NFC_INT_I", "#NFC_INT",
> +		"#SPI2_CS2", "#SPI2_CS3", "#RTS4", "",
> +		"USB_PWR", "GPIO2", "GPIO3", "";
> +};
> +
> +&gpio2 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "#SD2_CD", "", "", "",
> +		"", "", "", "", "#USB-C_EN", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&gpio3 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "DISP_POW", "GPIO4",
> +		"#", "", "", "", "", "", "", "";
> +};
> +
> +&gpio4 {
> +	gpio-line-names =
> +		"BKL_POW", "#ETH1_INT", "#TPM_RES", "#PCAP_RES",
> +		"", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "#ETH0_INT", "#USB-C_ALERT",
> +		"#USB-C_SEL", "", "", "",
> +		"LED_RED", "LED_GREEN", "LED_YELLOW", "#WAKEUP",
> +		"", "", "", "";
> +};
> +
> +&gpio5 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "#SPI1_CS", "", "", "", "#SPI2_CS1", "", "",
> +		"", "", "", "", "ENA_KAM", "ENA_LED", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&hdmi_pvi {
> +	status = "okay";
> +};
> +
> +&hdmi_tx {
> +	ddc-i2c-bus = <&i2c5>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hdmi>;
> +	status = "okay";
> +};
> +
> +&hdmi_tx_phy {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pmic@25 {
> +		compatible = "nxp,pca9450c";
> +		/* PMIC PCA9450 PMIC_nINT GPIO1_IO3 */
> +		reg = <0x25>;
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 GPIO_ACTIVE_LOW>;
> +
> +		/*
> +		 * i.MX 8M Plus Data Sheet for Consumer Products
> +		 * 3.1.4 Operating ranges
> +		 * MIMX8ML8DVNLZAB
> +		 */
> +		regulators {
> +			buck1: BUCK1 {	/* VDD_SOC (dual-phase with BUCK3) */
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1050000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck2: BUCK2 {	/* VDD_ARM */
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-ramp-delay = <3125>;
> +				nxp,dvs-run-voltage = <950000>;
> +				nxp,dvs-standby-voltage = <850000>;
> +			};
> +
> +			buck4: BUCK4 {	/* +3V3 */
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck5: BUCK5 {	/* +1V8 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck6: BUCK6 {	/* DRAM_1V1 */
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo1: LDO1 {	/* NVCC_SNVS_1V8 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo3: LDO3 {	/* VDDA_1P8 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo4: LDO4 {	/* ENET_2V5 */
> +				regulator-min-microvolt = <2500000>;
> +				regulator-max-microvolt = <2500000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo5: LDO5 {	/* NVCC_SD2 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +		};
> +	};
> +
> +	crypto@35 {
> +		compatible = "atmel,atecc508a";
> +		reg = <0x35>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c16";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	hwrtc: rtc@32 {
> +		compatible = "epson,rx8900";
> +		reg = <0x32>;
> +		epson,vdet-disable;
> +		trickle-diode-disable;
> +	};
> +
> +	tcpc@52 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x52>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ptn5110>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 5000, 3000)>;
> +			op-sink-microwatt = <15000000>;
> +			self-powered;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					typec_dr_sw: endpoint {
> +						remote-endpoint = <&usb3_drd_sw>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					typec_con_ss: endpoint {
> +						remote-endpoint = <&usb3_data_ss>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> +	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&i2c5 {	/* HDMI EDID bus */
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c5>;
> +	pinctrl-1 = <&pinctrl_i2c5_gpio>;
> +	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&lcdif3 {
> +	status = "okay";
> +};
> +
> +&pwm1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm1>;
> +	status = "okay";
> +};
> +
> +&pwm2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm2>;
> +	status = "okay";
> +};
> +
> +&snvs_pwrkey {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	/* system console */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	/* expansion port serial connection */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart4>;
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	status = "okay";
> +
> +	port {
> +		usb3_drd_sw: endpoint {
> +			remote-endpoint = <&typec_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usb3_phy1 {
> +	vbus-supply = <&reg_usba_vbus>;
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +	snps,hsphy_interface = "utmi";
> +};
> +
> +&usdhc2 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	bus-width = <4>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	vqmmc-supply = <&ldo5>;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	vmmc-supply = <&buck4>;
> +	vqmmc-supply = <&buck5>;
> +	bus-width = <8>;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&wdog1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_ecspi1_cs: ecspi1-cs-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x40	/* #SPI1_CS */
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK		0x82
> +			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI		0x82
> +			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO		0x82
> +		>;
> +	};
> +
> +	pinctrl_ecspi2_cs: ecspi2-cs-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x40	/* #SPI2_CS */
> +			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x40	/* #SPI2_CS2 */
> +			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09		0x40	/* #SPI2_CS3 */
> +		>;
> +	};
> +
> +	pinctrl_ecspi2: ecspi2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x82
> +			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x82
> +			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x82
> +		>;
> +	};
> +
> +	pinctrl_eqos: eqos-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC		0x0
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO		0x0
> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0	0x90
> +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1	0x90
> +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2	0x90
> +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3	0x90
> +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
> +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x90
> +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0	0x16
> +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1	0x16
> +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2	0x16
> +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3	0x16
> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x16
> +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> +			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0x10	/* #ETH0_INT */
> +		>;
> +	};
> +
> +	pinctrl_fec: fec-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC               0x0
> +			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO              0x0
> +			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0         0x90
> +			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1         0x90
> +			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2         0x90
> +			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3         0x90
> +			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC          0x90
> +			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL      0x90
> +			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0         0x16
> +			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1         0x16
> +			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2         0x16
> +			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3         0x16
> +			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL      0x16
> +			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC         0x16
> +			MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01               0x10	/* #ETH1_INT */
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
> +			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
> +		>;
> +	};
> +
> +	pinctrl_gpio_key_wakeup: gpio-key-wakeup-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27		0x40	/* #WAKEUP */
> +		>;
> +	};
> +
> +	pinctrl_gpio_leds: gpio-leds-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_TXFS__GPIO4_IO24		0x40	/* LED_RED */
> +			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		0x40	/* LED_GREEN */
> +			MX8MP_IOMUXC_SAI2_TXD0__GPIO4_IO26		0x40	/* LED_YELLOW */
> +		>;
> +	};
> +
> +	pinctrl_hdmi: hdmi-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x154
> +			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x154
> +		>;
> +	};
> +
> +	pinctrl_hog: hog-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01	0x40	/* GPIO1 */
> +			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13	0x40	/* GPIO2 */
> +			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14	0x40	/* GPIO3 */
> +			MX8MP_IOMUXC_SAI5_RXD2__GPIO3_IO23	0x40	/* GPIO4 */
> +			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20	0x40	/* ENA_KAM */
> +			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21	0x40	/* ENA_LED */
> +			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x40	/* #PCAP_RES */
> +			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10	0x40	/* #RTS4 */
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL			0x400001c0
> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA			0x400001c0
> +		>;
> +	};
> +
> +	pinctrl_i2c1_gpio: i2c1-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14		0xc0
> +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15		0xc0
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL			0x400001c0
> +			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA			0x400001c0
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16		0xc0
> +			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17		0xc0
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL			0x400001c2
> +			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA			0x400001c2
> +		>;
> +	};
> +
> +	pinctrl_i2c3_gpio: i2c3-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18		0xc2
> +			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19		0xc2
> +		>;
> +	};
> +
> +	pinctrl_i2c5: i2c5-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__I2C5_SCL		0x400000c4
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__I2C5_SDA		0x400000c4
> +		>;
> +	};
> +
> +	pinctrl_i2c5_gpio: i2c5-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__GPIO3_IO26		0xc4
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27		0xc4
> +		>;
> +	};
> +
> +	pinctrl_nfc: nfc-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x40	/* NFC_INT_I */
> +			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x40	/* NFC_INT */
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmic-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x40	/* #PMIC_INT */
> +		>;
> +	};
> +
> +	pinctrl_ptn5110: ptn5110-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x1c4	/* #USB-C_ALERT */
> +		>;
> +	};
> +
> +	pinctrl_pwm1: pwm1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT		0x116
> +		>;
> +	};
> +
> +	pinctrl_pwm2: pwm2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI5_RXD0__PWM2_OUT		0x116	/* EXT_PWM */
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: reg-usdhc2-vmmc-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
> +		>;
> +	};
> +
> +	pinctrl_sbu_mux: sbu-mux-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20		0x16	/* #USB-C_SEL */
> +			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20			0x16	/* #USB-C_EN */
> +		>;
> +	};
> +
> +	pinctrl_slb9670: slb9670-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00		0x40	/* #TPM_IRQ */
> +			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x40	/* #TPM_RES */
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART3_RXD__UART3_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART3_TXD__UART3_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_uart4: uart4-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_usb1: usb1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12		0x40	/* USB_PWR */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0	/* SD2_VSEL */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0	/* SD2_VSEL */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0	/* SD2_VSEL */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12		0x1c4
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x190
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d0
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d0
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d0
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d0
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d0
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x190
> +			MX8MP_IOMUXC_NAND_READY_B__USDHC3_RESET_B	0x40	/* #SD3_RESET */
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x194
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d4
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d4
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d4
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d4
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d4
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x194
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x192
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d2
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d2
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d2
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d2
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d2
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x192
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdog-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B		0xc6	/* #WDOG */
> +		>;
> +	};
> +};
> --
> 2.43.0
>
