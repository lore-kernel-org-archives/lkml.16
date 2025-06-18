Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E873A1DB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750224395; cv=fail; b=rNMzR3JFU4Nl3Pjb30wzm/Zm53EbQoOuaVq3I+t+WZCpDqo/yBz9O1NGuSZu7Iordb0FxX+0yK5qqND+V7I0a5U0MDvxnnKb3qsG/+eBpPneyvQ7hhNrxjK7wLMI9sfbgwptGveenbo0LCpphFBAkmwI1U2SZJZzE6BH6zhSFUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750224395; c=relaxed/simple;
	bh=2KVlpEFJuDlM74OKFDIi8A0PEX1zYZXMh6w6MiCE8IY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oNy++jbewc9HAiLMgSX9R9JKkGGromAjlYVaP0tPWGgj2bWvzfjb3Rjza87RnheItcx86sBup92hphjBofvOTT6FgeguHDDV2iGvMhK0CD3pVJlNeIMuqvywCw2IOlPhlMfMvFLzF52XfoUZGWMtLvZyy5+0/BQt6We0AIl42gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zDRNNs/Z; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zDRNNs/Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Io3pBtUpsTGoPa/UgKfwjKWK5KjJZ0jPr+0ZqFUVDVLlywLf9l0cdAl3vvXLoDkRAZQDOJhF9QTu9OslqSYALxC/0Yptw3FUpv2zTsJUC971Sfpp+SOeDP85v6uUca9Ky2j9+79A3N1YnJLaNm55sq2WIBhNDhUBit7RBUs3kzSD+I6kc4Fxep3YdPRN0MyTwRzlcG8Ho0FZGFOjRBJMiGPBwCA8QfTuioImEM7o8le1PN7u3IhM1QZTU2MqiWAWWF4v+gkkTJvQFjUeyALwKc8BHTFBVZzgYAg4naCqBWGPoIBwToJ1T+RFJ2v6mrSeMXdLrGOgNxjp46KpCcD/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAjxMpIRFr7NRLGyahJIv4sLA1+jrC2ucoWe16Rbm5g=;
 b=Qn8YPjoRRC5eRyvGYDo9UEZJyYVtw8tquvHXw7F6HrcHP9fORIIzsnXeKtOphHPWboxrSTwcixJWCs977TR/rMMERrwBMN5oJM4Pmhzd8BK5qBH61izO/XW+zjjND/70QYBBYQHwuDP/tUSdNkxkRfPJdRgr2aFHVI5DaBjS5bRTf0FabZU4D9rlWw5J/UhElqIc5I1sBsIyhSErzyMkNstFB1RN5A+CzCFveAKl3lS0BqboCBcxJ+uf6u/X4fywdYNiW9MzLA8BKEb6WChj4EUEDCGU8p8YybMYgiMLT/a9WvpksNtZFiv+HB9TFxgZ9NMcGO6SskfCNB9/ud2wwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAjxMpIRFr7NRLGyahJIv4sLA1+jrC2ucoWe16Rbm5g=;
 b=zDRNNs/Zv9M4n2ehd60g1gEbVCAZWZWkWBvG6egSqZpkpzaHCkqhEw2FLcqfew9sRUIxJXS9C2zs/q5/1p3BFdwIvdTzscc6o8gjOBt3vO/W/Nv7jQBFuq8rwngMcMLohJR222YiiFJgLZjGPfCd7dc37rfTSYrMcpsABdQetDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DS0PR12MB7558.namprd12.prod.outlook.com (2603:10b6:8:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Wed, 18 Jun
 2025 05:26:19 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Wed, 18 Jun 2025
 05:26:18 +0000
Message-ID: <df39d7d9-4291-450b-85b7-4c57a3c4a025@amd.com>
Date: Wed, 18 Jun 2025 10:56:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/cpu/topology: Use initial APICID from XTOPOEXT on
 AMD/HYGON
To: Naveen N Rao <naveen@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Sairaj Kodilkar <sarunkod@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Babu Moger
 <babu.moger@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20250612072921.15107-1-kprateek.nayak@amd.com>
 <20250612072921.15107-3-kprateek.nayak@amd.com>
 <2vanc3xxtjx3ytcl2dwcu3vmn7d2ixpco3mj6p7qyloga5j25p@5ldwqxycaeko>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <2vanc3xxtjx3ytcl2dwcu3vmn7d2ixpco3mj6p7qyloga5j25p@5ldwqxycaeko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::25) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DS0PR12MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a74ea6-ab8f-4bf0-29ff-08ddae28a72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1hMWW5lZHBhRDF0eVRReVhLSUtsU2dMM25WVUQ4VVIxTUJsbzFhVWYwMS9G?=
 =?utf-8?B?VEtWMEwxNEFwNkY1QzY5YVo4alBXdmFjd24wWm4wd3QxaVRrR05GMVZwNjZT?=
 =?utf-8?B?azBRdnZCRjJldHZhYkF3UEczeXd3SzlXZ0ZOWUdKOEtKZWFBZkpGTlFyZi9K?=
 =?utf-8?B?bUUyYTdUYVZmTkVpT0tNaW9FYUFETnhwRS9OZTVQTlgzNGc1aHlONzB4bTV2?=
 =?utf-8?B?RTJvcWpjeFpkS3pvdkFIUmppbk1iZ1lSZnE2S1ovcFZtM3dYUStMNmRFMVIx?=
 =?utf-8?B?a1JiSHAxbEJRMktvbFRGSlZsOG9Rd3p4N0thWWdrenV6RzAyK0ZsZE1jSHJT?=
 =?utf-8?B?QnZyMzBNRGdQeHphSkF4YVdjVUZzdDJxa1QzYjRSV0dKQ2NTbFRseEFOeU4v?=
 =?utf-8?B?SHRsTFNmNTJNUGZkMUcxRGVaSi9IL1hpcWM0RUVjT3lzeHdLRVhPTzNDcVdO?=
 =?utf-8?B?UWFYQzFqSG8zcHljdGJmd3VrQU1ZbXE3VUUzSytrNUpaU3dhYnhoSE94ajB6?=
 =?utf-8?B?NmdFSVRRbHVrckZQcldEdjE3Rm93dUdMdExSazV3YTBFR0lKN1hKR2tOaU43?=
 =?utf-8?B?TkJFVkFLd1duSjZITHducWFuNHNPb1NnalVTMnB4YmhINzFwZVRMVU1ETEpi?=
 =?utf-8?B?ZDU4dSttclhXVngxem1jczFlY2ZRZEdZVW50MmZVbDR4V002RnpodFRGZ1lE?=
 =?utf-8?B?bzhtUWs4R3BQTXJDYzN2WEhQTExzTHh1d3J2VWkzRVgwZVMwMEUvQ0FXaDJM?=
 =?utf-8?B?L2xkL2FiNDM1YjRVczJ4OUtjNVZ5U08wbTFxYWFTQ01zM2R3MTRqbmp0U1gy?=
 =?utf-8?B?TXBtVkQyb1dVRTV2RVJlZ1NzcHZtQVczRXhQTlo2aEF2M29FQkpicmc1UWUv?=
 =?utf-8?B?Y2ZjODRpSkE1UTJLYVBXVEg1cXg1OG1iZURVRW4vNjBPdEpDOHk0TUpUQU9P?=
 =?utf-8?B?VEFjb1VTYWRpSk5OYXFVU3FSNXEvRldjTWRmSmo0dkZZeU9OcWJ5dkk0czlT?=
 =?utf-8?B?TFJ2b00zOFcrcTJJQzVnMWc4VWNiZzFiYklKeCtScTVqZFd6VWsrUXJTcUhH?=
 =?utf-8?B?ZVlRRi9yVkZIb2lCeGZkOVFtOWUySUozakdDY1FGelpvNUFMR1JwZis2NE1t?=
 =?utf-8?B?b3I2aUx6aUhyVllLdjNjODI5aCtKQ1VRWG8rSi9MVDE1YXlWWkNuVjNWZVBT?=
 =?utf-8?B?R1JoOUZnVXlVMlNYRUF5dWpyUWczTkJPakJCaHJoelpTZVpxZUFUZlM4NGM2?=
 =?utf-8?B?UWcyV2pCL1lxNURwN3ByT2VlZE1pVWRxWTdPYVNXRkV5N0xZZC9jSzFUNXh4?=
 =?utf-8?B?NHI5b3ptcXhtc0dCamdENkM0bDJqZnJ5RkRhWkxCQ0RlRy8zbHNyUzF6WDJV?=
 =?utf-8?B?LzkrOWpjWEFZbHdsWWIwdWxqcXRIYXJiaGp1amxlNVVVSGRhdGZ3NWxRUW9B?=
 =?utf-8?B?cmZoRU83WEIzNi94TVl1clY1RXNOaVpXODlyTjFmcVg3Szdxd05NUkhvcFM5?=
 =?utf-8?B?NTE2RFAyNFhIam1BUm5DbWUxcDRxai8xMFEzaThDWG9xK1BJSGVRYnBjWXM2?=
 =?utf-8?B?dThhaUpYeUVIZ09seUozM25hSnVNVW0yeTg4bmJUTjYrU0xkNVgreHN0RlZN?=
 =?utf-8?B?RXhJbTBmVWNCV1lJaWZLQ3l2ZUE3cGdWZVM3d3lwRDFqbzdyQkp0TGt1dklM?=
 =?utf-8?B?c0dRZ2J1dEZXeGpkb1NMM3MyWml6TCtKUHBQZmZQV0FCcjVaRUlsNU42L2li?=
 =?utf-8?B?U3UyYnFESGFQQWtrSnh2S0VHcVM2UWZLTkY3SGJBdlYyeGVLMG1iTEp5TE5B?=
 =?utf-8?B?U0RsWVl3UWNyRjdmU0pwOGhRYkxiYnBFcGxEQVBhb1RXSTBTMkdYZzlJRyt6?=
 =?utf-8?B?Vnk5T284eU5mTG0rZHB6MUR5K2ZvYWkyYitpNHVkckM0VEdONmI3WXJPOEFC?=
 =?utf-8?Q?fNjzEkuhBtY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3ZyWTJNaGQ2a0tRMHBqbWhmOWUvR2dlUXVHSzFITFU0dENjYlhzcCtGMHJZ?=
 =?utf-8?B?Vkt4ZTBoQnE1MFBXMnhQQ2dFcTdQdlM1WDJoTXZsTnFLZDZQWDZidGROeTNY?=
 =?utf-8?B?eGJVU3Mxc0RZQVdNb2xMNzlWbko0UUkzeWRFdXhiSVNuQnV1TVFqMWtCUEtE?=
 =?utf-8?B?L3FDRzdTTEdhWmxNdENrYm5Pemp4VGJFNlVBVmpFWk5COXlTVnFvOGpUUzlw?=
 =?utf-8?B?S3hTTGt0aDJGajRuZDhuU0d0djBDV3FhQnlBMGdjekw1QThha3V0bHl0MG4v?=
 =?utf-8?B?c1U4amI4dS8yT3lZaFFhQzNTc3RpOVBReUFHdG9oYVJ2R2d3UmY4N0JLL3Fx?=
 =?utf-8?B?NDFLUCtrRnlGQTRuWkpWTVhRNENMY0VpSlpOWUwzRXVWYTV2MlloNkIxc0xa?=
 =?utf-8?B?KzNvN3FHcHlyWkd3K1Z5eXpjMy9DeHdWMFpTYzdOVGUyaVgzb3JISWswZEdj?=
 =?utf-8?B?aW1GNUJKZTBTWERXUWlsZFgyWVJyMlU4ZmxHckxCR2d3bzY2L29hUE4vVUcy?=
 =?utf-8?B?bGFBU2dXaDNvcTdoNzZhdG9nUUlsOGZZd0lYZTRhR1VNVVJiK0JiNUo4NVEx?=
 =?utf-8?B?QXF2R1ZFeHBVandFQVdOUXFZdExPbnJMdnlMSGowUWZNQXhsK0RCT1FPMmVs?=
 =?utf-8?B?Y2g0Z2xJZzQ0cjVWVjU2d2JiaTlWdlpBWU5UVVc4Uy9qYlBOSENhYzdRNHY0?=
 =?utf-8?B?NkFNNDBMUjJQODI2aWNPZHZraS9NUG9hRklvTnRXd2pId3Z1QnIyTGVGTzB4?=
 =?utf-8?B?MlM1a2daSDVVWGNpdThlYlRqN0JON1Rwejl6MnZiTGtPZEdZTmx5SFk5M3RX?=
 =?utf-8?B?eGZDRGdnalBzSzQ2UldFejlXY2p3UlRvVHRWN2tJeUVWZTVGSEJNOHFncjVX?=
 =?utf-8?B?Z0d5VG5BR3dzVEgzWDJTY1lqYldwQXQvZVF3a1ZFUGhHZ2Q1b1d1RVVITFpB?=
 =?utf-8?B?OG1iMkROYW0vTHpSSDZFTlpLRzNRZ3Y2WGRqbnhZYmw5M2g3NXJYZTc4WjQz?=
 =?utf-8?B?VExWUVJmcXRPYkZpWTRiVzlyM3YwRlJ4ekRzbmVveFVQVkJhekhnQVB6NmU1?=
 =?utf-8?B?Zm5uWUxHK29PUENGdGZUcld4NmsyRkxvRXpvcXZ1VWlrdEpwZDcxdUVxRzNy?=
 =?utf-8?B?SEY4VTRLZFpleEx5T2VLMlZyQ1Z6RS9kRVdCS2pNYlJsQnFBNlJUTndWMzE4?=
 =?utf-8?B?Q01mTlFkOW9HTnBlOVo0V2xVcGxHOUJxMkV0cG9CZU56blorMk9oZ2w0R0tp?=
 =?utf-8?B?QlNSYzFYZ1Vja2hVUHdUbTRtaElHK25XK1F6TzhWV1Vrc2Z0QStsVWpwTno5?=
 =?utf-8?B?ZkxscGxoamhOVGRUN1pxczFWRDI1eitIM084bzZRMThtNlhrbmdUUnh0dnVM?=
 =?utf-8?B?dDhlaWZPQlMxRmxrVFozdVMrZ0EvLy9pcnZqSDlzbGZUbUJ3YUdvcTNjSkdO?=
 =?utf-8?B?N2tkUmFTekVsQXpDT1hEY3cyejZEOHpvK05ZMXZtVEJ1UDRXd201TzYyR0Jj?=
 =?utf-8?B?RmJMSWorUHRoZGNQd0pieVo3aVNVU0F6K0JOZE9zYnM4WWU2L3FiRklPWDdI?=
 =?utf-8?B?RUt2V0k2aFF3SEpIREZjZW5lVzlhTG1yRHMyVm9hcEdCUytXVWszM3hlSGJC?=
 =?utf-8?B?WkVxdFNTYzY4dFNDTjkwZ1dMbDNxVjF2OCt3NVRTNDl0SnFVeGFOUmZBN1JE?=
 =?utf-8?B?dXR4RGFFVjlFYkhOTkc0VzhXMHFiaUh0SDI3TzdSQ0FuRHdaSTlFZjE3Q2JH?=
 =?utf-8?B?RGFMR3ZINjhoMExrQVJCRzQ4c2tOTFVVTGROUlozbkdkV3I3RzhtVzBRVU9F?=
 =?utf-8?B?Z0pYc1d1NG5NazFuUnJwdjFRaG5vcE9RWlVBWXVmT3RkREVlZDVtcmZWQjV3?=
 =?utf-8?B?aSsveFlMNHZKazQyK0tiR3VwbXBINVNQamYvWHZMWHdrUDUzK3RycDJwUjM4?=
 =?utf-8?B?QVRmdVA5cytNRWljVXBUMUt1OWpSY1k1am92VUZhdnJiT1hqQm4yWlRuSk1F?=
 =?utf-8?B?cExHUzBaUjFWZDFYdWNkSHV2cUFhWUd0VGo1YmxJclI2OHpJdkY4RDJTU0s2?=
 =?utf-8?B?d0xPQWxXNWtqZlMwZExVRjdrd0t6WklObUNIem1oTTFVNmZKcy90MW5WTlRj?=
 =?utf-8?Q?1ysnqu6Bl1Gt+x7BMCFUT6Yar?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a74ea6-ab8f-4bf0-29ff-08ddae28a72a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 05:26:18.6598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOCJw+O5YzF+wKyf5cQilJJL4/xgloJPB/jlsLE7WLUu4urRtqYbcbRkuGiFVKiK1tfOOx16UVTNm66waBOcLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7558

Hello Naveen,

On 6/18/2025 9:30 AM, Naveen N Rao wrote:
>> diff --git a/arch/x86/kernel/cpu/topology_amd.c b/arch/x86/kernel/cpu/topology_amd.c
>> index fec849fff82f..2ff6988e020a 100644
>> --- a/arch/x86/kernel/cpu/topology_amd.c
>> +++ b/arch/x86/kernel/cpu/topology_amd.c
>> @@ -80,7 +80,13 @@ static bool parse_8000_001e(struct topo_scan *tscan, bool has_topoext)
>>   
>>   	cpuid_leaf(0x8000001e, &leaf);
>>   
>> -	tscan->c->topo.initial_apicid = leaf.ext_apic_id;
>> +	/*
>> +	 * Prefer initial_apicid parsed from CPUID leaf 0x8000026 or 0xb
>> +	 * if available. Otherwise prefer the one from leaf 0x8000001e
>> +	 * over 0x1.
>> +	 */
>> +	if (!has_topoext)
>> +		tscan->c->topo.initial_apicid = leaf.ext_apic_id;
> 
> My understanding is that the rest of this function continues to work
> properly with an all-zero return value from CPUID leaf 0x8000001e - data
> from topoext is preferred where available, and other sources are used
> for llc_id.

Yes. QEMU just errs on the side of caution for CoreID collision in
0x8000001e and "NumSharingCache" in 0x8000001d EAX[25:14] can still
represent 2^12 (4096) CPUs in each cache domain which is larger than
the total number of vCPUs possible currently I believe.

> And, this fixes the firmware bug warning seen during a guest boot in
> qemu for me, so for this patch:
> Tested-by: Naveen N Rao (AMD) <naveen@kernel.org>

Thank you for debugging the issue and testing :)

-- 
Thanks and Regards,
Prateek

