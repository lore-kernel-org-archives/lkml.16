Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938FC1917CD;
	Tue, 10 Jun 2025 07:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541757; cv=fail; b=mCZps8R6RJiLEA/eO2RjJ0jYi3kAl4XG+KKk8jnslgk8IlFCte3tUx6DPVySWbnI3eY9u5c3SyfXc5VmZqJ3DQUrUNLcBCIfsLmhToKLGi5yTK7IgepNNoUxHz+6z/w4VNxvKLN80LyruY3/7Rar543QcaLYhC9pgcLL1RypTmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541757; c=relaxed/simple;
	bh=1seTJ425U4UCWFSMMWprtQ+Z2BdKi6k9F6tPYE+wBZg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OyMUa+z7DuIHpGmu0Cpq/uLi+ontDvlJd/aYe1ztc+16hJsfX9DUY7f6lCxChqc0ZiMGcQkwBCXQgcO7RzaVXm92XJ6Q0Y+BaON/sfDVwQnwUXkNitJb/UZHw/87rLseqJDMC/zKDAU/1lZO+8/MXobEIyJHrzOpL+umKGuOYaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oGM3cKRZ; arc=fail smtp.client-ip=40.107.220.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oGM3cKRZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPPSTj9eLABW2vRw3IYLpDNBbqqF8hgsufXe4y42zwJg6NJwolQPiy4s1ycxE6iqEvUNVs+80NoAFXiZ08X9uYp+vpBdiD+9b6skt+eNOWUWRubRd4NxyKVo13Te67UqZcY7bpBJjoI0hM6lQSUYOe8ng4uP1PMqiCNgL+csW/+bxbUDmoOKTgISWQ6XxiK4Qd24HTmsU7UBpTwHVFn7V23P3WO2sL2aIf/DUiqcqLPRZs7hkTxZ7vwkttQAQfjF8z5+dcaYDbFTVS27Nf95Ya04d8DdHnv8CNbeSU7uhTQgn8880/wd6hVydrllrusJ5EAABtmyNquJpnBv6G3jBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ad3XvQ/OfVRxKaEA4/GLLUK5dmgf2VduylVAQFb8WEQ=;
 b=yOH7haAsYbOXjjcRcvkQQaNveSj1EB9ZJJDva4ASa7bAbLzlS+fuxqXsxCQOjqcNvP38EKxAivnnL1O8NhgdHLk/RUF6EPjnEAvlKzxboG2bYt0BXZKM70OkMeXU/jcsQXVGVadbQk6hwIubFkhhkLfT/jNf7sFPjiGSt1fEbaEm93d1e0sgHbHkdMyD+Egd2eGz2n3V5WxJ/lTXrArUt9Qc/n4djHWKS/mfRONzZpokxbMr1adBwe/qQ6rzg3cKsRblYqK4yAdxnwg9QOIASNP9YFwBJcZRc5Z2cqYr+k4TxYVXM8f9KkK23OFaDG2k0w3aDbDVWXNrCpXSjYW57g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ad3XvQ/OfVRxKaEA4/GLLUK5dmgf2VduylVAQFb8WEQ=;
 b=oGM3cKRZJFz5dPJYB2RmK4YszqnXtAubyxX6qJ6p7FjT6rJ2iPlsYXIO4Ud3XKqQTSIv8aQP6BRKiqrUwDfqYGQpxN6hFuWVpvyHrF9oqj6wNwZHfYJoUWMOpitT78rDOAiQfs42SxUBque213QAqH7P3Rn78ZszGqLzgcdIVQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 07:49:11 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%7]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 07:49:11 +0000
Message-ID: <d27ab8aa-c312-4d1b-9655-65e6dd451da6@amd.com>
Date: Tue, 10 Jun 2025 09:49:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] microblaze: remove unnecessary system.dts
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <monstr@monstr.eu>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250114181359.4192564-1-masahiroy@kernel.org>
 <20250114181359.4192564-4-masahiroy@kernel.org>
 <CAL_JsqJyNiUF8--wz2DsngUAuSUboq8oqZRxAzqY+iBRM7rkjQ@mail.gmail.com>
 <CAK7LNATCFFQFYenkY2F5HkXx_otub9ebuTHJOD_TLiqCDnYN0w@mail.gmail.com>
 <b211188e-6c31-49fd-96be-137d3fc3f7bb@monstr.eu>
 <CAK7LNAQqR7rtuCSy895q-WeJR-uhVB_0UH1DrGPNLoz1_cRhtg@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <CAK7LNAQqR7rtuCSy895q-WeJR-uhVB_0UH1DrGPNLoz1_cRhtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0046.eurprd03.prod.outlook.com
 (2603:10a6:803:118::35) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fb6d84-7590-4180-b748-08dda7f349bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDA1S2RWMnJIekhoNFoxb29ldEpFUVJGSWNKZzVOSEZXem1lVzU0Z2puUzk2?=
 =?utf-8?B?UTFjN3BCTW5ra21WMkQrMWZ3UFp1cXAyTGdNRzZneXBCbHRLc1NlcEhuYUNP?=
 =?utf-8?B?YjF6bXJ3ZlRld1kzRDVyTzI4dUJtSVhkTkhBNm96VDJ1eUQrZzg1RjdBbm9Y?=
 =?utf-8?B?RE14RDZIUFI2Tjc3M3pPNXYydThkYlEyWlE4Qzh5VERmbTFxdmlYM0lQZWZO?=
 =?utf-8?B?TW5IWi9uUytPSEUrZnJYd3JoYVdGa29HS05VUmxVbkc3em94R2x3QzVrMk84?=
 =?utf-8?B?Z3JNS2hhUkN0anRDZkVIc01nMVV0MVU2aUFxVVdHZGZ1d05QMmw1Z29hTysx?=
 =?utf-8?B?T0RGOGE3RVpsYVQzRzBJVUJueFpUZ0h3YTc0RGd4T2lLNFZsTGZySVM5WDlQ?=
 =?utf-8?B?ZW0xRFc0RjJUOFJpNlVsM2xWaXpWVms3dVJNY3MrNmVzWkpwdjNtTGlqZjBJ?=
 =?utf-8?B?blF0WHJwdGhJa2lJd0wwUkQ4aGtYM0Q0dWxpbVo1eU51T0RVRGduKzNLTmNm?=
 =?utf-8?B?VWxrbFpYNHE2YWhBTUpubGF2QUZCZDZmNE1XcmJzTVVFeWdwZDVYUXUrTlNl?=
 =?utf-8?B?Q0dkejhaVDBnRVhmbFdyelVQaTNOTjQwT0NRbm9zaTVBZDM3Z1QrV1U3eFB5?=
 =?utf-8?B?WFRoRURPbCtRUjd1UXNXU0Y3YnVIMkVYcHRHUDRCVnJUbk9wcFV3QVB2T3Q0?=
 =?utf-8?B?WTBiZDNlMGUrcmM4dE5VZHlTZzdzVlM5YVlOdS9nb1pLdnE2WTdhTTVaNWhU?=
 =?utf-8?B?N3BTczdHcFE3VTdPSDdWTjNHQndIazZ2VDN6WVBkbVllWjJIa3ZzcWJDUUs0?=
 =?utf-8?B?K1NaejVBVklyMU9VV0pKYXdMOHc4SUxRL0JpbllnUXAxWXdsa0drQ1VLb0Zs?=
 =?utf-8?B?SEZQMjNqZStFZUZ4Z0g3NC8yNlpuM2FUOE10eVo4YjVHL254NzU1UFBtVTZ1?=
 =?utf-8?B?MXo5V0xjaStxRUo0bVFid3N0SlIvZDRyLzhSVjl2cGpYL3NraDJrQ1htbzgx?=
 =?utf-8?B?eEVPaEdSOWJoNjJRRk1PR3NYck1waUg3UjNiNG1sQTVzSzIxQ0xGVDQycXJP?=
 =?utf-8?B?N0prTnBDQm0zTDlwc0JQWmsrZ0dTRVEzb28wMm5CMmc3T2JHQXV6MWtya295?=
 =?utf-8?B?M0U0a2xnOVZ5OG9KL3o1ZFJPcEVuNTNFdStmVUVCL1BjMmNqNmlualdkbTgr?=
 =?utf-8?B?Y3FKZ1JrZXlJTEFnVkVKR3gzZ05ZbUd0OFFtTCs3Mlp6T0dnLzVJVGVRQitX?=
 =?utf-8?B?OCtqSDJmdW5nTUU0VlMzM05tWExuZjYrY1pYUkMvMTlpbTBFb05MdGViYlMv?=
 =?utf-8?B?U21PZ1pZdm9HUmhabU5uVUpieHZiWFVXYldZV256Uy93SVI3SVhLRGN4VVJ2?=
 =?utf-8?B?ekxZcDJFSitZWi9XSk4wZldyWW83c3JNYlgrbmYxeUlGMkNNYkZTUUt6Yk9Y?=
 =?utf-8?B?NnpWeEJFbmdZSGphUXU5eFpvVWxXRngwMGErOU1MdkJMMmIwUERkaFVYeVJB?=
 =?utf-8?B?cElmalAzdkVPRExPdTh5enNNWjUySHFsbVpWcFNJaFZGeXU1Wmk1aTRwWXVV?=
 =?utf-8?B?REpaekFNWXVFN2hPSi9tRlV6UkN1MVZkUFZvOHZCMXJ5bU5Nc1lrUGVtNFpB?=
 =?utf-8?B?amwzMlNtZzJEckJPNXpFMFl1VTNXbm4wL29pMVVtTFFFWXl0b3RCY1p3MDBM?=
 =?utf-8?B?N05vR2VNYTgvaFFYTGpHTWYzbitoeVlSNno2dUJoWXpsTitZZ0hudVk4VGti?=
 =?utf-8?B?UHhPUlRVYTJwV2kwa1k5aytFeDVvU0JVWmk2bE9XQ3FTb1BOSU5SS1lOZC9V?=
 =?utf-8?B?R3J4bjVLdlpzTzl6SmI5RTFUUkhURy8xMzRzOERYdFh6ejNHMEFwZkpoNk0r?=
 =?utf-8?B?Q3pabVpYL0x0cTZJalVGUmxDWTJzWWRCZ0NDZk5GTitocEZ3d1VWZ1RSTUNi?=
 =?utf-8?Q?G9eUMjETNys=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVNnKy9YMXhqc0tDNEpHeDRleWdvWGczSlBrUWhDM2tJMFBaR0kyaW52UU84?=
 =?utf-8?B?Y2VyM1Z5bHhGd3BLUVFZVzdDMHovUGhvNDZtcEtMUm5yOWkyK1N0S1lNS0tj?=
 =?utf-8?B?dmhqRUdPam9uQzFhemR1UEFXM2tNTUdOTTRzT0VvRFZoM0crYlZnV01DQkZU?=
 =?utf-8?B?VzRSbzNSNmw3NW9JQ1QvbTJ0M29tNGc3T0dzOSs5NlRuVmxNbzFlcXAvVGxR?=
 =?utf-8?B?aDN1TVZkVXZ2dXVXOHJHb0dqT0lYUzFncjUwL3pKRWloelc4ZlgyT3g5MUV3?=
 =?utf-8?B?bXBxaXBUTEZsNlpCMmR4TllFQkdwV0g1L0ZKbUhKNzBYTmZkTG1kZHVZMHpF?=
 =?utf-8?B?b0pvZG9uS0Q1eE81MlRPekFLQVdTTzNaRlB6Z2dXOE4vU2VzaHBsQ3RhQWtj?=
 =?utf-8?B?eW56dnVxVEFKeG9GcDVNbzJlZ29EVGN0YUw1Wll0dEZOaFlJTUtWMVQySDNK?=
 =?utf-8?B?WCsvWnVzQXhRMHpKamQzRzkreXRxZGJMREtxM2RlUXB3RjdoL2NjdlVMVWFP?=
 =?utf-8?B?cWFJbm1BWXA0THUzWlFFcFZiRlo3aDZHQ0VmbkxiL1g0SXBMcDJpR3RJeGJX?=
 =?utf-8?B?K3BON2dVdlUrVjZmSnFxUGpKVWRFWGlIR3U5aU5NcUI4TVdoanh5VlNaK2Nq?=
 =?utf-8?B?SFlQVFd3SnluTnkwZGZLQmNDdHJGZnh1QXdQd2xmcmxpa0dGOVJvcGdpRXRK?=
 =?utf-8?B?djlIVytGTTF0dFlNOGxvUnBmZXlTUm1QdDRLb2VNYVVKTjBxc2dGUlJZUUZO?=
 =?utf-8?B?b3hsUWhmdjdEZmswV3JGQ3JUOFhYSFdmSnNYNlo3c2N6NlRTL2dKelZadEJD?=
 =?utf-8?B?RzUwSUlPaU04N0lBcmRqNm5qVnI1U1h4aUhid3daenJ0SkczdWdGR1FDZ0lm?=
 =?utf-8?B?KzJEQlJ5TzR4TzVLaHo0OTNyUnA1c285OGR3aGk4QVZaYUdjcURVZ0hMSW80?=
 =?utf-8?B?RlVwbVNET3lCblVVTFJrVGRTaGZvT3FVTHQ2Sm9aaVJobUhKcXVYNityZmZL?=
 =?utf-8?B?MzF2czBHU0JuNnVNWFZJbjU0MHl3WmMvMlJkVUpjMGNCSUZYbFIvSEtib2RB?=
 =?utf-8?B?MTMrdEZCVlRUdCtoZDBDOU15eVgzU0ozL1dJeWhuK2R2eGJ1QTk5SS9HVnh5?=
 =?utf-8?B?a3UwU0JPRjRBSmw1TW9Zc3R3R0Q5SGtaZTJSazZkUFp3dGRtaHZzRWYrYWxv?=
 =?utf-8?B?dnVranhCV05ucElzdnhhTGZ6eWRYNmoxWnJaT1BoWVBzMittYWdFTHE4anFW?=
 =?utf-8?B?YWo4STlZdGlCeFB6YWhCMmNtV2RKMTN3cDI0cGFrOGxia3pDbjlPMVRvdTdZ?=
 =?utf-8?B?R0NVR2J3dFlNemQzSVhYa01LdkpWR2NNVlhnR21GYUZseHBEc3JLcHRjdzJC?=
 =?utf-8?B?TVFkL1FTWVZPdFdrQnZGcDFTeExhMEVoMGRSVGo1SU5rUUdiRFJ4Ky94eU5Z?=
 =?utf-8?B?M3d2bzVmV0pwZDVXbEdyQ1BoOE9zOGpmVW5mek9jV0tRdHlKdmJ5eDBNa1NH?=
 =?utf-8?B?Z0NVWmI2V3NQSmhsWC9weHRJckI4enEyV3dKMktlL2k0eWdPcjZTZXluaGJh?=
 =?utf-8?B?dWE3OENCa3A3aU1jRml4cHhoRVRiKzZ0TXo5TGVIbUtyalRHOVJ6UWQrdWNM?=
 =?utf-8?B?MmZna1ZndEQ0NVNhbWlFcmRCZkF0cVVQTjgzSmhxSGo3ZVRlTkZLdERrS1Bk?=
 =?utf-8?B?REF5SHBpU2NRVy9ZeWJVeVlkUForUlZ1bGMzNVBCbU9SMCtiKzRFVEpIc0VS?=
 =?utf-8?B?bGJRblh1LzdlWU52em1HZy9xeFdjS2RVN1NGK1dRR2RzL01WbEs3blhSTWNo?=
 =?utf-8?B?V3k1K0ZVY0hCdEE0bHlIZStFelcxYlhLWllScTdGNmVaU09LS29TMmhFcXNF?=
 =?utf-8?B?MFFSUHRQdFF3WkdmaGIyOURHem1KMEQ3V1lYREZvK3l6WkhESnhtQzk2cFdJ?=
 =?utf-8?B?ZWxVUjJWWHdsdmFZL2V3MmEyd1BZd01xb0s1MHRRYmM2VmdXRUU4Q0Fhd0Jp?=
 =?utf-8?B?Q01SdUloTno2akJHaFFPOTVSZDdwTThZZ2toNlV5eWNKRmh4dFVJbFZkc2N4?=
 =?utf-8?B?NUtlVEdsZ3Zlb1pzYlk5b3RsT3VpSXR5Y1RRK1lOTGtvTWRxSjYxUFRjUG1r?=
 =?utf-8?Q?lRRA1SE48hS/d9GuZL616baRC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fb6d84-7590-4180-b748-08dda7f349bf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 07:49:11.5362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Zq8KQO0lKBJpvkJVNSaS7mufk1hN005C++SAzFcNnaMHlMA7MR9EPmiRQIxPV3K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428



On 5/13/25 06:50, Masahiro Yamada wrote:
> On Mon, Feb 3, 2025 at 8:17 PM Michal Simek <monstr@monstr.eu> wrote:
>>
>>
>>
>> On 2/1/25 04:42, Masahiro Yamada wrote:
>>> On Sat, Feb 1, 2025 at 7:25 AM Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Tue, Jan 14, 2025 at 12:15 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>>>>
>>>>> The default image linux.bin does not contain any DTB, but a separate
>>>>> system.dtb is compiled.
>>>>>
>>>>> Michal Simek clearly explained "system.dtb is really old dtb more for
>>>>> demonstration purpose and nothing else and likely it is not working on
>>>>> any existing board." [1]
>>>>>
>>>>> The system.dts is not necessary even for demonstration purposes. There
>>>>> is no need to compile out-of-tree *.dts under arch/microblaze/boot/dts/
>>>>> unless it is embedded into the kernel. Users can directly use dtc.
>>>>>
>>>>> [1]: https://lore.kernel.org/all/d2bdfbfd-3721-407f-991e-566d48392add@amd.com/
>>>>>
>>>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>>>> ---
>>>>>
>>>>>    arch/microblaze/boot/dts/Makefile   |   3 +-
>>>>>    arch/microblaze/boot/dts/system.dts | 353 ----------------------------
>>>>>    2 files changed, 1 insertion(+), 355 deletions(-)
>>>>>    delete mode 100644 arch/microblaze/boot/dts/system.dts
>>>>>
>>>>> diff --git a/arch/microblaze/boot/dts/Makefile b/arch/microblaze/boot/dts/Makefile
>>>>> index 932dc7550a1b..fa0a6c0854ca 100644
>>>>> --- a/arch/microblaze/boot/dts/Makefile
>>>>> +++ b/arch/microblaze/boot/dts/Makefile
>>>>> @@ -1,8 +1,6 @@
>>>>>    # SPDX-License-Identifier: GPL-2.0
>>>>>    #
>>>>>
>>>>> -dtb-y := system.dtb
>>>>> -
>>>>>    ifneq ($(DTB),)
>>>>>    obj-y += linked_dtb.o
>>>>>
>>>>> @@ -11,6 +9,7 @@ $(obj)/linked_dtb.o: $(obj)/system.dtb
>>>>>
>>>>>    # Generate system.dtb from $(DTB).dtb
>>>>>    ifneq ($(DTB),system)
>>>>
>>>> Can't this be dropped as setting DTB=system.dtb should work if there's
>>>> not an in-tree system.dts anymore.
>>>
>>> I believe this ifneq is necessary, just in case
>>> a user adds system.dtb to arch/microblaze/boot/dts/.
>>>
>>> 'system.dtb' is a special name because
>>> arch/microblaze/boot/dts/linked_dtb.S wraps it.
>>>
>>> So, $(DTB) is copied to system.dtb, and then
>>> it is wrapped by linked_dtb.S.
>>>
>>> If $(DTB) is already 'system',
>>> we cannot copy system.dtb to itself.
>>>
>>>
>>> See the definition of cmd_copy in scripts/Makefile.lib
>>>
>>> cmd_copy = cat $< > $@
>>>
>>>
>>> "cat system.dtb > system.dtb"
>>> would create an empty system.dtb
>>>
>>
>> I have played with this and pretty much this patch is blocking
>> simpleImage.system build target.
>>
>> I have no issue with patches 1-3 and I would keep system.dts as empty and keep
>> it in the tree because users (including me) just rewrite system.dts with proper
>> DTS and call make simpleImage.system.
> 
> Why is "system" so special?
> 
> You hard-code this line:
>      dtb-y := system.dtb
> 
> 
> "make simpleImage.system" compiles system.dts to system.dtb

yes.



> However,
> 
> "make simpleImage.foo" does not compile foo.dts to foo.dtb
> since "dtb-y := foo.dtb" is missing.

Correct but foo.dts is not in the source code too.
Downstream repos can add multiple dtses to source code based on configurations 
which are supporting and then they add

dtb-y += foo.dtb

there.

> This works only if you drop-in a pre-compiled foo.dtb

as above. It is up to users to decide how they want to do it.

If they add dts to source they have to also add a rule. If they want to just use 
DTB then can just copy it there to get it work.

Another option is also just overwrite system.dts by custom dts file.


> "make simpleImage.<name>" works only when <name> is "system".

With upstream repo yes.
And the reason is that system.dts is just example.
In Microblaze systems you can have unlimited amount of configurations that's why 
make no sense to start to push DTSes to the kernel because it is only supporting 
one particular configuration on one board.

Thanks,
Michal


