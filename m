Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A56372;
	Fri, 13 Jun 2025 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824885; cv=fail; b=ee9dy7tepsFj6GP/KqS1yp2nQyy1X7hSyuwnRmUZiDGi9qoIqNcaMqH/ALp7ZjBRRLffkIk2adj8AMl3vfQM1mmpFmDW80nfgLftyvcSZPVcHa/twzE2BrH/4alpbwn3aJbgDMYXce6lnnbOuAd3p15I2cicyC36vkxiddYMkMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824885; c=relaxed/simple;
	bh=Xjuc59QB7bvUyVLnzwNNYwBir5Hq/BLTkChwiTHYVyk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qg7Ll9MamFD/vw0+r2phEd3AysFWlgdfVj0rkyEfFeDYEr2klqd1XT9qU61/B3IrvdfispFSuQt2KzUbjc3WGLbTfRCfA2rtllwZu6pycyV+RQ2R8oP5p56ZmMTlP83HtDK2rNZqHF5P08o47DWYEa/KadzUzpRu6FBPuNbnUBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=VReKCd8V; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="VReKCd8V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zww8ObvgKJSwj599fMxgU+r9ZufMiU/PMQs6GHvKHlDAWcXF4IH3vMlE6gO3Y4/l4XtwZtSk3Arg0OcvwxD/cIOVX+mo27KOVsmW0BKetms5lsqjNcjxsqH1O2M+iXIDfodeT2YsMHejbBwoXGXzmbT64Fh+oZK8AxuRPIuknZYZpgpWEK2X5FiqSarbucOUg2FUcmz757IJNmaMt0Qcbgluy/RSpxzawzUBD0ioVPvNyQYzFeOucXf9jZy3HYeF6SxLffhZVGrHK/343vawLYQLeh7zrsEX1dQGXDsS7iZ/7Smx1jhZXPUa//te2Cfc4fcNyn6nJjhXvQxQ/gDLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JefPGkX6ZAcCyPvWGPnvLolLevZbeCzIPqabjn+uzME=;
 b=KSPVFDjLsHmpV+sLyvqHqnTjgd8z66nqWipGfK8nAq5CSyiRAVWSr69afjzMif3lkIEirTyROu2n0ZdKJ2yfjZHL52KgVf4REqIYYv8vNMDwRE8f2uox++XJ/M4JE/eMB4aoFpHXC1HDFNeYuIbbX0w4wJGUlDhStSkK1rn8wn7/jdqk+dsfsDk927ALCM9Gx9HhwTb1BQHdMPUkIWGjsL5+3mKgFOFN4Fe1E3DzYPZ1AvwrSOc8zbxV6Qw9SHf8XJDdae1jxpObvR8G82u2pFeWxxxqVStrxJdfywnP7dQoJWunWc2n1ELjr0jw3F1ML+4Imx0LlPBe6/dwZ82jtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JefPGkX6ZAcCyPvWGPnvLolLevZbeCzIPqabjn+uzME=;
 b=VReKCd8V87Nyt2h88oI0Ir5Xrb/rKnhB69aAyW5W14dtPUGrHKLz9Ni4vhbenZ2UJMwQUyxgKAgcE6LoVHdQNP1ZdqkDXmmexn9vyhScZtwQTjyyM/KpcJH69Bi+niIQGfXiBLB7UKUA/u3V/eKfiXskCgLkpLs5jHPqeeHqPvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10187.eurprd04.prod.outlook.com (2603:10a6:102:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 14:27:57 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:27:57 +0000
Message-ID: <96d32ce8-394b-4454-8910-a66be2813588@cherry.de>
Date: Fri, 13 Jun 2025 16:27:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakob Unterwurzacher <jakobunt@gmail.com>, foss+kernel@0leil.net,
 conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 jakob.unterwurzacher@cherry.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 Kever Yang <kever.yang@rock-chips.com>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
 <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
 <35e0a925-4cba-41de-8fe4-4dd10e8816f1@lunn.ch>
 <380ba32b-bb9a-411e-8006-127461cac08a@cherry.de>
 <3303d8d4-ec5a-4cdc-8391-ab6e35d76b33@lunn.ch>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3303d8d4-ec5a-4cdc-8391-ab6e35d76b33@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI2P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10187:EE_
X-MS-Office365-Filtering-Correlation-Id: 291bd7ea-82af-4b75-827b-08ddaa867d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akw1NGJtUUsxWmhJM2tCaHpzM3FPQ0ZHVU5rcm81aVBtVzN4ampWajBIdUQx?=
 =?utf-8?B?aGNtQUZ1eWZ6U2w1aFJvaEVzd1pxNWc0aU5rYWJFbVRQVzZSSnowTDl3SkUx?=
 =?utf-8?B?Y0JkNkpzekNYN0JERkdTSDdmWEtnd0JLbXFEQkpyNnZZRnpqL1REOGRpcmlO?=
 =?utf-8?B?QXVrRjZ0R1dVcktLeld4UDlXQWVHQU9hUW9ISUhFL011L3VsNUM1Q2N0TDhx?=
 =?utf-8?B?ZWZmcXpGQnVXV3N1QTRxOHNIWE5FaXg4TVpvY3ZqV0trU2hKRXFSakp5MU9u?=
 =?utf-8?B?SWVsTTBzYUdON3Btb2FnZnBsbGU4QlNPL29MdTNZOEV4M1NVVXJrMW0xREh0?=
 =?utf-8?B?OXNJM0VjUnRwY1UwWGFYNkVxOGoybzVZZUFSc1M1KzNuaGZtTldsMmxEVmZm?=
 =?utf-8?B?Slk4ZDRpR1VhOVVGQVQ4VlpOcUY1OHpwYUFEb2dNYmVTODdHVVducTk4ajZN?=
 =?utf-8?B?RGNoVDRiME9aRE00KzRBUHhFRkNvT3o1Sk1ZSFdLZ1pSM0RIQm5TTDZtNnZo?=
 =?utf-8?B?b3YvTGwxOUpWYXBNTnRrOGJBODZnNDVITzBUVHNTbnYwMGE5S0c2cHV2dDV6?=
 =?utf-8?B?TEJlQWtza1Y4eWpVQWxqMmZMTC9kdlJzblVTeERUNm51K0UxSm8vaHBQYmZz?=
 =?utf-8?B?ay9GRFFCSzJkNmZaNjBnUmQwM0l5T29WMUhPRUNueHd1cGNRT3BKdlNqc1Vk?=
 =?utf-8?B?amsxTThBL2FxcURYQm0vamU3YVdRMzFmdHhTSEhjNC85MGpNYkRseTBQa1la?=
 =?utf-8?B?c28rYk96V1Mvc2JmUlRRcnpGcGJZMUlUODlhcW5QM2pwOHFnUjlKZUtKUzdS?=
 =?utf-8?B?K29raXVIU0pacXQ3RTM5UWRldnY1eWVqUFVTcW1icUxJb1F1UFdnblZFK3J4?=
 =?utf-8?B?V3huRkdpeWp4bUhhN3JBWUtpWFU3R3BzT2dXQ1NNUGxOb00yTWxSUzNXdmNv?=
 =?utf-8?B?TGwzd1pvM2pvZTk4aDB0NjRMR0I0bDVvNnd1Ti92MkNlR1VUeVk0bWlSQWNS?=
 =?utf-8?B?eUFvT0xwOU1pdmVHSEw4OUl1dVY0dlI2NFpTZHVLeVhUbmQ1R25Rd0RPMGpx?=
 =?utf-8?B?eG8zV3E3a0R0ZFpnVHBQc1pnM1ZGOWVIRDcxYmsybXZ2QWx3S3R2VG91R1hC?=
 =?utf-8?B?UUpBODN1QWxoYTlQSlhiNnJhSTMyOGJzMitPekJMV1k3bzhIMmxXVE8xM3VQ?=
 =?utf-8?B?WDJyZE04Nk9ZVkwralZnTXdlQUxqTjljQzU0YkJkL2RvK2VBWE9HVklGQUhT?=
 =?utf-8?B?TVNFTGpXa05xUzVYOFlpWkh6aGNvT25GbHRmRmExYlZyZ1FOVVVjamRQRE9i?=
 =?utf-8?B?NkdGeTd5NUdEQXlwcWp4dms1V2RzSWpxZ0FJMnFzU0NHMFk4c1AzeVZKUUdW?=
 =?utf-8?B?T2pRT21SeHlOaFhxM1VtTVRCOVJmVjFPbXAzb3NSQ3FLR3lsaTVLcFUzaFBP?=
 =?utf-8?B?Skcwc3UzZ09rV1U0Q0p6RGZOMXZNWWNGS01VWko4ZXEyU0RpbE1sOGlPd0RQ?=
 =?utf-8?B?R0luNzNtcWZMb1VDMlZoWkhqd2FFTnh3R1N0RmQ4WENpbjdaSG1VZ204WjFp?=
 =?utf-8?B?eDZNQzFjeFd0UithWXp6dW03QnpmQ3dmbkg4WnREUCt1K251K3AybnZDa2Ey?=
 =?utf-8?B?UVpPckdSWHhoVXFFalhOb0ZQWmhnV05WVnhmRmFsRTlGczlvV05mUThaNGtL?=
 =?utf-8?B?OVJIbThHMER4TXNzUURrWk1pMHNYRlM1dHFod0R1NktQNDNSbFBrbVBObUxn?=
 =?utf-8?B?VXhQNURCUkFoVUhZUmtwaS9YSk5ESGt6MEQ5RlV4T0JWYklWc3M2RExTcU1B?=
 =?utf-8?Q?xEu4wHuC95J9R2i66K8ZyQtQ9Dn/8I75+ySyU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUVTM1k0Ujh0WHYyRlZlamRsSjk5NTdEVTRqRHFpajdHNk1KbXlPUm84SWly?=
 =?utf-8?B?RktHUkZjNHp1SURWeEhHYVBacnk4V0MzZEIrYTFjS1FBQ09mWmdPaWt0cm9G?=
 =?utf-8?B?Y3BzL2ZWMjlBZ1RFNzl6MmxTcGZIYndhTmswSkxIbTRmWEZUdEZKNUVQeEpk?=
 =?utf-8?B?NHBmV3lPaXE4SFQ4Z0dWRlFpKy9FOG9tUUxnWkNOSFQyeGswYmJha2NmWDNN?=
 =?utf-8?B?bkxackppYVoza1ZZMGlTTmdyWDNFZWI4T3JvVThVai91T3RqNnVIM2IrZXNL?=
 =?utf-8?B?NmJmOS85RXBMZ2p0WmlaY1dPa2VWZDBhQlZ6MUt5ZVJHT0dZMitvMUxZRWZp?=
 =?utf-8?B?V2NCTmM4Ung1alJmU2xrdXoyK2pOdW8rMUM3MHNvWlhROVZaQmFQcWpkbjVV?=
 =?utf-8?B?Y2hERlR1WGdjM0d6cWRkbTlWbHlZUDNERzNuQ2pSQXJvWHJlTjQrbml5YjFR?=
 =?utf-8?B?Vkt2c0lsRmgwWDhuNjJqOVBZc1R2WUl3M2pKTVlkRjliRFR6VGZ4MlFucnhr?=
 =?utf-8?B?RzQzWDFtR2Y5bWN6T0JhWjVxQko3b2xxcHM0bVB4MDlpWnI0eHJjMVhESExx?=
 =?utf-8?B?TE9IWFJSL0YrTi9OaFJ4N3c3N0VJM3VaN0ExSnV1OFdnRkR0Z0dQcThMOHFM?=
 =?utf-8?B?V3oyWi9ra0hDYXZxSitvOFJrRVdkd1l5WnJWQmh0NHFVYUVQNGEwd05Mb05K?=
 =?utf-8?B?UkZvRjFhME9kQnZ1M05DUVVDSEJIOE5VckR5MUoyWHVRL1ZUd3lESGZ2WXpZ?=
 =?utf-8?B?NXYzTFBxZFZFa1VXZUxPQk01V01CQ0Z1RzNObTR6SE53RjJvYzIvb1BXTnhh?=
 =?utf-8?B?OElvR0VDYWdjL0hHSlcvd3ZhbmlHVU5VUGR6ZDlEdkZSNkh3QnAwVVU4U3VU?=
 =?utf-8?B?YlVNMXhiR3RUYVZjUVZJUHU4M0JFRm9Bclh6ZmdnTGFxeDRTZis5OE1Pcy9X?=
 =?utf-8?B?S3FuVmVCeFk3TDg0aU4wS05UNFhQOW50V0dhcTZiVzF2dHlRZXEzbGJyNGsw?=
 =?utf-8?B?S25qVmEzRkF2c0hGOFRka1JSTDk4UWVUY2JVVXprMGp0Vm1sblFPMEgyaDl4?=
 =?utf-8?B?WVRmc2Q5U0Nad09QVUVQaFVnQ2ZkS0laSlMweWgvazg5YW5EYmhSYk52TFBI?=
 =?utf-8?B?aDJ1WVh2OS9NcHBKWklhN0IzbnprY1VyYzQ5cWhseUlLL3BKTExSQ2pjVHhj?=
 =?utf-8?B?Q3EvL1hkVXNBMWtieXpObDJqVFNhTyt5ZGJQdmxNcDdSVzltbWVGcWUrU0Fz?=
 =?utf-8?B?Smd4S29pLzlSMDRoYWttMnU4eDc3LzlLNVhKdU1OaUxydEYxYXZxZWloRE0x?=
 =?utf-8?B?SE5qVVVqd1Uyd0hDRWo5aVBLVkhZajNHTkhmSlRQSis5dlNxQjNVT2N1VWNw?=
 =?utf-8?B?blF5MEZYaStRQllTZEVKUFJyNzl6ZTcrTGlhZ005c3l6aUpZeUlad3djT0R3?=
 =?utf-8?B?bnJCV0ZReVY1NExDZmhoTmxEc2tlbGsrOHNGNDNPMUp6WXNQdHdWRWoxbnlu?=
 =?utf-8?B?K09vZ3Ivb29rR2FmSUw0d3FKd2c0THl4dUJ2ZEQ2WEZFWk9pdUZIOXprL1E5?=
 =?utf-8?B?TUR4RXFqdC9ycFVSZGJjcFhJVzlWNWtjRnZiSTRCUFFLY0ZQT0pvRGhidy93?=
 =?utf-8?B?UTdEdHQ4ZWtwSXZhL0Q1dmNHeDhoOXRoRFVwVmNmTTl6Q3dZZDI0b1JuRnpX?=
 =?utf-8?B?Njd6QVVod3p3UGlWNzV6S2FzSlFzeHRGam5GejVMa2ptWVA2WkVkaXpma1VL?=
 =?utf-8?B?Zm43bVJ4amJzVDZRZXFYcWp1OStyd2QrV0ZVRHRqV00yTjI0MCtjZzR5RVpT?=
 =?utf-8?B?ZFJ3SnpTSE96bkJyeEN6QklycTNNQTZtQ0NFLzNQMWZhK1hWL2M1a0N4QWFi?=
 =?utf-8?B?SkJ0MEwrSWpYRHlma2hVcHZUUk4wTGdSVUxWclZPVGRrWDdZa3VoYnREbFpk?=
 =?utf-8?B?ai9laVF0RFlOWlJxazRBT29CejlZdkNDVEpET2YxNjVoSFJyUzBRdmNsQm9u?=
 =?utf-8?B?dHZLdzRUOWMrL0dmMmJBdEJpb1FFbUNIbjRLK01CUjhqUktqN0FSa0dLUFVo?=
 =?utf-8?B?dVluaDJsam90dmlEWVRyMjZ3QjNxZ3BBaStrKzNGK2ZYekNKbGlidkpWcEFK?=
 =?utf-8?B?cEFnTVpYMnl5QkxXQ1h2emx3Y01BVm54QlZhRG9xNEkweTZ1Uk1pQnBCQyt2?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 291bd7ea-82af-4b75-827b-08ddaa867d8d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:27:56.8674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CNvPoxXaylFnK7wW9IqpHMonfvKfs7LdDkaFsb0XHOiQlkvzKpLAarTyO6edkStXM1uXVSpWwzvSqo4xRoqmfJ/XZxIm2FsiWLot+VEWr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10187

Hi Andrew,

On 5/28/25 3:09 PM, Andrew Lunn wrote:
> On Wed, May 28, 2025 at 09:56:51AM +0200, Quentin Schulz wrote:
>> Hi Andrew,
>>
>> On 5/27/25 6:18 PM, Andrew Lunn wrote:
>>> On Tue, May 27, 2025 at 03:11:42PM +0200, Jakob Unterwurzacher wrote:
>>>>> @Jakob, is this something you could check? devmem2 0xfd58c31c w 0x3c0000
>>>>> should do the trick to disable the circuitry according to the TRM?
>>>>
>>>> I measured TXCLK vs TXD3 on an oscilloscope on gmac1:
>>>>
>>>> 	Setting	Decimal	Actual TXCLK delay (ps)
>>>> 	00	0	47
>>>> 	0a	10	283
>>>> 	10	16	440
>>>> 	20	32	893
>>>> 	30	48	1385
>>>> 	40	64	1913
>>>> 	50	80	2514
>>>> 	60	96	3077
>>>> 	70	112	3565
>>>> 	7f	127	4009
>>>>
>>>> 	off	x	-315
>>>>
>>>> Setting = tx_delay (hex)
>>>> Decimal = tx_delay (dec)
>>>> Actual TXCLK delay (ps) = Measurement from oscilloscope
>>>>
>>>> Plotting this we can deduce that one tx_delay unit is about 31ps.
>>>
>>> Nice to see somebody actually do the measurements. Based on this, it
>>> would be good to implement:
>>>
>>>           tx-internal-delay-ps:
>>>             description:
>>>               RGMII Transmit Clock Delay defined in pico seconds. This is used for
>>>               controllers that have configurable TX internal delays. If this
>>>               property is present then the MAC applies the TX delay.
>>>
>>> For the moment, please limit it to just the device you measured it on.
>>>
>>
>> What exactly do you mean with "limit it to just the device you measured it
>> on"?
> 
> Nobody seems to know if rx_delay & tx_delay operate the same across
> the whole range of SoCs. I don't particularly care if these properties
> are difference between SoC, they are vendor properties, with
> undocumented magic values. However 'tx-internal-delay-ps' is
> standardised, and has a very clear meaning. I don't want it used
> unless somebody has performed a measurement and we know that 2000
> produces a 2ns delay.
> 
>> I'll need to implement reading the delay from the stmmac driver to use this
>> property, do I need to restrict reading this property to the SoC we tested
>> (RK3588)?
> 
> Yes, please only allow it to be used on RK3588, and any other SoC you
> can test and verify its behaviour.

Coming back to this topic, I'm unfortunately the bearer of some bad news.

I implemented the suggested logic (see at the end of this mail) and then 
went to validate it with Jakob's help. Unfortunately, it seems that the 
delay value really isn't stable or reliable.

We tested the same adapter with two different main boards (the same 
product, just two different units). With a value of 0x40 for tx_delay 
(which should be ~2000ps if we have a 31ps per tx_delay unit as 
empirically decided), we have one board with 1778ps and one with 1391ps. 
Following a hunch, we started to stress (or cool) the device (with 
stress-ng/a fan) and it did slightly change the result too. Changing the 
CPU operating points (and by extension at least CPU clocks) didn't 
impact the result though.

While this could be observed with tx_delay property too, this property 
doesn't claim to provide a value in picoseconds that 
tx-internal-delay-ps would (but at the same time this didn't stop it to 
be implemented for the DSA switch we have which claims "more than 1.5ns" 
and nothing more, so maybe that would be acceptable?).

I feel uncomfortable contributing this considering the wildly different 
results across our very small test sample pool of two units and slightly 
different operating temperature.

Cheers,
Quentin

Here's the patch I made:

"""
 From 4ad2976b08b0ca93504942a80aba4bfe76fdbc51 Mon Sep 17 00:00:00 2001
From: Quentin Schulz <quentin.schulz@cherry.de>
Date: Wed, 4 Jun 2025 14:12:01 +0200
Subject: [PATCH] net: stmmac: dwmac-rk: add support for tx-internal-delay-ps
  for RK3588

The RGMII v2.0 spec[1] specifies the clock output needs to be delayed by
at least 1.2ns (typically 2.0ns) compared to the data lanes.

As documented[2], there are multiple ways to implement this delay. The
PCB routing adds this delay by making the clock lane longer than the
data lanes. The MAC adds the delay. The PHY adds the delay. Mixed delays
are heavily discouraged. The first one is represented by rgmii phy-mode,
the second and third one as rgmii-id. Since RGMII has two clocks (RX and
TX), it is possible their delay implementation differ. In which case,
rgmii-rxid represents RX delay added by the MAC/PHY while TX delay is
added by way of PCB routing, and rgmii-txid represents the opposite.

The Rockchip DWMAC driver actually implements the RGMII internal delay
the complete opposite way.
The driver allows to specify the RX and TX delay (using an undocumented
and yet unknown unit) through the Device Tree (via rx_delay and
tx_delay). However, rx_delay is only applied when in rgmii or rgmii-txid
mode and tx_delay only when in rgmii or rgmii-rxid.
This means the driver is currently entirely incompatible with the Device
Tree binding as in order to add a delay on the MAC we need to set
phy-mode on the MAC side to rgmii instead of rgmii-id, rgmii-rxid
instead of rgmii-txid or vice-versa, along with rx_delay/tx_delay
properties.

Because we cannot break backward compatibility with existing Device
Trees, an attempt to fix this requires a new property. Fortunately, the
Ethernet controller binding already defines such property:
tx-internal-delay-ps and rx-internal-delay-ps. Those represent delays in
picoseconds.

Unfortunately, there's no documentation as far as I could tell about the
relation between an rx_delay/tx_delay to write in the DWMAC registers on
Rockchip and the actual delay in picoseconds.
However, based on empirical data[3], it seems a unit in the
gmac{0,1}_clk_tx_dl_cfg bitfield SYS_GRF_SOC_CON{8,9} equals roughly 31
picoseconds of delay on RK3588. Considering that the RGMII spec only
requires a delay of at least 1200ps, a granularity of 31ps seems
acceptable even if it later turns out the scale isn't perfectly linear.
Users will typically set tx-internal-delay-ps above 1200 (in
tx_delay "units": above 0x27).

So this adds support for setting up the delay via tx-internal-delay-ps
on RK3588 only as there's no empirical data for other SoCs just yet and
only for TX delay as we cannot measure RX delay within the SoC.

Setting both tx_delay and tx-internal-delay-ps is nonsensical as they
represent the same delay but in entirely different HW setups that are
defined in Device Tree, so this is forbidden by the driver.

Only print error messages if tx_delay is absent AND tx-internal-delay-ps
is absent as well. Still allow tx_delay to be absent for backward
compatibility.

If one really has a PCB which only adds an RX delay, one unfortunately
still needs to set rx_delay to 0 in Device Tree in addition to setting
the phy-mode to rgmii-txid as a missing rx_delay property will make the
RX delay in the MAC default to 0x10.

If tx-internal-delay-ps is missing, tx_delay_from_ps is guaranteed to be
0 thanks to kzalloc allocation of bsp_priv rk_priv_data struct so
current behavior is left unchanged for existing Device Trees and SoCs
which do not currently support tx-internal-delay-ps (all but RK3588).

If one has a board which adds the TX delay on the PHY side, setting
phy-mode to rgmii-txid/rgmii-id in the Device Tree is technically enough
as tx-internal-delay-ps = <0> or a missing tx-internal-delay-ps will
result in the same behavior.

[1] https://etherealwake.com/2025/03/ethernet-rgmii/rgmii_2_0.pdf
[2] 
https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
[3] 
https://lore.kernel.org/linux-rockchip/20250527131142.1100673-1-jakob.unterwurzacher@cherry.de/
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 29 +++++++++++++++----
  1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c 
b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 700858ff6f7c3..63730a334f0a9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -77,6 +77,7 @@ struct rk_priv_data {
  	struct reset_control *phy_reset;

  	int tx_delay;
+	int tx_delay_from_ps;
  	int rx_delay;

  	struct regmap *grf;
@@ -1670,6 +1671,7 @@ static struct rk_priv_data *rk_gmac_setup(struct 
platform_device *pdev,
  {
  	struct rk_priv_data *bsp_priv;
  	struct device *dev = &pdev->dev;
+	bool of_internal_delay_ps;
  	struct resource *res;
  	int ret;
  	const char *strings = NULL;
@@ -1718,13 +1720,30 @@ static struct rk_priv_data *rk_gmac_setup(struct 
platform_device *pdev,
  			bsp_priv->clock_input = false;
  	}

+	of_internal_delay_ps = false;
+
+	if (device_is_compatible(dev, "rockchip,rk3588-gmac")) {
+		ret = of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &value);
+		if (!ret) {
+			/* Empirical data only available for RK3588 on TX path */
+			bsp_priv->tx_delay_from_ps = value / 31;
+			of_internal_delay_ps = true;
+		}
+	}
+
  	ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
  	if (ret) {
  		bsp_priv->tx_delay = 0x30;
-		dev_err(dev, "Can not read property: tx_delay.");
-		dev_err(dev, "set tx_delay to 0x%x\n",
-			bsp_priv->tx_delay);
+		if (!of_internal_delay_ps) {
+			dev_err(dev, "Can not read property: tx_delay.");
+			dev_err(dev, "set tx_delay to 0x%x\n",
+				bsp_priv->tx_delay);
+		}
  	} else {
+		if (of_internal_delay_ps) {
+			dev_err_probe(dev, -EINVAL, "Only one of tx_delay and 
tx-internal-delay-ps must exist\n");
+			return ERR_PTR(-EINVAL);
+		}
  		dev_info(dev, "TX delay(0x%x).\n", value);
  		bsp_priv->tx_delay = value;
  	}
@@ -1821,7 +1840,7 @@ static int rk_gmac_powerup(struct rk_priv_data 
*bsp_priv)
  		break;
  	case PHY_INTERFACE_MODE_RGMII_ID:
  		dev_info(dev, "init for RGMII_ID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
+		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay_from_ps, 0);
  		break;
  	case PHY_INTERFACE_MODE_RGMII_RXID:
  		dev_info(dev, "init for RGMII_RXID\n");
@@ -1829,7 +1848,7 @@ static int rk_gmac_powerup(struct rk_priv_data 
*bsp_priv)
  		break;
  	case PHY_INTERFACE_MODE_RGMII_TXID:
  		dev_info(dev, "init for RGMII_TXID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, bsp_priv->rx_delay);
+		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay_from_ps, 
bsp_priv->rx_delay);
  		break;
  	case PHY_INTERFACE_MODE_RMII:
  		dev_info(dev, "init for RMII\n");
"""
