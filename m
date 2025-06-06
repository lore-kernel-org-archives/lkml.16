Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87EF286D5F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749206442; cv=fail; b=EJbuCilWa4YXknD4JtN2rPrauBkt/sHkHD6sggNgy7qrbtTQ7o2xgY10gt0qtuGlTK2j7c/+01aNkB2rPpcqr2leOC2iXx/a5VK4LLdvubwD/2HavUvzQQDUW3XXryJH+2eorCjYgj23V3UIpOsUTB5XHV6LxI53oHCetyidlT8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749206442; c=relaxed/simple;
	bh=cPj0ROG/A2whM3e+ViuEtQPDMKYhO5ckQPkSSbM9/mc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eCUzmT0RHOkWtZfKkJI2r7+rYbh2EwgF0GEctDkrWjHMMK7aFBtor9+fuDsD2s4Y707RVRimcQKm0jpGv3P3SK40UVeWGTZzTKMZygPSoMi5sTHCOQlH1c1lTsh974l/DELd39cMH4xkG7QesAbOc2t/ctawOrYks1Axytuy42A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aeVSWA2W; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aeVSWA2W; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aeVSWA2W";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aeVSWA2W"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SGKjZZy069PcD7jyWYL1dqbOtYEJ/mQ7LHxkdQoeFp/LDNftAf22RXijG7YVUUtQ5qkuY/s0BYH9QO9FUK//UB8yAJZmHl77W9nqCa1KLy+ge67j0AHHeUesc3ZtbLToEVbQ3/BcPpC00EOC5GngJhm/XAw4x+TyZpUWQvyv+xF/w+LUyBdRUUJ9NxOh9Sjs4P5D+ezWy1lRoZD6YGJG85JTGO7uUNXxAIpcqy2a3GsizY9JlYw3SNCaMjVRnFeO4blMkNS/XfY54fDKikUR0eHaoU7NbW9bB5Qu6jkQvYGKlZU7xJGHvgo1nXxkhmbI5TTQwJQXoBmCDJc6IM1Xgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=961aqrBQ0f+htkBIvOVIbfhfEgaVeWmdPKZzAqm78fk=;
 b=UlIiplBzw3O2EIoGjUWts+jNZPGWWwKrmN4NgapzhuqkW9NcpnAEJocdTms5UYdWTneK24szHHAD2GAp9TOc+dAZOdE5wPS8lrCEUL6qKMvyLLvj5zkRaPSKB+TVkg8KuPzp9oCUJF9j1aFxJeG8R+UxaO7M6XnRXUoP+7X4ZYClhUBoZOa7evejiSWhqqQS59V4td0br/tfGymrvrk0pas1KPcWYxO6heJJHQrW66H3SBG528lddBWhg1MX2qbTlFQFX1/7VYgR0sWdiTLOZMZuYtu+BAMfK+OBZ7SmsuhwSWazXvKjntfLLqnPVMyjBBYKYlMOTQogQtzzrcBzPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=961aqrBQ0f+htkBIvOVIbfhfEgaVeWmdPKZzAqm78fk=;
 b=aeVSWA2Wb1nMsH98WaVdsQw+09CMYu+gGwsQjOqcuooxzK5CFOgntU32KfclYbTvoq3MmJSV3XRDofsvGwif7RzUSLQplPWbZ9QmACH+WRHt7ac2wwokWk8WAx4q7YJIWuTFj+pG/KogG5RhFgvYb5zbrZsPKTq8bmuQxdqa2dQ=
Received: from PR3P251CA0026.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::30)
 by DBBPR08MB10554.eurprd08.prod.outlook.com (2603:10a6:10:52d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 10:40:33 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:102:b5:cafe::a2) by PR3P251CA0026.outlook.office365.com
 (2603:10a6:102:b5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Fri,
 6 Jun 2025 10:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Fri, 6 Jun 2025 10:40:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poCmkboU0jnesBJtiIEvaFj2LWgKJ4H+5RocwiUXOYIx06SnxcZmNdGtC6lSP3bKtl+WoRKWqyux0+o3iKQ3QZV+3IyDvjuYkdXpQzstezexDPPz5bb/f4IlhS/PbC1LcGg3ri0ZT92pCFrPG7L9fQOyrf+FUN1aDAX599zsYpvhsai3IKidmLTz87URFwgg5M/4eFwUTGtvtogDqRfDJoUXAxcWwCFRkPbkuXlZeB0YoiU1Z2iluui1oqmsTQgUC2UkBdwVo29h27R4N4Rs5ti5B21FcQ5Lsd4rYTqujqA/a4fETNtDWdHz3SoCGJtujAd3XsCoUocVKqjPNCn4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=961aqrBQ0f+htkBIvOVIbfhfEgaVeWmdPKZzAqm78fk=;
 b=Z3o4Qd+W5WDNQXFE8LvwPn2m38DiLVrFNx7r7Co9ceu2Hx6mEcB1CLlwIozCMaEeflhjHPwOPyWfDGjJxAh4sK/1fn7U800mD1trn/ei77863RVWMbei6FFlqObXSs6sfrdlxpZeIQG1whvMjrtZojt237obvgAbMQY9RdARe+m88o7B7o1voX4/v/9+i/03fS8gKuF1VRxl2kjHGD2mpxreZ7rzo3vLGiPG6QOxuPVpbyhZSZMB6lLGsxPCYJtqECDqUorFTpN6R6iIAQAVMKTPqICqh+/ayGA4adF+VkTAQ9fE6U1mm1YxqkCfLGT4OuozC7pEllX0hfvBRGnz7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=961aqrBQ0f+htkBIvOVIbfhfEgaVeWmdPKZzAqm78fk=;
 b=aeVSWA2Wb1nMsH98WaVdsQw+09CMYu+gGwsQjOqcuooxzK5CFOgntU32KfclYbTvoq3MmJSV3XRDofsvGwif7RzUSLQplPWbZ9QmACH+WRHt7ac2wwokWk8WAx4q7YJIWuTFj+pG/KogG5RhFgvYb5zbrZsPKTq8bmuQxdqa2dQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB9666.eurprd08.prod.outlook.com (2603:10a6:20b:606::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 10:39:57 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 10:39:57 +0000
Message-ID: <f6b203cc-de3e-45ac-b2e3-b2d9f8ae0c31@arm.com>
Date: Fri, 6 Jun 2025 16:09:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-3-dev.jain@arm.com>
 <f528506e-b04d-4c80-93c3-93ba4ca385bd@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f528506e-b04d-4c80-93c3-93ba4ca385bd@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB9666:EE_|AMS0EPF000001AC:EE_|DBBPR08MB10554:EE_
X-MS-Office365-Filtering-Correlation-Id: 11712f1f-4818-43ea-3637-08dda4e68fb2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?V081SFhSeDZFZDgwdlVEcDBldHBHT1pQbDJGYk1CNWVlNjMydGtzMS9LbytQ?=
 =?utf-8?B?Y1dta3RyVVNnSkFROUhMcUVwSUxuWW5tZmJjZEhqWU5xUmMyc0NLMjNRWE5M?=
 =?utf-8?B?a0Z1WlFqZXEvdFJzU09TRWw2MlJ5T0ZPMXUydHNZQk1rdzBHbzBvOUsyY2lx?=
 =?utf-8?B?ZVNMdXZZcTV3R1o2YTVzWXB6VktXbmVoa3FsaEpHV1hyTDQ4cFU1b2U4RVU4?=
 =?utf-8?B?N0EvYmwzbDRBUHJDWGVJdXR3R09EbnVpNWNVNjV3eWJtUVZuRU5kUlBqdVYy?=
 =?utf-8?B?alNhTmZPSVc5UU0zSEkxS2d6QWNQTEdnZElqREFFcllyRWxZQUxUNEQ2QlB2?=
 =?utf-8?B?R1p5UkpockdrQnQwUXR5ZnVmT2xJVERCOGl1V20weFBQaStGbHhaaU92dWhZ?=
 =?utf-8?B?Vy9QbTBGeGpzTmRvUi96c0dya1puMnQ0SjJVNjJXZFliZHBqTSs3Z3hPK3N3?=
 =?utf-8?B?eEhZa0NUQzB1bVNsQXozL1VBMXRYN3R0VlhCeUxTOTFBRElReWhGck52SXU0?=
 =?utf-8?B?c2Z0d0xhVkRITXRHdE0ybEpMOE5vTGY1UDhlVkJpM2lteUFsSi83YTF0emJm?=
 =?utf-8?B?eUpTMkE0MTMvbFR5dTVQMEY2WW04cEFvK1Q5a1FVeTNOOWJjVnNUcXU2NnNM?=
 =?utf-8?B?UGVkemJtU0lWVy9PUkFLYWpUZ1ROQlpGbVJIbEdpa09NUmdJNEdaajlzZFhz?=
 =?utf-8?B?bEt6cDFKYlY4bjBKbm9HZDdZRTFSOTY4VUovYUZwMU95RWNIRE91cXByUlRF?=
 =?utf-8?B?bGpadXgvTDhPUVRPS0U4Rk8vWDJGZjRaQ0Q4YVdYSmdMSkVUVEl2YVBtZzV2?=
 =?utf-8?B?Ykh1ak1QUGRnVTloY3pudTZmMUtvY1VodjlTSmxpelV2cER5T29EYUNQamFt?=
 =?utf-8?B?cGI3dlVHdjEzcTVnVDdmSCswODhNTXVpTmhaVC9od3hzZWRQc0k2NUd4V2dW?=
 =?utf-8?B?RG5YbWlHKzNGbjZlTTFiUmhpTmNremlreGdFcmVKYWtlUEFiNXhzb0NBK1hR?=
 =?utf-8?B?YVdnWHhRbE50WDBYTm5aMnFCM3ovdmJ0bng2dnJDeDNBSDRuZm9relRoYitj?=
 =?utf-8?B?K01xcHlsck4zb1dJRHJWME8welJGNlRJdE1GWm50a1YyRFBhVDI5QUdGczgy?=
 =?utf-8?B?KzQxMTRvdWhXSWtlSTZ6Tmp6VW5aOW9jMm9xMm1hNHpWR2YxK3JGM1pxeUlH?=
 =?utf-8?B?VTNmakVGM2VpVkZMOGpjYy8wdXJaSnhmUHkzbDFEZFJ3N2p6RlVtUys3Q0t6?=
 =?utf-8?B?VVR3dnFRcmZqZ3dKNUFlWUpvQm94VUVzcm83WCsxZytLOEZVTks5ZVlQdDhx?=
 =?utf-8?B?eEs3aTJMWUVyQzhxZjB5SEIvSmdUd2IxTGFaVXdQL3U0VmN4U2tzR3dzRVRY?=
 =?utf-8?B?dWY5MlJQL2phVXdtSUxKVzhzRXNvd1E4enUyZVJhZkFKVTh1bnRkZjl0cGlr?=
 =?utf-8?B?ZnVmRkdlbGJITlFtY2FRNzdycTdYRUpBaWhYWmhZMm1ybWRuRnFDeHVvckdC?=
 =?utf-8?B?M2RFakxzTDV2MjdQWW1LS2FpeHlhdFJVa3p6VE0rRVBoOENyOFdLVWFUeEpm?=
 =?utf-8?B?TEJncVg5TEhkY0NJVnNOU3dZbnNrbFlxaEJBWWt6M0YwR3U2NkgvTTBId3ZC?=
 =?utf-8?B?NnVQaHNWZTZkeUxwT1JQSWd3ekRDLzl3dnpGb2tldHhBU0VnYlZrMGpiUlRD?=
 =?utf-8?B?WW50ZUFPY2VqMVZKT0Fld2dkNlkxWjlLU2pwVVVQb3VwS1pMRzNjZUQwQTBl?=
 =?utf-8?B?QTJHVFFPa1lDZGxDM0dRbnh0L29OVlduTGI4NStqaGI3QUpzcm1tU1VJQU9h?=
 =?utf-8?B?WVphTGxmaFFsZE1SYjRNa1d6dStjZXo4cE1LYzVRcFplSTlNaWVNVjdkNlpU?=
 =?utf-8?B?ckNrZzVnTW9qNVhiMlNTeWpCNHJkUkZIUGhWeUwvYS9OL1VMZnNST1NTUGVX?=
 =?utf-8?Q?n4Cih1p8bSY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9666
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84369619-d634-4937-bbb1-08dda4e67b33
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWRpanlscWpZRVBSaEltWDNVM08ydHdKcWI4bjQyS0pVdHluOHN6K2g3SlJF?=
 =?utf-8?B?U1NTalhWR0k1SGRlaVBBUmp6TStOYkFqMDUwbTlCTmx4K3lFSnJyNkNyUWVo?=
 =?utf-8?B?c25scVdBTExFSlZIR2o1L1lmK3hmbGJQUHh6UEhoZ2JLeUtTQzE5dVlFWkdC?=
 =?utf-8?B?M1U0WXNQT3MxcE40NEhIbW1McmJEMHNnYWJsQXk2SGpWQXRoa09xMTFZR1dk?=
 =?utf-8?B?WDB3NmtEbGdWUEVSekVoT2s5SWtsM3NxaGI5bFBKcXZRMzNPUC9yUzkvUzBq?=
 =?utf-8?B?VlUwSXpyWHZPUW96M1Q3RnRIVHZ2dXdJSEh4N2dIbXFnUDVzVXpoWXM5NWZ5?=
 =?utf-8?B?VUVWVHJ6TmtYbzRQUmFzT1V2dE5DcXNpb09ZVmczWXR6TVdJeU9MZlFNd3hH?=
 =?utf-8?B?QytrQ0FVak1wWVp6Nkg4dEoxY1VtRytsK1d2TFFxNzhidWdzUG1SOGd2N2Rx?=
 =?utf-8?B?R3NzWHpRS1hmWFJMdjhNVlhiRUpNTUVocC9iNUlMV09ZK1l5V0NzUU45VzZl?=
 =?utf-8?B?R2JNSUxxQkZRZXJQMTBXQTd0VGFlYVdCbHFHNzJMZEVFSUVnNUtnTURycEVz?=
 =?utf-8?B?aXdGTzk3RHYzWFJ5WitOWnBWSy9NdG5RTlFlbVJKak9zNjJHYzE2YWdITE5i?=
 =?utf-8?B?NzZScXRhdWFWTWdRWjNLbkU4QjB1Wk5Ja0VoM2ZtdGxWZE1JdXBBVHdpMkls?=
 =?utf-8?B?cTczV1FoKzZremZxbHJieGM3dDB0RjRBQ2RPeGxLSllGdnQrZWcvOGhvcHRL?=
 =?utf-8?B?K2NkODdZZlF6ZGlDdkl1ZTNzdkFCa3dhQlQ3bHA4WnMwTTYxdjY4bno2dUhR?=
 =?utf-8?B?b2NQQnZUZVV2NU5JM0FNbElobDBwWm1CVE9IeGFIb1JuNTJ6MXFrQnRyaVY1?=
 =?utf-8?B?WlpwbUdhY3Y1bmttN3h1ZDN0VDhRWUZVMmI2bUMzUkFLQTBSYXd2cEpLYWEz?=
 =?utf-8?B?ZDJUZTEzMVVGTmY2OTVUR2U4cTB0WlVJOXpEaGtXZ1JkcWFaZUsvWDFhVWVK?=
 =?utf-8?B?emRpTDRQNmZWb1JYZ0JQRCtYbkpZTG5XSG91d2xIdnBjVDRLd3NCRDZxVnIz?=
 =?utf-8?B?Wm5GZUNxUG9VbHh4OVpQUUxjWEpaZDNPTVhuakV0Znd0S2NzVUZsNW9IUUE4?=
 =?utf-8?B?b1A4VUVSZlluZ2RVSSt6dnk2QW4vem5sSUYvN1ZXTm5tUDZQL2VTNWlETVY3?=
 =?utf-8?B?c3FEU3J2MzFVM2hwVm5SbGdvSlUvY2lqZUw1RmpNcFlUazR2Qm5MTTR3YXhq?=
 =?utf-8?B?dnNRek50eGxhaUdHNER4T3VtbC9ZM1EzSHM5anI4eDlyeWI2Yk9ncDc2N0Iy?=
 =?utf-8?B?eVZuMUpzTXA2b1JGL0VGS042cFdYaE5ZM3VIM0RvUGZYeUtwSUltNTFoa0lW?=
 =?utf-8?B?eXN5VXRKdmNjTWE0NzdWWmRLZXRJdjNQUWtSNitHMlBEZ0ROSUFpdTNSSDZ1?=
 =?utf-8?B?ekNBdi9nbWJqVmpsL1BDTFJsbWRid1JKakl4b0U1QTVxK2hZSHFMTUN3WjlC?=
 =?utf-8?B?V3B1bHRHaUFTeGQ5dTRtdThyeEZrSU9sQjFOeUxwdkRFTlgvWWZGUjBMVmRm?=
 =?utf-8?B?bTdYenNqUVJOaytNUUxMMmxQRU14aVJNVDJua29NaWM3Tm5rMGMxZnNndnlO?=
 =?utf-8?B?WUNTa1ZLL2lqekJoaDFLTURtdml0NzVSRms2OTlGcGNXY2VpZ3NPdGlST3pl?=
 =?utf-8?B?S0xGakdySW0wNWxlYzl1ZVJCZ2R2a3NSVXpxMHRCYzJYUjBtajBYKzFjUGVU?=
 =?utf-8?B?clVOb084M1ZXK09xa1YwRXpHY2NOTGtBNTFCTy9mc0NnQjNoczlkVHVDekV4?=
 =?utf-8?B?aDJlVXRGTnpFSCtpUEpVbERxazg0QmY3WDBWMTlWNGdlejVENU9qa05QNUJZ?=
 =?utf-8?B?ajY0V251WGZ5d2JFVXJJSEdoc3FKZEhrQUpJQWNPU01GTkU5a0Q1RGZnbm51?=
 =?utf-8?B?Q3ZyNHhva1NieVg1Y3VjVjJ5YStCcFBKVkVnUTU1SzFpQzhSSUZtckQzbjVt?=
 =?utf-8?B?RTRYV0lVb05DbFVxWlYrKzJZVVBvaTdobmlkT3FPVDE0UFlTRC9DSFhSZHAx?=
 =?utf-8?Q?iNoa3C?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:40:31.5769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11712f1f-4818-43ea-3637-08dda4e68fb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10554


On 06/06/25 3:19 pm, Lorenzo Stoakes wrote:
> On Fri, May 30, 2025 at 02:34:06PM +0530, Dev Jain wrote:
>> Move away from apply_to_page_range(), which does not honour leaf mappings,
>> to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
>> if a partial range is detected.
> Hm a follow up question here - why not just improve apply_to_page_range() to
> honour leaf mappings?
>
> What does honouring leaf mappings actually mean? You mean handling huge pages?

Sorry, I always confuse between block, page and leaf mappings :) I mean to say
block mappings, yes, huge pages.

>
> Would it be all that difficult to implement?

That is how I did it initially. But I think we get into the same problem
which you are describing w.r.t extending walk_page_range_novma - currently we
return EINVAL in case we encounter a block mapping in apply_to_page_range,
basically asserting that the callers always operate on page mappings. Removing this
assertion and generalizing apply_to_page_range kind of sounds the same as
removing the locking assertion and generalizing walk_page_range_novma...

>
> It seems like you're pushing a bunch of the 'applying' logic over from there to
> a walker that isn't maybe best suited to it and having to introduce an iffy new
> form of locking...

IMHO I think it is the reverse. Commit aee16b3cee2746880e40945a9b5bff4f309cfbc4
introduces apply_to_page_range, and commit e6473092bd9116583ce9ab8cf1b6570e1aa6fc83
introduces pagewalk. The commit messages say that the former is meant to be used
on page mappings, while the latter is generic. The latter implies that the former
was actually never meant to exist...

>
> Can we go vice-versa? :)
>
> Also obviously walk_page_range_novma() doesn't exist any more :P
> walk_kernel_page_table_range() is the preferred solution.
>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/mm/pageattr.c | 69 +++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 64 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 39fd1f7ff02a..a5c829c64969 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/mem_encrypt.h>
>>   #include <linux/sched.h>
>>   #include <linux/vmalloc.h>
>> +#include <linux/pagewalk.h>
>>
>>   #include <asm/cacheflush.h>
>>   #include <asm/pgtable-prot.h>
>> @@ -20,6 +21,67 @@ struct page_change_data {
>>   	pgprot_t clear_mask;
>>   };
>>
>> +static pteval_t set_pageattr_masks(unsigned long val, struct mm_walk *walk)
>> +{
>> +	struct page_change_data *masks = walk->private;
>> +	unsigned long new_val = val;
>> +
>> +	new_val &= ~(pgprot_val(masks->clear_mask));
>> +	new_val |= (pgprot_val(masks->set_mask));
>> +
>> +	return new_val;
>> +}
>> +
>> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	pud_t val = pudp_get(pud);
>> +
>> +	if (pud_leaf(val)) {
>> +		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
>> +			return -EINVAL;
>> +		val = __pud(set_pageattr_masks(pud_val(val), walk));
>> +		set_pud(pud, val);
>> +		walk->action = ACTION_CONTINUE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	pmd_t val = pmdp_get(pmd);
>> +
>> +	if (pmd_leaf(val)) {
>> +		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
>> +			return -EINVAL;
>> +		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
>> +		set_pmd(pmd, val);
>> +		walk->action = ACTION_CONTINUE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	pte_t val = ptep_get(pte);
>> +
>> +	val = __pte(set_pageattr_masks(pte_val(val), walk));
>> +	set_pte(pte, val);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct mm_walk_ops pageattr_ops = {
>> +	.pud_entry	= pageattr_pud_entry,
>> +	.pmd_entry	= pageattr_pmd_entry,
>> +	.pte_entry	= pageattr_pte_entry,
>> +	.walk_lock	= PGWALK_NOLOCK,
>> +};
>> +
>>   bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
>>
>>   bool can_set_direct_map(void)
>> @@ -49,9 +111,6 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>>   	return 0;
>>   }
>>
>> -/*
>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>> - */
>>   static int __change_memory_common(unsigned long start, unsigned long size,
>>   				pgprot_t set_mask, pgprot_t clear_mask)
>>   {
>> @@ -61,8 +120,8 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>>   	data.set_mask = set_mask;
>>   	data.clear_mask = clear_mask;
>>
>> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
>> -					&data);
>> +	ret = walk_page_range_novma(&init_mm, start, start + size,
>> +				    &pageattr_ops, NULL, &data);
>>
>>   	/*
>>   	 * If the memory is being made valid without changing any other bits
>> --
>> 2.30.2
>>
