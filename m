Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2137.outbound.protection.outlook.com [40.107.236.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4448825C838
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750977567; cv=fail; b=OAiOHt1Tg3n20uZacQe7UZJsoj2gIc+6dJv6usY1x2D7glZ5MJRYDM71gttTvVAHxEWUPL36rTHXsgzNa4V41BFTthcIjl3FGAOjRikLqhuJPXwcQ3vkkkIxfn3TtGVAuLkOOyZrfYOiVcCMeRxPi+gdNfY4q3mG94LFQB2jQEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750977567; c=relaxed/simple;
	bh=pqt/p6z1PyP5+sJM1ZKSIDdX+dvDz1FB0bIcf6iM6XQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KoZgHPKZb6qg+8AQrr/RMXmxc0bWwoqFEy2ZrmfhpC12lhGwoUbbQ7WwZm9V7tKqniCBGLYNzCAD9hY+qYnlwT53nhtCbPNIg8sG+/xl9zTEBS0O00/3QSCh/QA6m6w3b9yi2Ny1WF92AqlOcCGGVxtKYeD5f6PXtWLCvKcLxkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=oyu3jVL6; arc=fail smtp.client-ip=40.107.236.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="oyu3jVL6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKUU7CHA8xvBYeewGjdUNeFkMQZq5fuKC1RkHz4/LSwez+0uJlkFLrPO624IdAEXM3WYUNLwz6ne7hceYdAuEcRBAosQOakQZpZa+jOykB8yDkBaUi6IOo9HWtQB/c+ELVNrXidgmY+YPJYDvPuuca/xU7p+fzGCOEH76EKyCnx+gQcBD7ok3BiEXREe/Z+OQ/Rujp4NMQLM4yedQHawrSFvDnQz9O1VX/w+YezW7PEFbeHg21ALduJfTTVZz8qKomFHA6NaTkldwM/L/sHkJC3NWLGuRZ0Eo+HPVZJLXVO5iYDTuGrWJkmP8CmNYE+6Yzluyc8mvLEn66tWxLn9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Q7emcwz40o/IOq7Dpt44XLKxli0dOa1B3zDTrX9yLE=;
 b=KAkveq9w3uVo4X/Tc2GTdHUwqyAiXwWSbuQqRzLk0zTW15CT6RWZ1k40Zm9jer0Yo7LS/r89OAKN1/NaAo/7fin4r/nmdX5qeQZRozDtoJ2J7gFEIigrL5A7CDrtzMhgKS9p0pfMZtGPD9tBhPUjVElyTYVv60bCmtl8C19nXr2RtirPLg+vZbsbnmmsBbuJGnLWZ76VJmOsO/WBwgSsjeLNuFHpU4VIIWWWKUhiFcY6uBsM94YTdc3sO6iJ1xcXTyCySkPgwAPtc7ytEAUb94Qkfi1CJmNK1oA0Ry8C401VTk09IeUtd937Egs9ShjMv5qwBsBB/0zo3EvvVDna2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Q7emcwz40o/IOq7Dpt44XLKxli0dOa1B3zDTrX9yLE=;
 b=oyu3jVL6QCIUgL8KZ9BUQ6XK2YRCiTU4E9Na6jEfdP4PgeVPBxQgeYwq9C+bgadGvNId/PKS+Ts8+7viGnNUSMcuT6zk6C2QKTTPms+C66vVWp/CAjOcpuu2pefStJYjCkXk9RLO658xc+Gqk0j1gY69Xn7MFfrbsBu30Gr8W4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6877.prod.exchangelabs.com (2603:10b6:408:161::22) by
 DS7PR01MB7784.prod.exchangelabs.com (2603:10b6:8:7f::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.21; Thu, 26 Jun 2025 22:39:21 +0000
Received: from BN0PR01MB6877.prod.exchangelabs.com
 ([fe80::91fc:9877:8a2a:d4e0]) by BN0PR01MB6877.prod.exchangelabs.com
 ([fe80::91fc:9877:8a2a:d4e0%4]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 22:39:20 +0000
Message-ID: <25ecbf39-e5dc-496c-be3c-8b25eeae2414@os.amperecomputing.com>
Date: Thu, 26 Jun 2025 15:39:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: mm: support large block mapping when
 rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <20250531024545.1101304-4-yang@os.amperecomputing.com>
 <f036acea-1bd1-48a7-8600-75ddd504b8db@arm.com>
 <50a4f767-0007-4f6a-8c62-398962d54029@os.amperecomputing.com>
 <ed942c01-58e8-4d91-8f86-3b3645af6940@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <ed942c01-58e8-4d91-8f86-3b3645af6940@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:806:28::28) To BN0PR01MB6877.prod.exchangelabs.com
 (2603:10b6:408:161::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6877:EE_|DS7PR01MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a015634-bd42-46dd-bbd9-08ddb5024a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVpQS0x4T2d6VEJSYVlLeGx1dE12c3JES3dKL1BPRFFBRFRzQi9yUVJrMG82?=
 =?utf-8?B?RDZjYjhSOGdOUHFKNW01V3l2ZVRHTWdCdnRoN2g5Z0RHWU8wU0tCakE5eU9u?=
 =?utf-8?B?RXRCbndZdzd4TDJCR1ZxdzBwT2taV0lGVmtmTThIT2xwVGI2S3dJazQ2aW5a?=
 =?utf-8?B?K0pyYWx2cFNoMmJJRzlMcE9MME1hUVNkMm1FNlV6ZkRCKzJXTE11cHNCUmky?=
 =?utf-8?B?amg0S3FBL2R6UlErOFRmM2JGSDMvRzBreUhEWEZRWHBNTFhNYTdDaXZMWE5j?=
 =?utf-8?B?Z1pBYUxUaWo0YllFdkVaOUZuN21pUmwrU1l1Smc5OFpseFExejl2YW95Q2lT?=
 =?utf-8?B?czh0NVFaYnFmR05WRS9wZEd4NE5SUXl3cDdsN0RacWM3dUQ4WC9ldFh3bmpt?=
 =?utf-8?B?QVJnRDRZaWdURkJvVW9KK0cvZEtzZDZWR1dGRjExL1g0RzA2S3NEa0g4YmhS?=
 =?utf-8?B?NnVlTWw1QVY5UW5CNFVDZ3prVjVkakRsZThpRHpHdXVvSEtNSHFaYnV4TnFN?=
 =?utf-8?B?RzZqMzRVaVBEb1pKaDg5TlU1QjlSbi9kUDBoa1BTWGd2d2pEODlkdWN3bGJ3?=
 =?utf-8?B?YlhFV213YmNSc2ZaczU0bllERG0zK28wTVRWQXBLazdxYlZMdmxmWmRGdFNr?=
 =?utf-8?B?SlZBYzhpcGZhWFMrbnZybHJ6S0NhUUZlWGRHTit3SVBaNFZaYlhtbkUreThW?=
 =?utf-8?B?amx4eGNsM2V4enQ5UGEwbWtPanhtTXBWZ29oeVl6bUxFdU9vYkpJc2lRVnpX?=
 =?utf-8?B?Sm5yaVo5UW1WK1E2TnNzaU1JTkxGRWdSQkU3WEdQeGVLNXNLeDdDbU5JVVR3?=
 =?utf-8?B?L3FEUTRVOGxEcUcwbGxMVTZXcVk1cGQ5dTdzMjczVm4xcTN0clFZbk0vZGlv?=
 =?utf-8?B?Q2QvaVRFLytUOG5VcTVvWWFZQ2hvWDlPdWtjbEMzS2hxbmNhenltaUMwK0NG?=
 =?utf-8?B?ODhGL3NmOFNuRWMrT0hXSm5OWVNZMk1HVEZYODVzNmlRVTc1TE56ODdFSkJD?=
 =?utf-8?B?dENHSGtYVDNRWTJRZGMzRUtRZExDRXJNSmFZWWJWTjZZOStGSUtYeXBHWDNq?=
 =?utf-8?B?dFltNlVZeFlPeDk2dUZsRWtDN0VJSEhVeFlkT3p1dFcxdGR4SFdobW0rbzJu?=
 =?utf-8?B?ZE5EZ21FMjV2NWpRbzZRU0hvZFNPeWpsM2pJbEdJcG85blNSRUNGaGwzOUVw?=
 =?utf-8?B?NXExakRXZWZEMkNxQ3J6aGRjNytOYXd2ais4dnFKSHhzUFRBcEdoY1ZmTWFQ?=
 =?utf-8?B?dWZsVVRDRHhNa29iNTBiVTJ1OUUwdnFyUXpqQzhuMjh6TnZzZ1BMRVRUT1or?=
 =?utf-8?B?cWxJQjBzWlpFeGpoblBmRGhoZ1ZjTUpMOFd0dlJpUmJUNjNLcmtQSWkraFZI?=
 =?utf-8?B?UVEweEZMTm9ObE9UUTVoVlcvZjUwdUZFd2EwZ2ExZXgycmZkUytyaVIva2s5?=
 =?utf-8?B?Q3UrSlQ3dUhTZEVSUXYwYjhBR0xQY2RFWUsyWWc4R2xvT3RlcHRqbHk1MStx?=
 =?utf-8?B?ZThsU1NqVXIycHI1aldVYTVaVEcrc2NpNFNsb3VaMmRXVmFuOVpNWVFVZTdB?=
 =?utf-8?B?a0NmT3lYdjZVM3I4NnU0ZWxxWmdnSGxqN3BCN1o1Z1pvKzFrcjByODRwR0Rt?=
 =?utf-8?B?L2VJajF6VUtuaW5YZXNyVnBZUnlhMTN6M3duTWlRU1lDOFhzd3NKUkQyUVZi?=
 =?utf-8?B?NEFMSndTQUtRZXRSYi9tRGp3TVB5SHR0V2tRWjRnSlBKWVBjMXIzbzhSQmt1?=
 =?utf-8?B?N3VxSk52c3dyS252MjhydjRUcHYwb1ZUbmF1QmJOQUMrMUF1aEtXY3RmN0pW?=
 =?utf-8?B?QmdaQitGUWxCYnVKY2ZkQTRYM2RpVlI3Y1hxZkJiMkxiajJCanU2endBSU5z?=
 =?utf-8?B?S25zY0x0b01OdjFFeExwQUJKcFdLK3NRZXVCWVdnU1k0NHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6877.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTA0ZzBibWlBZHF4TG8xMmd6bGdRK1QrdUFBTFNjSHRxSWRQMDdmbzIzMjlU?=
 =?utf-8?B?TE5WMXF3Z3JxdXdtbUpzVHYxczFFb2FzNmxsbURObE9mK213UW5QajFPbWw2?=
 =?utf-8?B?QTVkTUtKZ3MxeDNJYXhzTEVvUGUzZGxiWjUxYzBUOWI1ZkxrSXk5cDI3SVJn?=
 =?utf-8?B?alFMZis2aVk3ak9VYlhBTDc2REo2VWFpNzNmbmgwa083RHlrYWxWekxaOVNl?=
 =?utf-8?B?Z0djWktmMUIzbElrQ2V4UXJhdlBSTmI2NE5MRURoRjRVbEVZdDhXVUxyS05w?=
 =?utf-8?B?N2lHTVQrYTV3ZFFtQVRpUjc0TEJ6M05LNHNYdzhTbDZEVTgzR0p6Z1JRKzJs?=
 =?utf-8?B?SC9WSHhOYWhjWTVBazhHYU1pcmErbjlKZE9KRnZLYjVYd2hkRTFpUzBreml3?=
 =?utf-8?B?SVFibUdKckJYZmcxbzU0NmovTCtkWTRrL1BOMm5sYUtwTitFM3JFOW1sd2c0?=
 =?utf-8?B?a0h2MVppSnFZd0I1SERmU2NPNUZLUUpNRE5RZEl2M2RpdnZmMEorZm9HVXNG?=
 =?utf-8?B?a0lPamp3endDNXhCRlp0d0g5cUcwWFIwbkpHdmVadzBzT3BLMUozVm9tWi9P?=
 =?utf-8?B?U3lrTndXTWdMK0IvK2t0SExhZkpIVWtSeUZUU09QZE9jUGs3R1RweHVyQnVl?=
 =?utf-8?B?R0RGQmliV0w3cVQ5VjlqYVpFZ3RiNUN6OTdBTnV6N3Yybkk5YTgxNDlkWTJl?=
 =?utf-8?B?UHEwc2dhaVB4NUV5NG0wSFozOWxSR2VoK1ZZR3NtOE1TM3BvazI1eTlDRkdW?=
 =?utf-8?B?YjJ0dTUzK0ZWZzR3Q05Cc1UyZnp2L2lGLzhlY2JRWTd5UTNMcVJlWHpkYTFD?=
 =?utf-8?B?emVIL2MrR3pvRmtoN3kxUHpXMHMvM1dETFhwSlNxM0RCM3VicFZrS1BsTFlR?=
 =?utf-8?B?WTBodnplRHlWRk1IRHZZbjVRLzhBaWZtRitvRFJWTDVYd3pTS205RS8rNGJY?=
 =?utf-8?B?ejZ0WlAyNkVoVkpiRXZMaWdWRXo4NHJDNDgvZ0Q1VkxpTFB4VkVDbGVRTTVC?=
 =?utf-8?B?dTllczFPNWJZVng1SGlZL0pqRWh4Z3o4M0FqWlFEdDRNK0w1OWZNbXFTMTFx?=
 =?utf-8?B?SGZQQW0yMDZycXk5ckU1RThKdm4ya25mUnAvTzlpNVA2RlpmUnlmOW5UeEFZ?=
 =?utf-8?B?UnhzOE5KNTR5dWowelJoRi9FdFBybklMZmdCKzFLMFpEckFYelNyZU5reTc5?=
 =?utf-8?B?RWtKR2VSSzFvRVFPUHh5Rm94b0dBR3l3SFJ3dHFPWVBUSEJKR0NJdERwSVlP?=
 =?utf-8?B?MjRBSE45eVA3VWZsUEpCVk9YWVlqWU5jQURyUkF3YjhsOGlKZW82TmsxYnl2?=
 =?utf-8?B?M2JIWnpiblZlNUJVN3lNSmZ1WmhHenI1OXVYaDFVNFhDbk9uRFhKaFlxOExk?=
 =?utf-8?B?V2FCcENjK1VoVXNGSFBmL0xsd2ovU3dYd0pwS29PTXhJWmpDMTlNNEpudFpW?=
 =?utf-8?B?d0M4cVE0dzBCcTBMMXZ3UUFGV2ZJQkJmUFE4dGN2WEpNSlFRdEEvczEzdVo3?=
 =?utf-8?B?Y1RYaHo4OFBHVVgxbnVEdHc3cUhqY1U0WVpoVUptdWM5YlJ3aXEyYlZWOGZB?=
 =?utf-8?B?SFFVcDl6dkxuZHQyWk9GQVllVGN1VmtiVStGUExTQ1RMK2hNM0QwZ0JnSzJN?=
 =?utf-8?B?RkJoRFZoZlR4L0tWb3dXVnc5NVNFL3BDaWZjK09JZEhMZ3JpV0ZuWGEvZFdv?=
 =?utf-8?B?YjQ2SERQdnN2ZE80ZW0xdzQreDgwV3FXMGk1UnYwOU9yYXNDcllpRnF3a2lh?=
 =?utf-8?B?dFY1QmRYN0tDMjBqS2srUGFwZDlXS2VLNTgvTVd2QTQrb2VWNjd3b0FEZzdQ?=
 =?utf-8?B?VWx3dmMraHNwMzlCODloWEJUQUtOMHBLckdaOVVoa1hiOUs4UWh5SG0wNEtw?=
 =?utf-8?B?QkZLN3QweG5hUXlVZS9USmJLcGNkL3BnRXpCMlJZS0VGL0IrbHBSMTV2dUo3?=
 =?utf-8?B?YWRmR09UN2RPKzFUeDRqQWc0a213UTBnTHF1Z0V0bFlRUzJrTCtFR0NOMTJW?=
 =?utf-8?B?Zm0xV2VEZUMwRXhkWDhnblBReG1NWUxVTzhPU2piZWxRb3RQckNocTVtQlMw?=
 =?utf-8?B?cGJ5R1k3Q2ZwS09vL2NuMWZ2eXRUbldjYmYwNkV4TERaeEZoTnEwV3BnNENh?=
 =?utf-8?B?K0R5Y2RIbHRWSWhFeFdWaWppRG93TkRZbGlxVTRFQ3Z4SjQ5VGVxZnYwK2Rx?=
 =?utf-8?Q?bEycXMHDtqPRGMutFHLsHwk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a015634-bd42-46dd-bbd9-08ddb5024a54
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6877.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:39:20.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3Fd33LJX/9nkLj+AL83uNL78CKQTGyzQvlxLcIiwdbWCn0j1l9kT3yo4trUf7RWN3vcdPCBCYM0pHQYgKEA7txBtrNfoVIsNQLPPt21Byw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7784



On 6/23/25 6:26 AM, Ryan Roberts wrote:
> [...]
>
>>> +
>>> +int split_leaf_mapping(unsigned long addr)
>> Thanks for coming up with the code. It does help to understand your idea. Now I
>> see why you suggested "split_mapping(start); split_mapping(end);" model. It does
>> make the implementation easier because we don't need a loop anymore. But this
>> may have a couple of problems:
>>    1. We need walk the page table twice instead of once. It sounds expensive.
> Yes we need to walk twice. That may be more expensive or less expensive,
> depending on the size of the range that you are splitting. If the range is large
> then your approach loops through every leaf mapping between the start and end
> which will be more expensive than just doing 2 walks. If the range is small then
> your approach can avoid the second walk, but at the expense of all the extra
> loop overhead.

Thinking about this further. Although there is some extra loop overhead, 
but there should be not extra loads. We can check whether the start and 
end are properly aligned or not, it they are aligned, we just continue 
the loop without loading page table entry.

And we can optimize the loop by advancing multiple PUD/PMD/CONT size at 
a time instead of one at a time. The pseudo code (for example, pmd 
level) looks like:

do {
      next = pmd_addr_end(start, end);

      if (next < end)
          nr = ((end - next) / PMD_SIZE) + 1;

      if (((start | next) & ~PMD_MASK) == 0)
          continue;

      split_pmd(start, next);
} while (pmdp += nr, start = next * nr, start != end)


For repainting case, we just need do:

do {
      nr = 1;
      next = pmd_addr_end(start, end);

      if (next < end && !repainting)
          nr = ((end - next) / PMD_SIZE) + 1;

      if (((start | next) & ~PMD_MASK) == 0 && !repainting)
          continue;

      split_pmd(start, next);
} while (pmdp += nr, start = next * nr, start != end)

This should reduce loop overhead and duplicate code for repainting.

Thanks,
Yang

>
> My suggestion requires 5 loads (assuming the maximum of 5 levels of lookup).
> Personally I think this is probably acceptable? Perhaps we need some other
> voices here.
>
>
>>    2. How should we handle repainting? We need split all the page tables all the
>> way down to PTE for repainting between start and end rather than keeping block
>> mappings. This model doesn't work, right? For example, repaint a 2G block. The
>> first 1G is mapped by a PUD, the second 1G is mapped by 511 PMD and 512 PTEs.
>> split_mapping(start) will split the first 1G, but split_mapping(end) will do
>> nothing, the 511 PMDs are kept intact. In addition, I think we also prefer reuse
>> the split primitive for repainting instead of inventing another one.
> I agree my approach doesn't work for the repainting case. But I think what I'm
> trying to say is that the 2 things are different operations;
> split_leaf_mapping() is just trying to ensure that the start and end of a ragion
> are on leaf boundaries. Repainting is trying to ensure that all leaf mappings
> within a range are PTE-size. I've implemented the former and you've implemented
> that latter. Your implementation looks like meets the former's requirements
> because you are only testing it for the case where the range is 1 page. But
> actually it is splitting everything in the range to PTEs.
>
> Thanks,
> Ryan
>
>> Thanks,
>> Yang
>>
>>> +{
>>> +    pgd_t *pgdp, pgd;
>>> +    p4d_t *p4dp, p4d;
>>> +    pud_t *pudp, pud;
>>> +    pmd_t *pmdp, pmd;
>>> +    pte_t *ptep, pte;
>>> +    int ret = 0;
>>> +
>>> +    /*
>>> +     * !BBML2_NOABORT systems should not be trying to change permissions on
>>> +     * anything that is not pte-mapped in the first place. Just return early
>>> +     * and let the permission change code raise a warning if not already
>>> +     * pte-mapped.
>>> +     */
>>> +    if (!system_supports_bbml2_noabort())
>>> +        return 0;
>>> +
>>> +    /*
>>> +     * Ensure addr is at least page-aligned since this is the finest
>>> +     * granularity we can split to.
>>> +     */
>>> +    if (addr != PAGE_ALIGN(addr))
>>> +        return -EINVAL;
>>> +
>>> +    arch_enter_lazy_mmu_mode();
>>> +
>>> +    /*
>>> +     * PGD: If addr is PGD aligned then addr already describes a leaf
>>> +     * boundary. If not present then there is nothing to split.
>>> +     */
>>> +    if (ALIGN_DOWN(addr, PGDIR_SIZE) == addr)
>>> +        goto out;
>>> +    pgdp = pgd_offset_k(addr);
>>> +    pgd = pgdp_get(pgdp);
>>> +    if (!pgd_present(pgd))
>>> +        goto out;
>>> +
>>> +    /*
>>> +     * P4D: If addr is P4D aligned then addr already describes a leaf
>>> +     * boundary. If not present then there is nothing to split.
>>> +     */
>>> +    if (ALIGN_DOWN(addr, P4D_SIZE) == addr)
>>> +        goto out;
>>> +    p4dp = p4d_offset(pgdp, addr);
>>> +    p4d = p4dp_get(p4dp);
>>> +    if (!p4d_present(p4d))
>>> +        goto out;
>>> +
>>> +    /*
>>> +     * PUD: If addr is PUD aligned then addr already describes a leaf
>>> +     * boundary. If not present then there is nothing to split. Otherwise,
>>> +     * if we have a pud leaf, split to contpmd.
>>> +     */
>>> +    if (ALIGN_DOWN(addr, PUD_SIZE) == addr)
>>> +        goto out;
>>> +    pudp = pud_offset(p4dp, addr);
>>> +    pud = pudp_get(pudp);
>>> +    if (!pud_present(pud))
>>> +        goto out;
>>> +    if (pud_leaf(pud)) {
>>> +        ret = split_pud(pudp, pud);
>>> +        if (ret)
>>> +            goto out;
>>> +    }
>>> +
>>> +    /*
>>> +     * CONTPMD: If addr is CONTPMD aligned then addr already describes a
>>> +     * leaf boundary. If not present then there is nothing to split.
>>> +     * Otherwise, if we have a contpmd leaf, split to pmd.
>>> +     */
>>> +    if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
>>> +        goto out;
>>> +    pmdp = pmd_offset(pudp, addr);
>>> +    pmd = pmdp_get(pmdp);
>>> +    if (!pmd_present(pmd))
>>> +        goto out;
>>> +    if (pmd_leaf(pmd)) {
>>> +        if (pmd_cont(pmd))
>>> +            split_contpmd(pmdp);
>>> +        /*
>>> +         * PMD: If addr is PMD aligned then addr already describes a
>>> +         * leaf boundary. Otherwise, split to contpte.
>>> +         */
>>> +        if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>>> +            goto out;
>>> +        ret = split_pmd(pmdp, pmd);
>>> +        if (ret)
>>> +            goto out;
>>> +    }
>>> +
>>> +    /*
>>> +     * CONTPTE: If addr is CONTPTE aligned then addr already describes a
>>> +     * leaf boundary. If not present then there is nothing to split.
>>> +     * Otherwise, if we have a contpte leaf, split to pte.
>>> +     */
>>> +    if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
>>> +        goto out;
>>> +    ptep = pte_offset_kernel(pmdp, addr);
>>> +    pte = __ptep_get(ptep);
>>> +    if (!pte_present(pte))
>>> +        goto out;
>>> +    if (pte_cont(pte))
>>> +        split_contpte(ptep);
>>> +
>>> +out:
>>> +    arch_leave_lazy_mmu_mode();
>>> +    return ret;
>>> +}
>>> ---8<---
>>>
>>> Thanks,
>>> Ryan
>>>

