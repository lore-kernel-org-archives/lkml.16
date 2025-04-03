Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03258224B0B;
	Thu,  3 Apr 2025 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690638; cv=fail; b=dwEE38BvYS9TkX2h8yuwU3A7WrugfOmaJWxk2DbNxfzo83kUWINJ4C4vqq06FVKwwlXVg/8FtGkkApcFHtDo8h2zTUtzEisnIeT+LALVUlnpHHIodoPxDbvrUF/8vPUd3aRu2vVQ8osCufF57sjXH/rh8mb9DZWSAil86zbLhSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690638; c=relaxed/simple;
	bh=2kVvDlETJisGILmlqKDRlCnuT+Auvy7LUsEbzQqxYrg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tB0umqOF4+HNB5yAsLowbp+NlCGCQfLsL3kyuV0XqJ1fLESdBVaGb19yUXG/faFmo1iGYCA0yKMh0TpKWcJRDfaG1s+5DSoGD9OT3vzFbiP2bb23gQ3en2OtZnS0eBHhEyP/cAk9PfDFXk7fSKLLN0aqIFY5sptfbjn+5rEwEi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t+xF7oNC; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t+xF7oNC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1FJdmg7P43+x1PFUWvYR5YRZ1Wb8tkQYUMFtb0krlcpZEDgaYMqe7HowLr0MTV8xndgo0WhsMNPv17QtpTz6NSIv18CBoCckmNzwn8GcgDLriFZpFE4GQ3bgVkfbTD7IsezatrW4IUNHDv0fWZADKJSGCIqEuZ9unpdi0A13Q3LLco1A+3GThhKJ+U5ThIO/tQNnxsLtcaBsq+B4HiJOb7qK7G4R8Qow/YIYnY20bhCY7kuOYdvRT49Sey+8I6ley+yhFI5uP0oN9ASwKPzUcJYOudPyYN1RjGfKSrCrB0QG9f9bI5GgyZ4vq+Y66GQqMR1KMHaFebTMfszkhVTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1cfiwCgs++zED9GoJiLnZH1ljulhetpoiYO/eM+pbY=;
 b=KFu6DU52yMxGlfLFFRaRLEZHubdF65XAxLnOAi4Wi62vh4x0Jay2EW1BaHk6DNiyfGekRzx6ZAl9tLb+sQPFyZOytClPpqInDoA9Jo1jZsSYa82raADaDV7SFZoJdBsox0/sUYgprVhvKutdPgllERdidaIQb8GKlBXrzFgHZv7PHeezoaOAjFMrJUGYQ7xGJgfMkqv7v1kIvvAy9X8GhKh9Mqt26DzI9dcYMnKOALhB+EZmYrqm34CbfVnywfXRq+RINYN315koOsYoHRVrtvjUJPuR7btQDxD7aRx5eAGYQo/gdCZmF0zdImv2zR+rAttlAC0NglKjxmKSONBM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1cfiwCgs++zED9GoJiLnZH1ljulhetpoiYO/eM+pbY=;
 b=t+xF7oNCKh4CKasgh2ItmAkP0/oNICnbBWIKdHvjSQ5A5eEXDBH8st51jz+e35s6ZTBWasvrynXoQ1ALe+25NJaUusBfL4FbZ/rtgHFqSFsuaBWlYQ2DU+keRtmUJt8aefdeNbOiqMIJvObKM6S+p1JWC/UP4bkzkApjakmE9znHQkGRUunruG78CLpFESR1kJ2bPjymiedIud1cPea4HEsZQ0R6p84ykJ2LmxekL3oWjTJigVXcLywYx1ZkXhvDONpdkaQNjF2seXWW1OL9aSPXnbKTF/SBkkyKfxEwo1aMQXHXWNO4eOJmoZsXg1sBMfmNFgitDb/wPvO0LvXgow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 14:30:29 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 14:30:29 +0000
Message-ID: <4efff19d-b5e6-49b5-9a15-e4af622c6ebf@oss.nxp.com>
Date: Thu, 3 Apr 2025 17:29:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ina2xx) make regulator 'vs' support optional
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Florin Buica <florin.buica@nxp.com>
References: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
 <dab2f459-240f-4e4c-9bf6-8c0285354cfb@roeck-us.net>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <dab2f459-240f-4e4c-9bf6-8c0285354cfb@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: cfcfd59a-f91b-4cc3-1b85-08dd72bc150e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEdtVDc4WmhDN3dJM2NGYUJtMkRVbERxa3JxY0xPR2I3SXpWVnQ2NlNncFE5?=
 =?utf-8?B?eVViUDR3cDZUcXp1dENxL3pYc0N6RDBIVUJKOXozSU9ibU9DSTFWRzJrSE1v?=
 =?utf-8?B?Kzlhbzk4STEzMFJXUU5rSyt4eEVOZlY2cE1IR3BFWEZUclNKR2NpeU50T245?=
 =?utf-8?B?V1JwUm1PbWZGaGxZT2RkeFlmdGFBK2hVaStZN0xQTGo4NndPL2lPUitMNW9j?=
 =?utf-8?B?QXRuNVdHQkxuY0t3cWpDNUtvYTQvNWtmekp1M28vYnI1L0dlQWh2NExSbmhV?=
 =?utf-8?B?Qkk0Ymc3TDZCTkhUUGd4T3VXRmRTZERsd0xOdHNSTHI3emZlbU42bThNSkxt?=
 =?utf-8?B?MklUbEI5T216T3dSazB1dCsvcG9ycDJYdnpKU29hYnF2YnZVaEUrTHRhV1BZ?=
 =?utf-8?B?ZHdwZExCMzdZdlIya2ZEUlRESXNYaFNBbmNCVklNY09hbHN5amhDYndaSXlk?=
 =?utf-8?B?czlNTk15a2ZOZmc2cEd4MVhEQnprWmJKQjBBdnNLdkUvVDJVaHd0VU1ob1hy?=
 =?utf-8?B?R1Jzd0R0UHYvT3lRQ2FCd09QTXB4MjJRMlhlWFJTZUFBbHRvKzMwMFkvbFRk?=
 =?utf-8?B?MEsxYXpHbGc5N0lpUllQZkw2Qi9lcFRwT1dTK3h2aS94bVBCQjNKM3NnZ1lF?=
 =?utf-8?B?eHFUZjhaWnlWNFFJMndtTm5GTzJwMEtOWDE1NXZLdEpuNmNvV004S2JNbGFr?=
 =?utf-8?B?dFRvdmJzOWJseEFabHJqZ2hiRFNYaFU4Qlh2SDBTRGIxdmZnSWhzRHJwMGJr?=
 =?utf-8?B?bzNNUGx2eDd5dTJremM0UWwzdjF6RE1ycXVCNWY4TDhCTXFKaG93V3pjeExh?=
 =?utf-8?B?MDRWWDNGaDRoR3lnM3hYNDREOUNBNmg0TEtOOU1NdjVVMjl0eVF5aytGR1FW?=
 =?utf-8?B?MFRhaENjdE1OT3FCaERodjFFdjN2d1dLYWhxSGJqWm5pUzhoMnpZZmt4d21G?=
 =?utf-8?B?Wm5SNHJkeG1Ic0tZczAxTmI0Y1FNT1Jha3NLRllyMU14T0xUYzBlamtOai9T?=
 =?utf-8?B?YWhEYXBtV3Q0YnQwM2RNNFNXTmZSOGJxNytUZlAvM1MrL3M0bXBlREU0Mnpr?=
 =?utf-8?B?L2dSVnE3KysvVDJMdkwzOFYxSWNLeDB3SGt6R0hTalg0aGgweEU0ZytXQmtt?=
 =?utf-8?B?Zm5LcDk2bGNaQ2RDTFlkd0NCVFpXRUI0WXExc1A3WjBjeWRzUmRUR1hpLy8w?=
 =?utf-8?B?T00xVjR2Z0tZWXE0WHNCZ0FsZlZHdHNWZzBkTmJCUEViVWdPa25CcjFxQ3pO?=
 =?utf-8?B?VmozRWc3QlpxVjFzTEVTME0xV2pIREtMNHRBN2hOeGNydnpwb2l4VllVMVZR?=
 =?utf-8?B?R3BsOCtvdXA3VGhuOGthNlcwSytZeFpJMkx3VUpVYlFJN29DMjhSM2t2d1dK?=
 =?utf-8?B?OEVBeUUvN3UxR0p3N0tNMFEwbEM3V0VBeGhmaXRVY05IdXZHSERWdG1SbWQx?=
 =?utf-8?B?eTljNitic2ErckkwOXROVVM4Y1M3Y3hXUWRkUy9YRk5IRmtoY0NzSFJaUTFC?=
 =?utf-8?B?aW5GNkZSZWFlT1Uvc3Fwd1k0a09BVkppaHQ3K3U1b2VSK2VPcWp0Z25tNVYx?=
 =?utf-8?B?TDdnZ29pVlEvZzE4K3pZRlYwNCs2MjIyVHNiZVNzL3ovQzNzSnY5YksxWHBE?=
 =?utf-8?B?RjkyNldTcHF4cmdMMUd5aGRndktjRTBFNjgyb0MwcUwxQmpnUUxJTGM0Q1Nj?=
 =?utf-8?B?aS9JaFVFaER0dFBmTUZuVWZJYjdlVzZiWDk0TmlBTysyckRuc2dUMnl1K1B6?=
 =?utf-8?B?Zkx4M1d6YVhMdndvam44NXNWc0pycm9OQ0FxRWF1bEZ6UXlWOStNNlh6bnNH?=
 =?utf-8?B?am5wUS9yNDJEdG45UjhNdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rkd0cnJSSVYwazB5emtpa3hpQjF6OERBTXE5anpzbE1BVDJia3dWMnM4SW0z?=
 =?utf-8?B?SHJicVgvOWFZaHBNcXUyYzZKUHFuSjFDUXBYZTdhTldTaG5HUU1zTGoxNFdL?=
 =?utf-8?B?bERDTWJiUWRpQWhyeVBuQ2RZYTJld1BuWmtVTWxMQmdSMWRwWmxzM0E5S3Q4?=
 =?utf-8?B?d0FqY1ovNHhhZXkyTXNmNVNZa3dNaytINlFVMCt1M2E3VlYwWWhBNHpWaEZH?=
 =?utf-8?B?VEo1OTRNSWxWdlBRa2U0YVBGMEIramovaHdiVTZCV3grYjlGSGl1aXM0V2dw?=
 =?utf-8?B?d1R6NG84bmV5cElaWHd3MjIrNlNFYnNmTmdDbXcwaGhPeVQ4VlRZRDRRdG1F?=
 =?utf-8?B?YjBPNXcwMzlxRG9INVhRVm5ldFBLTW1vSVJmY096a1NSM0E4cFdycXB2emw1?=
 =?utf-8?B?NHdhZXZySlFZa2ZVdWZWZk1kWFA2eHR6ZmZTTVp1WW5pZDd2VGVMUUZwU0Vk?=
 =?utf-8?B?TXNxc1hjK0JJQzI5Q0xNZmpqQjBMSDI5UmJqQmt2Y2NTQjBnSXQ2TldlMEdR?=
 =?utf-8?B?clZwNEN3dk05VndpejE2Vzc2Y0kwenpsVVk3eG4yaDN3NENVL0ZaMG1MQVYv?=
 =?utf-8?B?T3pxcDQ5S3QyR3gyaGRUWGhjcU1mMzRXV0pjQnptYXdjemJTdkVDRmlZK0ln?=
 =?utf-8?B?QnhWU3RlWnJuU21BYzg0M0hIUVhkSW9ZK2dpVVdyYWRBcHlNZDN0aytsMUNK?=
 =?utf-8?B?ZTdVU1JVV3VjUW1od1pmK1dWUy9TeWdpOWJyUmpoNkNtSUoxWE9KNktBVHNH?=
 =?utf-8?B?QVpKWVl0Vkl1UXgyOEhsMXlqb2R2K1BJMDdpY3JobDl4bk00aGNLLzUxaUZ2?=
 =?utf-8?B?Y09rU216ZHJjeFkzdzkvQ0FHOFF5Vnl6RExEZ2ZVYkg2UzBkb29Sd2dmYTJk?=
 =?utf-8?B?VC9zaCtvS0p5MnlaU1ZHTXAzY2NpOUZobW9VT3YvUW5MN3BWcGE3VFUrQkEz?=
 =?utf-8?B?S1A1NHkvTmtkN2syc1hrRVp5UkJuRElKc1FqejErVkVhMkNUWjhkcGd2NjhL?=
 =?utf-8?B?VGdtZUdEY3R1d1NHVVB2S2JRWjNxanhFNmRMM3pLS0lyUnM5NTZxWE44a1lE?=
 =?utf-8?B?OWhpbk9PUVVobVA3ejVTYlJ4cTgreVBaeXJjRmlaSjM0YUc0Q0RhRm9MZ3dC?=
 =?utf-8?B?MnZlakxBbWc0QXlMdEVpSndSVHBGY2NwN2tlNW0zdDFZcE13S1NReStiNWda?=
 =?utf-8?B?WnoyT3RZdC9VYzNxZ1NUM1ByNEVGM3cxYVFqVnhLNVhYOW1vdk15WWd1Z2wv?=
 =?utf-8?B?Rkc2R3NURXY5MHZGNmV5WllFRk5hMjJmQXpaTUdlbmZrNm1HZnRVYW5LbGVy?=
 =?utf-8?B?WEUvRVN3dHV4ajRyWi9SbC94L1VMTXVuTThwa0JDZzFUZjhkTGNlaDEvQlZV?=
 =?utf-8?B?WEt4aE5vS2p3VGs4NlBNdEVsaHdGYVBPbmhFNjkvTTVIcXBaZHFXRk5RUGJE?=
 =?utf-8?B?MkxQQi83S0Vodm1VemxWM2hsWmViRytxOGRSMElIMDlEYnkvZ0x1WmFCTGpH?=
 =?utf-8?B?ODlJRlZQazl6SGx3MXpYb083bVVhRVpIaE9jUUM0MXI0cE1pcWxyNTVjQU5F?=
 =?utf-8?B?SFEyR2Rjd1VBZWhEeGRURDFZQjYraHU4MG5WVUQwWGZjdkhNQWEwLy9PaGFN?=
 =?utf-8?B?V0VoUnY5ZW83c1ZEd3pjNzYrK2p0ZVZqZ04xczRXeDRyWEZncnZKdnRzZ3BH?=
 =?utf-8?B?YzZVUmZLWGJIM0RBdmdUWUlmUmhyNk5WTy9qREtJaUpJZU42bnZKSExUdklm?=
 =?utf-8?B?TFZHNTNiZzAxZUIyL0FkWHdsdVl3bU1UZGwwQ0pZV2hkT0hCVkNuKzlUYXZ3?=
 =?utf-8?B?NWZjZTZGYTR5NnNFTGhKbjJkcWt2bW0zNFNHeWZoQkhJRXRYbDJVZzhMWGFR?=
 =?utf-8?B?aHRKbjFWMTNQVkJJVWU2bW5uUjlMMVN5a3l3TmF5UHV1cGlyK1NHeW1LV21q?=
 =?utf-8?B?ZGlSOXZRb002REhmbXlRQm90NnJVWXdZaHMrRW5lNnlKa0xLNXI3TjFDYkty?=
 =?utf-8?B?QzE0T3RpRHk5ODBZTDFySWtTUWZJQko1UTNwN3J5QWI3eDVKZlB4OE5aVGNX?=
 =?utf-8?B?Q3dJS1RuZGs1eXZTTHpFUlllR21ab2xwRHF1ZlpnUGlzY2ppSXBHUUw5M3pB?=
 =?utf-8?B?M3ZPWmNsKzVaNk1GdGZNdFUzbWVQNFVEM1JHQWtHaUwyVlZRUThaaW9saGNQ?=
 =?utf-8?Q?6jJCA8EjZzLtPGGC5mxQ3hU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfcfd59a-f91b-4cc3-1b85-08dd72bc150e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 14:30:29.5027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BgZLm+N0kkCLUFTEsSAqXFkbNO7SiyMfCwkON97RaMLRZVCJVOIuvkhvlEgJF4ZDWqGto4uPMapQ48Y0/wLYHAFkJVtFspAIFIpkfxNco0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

On 4/3/2025 3:15 PM, Guenter Roeck wrote:
> On 4/3/25 03:15, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> S32G2/S32G3 based boards which integrate the ina231 sensor do not have a
>> dedicated voltage regulator.
>>
>> Co-developed-by: Florin Buica <florin.buica@nxp.com>
>> Signed-off-by: Florin Buica <florin.buica@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   drivers/hwmon/ina2xx.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
>> index 345fe7db9de9..ab4972f94a8c 100644
>> --- a/drivers/hwmon/ina2xx.c
>> +++ b/drivers/hwmon/ina2xx.c
>> @@ -959,8 +959,8 @@ static int ina2xx_probe(struct i2c_client *client)
>>           return PTR_ERR(data->regmap);
>>       }
>> -    ret = (dev, "vs");
>> -    if (ret)
>> +    ret = devm_regulator_get_enable_optional(dev, "vs");
> 
> devm_regulator_get_enable() should provide a dummy regulator if there is
> no explicit regulator. Why does this not work ?
> 
>> +    if (ret < 0 && ret != -ENODEV)
> 
> Why this added check ?
> 
> I know it used to be necessary if regulator support is disabled,
> but that is no longer the case.
> 
> Guenter
> 

Hello Guenter,

I've just tested and devm_regulator_get_enable() does work as you've 
described, providing a dummy regulator.

But, according to the 'ti,ina2xx' binding [1] I see that the `vs-supply` 
property is not required. Hence wouldn't it be correct for `vs-supply` 
to be optional ? Using 'devm_regulator_get_enable_optional()'


[1] 
https://elixir.bootlin.com/linux/v6.13.7/source/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml#L78-L80

Regards,
Ciprian

>>           return dev_err_probe(dev, ret, "failed to enable vs 
>> regulator\n");
>>       ret = ina2xx_init(dev, data);
> 

