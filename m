Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3556E19DF7A;
	Wed, 18 Jun 2025 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750275672; cv=fail; b=fGXtPiQcWTPnMJ71Qnqn6WI7ePwKxod8xoOOWKxLvb/Mh3FAoPfVZ8K/O9SYd+t9l+KJOXzSSH0X8TxUb5kkrMTdXVLK0Hdgv+81+6rsk1A+FuqImH2gp2q5jNiiyd+5H1F/fB8Rf3mmDdMVuRAuZiYKmXo6hjapmHi5SSLkC4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750275672; c=relaxed/simple;
	bh=9GoRUAiH3SYYEz1h/AHpdmlvGeyTou8K4g22j6Y13uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BA7YXpyIGEx5ms2Cq54we0ztYUQa0tz7xknFAuZQ4GzHJ9HTpKx+IIqsITNC8PZwATlXmtOwuDWyZUkPqYLlh+7hBKUnxII2uROYtgH96YRAWvpIBjYnliXGWBYPovw04ihaCXwvG+eF/k9k7C5PXWlKrKkoxDQGU2tk18KLEHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bfqHlgBy; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bfqHlgBy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0ylv2zHBsOs6j5gCILHdIIVqAn9PY8aqTVDQWXU0pxDKkhD5FbyCnVJ2ApC0GCeqJpT6Xu8p6T2hbhyKhl90EY4yCcq6Up+KtS3TvHt0t1OIuUaA+wCKkRPe3S+QIqYzsqzQxXLTn+oSKO6ym0bmVxUAB+fmxkcWFetZWlf/430wW64MKG5Bn0CSraPIoiuL0hmex1eXCDcFkWCY7vuR8692Uj5WtVaxinSUD5iIG5+VABeZCl9mbd/JGn4l2IxKk70cSqdR0UNCt0MZ+ExomXI07fIw+Jxhq1mlAgYFM89toO6niHDX2YzKO1+ItqRgS1SFoMUmE4jm9fkB825mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/RfxkV29b6cXZviPZ9Mo8JPQt251i5F2o1Gk8h1O4E=;
 b=amgdJJPba8yRtboRBR5ksLu9VJHoIBcA9FqbmbUcNmehcTh5WeP2BOuvVqhzKdq9F2gLNoETf/3PRkYZK7U/KT07YUfBa30APmjeLAH2GPhB9j2PZr45zZ5O+Pyb4ZkXxtgE9vzslN6hE9XGvjks3u8F19XmVd+JCHq4/bOhNSc+8QI0lBkGOFR1I7J6xVfLBuQKR5Yh2lkwaoiQcIqqwLwz477ggw6fZ+UUGyYJBpCgXhPNQnpAEgdqS7UfKWkQ9bQIjOWnvjOzDK2vN1toCXr40Ri+c7N0qCrQVuGvlqAcb2lTi1pUVzLu9Q1Q3D9FRoMo1sU6dvV+W0L/jq6W2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/RfxkV29b6cXZviPZ9Mo8JPQt251i5F2o1Gk8h1O4E=;
 b=bfqHlgByljDeiZFTNkvoEp4zHUS/qeOPt74r3oISxjX3hPM4xRVjCv9MPkFI2IR8UnuSAc6TOvcLvA1Q92QFwjVWRNeWmVJbjh0YaCOrUegNE/g8YhiVQvzaWyXYB7XmzV1Wd532t5Bdb5mscveLlFpfSH0nu3UIhjxoibtrJJNJ+xpsb6hkItdNDGEbabVP+gKs4AfmPY9oVprh4LgUrnULNP6bD/oR6COc78LNQwPXiYZ9Z7e+NolJT1WdHE3kJAABnD/D3uHNpW9cf6sz71zhgBLEI7Jlbn9bVoFNWXdgDlVX+yrPsNwbYNVN82xjsNqjU5GoLNq2sn6OP4+hVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10378.eurprd04.prod.outlook.com (2603:10a6:150:1d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 19:41:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 19:41:05 +0000
Date: Wed, 18 Jun 2025 15:40:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	gastmaier@gmail.com
Subject: Re: [PATCH v3 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <aFMWSpmXGlk7kjfe@lizhi-Precision-Tower-5810>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-2-e66170a6cb95@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618-adi-i3c-master-v3-2-e66170a6cb95@analog.com>
X-ClientProxiedBy: PH0PR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:510:f::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 5409e279-9959-41fb-3651-08ddaea010b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXBqWS9hY1Q3THAzSTJsTnpiU1lrWk5sTDQ5a2NiVXJkVHZPQXpiT1MrbWlK?=
 =?utf-8?B?OTdxbWVtYUZnZ3lERW5sNXlzWkltVlYySXV5V1lVTGk5TU1CangrWkxHaUdj?=
 =?utf-8?B?RStvQmNTNXNzQVJHQnRZNnBkbkN2RXZlbVNHR2crK2VMRDVYRVBZQlV6MFl6?=
 =?utf-8?B?RmtRdjMyaG5Qd1R1VWxlZk5YNGpqZDhyMU55aG5zNndQTWg2MWp0UmZPWkhD?=
 =?utf-8?B?NjgxajJCODdFak1MamZLV3BUWHljakF2YUNScGtGZTJtYUJrSm05Znh5QzBU?=
 =?utf-8?B?c2cwZ1hOV2cydmkwTzVocUlMQ1pGZG85UjkwdnhyRzhqY3BUTkpOcm55WUhP?=
 =?utf-8?B?NnZZM3ByMWowQTdwazd5d3lRNjlaWmFpdUxKbUF4amxVZ3N4anlXOGlrUVAv?=
 =?utf-8?B?SzY3dnV3L2tPQWtKTmJiTG9lcXhyOTFsQzU5M2J1WHQ5OENKV2pEWk1yejlJ?=
 =?utf-8?B?K1NSaDlEbDVVQnlTNmpSVzU1MThXancrckhFWXlKKzZ5ZzZtSmE3UzMvUVVM?=
 =?utf-8?B?dEl0VzVUSlV2WXMvaW9IRDVsTnkwYldhLzc1WldwZDROVmdKZURDWHhmZEo0?=
 =?utf-8?B?eFh3aWFWMHhKdk1oMllHQ0wxVlAvNU5zbmFMTzd2c2k1SUx1TUtRYVdsYm9J?=
 =?utf-8?B?TGFEc2swRU0wT1BvTGFSVnRyeStDR3lSVVEvcXliMGRiRlhSeHFRTGpVS2Fl?=
 =?utf-8?B?SVovRGx6WWJhN0t4VUJLNzh5dEExSXpQQUdDcnMrV3hGR29tNFIwY2VWdVB0?=
 =?utf-8?B?Z0RUbnhWeFU0a3ZJZXlkbzVxUWRDOTVhdGhteGxTSDdCOXh1b1hPekNoTHpP?=
 =?utf-8?B?T0g3YWM3b2RJUVB2TDJsbUg1YStZTWVNc0h4MW5NRzZlMlN2c1RteXFCenZx?=
 =?utf-8?B?Q1FMdXVXdzFIS3VpTk5peVEvY0NNNHFhTkFzTnZyV2JqSlE0S2RhdFRkVldO?=
 =?utf-8?B?ZHJkTE55L2t3RVlDSDJtL1lnUWxpYWM2WjVlTGtHYm5SWkFDclNtNmV2ejVZ?=
 =?utf-8?B?ZzFVYTRTV2I4bTZRZEYrWmRIVlFDZzkrdXJBa0huMGxiUVFSdHk2MFZvTjZw?=
 =?utf-8?B?QnhZaHpxUXdJTUpmNkZHVXV4U0JFTExXNms1dTIzd21BaFpOZ21Ld2gvdXhn?=
 =?utf-8?B?aWdPd01wdjFpOHB2SnkvVloxTDNaZStEZGFSblYyNVJvUXFjOE53ODlkcU1E?=
 =?utf-8?B?K3FMUlVzR2Yxalp2ZUFOc1U4b0dUNmFmeWlRSStrU3VrSk1rNUVaZHBFb2Na?=
 =?utf-8?B?QUVUYzN0YU9UL1JwVmtaa25rc1VNSzQxbVM1L0JSWmd3YVZQbTNYOENGVUtF?=
 =?utf-8?B?M29hODVEZ1diUzUxSTlKMUxjcGY2cUxKYXc2QUZmNTZEdUFPdUIxWkR0WXpU?=
 =?utf-8?B?M3Z2SXYvdG5qUkQwckdzRytEekwreGRDS0RTR0pCOFhOOE5VaXpiNnByQU5O?=
 =?utf-8?B?SndvdHYxU2E4bkdBNzFmK0w2RC9sT1ZpdEp2dWhwZ3VFVXdqeE9zZ2ZiTXd0?=
 =?utf-8?B?L21XSDdETmhJcWNnYnlDcWU4ak5MS2FDYzFEUEVnQjVvZlpGb2Zsdmk4alRq?=
 =?utf-8?B?UjM2R3diWVZybFl3YnA1QVUrZ1owcEw0RVVMWStBcURJY0xXcmM4eEMwcjRG?=
 =?utf-8?B?bG1jYWdJeU1mT09rVk1CUy90NDk5TGxNR1NySFhwanJ3aElOb0hxK3JMMm1O?=
 =?utf-8?B?TEpYbW83aWIvMHhjU2lGR0pWakpONFNNS2FuSXQ1SG9jWXN0UTBoUS9SdlJh?=
 =?utf-8?B?M3pvOFB3a2VHSzE2RkhrbmlyVHQ0dTFYWWRtMlVDZzVXQnZIb2tHMG1QWk1m?=
 =?utf-8?B?L2JVVW5vUWNvanBEUU8rVkoxNHNrcDNpaWF0ZUxVNjZ3alkrN1hGMmsrRFh0?=
 =?utf-8?B?dzlORXFWMjNWcWVDZnI2SGU3M0lHZG5SSkI2d21qTkNIM3RnbGlLNWpPSGIy?=
 =?utf-8?Q?7AscdGRSvDc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1ZrVmtYd2xKeDROMjJuZkd3UWJiTnVKNDdmWVQ1ZFBwaUxCOWwyMEIvbWNI?=
 =?utf-8?B?enJYTU1kK0VNNlBqT0lhbkx0NCtSaUx3eVd4b2dJU0pER0VWd0hDdTVweGor?=
 =?utf-8?B?akE2SW9CaFgvN2xhd1kvUHNvUjdyc215VDZpY3g2R0dOUGlGY1RXM1hVWlhm?=
 =?utf-8?B?WFAwVWxwOVYvWGptYWtmZWV5UWtLZC9TOXBBVUc0ejB0bk5qV2poZXNuZVMv?=
 =?utf-8?B?bDc2MkZrWHZRY3YxSWpoZ3VGdTg2S003R0FDVktEeFdEeHcwd0NnakhiTzYz?=
 =?utf-8?B?NXFFSExCdE5NMTlZdVVlL1BKd3o2QjVQc0tScklIRHg0c1BwSXMyNUhwVlA5?=
 =?utf-8?B?OFBwYlhjbGVjWkg3c3NBNW9QWkRycDhQeGZxdyttTVhpUkc0UVJXNHdsaDB6?=
 =?utf-8?B?M0RzU0hIUkFuU2RGNnJLYjQ4c3hRNTNRSm95eU40Z2FRc0tMUmpLVEplMkFl?=
 =?utf-8?B?cWtjWlhqUE5OOGRObzRSbzNVemt0VGtrTzFnMzdqeE9Gb3hzZDREV1ZCUmZI?=
 =?utf-8?B?OGxvYm00TGJwcmlkVGdac0NwVzhwTUlWV21XdEZneDBsUjY1akxFNGRLditz?=
 =?utf-8?B?VTFLanhvQzNpVHVyNjZydlVTVEdiN2o5d1pXbHJTQTlKY0dKckExZW1FVFZt?=
 =?utf-8?B?QkRnelNHTFFsa1BZR3MxWEJEUm1mbWhEb21NWGpkRmlSQTBBMC9GL3FDU2pt?=
 =?utf-8?B?aGRNK3YyanRNNFVpSEx6amRPODhDMzlxbW5DdnB1WEVmb0NiV2sycTJHeXRI?=
 =?utf-8?B?cUNiNWh3REZwV3hQTHJxT1Z5V00rMzViREVCMVVISXc5QWxWRCtzVkR0R2x0?=
 =?utf-8?B?OFk2RmJneDBlUWFELzE2V0hMWitYRzM1UkJPNjY0S29seU1sWkVGQ1IwZmlL?=
 =?utf-8?B?Y281eE1CdHp3Zm9YVkhuRlMzY1JCMkx0VHo0TEZpUVdMVHFMaC9DNkRmcDlZ?=
 =?utf-8?B?YzBOV21hMmhqdFNaS01VemR6U1Jld3dJNHhyOWdIT1NpUXJEay9oOXFMQjRI?=
 =?utf-8?B?cHpDL1hpZEc4a21zOGRNZ08zNStYbnJ1UElqTjNJL0J4SXZvYmN1eGd1RDcx?=
 =?utf-8?B?VVZkMzNFNVpmV0pDNGhaZ3dsZG9HbS9QcjlmNGFyK2RTL1Fqd20zLzNnaFNC?=
 =?utf-8?B?aG5EVHowNkYyTGRMSmVjZE00dldGNldNdThGaWJqVG5GQW9LcFBaTVluMTdZ?=
 =?utf-8?B?K3RpSkZ6SWY4TVlDdkk5YWZYNk96OWcrVnVzektERWJ3dFVxQlhTM01LUTkw?=
 =?utf-8?B?QWFiQm1pTjNOK0FnVkJLSjF5WDdKQXFPUWJTVHpra2RQQmV3RjRjLzV2cXlq?=
 =?utf-8?B?ejdkMExhMHdLdnZUb3pBRE9pYnFYQXVVemhoRFV6TnRna0YwR0hCQlF1ZGo3?=
 =?utf-8?B?RndCNUxaL1VhTVBUU000OXNyelhxRThZTWpRRGFWblVTSzlYVUZYMjRhUTJr?=
 =?utf-8?B?WjhvMDR3R0JvbVNvSy9HNGdUeDUxVXNYdHJQOU0yeXlNeVcwckVkNEd3czh1?=
 =?utf-8?B?WjF6MzhkUk5tbHlKY213UEdrTzB2MzhYRFBycTVZK3VRNXVoeGVia1pmRlhJ?=
 =?utf-8?B?RE5rUURmUGxabTk1b0NOSE5CNElQcG1GejFDak52bnVQc0huVWZKSzdxWVU3?=
 =?utf-8?B?cVc1YTJ5UHBFMTFNVWhrNzdhR1YybXkrZ2tSVU41b2l1UWtwemxJVGl4VEJS?=
 =?utf-8?B?Y01ucWQ5R2Jra2ZIb2JwVTdySHlublpzWnMvbzNVMmVrT2ROeHd5WnhmeHNh?=
 =?utf-8?B?MWZ2c0xTRW9rRi9tazN1Zkk1akc5YTVDcDhUWVVwcWZEYmpjUTh6cS8weTU0?=
 =?utf-8?B?T21EalRwY24zaWN3TEVUcTBiVnhkS1VPUjIyT1o1U0tMVWFwU01HZGtpOFlT?=
 =?utf-8?B?WFY5UEloQmNaYUVTWWdBSHdtSFVWRkJ1Rk1PSVc0NGp0Q0Rua3B4eUlTeVhy?=
 =?utf-8?B?SUpkVFQ2aXBWUklsYWRscmZnSm5VTXc3bTBhc1ZuQjBtcGNUNU9SUmQ3RURO?=
 =?utf-8?B?Rk5sZFVxdWN4bnAwVmNaZDgxRUgyNmV2dDV3VzUyNWhTZmg4bDBkVVlTQnRk?=
 =?utf-8?B?NkJOOEVVWEN6WGtJMXBpaEdmbFR6UmVyL3dtT1hJZ3diQXJIRXV4UTVyMmR4?=
 =?utf-8?Q?x08Y=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5409e279-9959-41fb-3651-08ddaea010b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:41:05.8327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+e7LR13y3jzOeUZMkbPpcUsNDdhlN5wAH/ayxEwejMVxBACvYLwz3DbJyqWX/GSm1tgiSlwZY+duA+V21SiuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10378

On Wed, Jun 18, 2025 at 09:16:44AM +0200, Jorge Marques wrote:
> Add support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> core that supports I3C and I2C devices, multiple speed-grades and
> I3C IBIs.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  MAINTAINERS                         |    1 +
>  drivers/i3c/master/Kconfig          |   11 +
>  drivers/i3c/master/Makefile         |    1 +
>  drivers/i3c/master/adi-i3c-master.c | 1026 +++++++++++++++++++++++++++++++++++
>  4 files changed, 1039 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6f56e17dcecf902c6812827c1ec3e067c65e9894..9eb5b6c327590725d1641fd4b73e48fc1d1a3954 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11247,6 +11247,7 @@ I3C DRIVER FOR ANALOG DEVICES I3C CONTROLLER IP
>  M:	Jorge Marques <jorge.marques@analog.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> +F:	drivers/i3c/master/adi-i3c-master.c
>
>  I3C DRIVER FOR CADENCE I3C MASTER IP
>  M:	Przemysław Gaj <pgaj@cadence.com>
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 7b30db3253af9d5c6aee6544c060e491bfbeb643..328b7145cdefa20e708ebfa3383e849ce51c5a71 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -1,4 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config ADI_I3C_MASTER
> +	tristate "Analog Devices I3C master driver"
> +	depends on HAS_IOMEM
> +	help
> +	  Support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> +	  core that supports I3C and I2C devices, multiple speed-grades and
> +	  I3C IBIs.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called adi-i3c-master.
> +
>  config CDNS_I3C_MASTER
>  	tristate "Cadence I3C master driver"
>  	depends on HAS_IOMEM
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc85e5eaf2966ec0c3fae458c2711e..6cc4f4b73e7bdc206b68c750390f9c3cc2ccb199 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_ADI_I3C_MASTER)		+= adi-i3c-master.o
>  obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
>  obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d4e0756efec9588383ac55ca9ea9228368ce767d
> --- /dev/null
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -0,0 +1,1026 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * I3C Controller driver
> + * Copyright 2025 Analog Devices Inc.
> + * Author: Jorge Marques <jorge.marques@analog.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i3c/master.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define VERSION_MAJOR(x)		((u32)FIELD_GET(GENMASK(23, 16), (x)))
> +#define VERSION_MINOR(x)		((u32)FIELD_GET(GENMASK(15, 8), (x)))
> +#define VERSION_PATCH(x)		((u32)FIELD_GET(GENMASK(7, 0), (x)))

I suppose that needn't (u32), any warnings report without u32?

> +
> +#define MAX_DEVS			16
> +
> +#define REG_VERSION			0x000
> +#define REG_ENABLE			0x040
> +#define REG_IRQ_MASK			0x080
> +#define REG_IRQ_PENDING			0x084
> +#define   REG_IRQ_PENDING_CMDR		BIT(5)
> +#define   REG_IRQ_PENDING_IBI		((u32)BIT(6))

needn't u32
> +#define   REG_IRQ_PENDING_DAA		BIT(7)

Add empty line between registers

> +#define REG_CMD_FIFO			0x0d4
> +#define	  REG_CMD_FIFO_0_IS_CCC		BIT(22)
> +#define   REG_CMD_FIFO_0_BCAST		BIT(21)
> +#define   REG_CMD_FIFO_0_SR		BIT(20)
> +#define   REG_CMD_FIFO_0_LEN(l)		FIELD_PREP(GENMASK(19, 8), (l))
> +#define   REG_CMD_FIFO_0_DEV_ADDR(a)	FIELD_PREP(GENMASK(7, 1), a)
> +#define   REG_CMD_FIFO_0_RNW		BIT(0)
> +#define   REG_CMD_FIFO_1_CCC(id)	FIELD_PREP(GENMASK(7, 0), (id))
> +#define REG_CMD_FIFO_ROOM		0x0c0
> +#define REG_CMDR_FIFO			0x0d8
> +#define   REG_CMDR_FIFO_NO_ERROR	0
> +#define   REG_CMDR_FIFO_CE0_ERROR	1
> +#define   REG_CMDR_FIFO_CE2_ERROR	4
> +#define   REG_CMDR_FIFO_NACK_RESP	6
> +#define   REG_CMDR_FIFO_UDA_ERROR	8
> +#define   REG_CMDR_FIFO_ERROR(x)	FIELD_GET(GENMASK(23, 20), (x))
> +#define   REG_CMDR_FIFO_XFER_BYTES(x)	FIELD_GET(GENMASK(19, 8), (x))

Sort according bit pos. REG_CMDR_FIFO_XFER_BYTES should before
REG_CMDR_FIFO_ERROR

> +#define REG_SDO_FIFO			0x0dc
> +#define REG_SDO_FIFO_ROOM		0x0c8
> +#define REG_SDI_FIFO			0x0e0
> +#define REG_IBI_FIFO			0x0e4
> +#define REG_FIFO_STATUS			0x0e8
> +#define   REG_FIFO_STATUS_CMDR_EMPTY	BIT(0)
> +#define   REG_FIFO_STATUS_IBI_EMPTY	BIT(1)
> +#define REG_OPS				0x100
> +#define   REG_OPS_SET_SG(x)		FIELD_PREP(GENMASK(6, 5), (x))
> +#define   REG_OPS_PP_SG_MASK		GENMASK(6, 5)

REG_OPS_SET_SG(x) FIELD_PREP(REG_OPS_PP_SG_MASK, (x))

> +#define REG_IBI_CONFIG			0x140
> +#define   REG_IBI_CONFIG_LISTEN		BIT(1)
> +#define   REG_IBI_CONFIG_ENABLE		BIT(0)

sort it. keep consisent in whole file, from 0->31 or 31->0

> +#define REG_DEV_CHAR			0x180
> +#define   REG_DEV_CHAR_IS_I2C		BIT(0)
> +#define   REG_DEV_CHAR_IS_ATTACHED	BIT(1)
> +#define   REG_DEV_CHAR_BCR_IBI(x)	(((x) & GENMASK(2, 1)) << 1)

FIELD_PREP()

> +#define   REG_DEV_CHAR_WEN		BIT(8)
> +#define   REG_DEV_CHAR_ADDR(x)		FIELD_PREP(GENMASK(15, 9), (x))
> +
> +enum speed_grade {PP_SG_UNSET, PP_SG_1MHZ, PP_SG_3MHZ, PP_SG_6MHZ, PP_SG_12MHZ};
> +struct adi_i3c_cmd {
> +	u32 cmd0;
> +	u32 cmd1;
> +	u32 tx_len;
> +	const void *tx_buf;
> +	u32 rx_len;
> +	void *rx_buf;
> +	u32 error;
> +};
> +
> +struct adi_i3c_xfer {
> +	struct list_head node;
> +	struct completion comp;
> +	int ret;
> +	unsigned int ncmds;
> +	unsigned int ncmds_comp;
> +	struct adi_i3c_cmd cmds[];
> +};
> +
> +struct adi_i3c_master {
> +	struct i3c_master_controller base;
> +	u32 free_rr_slots;
> +	unsigned int maxdevs;
> +	struct {
> +		unsigned int num_slots;
> +		struct i3c_dev_desc **slots;
> +		spinlock_t lock; /* Protect IBI slot access */
> +	} ibi;
> +	struct {
> +		struct list_head list;
> +		struct adi_i3c_xfer *cur;
> +		spinlock_t lock; /* Protect transfer */
> +	} xferqueue;
> +	void __iomem *regs;
> +	struct clk *clk;
> +	unsigned long i3c_scl_lim;
> +	struct {
> +		u8 addrs[MAX_DEVS];
> +		u8 index;
> +	} daa;
> +};
> +
> +static inline struct adi_i3c_master *to_adi_i3c_master(struct i3c_master_controller *master)
> +{
> +	return container_of(master, struct adi_i3c_master, base);
> +}
> +
> +static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
> +					 const u8 *bytes, unsigned int nbytes)
> +{
> +	unsigned int n, m;
> +	u32 tmp;
> +
> +	n = readl(master->regs + REG_SDO_FIFO_ROOM);
> +	m = min(n, nbytes);
> +	writesl(master->regs + REG_SDO_FIFO, bytes, m / 4);
> +
> +	if (m & 3) {
> +		memcpy(&tmp, bytes + (m & ~3), m & 3);
> +		writel(tmp, master->regs + REG_SDO_FIFO);
> +	}
> +}
> +
> +static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
> +					   u8 *bytes, unsigned int nbytes)
> +{
> +	readsl(master->regs + REG_SDI_FIFO, bytes, nbytes / 4);
> +	if (nbytes & 3) {
> +		u32 tmp;
> +
> +		tmp = readl(master->regs + REG_SDI_FIFO);
> +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> +	}
> +}

can you move above two helper function as inline into drivers/i3c/internals.h

or create new one drivers/i3c/master/helper.h or other naming.

Renesas IP have similar above two functions to access FIFO.
https://lore.kernel.org/linux-i3c/174964724485.330045.2181706921272138816.robh@kernel.org/T/#t

> +
> +static bool adi_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> +					    const struct i3c_ccc_cmd *cmd)
> +{
> +	if (cmd->ndests > 1)
> +		return false;
> +
> +	switch (cmd->id) {
> +	case I3C_CCC_ENEC(true):
> +	case I3C_CCC_ENEC(false):
> +	case I3C_CCC_DISEC(true):
> +	case I3C_CCC_DISEC(false):
> +	case I3C_CCC_RSTDAA(true):
> +	case I3C_CCC_RSTDAA(false):
> +	case I3C_CCC_ENTDAA:
> +	case I3C_CCC_SETDASA:
> +	case I3C_CCC_SETNEWDA:
> +	case I3C_CCC_GETMWL:
> +	case I3C_CCC_GETMRL:
> +	case I3C_CCC_GETPID:
> +	case I3C_CCC_GETBCR:
> +	case I3C_CCC_GETDCR:
> +	case I3C_CCC_GETSTATUS:
> +	case I3C_CCC_GETHDRCAP:
> +		return true;
> +	default:
> +		break;
> +	}
> +
> +	return false;
> +}
> +
> +static int adi_i3c_master_disable(struct adi_i3c_master *master)
> +{
> +	writel(0, master->regs + REG_IBI_CONFIG);
> +
> +	return 0;
> +}
> +
> +static struct adi_i3c_xfer *adi_i3c_master_alloc_xfer(struct adi_i3c_master *master,
> +						      unsigned int ncmds)
> +{
> +	struct adi_i3c_xfer *xfer;
> +
> +	xfer = kzalloc(struct_size(xfer, cmds, ncmds), GFP_KERNEL);
> +	if (!xfer)
> +		return NULL;
> +
> +	INIT_LIST_HEAD(&xfer->node);
> +	xfer->ncmds = ncmds;
> +	xfer->ret = -ETIMEDOUT;
> +
> +	return xfer;
> +}
> +
> +static void adi_i3c_master_start_xfer_locked(struct adi_i3c_master *master)
> +{
> +	struct adi_i3c_xfer *xfer = master->xferqueue.cur;
> +	unsigned int i, n, m;
> +
> +	if (!xfer)
> +		return;
> +
> +	for (i = 0; i < xfer->ncmds; i++) {
> +		struct adi_i3c_cmd *cmd = &xfer->cmds[i];
> +
> +		if (!(cmd->cmd0 & REG_CMD_FIFO_0_RNW))
> +			adi_i3c_master_wr_to_tx_fifo(master, cmd->tx_buf, cmd->tx_len);
> +	}
> +
> +	n = readl(master->regs + REG_CMD_FIFO_ROOM);
> +	for (i = 0; i < xfer->ncmds; i++) {
> +		struct adi_i3c_cmd *cmd = &xfer->cmds[i];
> +
> +		m = cmd->cmd0 & REG_CMD_FIFO_0_IS_CCC ? 2 : 1;
> +		if (m > n)
> +			break;
> +		writel(cmd->cmd0, master->regs + REG_CMD_FIFO);
> +		if (cmd->cmd0 & REG_CMD_FIFO_0_IS_CCC)
> +			writel(cmd->cmd1, master->regs + REG_CMD_FIFO);
> +		n -= m;
> +	}
> +}
> +
> +static void adi_i3c_master_end_xfer_locked(struct adi_i3c_master *master,
> +					   u32 pending)
> +{
> +	struct adi_i3c_xfer *xfer = master->xferqueue.cur;
> +	int i, ret = 0;
> +	u32 status0;
> +
> +	if (!xfer)
> +		return;
> +
> +	for (status0 = readl(master->regs + REG_FIFO_STATUS);
> +	     !(status0 & REG_FIFO_STATUS_CMDR_EMPTY);
> +	     status0 = readl(master->regs + REG_FIFO_STATUS)) {

how about

while (!(readl(master->regs + REG_FIFO_STATUS) & REG_FIFO_STATUS_CMDR_EMPTY))) {

> +		struct adi_i3c_cmd *cmd;
> +		u32 cmdr, rx_len;
> +
> +		cmdr = readl(master->regs + REG_CMDR_FIFO);
> +
> +		cmd = &xfer->cmds[xfer->ncmds_comp++];
> +		if (cmd->cmd0 & REG_CMD_FIFO_0_RNW) {
> +			rx_len = min_t(u32, REG_CMDR_FIFO_XFER_BYTES(cmdr), cmd->rx_len);
> +			adi_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
> +		}
> +		cmd->error = REG_CMDR_FIFO_ERROR(cmdr);
> +	}
> +
> +	for (i = 0; i < xfer->ncmds; i++) {

I think you iterate to ncmds_comp?

> +		switch (xfer->cmds[i].error) {
> +		case REG_CMDR_FIFO_NO_ERROR:
> +			break;
> +
> +		case REG_CMDR_FIFO_CE0_ERROR:
> +		case REG_CMDR_FIFO_CE2_ERROR:
> +		case REG_CMDR_FIFO_NACK_RESP:
> +		case REG_CMDR_FIFO_UDA_ERROR:
> +			ret = -EIO;
> +			break;
> +
> +		default:
> +			ret = -EINVAL;
> +			break;
> +		}
> +	}
> +
> +	xfer->ret = ret;
> +
> +	if (xfer->ncmds_comp != xfer->ncmds)
> +		return;
> +
> +	complete(&xfer->comp);
> +
> +	xfer = list_first_entry_or_null(&master->xferqueue.list,
> +					struct adi_i3c_xfer, node);
> +	if (xfer)
> +		list_del_init(&xfer->node);
> +
> +	master->xferqueue.cur = xfer;
> +	adi_i3c_master_start_xfer_locked(master);
> +}
> +
> +static void adi_i3c_master_queue_xfer(struct adi_i3c_master *master,
> +				      struct adi_i3c_xfer *xfer)
> +{
> +	init_completion(&xfer->comp);
> +	guard(spinlock_irqsave)(&master->xferqueue.lock);
> +	if (master->xferqueue.cur) {
> +		list_add_tail(&xfer->node, &master->xferqueue.list);
> +	} else {
> +		master->xferqueue.cur = xfer;
> +		adi_i3c_master_start_xfer_locked(master);
> +	}
> +}
> +
> +static void adi_i3c_master_unqueue_xfer(struct adi_i3c_master *master,
> +					struct adi_i3c_xfer *xfer)
> +{
> +	guard(spinlock_irqsave)(&master->xferqueue.lock);
> +	if (master->xferqueue.cur == xfer)
> +		master->xferqueue.cur = NULL;
> +	else
> +		list_del_init(&xfer->node);
> +
> +	writel(0x01, master->regs + REG_ENABLE);
> +	writel(0x00, master->regs + REG_ENABLE);
> +	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
> +}
> +
> +static enum i3c_error_code adi_i3c_cmd_get_err(struct adi_i3c_cmd *cmd)
> +{
> +	switch (cmd->error) {
> +	case REG_CMDR_FIFO_CE0_ERROR:
> +		return I3C_ERROR_M0;
> +
> +	case REG_CMDR_FIFO_CE2_ERROR:
> +	case REG_CMDR_FIFO_NACK_RESP:
> +		return I3C_ERROR_M2;
> +
> +	default:
> +		break;
> +	}
> +
> +	return I3C_ERROR_UNKNOWN;
> +}
> +
> +static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> +				       struct i3c_ccc_cmd *cmd)
> +{
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_xfer *xfer;
> +	struct adi_i3c_cmd *ccmd;
> +
> +	xfer = adi_i3c_master_alloc_xfer(master, 1);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	ccmd = xfer->cmds;
> +	ccmd->cmd1 = REG_CMD_FIFO_1_CCC(cmd->id);
> +	ccmd->cmd0 = REG_CMD_FIFO_0_IS_CCC |
> +		     REG_CMD_FIFO_0_LEN(cmd->dests[0].payload.len);
> +
> +	if (cmd->id & I3C_CCC_DIRECT)
> +		ccmd->cmd0 |= REG_CMD_FIFO_0_DEV_ADDR(cmd->dests[0].addr);
> +
> +	if (cmd->rnw) {
> +		ccmd->cmd0 |= REG_CMD_FIFO_0_RNW;
> +		ccmd->rx_buf = cmd->dests[0].payload.data;
> +		ccmd->rx_len = cmd->dests[0].payload.len;
> +	} else {
> +		ccmd->tx_buf = cmd->dests[0].payload.data;
> +		ccmd->tx_len = cmd->dests[0].payload.len;
> +	}
> +
> +	adi_i3c_master_queue_xfer(master, xfer);
> +	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> +		adi_i3c_master_unqueue_xfer(master, xfer);
> +
> +	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
> +	kfree(xfer);

you can use
struct adi_i3c_xfer *xfer __free(kfree) = NULL;

 to simple code.

> +
> +	return 0;
> +}
> +
> +static int adi_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> +				     struct i3c_priv_xfer *xfers,
> +				     int nxfers)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_xfer *xfer;
> +	int i, ret;
> +
> +	if (!nxfers)
> +		return 0;

add an empty line.

> +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < nxfers; i++) {
> +		struct adi_i3c_cmd *ccmd = &xfer->cmds[i];
> +
> +		ccmd->cmd0 = REG_CMD_FIFO_0_DEV_ADDR(dev->info.dyn_addr);
> +
> +		if (xfers[i].rnw) {
> +			ccmd->cmd0 |= REG_CMD_FIFO_0_RNW;
> +			ccmd->rx_buf = xfers[i].data.in;
> +			ccmd->rx_len = xfers[i].len;
> +		} else {
> +			ccmd->tx_buf = xfers[i].data.out;
> +			ccmd->tx_len = xfers[i].len;
> +		}
> +
> +		ccmd->cmd0 |= REG_CMD_FIFO_0_LEN(xfers[i].len);
> +
> +		if (i < nxfers - 1)
> +			ccmd->cmd0 |= REG_CMD_FIFO_0_SR;
> +
> +		if (!i)
> +			ccmd->cmd0 |= REG_CMD_FIFO_0_BCAST;
> +	}
> +
> +	adi_i3c_master_queue_xfer(master, xfer);
> +	if (!wait_for_completion_timeout(&xfer->comp,
> +					 msecs_to_jiffies(1000)))
> +		adi_i3c_master_unqueue_xfer(master, xfer);
> +
> +	ret = xfer->ret;
> +
> +	for (i = 0; i < nxfers; i++)
> +		xfers[i].err = adi_i3c_cmd_get_err(&xfer->cmds[i]);
> +
> +	kfree(xfer);
> +
> +	return ret;
> +}
> +
> +struct adi_i3c_i2c_dev_data {
> +	u16 id;
> +	s16 ibi;
> +	struct i3c_generic_ibi_pool *ibi_pool;
> +};
> +
> +static int adi_i3c_master_get_rr_slot(struct adi_i3c_master *master,
> +				      u8 dyn_addr)
> +{
> +	if (!master->free_rr_slots)
> +		return -ENOSPC;
> +
> +	return ffs(master->free_rr_slots) - 1;
> +}
> +
> +static int adi_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 dyn_addr)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	u8 addr;
> +
> +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> +
> +	writel(REG_DEV_CHAR_ADDR(dyn_addr), master->regs + REG_DEV_CHAR);
> +	writel((readl(master->regs + REG_DEV_CHAR) &
> +		~REG_DEV_CHAR_IS_ATTACHED) | REG_DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> +	writel(readl(master->regs + REG_DEV_CHAR) |
> +	       REG_DEV_CHAR_IS_ATTACHED | REG_DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	return 0;
> +}
> +
> +static int adi_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data;
> +	int slot;
> +	u8 addr;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	slot = adi_i3c_master_get_rr_slot(master, dev->info.dyn_addr);
> +	if (slot < 0) {
> +		kfree(data);
> +		return slot;
> +	}
> +
> +	data->ibi = -1;

why -1 here?

> +	data->id = slot;
> +	i3c_dev_set_master_data(dev, data);
> +	master->free_rr_slots &= ~BIT(slot);
> +
> +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> +
> +	writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> +	writel(readl(master->regs + REG_DEV_CHAR) |
> +	       REG_DEV_CHAR_IS_ATTACHED | REG_DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	return 0;
> +}
> +
> +static void adi_i3c_master_sync_dev_char(struct i3c_master_controller *m)
> +{
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct i3c_dev_desc *i3cdev;
> +	u8 addr;
> +
> +	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
> +		addr = i3cdev->info.dyn_addr ?
> +		       i3cdev->info.dyn_addr : i3cdev->info.static_addr;
> +		writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> +		writel(readl(master->regs + REG_DEV_CHAR) |
> +		       REG_DEV_CHAR_BCR_IBI(i3cdev->info.bcr) | REG_DEV_CHAR_WEN,
> +		       master->regs + REG_DEV_CHAR);
> +	}
> +}
> +
> +static void adi_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	u8 addr;
> +
> +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> +
> +	writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> +	writel((readl(master->regs + REG_DEV_CHAR) &
> +		~REG_DEV_CHAR_IS_ATTACHED) | REG_DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	master->free_rr_slots |= BIT(data->id);
> +	kfree(data);
> +}
> +
> +static int adi_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data;
> +	int slot;
> +
> +	slot = adi_i3c_master_get_rr_slot(master, 0);
> +	if (slot < 0)
> +		return slot;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->id = slot;
> +	master->free_rr_slots &= ~BIT(slot);
> +	i2c_dev_set_master_data(dev, data);
> +
> +	writel(REG_DEV_CHAR_ADDR(dev->addr) |
> +	       REG_DEV_CHAR_IS_I2C | REG_DEV_CHAR_IS_ATTACHED | REG_DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	return 0;
> +}
> +
> +static void adi_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> +
> +	writel(REG_DEV_CHAR_ADDR(dev->addr) |
> +	       REG_DEV_CHAR_IS_I2C | REG_DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	i2c_dev_set_master_data(dev, NULL);
> +	master->free_rr_slots |= BIT(data->id);
> +	kfree(data);
> +}
> +
> +static void adi_i3c_master_bus_cleanup(struct i3c_master_controller *m)
> +{
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +
> +	adi_i3c_master_disable(master);
> +}
> +
> +static void adi_i3c_master_upd_i3c_scl_lim(struct adi_i3c_master *master)
> +{
> +	struct i3c_master_controller *m = &master->base;
> +	struct i3c_bus *bus = i3c_master_get_bus(m);
> +	u8 i3c_scl_lim = 0;
> +	struct i3c_dev_desc *dev;
> +	u8 pp_sg;
> +
> +	i3c_bus_for_each_i3cdev(bus, dev) {
> +		u8 max_fscl;
> +
> +		max_fscl = max(I3C_CCC_MAX_SDR_FSCL(dev->info.max_read_ds),
> +			       I3C_CCC_MAX_SDR_FSCL(dev->info.max_write_ds));
> +
> +		switch (max_fscl) {
> +		case I3C_SDR1_FSCL_8MHZ:
> +			max_fscl = PP_SG_6MHZ;
> +			break;
> +		case I3C_SDR2_FSCL_6MHZ:
> +			max_fscl = PP_SG_3MHZ;
> +			break;
> +		case I3C_SDR3_FSCL_4MHZ:
> +			max_fscl = PP_SG_3MHZ;
> +			break;
> +		case I3C_SDR4_FSCL_2MHZ:
> +			max_fscl = PP_SG_1MHZ;
> +			break;
> +		case I3C_SDR0_FSCL_MAX:
> +		default:
> +			max_fscl = PP_SG_12MHZ;
> +			break;
> +		}
> +
> +		if (max_fscl &&
> +		    (i3c_scl_lim > max_fscl || !i3c_scl_lim))
> +			i3c_scl_lim = max_fscl;
> +	}
> +
> +	if (!i3c_scl_lim)
> +		return;
> +
> +	master->i3c_scl_lim = i3c_scl_lim - 1;
> +
> +	pp_sg = readl(master->regs + REG_OPS) & ~REG_OPS_PP_SG_MASK;
> +	pp_sg |= REG_OPS_SET_SG(master->i3c_scl_lim);
> +
> +	writel(pp_sg, master->regs + REG_OPS);
> +}
> +
> +static void adi_i3c_master_get_features(struct adi_i3c_master *master,
> +					unsigned int slot,
> +					struct i3c_device_info *info)
> +{
> +	memset(info, 0, sizeof(*info));
> +
> +	info->dyn_addr = 0x31;

master address is hardcode?

> +	info->dcr = 0x00;
> +	info->bcr = 0x40;
> +	info->pid = 0;
> +}
> +
> +static int adi_i3c_master_do_daa(struct i3c_master_controller *m)
> +{
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	u32 irq_mask;
> +	int ret, addr;
> +
> +	addr = 0x8;
> +	for (u8 i = 0; i < MAX_DEVS; i++) {
> +		addr = i3c_master_get_free_addr(m, addr);
> +		if (addr < 0)
> +			return addr;

assume MAX_DEVS 128, if only get 4 address, suppose you should enumerate
for such 4 devices, instead of return error and give up do_daa.

> +		master->daa.addrs[i] = addr;
> +	}
> +
> +	irq_mask = readl(master->regs + REG_IRQ_MASK);
> +	writel(irq_mask | REG_IRQ_PENDING_DAA,
> +	       master->regs + REG_IRQ_MASK);
> +
> +	master->daa.index = 0;
> +	ret = i3c_master_entdaa_locked(&master->base);
> +
> +	writel(irq_mask, master->regs + REG_IRQ_MASK);
> +
> +	/* DAA always finishes with CE2_ERROR or NACK_RESP */
> +	if (ret && ret != I3C_ERROR_M2)
> +		return ret;
> +
> +	/* Add I3C devices discovered */
> +	for (u8 i = 0; i < master->daa.index; i++)
> +		i3c_master_add_i3c_dev_locked(m, master->daa.addrs[i]);
> +	/* Sync retrieved devs info with the IP */
> +	adi_i3c_master_sync_dev_char(m);
> +
> +	i3c_master_defslvs_locked(&master->base);
> +
> +	adi_i3c_master_upd_i3c_scl_lim(master);
> +
> +	return 0;
> +}
> +
> +static int adi_i3c_master_bus_init(struct i3c_master_controller *m)
> +{
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct i3c_device_info info = { };
> +	int ret;
> +
> +	ret = i3c_master_get_free_addr(m, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	adi_i3c_master_get_features(master, 0, &info);
> +	ret = i3c_master_set_info(&master->base, &info);
> +	if (ret)
> +		return ret;
> +
> +	writel(REG_IBI_CONFIG_LISTEN,
> +	       master->regs + REG_IBI_CONFIG);
> +
> +	return 0;
> +}
> +
> +static void adi_i3c_master_handle_ibi(struct adi_i3c_master *master,
> +				      u32 ibi)
> +{
> +	struct adi_i3c_i2c_dev_data *data;
> +	struct i3c_ibi_slot *slot;
> +	struct i3c_dev_desc *dev;
> +	u8 da, id;
> +	u8 *mdb;
> +
> +	da = (ibi >> 17) & GENMASK(6, 0);
> +	for (id = 0; id < master->ibi.num_slots; id++) {
> +		if (master->ibi.slots[id] &&
> +		    master->ibi.slots[id]->info.dyn_addr == da)
> +			break;
> +	}
> +
> +	if (id == master->ibi.num_slots)
> +		return;
> +
> +	dev = master->ibi.slots[id];
> +	guard(spinlock)(&master->ibi.lock);
> +
> +	data = i3c_dev_get_master_data(dev);
> +	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
> +	if (!slot)
> +		return;
> +
> +	mdb = slot->data;
> +	mdb[0] = (ibi >> 8) & GENMASK(7, 0);
> +
> +	slot->len = 1;
> +	i3c_master_queue_ibi(dev, slot);
> +}
> +
> +static void adi_i3c_master_demux_ibis(struct adi_i3c_master *master)
> +{
> +	u32 status0;
> +
> +	for (status0 = readl(master->regs + REG_FIFO_STATUS);
> +	     !(status0 & REG_FIFO_STATUS_IBI_EMPTY);
> +	     status0 = readl(master->regs + REG_FIFO_STATUS)) {

use while()

> +		u32 ibi = readl(master->regs + REG_IBI_FIFO);
> +
> +		adi_i3c_master_handle_ibi(master, ibi);
> +	}
> +}
> +
> +static void adi_i3c_master_handle_da_req(struct adi_i3c_master *master)
> +{
> +	u8 payload0[8];
> +	u32 addr;
> +
> +	/* Clear device characteristics */
> +	adi_i3c_master_rd_from_rx_fifo(master, payload0, 6);
> +	addr = master->daa.addrs[master->daa.index++];
> +	addr = (addr << 1) | (parity8(addr) ? 0 : 1);
> +
> +	writel(addr, master->regs + REG_SDO_FIFO);
> +}
> +
> +static irqreturn_t adi_i3c_master_irq(int irq, void *data)
> +{
> +	struct adi_i3c_master *master = data;
> +	u32 pending;
> +
> +	pending = readl(master->regs + REG_IRQ_PENDING);
> +	writel(pending, master->regs + REG_IRQ_PENDING);

Add an empty line here

> +	if (pending & REG_IRQ_PENDING_CMDR) {
> +		spin_lock(&master->xferqueue.lock);
> +		adi_i3c_master_end_xfer_locked(master, pending);
> +		spin_unlock(&master->xferqueue.lock);

you use guard, keep consisent, use guard or scoped_guard here

> +	}
> +	if (pending & REG_IRQ_PENDING_IBI)
> +		adi_i3c_master_demux_ibis(master);
> +	if (pending & REG_IRQ_PENDING_DAA)
> +		adi_i3c_master_handle_da_req(master);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int adi_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> +				    struct i2c_msg *xfers,
> +				    int nxfers)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_xfer *xfer;
> +	int i, ret;
> +
> +	if (!nxfers)
> +		return 0;
> +	for (i = 0; i < nxfers; i++) {
> +		if (xfers[i].flags & I2C_M_TEN)
> +			return -EOPNOTSUPP;
> +	}
> +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < nxfers; i++) {
> +		struct adi_i3c_cmd *ccmd = &xfer->cmds[i];
> +
> +		ccmd->cmd0 = REG_CMD_FIFO_0_DEV_ADDR(xfers[i].addr);
> +
> +		if (xfers[i].flags & I2C_M_RD) {
> +			ccmd->cmd0 |= REG_CMD_FIFO_0_RNW;
> +			ccmd->rx_buf = xfers[i].buf;
> +			ccmd->rx_len = xfers[i].len;
> +		} else {
> +			ccmd->tx_buf = xfers[i].buf;
> +			ccmd->tx_len = xfers[i].len;
> +		}
> +
> +		ccmd->cmd0 |= REG_CMD_FIFO_0_LEN(xfers[i].len);

Just curiouse
What's happen if IBI happen (address arbitrate) at first command?

> +	}
> +
> +	adi_i3c_master_queue_xfer(master, xfer);
> +	if (!wait_for_completion_timeout(&xfer->comp,
> +					 m->i2c.timeout))
> +		adi_i3c_master_unqueue_xfer(master, xfer);
> +
> +	ret = xfer->ret;
> +	kfree(xfer);
> +	return ret;
> +}
> +
> +static int adi_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct i3c_dev_desc *i3cdev;
> +	u32 enabled = 0;
> +	int ret;
> +
> +	ret = i3c_master_disec_locked(m, dev->info.dyn_addr,
> +				      I3C_CCC_EVENT_SIR);
> +
> +	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
> +		if (dev != i3cdev && i3cdev->ibi)
> +			enabled |= i3cdev->ibi->enabled;
> +	}
> +	if (!enabled) {
> +		writel(REG_IBI_CONFIG_LISTEN,
> +		       master->regs + REG_IBI_CONFIG);
> +		writel(readl(master->regs + REG_IRQ_MASK) & ~REG_IRQ_PENDING_IBI,
> +		       master->regs + REG_IRQ_MASK);
> +	}
> +
> +	return ret;
> +}
> +
> +static int adi_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +
> +	writel(REG_IBI_CONFIG_LISTEN | REG_IBI_CONFIG_ENABLE,
> +	       master->regs + REG_IBI_CONFIG);
> +
> +	writel(readl(master->regs + REG_IRQ_MASK) | REG_IRQ_PENDING_IBI,
> +	       master->regs + REG_IRQ_MASK);
> +
> +	return i3c_master_enec_locked(m, dev->info.dyn_addr,
> +				      I3C_CCC_EVENT_SIR);
> +}
> +
> +static int adi_i3c_master_request_ibi(struct i3c_dev_desc *dev,
> +				      const struct i3c_ibi_setup *req)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data;
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	data = i3c_dev_get_master_data(dev);
> +	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
> +	if (IS_ERR(data->ibi_pool))
> +		return PTR_ERR(data->ibi_pool);
> +
> +	spin_lock_irqsave(&master->ibi.lock, flags);
> +	for (i = 0; i < master->ibi.num_slots; i++) {
> +		if (!master->ibi.slots[i]) {
> +			data->ibi = i;
> +			master->ibi.slots[i] = dev;
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&master->ibi.lock, flags);

same here, use scope_guard to keep consistent.

> +
> +	if (i < master->ibi.num_slots)
> +		return 0;
> +
> +	i3c_generic_ibi_free_pool(data->ibi_pool);
> +	data->ibi_pool = NULL;
> +
> +	return -ENOSPC;
> +}
> +
> +static void adi_i3c_master_free_ibi(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&master->ibi.lock, flags);
> +	master->ibi.slots[data->ibi] = NULL;
> +	data->ibi = -1;
> +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> +
> +	i3c_generic_ibi_free_pool(data->ibi_pool);
> +}
> +
> +static void adi_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
> +					    struct i3c_ibi_slot *slot)
> +{
> +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +
> +	i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
> +}
> +
> +static const struct i3c_master_controller_ops adi_i3c_master_ops = {
> +	.bus_init = adi_i3c_master_bus_init,
> +	.bus_cleanup = adi_i3c_master_bus_cleanup,
> +	.attach_i3c_dev = adi_i3c_master_attach_i3c_dev,
> +	.reattach_i3c_dev = adi_i3c_master_reattach_i3c_dev,
> +	.detach_i3c_dev = adi_i3c_master_detach_i3c_dev,
> +	.attach_i2c_dev = adi_i3c_master_attach_i2c_dev,
> +	.detach_i2c_dev = adi_i3c_master_detach_i2c_dev,
> +	.do_daa = adi_i3c_master_do_daa,
> +	.supports_ccc_cmd = adi_i3c_master_supports_ccc_cmd,
> +	.send_ccc_cmd = adi_i3c_master_send_ccc_cmd,
> +	.priv_xfers = adi_i3c_master_priv_xfers,
> +	.i2c_xfers = adi_i3c_master_i2c_xfers,
> +	.request_ibi = adi_i3c_master_request_ibi,
> +	.enable_ibi = adi_i3c_master_enable_ibi,
> +	.disable_ibi = adi_i3c_master_disable_ibi,
> +	.free_ibi = adi_i3c_master_free_ibi,
> +	.recycle_ibi_slot = adi_i3c_master_recycle_ibi_slot,
> +};
> +
> +static const struct of_device_id adi_i3c_master_of_match[] = {
> +	{ .compatible = "adi,i3c-master" },
> +	{}
> +};
> +
> +static int adi_i3c_master_probe(struct platform_device *pdev)
> +{
> +	struct adi_i3c_master *master;
> +	unsigned int version;
> +	int ret, irq;
> +
> +	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
> +	if (!master)
> +		return -ENOMEM;
> +
> +	master->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(master->regs))
> +		return PTR_ERR(master->regs);
> +
> +	master->clk = devm_clk_get_enabled(&pdev->dev, "axi");
> +	if (IS_ERR(master->clk))
> +		return PTR_ERR(master->clk);

you have optional clock i3c, not use it in driver?

> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	version = readl(master->regs + REG_VERSION);
> +	if (VERSION_MAJOR(version) != 0) {
> +		dev_err(&pdev->dev, "Unsupported IP version %u.%u.%c\n",
> +			VERSION_MAJOR(version),
> +			VERSION_MINOR(version),
> +			VERSION_PATCH(version));
> +		return -EINVAL;

return dev_err_probe();

Frank
> +	}
> +
> +	writel(0x00, master->regs + REG_ENABLE);
> +	writel(0x00, master->regs + REG_IRQ_MASK);
> +
> +	ret = devm_request_irq(&pdev->dev, irq, adi_i3c_master_irq, 0,
> +			       dev_name(&pdev->dev), master);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, master);
> +
> +	master->maxdevs = MAX_DEVS;
> +	master->free_rr_slots = GENMASK(master->maxdevs, 1);
> +
> +	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
> +
> +	spin_lock_init(&master->ibi.lock);
> +	master->ibi.num_slots = 15;
> +	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
> +					 sizeof(*master->ibi.slots),
> +					 GFP_KERNEL);
> +	if (!master->ibi.slots)
> +		return -ENOMEM;
> +
> +	return i3c_master_register(&master->base, &pdev->dev,
> +				   &adi_i3c_master_ops, false);
> +}
> +
> +static void adi_i3c_master_remove(struct platform_device *pdev)
> +{
> +	struct adi_i3c_master *master = platform_get_drvdata(pdev);
> +
> +	writel(0xff, master->regs + REG_IRQ_PENDING);
> +	writel(0x00, master->regs + REG_IRQ_MASK);
> +	writel(0x01, master->regs + REG_ENABLE);
> +
> +	i3c_master_unregister(&master->base);
> +}
> +
> +static struct platform_driver adi_i3c_master = {
> +	.probe = adi_i3c_master_probe,
> +	.remove = adi_i3c_master_remove,
> +	.driver = {
> +		.name = "adi-i3c-master",
> +		.of_match_table = adi_i3c_master_of_match,
> +	},
> +};
> +module_platform_driver(adi_i3c_master);
> +
> +MODULE_AUTHOR("Jorge Marques <jorge.marques@analog.com>");
> +MODULE_DESCRIPTION("Analog Devices I3C master driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.49.0
>
