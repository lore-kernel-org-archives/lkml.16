Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1325DB0A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854614; cv=fail; b=KGwqcTO78F7hPA9o7YZFPaFa2qf7sQgzHHL8yz01Z9HmlvmgZvUv1zNy2ro+CqIzkTY5hT7Eq+ZabK/ToNjXCoQo4cstARxLdf/Oq3o19oFtuXqk8HUYqsT+VLjfW27Y6CRuJhEbbsJP1UzwSZEV49Ya1wp6a7IKF9czMSbD3PQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854614; c=relaxed/simple;
	bh=fFpXUz/siJqPQcqNWgKiN6gapnk1A9AUMbawhSugCe8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hr8XPstn6zKdbbQexEdsI/u8RcNRbHTPQvPX/prj+xvmwcdhPe/RZZad1gPDb6Y2hOU3nAT6DxdV8LLQII+pArvERct69WsXXCmV73hymkLVGw8YvydBenHBAAs98cREoHTvHt8eSKYDTAQ9n0xIQHYdf4YZBgNiYFSycQ9dxrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I3xDkdNq; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I3xDkdNq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRe6SUCgYlW9+9xXkhFIiFe56IWP0iS3vTJs4IzwEKuxh+6mGJRG67o7jDdzNczsm+qbk4psjv87E8P1qEvulITX1VxFq+MZZ68p6izisffnT6ZobBzx10L6l1OZVYk3jf3yMgwxU/iIm/dBaPSSG3JumEwun40L0H7dQAUq2usymfiioMe3rf/4LIjkNRIOGCB8YujODgHoRiTtssMO+gp0L088/Sup0gSIFTsHjwzn9eVcf3p7kGP+jB7zcUGkKfOHZ94HmKAlgzZk9roej+7cTskvCNFOYgeAclTC+NKoRLnSALlDegvBNUeyLeHscD9fmgemDYfF4TPDS3n2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+Nvc2rY9qrmk1nLHE4lX24RG+HkhPqCu/MAc3XyDdo=;
 b=nUWfe/2NqAT56yEa4o6VgP/YYuWtWfLqfUkX3g5gGIgyeEfI6Ve0sPg8EqmOEafid90N1LCFEIRZgryZLM7FcsrPX348ioOhPK/gJoPDCtgTEqvAbwPVJx07TZI6UzZ6JJ2nuqwEivy/vf/zDHCtLz73+a0Wnq5fxmbFYGy+y6qHTNZps6i2Es54EDXV8vz2ueDiCMlmQx55apbRj28avJJJiaqV/tQlDChjXRIPHNMLfdVpjLrGspAeaC+zfBFDcp33AOFhlrZU7kyb5jNoMet0mu1SqoCIeZSJMFX12WLgG/EODzsFj1v2ON+JSGJZgO63k57YKJ3boOkdrGu+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+Nvc2rY9qrmk1nLHE4lX24RG+HkhPqCu/MAc3XyDdo=;
 b=I3xDkdNqLenfVGQE5ZdU56d9VbKu/YdajHpmAbUhtVkXOhFTatJz0Smu5lixoyxqiN57jCZWOo66KCl5q9Z5bHkFxAWhoTZJIazh9DKM2V/xOvsQ7ZT4hYUrWDbm5SuMGy4AnpZBX2cniQYNeDjo7nWk97hAxVpu69niyk7VOfwzkcUWj87Spe+WXkFl7SQy6NEpXUFnL+AI4po301mj9UkPb/Y8NEBYoC7+sHis57nX35zLT8IAekq4tmoEv7z6zxdQ2jOCL0A9mBjO2CLE/6i30sK9WCuCbEKHXuIimHvJF7Nm3azAm/K1uDqVEUpyB7R22kvibHVsCRwwHdXDQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB11431.eurprd04.prod.outlook.com (2603:10a6:102:4f6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 12:30:07 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 12:30:07 +0000
Message-ID: <4b9c74fe-b423-400c-9eab-1ec2a3a3cc3d@oss.nxp.com>
Date: Wed, 25 Jun 2025 15:30:04 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add NXP S32G RTC driver
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 dl-S32 <S32@nxp.com>
References: <20250526163259.2470550-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20250526163259.2470550-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA1PR04MB11431:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ea98e7-27f2-4b27-96b2-08ddb3e404cd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1o1cHd0dGJnZjRZSFhkeUtuS2ttTEVIYVZEMER0NUdiWFZweG1UejhIYmJz?=
 =?utf-8?B?UWFjWVlwNVEzb00zckM1S3RxYTYrNnFPbUdzU0ova0xCNW9WWE1GSENrTjhx?=
 =?utf-8?B?czVuRVNjTmJwTnY1OWdOSGhZNlphWjBNc1NNdHUvWGdTaUlNckR3cDFhTWNj?=
 =?utf-8?B?NjdWcVR1dGpDOXJZVldQa0lNRzkvS0dmOUpjSkZoL1VtOVR0LytrMVRsS1ZR?=
 =?utf-8?B?aU8rbnpWYXlIaFg0ZmJZUE1PWW9PTm1KQU95b3hSeERxbGFKeEpIcTZ1S1lS?=
 =?utf-8?B?R3JoR2hjaWkvb3V1dGQ5MzF1UjgyNzcvczVDS2RlckUydExTWEkvV2VWWUtY?=
 =?utf-8?B?djUvRm45TDZNL2Y4aDgzcGtPWlBaZEdJaUZWQjJNV2NBbFhUTHVlbHFjN0FX?=
 =?utf-8?B?c2gvYkFNeXVmZ0UyVXBhRkFpVm1FVjhudy9pZm8vVmRja1Jud3kwaytsb0tD?=
 =?utf-8?B?c2c4ZCtvY0hDNVdDRHFEZjRzTXkvbnZhSHNYTXFqM09yd3E0a1hvNzZNMnhW?=
 =?utf-8?B?bXk4aUNWeHBydzNML0lHdDN2T2dtUWtsckJ6K3VvREpZYUxoNHJFTDluT0ZL?=
 =?utf-8?B?U0hyNVpkUkxyWnhTSGE1MUdiQkNUUTR6eXVOblB5SnNXSGo3SFJ0MkMyMmtK?=
 =?utf-8?B?SEpXWGpHVk9zNEFKN2hkVzFPLy9EN1JaeUNJdUMxUVhnbmcwRHJ6aWY3TjRm?=
 =?utf-8?B?WThnT1VNSmhhZEdYUEJteWZGa0ZEZE51cjhWdWhxaWdIOVZkMlFtVXhKWjVZ?=
 =?utf-8?B?MHpJUTQ1QXZXR3V2dWxVNjdkVEdBaS9VbUJqSUl0VFM1TFZwL1Q4Z1dtVlE1?=
 =?utf-8?B?L2UwZ0FHamx6allMNUU2RzZ2eWVBaVpGTkJBUDk1OGE1ZVYzc3Q3bUptTDk3?=
 =?utf-8?B?K3RVWFlpRUd2R21SSHVMdmVYWWpyenY5Nk9nMUMxdHdGOVllUGRtSVNqZ1Vi?=
 =?utf-8?B?V0lHV1o4Nlh0LzFqSlBDWTR0aXRESm1sV1VId0lab29UNUVReXdYbUpPWCtQ?=
 =?utf-8?B?alRkbU10a1VLQU84UU5rdVhma1NxcW00RnlVYjFVMTVpUCs4R2wraGdCcXFx?=
 =?utf-8?B?R1Blb2I2VkFqN2k3RDNyV2xDbUtwNHFrOHJrMHlnSk5aaUQ5QlVSVkZuek5M?=
 =?utf-8?B?SXU0NjAwM3NJZTQxbFY3Z0xUN3Z5bUVvZmh3WS9QbFFkWXNRaCs3WWRVQ1ZB?=
 =?utf-8?B?b2RTREdZNVhDZ1RHMUlqUmZ4VmtZZlpyb1VtUHpLN2twY2JBWGxRaTVWeVRx?=
 =?utf-8?B?Z3N0S3p2RitGZEtGaGszYUtud3VVWWpCLzNyS0N0UTR6N0k1LzJLdnNCWXFv?=
 =?utf-8?B?Mm92c0YxY1FqRlBQaUUzdTBxR1N3c3Jla1RjUnI5OThZbkZQWlpjckd2MTNH?=
 =?utf-8?B?OGRZam9jUEpucEEzUDhERlJkWndtOUIvNFhvSmt4YUFKTVIyNWpJMWZTWmRl?=
 =?utf-8?B?NUtxKzNDcFptd3RLazNhMTFpOVNRMnpDbXNTZXo5TUtqNmpRKzVHc2QxOWl6?=
 =?utf-8?B?Y2V2TzFOVGdhRTR6ZHNMM1Y5eTY0YmUzUDIyVlBIK0diL2ZpbWszRXFqeSs2?=
 =?utf-8?B?MFVzN1NDcVFZSnVZSVE1eVVVMGlZb3BMQzZla3BadFQzblMydm5QbUwxZ0h3?=
 =?utf-8?B?dnhBY2k3YlJQa0dqcGEwRnJ6b3NJUTlkM3U1eWJxSUo0VE1JbGNmQ3NTb2JH?=
 =?utf-8?B?cXlyMlgwbDZ4cU1OODhFMWJyTXc3OXJ0TlZJRm9xaFlmUjI5N1pEQkppaGhj?=
 =?utf-8?B?L3hGcjBEUUJwVGJkYU52S3p1M0FEdCt6c1pucWhMMnRBdXVTNEQ2OGNEazUv?=
 =?utf-8?B?bXRBMDVBc1l5SFdsc2pBMmRtd2lhYk1jdFRCeGtvUk5hMG9VU0U3SmtFOXdL?=
 =?utf-8?B?TytSN0pGRnJLZFB0NGxuV2RSWUdzcFpFdVJsSkhtMDFlWlVUWTFsY09jTzk1?=
 =?utf-8?Q?GUq+8sbzGjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3FGMEFSQVJxMFBpaXdwdk9zQjJmTU9seFRYenpEaEpCZHVWUE0wbkVYelRN?=
 =?utf-8?B?NlBrYzZBL0VYVmFobEVGU0tVTDg3bU5yeWFDZnFmVW5oS3djNk1BSGJvWFdT?=
 =?utf-8?B?dWtLMGFJRlNOeTduWGRMaHlZajJzbjc4bnRQY3d2WEVYQlpiRStpN0xNTjAw?=
 =?utf-8?B?eWxuenlGYm41Rjk2bklsY21EQTJoOWwzOUV2aXhtTDJLZ1BjWnB2MEtHSEVv?=
 =?utf-8?B?SGpXc24zbFZvb2hSQlhvMGJaSTNsYlRrckdHYytIU2pMS215UWpocDJTZWlE?=
 =?utf-8?B?bHlzZ1lxNzdFQWZ2bzNuWUM1WGpFV2VxdnpKbU5OQWdiaDhVeUV3MVhEN1Nm?=
 =?utf-8?B?VUs2US96UG4ydm9DS1VVNURVNTQ0UUpBMGtObm9JSit4TSsrZGcySXhtQnpz?=
 =?utf-8?B?ZE9JU1BqcXRXWkVjcFZEY0poaEM4aHZXU1drRExuYVdSeEkzM2N2OUUyVUNY?=
 =?utf-8?B?UEN2RXBGMmIwNVU1Z1dNZ1dHc3lDTHFucUlVM1Y0QlhKZUxxc0RKTktsQWUw?=
 =?utf-8?B?eHNaSU9pNVlkMFV5eENmMnN0VjVZU3B3WVZEWFZ4Qld4U2xyWnV5d2d2R3hS?=
 =?utf-8?B?SHZjd3k3SU1ZRzZTL284QTZlZ1pTVEsvRlkyOHdtN2YrVFR4TG1ERGdMYklh?=
 =?utf-8?B?cEJqdmV6cHg3UHNXcWdtMlByT2NYYjFMZDNxdUIrRWhhUXpBbmI2TGNQTHlS?=
 =?utf-8?B?eTV3cDhTQ25oUXl1VHZ3NWE1bDRsQS91V0JWVHR1Ty80WmozcUI3VVViTkZH?=
 =?utf-8?B?NlVBcHZrRWY2V1R6ZDh0SjFhVFpJTXZqZXFCWXFSZUF2RVpDZnBkemNmQzBq?=
 =?utf-8?B?YTE0emRyamUzTXNPWHJTTjFXRnNnSGREWHo2NUtNQTRiN2ZnOEJsdnBCWHR0?=
 =?utf-8?B?aWpVNStqamUwelQxaFNCUVE1MjEwcEpGbnZMaFB5K1VXVDNOY3lZWjIxZlRX?=
 =?utf-8?B?NXEzYisxOEtadCthNzNBTXNNWTltTjdXODdOUlpiL0hEVHpyOUpJSzF5UWZE?=
 =?utf-8?B?Yi9XNkJEbEFZOFpRejRMUlFvblhxbDZYTmVNYmV4NU11NHI2c1RyMSt3TEQ2?=
 =?utf-8?B?ZkJEYXBoa3lkeGtyR1hlSkQyMmI1NEdRL2swWXU0QXAvbm1nZ25OQmMxdHM3?=
 =?utf-8?B?WUhHVjRwK1dYanlWVVlyZ2ZyeHArR25KS1ZMbDFYeThRTFpzOHJYaDdyWTQ3?=
 =?utf-8?B?RVFZUDBPM3JHbTlBMWdaT21pMkVxWStEUVdoaXMxTytVVE9FakEvQmhmTXky?=
 =?utf-8?B?dWY3ZDdLRHdNMHhzdzdxcENuSDZWeWQyUmFrZVlrZzNWY3pKSEp2OWRZYTd3?=
 =?utf-8?B?NlY5ait3ZHlNYWdXMGRxNXppc2JPTTg2dTZyand3TVYxd2xkWjYrMEtQVm9U?=
 =?utf-8?B?cVo2dVRkZnhYOEZFNlk2d3JqbVZ4RXJDa29nVmdXUitYWWdEL29pZCtnYjc5?=
 =?utf-8?B?aTlBN1RJWGJzSW93RVJhRTVuc3d5NUFldm1vcVAzU2lvQ1ZIZVdCVUlOdkhU?=
 =?utf-8?B?ODMwS2svL1ZoYlgxSVNLVWd5L0hZVTVZWlZnSG4rRlREUUE4NlYwNWhxc0o2?=
 =?utf-8?B?OW96dzdFN1J1NXMyckxSc05oTElyUHNaZW9MUm8reXdrM1lSa3FIcWVJcTNF?=
 =?utf-8?B?cVdBTDJtZGw3b1VlVU1XSUdhQ2c3eHkyQ2FWMGl1dWZEVGhlMEJzZmF1NVhJ?=
 =?utf-8?B?U3ZIWGpmUi8xblFaeFVmTlo0OWVrMHZpZVVvbnpveGxlT2FtZGxDeDE3clFV?=
 =?utf-8?B?S2J5Q2N3V1NEL0R6bGpwa3FDR3RMVTZzUlhhTjZtMWwvTkdZZFZnNmtQeGRH?=
 =?utf-8?B?MFNOTG1lSU9veExJTnF3SEdZMU5HL3dZTWRrTTFoYi9NelEzcHhvZEVVQXFM?=
 =?utf-8?B?T0wrVDZIMnBlUHpoMGFMMFYwZ2JnSnAzNjd3eVFQakFTN053aDh1a0NiVW15?=
 =?utf-8?B?c0R5dHZuRSttKzQ2RnFYaWo2MXRvcW11M2MzTXA3QThJbnNkYlpianJlWWRV?=
 =?utf-8?B?SEpHa2svUHB5K0dGZHA1WmhzNFk1dkQ1K0tDNmJYNCtSdGd1TmpaajRnaU9m?=
 =?utf-8?B?dk5ESjgvNGp0Umc3cWVTZkRHaTRmdzgzZThMSTNEbWwzMm5hV0xJamUzTldW?=
 =?utf-8?B?bThXL3FTY21PaGw4QUVnSlBhSWxIRXZxempncktvVHd4SzFxWkliOW5yTkRW?=
 =?utf-8?Q?imanqvPnIBpQ2yqlR+42qR4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ea98e7-27f2-4b27-96b2-08ddb3e404cd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 12:30:07.6210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faSer73YYqH0FdVDeU6iq5Oeh+QXTSkPHzmbdfRSQOG+rFDuEmHarVtsqPeQvWB4Co4j8IJH5mLR5OyLmiXlAn4/9GRRbSTCjrUDix6BqK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11431

On 5/26/2025 7:32 PM, Ciprian Costea wrote:

Hello Shawn,

Sorry for bothering. Is there anything which needs updating with respect 
to this patch ?

Best Regards,
Ciprian

> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add the NXP S32G RTC driver as maintained so further patches on this
> driver can be reviewed under this architecture.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e20de38ffa54..dd0c02846de7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3001,8 +3001,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>   R:	NXP S32 Linux Team <s32@nxp.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>   F:	arch/arm64/boot/dts/freescale/s32g*.dts*
>   F:	drivers/pinctrl/nxp/
> +F:	drivers/rtc/rtc-s32g.c
>   
>   ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
>   M:	Jan Petrous <jan.petrous@oss.nxp.com>

