Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022103.outbound.protection.outlook.com [40.107.75.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A69215E5DC;
	Thu,  3 Jul 2025 03:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751513381; cv=fail; b=lN61a8q31RdfgABMlQ9H9XDb6kbEJA3dTTupmdXHMe111IuDgX5xfgW2YdFCApkKWuXGlJ/hJ7eIBRocslWD2PLmTiRHNEllrhd1ICMozeHlLeWEshk/4z2scMXwrgH9zOjNS/7dtAE2Usc1zzksm/MurIJVDWFxjc2Dd2gimK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751513381; c=relaxed/simple;
	bh=nCvRzf4t4DESTBptS4xsiUON9wRZeEWJIGoxbSxpdO4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uc6YjGXV6gDLQJkc16dmQIzEZI71PSLriZPlWOScONUvawtppIzknjhQYZtSVODqUs4Eo06b+kGytWYjxj7h3LrJYguEZYeETLb1iqNwx2Q73yPZnAWR9vnUfiuj+Vn1ErehpH1mVpFZX1Y/60FX52ai0ffSG6aAVK5k65PAUqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=e/QdNdqp; arc=fail smtp.client-ip=40.107.75.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="e/QdNdqp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuA1AvxBdB6tabicPxyjiucWZdswJQMMO99M4ebQUOg0glunogm446egyi97/CD3A8ksRF3c9M1aR1NIPW/4B03JnVpidgUYTGQRZ1EplfOYwDvZXX3LlcLTGbDlC5XRluckqhQJ6vtfeQPV8dgmSsJUZBjsdv5GOQMm4zvMKh0v/RrYDQvEKhMm2WfJxAqZAU7Lcb2LHYq11fJjFQlqanjwI+S1sbmsb9OjHX8emS0xyEthDGNhYtYgdiIMn7/6xbqfbSurIV9RtIoI4jjSfRGmDXmj4NtMWcooM9GLZrW5nKTd1vywWcrwd4+A2je3G/bg/0R3mom+EJYaZ7EYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNnkFjlCYi6ECHYtZG8W8MPOefAcYvNJwagELw4NMBc=;
 b=a2TUK52vahr+Gq/HDbnxdTparcRynUk/kDg6ovk5aMIGcbNZffV9Guj2BsgXLEkmzarWJldt1rVamAeerGpqe06ywTFUA6QOWa1rVKJW0NPieA6HX3/GkSWXuDd9t10lmEz27vciuAih64/fX8Cjrm/VD+JrtlxpJhF4EPxo6IJNGa4iLkn0ciDRdUv5hgj9uLhq8Qh/QqAbshDcalWNArAfsNJrrRGddESF4eQvD2I4eZaJ05I3gcJUoe8C67xoD/vVg1gXwCUImXiUHb9hR7qBBWJrzkt0D7L6nJRK6UTjpgEGgEdZPp3+uxgIeS3Fl9a4Mz4/FcGmbzip4FuFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNnkFjlCYi6ECHYtZG8W8MPOefAcYvNJwagELw4NMBc=;
 b=e/QdNdqpdyyLkrgrNYRkZk442s8raLOGv+mk1yEjpuZI8O4V8uESZZ8cXDQt/1B3qI3I2EgBhG3kkNXpeXnkqiEjUrmPD/D3E8RM4Q0Wg6biaRLVed59nAjKLJsJ0KJMxKcOa4kQOrRyHFpl9if4VNF9qxiMhQD6kbSf/Hz1WjJRH8APMg4WIsj8FfJbFLYRzgODWkvP7MJvFfGn6XXfAarGUCP7NIl9eiiylz18cjz6pfFSOtgeEuXTqw74LowsG5mVUyOmPv1BnS+Zmk0D6EnUDe8+zgCwYF+byPL264acUh1f1dmk66ZVUB9Yg4IbqqFUrX6exfqmVPMgOydAPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB8533.apcprd03.prod.outlook.com (2603:1096:405:6e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Thu, 3 Jul
 2025 03:29:36 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 03:29:36 +0000
Message-ID: <68134d81-e15d-41e9-933d-95190af9b989@amlogic.com>
Date: Thu, 3 Jul 2025 11:29:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/26] clk: amlogic: add probe helper for mmio based
 controllers
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-16-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-16-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: 474d4cc7-242f-4de7-bf4b-08ddb9e1d5da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTQ5YjBQYzVxZTd3M3E3elkzem9NS3VDdS9URk0wRVVaMUJBMU01dklPd1FM?=
 =?utf-8?B?elh2WlRlVTZFaW9aTWlMT0ZBaUNmWW9LbzMzNXdrK3U3REJha2o1WUNVcW9n?=
 =?utf-8?B?L1BVLzZVSElMckJNc1lSOHFNNkszWng4V05YMlBJbytCOU1sK0h2N2w2bG5s?=
 =?utf-8?B?RXZVSS9CalkybUtnVm1hTENtSkpRZ1RIS1hoMm9UcjdKMnVnNmlGTWZtcndN?=
 =?utf-8?B?dUNSNmNvTXlkMi9YRnFHd0t3WjlGZ2VyS1V2Z3ZQWE5WTDBlelVCM3BOSTJw?=
 =?utf-8?B?TEZ1RDlJL3l5TFA3cFV5dkJzdEdBWk1zYmpJdUo1YjR6Ky9CNmlvMEsvMkIx?=
 =?utf-8?B?M1lQUnh0ODR3b3dGNG4zNk13UGtpRnFhbHgyY3hKRldxSXdZZGcvM043NTV5?=
 =?utf-8?B?TFhXMVlERmhmUUZ4L1o4ay9pR1VGa2J3RFY3VXFyeld6T1p2Y1A0dHRaTFpk?=
 =?utf-8?B?cjZCNDlyUmI3SWJYeGs4SDZrbU5BNGdCa3dGOXB5ZHBla1puN2NRZitOS05K?=
 =?utf-8?B?OHdzcGNCQzlMWDhjZXZsSFdyVXJIZDNkZUMzelBzVzZ4VmVqY0llV3A4WC9I?=
 =?utf-8?B?Tm4vUGRYMFdObEtyZG90WEpkV2FvQWgyYVdKRWNsTEFmQ1F1a0N0MUh3dE1r?=
 =?utf-8?B?S2xPL0hWNDRMS1J6T0U1RWNSbjJlWmdJSVJoRElXM20rNzlwaUsvTktpYjlh?=
 =?utf-8?B?SXJNMVRHaEhNVnhCTlU2RXUzUFk2QWhKRnRDVWFabGV0a0VHaFd5QmUvalZx?=
 =?utf-8?B?OWRwS2d3dmFoT2lES3E2em84VlloZ1puL0F1b2JSc1NGQjR2U2tTSlZzK05k?=
 =?utf-8?B?c0ZqS01jRG40YXJ1VWRWZ0FrRDUwbWUyRFcwM1BaSVU4UjV3dGl6RGdaSGlP?=
 =?utf-8?B?ZHk0ZDhKVk9XNzRYS3pCVzgwdEk0UjBwMjY0YlRBZXNXTXY0L1AvSktwZVBa?=
 =?utf-8?B?OVRBVFRWRGJ6eU5mUDk4cGtoak5LQTVoaDVmZVB6M0gyZkpqY3AzaWRudEw2?=
 =?utf-8?B?NXVZN2k4aGRaQjhzcGtTc0JVaDVIanZpbFF3R0RMeUVmNmkybjRTQVFFVzlF?=
 =?utf-8?B?cnpsVm9IVnpHMmlmMG9XUlVBZk8ycmU2N3FlRk5BQ1d4OVZzTkJZQWJtM3lE?=
 =?utf-8?B?MFU2RUhteHJRaGNsUGFyTWVocEdPUGdZYlB0QlRESzJCbjRoRDM2NFl4YXNO?=
 =?utf-8?B?VUtXVW5kN0J4OVNkVUNFTnNhREl2SCtTdjd6MFZjN1JMOFJNQWw0YmkvdVFI?=
 =?utf-8?B?UXgvS1Q1ZlZYUVJOZWxCeTFHZVJZeG5oaEFUc0RqMFoyVndzTXo5VWZZaVow?=
 =?utf-8?B?cW05Z0RwbE1QQ0NkZUx6YWIwMTAvYTJYNGpjQ2pTaDlRMEZCL0pKZHFLVlRQ?=
 =?utf-8?B?dG14NEw0S1hyRnVhdkNnc0VzMmxGdUVVLzEwTXJRMlhGaHplZU9SSzRzWlVt?=
 =?utf-8?B?dHNGZnVnSS9HSUZ3YlZZaUxta2VQWVZoZWNGUFd0ZngzYng0bjFHeGQwMVZy?=
 =?utf-8?B?ZHd1REJDbUtmM29LdkdUNjA1Tkx6QmhIcGtFbDFBZ2pTSm5UcnRYeURzZTJ2?=
 =?utf-8?B?YUpEWFFRcGwrc1hrcFNCZUdJYm45eDdGN2prQ2ZwcHJkR1dqWk9NRnZyd0VP?=
 =?utf-8?B?ZlBjQUtOTFNDU2h3V1lvOXp0a0hkVkM1RTdoZ3hldGRVWm04bjR3STRFWi9o?=
 =?utf-8?B?aGxRNFV4VFIvZWZVMkw5NjlSdzU0S0xKa21QeVk4bEpwRHQ3TndpVnMxWW11?=
 =?utf-8?B?NmdWeFN2QWdmMForUTlTUXNkR3NvVVg0TlpSZmY1VEI2STVLRFczbU9CNW9y?=
 =?utf-8?B?dERTK1lCQmN4Um1sYnQ3eFBDeXFvVjVCaGR1R3UvNXNsaWZrMDM4ZjBBeVhB?=
 =?utf-8?B?TW14TzZ4TXZOZExrb0VPWklPQlhZN2pldUwrczNQdVkxbzJxSWZrZGNTU3J6?=
 =?utf-8?Q?dig1m7nnVLY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHU4NExoY2orT1FSeG1NVm83QVdGazNOaE4yM0NNR1ZKUlRwc3pRYkFvT1U1?=
 =?utf-8?B?QjFnWUZ5UDVIeldJbEt0alAvbnIzUk0wK01RU01PNG9xWmI4ZllMOFNPQ096?=
 =?utf-8?B?OFFwRnNrUHN3K2NyajVQNXUwYW5lM211RmVXbzg1VXdaVG5vNDFrNHViYUth?=
 =?utf-8?B?RHNjMHo1YWMvWUVCeGUzc0xWekJwLy9iVnRnUEJJbUV3Zk9DdW5XanNIYm9z?=
 =?utf-8?B?bUhtSzhKNGI5NFNzK0Z3MkxMMmZSam01d2poeFRWMnVBQ2h0VmtGQmNaWldz?=
 =?utf-8?B?SisxdWdiRjRtQUUwY2I3TzhhVHZ2L2J6UjJGaE9BajduY0RDVW54UzVFYkJ5?=
 =?utf-8?B?UDZxc011TlBCSjkzdFhLTjloRWJkc1lLOXFjQStiYzVXKzVpMDRmUmxQQU1U?=
 =?utf-8?B?bVRpRUY3aklaODc4NTFFUGUyYjRvSHFKOWtqSFl1QkIxdlBtRjQybXY4Wndn?=
 =?utf-8?B?YWt0S295a2w3VWh5c3FnUVVCdDFsQmZTNFF5UjlTSmgwMHdEMStIR0xWL2hh?=
 =?utf-8?B?RXVNMFFuWER1R242QnJ0VmJjS2xBZ2ZuUUQvdXBrR2FVUy9VWFdEWkxiZzZE?=
 =?utf-8?B?SzUrcXp5cVE3K2hMc2VWb3NTdEdsZnlTdWdkRktoTzc5czZWVjFZOXZIayti?=
 =?utf-8?B?UnhjUjE2TTI4ZUQ4bW5BVkZ2elJ4T3paMVI4UVN0UERId0x4MGlLd3A2WnZy?=
 =?utf-8?B?RnpKcFFTLytUdlo0UUw4c2JlYVdtQnNnZWVrZWJsbzN3QmNDTlJGU0ZsNFZ1?=
 =?utf-8?B?TzZ4R1c1Sm9yTkd3SzkvKy9iQzVxT0M5ek8vVUpPTHgxRzNKaE5JOFltYTVj?=
 =?utf-8?B?WERqR2d0Q1NqMUoxNTZ3QVFhQUIrYmZCRVo2L2FZRHpaRXZ6Y0hkZ20wTUNT?=
 =?utf-8?B?Zm1NQWlaeHhyb2cxV2RLS2xFekNVSDRlWVRjVE5XVVhRU2Nwa241SU4rcGpr?=
 =?utf-8?B?eU45S0tjMlRLN2Q1V2pjWHBUbXJrMWtEQzErcUpybTE1LzczYnhhRko1K2dK?=
 =?utf-8?B?MTlVM24yRHNSa0NBNDZOdGtIU2ZTZTFvSXFpaEowdW1HRmJIVjhsTFQwZVIr?=
 =?utf-8?B?d0VtU3c3ZWlDTHA4YUo2MFVCc1JXQlVOV0xkdFNSWHNJYUpoS3lMa3pLUVJC?=
 =?utf-8?B?Rm9sVkVVbDNNZWJVSXJpbEUxdnM1dk50dTA0WDFCc211bzBUQmNMemJPK2Yy?=
 =?utf-8?B?M0ozME5UaUhGRnFUYXlsVXk2bGFVTU1JQUVWS091Umx1NEFZU2svNk5QOXFk?=
 =?utf-8?B?V0VwQU4yRUk3OFlDT280Ym1PQWhrT1N6eVJmdE9vd0paVmdxQ2Znd3RqZ0Ex?=
 =?utf-8?B?ZVNHK2V0dzVIMEZ1ZSs4Y3BBVWdXci9sME5IeTRmNUlCWGgra1JMU2FIOXV2?=
 =?utf-8?B?cGZsa3ArbkRNaGE4bWN0eHFrRGNPbTBaOUNORm1EZHArbkpVUWdpUWFFL2c5?=
 =?utf-8?B?aHlPcDhXSkl2d3UxUHQ0OThkSmZiQThkY3ZvTGVIa1kzRVZKb1pJMlQ5VFYw?=
 =?utf-8?B?SVBFdkwrRi8rL0JETW9pYWxBbEloTzJQRHlmeStJN3h4a3IxTTdXVk1Rdlo0?=
 =?utf-8?B?S3FYOEloYlhnb3ZrckpXY1hLY01OVnpkSzE3cWViUTBhYmpyMFpxdGZ1Y0FV?=
 =?utf-8?B?RHp1K2lDY3JRdDlLS3hvQmVKVlVObmZoaE0yTzN4YTAwWjBXZHJQZmx3dVdF?=
 =?utf-8?B?RXZJZmtKN1RDcXY5L0ZFYzBHNjQ2TFZrQUxnbjJKTkRkdDM3TzNSMHV4UnJM?=
 =?utf-8?B?S3hqTCt3WlB6MHFDb2d6eW80dDl4czM2NEp1T2ZYTU16bFV3VXVCWHcvV1Yy?=
 =?utf-8?B?ODZNcXZJOXVyWDVnZ0tBczBnSlEzdS9iVzVCNmM4ZUtTRFVhcXluNWZOWnVB?=
 =?utf-8?B?Q1FDZkwvVTZlY09PRFJXR3dMdk9ZbmViekJ3eVZscFNORUhzcXNHVDc0OSt4?=
 =?utf-8?B?T3JyUm5DZ2Q0cm1zd01KK0VwbGhnOU1vMzJiT0JBNWduK0cveWp2TUZMK0ov?=
 =?utf-8?B?Nm5rNW1WS3VYWDI3TnB6ZEtkQUcrRUtUSG4ybTlTdk9rclZpcGsrbmxtMHdN?=
 =?utf-8?B?bEV5VkZSS2RQTUY1eWNzcjBYN3pFeEdMWE9PZmRGVndiNC85azZzTUtUS0xw?=
 =?utf-8?Q?eMEes5OYGJCDXBS8ga4XlKXxf?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474d4cc7-242f-4de7-bf4b-08ddb9e1d5da
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:29:36.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7J66GAAEOT85QVt0+2nwSOHxrw7P3K4uNs8iNw5890FYKDyl9kjQOcCDiCTOKQHcYD29nSql1FE5N2+l1OBuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8533

Hi Jerome:


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Add a 2nd probe function helper for mmio based controllers, which
> are getting the memory region from a resource instead of a syscon.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/meson-clkc-utils.c | 65 ++++++++++++++++++++++++++++--------
>   drivers/clk/meson/meson-clkc-utils.h |  1 +
>   2 files changed, 53 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
> index 49f562d0f203b9a7d15b5119100216564c10cb21..272b2dd8c95e73e6c021cbf8852dd64733fa00e0 100644
> --- a/drivers/clk/meson/meson-clkc-utils.c
> +++ b/drivers/clk/meson/meson-clkc-utils.c
> @@ -26,12 +26,9 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
>   }
>   EXPORT_SYMBOL_NS_GPL(meson_clk_hw_get, "CLK_MESON");
>
> -int meson_clkc_syscon_probe(struct platform_device *pdev)
> +static int meson_clkc_init(struct device *dev, struct regmap *map)
>   {
>          const struct meson_clkc_data *data;
> -       struct device *dev = &pdev->dev;
> -       struct device_node *np;
> -       struct regmap *map;
>          struct clk_hw *hw;
>          int ret, i;
>
> @@ -39,15 +36,6 @@ int meson_clkc_syscon_probe(struct platform_device *pdev)
>          if (!data)
>                  return -EINVAL;
>
> -       np = of_get_parent(dev->of_node);
> -       map = syscon_node_to_regmap(np);
> -       of_node_put(np);
> -       if (IS_ERR(map)) {
> -               dev_err(dev,
> -                       "failed to get parent syscon regmap\n");
> -               return PTR_ERR(map);
> -       }
> -
>          if (data->init_count)
>                  regmap_multi_reg_write(map, data->init_regs, data->init_count);
>
> @@ -68,8 +56,59 @@ int meson_clkc_syscon_probe(struct platform_device *pdev)
>
>          return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
>   }
> +
> +int meson_clkc_syscon_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *np;
> +       struct regmap *map;
> +
> +       np = of_get_parent(dev->of_node);
> +       map = syscon_node_to_regmap(np);
> +       of_node_put(np);
> +       if (IS_ERR(map)) {
> +               dev_err(dev, "failed to get parent syscon regmap\n");
> +               return PTR_ERR(map);
> +       }
> +
> +       return meson_clkc_init(dev, map);
> +}
>   EXPORT_SYMBOL_NS_GPL(meson_clkc_syscon_probe, "CLK_MESON");
>
> +static const struct regmap_config base_clkc_regmap_cfg = {
> +       .reg_bits       = 32,
> +       .val_bits       = 32,
> +       .reg_stride     = 4,
> +};
> +


Since 'base_clkc_regmap_cfg' is only referenced within 
'meson_clkc_mmio_probe()',
we should move it as a local variable inside the function. This would be 
more
logical and may optimize code size (During compiler optimization, only 
critical
data needs to be preserved rather than the entire structure?)


> +int meson_clkc_mmio_probe(struct platform_device *pdev)
> +{
> +       const struct meson_clkc_data *data;
> +       struct device *dev = &pdev->dev;
> +       struct regmap_config regmap_cfg;
> +       struct resource *res;
> +       void __iomem *base;
> +       struct regmap *map;
> +
> +       data = of_device_get_match_data(dev);
> +       if (!data)
> +               return -EINVAL;
> +
> +       base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       memcpy(&regmap_cfg, &base_clkc_regmap_cfg, sizeof(regmap_cfg));
> +       regmap_cfg.max_register = resource_size(res) - 4;
> +
> +       map = devm_regmap_init_mmio(dev, base, &regmap_cfg);
> +       if (IS_ERR(map))
> +               return PTR_ERR(map);
> +
> +       return meson_clkc_init(dev, map);
> +}
> +EXPORT_SYMBOL_NS_GPL(meson_clkc_mmio_probe, "CLK_MESON");
> +
>   MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
>   MODULE_LICENSE("GPL");
>   MODULE_IMPORT_NS("CLK_MESON");
> diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
> index 26cd47544302b28ca1a342e178956559a84b152a..b45f85f630d7190fb6509b088f05f17ca91fa1c8 100644
> --- a/drivers/clk/meson/meson-clkc-utils.h
> +++ b/drivers/clk/meson/meson-clkc-utils.h
> @@ -25,5 +25,6 @@ struct meson_clkc_data {
>   };
>
>   int meson_clkc_syscon_probe(struct platform_device *pdev);
> +int meson_clkc_mmio_probe(struct platform_device *pdev);
>
>   #endif
>
> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
