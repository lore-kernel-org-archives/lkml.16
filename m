Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B166F211A31
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.38
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750914007; cv=fail; b=nvfX7qx8vK8H01+nIm4fpOwS/GF6eeBO7JTDb6TYKshPqM6fDd8CXQ+Xds4+/i8NUylSn/0szLTeOUVpQx0DoWb+tl5C/8dFsjOeuq1uZLpI7VMPbscd5yr5D5ykLeK+DkrvQcpyoB583vEBTFDPYDabr9MQNyEU+v+xOXTQ13A=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750914007; c=relaxed/simple;
	bh=qEL/h2O5cUab3b9AefYRZoYIvkYtf217Q92wq9ZviKI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FaBpUTHinW3iE0R0BPZSA+YkHPZxRU4eO5DDUgIZO+td5wpIYKqqk8LzlQVkZqT0Vvf4pCFOwabOb1HN/+KUytGSL6eFg6+TnPjWqCfK8BpkcriknP4aydpu6o2JJXPaaT0TbzgFHVkCr0Tm7MXQBjkjj+d4hdeWLMp4ME74Kos=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ONxpSQV6; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ONxpSQV6; arc=fail smtp.client-ip=40.107.130.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ONxpSQV6";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ONxpSQV6"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w36vuB++vxX+Lxsp8uaNOgI1xiq78PGo82wqDl6RwtPfcXHNJQlJ7KvitL0PuBubo1tY2aQBqj5zjlITM1+QpxXnMCE9keQZj9YEmN8mqYakpbkuGER5LfrzbGcN/1EcBteSzEpmQiPQ3AiO8dlXQVYnqoEF+twi/Va2695O+UyH6mwZBDb5nRINcABZ/uhd/rfunqNEOm5T9W8WcwCK3lHYU5PDJM3Cvmgu/kgRuzpS/85vcNvbgSLsuA4pq2Vtoe7lole1sl0ISlcC4eSolBsvL3w3kPCwJ1uj036IevIzyzAy+O7AZej1C4u2Y+325LLMYE8rUvpnZIJvOUZLBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEL/h2O5cUab3b9AefYRZoYIvkYtf217Q92wq9ZviKI=;
 b=isn/0wb7ZAzcLNcf/7PI64lMBjL1u4vxK0QvG+engM0BWzMxwBqnEV4Og8j3jJx2Qow9RwdM2kJbQW8YOScqcV/c9oEoo+Np75JgbIfpYGpqRitUbK2Zdf1xrCiQ86k2N93hBxjA5zLLufYOsboOvXJcTTzwgrMSlwB9V2ATB0o/AnEbKHRkrFZYTa3t1L4Rzitf+ucYGmYuTsTPDF6BzXPFkmW4WfVdGyIMwCHqxnuccakdFz7D0F4201V+eBMRp/R0MbULVchO5XvDKFhGfUi4Diy+ese94qgltPI9f6t7fGbY9OI+Z98ZQhwu6FaV3wrweB1LDdRwCVcagTeVeg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEL/h2O5cUab3b9AefYRZoYIvkYtf217Q92wq9ZviKI=;
 b=ONxpSQV6TU7tnhUtMcdFhdjUWDC7bUcPzBklKb/PqoutfM4gqqqIJS4tJq8GiVzFKfKNqcuTQ7melNMCLEZ/BlxtQrfEONE1/PJlc4c0c159clr+MZCWhgpJ0whQPmZHUCa+uNwrfoqu4MTQ574dNi9e8ewPbyNP+AovRc9w7Ms=
Received: from AS4P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::15)
 by PAVPR08MB9553.eurprd08.prod.outlook.com (2603:10a6:102:314::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 05:00:00 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::25) by AS4P192CA0001.outlook.office365.com
 (2603:10a6:20b:5da::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Thu,
 26 Jun 2025 05:00:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 05:00:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtpPfoyb7x4U7M6VZsfcG5OCY5P/7O8ZEcooFOckcgtQ5Tr1N9ej3DR3+5gqRiLKhZhRylfuh2lij+BhI+EN1O28EEa7/kqJVZu3TfV/7xMJ/q/3MeUFdVVpDMQeEU/VhmolFyxQL/AojJrwEqoYGOhgozU/rSq+629QyEpkQcfNbIP0BG462JJf6NYWaVc9qSmKLdrOD8wyAcV9YcbuFskrlQSzQ2TaKJP56Rv0KNPmwvkU5omKkkUb/+EWt5g0qWElD8anMe8K0vUF0MHU5dOUgK0dXfilSsM4qeY+T7xzLLugvUvhjRpj7RNDMkHQfTkuS3UL61Cq2poNSLO1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEL/h2O5cUab3b9AefYRZoYIvkYtf217Q92wq9ZviKI=;
 b=DOBgtYp3Ioj2pZoJTXfWDCDE0LpJ8Jce5Df0TYqgyac6M/9rvEVGQLetwmvJOx22m1nLU4hiJ5sC7VFMti7o42UshGglFjAYglK0fhStwsds7jqE+9a8kwCYlWb61zKHz2dSlnk/rGaGySnOqXgCHI4HKyzdqnY++Gly+DkLpux72S34V694kS8dF5/BN5M6YGn/SW0YV5bSMxY1JIO3HqPsIk9zstBJkITHIYz53izg9KwVBPm5Zw+dBC9UoTt4CuP3dt+zedvIF4RDAEqUOVd4097KeAiJ5SwVl2wkFmaoEOnx8FEfmmibpgQu/I4J1NdlsdWYnfEaryf5HkGxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEL/h2O5cUab3b9AefYRZoYIvkYtf217Q92wq9ZviKI=;
 b=ONxpSQV6TU7tnhUtMcdFhdjUWDC7bUcPzBklKb/PqoutfM4gqqqIJS4tJq8GiVzFKfKNqcuTQ7melNMCLEZ/BlxtQrfEONE1/PJlc4c0c159clr+MZCWhgpJ0whQPmZHUCa+uNwrfoqu4MTQ574dNi9e8ewPbyNP+AovRc9w7Ms=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV1PR08MB7313.eurprd08.prod.outlook.com (2603:10a6:150:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 04:59:28 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 04:59:28 +0000
Message-ID: <561b17cd-ad82-45ca-aba2-78515873ebb8@arm.com>
Date: Thu, 26 Jun 2025 10:29:22 +0530
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
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <1ce8408d-32b0-469d-a560-2e0050cb91d2@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV1PR08MB7313:EE_|AMS0EPF000001A3:EE_|PAVPR08MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: af68ed44-dbd6-44f2-c292-08ddb46e4dfd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?V0ZRb3kyNTlRUmpRSXpXenpRa2VIc0VEUXpXdGJSYWM2bm83bkVqdldBVUpa?=
 =?utf-8?B?MGNaQXZXbXlpK0hzTmEzTHJtMDB3QUdKUVhUS3AxVTBjWjJYWllCTGkxblBT?=
 =?utf-8?B?Q2pDRVprTlRndUNJVzVVdGU1MmgwSXNDd1F4VlROMUhHVnkxdFM4M20zWFd5?=
 =?utf-8?B?elVXZURkYjJjSzdNWDN0Y1pEYWN6R3h6RXozSE5kMk5WSXVyV2hBTlRYcS9E?=
 =?utf-8?B?Ri9EbWxodDNBUGozTThrbkp5Y0diQ0RyVmwwSk50R2Z4SXc0SkpCUC9DRllP?=
 =?utf-8?B?U09PQ2hxN0F0dVVOTllMME9pL0lhaENPMFBPNFlISExreGdHUmdUQVFwQlNQ?=
 =?utf-8?B?azYwWkhFdjI0SUQ0bFlRNk9ScUhPSUNCSDhpTERDSFdkaXkxKzdpOWlPUzVO?=
 =?utf-8?B?VElpbVNGalRTVGxXR2NZdXRreXRFQ2tDUld1T3VCWmtHaTM5a1Y5M2Vka2Uw?=
 =?utf-8?B?U1czYTltNjZNQ0ZXbkdnZ3pDdDhwYUQvS1QvZHVickpkclZKeUtlQXQ5Tnov?=
 =?utf-8?B?N1Jqam5QOTY4WTFYNlVHb0dTeFlEcWcxWmhOUVl4RVpOOXR3S28wY1lVaFRp?=
 =?utf-8?B?RnRLNTV1QUVtU21vRkFXQURNSFAydmMySTZvVmlFL3pkNWxsM1d5OVpURGZD?=
 =?utf-8?B?Qlc0N1l0SE8wMTdQdHZ3R2U4VmZ6SG1TV3AzRTRSaWljRGREanh4Y21MREo2?=
 =?utf-8?B?dGRUdjY3dmJzSk5RQlNhM2huNys4S01ERGJhQVY1UzJNUDdpWE1HanJvNklV?=
 =?utf-8?B?Y3NJLzVQSFd1MWVVQ08rR0lLYlhENjc1dUROYlltTnJNYi9ObEprWkY5cmlv?=
 =?utf-8?B?elVZeGFhVklpejl5VlFpc1YxZXVYcXQ3KzFGdjZ0dDdKUkh6anZ1UzZCU3Fv?=
 =?utf-8?B?T2dWQnhWRm9kUnl4UzhkSjZOS0dvalFCZFdFN0FOYjRCM2ZmZittY2dzWW5N?=
 =?utf-8?B?NWNsNW9mQ0M1K1JQaE1mZFdyMVQxYklNVWYrSXBQbkp6V1RUNTJtYmFzaS9D?=
 =?utf-8?B?L1dtQ08zR2RIV2hFRjFkUFNHVHhoNDNyMDVOcnZqd2FCMFFhdWJNbngzTSta?=
 =?utf-8?B?YU1tbEZON200eEhvbmtlR3NwTlAyU1ZHbTArWVJ6TFB2eDVNeTZMbTRHVlJ0?=
 =?utf-8?B?by9IbHROb00zY3c2SlUvQS9kVnNjbllHYk4zZ3Y4OGt3bGloakc5SFBJS3lP?=
 =?utf-8?B?NlhENytIdHFCd0NWSzBZamFuL3FwU3g2TERDcFExcXB5alZCUTdnelNlbUlo?=
 =?utf-8?B?NFZ3Sm4vS3BrUTk3emlSa3J2eVM1SmhydnNZN29ObXJHQzhOeHJaeFRQQ3oz?=
 =?utf-8?B?R1pxTG9lVllrek01bVJPUTA2ZkF4Q3k1ZmEyZHFOdUlJM1B5bUtFODlsMjFN?=
 =?utf-8?B?YU9NajVuVkNaWjZ4YmZhSHY4YXRMZE9XVUlpZVRabjFuLzF2V0JwV0NoRFJS?=
 =?utf-8?B?NHVPMUMwdEg3WW5CZTJPcXRwdTAvYVlDbGRrZHJKeFlRcHUxZ0J5YnhUUFdq?=
 =?utf-8?B?RitIa05MLzlLNVVxZ1RjaXFUMDFaVy8wTG5scUVBVWFnVmRTWndCcUlIQTJQ?=
 =?utf-8?B?WkZoMnVCaWhJeGR6VlVqbm1JWUJDdU83ZGtkYjZsWmJ2YkUzRk9RQXI1K0Fn?=
 =?utf-8?B?S1AyNk4vakt2Mk5SNEtaUGFjV0dxbWt1ZkIvdzFjZHRRdHUyMjlienNKaVZ3?=
 =?utf-8?B?WENHQWZCbFVNVmNUOERHa3lrcHlnM2tlLzZnSmhIYnNsZjhIVDI1Smd4c3di?=
 =?utf-8?B?R2V3QjhNekxCMzh6cG1tSmVNT2RhMlk3K2R6dzllTm85eitqdzhLelcvWjZH?=
 =?utf-8?B?bWRyN2gwR2MxMDdieXRiZkNYaXZPTW5TdEJxWGVxWHRnWkFMRnNYMWtUZHVt?=
 =?utf-8?B?M1pqckxDUkxzaW0xb0pJUDFvc3VHYU9SMU5PQVNRcEdpaXRFbzZUOG01cEtv?=
 =?utf-8?Q?uCp9WYc2aUU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7313
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	62912344-b60e-4598-2cfc-08ddb46e3ab5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|7416014|14060799003|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QStSdGVZYWtqRGxUWXBJMXVaTCtUcVhndjR6aUNxL2E1NE1RZVAzVXdubjhN?=
 =?utf-8?B?cXF1YURkNE9nSFZ2OC9GQVZoZWtSN2Zjd2pWU0M2NzFkWDd4V1hUMnBKdGQ3?=
 =?utf-8?B?b1RpUXNHMjY3MFcwZ2Q2aWtNMC9BbFVNQXdaNUhWaWZCQmh4TjIxRzBDcGlU?=
 =?utf-8?B?N1FzKzhKVFhEOE96Z1JFUDRnWVFLb1ZyZUozMDRwUTBEM2trYkZyNXduNFg2?=
 =?utf-8?B?WEt0ejd5dlJlMDNhUXNXOTJWNE1Ra2tLMTBkaHpQVmcxZ3Z3ZEQyb3VuSVBj?=
 =?utf-8?B?OCtGZ2FQLzhiOWp5Yy8yNkNKbmxoKzdDeXh3dTJlMUxNTkxLRXgweW1pTDhB?=
 =?utf-8?B?cFlLSTY4UlhhSFVWZS9WRUV5NVdabU1QbklmbWxsNW5QeVNBWnQ4VlZ6NUdo?=
 =?utf-8?B?MFJHZUZkNk1UNnFWaDVqS1ZkNjN0Tm9mR0lxdU9NZUIveS91WkRweXpmRm1K?=
 =?utf-8?B?MWIzQU52bFI5OUoxVmFKUmJBY1QvZC9XMEJiTUxKc2djdVFDM0wwSUdPSi94?=
 =?utf-8?B?eUxVNis3TFI1djFQSy9KWC9hOTRuR2s3cS9wTUQvTnRVclVjMFFsczBWSUFo?=
 =?utf-8?B?ejFVM3pNaEJ2WE85SFVuYmY2OFIyc1dtMjE4ZWlXb3NVZ0lsUm5Dcnp6ckV1?=
 =?utf-8?B?UE5DSXlyZU5zWlR4OHN6TGd3UHlwVTZxc1RmS3NCNFQwQU54QnM1K0JVY2tw?=
 =?utf-8?B?MFV0ckdsRWliYS9iUWtsMVNUbzNLOVF0d0M4NVZYQ0k4QnVMWVJRNWtPVWJG?=
 =?utf-8?B?akliNlZrS3lrMlBkR2xPS2JQdWRxSU1MbjJvWjNzZlZGRnFBME1yc0QrR1o5?=
 =?utf-8?B?aXBvbmV2UGUvZ3hISWRvZ1FwZDlZYWtqMy8xSkZiNDN2bVVoOHpqZi9TUkxW?=
 =?utf-8?B?czZrMjZtcCtMNm5CaGtON29WcC9RZzhmOTFWOU5VYjZJQ1dZMXg2MGlYYW9l?=
 =?utf-8?B?Vnd3b2JyZUxCSmc0czk1NlF4azZJM0FkWHIxb29jTCtZeUorSk1RQmJYZ2pL?=
 =?utf-8?B?UUNCVDR1QkVyQk9QenQ4c2w2M2VHQ3VWZ1Z1ZVdzeTVtUXhIVm5YRlhQTkNm?=
 =?utf-8?B?a3NOSmV2VGQ0Z0MyUFlaM3FXd2lNamlqcVV2Wnh3QWR1cWxkbThaaDZYK2J2?=
 =?utf-8?B?dG5uaVFMV0tEcWZQU2Jodm15VDVHKzFnRy85NGlLYWFUU0tGUkQ3ZjN2RHZi?=
 =?utf-8?B?R3JLS0ZWcG5ReUFmT2dwd1Z4NGVySzdneU9aaVN5NHExR3hqeVQxNDJMNElY?=
 =?utf-8?B?amU4dXlweEJjc2pyY1NmUUM2dmQxQkt0S21YUmVuVlp3OVpOa1VYazNZTG4w?=
 =?utf-8?B?aVhNbit2MlhCKzJ3U0xVMldNd3VHT1BHdUxEb2VNcmdSUWw2MjNyNXM1bWtv?=
 =?utf-8?B?TGxKTlpkS09hMjRkbThKTkRONHVQc1JZWGJWRW9VOEZvZWtHMjR6VlVHT1Nu?=
 =?utf-8?B?ejBhVmw0OHBaU2dKZi9aUmpaN2drRmx5MHlsa0ZMUDlCYUU5NGlHSXBCWXp5?=
 =?utf-8?B?b1V0MitmTlFmZVg1emwwZW1GcTZqMU5MaEpxZExnQUdLQzI1ZFo3b0ZWT0JT?=
 =?utf-8?B?dFVhVWNrVDY4UnhOYmpOenQxZ2JuTHQrSlllbzBoQWgzbGRVRkFNT0FWSDRO?=
 =?utf-8?B?YlltSGgvYXFJUzVzekJUWDR1clZjK1BrK0VUQWRqdHlOdkwwSGt3UC9GYlFv?=
 =?utf-8?B?c3JIQUtmYjJvdStMazFDbkpZVVIyZWZhN0RQaUVuWm5uRDIycCtPaVphanh3?=
 =?utf-8?B?cElTL3B3RTg0eDVzMSs4RGlsdGZKMm91UC9RdGYraUxaWjJiRFh5aUg4M1JP?=
 =?utf-8?B?alJsNVZHRDRVVVRZbzhtRE1Ea1pSWm9JWkNPNWlxdEpTUCtlK3JYQk5Jci8w?=
 =?utf-8?B?QmRKZDRodWhIY01RYUxxaFJsOUZ5OFlQZi83ZVk1WEFGenlEKytYSjhKK0Vq?=
 =?utf-8?B?MWVDaStBMXcrOHZlb2tvVC9lMktqYmFOT1F2U3RHYi9ZdXIzMWM4YmNlS3ZZ?=
 =?utf-8?B?SFlNRFFZNlZ6N3FCNG9pSmZEWjczVU9zOGx6Y1VabTJxMGNzWVE1bFNYajdY?=
 =?utf-8?Q?OY1wzI?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(7416014)(14060799003)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 05:00:00.3510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af68ed44-dbd6-44f2-c292-08ddb46e4dfd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9553


On 26/06/25 10:27 am, Lorenzo Stoakes wrote:
> On Thu, Jun 26, 2025 at 09:22:28AM +0530, Dev Jain wrote:
>> On 25/06/25 6:58 pm, Lorenzo Stoakes wrote:
>>> On Wed, Jun 25, 2025 at 11:28:06AM +0530, Dev Jain wrote:
>>>> Suppose a folio is under migration, and khugepaged is also trying to
>>>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>>>> page cache via filemap_lock_folio(), thus taking a reference on the folio
>>>> and sleeping on the folio lock, since the lock is held by the migration
>>>> path. Migration will then fail in
>>>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>>>> such a race happening (leading to migration failure) by bailing out
>>>> if we detect a PMD is marked with a migration entry.
>>>>
>>>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>>> Hm is this related to the series at all? Seems somewhat unrelated?
>> Not related.
>>
>>> Is there a Fixes, Closes, etc.? Do we need something in stable?
>> We don't need anything. This is an "expected race" in the sense that
>> both migration and khugepaged collapse are best effort algorithms.
>> I am just seeing a test failure on my system because my system hits
>> the race more often. So this patch reduces the window for the race.
> Does it rely on previous patches? If not probably best to send this one
> separately :)

To prevent rebasing headaches for others (if any) I thought to send all together.
I'll send it separately if still that is the preference.

