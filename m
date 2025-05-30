Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6919AD70
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.56
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748603553; cv=fail; b=ZFdfKQtooyvTiWYJs/OCD4Jff+QzcUKLKzKnYs7PnV1cTFMdZUcjXaJyeHpjAjA8BX5o9yYzCN8rIZf7/PpunYsl9Udza5mirYIpJgljy1XoNISGEoBJbcH9oV8QbFPUV1Ovxax5XUqeRtKhIiMQWLlwBkirBigQm6sh9uRcNmM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748603553; c=relaxed/simple;
	bh=wAjI9wcy72JNQArTUsWs25NeWyjS28gzrHzngvXzCGI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XxGQ40aqEatvSkBYTK/cDPFRh2NtkZijN33yAnte2kbg7Ips0cTIhLA4GIn2m9CGqqAJ9Lx/m0+5k7oSzpyUFt8NRyb+7khkUqmEYgPUIL7G3EB0a+vu/3PIhSmHZHrQQJiP5Qb8uQpWLkMLJTOBhxTsjothRcLQ60rR4BMfrik=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=O9T2fBgg; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=O9T2fBgg; arc=fail smtp.client-ip=40.107.130.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="O9T2fBgg";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="O9T2fBgg"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=o4DSvgwXbkSUUP4jgRSjBw4329d6eZ1frePnqg+lKYuj319xHNMc2fGhZ1ObFQbRQ5W3EfOuV9aEbmG1hhycw+9L9KOAH0VHesFFKGHGuq8kmSLP2iub7xdCXjqOB91L4lDm2dqNgELVuurtU5K01RCmLZ0tL/v7knk7GvdxYFm09ahB3U0jzoswtjXp1m8yzUT8Zlb34XzWpobdBxVFZ4fbSrsMDaiSHDVfDArmXYwExrzoV22jK18F+BCHEiRRSlJmCCI5A3C+6nBQkckUUS0ke+1vxvyekTkxbWzky3xL4zJ/SSh9+YuzBPLY51oCBOC4pPY8rwo14Dg8RPC1jA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygqSBqXwD/x1vGVx93a1m/k3TtsW1OLNmzEnQa6X1r4=;
 b=PKXhhx5YY93EoyH+SDSrbEtUugF8gYX0awY/acJEU0eZ6ig7d2CPHvCGXFosNM+cQO/0OlwereiPJ5svxkpnMIDGddVvkklPbxHl48sK/ca/+hmGngWWkcZi4rcGQaP0W9CMp9b9lkf4TgsNPzku719iHfnP+f6Yil1qUbazdGO9MoFG0yl8MAZ4ZzTbTw/LarAMU/R0+Q8RZnAepihx4Htz9tGOGjIUsFL3t0YWPeOew+KcbP2n6MbQ1JzdM3U0Bv83uWxu2EjZ8rdUmldqNA+aclA2Btg40jFechnvJwuRcLtkowTp/TaYeEH7cL71SdDzlCmQvbRj21+zY1ZVcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygqSBqXwD/x1vGVx93a1m/k3TtsW1OLNmzEnQa6X1r4=;
 b=O9T2fBggNXvBxEMcthWKk0ftiKA+VqIGjKyVzej+i3GHYkfKiZ0++kAy3ARoPdAA1uhM4F3xnI/DA1FlAAlqqI0/nzeiuSgtQHMhNDrIsX66zG2V91Tie5WiIAXnbCOe9W4JIv68lX8hap6Btca3WyX4AicGfPOtWvbMS534PBk=
Received: from DU7P189CA0017.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::31)
 by DB4PR08MB8128.eurprd08.prod.outlook.com (2603:10a6:10:381::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 11:12:26 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::97) by DU7P189CA0017.outlook.office365.com
 (2603:10a6:10:552::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Fri,
 30 May 2025 11:12:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Fri, 30 May 2025 11:12:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSLb3+cZFqEfoP35DKfFZ7sZ3uj87rxSiRfDTqu/JP3Jwx9Xmwd1Ug3ZI7PFN6134BZkNwv7rvDjmwi5iJiLM/bSKoRPEpLmPIyFPvYpgZcj5wWQG/vNc6YvA/iewQUTNch9wmXLQUj0cL9ZWcH8o8YmmsCAG6T5M5DZI4moHXbOMSRHgnqvGqIMCUXWdpPSlSwcaeq4e2iit2RqFAtWnQ3JGDp75xEAoP8aK7N4pqqAfDkLH1SGj6aN5sj7g94lTWTRh6/8aEznYP0nQUGkTlOrg4rCXGVEknKWj2xi6XRtXaKbNgk5MAOy+kc60srVBmbaQxUxhymYuEH+yj4DeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygqSBqXwD/x1vGVx93a1m/k3TtsW1OLNmzEnQa6X1r4=;
 b=MzG9vgbuP/biqNVWn/73ZVAoxdh+MXtHFyMO/o1HHzTROVxXohwiqgzY4Y1XmfvLgFlKrzYdhnauHib+a0ZtON85Er9wh22iJsp0OquPAvFxeiNoBSJM1aP3GZtYXz8FZ5SozYmUkK1CCE6vqCMKzIM70O7GgNPPELyQciy/9vuGdpJEoVA7mXjHqTn3IAPJFXBGcPZLXKrxVWxCYDTxs5mFE8PMV05QgP46DNeTOfpRyI4IWreJFWyk3ZAoeEfFQMmDEGgjNjTLT6WQXHC1EDs5/lJ4WjBM92eFlOIVVgMTA02cFxfjJQ4naEjWt2uRA2SFTPMnsRsMaAEUS4OuLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygqSBqXwD/x1vGVx93a1m/k3TtsW1OLNmzEnQa6X1r4=;
 b=O9T2fBggNXvBxEMcthWKk0ftiKA+VqIGjKyVzej+i3GHYkfKiZ0++kAy3ARoPdAA1uhM4F3xnI/DA1FlAAlqqI0/nzeiuSgtQHMhNDrIsX66zG2V91Tie5WiIAXnbCOe9W4JIv68lX8hap6Btca3WyX4AicGfPOtWvbMS534PBk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Fri, 30 May
 2025 11:11:51 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 11:11:51 +0000
Message-ID: <10a7304e-41c5-434b-b349-c457b7f6b484@arm.com>
Date: Fri, 30 May 2025 16:41:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable huge-vmalloc permission change
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@redhat.com, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <adfe981a-ec9a-4051-a26f-91b691230161@arm.com>
 <381fec11-0e05-4bf0-9cd8-f272fde7558f@arm.com>
 <090440b6-9501-4f29-8b9f-1f6e6f3a6fbc@arm.com>
 <6f8d893e-ddb9-4416-979f-eca3b0f9fb5b@arm.com>
 <23fc2527-cd32-4750-9b3b-df65f4f76609@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <23fc2527-cd32-4750-9b3b-df65f4f76609@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB6263:EE_|DU2PEPF00028D07:EE_|DB4PR08MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 396d1ea1-da9e-4994-189a-08dd9f6adaf3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SWQ3bW92clMyYStVaHdheVA5djFndmhEemxtbnZWdWxuL0Rvb1NqK2ptNTR5?=
 =?utf-8?B?QnFUdHJQaWpJT0orMFkwa0MvdWV4SXFsS2h4NjBXZmM3UXFCTjI3NkxIQW14?=
 =?utf-8?B?SXFLS0w1UE1BNlBUZkZnSWpaS1hIZEE3NDJ1N0JnZkJmbTlFdVdhbEZxZGlX?=
 =?utf-8?B?VHNDL3VzOE02bGMyMmd2Q0oyVHd3OU4rQkFoZ093V0hrVWVqSTVBdkFtekhx?=
 =?utf-8?B?ZEo4QmE4NW43Q3hROEluZjRlL1FpSHlYM0tPRjFIWTZTL0VqU3hjZTUxS2hO?=
 =?utf-8?B?a2RGVDR1eE9Od3F3bUZWdEFoSit6SmcrbldsR1NZMk1uaWUxTEg4bFora0Nu?=
 =?utf-8?B?MHhCQisyVlNOa1doQm9kUzZJU20yNjQrWEdyTW5iWVo1TW9DY2hMQ21zMDg5?=
 =?utf-8?B?OTZQSFlHTkNKMGhScEhPdytGbVRXNzJGWTU3ZUY5SG9FdUhFT25LdFN6SCtK?=
 =?utf-8?B?YmRwMWxHVkRDYVRMRWlHNC83MVdvQlZwRFFNelRDTEVLQkpzdTJqYUlIZHRF?=
 =?utf-8?B?b2MvQWlKZndvN2xiZDI4eFVRRSt4MW1ocmF4ZmNVa0k3VVJVQUJwaXkySkV4?=
 =?utf-8?B?N0pSWWlxODhnNzVuMTQyNWlFK2JYZ1hLUytNdVZ5OW83TFpuOWJreE1mUEdY?=
 =?utf-8?B?SGxTMlJoelN1dWE0dHJ1c0tUZ0NYNzI3Z2VUSzFocjhUZjdXd29reForMnpk?=
 =?utf-8?B?OEhuRTR0bmNQL2hGTVRxbk9HaEsrTGR4T1BBSzZDdWs5OXpWeWRUSFVXclRy?=
 =?utf-8?B?WFc3MFFLQkVHRGhHSmNQajJUbnh3aWpRK1JZcVpZS0Z5QkZnM1hKM3pudHU1?=
 =?utf-8?B?REd2MjE1eTZncWJidVo3T01WdXhZTi9lK2Vic2wxL3pRaXBaQ2sxRmVpRXMy?=
 =?utf-8?B?dS9ZaEJnYndYcS9YL0o3YTJVRDJDaVNXQTFSUWpqc2p2cHlWYW9sZjFjSnVN?=
 =?utf-8?B?WFlTRWVzTmsvK2IvaXNlOXBUT2JwUlQzMVBvR05DV2oxdGNHbUd1VFlEc2ts?=
 =?utf-8?B?eWJlbDVTK2szUHlibkNjVmpNMHdwWmxwbEk3OWo5MVRwVGZMOUM0dVkrVjFV?=
 =?utf-8?B?cTg4c2V4MzU2ZHhwNVpwYzM4bHk4cmpZSzJ1am9pZXlIdU9OREtDVGlFYlQ0?=
 =?utf-8?B?NER6VGQvRnFaamRpUm9RcGxXTDk3Zk9vdzFIbEVQNlQ2ODQwbDlZcThaL3Vp?=
 =?utf-8?B?WFhwZHNDOEhlVUZWcVJLd1J4NFNWSVEvQ2pFM0pGS0RDYU5KeWgyNllrQm53?=
 =?utf-8?B?aVJlZ2Y1Y2s5ZUl3WmpyNm1HeDZYZ01JUUFHUjRaTlNyMHJTeUZHay9qalBl?=
 =?utf-8?B?cW03c0prL3VnNVZlVXUwN3JwOXZPY01YWkhKbTE5VjRMeXhMUHFFWUtWZGo5?=
 =?utf-8?B?U3pSQWxpRklwLy9jZFlkRjk1dnAzWXZpNmRuNFVadU9RaVR2ZFdOZUhabFhI?=
 =?utf-8?B?QlJhMGZyWnV0RzBCTFVDMitPeWlzWjM2dkJNT1cyNFVZeTM2eWZyQWZvMUdV?=
 =?utf-8?B?UnBTQVE4ZkVla0txZFhWdWRVaitJdG8vcW1oZ3hENnI2MmxtWXpZTGVMZUdO?=
 =?utf-8?B?VSs1bUlZYzYzRk1HdURqUGhSQklFYUpVUVhJTlhZQ2ZnQjMzdTJKOVZ3bnUy?=
 =?utf-8?B?aXdhVGM3OW1xZU5ud3AwRG5xSlJkbGRzL05MdmJJc3FqRzFGNFczRUJSeW5W?=
 =?utf-8?B?MW9veGxRV3hDRjRYNW1PWTAvb2l2OC8wU3BXZ3pLRk8rZWVEZE9Ga2NaTTcw?=
 =?utf-8?B?dmE5MGhoaFlNQTR1c2lDUVZLaUt5bFAxeXFSb0MwTURuL1dJVllqUUtMeWpK?=
 =?utf-8?B?eDg0eFltcWpQeEVydmhHZHM4Rlc4MzdmY3VlT2hLNXV6MGpWRE5OcHh5R3E0?=
 =?utf-8?B?d3RrL1AxNHNPK1JuRndrcmVwaGNxRDBwd3E2OFZUVlV6eHkzR3ZSSkRCakI1?=
 =?utf-8?Q?iRm+aUzfL1s=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6263
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	626893fc-66b7-4cf2-4004-08dd9f6ac707
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|376014|7416014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUIyeFVxVHBEaTluMUtnenZuMVhqTnFJNzJEeFJkTXVaZjdpWEI3VFoyYzhz?=
 =?utf-8?B?YXdhNGFrN2ZSY01oNzF3RnEvRGY0cnl3MU9Rby9aZzVpTkRoS3MxKzRnZU5M?=
 =?utf-8?B?cVUwUTdvKzhodExzOUlTb3NETzdSdEYzNUg1SHRzbnRpbmJyRkh0aE5kZE1D?=
 =?utf-8?B?emZza3NuRTR4N2p2aTFzVytkaVhlQWVGUVdidnh6eTRDRlFBT2JOdlR4VWk1?=
 =?utf-8?B?eG1kNTYrYStqeTJGUWsxY3B0UEpRRnZ0MEROcDJPeVNFU2EySXVpNHlpWHNp?=
 =?utf-8?B?NmpWTHlPQ1o3VTVGRXFtSzhIT09TTE5aRVlWeEIzb01MSFA0UGRYN05XaWcz?=
 =?utf-8?B?S0w1TWYyNUhXbExWUUNxV0pBRjRuTFNnQlk0enIxRERYblBUVndxVnZXZHk1?=
 =?utf-8?B?NFAxdk1nd3o5d1hJUXB3TDMrZ1dQSm5VZTQxS3RraU9XOFpkL2l2SytQQmht?=
 =?utf-8?B?aGQ1dU8xckRtVjBsZVpvOVFsWDBnaTJvMEc5TEdRMDVSejFidHJndWlHSTZG?=
 =?utf-8?B?MFVpZ3JvbUU5ZTRMQWM1NGJOKzhuVnBZSks2V0d4RnZUbllGLzlnNU9Objgw?=
 =?utf-8?B?dFVtbDdETXJaQ3ZmQ29aSnliOXZKTGVSTDN6c1h4VXRzNnZzZnVzcjBob05Z?=
 =?utf-8?B?bmROYWhubmh6UnZObTZUc21QNWxvc2JMZ3hQSFBrSW9vditHYzQwR3NLZVEy?=
 =?utf-8?B?VjdXOVBjZU14bEtjeDNrYWJnTlU2V05LeG1hd2xoRjZ0WXd1aVRqOEd1RDJM?=
 =?utf-8?B?VGFyWm5USS9hTUtDaWRudFhQZGlZaFpDVjl2S2xyYks4UGowQ1ZuMmx1OEpk?=
 =?utf-8?B?M0tzK2I5UTU1SWFDYW5DcitCWVVNbGdzckRiNHpiblRZVTBuMEtuVnBEZkhu?=
 =?utf-8?B?cFJ2RytQWjBCVUY2OTFFbnNJa1luVEk3dlhsb3JzbDVVNDlqVUVVRThoL0Vx?=
 =?utf-8?B?b0VVeEx2ZG1Vd2xuNUgxUGFlOVNUbkZnV2hrZks1UnpTZnpxbjc1akNBODhM?=
 =?utf-8?B?Rnk5U2d0K2NVbjBneFdsWDF1Z213SUg0OWlDeVQvZERjUjUyaEtoTlpNeUxN?=
 =?utf-8?B?UXZMM2hyV1NEWGNtYThTbHNIdzN1U2pvSzRBQkkyOHNCa3J1MFNUMy81aG9T?=
 =?utf-8?B?UXk1WUNjVC9GeWFiYXlPSXB1czdRQ0RLaXJKYjdmTFJUYVRzemhWSHZoeXFW?=
 =?utf-8?B?cDNnMkJCQ1BLejRUajM3VDFWREtjTlZPd1MxMlRXMXlyVmR5OTFLK0lCZmVN?=
 =?utf-8?B?c1ZIYVRZdzlXRy9STkUvQzZ6NVhYTTh2OGlTdG1LaDh5ZDgxZlAxbWhGalRF?=
 =?utf-8?B?NUMyVklzQ1VQMS9tSHFZQmxEaU1sTG9sQXprcGNPWVhiNEhwMi80VnRWVFg1?=
 =?utf-8?B?di9HUmJpMmRMV3JkZE9rNFpNcForSmNCUFRzS0pNY3YxVWxSOTJsWnVCN1FD?=
 =?utf-8?B?YnpLT1lLTlFTYnJvKzIrWWd0QlRpTGlXWlphV3VNZklkKzZROFRZd05zbWNo?=
 =?utf-8?B?ZEVMK3N6SWxrSG9SZjlJMHB6V3pEZ3hvMVoyM1BMNUhCK3lxK3pFR1QzOEEv?=
 =?utf-8?B?T1FXWCsvTVhrUWdHZHpMOWdBL3Iwdy9FVkljZFpIRE1CcjRiaWgvV3BScHpW?=
 =?utf-8?B?aWtzOXZQTDdiRHVJZHlLUTlOUGo3dmlTSnhBNTJWSm1ydmFQYzFIYWdFSHdn?=
 =?utf-8?B?MThDdEZrS2lob01zN24vSHZhdDdxRzVmSXY4TDEwZGRjYTVlcFdJRWtBdlQ1?=
 =?utf-8?B?VGxybC8wRHlMSFZvUW0zNm1JUVRQZHlwNGg1ekpyWCtTS3NsYzNHc0gwcUx5?=
 =?utf-8?B?dkFSSHJzUlUwbnc4NkFWMU1XYnJpNy9Zd2I0TzZ0a3htSXRnaTlML3c3MmIz?=
 =?utf-8?B?bzVSbmU2Yjc4STczTkxMaXlqVUJWUVNkSElPTlVOQ2NzT0p4SDg4ME9xQjJo?=
 =?utf-8?B?dGVTY3hJbmdZK2R1QW5VemNHRFRGclMzQnlaQzlLUkpoN3J6eW5GZ3dxVkZp?=
 =?utf-8?B?Si9tQ3dxeG96ZWRxcW12YnlqazVZbGNZaE9yK1RTM3NDVi9QL0VXc1J6YnlS?=
 =?utf-8?B?dlFqNjhRQUtuQm11OGdxVVNrdUx1djQwMmRqUT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(376014)(7416014)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 11:12:24.4096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 396d1ea1-da9e-4994-189a-08dd9f6adaf3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8128


On 30/05/25 4:21 pm, Ryan Roberts wrote:
> On 30/05/2025 11:42, Dev Jain wrote:
>> On 30/05/25 4:07 pm, Ryan Roberts wrote:
>>> On 30/05/2025 11:10, Dev Jain wrote:
>>>> On 30/05/25 3:33 pm, Ryan Roberts wrote:
>>>>> On 30/05/2025 10:04, Dev Jain wrote:
>>>>>> This series paves the path to enable huge mappings in vmalloc space by
>>>>>> default on arm64. > For this we must ensure that we can handle any permission
>>>>>> games on vmalloc space.
>>>>> And the linear map :)
>>>>>
>>>>>> Currently, __change_memory_common() uses
>>>>>> apply_to_page_range() which does not support changing permissions for
>>>>>> leaf mappings.
>>>>> nit: A "leaf mapping" is the lowest level entry in the page tables for a given
>>>>> address - i.e. it maps an address to some actual memory rather than to another
>>>>> pgtable. It includes what the Arm ARM calls "page mappings" (PTE level) and
>>>>> "block mappings" (PMD/PUD/.. level). apply_to_page_range() does support page
>>>>> mappings, so saying it doesn't support leaf mappings is incorrect. It doesn't
>>>>> support block mappings.
>>>> Sorry, again got confused by nomenclature : )
>>>>
>>>>>> We attempt to move away from this by using walk_page_range_novma(),
>>>>>> similar to what riscv does right now; however, it is the responsibility
>>>>>> of the caller to ensure that we do not pass a range, or split the range
>>>>>> covering a partial leaf mapping.
>>>>>>
>>>>>> This series is tied with Yang Shi's attempt [1] at using huge mappings
>>>>>> in the linear mapping in case the system supports BBML2, in which case
>>>>>> we will be able to split the linear mapping if needed without break-before-
>>>>>> make.
>>>>>> Thus, Yang's series, IIUC, will be one such user of my series; suppose we
>>>>>> are changing permissions on a range of the linear map backed by PMD-hugepages,
>>>>>> then the sequence of operations should look like the following:
>>>>>>
>>>>>> split_range(start, (start + HPAGE_PMD_SIZE) & ~HPAGE_PMD_MASK);
>>>>>> split_range(end & ~HPAGE_PMD_MASK, end);
>>>>> I don't understand what the HPAGE_PMD_MASK twiddling is doing? That's not
>>>>> right.
>>>>> It's going to give you the offset within the 2M region. You just want:
>>>>>
>>>>> split_range(start)
>>>>> split_range(end)
>>>>>
>>>>> right?
>>>> Suppose start = 2M + 4K, end = 8M + 5K. Then my sequence will compute to
>>> 8M + 5K is not a valid split point. It has to be at least page aligned.
>> Sorry, so consider 8M + 4K.
>>
>>>> split_range(2M + 4K, 3M)
>>>> split_range(8M, 8M + 5K)
>>> We just want to split at start and end. What are the 3M and 8M params supposed
>>> to be? Anyway, this is off-topic for this series.
>> I think we are both saying the same thing; yes we will split only the start and
>> the end,
>> so if the address 2Mb + 4Kb is mapped as a PMD-hugepage, we need to split this
>> PMD into
>> a PTE table, which will map 2Mb till 4Mb as base pages now.
> Not quite; if you start with [2M, 4M) mapped by PMD, then want to ensure a
> boundary at 2M+4K, I think you would end up with the first 64K (16 pages) mapped
> by base page, then the then the next 1984K mapped by contpte blocks (31 contpte
> blocks).
>
> But yes, we agree :)

Yes, I wasn't considering the contpte case : )

>
>>>> __change_memory_common(2M + 4K, 8M + 5K)
>>>>
>>>> So now __change_memory_common() wouldn't have to deal with splitting the
>>>> starts and ends. Please correct me if I am wrong.
>>>>
>>>>>> __change_memory_common(start, end);
>>>>>>
>>>>>> However, this series can be used independently of Yang's; since currently
>>>>>> permission games are being played only on pte mappings (due to
>>>>>> apply_to_page_range
>>>>>> not supporting otherwise), this series provides the mechanism for enabling
>>>>>> huge mappings for various kernel mappings like linear map and vmalloc.
>>>>> In other words, you are saying that this series is a prerequisite for Yang's
>>>>> series (and both are prerequisites for huge vmalloc by default). Your series
>>>>> adds a new capability that Yang's series will rely on (the ability to change
>>>>> permissions on block mappings).
>>>> That's right.
>>>>
>>>>> Thanks,
>>>>> Ryan
>>>>>
>>>>>> [1] https://lore.kernel.org/all/20250304222018.615808-1-
>>>>>> yang@os.amperecomputing.com/
>>>>>>
>>>>>> Dev Jain (3):
>>>>>>      mm: Allow pagewalk without locks
>>>>>>      arm64: pageattr: Use walk_page_range_novma() to change memory
>>>>>>        permissions
>>>>>>      mm/pagewalk: Add pre/post_pte_table callback for lazy MMU on arm64
>>>>>>
>>>>>>     arch/arm64/mm/pageattr.c | 81 +++++++++++++++++++++++++++++++++++++---
>>>>>>     include/linux/pagewalk.h |  4 ++
>>>>>>     mm/pagewalk.c            | 18 +++++++--
>>>>>>     3 files changed, 94 insertions(+), 9 deletions(-)
>>>>>>
