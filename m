Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6856013D891
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750826103; cv=fail; b=Ux1C+djbWMQGAjvQWcapI40W3JFFzNjAPBYUrVP0fo7w5bj81QWXPRM5ZClZt82Mgt5Jw25tFTbWaQ87TU2HoRhBZHsRLJnOgNu2n6wYcbO8Fxmn5JI3IO8vV5RM5H8P4HaVYsP2HWW5ZlXNaxY6pU99dOirPR7wxjLEBq6wexQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750826103; c=relaxed/simple;
	bh=+LNM/CnxyRHb+Qdhp6YGE0hH2tzrdd/QmidReM4+kIk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m7nZyu7rIWgTYisaxIJ+DvUYCJkofFgKhXz4iD1wEc/8CHKqzfsoOuYLSMsWFCAFwFV14KC+f8k3hpTGTT0d67QJQAbfZlpUtlRkZDu1qA3Anzh2KfLn5R6pIp0mHj4KjIRTx9b+uJWX1J/zoHeSE6kgUG0SEIBgrVM/nlrp43M=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AozpJNlZ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AozpJNlZ; arc=fail smtp.client-ip=52.101.84.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AozpJNlZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AozpJNlZ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I5PsVcgfUiShQ65SxpYPSQt2W9sEZpC9TXcA4vanb/1iLmIe1tCdp9a4rYMf73m24/ttP6WhcF4ZEwBJ3QiTM0qylQJVr9t7FZhqg+fXJ2NKoELpCHoJUB8NelyJbwEbzoz8TAOvL0XGfBtlMbw3Uz2XhWxgp5XRXKaEsyTVoFhzvqci0yWD3Eo3/hzGAUBj2v//K/+UFNltI83upc7h1htn4WJfzjUfgVBuswDS7gFg9WRXeeseG9ytCvZG0t0jve1epmeSUIyb2/3NIs/QDy1xl4JXx6Dio1WXqViYzCrusfnM82XdeYzyTFPPYg1r/UanSRqCxsmCDF/1Kg1muA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF1wK2M7soeE6thZGy9JbfuhA/1OG6XyJHraZ1pXqP0=;
 b=Q47kOAADWqD0nh/ZBh135C+UqQc4FW5/ssPfFZbMklNdQsiMuLdCbmvySeWOxGD+t4W0IKD3+QX5mUzJMc4/tDoNEkjsw2HchHMFBSv3CJAawYo5OUoKU4wyKA5924iNX98BNYIKXG8l/hBNdCoKmoUveP3tobA6SINWg+w/0fQzRRvPMLM/w90eWo4o7EoCtahCSWKMGzbFTSkeofVGTv4BMijdcJsmaMoxavDafFU0IgesPX3yHmjIXX1OGERmNoscP9IrBzh6zt8M1mq9SZMF40dLAaUMHoT8y5QwDFxirBLq11clCrV9G/wos0UsC1/GF1XiPpqw9bZ/Ogqa7w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AF1wK2M7soeE6thZGy9JbfuhA/1OG6XyJHraZ1pXqP0=;
 b=AozpJNlZA6HTseSheuPV8ER3oP/j6kyCIXaO/oQzB8FRN6NEdKca0fCnFlLHAQ7aDJLTaN6sXmomWkbdERFPCBPNfCwMQkZ5Odj8TDzLtTlbdVLH/c1f7er5jjoisbo/AfH0tVFPyJKaQdCEqc7rW4onZghk4ULcIl2JOQOmOhE=
Received: from DUZPR01CA0342.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::26) by PR3PR08MB5593.eurprd08.prod.outlook.com
 (2603:10a6:102:84::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:34:55 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::d3) by DUZPR01CA0342.outlook.office365.com
 (2603:10a6:10:4b8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Wed,
 25 Jun 2025 04:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Wed, 25 Jun 2025 04:34:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqUHI147cId1zixXbtvLLYIruys4n1/PWPuLN8ocDvolaLUJdPyEDJyIpDLshi6PWR/PZ380bYoWRGmF6P4N2qvAy6HTVDw1Pu1t+TILGk8VDdxgoMpOVCxBfee3xXcxEV3ZNe97FOH8CCZn/AmYeRCZMAKgW7D4pE9zTJs9RcR+5LxGRDxc+N9V1d6DLtWmGtpPVQouJBJ9e7CEbb2TddDl9GuT2+jOwSpVcjyNsSLwRpgsFUaxyuIW/ZSO34mFyhV07NQnsU+9rzmAx2FQBmyW/FVv6WU499oBnxr+nVqQ9do356jXyTQy6hfbZzoMHwtk7X3xY6il8twBP2XSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF1wK2M7soeE6thZGy9JbfuhA/1OG6XyJHraZ1pXqP0=;
 b=i4aIxLP/6k7DCtURjUyZUC4MbCtuBpQvCl5dm2I+QUHCFg0PRQeeuQTk4hHoyiTUnZ21+RHd8AMHgJIqi+io4Jh6iiF0+wT9pz/QubsUQ7JwosSVSf/4tanTF+j76wBzVq/vvNh6ZkuO903htpD+CRXSoNO/C39jXMxESAVqyL2+qR5PCwH+rZSE19Uype7iCqNazLJYQk+EXITQ0Z/+v8kFn3uKOqjBIKNrsRFGxT6ORHG+AwkBECnDrr4qL1T84Yg7jLRV8YxwPvAVSiVVeZp7y08IjpLrhgXcVzXrdeZFRHJY4tQdg/T5g8Clpo/W5uVhArrk1ae7T7pfo9M0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AF1wK2M7soeE6thZGy9JbfuhA/1OG6XyJHraZ1pXqP0=;
 b=AozpJNlZA6HTseSheuPV8ER3oP/j6kyCIXaO/oQzB8FRN6NEdKca0fCnFlLHAQ7aDJLTaN6sXmomWkbdERFPCBPNfCwMQkZ5Odj8TDzLtTlbdVLH/c1f7er5jjoisbo/AfH0tVFPyJKaQdCEqc7rW4onZghk4ULcIl2JOQOmOhE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAXPR08MB7368.eurprd08.prod.outlook.com (2603:10a6:102:22a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:34:21 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:34:21 +0000
Message-ID: <ed1be989-4840-4461-bc9f-7f9cdc434d93@arm.com>
Date: Wed, 25 Jun 2025 10:04:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, david@redhat.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <25252834a20a2e8f611ba572d9fae98fb8d67982.1750815384.git.baolin.wang@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <25252834a20a2e8f611ba572d9fae98fb8d67982.1750815384.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAXPR08MB7368:EE_|DB1PEPF000509ED:EE_|PR3PR08MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: 9916b6e2-cffa-4df4-708d-08ddb3a1a222
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?S1RQaVI5MXJ2RWdFRTl1NmZuenR5RnRSakJTdTREeXNEL3VuWHhBRDdncUh6?=
 =?utf-8?B?dFloUFJ0MGhvV09Td2oxcGpKcEZTVFZjRjlZQkJVT00rcklMZXZQZEV1bnE2?=
 =?utf-8?B?c2c1MlA2b3pVUm5FM2lwM2ROUE1MUVRaWjNtVEVaZ0l6QW5iMzlkd1pOYUQ4?=
 =?utf-8?B?bk40Yy9Sa1NWWk1SMUowM1ZZS1ljODM1bDhVL01ReTRaVWhiNDNEcUNibGt3?=
 =?utf-8?B?Qjc5WElMc3h2UXMwSDVIclVFSWdFNjBOU3FCZVV6eW9OOUVJV2ZLK0pLcHgv?=
 =?utf-8?B?emNkN1U1OWFYS2Uxdis2UEc1YVhUQklZZ2RYOGxjMlFXQVNTVFlROEpLVC9a?=
 =?utf-8?B?T2lUcC9FcFUyN1dxekJYLzJsU21xR0FoTkJYMnRYZlpYWjBVUHN6bVFqOHRk?=
 =?utf-8?B?a3EvemF3aWlGeGlFRCswRXpKMVl0Ykh5eGRwU1pnL3F4d0EzcjUzaWFod2dG?=
 =?utf-8?B?VXVLdnlnb1E5RDZPa3ZYZlA0eUdodWhuSUpIMzUvZ2tFOFV0MEE0LytHWG5y?=
 =?utf-8?B?amRKbmdqc09Ndkh6TzE5LzRVbExsVDE5blZsNVhmVU55TUNabjNZOE1FbmdE?=
 =?utf-8?B?MTlZanB6cmJEU05WM2NCY0NSWGpKMlhnWWxWYlRBL0pvM0UwT0QvUkxENzhw?=
 =?utf-8?B?ZjEyck1RVkZkeitWRjlycFBYZmJtb0V5QnFLRXNKbWdvZVFxdS96NGwvMkJC?=
 =?utf-8?B?dTlpZzl4OTR5aVpvcTJ6Ni9tRkcvL0RMVFNZWldIM1VFMThtWFFLVUtWMFFU?=
 =?utf-8?B?Q0plVllIaitnUWZMa1RRYW9aaVk5Y3ZISXV6cFN3UHM1SURXOWxPNnh3YmVY?=
 =?utf-8?B?OU5NcnBmZlovNXhzRkpLeFBOek5jbW1nSmFOeE1qcThndXVYY1BYclVWU2VH?=
 =?utf-8?B?ZGhMM0ZOMnpwY1I3b1lCcGhVVUJCSlJBZFl2dVVKblB1MmQ1SFJOUHdjTzRa?=
 =?utf-8?B?Wk1qMHlhLzlHdVZlTlg3NGdDaEJqQUR4cGdYR2JjbHNXMEF6WmxQR0V6WFZv?=
 =?utf-8?B?bzRtVE1DS1BJUzNvWTdERTZvcGgrbm9XOW5lMDVhcmhWRTFsYnllQ1hsV24x?=
 =?utf-8?B?WG5GZjFqY2hBaUQ0Z2dMallSTktIN0hVTnVnQXlwNnlENDB4WTdTemVkZ3NT?=
 =?utf-8?B?eHlkWndod2NiTjVLM2dkZ1pIWGtMUGp4bXU1WFBzTlVrWkVBNFJqMy91a3pl?=
 =?utf-8?B?elF0QmxYd2tLVTlQZDlOY1kxdG4welcraHgyRmFJd2FZQ1Bva1dSdlRJenlj?=
 =?utf-8?B?OWNOUklBLzZXQjNzZWYwRXdySTFvcVI3bnpXRW1LZGhXajdLMC9LajlmVUUy?=
 =?utf-8?B?Zzl2Qk5yWlhmUXJURWwzekVJUms2Vk1vWUM2a2IvaGZSUE56N1NDWGVrZWNl?=
 =?utf-8?B?VXRRdjk4VWwxalRUcGZ4dGhRWDJKN0QveXVpb0ttcjAxNmVlcUtuSEJEcWFV?=
 =?utf-8?B?a2xjcU9OTk90WVpsV0VDT1RNNlpzbmx0aVJFL0x4ejZJOTBpQlc5Tk9VVDQ3?=
 =?utf-8?B?TVVQeHNSOVdvamZMMzl2cVpqcThQaUV4S3hqRnBzLzFzdnZPZzNqYTZQcjhq?=
 =?utf-8?B?eU95ZHBaaXdUS1d4V2MxWVdleU9QUENQM2dvMC83VEN1eEt4TFFyMEgybE5Z?=
 =?utf-8?B?ckRlTENLNFU4M3MyRjhlQmJFN0o3d3A1RDdyMWdCSldLZG5JZENuWXAzYzJ3?=
 =?utf-8?B?enZ6UFBMdThWMGNGM1hNdzdlTzY5U3BrZHBCTVVGY3o5RFdqRXIzMGd4OGha?=
 =?utf-8?B?UUhhd1FSR2tRU25NSVdJZ3BWRnU5MFZSTEJJVzVSZ0ZkcmdNRHJ5aWIzSTNZ?=
 =?utf-8?B?TDlGUHZsb25SSGYxbGpsUzJsZ1A2R2hDOHVvRGZiUkVhQXRDY1dTeEVlcXow?=
 =?utf-8?B?NHE1dEpkMk95VVo0QjR5V0lsWlJpVjBxOCs3bVpPenNiL2orQ0dhNXpEL1Jq?=
 =?utf-8?Q?rJZ1wEFaOiQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7368
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d86bde5e-afd3-42d0-798a-08ddb3a18dff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|7416014|376014|1800799024|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnNTenpXa0xscjRSR2hDVVZsY2NyT2wrcXROOUI1bFJPWFNHeWdzcE85Rkx6?=
 =?utf-8?B?VFlCZXZVOWE3dlEzZXRKUUtabVpOdkRtWWQwYmZEMjhyVDNJa2QrdnNFTkg1?=
 =?utf-8?B?SlptT0MrWDBSeis5L1YrSWhWMzJ3cXdZemd5OUpMTUYwNjVjUS85TXoxTHNK?=
 =?utf-8?B?LzFCWnNUZ09IYTBQdGdaQm1XRHlRcjdINVRFUS96c04wMUNCb2djVi9rT0da?=
 =?utf-8?B?T0dlRzBvb0ttd3l5ZC9leGlVTEQvSVpoRmVwR2tsb0JJU1ZLNGZLN256NkxK?=
 =?utf-8?B?YXpLeDJka29DTUZzWGZMcEh5elBVVlVIOTVnZW1UQzJSa0hjS2VSbE9oMUlo?=
 =?utf-8?B?Z3BreVNpTG5JZDYvOVc2Q2Nna1NGelNXc0l2K3Z4alZMSStKSzBLVEJyZE5C?=
 =?utf-8?B?eXZvWngrOWxKQjdtdlJDUlZhU05ZV0pUMDFRdEhVYThnWjdRVlExeFRlQXdv?=
 =?utf-8?B?ZGRvM2I5VDB0dGVuOW90YlBkOUs0bDBOK21kc2F4SXJ0eG9qRlBqcHI3bXF2?=
 =?utf-8?B?VjRWd01YYWRWU2IxQWFNTE5GY2EyTkJmSnR6em45V2FMT3ZKTE8rUnphZ09K?=
 =?utf-8?B?VjdUd1IrR1QrRGdwdEFJdU8zTjMwM0JTbFRVRzl5R1ZGdmI3Z1JWY2FFWnlr?=
 =?utf-8?B?SDFiY3V2Uk5GdXdZYi94SWtKRStXODdXS3N4T1kreC92YVM5YzRpbTYvdDNG?=
 =?utf-8?B?eWg2dDY3bGJJNytxajJpVjBOTDdzeGZmN0RvbGlqQ2cxUTI4SmRFM1pLTTkr?=
 =?utf-8?B?N3RkVXBacytLVW8vM0lxYkFzSkwwVlluWDlna3Irc2gyeVoxMjFBVDRaMFRw?=
 =?utf-8?B?NDlKRDFKb0ZQTjMvc1lOMXlxSTlpMWt4V3M0SUcraU4vd1cwdWVmUWRzVFlO?=
 =?utf-8?B?UDM1NnY2UkNvbmJ1MlRjR3NYZ0VtOVYycjVyWTFWZWI1TlpEUitDM1lNWVRD?=
 =?utf-8?B?UHA0dDlkTSsrTTRmT1pxU1VzOThxdmRkTTJaSnRpb2NnZUd1Ry9kcUwwL3N6?=
 =?utf-8?B?ZnZWVStKQlhXb3kvR001UUZkT3dCdXd4YVFJcVJNN3ZWMldHNzhMb2xjTWZK?=
 =?utf-8?B?dUc3a3VSWjRleTI2RXdQbnhKMkh6WGJJRk1sU0JHMTZSV3JzdnorZExFbGo3?=
 =?utf-8?B?M3FXRFBxYW1nMDZ6N3NjMW5mdlpHR1RXbmgxbzhhUXBmeE5tcUtXN29SaFZt?=
 =?utf-8?B?MkJ1ZnVSSWdvYUliQW5Oa0JoUzQ2OXRxVHhha05PUkFoelYwTmdpTitPbFQ1?=
 =?utf-8?B?eStJSGwxMUl3UXFpTkpUT0hpdCtVRU9zV2t1N0w2WEI0U0ZuT0dFY0phS3o4?=
 =?utf-8?B?aGUvOUJURHVxRlFpa2F6N2JFUzBLU09sRW1sQ3dlTTIzdWJxZ0gyVkVQNDJk?=
 =?utf-8?B?aGc2ZFpPaGVKdkRadW1JZ3VFcHJMZjNqeFpGQUVGSnNTRTFEV3R0bDVRaEFF?=
 =?utf-8?B?UG5CZTZqL25wQnJ5aFg4Q1dLM0hDMkNmUFlMT1VWOHJMVzZyRktvbm9zdmg1?=
 =?utf-8?B?aVlVZVZNLzBwaDZhMEpPWC9PN085QWd2K01oUG1CbkVJbnJtVEo5eXV6YTdl?=
 =?utf-8?B?LzJUK2tmdDhvNW4xR2FZcnlLV1ovN0FqRkNZaTFvMGVDcWNSVWl6TWhCSndh?=
 =?utf-8?B?cEhYLzZyV3dEdFo4NEhYaEZHalJIdklydEphZlpEanpQOFRXcWIvVG4yeEJ0?=
 =?utf-8?B?cGRXU0o0WkU5Y3o3ek1rUEZ1eWNuNTR2NGpvUllRaTFNakNpODRnSmVEVDFJ?=
 =?utf-8?B?bld2L2J1ME5venBNMmFsNElDS3pvTmo0c2UzRUFaMUZJQzQ3YjRjRHhhNEZp?=
 =?utf-8?B?d205c1NXeUFvWmxRWDVqWjl6R3d4amJaZjM3RUs1VVJITmQyVkxlZExTUjZi?=
 =?utf-8?B?WVVTbFJpVXdyUEszWlZJU2YxYU5oc2VqeUp1MU5OTThNTThacHBLSHZRdFd0?=
 =?utf-8?B?aUdSMmpsRVB3KzlsMXpIUjY4SDl1K2FTTVRwZEdmWDUzaURyaGkyMDZDakZU?=
 =?utf-8?B?SjNkNUExMzk2T0pBNWZGYXFTTC8yMlNkTkEwVUpmd2ZpS2pObURIK3dyNGYy?=
 =?utf-8?Q?hOAGIr?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(376014)(1800799024)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:34:54.6711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9916b6e2-cffa-4df4-708d-08ddb3a1a222
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5593


On 25/06/25 7:10 am, Baolin Wang wrote:
> When invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS flag is not
> specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
> callers who do not specify this flag, it creates a odd and surprising situation
> where a sysadmin specifying 'never' for all THP sizes still observing THP pages
> being allocated and used on the system.
>
> The motivating case for this is MADV_COLLAPSE. The MADV_COLLAPSE will ignore
> the system-wide Anon THP sysfs settings, which means that even though we have
> disabled the Anon THP configuration, MADV_COLLAPSE will still attempt to collapse
> into a Anon THP. This violates the rule we have agreed upon: never means never.
>
> Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there is only
> one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
> collapse_pte_mapped_thp() function, but I believe this is reasonable from its
> comments.
>
> "
> /*
>   * If we are here, we've succeeded in replacing all the native pages
>   * in the page cache with a single hugepage. If a mm were to fault-in
>   * this memory (mapped by a suitably aligned VMA), we'd get the hugepage
>   * and map it by a PMD, regardless of sysfs THP settings. As such, let's
>   * analogously elide sysfs THP settings here.
>   */
> if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
> "
>
> Another rule for madvise, referring to David's suggestion: “allowing for
> collapsing in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>
> To address this issue, the current strategy should be:
>
> If no hugepage modes are enabled for the desired orders, nor can we enable them
> by inheriting from a 'global' enabled setting - then it must be the case that
> all desired orders either specify or inherit 'NEVER' - and we must abort.
>
> Meanwhile, we should fix the khugepaged selftest for MADV_COLLAPSE. Originally,
> we could prevent khugepaged by setting THP_MADVISE and removing MADV_HUGEPAGE
> setting, while madvise_collapse() can still perform THP collapse. However,
> this would cause some test cases to fail because some tests previously set
> MADV_NOHUGEPAGE, and now there is no other way to clear the MADV_NOHUGEPAGE
> flag except for setting MADV_HUGEPAGE. Therefore, it should be changed to
> THP_ALWAYS here to allow madvise_collapse() to perform THP collapse.
>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   

Reviewed-by: Dev Jain <dev.jain@arm.com>

>   
