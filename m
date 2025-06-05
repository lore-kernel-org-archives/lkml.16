Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010042.outbound.protection.outlook.com [52.101.84.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF531F4176;
	Thu,  5 Jun 2025 20:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153879; cv=fail; b=nhBgi2ieqK/DrXwwbuE3NbVuOPVbJuuhrpOIrYHPf8beIu+6FdFueP2j3TOxP/2Z1CacD4nPMAK19Uli3h6WaHoWUJN/d12fHQ/+039d3/2YuQOnHLtiNkxpUnJ2hHjvJ1QjHw4YKFGAlbjlUqRTpk8kM5dOJKTAjgxuZvOBwJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153879; c=relaxed/simple;
	bh=/M9N3Eprif0QgAZxGdXJgolvT7Jy7qELPMifkyiYvzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M/NFG4b1vfJAQx6gmIkfiHbDY3JJdBCZFVlxg3AVztjwdcbbEW+t7aMMd4/Eyd+ClQQLa5btj24UOj8b9e/elJIG8nj0D5awIZDgjlgv2ULLHGHa4XPytTKV/sej5iveRV53ySyWKC5VwQaO5jMZlIUZmZsv7K7kDOThudD5lZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ka+0JbLn; arc=fail smtp.client-ip=52.101.84.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ka+0JbLn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnv0IR6gpDPOqWy95GBSSJActZMshGYlBp+LfqNLSOBsC/5dtv6mzuG9Xww40aSn/frjaY6yk+PO1g2RemMmrrNk5xpQypp+arOwX8pQ8mDTuc4hjNJyobK+QLKOn5ztUHyf9CeiYLs1rOYkePP6MA9cfUkN+j74+kEHYliQYrl2F0Q0YD+Zv9JzyJylSwiRfT1+8AfP5tXRs9S3dBdeQJU3Q++u2aI8TRboQjoGxvblSji+beHlTEjYD59SQOBBF5YMiPOmDPVqijyIOBjpHzBe/ydxqltlNCumu/GXyK7G7uTpFpgiPZk9u0VMSPJj+xyGE1BwNkVH/bDqfeK97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brXpuDgJg3xnOdTtRgS66iiAHoMvszvBUWAfbDzpI/8=;
 b=b+iP62FEuCofvDipOXE7q0DEo838OoHS76Zt/HUpAERLFrGEJNYJydFjkfr3qFBVBinCCUiMgWxm1ZnmutXubxacvT+0T753dnzulu7ZKmyEAod9rpAcFidlAqlSm3ynnKHShEoP91TvM5pZBzTuuYQ72sc85Vj2uk+Gp2ONWJ/+f61bX7leAbY7VVx4GcMVNJl6Lpw9YJ+q9RkpyxUIumSx+B2mttg3Y1Znjk7K0mVszY5o4E9+ZvCghEi0kdtYZ95siUfYQ9FN9ELWl/MmjOz7fxqs7P4ymkK/gqXQSJabWfct19GYV9EUYBARJpzLTUdWoMDo3DVAxJp3TBAuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brXpuDgJg3xnOdTtRgS66iiAHoMvszvBUWAfbDzpI/8=;
 b=ka+0JbLn6LL743pnQahLwJoSf4wj98vtSPA1GaiFiFyVgcR18ZQ3FR6J/HQQSY5s6cxflW+HTEGel5pmSyHwqMAdIZE2Ctm6pLsFo7q0cyqdK4MIs2HYMBlhb74ydDMsy6L+ZhF5nXqFJBwvrTtZhncrw2aMkm8EU/cY3XrRRIgmc1Fe6BRUQNGmylBlhMDfvUWJXY2gZ2KF4g2fyB9dY/Qcmt3aDz9sl4aXu95Loc5myarjq3f9/bDr82SRCk02NjzXPsvgr7BYaS1ATLBct42y3O8plRg6Ca1YyhA3e/Y5BFI6qBXzhMVhkJTS/KLXuBT0mf6R/GYLkfil0HZn8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 20:04:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 20:04:32 +0000
Date: Thu, 5 Jun 2025 16:04:23 -0400
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
Subject: Re: [PATCH 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
Message-ID: <aEH4R5euW19fO/0f@lizhi-Precision-Tower-5810>
References: <20250605142728.2891465-1-goran.radni@gmail.com>
 <20250605142728.2891465-4-goran.radni@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250605142728.2891465-4-goran.radni@gmail.com>
X-ClientProxiedBy: BY3PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a495d33-31de-4724-bb01-08dda46c2fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnNCZFhCTDdZUGlhdCtGclhXMUdRQTBRVExrVCtyNDJlR1pmOFMybkNST1Ay?=
 =?utf-8?B?QlpVSmgyam5yM0tGTEk5L1doN0RoNGlyWStkZ0R3SlovQ0Y2TW5PR3hvb3Js?=
 =?utf-8?B?TDBOR1BoTjZaeklSeUNUS0k0bTM4ZXFDd1kxMm9SRnJOVllRbzArR3BUUGh1?=
 =?utf-8?B?ampkYkFkNlVyRHhoM211RDZpT01ZM2g2b0Y3aU1yWmxkS1BLT3dKdDh0VVRY?=
 =?utf-8?B?VytYN0VnUlZFbU5EcHhIWW5iYTdlUjVQMXpLWmhHeFJNYmJWS3JtL0JhYnVH?=
 =?utf-8?B?elVDbVBndEF1RlJnRHpSazQ1b2lYZVo3WVczdE1MczNNSFNRbXQ1T0t1U2Rt?=
 =?utf-8?B?TGQ1ZTAvQ3hhak9NbEFiYWdkVnhzd09YNk15LzE3VEF0KzJDeEFHRlgvZURH?=
 =?utf-8?B?RlpJYVY1U1J1YVVuZzJhZitOaWhBYUo3bUZMT3R0Mktqam1NWW8xVjZyV0Zz?=
 =?utf-8?B?YXpKY1cyUVNWLzhuaWtVM0pCSm5tUTg2cDIvK3l1WUpwZ0FkZ01zSUkxaFR3?=
 =?utf-8?B?dTZnMGlMS2RTK0dubm5GdjdPV2tnMFNsTU1DS0lxRXZDaXhVOTJjcVEvZnU4?=
 =?utf-8?B?bzlxVE5WS2pzNm0vbE92MXRWOUlwd3pqdVBnTVV4bHpxa2RRZnEvNUluKzFR?=
 =?utf-8?B?RU0wR201OThoeEVPMTBIVjBTeVhudFR3TEx4RVBxaVNzVE9TY3d1d0FaOE1Q?=
 =?utf-8?B?bGRvN2pZSDlDU0JhakJrK1pvOVFqUExvbit5QUFDakdzN1lYa1h4bDZiZzBh?=
 =?utf-8?B?UStYdkVHdHI1TjVuMUl5dmFwZ2NZSXlnUllZcHpBMkVBL3d1MlpYTjBrOHVH?=
 =?utf-8?B?Wnd1TGIveFhKakNLcHRNaEtjZnVKY3RaQ3pleGdNMzhkZHdCNVNIdk9aUHdY?=
 =?utf-8?B?RUhtNGplZFV0RVdBS0RvZTZ3RXdGSDdIZXREUXFRSGlnV29UcURveTFyTHQ4?=
 =?utf-8?B?QzkyZTBMY0JZaWc1N1grbXVCS2taTWx3dkEzYWlsOUEvZTdLdDNBWVpSK0Nv?=
 =?utf-8?B?T01aeklpZUhXbnJTVVBZWUZWTGttUHhSRTFJcEx1UE9CcFJ1UEtEUENIMXF5?=
 =?utf-8?B?VUU0eU0zNVRTVmJzZTM4SmxsZ1IwNGZMdlJJZFpYWmg2NEgvOWs1UkJaVnV3?=
 =?utf-8?B?WDR1bkswdVRZS0JWcUJGY3UrSnBsU2R4OWtmTEdQbW1QUjJCNW9DcTBZeXNJ?=
 =?utf-8?B?K1c2TkdjM1diL2lMYnU4N3l6OVRtWW1TdXJ2cE8rOXM1c2kwMlRSZXgyQUxn?=
 =?utf-8?B?eXFYK3JJbUxXOWk4b3ZoUmlueEpBaWFOdjZESklpbVF0dDIyanZyQmxPd002?=
 =?utf-8?B?bTVHUGVvT1dyTGh0UTIvYUhOak00dmRpUEhwVjgwcDFNTWhIalZkZjU3bXJu?=
 =?utf-8?B?V0VEUDdYb0ZSTXFSUGVEVmdFNkMzTjk4RzlWeSsvVDNNQ29COWJrbUU1Mm5R?=
 =?utf-8?B?d3FTWXpEV09zZVRxb0Q1YnNlam9ZT1NWOEtzd20zMk5LT3ZMVmJCZWoxWG52?=
 =?utf-8?B?VGVsREZqMDZ6NTh5RnhWY0FrY2Q1K2NFSkNWeDdxcXlaM3lCTHh4NmJhRy9U?=
 =?utf-8?B?R0xDU3JBOEhuYm1NT1FDZnE1RitrYnpjb1dqRlhSY3k3Z3l2UjdmZXdUa1k5?=
 =?utf-8?B?eG4wWmlmbGZuQVNsbmt6cnQxWCtqV2FOeDB1ZDEwQUZ1dW14aGo5NzZEbTNB?=
 =?utf-8?B?UUNuUUlzYkZLUTdIcmpVeitWMlpnVWtaYzQzeXljYm80TDFxVmxFemhhVGNx?=
 =?utf-8?B?TVl4NjNNNkQyL1ZTb3NBN2xHYUwwZXdMNlpPUlRTbFVUaGVtdUhuSWloK1VN?=
 =?utf-8?B?NnJ2QlloclpvNWMrdWxBRTEva3BvTUs1b2VWNjBTRFloVDNJVGlUYXcyUjdD?=
 =?utf-8?B?c1ArVGxWOTNxZkZRVUNKWkcvaHVsWnAvVHJ6WXFDRk5YSEx0d2t0T2FJQ2g1?=
 =?utf-8?B?UXdLemtqUzE0eEc2ZVFhRUszVzcrTE9WTHljWGFvMWxENVBnd0JKR2hEYUs0?=
 =?utf-8?Q?FCf9b2V4tp2OK27n25d7G5lSRTqgR0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXJuOW8zQnBzaExwYWJxRlJGY1VEd1d1MXBUalhzSHZmaEUwanUwaUx6L01v?=
 =?utf-8?B?dzU4NmpkNE5PQlM2RWJ0UVMvejJsSlJqTWs5KzdITG5TZG1aQnFST21US3d0?=
 =?utf-8?B?Q1FYMjRzM2xEekpncFllRmtkbkR2b1hZdFdXa01yOUhPZVhLYTJQNlBiWUF6?=
 =?utf-8?B?RHNIeFh5eXlSYWZSbzhQUHdES3l4LzlHelpEY1AyOHZONHB4dUdsV1JkSERt?=
 =?utf-8?B?OXNRU3BBS0QvRWsvUW96dThHUTJCTHNLNUNEMThoWkFENFpxRzdaS2RTL2lC?=
 =?utf-8?B?YklwRGFWNnU3VWV0dTdqMENCdk80VWliMlpEbEQ2VDJla0RNV1h6TWlxUEx5?=
 =?utf-8?B?WktpbWh4ZGx1SUh1MlhJUkpmZEpxbUswbWd5N2pmSnRUWDRmN3pMdFBwL1dD?=
 =?utf-8?B?VGVIclRiQWVqNWpVZzU2S2x5NnBKcWxFVlBGdG5DaVRLaWJJTlJjcFBGQnMr?=
 =?utf-8?B?UmV6Y1ZBaWg4NlpBaW4yUVVrR1dYVi8zNGtKVjNLcVR6MGRxWHpIT0ZzNVI4?=
 =?utf-8?B?cnJ5VkVCaWtTZUc3bU56d2t5U3E5MWZJSnFLdDlpVFcyS3IxUDlvcEdYTDZU?=
 =?utf-8?B?NGx5N05jYk9HYlhNQWh6dTd0aW0wRUpnZWQwQ3RYaGRXbEN5THRzdTB1L3Mr?=
 =?utf-8?B?dk9JTzgrZWZ2N0F2a2pIK3Y2UFk4KzFlZ2hMMGZxMEtZc28vRzRLc2pwNHBC?=
 =?utf-8?B?aTBQRlp0Nkx1U3grL2FOSWVFWmdCalRreDBYRGt0WHRRakRMZytCRXdhUDFY?=
 =?utf-8?B?K0FMVkFUb1VJQXVpMTFLSDBkWkZvdkNxd3FFRnRxZ21pVXQwaG15c1Y5S0Fl?=
 =?utf-8?B?M0FITGw4VzdPTzBJcUlseWtXaG9PNG41K0lTQmsyTlJOZ3BJN0xrTjVjQ292?=
 =?utf-8?B?aEpuOUNGQUhqSFl0OWVxbmNxV2pGbEQ2ckZKeVhVRVJCcm8xVFluYVNaSkUw?=
 =?utf-8?B?VXRnWUxkZGRyajJmR2YwVHZYUVdUYzdsRDJ1YzNYV3B0OFJuVk9Id3ZjWXor?=
 =?utf-8?B?aSs4aUgwbk9xdW1FM05qTXp5dy8reHhHTGYxaHlaVWFQRjRiU2x2LysvMmZu?=
 =?utf-8?B?WXh0cUFDcks3aGx2Y0NnbW9JWklXZjVxWE1mNVBXbm5GQ3c2a3hWTXpiVUVN?=
 =?utf-8?B?eWZNdGhLbU54bE83b2xybDZjY2J6YlN1TkdHSytZRnlRRFFoV05ITEFMUmpD?=
 =?utf-8?B?N211UXRyZnZrUzM3SGVhWllnUU5DL0RVK2I5SGFrSENhajN4L1lrUXRscnYr?=
 =?utf-8?B?WUtCMGw4dTExWTZFNXlHZ2ZQRjFraTJBc056TUd6cUhtU252eDk0ZHZJNWVJ?=
 =?utf-8?B?WGkyUkg0K0Z6Z2tQWkpwMWxwT0R2US9wYXNnMUk5WDRFTndiZDZaOVNvSkRk?=
 =?utf-8?B?QVU2aW55eWZreTFPMWg4bzVUK0p5b1d2NDVjaDZaRExmRzZKSW1neXJyV3hF?=
 =?utf-8?B?YnE0RUR3Njd1WnNidW9nVzRsTk5PL3g4c2pTaWRpTDRyaUsydEFvdVd3UFFv?=
 =?utf-8?B?LzVLUjh5OVBYSG1lWUFkNlBlOEFpdlo4Y0w3WkczTThLb01IUm1Bc2ZjcDVX?=
 =?utf-8?B?M2xsQkNRTHRISWE0L3Y1UWg1Z3NKeE0vS1NYR0dHeldIb2FLUEJlcko4UnZ6?=
 =?utf-8?B?bTNERGY4VU1lQTdjZldRNEVreE41cGE0czhIckdjeWFGcHNPMkdocFQvT0wx?=
 =?utf-8?B?dXMxcUlZRnhNbCs0QUNoZE5xNHFKMHMybTJNR3lDUks3T2xYUDhmbFpDalo4?=
 =?utf-8?B?R0dqaE85ZlVKenpsUmNvejlERHgwRk0vbGVQTEE0YVlEdFRFM0JXbnV2THFh?=
 =?utf-8?B?TTNTVW5OWlF2UkpPcERkaDYwb2V1YmxPWWp6M2ltZmw4d0FKK0RLMmNFSFhR?=
 =?utf-8?B?M1A1MExReEliVEpKaGk5Q2RRODNXVWVvNFZteCtPbWV4VTRwbjN6ZG04QmVs?=
 =?utf-8?B?WHdHdDdtSFFJS3MxMGxMemloRldXc29YZk1MZElUNnltWXgrZFUzSGozVXVI?=
 =?utf-8?B?QVJIMjVHL0p6SWx6aHhrcWZTemJsanVRY0lnZldueDVIdGlRcTV2TlE5V1R0?=
 =?utf-8?B?WE55SFNLSjlCVzIvbC9RdkRuNXJ3bzhUenV0Y0VPS2NwNHA0c2lHN3E2cjJF?=
 =?utf-8?Q?LbvoejLRNr/aSaAv8r31axdkt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a495d33-31de-4724-bb01-08dda46c2fd6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 20:04:32.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFGxKZk0W70OGFVvhytP23OjfrSDD7i0T/9J9hKyWC35bX1l9RvfOAJgzXwIz7ZKPU1/27jvibVA9wTTLfy6bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On Thu, Jun 05, 2025 at 04:27:26PM +0200, Goran Rađenović wrote:
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
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx8mp-ultra-mach-sbc.dts   | 907 ++++++++++++++++++
>  2 files changed, 908 insertions(+)
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

new file, suggest run https://github.com/lznuaa/dt-format to maintain nice
node order.

>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
> new file mode 100644
> index 000000000000..7a599250e697
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
> @@ -0,0 +1,907 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2023 Ultratronik

2025

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
> +	nfc: st95hf@1 {

use common node: maybe nfc-transceiver

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_nfc>;
> +		reg = <1>;
> +		compatible = "st,st95hf";
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
> +	pmic: pca9450@25 {

pmic@25

> +		reg = <0x25>;
> +		compatible = "nxp,pca9450c";
> +		/* PMIC PCA9450 PMIC_nINT GPIO1_IO3 */
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
> +	atecc508a@35 {

crypto@35

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
> +	ptn5110: ptn5110@52 {

tcpc@52

> +		compatible = "nxp,ptn5110", "tcpci";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ptn5110>;
> +		reg = <0x52>;
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

extra empty line here
> +				port@0 {
> +					reg = <0>;
> +					typec_dr_sw: endpoint {
> +						remote-endpoint = <&usb3_drd_sw>;
> +					};
> +				};

extra empty line here

Frank

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
