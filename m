Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012008.outbound.protection.outlook.com [52.101.71.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3031BC9E2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.8
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750915695; cv=fail; b=FFOG7XuWIzRU2esMBY8yrY7bYbMYHUjLUpwcwmv/UgLs2pPsB5urvq6/0y4liqC2Hbb9ed4PlfxQNEvadafgvzwMbuQb1L40f6lsTtKBnwjy8Uv++re0e/OeNeeEBdOtTwTW/BLatgvlywHRdyvYIDXhucS+rkZY3ztgVCttO3s=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750915695; c=relaxed/simple;
	bh=hH6R1c8DaavtpQ+6U6dPIYNnS4EPpVK4o4UFk107S0E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O+HoguAZB36shPDK5YiNqcVmt8r3tN5d00y2RwAb0RqnaxERLXMlo05BXoBIyWTpQaB7RusKnSPM7/LkKFVAlnvIb1avMZAs7D6sTkE8wYgPT/yZUS+SXkuczExYJh6rqDauYzhqmcH7lopvoIxQ5s6CanEmm1P0tFTWe+++txc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nU5dlS1A; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nU5dlS1A; arc=fail smtp.client-ip=52.101.71.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nU5dlS1A";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nU5dlS1A"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZoMwLqG7T8yJ7jOfeAJ++7Px4u1SG6JHcPwp4+JySTdZ8E2KWRuHd1kYN4fuVI0Au3WCKgG9QftlNk0Amjed36yH2yvrR3Ylawg+jGdJIf8vzlLU3ljzr/7reuVxAq/7/NOL9RPOXYCml4pB93CQa1vbA+vwqOpMCe7AA40h5pi8+cFZrfEpx3hMBNhx9hWHtE9IObqjQmvZEIMkkrGzgkP6EnkBjrTF74C8RNsfUsUWD8MZyCT/6/h9bLWRB0ZDjKbgOQJAyw6/TsMvZ3X6NQKjrYIZ/vS/THLI92z/B5G9HyxLg4ICtKKGPRprN0k6aC7kXBtlGhV7kDp/XA5Hsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hH6R1c8DaavtpQ+6U6dPIYNnS4EPpVK4o4UFk107S0E=;
 b=bSGUNRzlOkM9IDdDiN5zh0zCL51isVBlCM8N3st9Ydbm2IWwXj1k2x34How5YJ5tAjbT4t8xTNYEDS6o98qSAEAxrXepwVHMH2virsCs4XLSGXgX227ucmxDXJ0WLqYijk03SKHvJp19k7LXjBCBw1PyMu1fJ8ajrmd7Ri42TjhxtJve/knCtxfObdallPOsnn0LGi9544WHsaPd1fpOhp/x2CGCHfFcrNQYh0tjHLWzoASxrYRzKdQ6eaOhrIhFbyGLZ6yVxJv4yJiQxV6WxKe7YzueiYZ4LImLqYnyIv3oNjzBauv/Yp/XLxzdLh9buID1xwR1STquDnZRkkOBeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hH6R1c8DaavtpQ+6U6dPIYNnS4EPpVK4o4UFk107S0E=;
 b=nU5dlS1AdwHlT3vij2ZVFyfDoQ+4jIHoKrNO+XjnQi5aSCaVT5Z2yeFUPmsq4tevJZ6UrMLR+PsYWisSBEM15OhgnRLPJcSYXKk64z3EQnzhymbGhwybbzDnbuCnkw+QZUN1q2wBsS2xGAPTBL1ktoXFbPpHRYWx7BOLvjbw6FE=
Received: from DUZPR01CA0130.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::25) by DU0PR08MB8905.eurprd08.prod.outlook.com
 (2603:10a6:10:47d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 05:28:09 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::6f) by DUZPR01CA0130.outlook.office365.com
 (2603:10a6:10:4bc::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Thu,
 26 Jun 2025 05:28:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 05:28:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8PS5JGywNadfuyv5kRKA+ex3XPfaTsjdfE+wT7aF+WI+FVnCnoMiajwOwT18aBWnvTMWPtXRWIsNBZZkS6+YIh19Z/jpXmeqoJ3QLZiZOYkEcY5G9EdHu97AkEBcgoxDYV4cAOccoQ+J9VBc4EKCbQHu86ytEqyjcxH27oVUIuUSUuF5+LQIE9lCe+CxDZp9b8Z8p+6VmmJVjGMpBQAmzpKiD9iEc8I3uAI4CZQlGqLYDAplRqgUnfb/clLkoqkxTRy5JJZmNM1Oj0wfv++tdjAgGhlWwFoLWv3ONzHi87EK3I9T1tHKdrlMF9m4ASyx5Gbe0bQN4a2UmNnTYvWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hH6R1c8DaavtpQ+6U6dPIYNnS4EPpVK4o4UFk107S0E=;
 b=o9k7N07GM+JCUNzvhRrlaP/RvnyfHnM70Gl7OLKoQyu2r0Zj5S5nfnFdSNEh6RImZbVCVXPyrCkyDVXqE2Bg5kJpEGydYzpq+06/w3/BvSBzzEcoMlrw5mOH1AHSEFbHMU/z+7odf5CLMsvJOG4vUamfnFNW6aBbe7acLMfOaZxBXnobLfKK8poTMOep6Kv+DrL+STplOqn4dXn4/BYSI14OjSxx4MQ6RCnPt399Nc5eyK+y4qUod0QxOEDBXTHK6t6W5nYWWYf1nsLH0SllvRtI6Zpu9EV0DiS+Dev9oVXtn5rQMvo4xYQDdyVEeCHTq5xL1a66AuJfs1G0eSs+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hH6R1c8DaavtpQ+6U6dPIYNnS4EPpVK4o4UFk107S0E=;
 b=nU5dlS1AdwHlT3vij2ZVFyfDoQ+4jIHoKrNO+XjnQi5aSCaVT5Z2yeFUPmsq4tevJZ6UrMLR+PsYWisSBEM15OhgnRLPJcSYXKk64z3EQnzhymbGhwybbzDnbuCnkw+QZUN1q2wBsS2xGAPTBL1ktoXFbPpHRYWx7BOLvjbw6FE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM7PR08MB5496.eurprd08.prod.outlook.com (2603:10a6:20b:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 05:27:35 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 05:27:34 +0000
Message-ID: <ed3fb61f-7323-483b-a56a-541c5c3ac659@arm.com>
Date: Thu, 26 Jun 2025 10:57:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] khugepaged: Reduce race probability between
 migration and khugepaged
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-4-dev.jain@arm.com>
 <e94c3460-144d-4243-98a3-fbced10feefe@lucifer.local>
 <6989406d-dfdf-4be5-b467-bb3b0d32d384@arm.com>
 <1ce8408d-32b0-469d-a560-2e0050cb91d2@lucifer.local>
 <561b17cd-ad82-45ca-aba2-78515873ebb8@arm.com>
 <f3b2ae95-cc0e-42a5-858e-a614578553a6@lucifer.local>
 <d6cc7b01-d218-4f4f-be89-e3805fa7adf2@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <d6cc7b01-d218-4f4f-be89-e3805fa7adf2@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM7PR08MB5496:EE_|DU6PEPF0000B61F:EE_|DU0PR08MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c51a01-0d5d-4a45-178c-08ddb4723c67
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TEM0YzF1VENpeUVjMUJXYXo4dkNqaTNhQVMzWUo4YkRBUmJyWllVbnYxQTFy?=
 =?utf-8?B?N0NLTWNzQkxyS0EwOFk0djN5T1VwYU5YU21acWcyak5MMnZVU3hWNnhTbUVz?=
 =?utf-8?B?UFkwRVQyTEV4VW5rOStzTFhPeDVpb2RadXVXUmpOUGJHR1NJQXRxZVN6ekw5?=
 =?utf-8?B?RHR2MGttekthQzRHQXhIbSs0aHJvUEZld041dW0vSWtNUENUWHIvdHpvbGc0?=
 =?utf-8?B?QmkrcHRqQ2ZsakdiUENwMkdnNFdkbWhGSnhMYmgxS3pqVUZFUFRoYk9vQjlq?=
 =?utf-8?B?cFZPRXdBQlc1SlYvSEJ6ays2K2ZQeDRDSG9Ha0FSbVZNelMvUTNtMG00cTY2?=
 =?utf-8?B?eXVJWUk5di9XN3dKUkVzMWdGRXlmRUwwRUx6UUgva3ViTE16TWVnZ3cyME1L?=
 =?utf-8?B?M0k0R0RidDU3V1JjMjh6a3FFWEhLV3hCaThOM3I1RHJ5LzlFbEpmVmFab0Yv?=
 =?utf-8?B?b2E2VElBNGU4L2lKWDFVZk40dWNHSHZmdUttYjR6dkVjNXFzUXE5K3l0SXF2?=
 =?utf-8?B?NGQ0QXFEVW1rU1VPa0ZuVUdjblI1OXBPUmR0N3ovU0k5Z3ltOEdMdlN0bjZj?=
 =?utf-8?B?djdIM3JtMWt6OGtlZS9YRWZpMG41Y2srUjFJQUh5OGUzaWVpYks3dm5SWjBy?=
 =?utf-8?B?bHhkQTdxLzlkRzhkVWNsaGdMZVBISzZYVVFGQU0rMkxBNFZnNW5LZG5KeXh1?=
 =?utf-8?B?THZhbHhKb0RUMTFQKytUNHNLOW9zS05leWNHK3ZpbjduZmFaUHkwVjJVRDk5?=
 =?utf-8?B?d1FubDU1UE5VTFJ2ck1La3ppUEU0c3hQZ2Y5b3BFK3ZYMEV6V1NvUFFtU0N3?=
 =?utf-8?B?MzNiS2ZGWjBBSkhYa0wvOFNkZnoycXU2MGhVUnJzV2hybnB2NndkRStpR25j?=
 =?utf-8?B?RVBZcitmZHBYa1NzWnZGazBFcXpuakxsM0xHcGsyNHNLSnFLS2czR3Z3QzB6?=
 =?utf-8?B?L3lHaVJDazVZSGRSUGhaT2theGoxY3ZVOEdFRnFUd0lYTVd1ZEgrQVZlUFJu?=
 =?utf-8?B?OVR1cDZkR2NoTXhUS1FXL3RpeHBWZTVNb3g1eERERFYvVFJEdjVYRXhZYVJn?=
 =?utf-8?B?UVRPV3JJSVlMQVBQaXY4emU4cXJiWU1DR2tEY1lrSjVpamNoWjZqd2xpL1V5?=
 =?utf-8?B?R3I1OHhQTVdwTzVOSklMWjNmVmhTV3hIWkswSG9jejRaS0hXdVNpUmo1aXJk?=
 =?utf-8?B?Sy9adFBTMzV3QWJuR1A2ZHpVWHBERStoUk5LQUhLNUsrbHBaUGhmQjZuS2NU?=
 =?utf-8?B?WHMxMG5UNndqUU9EQkJZajJocmFXeTlEU3dEbkE2QVhUd09QRGVldVFoY0FZ?=
 =?utf-8?B?TEdyK0pqL3NFWnV4eWRnSmY2eEU0ODZkZ01mbFdDVHpmT3NmWTlPcUpXNjIy?=
 =?utf-8?B?cGkxelZvOGhhL09jUUU5YTlQdWlteTFaRlVLQmJJZW1EbHp6WVdHYm13bXpI?=
 =?utf-8?B?OVdzVTdOSXR0YkhsS1lXTXlMYWR1Z2t6dDZ1R1lpckh5dldHVWtLdGoxOHJn?=
 =?utf-8?B?c2xJOXZ1cUx6Wkl0WGQ5STgwZ04rSU9RMGtBVzE3dkQvR1RaUCtKbVNYc2tx?=
 =?utf-8?B?YS9tcWVqbUR1dXM1V1ZOY0VZaEh0R04rYlZlUGZPZXF5VjIrSEprckZvWGdZ?=
 =?utf-8?B?TGZ6eXdsd1ZtbTFPRnFtVzFlRXdZQzk5UG1sbnJmS1lxYXUyQjAzbE43OHFV?=
 =?utf-8?B?Q1BEQ0hzTmhTRzBpZ3RGdlVPRDRnd3hZKyt0NTdmUTN1cDZzWWxkbklTMHFF?=
 =?utf-8?B?WFNqOENkbFJMMXRXUXJpT01RTmJaVXIwRVFLaExNRk43TWI2SENkdWtkRGcz?=
 =?utf-8?B?TmJLREsvaGwrQisvLzNGT0x3UWtVcWFqS3pyMCt1V2k2NzZud2tZTkp0Z1ZD?=
 =?utf-8?B?QTFYb1ZGNWU1aWtIV0toM3paclEvY0JGbHB4dDZEMjFpZXgzRkV6c0NBa2Fs?=
 =?utf-8?Q?4Xzp4Qi04Q4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	544150f6-4e5c-414d-b0b8-08ddb47227f6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|35042699022|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTVKMm1vcmh1SHoraWlvNk0vazk2eWVBMWk2aVNXZGp0b2F2bTFmOWhYcjVu?=
 =?utf-8?B?VzJyYjVkY3lXcnUvR2JDZytVd2cxaDJ2Yy9veExnV0FNMndnV01vZis2b1R1?=
 =?utf-8?B?WFh5akszZ2ZFSGFIUDdxWTZabjh5ZlBSZnhuZ2Q5bWp3eHdBRUhHeFVoU0hP?=
 =?utf-8?B?Sy9ndGdodWhaajRDV1cvQ1cyM1lqRjBIZlphOE9JSkxiRVFvU1dPZk0rdVR6?=
 =?utf-8?B?Tk16T1FhMUVpbnB1YzB3Z0RPZTMwcHM0SERQOGpZQTEvMUZhWHFrUHVtYVRL?=
 =?utf-8?B?aGVobkNqZ01BU0xPRG9wdm1CbDR5bjUrVmVGS0RRZE1YUVlNbUtvbWJUdWpC?=
 =?utf-8?B?d3FOd3hzM0t1QmhXcURiYjVQazhsYVNzZ2tmWWhWc3hRZ1RYamhzcHpkS2h4?=
 =?utf-8?B?aEVMaVNZNzg1dFFmWG5CclE1dXhWblIxODBQbExUdGtQRE1nSkRXZjMvQ253?=
 =?utf-8?B?UytvSnZIb0NyWGlYalEvK2J4UURKMXh2V1M4elBvdGpXcjRCOWppdHFsVFBy?=
 =?utf-8?B?WG5BeVdGM3RzRCtrN1V3RW9EcTZsTk1yazNyUEpVRU5qQUtSaDBKZ0VvQmw0?=
 =?utf-8?B?WmE5SStJV0FKRGFwUXRCTXpxOW1oOWtaWUFZdUtlem45Z1NVcjZmQkdzdmNC?=
 =?utf-8?B?NTQvSlpyb3o2SlF5cFcvMGNMRkV5T2ZvTkY2Ky91NW16UWt5Z2hLSzhoUThX?=
 =?utf-8?B?Vi9WdG8yVmczZTlFZ2tNb1QrOElWSllOSHRxU2tMaW5hVURWSjQwMkJ4MzBi?=
 =?utf-8?B?WDNGU0lWUk9qWUozMTFTd0hzVlF2T0VvODZCcnhJaEFneFFLNm9BanJwRW1D?=
 =?utf-8?B?YmhWMTc3Zy9seHl1elUySDdTMHJTdHlVWElINHA0Yy9tUEJIWVcrNDl1M2Nq?=
 =?utf-8?B?UExidFJlV2ZjU3VHL3FRQUs1KzFaeUZMUFF0TGFtM2xobEZMSEpXZVdVMHNH?=
 =?utf-8?B?MUNiZ3FOMWhBZ215Tkk0M0ljajRXQlYrb1d2UmtNVlFaTG1yUkVpZ3ZHS2hX?=
 =?utf-8?B?a1NRaWRHVXZNVVVVWDVlTWwwdnU1RzZGY3VFeVhVWTZpY01MdGdSeXQwWEcw?=
 =?utf-8?B?SUVIM1ZpVDRvUHBxVm8xeHhSVVpqdExnMUNEa1ZPU05DZEVqejkwblowc3Ny?=
 =?utf-8?B?bFlGcmU3SVJFRXFCUTVOTnR4K0hQbi95ZWFVc3VwMUx3bWRLUmhaUHdkZmgv?=
 =?utf-8?B?bEgzN2JtUjV4U0J1ZXB2N0tORUozai9SRUlHd3cwMzYyWGcxSFZacUdXRWp0?=
 =?utf-8?B?Z0MwR1hoUlA1Qm4wSm9uZEwwaEFIYkd0bUxOK2E3M3pEZXdGTHNvT2ZzT3hX?=
 =?utf-8?B?eVBZaGlpREFsZkdsdGxFTXFwdzBJZXZUTS94QVVQc01rL2htMjNOdUszclJF?=
 =?utf-8?B?Q1QxUFJqY3JTcXIvZklLSEpKRWFVd2YxZytrd3VaRC9GMlR1bWFpTnF3RWlz?=
 =?utf-8?B?RzljYk8xQXpTcUhZR1JaRmtXeHpFb1lFOXQra3hlZTlaTWxJS0hOalp5RXBt?=
 =?utf-8?B?WjlZYWoxZytCS3dHZklXT2kxYWNKbXJSclROVEd6UW1tZWMyZG1TV0x1c2Z3?=
 =?utf-8?B?dUVXb2Q3bzZUQkt5Z09zaVNVQXlLUFpEdDI4UWdpMmM1aEo2elRBK01NZGY3?=
 =?utf-8?B?Vm02RjdxMm5QWkdNaFU2Zm8rZGljQ2FEZkJONkV1T2d5QTZDdWRQaUpWT3pO?=
 =?utf-8?B?OXJpbFh3aDdNN1ZlRDluTHE2Y29LYXdMWDgwMDIrOElGZWMxMDRudVc3ZXJo?=
 =?utf-8?B?TytGYjZEU3NucENXR3hvbUwrUHZ3UlhMalRxcU85UVhLbGRzOG16bEdoRm4y?=
 =?utf-8?B?NnhDeTZrSkVQd1J0VC9SOGQ2cS9wMHR4YVo2NVM3cU9ncGs4UFFOYnlYTGlV?=
 =?utf-8?B?M01hQitpYXFoYXNEWjR6VjREamtaNHVLbVpFUTRYRExtN2U0a2phaEp0MFYw?=
 =?utf-8?B?NzBWZ1BpMHYwV2VJa01Ma25SMit4Z1NRSGxOVlEvc0sraWV6M1gxK0pJVXdX?=
 =?utf-8?B?V3lMcXN0dlNmMWduR3d0WHJMbk4vUVJFcVIxVXBQczdDUUFka3kwZDVFZHZH?=
 =?utf-8?Q?IuDzQM?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(35042699022)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 05:28:08.8138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c51a01-0d5d-4a45-178c-08ddb4723c67
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8905


On 26/06/25 10:36 am, Lorenzo Stoakes wrote:
> On Thu, Jun 26, 2025 at 06:02:25AM +0100, Lorenzo Stoakes wrote:
>> On Thu, Jun 26, 2025 at 10:29:22AM +0530, Dev Jain wrote:
>>> On 26/06/25 10:27 am, Lorenzo Stoakes wrote:
>>>> On Thu, Jun 26, 2025 at 09:22:28AM +0530, Dev Jain wrote:
>>>>> On 25/06/25 6:58 pm, Lorenzo Stoakes wrote:
>>>>>> On Wed, Jun 25, 2025 at 11:28:06AM +0530, Dev Jain wrote:
>>>>>>> Suppose a folio is under migration, and khugepaged is also trying to
>>>>>>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>>>>>>> page cache via filemap_lock_folio(), thus taking a reference on the folio
>>>>>>> and sleeping on the folio lock, since the lock is held by the migration
>>>>>>> path. Migration will then fail in
>>>>>>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>>>>>>> such a race happening (leading to migration failure) by bailing out
>>>>>>> if we detect a PMD is marked with a migration entry.
>>>>>>>
>>>>>>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>>>>>> Hm is this related to the series at all? Seems somewhat unrelated?
>>>>> Not related.
>>>>>
>>>>>> Is there a Fixes, Closes, etc.? Do we need something in stable?
>>>>> We don't need anything. This is an "expected race" in the sense that
>>>>> both migration and khugepaged collapse are best effort algorithms.
>>>>> I am just seeing a test failure on my system because my system hits
>>>>> the race more often. So this patch reduces the window for the race.
>>>> Does it rely on previous patches? If not probably best to send this one
>>>> separately :)
>>> To prevent rebasing headaches for others (if any) I thought to send all together.
>>> I'll send it separately if still that is the preference.
>>>
>>>
>> Oh actually would it be a pain to rebase given the previous 2 patches? Maybe
>> leave it then. And I can actually finally review it... :)
> At the same time you'd have to update cover letter to mention and it's really
> not good practice to include unrelated patches to a series.
>
> So probably best overall to send separately but _wait_ for this series to be
> merged first :>) then you can based it on mm-new without problems.

Sure.

