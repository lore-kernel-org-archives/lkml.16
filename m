Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FA53FFD;
	Thu,  5 Jun 2025 00:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749082829; cv=fail; b=r2m+AIDCGzNyTAfiIFkh72wuMeeVwYZ57r+tEiVyyeaAr4l4uuJ4KHQRSdiIlisay/2Za653sLoQ9cH0MdkPQxxbvQvsm2rtHbeyYevZaV5IqwZ0k8nxsD5uM/K33d2zu553QSHDHwfh3QpRB0FtKcKoehx/PRNCG1+1mZIexn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749082829; c=relaxed/simple;
	bh=Sq4s3luz4PeJhYp1PBm+jl3IklKWHEmKqXaixHGPwns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nQpCIKQClur//nEI08Bvc37Ty9cysjlzzrm+uqrWznYEYO/YWt0Vz2K729D2csjXwA3g0emTMMLo0C4D05Gt0GzMn6GvK+6aBMjYS9aCFA9EKXhfbb6yD0pNfK95dsSuBgraFl6N+le8lmgDSd78xXuc8ZgT0d7AMqgEOh1kels=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FYbo3ZHP; arc=fail smtp.client-ip=40.107.159.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FYbo3ZHP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaJiJ0ipFY+jrdFwaysUmz9gbWTTVNGOy2fiAx56KTIecIz2km8XhEshRMoHjZIu92tGLPkooeuPPYjKhWJOPRjU5eFKT0r0YqfD0PLImwRhyOXOw3r8ZVbsdp7yKoYI/6+3a968A71Q7yxeipmq4jeka/VFSGjvXRWwBZFsKI13vf1BUDrWy+OF7SJjYSNU9hM7nEzObGE59qXyiRSJissl6QNTY7vvooqpmDHtXdQ3yj/pyq0Pllnm/6DpAibO8ge96fwleMftDj0DB0RUTKFE152a5kQlvgvgo7RlaUrcSrxqXF3D1AGYh6zxUkYzGsIixWFYxaOLTO/JZ55+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq4s3luz4PeJhYp1PBm+jl3IklKWHEmKqXaixHGPwns=;
 b=R+RTz3Cv6sxMN5HiRThP/J02FVHimh6OrnI5K8hDyR+HFsFiKhkz1FDnf+HKikk2JUFU0fUDInfpFUr6OwjwrI+pfVPVIVS8IhEtMdvsfoHPtROSYUhevcTjMITKVJde96122DvJI892if/FriK3uXY5xpxeoeDwhp1CpyVdJQ5v+u1jOz7leF+2IQVtnswL/9T9yxsOR1y/OuaNcrOf+M0YVc8C+2DZGX3/w6q1LkOxoHB9qezAAxu59tV2t9uFdkwBrjxNkBKdYZWYEAzoVOUqxPKaezflbCYjqoQ2JlIfsrJ8Ug1xHA7bol2oNuhS1rzBIJRbW+HwTRfl5L9Kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sq4s3luz4PeJhYp1PBm+jl3IklKWHEmKqXaixHGPwns=;
 b=FYbo3ZHP+zEuuKTO2ZgXvWq+X2ZcVCJCAfqAOdVZUFAcz6EEjXuKOk8ZP3H1/SKMWsyJxF+83DU9H7s3+gkNlM33l8GCY/JKA5A9CvVxJQVEZrKfgjxp4HzOVW7gQq7egGAspo0TzSGS8Uv8kBKzlsa0TzcN0M8wRuUjMT9xPjaMgC/znIPILqISxFIh/+MRCsn1JlLCgszdJrba0PtzYD5I3bM85fvnns3bl+7+bqzV+OESngwyX8InHDpBsphHzt5mQiNOzZXbH66Cxb8YcxSIvPR9N2a+1W1IIVLgR4Kvk1PxzlidtpC7Wqd9MWJm62qiCapaWWKGacPYTMJjYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB4PR04MB11280.eurprd04.prod.outlook.com (2603:10a6:10:5e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 00:20:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 00:20:24 +0000
Date: Thu, 5 Jun 2025 09:30:23 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	m.felsch@pengutronix.de, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: imx8mp: drop gpcv2 vpu power-domains and
 clocks
Message-ID: <20250605013023.GB29462@nxa18884-linux>
References: <20250530221713.54804-1-aford173@gmail.com>
 <20250530221713.54804-2-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530221713.54804-2-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB4PR04MB11280:EE_
X-MS-Office365-Filtering-Correlation-Id: d3efd589-9572-497b-5f85-08dda3c6c3b4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IQk1ReAygbVHi5IrmuXuvSTMtX1jmtNyntO19YrTdzMKJSqDJk3dHfB5Mz+B?=
 =?us-ascii?Q?AfmolQGENQ1k5cFWtEWbzyJryOWsXNarAFG2SocftXTm3T7sENjGJELQaIRS?=
 =?us-ascii?Q?K6cZJc7k0R9pTP2Zt4ouZDFHxqDhAIXW5p38aD87TYFhUrPyVfEOkJfdB3Wq?=
 =?us-ascii?Q?OcXw9NVe9vNKFCiUaBgRshteQzNQjgY8OzwobWOtb3+6A+eCtuJyteL9dOUw?=
 =?us-ascii?Q?TvlPIGW2ljWVAN563rKujmPmtSqZrBPEITxWtLg+JWMBIaJNcV/Ch44pdHS+?=
 =?us-ascii?Q?QucssFUoJBSQBt3UB55hzUinHvXQRkBqeMOQimV5MjPf++Snig4SL2PSBfIx?=
 =?us-ascii?Q?U888aFMqSNgwqMmJGOHbp/hZugtmtxneBuS8LLyoO+9ttFv1DKMYjfC7Ny/+?=
 =?us-ascii?Q?WroR/rv0/GJozphdFX2e6enouw+4/mNtnjE3TUheof4YUwPTDTsA48H7k8dc?=
 =?us-ascii?Q?NXzCdNqi33CzwjLXnnKRwyyz3L9C6oM2Dmb+ZNW/0VNFDBb8LUllWJeW4qhL?=
 =?us-ascii?Q?1jwYPg6uRcqWCQy6RcvQwrZaTsJ8q2Cw4ZaAHCWsJg4Gc3byEJXAnDHuzK9O?=
 =?us-ascii?Q?HX3sM9sYwLgtATEf9Yy9i3XI8F4ioWVrE+KDPRqBi4Aretrl7bpNzFJjPe4m?=
 =?us-ascii?Q?6PPajI0tnIzJJqX6F72yHlzQAQUQ2yFoaJxrcSfipElKheOADEtqi6ZXFenk?=
 =?us-ascii?Q?1UKAUxaxfFfCkkWbzwly/NmyFmUTmpkRDvAvUKfKDnw9ZPsEcIGpyJCU9Qio?=
 =?us-ascii?Q?XHoL9k1U38tyN49BMe/+Bt/r+iRry0TgZYLMQdutn//ut+oVQb6iu6rWebDZ?=
 =?us-ascii?Q?BHl4CHKBIflTCxm9asO0Z6ZsEdOzT5dGr3/5deVAU4hxrvW28jTUSEa//TNm?=
 =?us-ascii?Q?e3/ecBr7Mo+oCe8mR06sesaWV8H9GrqF17mdYS2xl2VxbeThfu1bGvUS2GBz?=
 =?us-ascii?Q?/BqoR7mzr1LY0g9z2o93mZzW68oX+XaHbj4OsAv47ZOORH03adRbS3WFvtKp?=
 =?us-ascii?Q?hwafBtJxNXlcUKyjLb3f/CYKZqT/fQDXI8KpGtv6BDvXT3Xcl6oa7hSfYqMr?=
 =?us-ascii?Q?h/34Z/NjKPTzaOtOBhQ3aZguoJXOnljB0M/aN9ujvVIZbnb/Il/bZ/Dfz913?=
 =?us-ascii?Q?/FRpxqHmP/sqBj7orrRz+pNuC+QMkQf99Ez+f4IQ/oefKNKsnDWk6z6zrFZS?=
 =?us-ascii?Q?4ynkj0TlTu+/7NIDVkrmCj5HuJvqz5J5maqbzic7Y+q28YmdyRo2XtvUk2m6?=
 =?us-ascii?Q?yO/oOICJ56JSmRxvaG3Ger727BrNvBJHJpCqylCmVcdKwVTWFhsCiZotCprb?=
 =?us-ascii?Q?lvy1t5V85rxEYClwpya8tpEKyAIeG8Y6QtZW8Jf2ZaYq39v2CqbOmKGugTGG?=
 =?us-ascii?Q?fX+j90HNO67eux9C0XvW7VRgBamCD2W+ZUUmC3fD0v1Dw3Mz4d+CoBdS7L+l?=
 =?us-ascii?Q?UmiYex5O3jDFq0+N7UnO3bi/DU6pHcu9WiozuYpLDecjVPInYT2qGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H/wAhRuaLhj+s45lLtSzPawR5ToPLj26stUCsaftT44bovHCmr52KG00e98q?=
 =?us-ascii?Q?BlWoN7tAVXdH5j6Ses4B68tAVQ7mStDKcurYASqoveV+4wGcubgcBus15X7p?=
 =?us-ascii?Q?wqf3iQkZeP7Y2t1OKfD9lPiAcIGf2s7unxCmkCQRfthUsdP1grW1bAuOrQ4l?=
 =?us-ascii?Q?hKKBHlzPTIallivy9K1z2moYRq5Nuq7IhTQmCDZZgrM8kbfDCF5MWfVBPrbC?=
 =?us-ascii?Q?0eIGQxtRekPBSiI+OkRHHzTCUJIWTIFCyKFR73RKTnHYbHVT592lTh/pF8l/?=
 =?us-ascii?Q?eqwOMtSJqrQn/oC+o3KnIip5mRN/ltkeBPWrl/kWeeZ12g8tD05NWEIaQakJ?=
 =?us-ascii?Q?wn630/es/EFGgSyZavHfTjMlFWf+A40v0uHYONZbPXpCUVGXt3CrKx4pkL8L?=
 =?us-ascii?Q?L0xOPHdkkshT8ljQGdvuTT3R319jIhBgmd7box50fo+b7uGFFQ/N1slGfFtb?=
 =?us-ascii?Q?vNMPzaBcKpP81u9dn4h/q0amrxDgsmH1qCkshzGveJ9AwypgVnM2wMIj3Xvc?=
 =?us-ascii?Q?EVerCPuZyyhNdqKvD15j8uB0MYTooRuYsGR/jXDQwfClbDpqzCrSmggfAk+p?=
 =?us-ascii?Q?vZIYFSeovCh6bvGgThbmb+duck+PxUNmd1gdy0TTlBVUg7mXDtHdspuop281?=
 =?us-ascii?Q?D2j7F4uyMNy0ZKoMpv2N+vv4D8aZzzG/0cGukvklAfeUoKeH31HAqe4SKTsw?=
 =?us-ascii?Q?MZjmYm1qowb+Y8fFSiAlB6ncV/324TCF2ReauLXFP1GMYadqQYhASNQqk5rp?=
 =?us-ascii?Q?LjJVzp9tykyjIBk4ctUss4S7yyVg1rLhJ8a7vyfrrOUb/alFKFhMEka3c2Ch?=
 =?us-ascii?Q?PIcfaMhnwSd/+Jz9dIE9tOjm/HSXfn4BnVEnjemZp5PxB4w7sq/teWwaXmbl?=
 =?us-ascii?Q?hwERuWB/rfmoHjL8qT+d0pCy9nzcAhh8mG7bDEJiQEYdRzE6cmuDKAkDoxSA?=
 =?us-ascii?Q?Ma35U48+Y6DgJN5zB0MWHERJNeoH6ZyA5LDiTvz6jllydGiF9SWRQ4Qv3T6p?=
 =?us-ascii?Q?d3Al8IUpQ+LF7fPSgT9/Id5Ou6QrWOcQwkGwIxmKgCt7VQuUm7fJ5qUh+Eb2?=
 =?us-ascii?Q?PT1Jo+fUJTbVlcFzeC4RAZ+bm++z1wnnP8+CbalWnYoglWe5MedfaP9jPVSl?=
 =?us-ascii?Q?fm69/Pit6yK6IY7dZ4j6QFqDvhEARTp4b3c2999QQsnwoqeQBbk5t8BdYkQU?=
 =?us-ascii?Q?hbVrtQMF7NMRkyCFSorFvMC9jTWOqXnw9T/GXY2vyFCeC1GSKavAcHfcydfk?=
 =?us-ascii?Q?ECrUGlITXu+u1JID8KnDPD/AUYbGHnbhcupuyEAd72DByVMm4o/qLgfR3Bc5?=
 =?us-ascii?Q?UP9qzJ9Spbo5uTrUg/fznQAoB7otsNh8tz+F588UsxLHq8mdUmsI011qgRgX?=
 =?us-ascii?Q?lKk75fD1oegd4c4hWoWg9iqqauH08PkjWXuShw5rTq4YlfVmyFAWxdDoKouW?=
 =?us-ascii?Q?LvosUDVtqMbyGVl3+cQH7iYaTT23gJ5j8IL6gFea7ic5cCbAq0mAuhfXcvd2?=
 =?us-ascii?Q?NpJ6Ja9aYkLJHwSiekLb7QNRlMrGwmA4xrBi3nWK+PIHwWYEsra42t//c5x3?=
 =?us-ascii?Q?okbnwl+qkukV3aD93p4F8sxGvJICnfTqUTcb2k0a?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3efd589-9572-497b-5f85-08dda3c6c3b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 00:20:24.0986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sC4GZspf++qw/McjIUmmkrXaO5ksMQcONwstlKhwHBiw/uTDJmh3k9dBVAvN8oimdQoPmpsuOijrGOI15bI6fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB11280

On Fri, May 30, 2025 at 05:17:08PM -0500, Adam Ford wrote:
>From: Marco Felsch <m.felsch@pengutronix.de>
>
>The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
>VPUMIX power-domain nor their module clocks since the power and reset
>handling is done by the VPUMIX blkctrl driver.
>
>Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

LGTM: Reviewed-by: Peng Fan <peng.fan@nxp.com>

Just curious is there any issues without this change?

Regards,
Peng
